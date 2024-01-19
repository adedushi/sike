import { Link } from "react-router-dom"
import TopBar from "../top_bar"
import './NavBar.css'
import { Layout } from "../../App"

const NavBar = () => {
    return (
        <>
        <TopBar />
        <div className="navbar">
            <div className="navbar-section-left">
                <Link component={Layout} to='/'>
                    <img src="../public/logo.svg" alt="Sike Logo" className="navbar-logo" />
                </Link>
            </div>
            <nav className="navbar-section-center">
                <a href="#" className="nav-link active">New & Featured</a>
                <a href="#" className="nav-link">Men</a>
                <a href="#" className="nav-link">Women</a>
                <a href="#" className="nav-link">Kids</a>
                <a href="#" className="nav-link">Sale</a>
            </nav>
            <div className="navbar-section-right">
                <div className="search-container">
                    <button className="search-btn"> <img src="../public/search.svg"/></button>
                    <input type="text" placeholder="Search"/>
                </div>
                <Link to="#" className="favorite-icon"><img src="../public/favorite.svg" /></Link>
                <a href="#" className="cart-icon"><img src="../public/cart.svg" /></a> 
                {/* <span className="quantity" data-var="jewel">1</span> */}
            </div>
        </div>
        <div className="offer-bar">
            <span className="offer-text">Members: Free Shipping on Orders $50+</span>
            <br/>
            <Link to="session" className="sign-up-link">Sign Up</Link>
        </div>
        </>
    )
}

export default NavBar