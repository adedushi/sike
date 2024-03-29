import { Link } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
import './TopBar.css';

const TopBar = () => {
    const sessionUser = useSelector(state => state.session.user);

    let sessionLinks;
    if (sessionUser) {
        sessionLinks = (
            <>
            <div className="user-welcome">Hi, {sessionUser.firstName}</div>
            <ProfileButton user={sessionUser} />
            </>
        );
    } else {
        sessionLinks = (
            <>
                <Link to="session" className="top-link">Join Us</Link>
                <span className="divider">|</span>
                <Link to="session" className="top-link">Sign In</Link>
            </>
        );
    }

    return (
    <div className="top-bar">
        <div className="session-container">
            <div className="top-left">
            </div>
            <div className="top-right">
                {sessionLinks}
            </div>
        </div>
    </div>
    );
}

export default TopBar;
