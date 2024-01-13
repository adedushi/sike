import { NavLink } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
import './Navigation.css';

const Navigation = () => {
    const sessionUser = useSelector(state => state.session.user);

    let sessionLinks;
    if (sessionUser) {
        sessionLinks = (
            <ProfileButton user={sessionUser} />
        );
    } else {
        sessionLinks = (
            <>
                <NavLink to="/signup">Sign Up</NavLink>
                <NavLink to="/login">Log In</NavLink>
            </>
        );
    }

    return (
        <ul className='nav-bar'>
            <NavLink to="/">Home</NavLink>
            {sessionLinks}
        </ul>
    );
}

export default Navigation;
