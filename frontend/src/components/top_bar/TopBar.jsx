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
            <p>Hi, {sessionUser.firstName}</p>
            <ProfileButton user={sessionUser} />
            </>
        );
    } else {
        sessionLinks = (
            <>
                <Link to="/signup" className="top-link">Join Us</Link>
                <span className="divider">|</span>
                <Link to="/login" className="top-link">Sign In</Link>
            </>
        );
    }

    return (
    <div className="top-bar">
        <div className="container">
            <div className="top-left">
                <Link to="/">Home</Link>
            </div>
            <div className="top-right">
                {sessionLinks}
            </div>
        </div>
    </div>
    );
}

export default TopBar;
