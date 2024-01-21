import { useDispatch } from 'react-redux';
import * as sessionActions from '../../store/session';
import './TopBar.css';
import { resetFormState } from '../../store/form';

function ProfileButton({ user }) {
    const dispatch = useDispatch();

    const logout = (e) => {
        e.preventDefault();
        dispatch(resetFormState());
        dispatch(sessionActions.logout());
    };

    return (
        <div className="profile-button-container">
            <button aria-label="Profile menu">
                <i className="fa-solid fa-angle-down"></i>
                {/* replace i with profile image */}
            </button>
            <ul className="profile-dropdown">
                <li>Orders</li>
                <li>Favorites</li>
                <li>Inbox <span className="notification-dot"></span></li>
                <li>Experiences</li>
                <li>Account Settings</li>
                <li onClick={logout}>Log Out</li>
            </ul>
        </div>
    );
}

export default ProfileButton;
