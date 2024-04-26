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
    const selectOrderItemsArray = createSelector(orderItemsSelector, (orderItems) => {
        const itemsArray = Object.values(orderItems);
        itemsArray.sort((a, b) => new Date(b.createdAt) - new Date(a.createdAt));
        return itemsArray;
    })

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
        
        const formattedDeliveryDate = deliveryDate.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })

        return currentDate > deliveryDate ? 
        
        <div className='order-item-status-delivered'>
            <h3>Delivered</h3> 
        </div> : 
        <div className='order-item-status-shipped'> 
            <h3>Shipped</h3> 
            <h3>Arrives by {formattedDeliveryDate}</h3> 
        </div>
        
    }


    return (
        <div className='order-items-container'>
            <div className='order-items'>
                <h1 className="order-items-header">Orders</h1>
                {orderItems.length ? orderItems.map((item) => (
                    <div key={item.id} className='order-item'>
                        <div className="order-item-link-container">
                            <Link to={`/products/${item.productId}`} className="order-item-link">
                                <img src={Array.isArray(item.photosUrl) ? item.photosUrl[0] : null} alt={item.name} className="order-item-image" />
                            </Link>
                        </div>
                        <div className="order-item-details">
                            <div className='order-item-top-line'>
                                {deliveryStatus(item.createdAt)}
                                <Link to={`/orders/${item.orderId}`} className="view-order-button">
                                    View Order
                                </Link>
                            </div>
                            <div className="order-item-link-container">
                                <Link to={`/products/${item.productId}`} className="order-item-link">
                                    <h3 className="order-item-title">{item.name}</h3>
                                </Link>
                            </div>
                            <div className='order-item-information'>
                                <h3>{item.subtitle}</h3>
                                <h3>Size {item.size}</h3>
                                <h3>Style {item.articleNumber}</h3>
                                {item.quantity > 1 ? 
                                <h3>Quantity {item.quantity}</h3> : null}
                            </div>
                        </div>
                    </div>
                )) : <h1 className = "order-items-empty">No Orders Found</h1>}
            </div>
        </div>
    )
}


export default OrderItem
