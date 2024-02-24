import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Link, Navigate } from 'react-router-dom';
import * as sessionActions from '../../store/session';
import './SignupForm.css';
import { formType, resetFormState } from '../../store/form';


function SignupForm() {
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user);
    const { email } = useSelector(state => state.form)
    const [firstName, setFirstName] = useState("");
    const [lastName, setLastName] = useState("");
    const [firstNameTouched, setFirstNameTouched] = useState(false);
    const [lastNameTouched, setLastNameTouched] = useState(false);
    const [password, setPassword] = useState("");
    const [confirmPassword, setConfirmPassword] = useState("");
    const [passwordTouched, setPasswordTouched] = useState(false);
    const [confirmPasswordTouched, setConfirmPasswordTouched] = useState(false);

    if (sessionUser) return <Navigate to="/" replace={true} />;

    const handleSubmit = (e) => {
        e.preventDefault();
        if (password === confirmPassword) {
            return dispatch(sessionActions.signup({ email, password, firstName, lastName }))
        }
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

    const getInputClassName = (fieldValue, fieldTouched) => {
        return `form-input ${fieldValue.trim() === "" && fieldTouched ? "input-error" : ""}`;
    };

    const displayRequired = (fieldValue, fieldTouched) => {
        if (!fieldValue && fieldTouched) {
            return <div className="form-text-red">Required</div>;
        }
        return null;
    };

    const validatePasswordLength = (password) => {
        return password.length >= 8;
    };

    const validatePasswordComplexity = (password) => {
        const hasUppercase = /[A-Z]/.test(password);
        const hasLowercase = /[a-z]/.test(password);
        const hasNumber = /[0-9]/.test(password);
        return hasUppercase && hasLowercase && hasNumber;
    };

    const getPasswordValidationClass = (condition) => {
        if (!passwordTouched) return "form-text";
        return condition(password) ? "validation-text-valid" : "validation-text-invalid";
    };

    const passwordsMatch = () => {
        return password && confirmPassword && password === confirmPassword;
    };

    const displayPasswordMatch = () => {
        if (confirmPasswordTouched && !passwordsMatch()) {
            return <div className="form-text-red">Passwords must match</div>;
        }
        return null;
    };


    return (
        <div className="signup-container">
            <div className="signup-header">
                <Link to='/' onClick={handleLogoClick}>
                    <img src="./favicon.ico" alt="Sike Logo" className="logo" />
                </Link>
                <h1>Now let&apos;s make you a Sike Member.</h1>
                <p>Signing up as <span className="email">{email}</span> 
                    <Link to="/session" className="edit-link" onClick={handleEditClick}>Edit</Link>
                </p>
            </div>
            <form className="signup-form" onSubmit={handleSubmit}>
                <div>
                </div>
                <div className="form-name">
                    <div className="input-container">
                        <input
                            type="text"
                            placeholder="First Name*"
                            value={firstName}
                            onChange={(e) => setFirstName(e.target.value)}
                            onBlur={() => setFirstNameTouched(true)}
                            className={getInputClassName(firstName, firstNameTouched)}
                            required
                        />
                        {displayRequired(firstName, firstNameTouched)}
                    </div>
                    <div className="input-container">
                        <input
                            type="text"
                            placeholder="Last Name*"
                            value={lastName}
                            onChange={(e) => setLastName(e.target.value)}
                            onBlur={() => setLastNameTouched(true)}
                            className={getInputClassName(lastName, lastNameTouched)}
                            required
                        />
                        {displayRequired(lastName, lastNameTouched)}
                    </div>
                </div>
                <div className="form-password">
                    <input
                        type="password"
                        placeholder="Password*"
                        value={password}
                        onChange={(e) => {
                            setPassword(e.target.value);
                            setPasswordTouched(true);
                        }}
                        className={getInputClassName(password, passwordTouched)}
                        required
                    />
                    <p className={getPasswordValidationClass(validatePasswordLength)}>
                        Minimum of 8 characters
                    </p>
                    <p className={getPasswordValidationClass(validatePasswordComplexity)}>
                        Uppercase, lowercase letters, and one number
                    </p>
                    <input
                        type="password"
                        placeholder="Confirm Password*"
                        value={confirmPassword}
                        onChange={(e) => {
                            setConfirmPassword(e.target.value);
                            setConfirmPasswordTouched(true);
                        }}
                        className={getInputClassName(confirmPassword, confirmPasswordTouched)}
                        required
                    />
                    {displayPasswordMatch()}
                </div>
                <div className="session-button-container">
                    <button type="submit" className="signup-btn">Create Account</button>
                </div>
                <div className="session-button-container">
                    <button className="signup-btn" onClick={handleDemoLogin}>Demo User</button>
                </div>
            </form>
        </div>
    );
}

export default SignupForm;
