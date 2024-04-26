import { useDispatch, useSelector } from 'react-redux';
import './Order.css'
import { Link, Navigate, useParams } from 'react-router-dom';
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

    const USDollar = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 2
    }
    );

    return (
        <div className='orders-container'>
            <div className='orders-information'>
                <div className='orders-left-column'>
                    <Link className="orders-header"to={'/orders'} >
                        <h1 >Orders</h1>
                    </Link>
                    <div className='orders-order-items'>
                        {orderItems.length ? orderItems.map((item) => (
                            <div key={item.id} className='orders-order-item'>
                                <Link to={`/products/${item.productId}`} className="orders-order-item-link">
                                    <img src={Array.isArray(item.photosUrl) ? item.photosUrl[0] : null} alt={item.name} className="orders-order-item-image" />
                                </Link>
                                <div className="orders-order-item-details">
                                    <Link to={`/products/${item.productId}`} className="orders-order-item-link">
                                        <h2 className="orders-order-item-title">{item.name}</h2>
                                    </Link>
                                    <div className='orders-order-item-information'>
                                        <h2 className="orders-order-item-price">{USDollar.format(item.price)}</h2>
                                        <h3>{item.subtitle}</h3>
                                        <h3>Size {item.size}</h3>
                                        <h3>Style {item.articleNumber}</h3>
                                        {item.quantity > 1 ?
                                            <h3>Quantity: {item.quantity}</h3> : null}
                                    </div>
                                </div>
                            </div>
                        )) : null}
                    </div>
                </div>
                <div className='orders-right-column'>
                    <h2 className="orders-header">Summary</h2>
                        <div className='orders-cost'>
                            <div className='orders-line-item'>
                                <span>Subtotal</span>
                                <span>{USDollar.format(subtotal)}</span>
                            </div>
                            <div className='orders-line-item'> 
                                <span>Shipping</span>
                                <span>{USDollar.format(shipping)}</span>
                            </div>
                            <div className='orders-line-item-total' > 
                                <span>Total</span>
                                <span>{USDollar.format(total)}</span>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Order