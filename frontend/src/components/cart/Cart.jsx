import { useSelector, useDispatch } from "react-redux";
import { Link, Navigate, useNavigate } from "react-router-dom";
import { checkoutCart, deleteItem, fetchCart, updateCart } from '../../store/cart';
import { createSelector } from 'reselect';
import './Cart.css';
import trash from './trash.svg'
import { getSizes } from "../product_display/sizes";
import { useEffect, useState } from "react";
import logo from '../nav_bar/logo.svg'
import { createOrder } from "../../store/orderItems";


const Cart = () => {
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const sessionUser = useSelector(state => state.session.user);
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState(null);

    useEffect(() => {
        setIsLoading(true);
        dispatch(fetchCart())
            .then(() => setIsLoading(false))
            .catch(err => {
                setError(err);
                setIsLoading(false);
            });
    }, [dispatch])

    const cartSelector = state => state.cart;
    const selectCartArray = createSelector(cartSelector, (cart) => Object.values(cart).filter(item => item.checkedOut === false));
    const cart = useSelector(selectCartArray);

    if (!sessionUser) return <Navigate to="/session" replace={true} />;

    if (error) {
        return <div>Error: {error.status} We can&apos;t retreive your cart. Sorry for the inconvenience.</div>;
    }

    if (isLoading) {
        return (
            <div className="loading-container">
                <img src={logo} alt="loading-swoosh" className="loading-svg" />
            </div>
        )
    }
    
    const handleSizeChange = (itemId, newSize) => {
        dispatch(updateCart(itemId, { size: newSize }));
    };

    const handleQuantityChange = (itemId, newQuantity) => {
        dispatch(updateCart(itemId, { quantity: newQuantity }));
    };

    const handleDelete = (itemId) => {
        dispatch(deleteItem(itemId));
    };

    const handleCheckout = () => {
        const orderItemsAttributes = Object.values(cart).map(item => ({
            product_id: item.productId,
            size: item.size,
            quantity: item.quantity,
            price: item.salePrice ? item.salePrice : item.listPrice
        }));

        const subtotal = orderItemsAttributes.reduce((acc, item) => acc + item.price * item.quantity, 0)
        const shipping = subtotal >= 50 ? 0 : 7
        const total = subtotal + shipping

        const order = {
            user_id: sessionUser.id,
            subtotal: subtotal.toFixed(2),
            shipping: shipping.toFixed(2),
            total: total.toFixed(2),
            order_items_attributes: orderItemsAttributes
        }
        dispatch(createOrder(order))
        dispatch(checkoutCart())
        .then(() => {
            navigate('/checkout-success');
        })
    };

    const calculateSubtotal = (cart) => {
        return cart.reduce((acc, item) => acc + (item.salePrice ? item.salePrice : item.listPrice) * item.quantity, 0).toFixed(2);
    };

    const calculateShippingCost = (subtotal) => {
        if (subtotal >= 50 || cart.length === 0) {
            return 'Free';
        } else {
            return '$7.00';
        }
    };

    const calculateTotal = (cart) => {
        const subtotal = parseFloat(calculateSubtotal(cart));
        const shippingCost = calculateShippingCost(subtotal);
        let total = subtotal;

        if (shippingCost !== 'Free') {
            total += 7;
        }

        return USDollar.format(total);
    };


    const USDollar = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 2
    }
    );

    const shippingDate = () => {
        let currentDate = new Date();
        let days = 5
        while (days > 0) {
            currentDate.setDate(currentDate.getDate() + 1);
            const dayOfWeek = currentDate.getDay();
            if (dayOfWeek !== 0 && dayOfWeek !== 6) {
                days--;
            }
        }
        return currentDate;
    }

    const formattedShippingDate = shippingDate().toLocaleDateString('en-US', { weekday: 'short', month: 'short', day: 'numeric' });

    return (
        <div className="cart-container">
            <div className="cart-items">
                <h1 className="cart-header">Bag</h1>
                <ul>
                    {cart.length ? cart.map((item) => (
                        <li key={item.id} className="cart-item-with-shipping">
                            <div className="cart-item">
                                <div className="cart-item-details">
                                    <Link to={`/products/${item.productId}`} className="cart-item-link">
                                        <img src={Array.isArray(item.photosUrl) ? item.photosUrl[0] : null} alt={item.name} className="cart-item-image" />
                                    </Link>
                                    <div className="cart-item-information">
                                        <Link to={`/products/${item.productId}`} className="cart-item-link">
                                            <h3 className="cart-item-title">{item.name}</h3>
                                        </Link>
                                        <h3 className="cart-item-subtitle">{item.subtitle}</h3>
                                        <div className="cart-item-options">
                                            <span className="cart-item-size">
                                                Size
                                                <select onChange={(e) => handleSizeChange(item.id, e.target.value)} value={item.size} className="cart-item-select">
                                                    {getSizes(item.category, item.division).map((size, index) => (
                                                        <option key={index} value={size}>{size}</option>
                                                    ))}
                                                </select>
                                            </span>
                                            <span className="cart-item-quantity">
                                                Quantity
                                                <select onChange={(e) => handleQuantityChange(item.id, e.target.value)} value={item.quantity} className="cart-item-select">
                                                    {Array.from({ length: 10 }, (_, i) => i + 1).map((number, index) =>
                                                        <option key={index} value={number}>{number}</option>
                                                    )}
                                                </select>
                                            </span>
                                        </div>
                                        <div className="cart-item-information-spacer"></div>
                                        <button onClick={() => handleDelete(item.id)} className="cart-item-delete">
                                            <img src={trash} alt="" />
                                        </button>
                                    </div>
                                </div> 
                                <div className="cart-item-price">
                                    {item.salePrice ? (
                                        <h3 className="cart-item-subtotal">
                                            <span className="list-price--sale">
                                                {USDollar.format(item.listPrice * item.quantity)}
                                            </span>
                                            {USDollar.format(item.salePrice * item.quantity)}
                                        </h3>
                                    ) : (
                                        <h3 className="cart-item-subtotal">{USDollar.format(item.listPrice * item.quantity)}</h3>
                                    )}
                                </div>
                            </div>
                            <h3 className="shipping-text">Shipping</h3>
                            <h3 className="shipping-date">Arrives by {formattedShippingDate}</h3> 
                        </li>
                    )) : <p className="empty-cart">There are no items in your bag.</p>}
                </ul>
            </div>
            <div className="cart-summary">
                <h1 className="cart-summary-title">Summary</h1>
                <div className="cart-summary-costs">
                    <div className="cart-summary-subtotal">
                        <span>Subtotal</span> <span>{USDollar.format(calculateSubtotal(cart))}</span>
                    </div>
                    <div className="cart-summary-shipping">
                        <span>Estimated Shipping & Handling</span> <span>{calculateShippingCost(parseFloat(calculateSubtotal(cart)))}</span>
                    </div>
                    <div className="cart-summary-tax">
                        <span>Estimated Tax</span> <span>—</span>
                    </div>
                </div>
                <div className="cart-summary-total">
                    <span>Total</span ><span className="cart-summary-price" >{calculateTotal(cart)}</span>
                </div>
                <div className="cart-checkout-container">
                    <button className="cart-checkout-btn" onClick={handleCheckout}>Checkout</button>
                </div>
            </div>
        </div>
    )
}

export default Cart;
