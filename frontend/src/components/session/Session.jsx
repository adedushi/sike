import EmailEntry from './EmailEntry';
import LoginForm from './LoginForm';
import SignupForm from './SignupForm';
import { useSelector } from 'react-redux';
import { Navigate } from 'react-router-dom';

const Session = () => {
    const sessionUser = useSelector(state => state.session.user);
    const { load } = useSelector(state => state.form)
    if (sessionUser) return <Navigate to="/" replace={true} />;
    
    return (
        <div>
            {load === 'EMAIL_ENTRY' && <EmailEntry />}
            {load === 'LOGIN' && <LoginForm />}
            {load === 'SIGNUP' && <SignupForm />}
        </div>
    );
}

export default Session;