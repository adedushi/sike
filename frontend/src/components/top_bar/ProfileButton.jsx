import { useDispatch } from 'react-redux';
import * as sessionActions from '../../store/session';
import jordan from './jordan.jpg'
import './TopBar.css';
import { resetFormState } from '../../store/form';
import { Link } from 'react-router-dom';

function ProfileButton() {
    const dispatch = useDispatch();

    const logout = (e) => {
        e.preventDefault();
        dispatch(resetFormState());
        dispatch(sessionActions.logout());
    };

    return (
        <div className="profile-button-container">
            <button label="profile-menu">
                <img src={jordan} alt="Profile Avatar" className="profile-avatar" />
            </button>
            <ul className="profile-dropdown">
                <Link to={`/orders/`} ><li>Orders</li></Link>
                {/* <li>Favorites</li> */}
                {/* <li>Inbox </li> */}
                {/* <li>Experiences</li> */}
                {/* <li>Account Settings</li> */}
                <li onClick={logout}>Log Out</li>
            </ul>
        </div>
    );
}

export default ProfileButton;
