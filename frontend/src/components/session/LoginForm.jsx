import { useState } from 'react';
import * as sessionActions from '../../store/session';
import { useDispatch, useSelector } from 'react-redux';
import { Link, Navigate } from 'react-router-dom';
import './LoginForm.css';
import { formType, resetFormState } from '../../store/form';

const LoginForm = () => {
    const { email } = useSelector(state => state.form)
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user);
    const [password, setPassword] = useState("");
    const [errors, setErrors] = useState([]);

    if (sessionUser) return <Navigate to="/" replace={true} />;

    const handleSubmit = (e) => {
        e.preventDefault();
        setErrors([]);
        return dispatch(sessionActions.login({ email, password }))
            .catch(async (res) => {
                let data;
                try {
                    data = await res.clone().json();
                } catch {
                    data = await res.text();
                }
                if (data?.errors) setErrors(data.errors);
                else if (data) setErrors([data]);
                else setErrors([res.statusText]);
            });
    };

    const handleDemoLogin = (e) => {
        e.preventDefault();
        return dispatch(sessionActions.login({ email: 'michael@jordan.com', password: 'Jordan23' }))
    }

    const handleEditClick = () => {
        dispatch(formType('EMAIL_ENTRY'));
    };

    const handleLogoClick = () => {
        dispatch(resetFormState());
    };

    return (
        <div className="login-container">
            <div className="login-header">
                <Link to='/' onClick={handleLogoClick}>
                    <img src="./favicon.ico" alt="Sike Logo" className="logo" />
                </Link>
                <h1>What&apos;s your password?</h1>
                <p><span className="email">{email}</span> 
                    <Link to="/session" className="edit-link" onClick={handleEditClick}>Edit</Link>
                </p>
            </div>
            <form className="login-form" onSubmit={handleSubmit}>
                <div>
                    {errors.map((error) => <li key={error}>{error}</li>)}
                </div>
                <div className="form-password">
                    <input
                        type="password"
                        placeholder="Password"
                        autoComplete="new-password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        required
                    />
                </div>
                <div className="session-button-container">
                    <button type="submit" className="login-btn">Sign In</button>
                </div>
                <div className="session-button-container">
                    <button className="login-btn" onClick={handleDemoLogin}>Demo User</button>
                </div>
            </form>
        </div>
    );
}

export default LoginForm;
