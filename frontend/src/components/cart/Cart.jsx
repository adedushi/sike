import { useSelector } from "react-redux";
import { Navigate } from "react-router-dom";
import './Cart.css'

const Cart = () => {
    const sessionUser = useSelector(state => state.session.user);
    const cart = useSelector((state) => Object.values(state.cart))

    if (!sessionUser) return <Navigate to="/session" replace={true} />;


    return (
        <ul> {cart.length ? cart.map((item) => (
        <li key={item.id}>
            {
                item.photosUrl[0] ? <img src={item.photosUrl[0]} className="cart-thumbnail" /> : "empty"
            } 
            Name:{item.name}Size: {item.size} 
            Quantity: {item.quantity}  </li>
            )
        ) : "empty cart"} </ul>
    )
}

export default Cart