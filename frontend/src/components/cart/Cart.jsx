import { useSelector } from "react-redux";
import { Navigate } from "react-router-dom";

const Cart = () => {
    const sessionUser = useSelector(state => state.session.user);
    if (!sessionUser) return <Navigate to="/" replace={true} />;
    
    return (
        <h1>welcome to cart!</h1>
    )
}

export default Cart