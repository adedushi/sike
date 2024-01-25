import { useSelector } from "react-redux";
import { Navigate } from "react-router-dom";

const Cart = () => {
    const sessionUser = useSelector(state => state.session.user);
    const cart = useSelector((state) => Object.values(state.cart))
    if (!sessionUser) return <Navigate to="/session" replace={true} />;

    return (
    <ul>{cart.length ? cart.map((item, index) => (<li key={index}>{item.name}</li>)) : "empty card"}</ul>
    )
}

export default Cart