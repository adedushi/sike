import { useState } from 'react';
import { useDispatch } from 'react-redux';
import { formType, storeEmail } from '../../store/form';

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
        <form onSubmit={submitEmail}>
            <input
                type="email"
                value={localEmail}
                onChange={(e) => setLocalEmail(e.target.value)}
                required
            />
            <button type="submit">Continue</button>
        </form>
        </>
    );
}

export default EmailEntry
