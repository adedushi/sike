import EmailEntry from './EmailEntry';
import LoginForm from './LoginForm';
import SignupForm from './SignupForm';
import { useSelector } from 'react-redux';
import { Navigate } from 'react-router-dom';

const Session = () => {
    const sessionUser = useSelector(state => state.session.user);
    const { load, email } = useSelector(state => state.form)
    if (sessionUser) return <Navigate to="/" replace={true} />;
    
    return (
        <div>
            {load === 'EMAIL_ENTRY' && <EmailEntry />}
            {load === 'LOGIN' && <LoginForm email={email}/>}
            {load === 'SIGNUP' && <SignupForm email={email}/>}
        </div>
    );
}

export default Session;