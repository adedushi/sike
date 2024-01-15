import { useEffect } from 'react';
import EmailEntry from './EmailEntry';
import LoginForm from './LoginForm';
import SignupForm from './SignupForm';
import { useDispatch, useSelector } from 'react-redux';
import { resetFormState } from '../../store/form';

const Session = () => {
    
    const { load, email } = useSelector(state => state.form)
    
    return (
        <div>
            {load === 'EMAIL_ENTRY' && <EmailEntry />}
            {load === 'LOGIN' && <LoginForm email={email}/>}
            {load === 'SIGNUP' && <SignupForm email={email}/>}
        </div>
    );
}

export default Session;