import { useSelector, useDispatch } from "react-redux";
import { Navigate } from "react-router-dom";
import { deleteItem, updateCart } from '../../store/cart';
import './Cart.css';
import { sizes } from '../product_display/sizes';
import { cw2288_111_1 } from "../product_display/product_images";


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
                <ul>
                    {cart.length ? cart.map((item) => (
                        <li key={item.id} className="cart-item">
                            <img src={Array.isArray(item.photosUrl) ? item.photosUrl[0] : {cw2288_111_1}} alt={item.name} className="cart-item-image" />
                            <div className="cart-item-details">
                                <h3 className="cart-item-title">{item.name}</h3>
                                <div className="cart-item-options">
                                    <span className="cart-item-size">
                                        Size:
                                        <select onChange={(e) => handleSizeChange(item.id, e.target.value)} value={item.size} className="cart-item-select">
                                            {sizes.map((size, index) => (
                                                <option key={index} value={size}>{size}</option>
                                            ))}
                                        </select>
                                    </span>
                                    <span className="cart-item-quantity">
                                        Quantity:
                                        <select onChange={(e) => handleQuantityChange(item.id, e.target.value)} value={item.quantity} className="cart-item-select">
                                            {Array.from({ length: 10 }, (_, i) => i + 1).map((number, index) =>
                                                <option key={index} value={number}>{number}</option>
                                            )}
                                        </select>
                                    </span>
                                </div>
                                <button onClick={() => handleDelete(item.id)} className="cart-item-delete">Delete Item</button>
                            </div>
                            <div className="cart-item-price">
                                {USDollar.format((item.salePrice ? item.salePrice : item.listPrice) * item.quantity)}
                            </div>
                        </li>
                    )) : <p className="empty-cart">Empty cart</p>}
                </ul>
            </div>
            <div className="cart-summary">
                <h3 className="summary-title">Summary</h3>
                <h3>{USDollar.format(calculateSubtotal(cart))}</h3>
            </div>
        </div>

    )
}

export default Cart;
