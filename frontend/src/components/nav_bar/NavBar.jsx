import { Link, useLocation } from "react-router-dom"
import TopBar from "../top_bar"
import './NavBar.css'
import logo from './logo.svg'
import search from './search.svg'
// import favorite from './favorite.svg'
import bag from './bag.svg'
import { createSelector } from "reselect"
import { useSelector } from "react-redux"
import MiniCart from "../mini_cart/MiniCart"

const NavBar = () => {
    const location = useLocation();

    const cartSelector = state => state.cart;
    const selectCartArray = createSelector(cartSelector, (cart) => Object.values(cart));
    const cart = useSelector(selectCartArray);
    console.log(cart);
    const totalQuantity = cart.reduce((total, currentItem) => total + currentItem.quantity, 0);

    const isCartVisible = useSelector(state => state.ui.isCartVisible);

    const product = useSelector(state => state.minicart.item);

    const sessionUser = useSelector(state => state.session.user);

    return (
        <>
        <TopBar />
        <div className="navbar">
            <div className="navbar-section-left">
                <Link to='/'>
                    <img src={logo} alt="Sike Logo" className="navbar-logo" />
                </Link>
                <div className="navbar-spacer"></div>
            </div>
            <nav className="navbar-section-center">
                <Link to="products/?division=All" className="nav-link">New & Featured</Link>
                <Link to="products/?division=Men" className="nav-link">Men</Link>
                <Link to="products/?division=Women" className="nav-link">Women</Link>
                <Link to="products/?division=Kids" className="nav-link">Kids</Link>
                {/* <Link to="#" className="nav-link">Sale</Link> */}
            </nav>
            <div className="navbar-section-right">
                <div className="navbar-spacer"></div>
                <div className="search-container">
                    <button className="search-btn"> <img src={search}/></button>
                    <input type="text" placeholder="Search"/>
                </div>
                {/* <Link to="#" className="favorite-icon"><img src={favorite} /></Link> */}
                <Link to='/cart' className="cart-icon">
                    <img src={bag} />
                    {totalQuantity > 9 ? 
                            <span className="cart-quantity-high">9+</span> : 
                            <span className="cart-quantity-low">{totalQuantity}</span>
                    }
                </Link>
            </div>
        </div>
            {(isCartVisible && product) && <MiniCart product={product} totalQuantity={totalQuantity} />}
        {!location.pathname.startsWith('/cart') && (
            <div className="offer-bar">
                <span className="offer-text">Members: Free Shipping on Orders $50+</span>
                    {!sessionUser && (
                        <Link to="session" className="sign-up-link">Sign Up</Link>
                    )}
            </div>
        )}
        </>
    );
}

export default NavBar