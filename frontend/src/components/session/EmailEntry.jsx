import { useState } from 'react';
import { useDispatch } from 'react-redux';
import { formType, storeEmail } from '../../store/form';
import './EmailEntry.css'
import { Link } from 'react-router-dom';
import { Layout } from '../../App';

const EmailEntry = () => {
    const dispatch = useDispatch();
    const [localEmail, setLocalEmail] = useState('');


    const checkEmailExists = async (email) => {
        const response = await fetch(`/api/users/check_email?email=${encodeURIComponent(email)}`);
        const data = await response.json();
        return data.exists;
    }

    const submitEmail = async (e) => {
        e.preventDefault();
        const exists = await checkEmailExists(localEmail);
        dispatch(storeEmail(localEmail))
        dispatch(formType((exists ? 'LOGIN' : 'SIGNUP')))
    };

    return (
        <>
        <div className="form-container">
            <header className="form-header">
                    <Link component={Layout} to='/'><img src="./favicon.ico" alt="Sike Logo" className="logo" /></Link>
                    <h1>Enter your email to join us or sign in.</h1>
            </header>
            <form className="email-form" onSubmit={submitEmail}>
                    <input
                        type="email"
                        placeholder="Email"
                        value={localEmail}
                        onChange={(e) => setLocalEmail(e.target.value)}
                        required
                    />
                    <div className="button-container">
                        <button type="submit" className="continue-btn">Continue</button>
                    </div>
            </form>
        </div>
        </>
    );
}

export default EmailEntry
