import { useDispatch, useSelector } from 'react-redux';
import './Order.css'
import { Navigate, useParams } from 'react-router-dom';
import { useEffect, useState } from 'react';
import { fetchOrder } from '../../store/orders';
import logo from '../nav_bar/logo.svg'
import { createSelector } from 'reselect';

const Order = () => {    
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user);
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState(null);
    const { orderId } = useParams();


    useEffect(() => {
        setIsLoading(true);
        dispatch(fetchOrder(orderId))
            .then(() => setIsLoading(false))
            .catch(err => {
                setError(err);
                setIsLoading(false);
            });
    }, [dispatch, orderId])

    const { subtotal, shipping, total } = useSelector(state => ({
        subtotal: state.order.subtotal,
        shipping: state.order.shipping,
        total: state.order.total
    }));


    const orderItemsSelector = state => state.order.orderItems;
    const selectOrderItemsArray = createSelector(orderItemsSelector, 
        orderItems => Object.values(orderItems)
    )

    const orderItems = useSelector(selectOrderItemsArray)

    if (!sessionUser) return <Navigate to="/session" replace={true} />;

    if (error) {
        return <div>Error: {error.status} We can&apos;t retreive your order. Sorry for the inconvenience.</div>;
    }

    if (isLoading) {
        return (
            <div className="loading-container">
                <img src={logo} alt="loading-swoosh" className="loading-svg" />
            </div>
        )
    }

    return (
        <>
        <h1>{subtotal}</h1>
        <h1>{shipping}</h1>
        <h1>{total}</h1>
        {orderItems.length ? orderItems.map((item) => (
            <h1 key={item.id}>{item.name}</h1>)) : null}
        </>
    )
}

export default Order