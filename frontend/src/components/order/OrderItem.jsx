import { useDispatch, useSelector } from 'react-redux';
import './OrderItem.css'
import { Navigate } from 'react-router-dom';
import { useEffect, useState } from 'react';
import { fetchOrderItems } from '../../store/orderItems';
import logo from '../nav_bar/logo.svg'
import { createSelector } from 'reselect';

const OrderItem = () => {
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user);
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState(null);

    useEffect(() => {
        setIsLoading(true);
        dispatch(fetchOrderItems())
            .then(() => setIsLoading(false))
            .catch(err => {
                setError(err);
                setIsLoading(false);
            });
    }, [dispatch])

    const orderItemsSelector = state => state.orderItems;
    const selectOrderItemsArray = createSelector(orderItemsSelector, (orderItems) => Object.values(orderItems))
    const orderItems = useSelector(selectOrderItemsArray)

    if (!sessionUser) return <Navigate to="/session" replace={true} />;

    if (error) {
        return <div>Error: {error.status} We can&apos;t retreive your orders. Sorry for the inconvenience.</div>;
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
        hello
            {orderItems.length ? orderItems.map((item) => (
                <li key={item.id}>{item.name}</li>
            )) : null}
        </>

    )
}


export default OrderItem
