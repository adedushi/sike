import { useDispatch, useSelector } from 'react-redux';
import './OrderItem.css'
import { Link, Navigate } from 'react-router-dom';
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

    const shippingDate = (createdDate) => {
        let orderDate = new Date(createdDate);
        let days = 5
        while (days > 0) {
            orderDate.setDate(orderDate.getDate() + 1);
            const dayOfWeek = orderDate.getDay();
            if (dayOfWeek !== 0 && dayOfWeek !== 6) {
                days--;
            }
        }
        return orderDate;
    }

    const deliveryStatus = (createdDate) => {
        const orderDate = new Date(createdDate)
        const deliveryDate = shippingDate(orderDate)
        const currentDate = new Date()
        
        const formattedDeliveryDate = deliveryDate.toLocaleDateString('en-US', { weekday: 'short', month: 'short', day: 'numeric' })

        return currentDate > deliveryDate ? 
        <h3>Delivered</h3> : 
        <> <h3>Shipped</h3> <h3>Arrives by {formattedDeliveryDate}</h3> </>
        
    }


    return (
        <div className='order-items-container'>
            <div className='order-items'>
                <h1 className="order-items-header">Orders</h1>
                {orderItems.length ? orderItems.map((item) => (
                    <div key={item.id} className='order-item'>
                        <Link to={`/products/${item.productId}`} className="order-item-link">
                            <img src={Array.isArray(item.photosUrl) ? item.photosUrl[0] : null} alt={item.name} className="order-item-image" />
                        </Link>
                        <div className="order-item-details">
                            <Link to={`/products/${item.productId}`} className="order-item-link">
                            {deliveryStatus(item.createdAt)}
                                <h3 className="order-item-title">{item.name}</h3>
                            </Link>
                            <h3>{item.subtitle}</h3>
                            <h3>Size {item.size}</h3>
                            <h3>Style {item.articleNumber}</h3>
                            {item.quantity > 1 ? 
                            <h3>Quantity {item.quantity}</h3> : null}
                        </div>
                    </div>
                )) : null}
            </div>
        </div>
    )
}


export default OrderItem
