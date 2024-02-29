import { useSelector } from 'react-redux';
import './CheckoutSuccess.css';

const CheckoutSuccess = () => {
    const sessionUser = useSelector(state => state.session.user);

    return (
        <div className="checkout-success">
            <div className='checkout-top-message'>
                <h1>THANKS! {sessionUser.firstName.toUpperCase()}! </h1>
                <h1>WE&apos;RE ON IT! </h1>
            </div>
            <div className='checkout-bottom-message'>
                <h3>Your order&apos;s in. We&apos;re working to get it packed up and out </h3>
                <h3>-the door expect a dispatch confirmation email soon.</h3>
            </div>
        </div>
    );
};

export default CheckoutSuccess;