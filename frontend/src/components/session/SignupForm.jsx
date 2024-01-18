import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Link, Navigate } from 'react-router-dom';
import * as sessionActions from '../../store/session';
import './SignupForm.css';
import { formType, resetFormState } from '../../store/form';
import { Layout } from '../../App';


function SignupForm() {
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user);
    const { email } = useSelector(state => state.form)
    const [password, setPassword] = useState("");
    const [firstName, setFirstName] = useState("");
    const [lastName, setLastName] = useState("");
    const [confirmPassword, setConfirmPassword] = useState("");
    const [errors, setErrors] = useState([]);

    if (sessionUser) return <Navigate to="/" replace={true} />;

    const handleSubmit = (e) => {
        e.preventDefault();
        if (password === confirmPassword) {
            setErrors([]);
            return dispatch(sessionActions.signup({ email, password, firstName, lastName }))
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
        }
        return setErrors(['Confirm Password field must be the same as the Password field']);
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

    const displayErrors = (errors) => {
        return Array.isArray(errors[0]) ? (errors[0].map((error) => <li key={error} className="form-text-red">{error}</li>)) : ""
    }

    return (
        <div className="signup-container">
            <div className="signup-header">
                <Link component={Layout} to='/' onClick={handleLogoClick}>
                    <img src="./favicon.ico" alt="Sike Logo" className="logo" />
                </Link>
                <h1>Now let&apos;s make you a Sike Member.</h1>
                <p>Signing up as <span className="email">{email}</span> 
                    <Link to="/session" className="edit-link" onClick={handleEditClick}>Edit</Link>
                </p>
            </div>
            <form className="signup-form" onSubmit={handleSubmit}>
                <div>
                    {displayErrors(errors)}
                </div>
                <div className="form-name">
                    <input
                        type="text"
                        placeholder="First Name"
                        value={firstName}
                        onChange={(e) => setFirstName(e.target.value)}
                        required
                    />
                    <input
                        type="text"
                        placeholder="Last Name"
                        value={lastName}
                        onChange={(e) => setLastName(e.target.value)}
                        required
                    />
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
                    <span className="form-text">Minimum of 8 characters</span>
                    <span className="form-text">Uppercase, lowercase letters, and one number</span>
                    <input
                        type="password"
                        placeholder="Confirm Password"
                        autoComplete="new-password"
                        value={confirmPassword}
                        onChange={(e) => setConfirmPassword(e.target.value)}
                        required
                    />
                </div>
                <div className="button-container">
                    <button type="submit" className="submit-btn">Create Account</button>
                </div>
                <div className="button-container">
                    <button className="submit-btn" onClick={handleDemoLogin}>Demo User</button>
                </div>
            </form>
        </div>
    );
}

export default SignupForm;
