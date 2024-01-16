import { useState, useEffect, useRef } from 'react';
import { useDispatch } from 'react-redux';
import * as sessionActions from '../../store/session';
import './TopBar.css';
import { resetFormState } from '../../store/form';

function ProfileButton({ user }) {
    const dispatch = useDispatch();
    const [showMenu, setShowMenu] = useState(false);
    const dropdownRef = useRef(null);

    const toggleMenu = (e) => {
        e.stopPropagation();
        setShowMenu(!showMenu);
    };

    useEffect(() => {
        if (!showMenu) return;

        const closeMenu = (e) => {
            if (dropdownRef.current && !dropdownRef.current.contains(e.target)) {
                setShowMenu(false);
            }
        };

        document.addEventListener('click', closeMenu);

        return () => document.removeEventListener('click', closeMenu);
    }, [showMenu]);

    const logout = (e) => {
        e.preventDefault();
        dispatch(resetFormState());
        dispatch(sessionActions.logout());
        
    };

    // const user_icon = () => {
    //     return (
    //         <div style={{ color: "black", fontSize: "10px" }}>
    //             <i className="fa-regular fa-user"></i>
    //         </div>
    //     );
    // };


    return (
        <>
            <button onClick={toggleMenu}>
                <i className={`fa-solid fa-${user.firstName[0].toLowerCase()}`}></i>
            </button>
            {showMenu && (
                <ul className="profile-dropdown" ref={dropdownRef}>
                    <li>{user.firstName} {user.lastName}</li>
                    <li>{user.email}</li>
                    <li>
                        <button onClick={logout}>Log Out</button>
                    </li>
                </ul>
            )}
        </>
    );
}

export default ProfileButton;
