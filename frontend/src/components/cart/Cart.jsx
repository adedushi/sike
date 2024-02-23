import { useSelector, useDispatch } from "react-redux";
import { Link, Navigate } from "react-router-dom";
import { deleteItem, updateCart } from '../../store/cart';
import './Cart.css';
import { cw2288_111_1 } from "../product_display/product_images";
import trash from './trash.svg'
import { getSizes } from "../product_display/sizes";

const Cart = () => {
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user);
    const cart = useSelector((state) => Object.values(state.cart));

    if (!sessionUser) return <Navigate to="/session" replace={true} />;

    const handleSizeChange = (itemId, newSize) => {
        dispatch(updateCart(itemId, { size: newSize }));
    };

    const handleQuantityChange = (itemId, newQuantity) => {
        dispatch(updateCart(itemId, { quantity: newQuantity }));
    };

    const handleDelete = (itemId) => {
        dispatch(deleteItem(itemId));
    };

    const calculateSubtotal = (cart) => {
        let subtotal = 0;
        

        cart.forEach(item => {
            subtotal += parseFloat(item.salePrice ? item.salePrice : item.listPrice ) * parseInt(item.quantity);
        });
        return subtotal.toFixed(2);
    };

    const USDollar = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 2
    }
    );

    return (
        <div className="cart-container">
            <div className="cart-items">
                <h1 className="cart-header">Bag</h1>
                <ul>
                    {cart.length ? cart.map((item) => (
                        <li key={item.id} className="cart-item">
                            <div className="cart-item-details">
                                <Link to={`/products/${item.productId}`} className="cart-item-link">
                                    <img src={Array.isArray(item.photosUrl) ? item.photosUrl[0] : { cw2288_111_1 }} alt={item.name} className="cart-item-image" />
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
                                                    { getSizes(item.category, item.division).map((size, index) => (
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
                        </li>
                    )) : <p className="empty-cart">&nbsp; There are no items in your bag.</p>}
                </ul>
            </div>
            <div className="cart-summary">
                <h3 className="summary-title">Summary</h3>
                <h3 className="summary-price" >{USDollar.format(calculateSubtotal(cart))}</h3>
            </div>
        </div>

    )
}

export default Cart;
