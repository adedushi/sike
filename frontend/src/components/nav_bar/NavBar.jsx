import { Link } from "react-router-dom"
import TopBar from "../top_bar"
import './NavBar.css'
import { Layout } from "../../App"

const NavBar = () => {
    return (
        <>
        <TopBar />
        <div className="navbar">
            <div className="navbar-section left">
                <Link component={Layout} to='/'>
                    <img src="./favicon.ico" alt="Sike Logo" className="navbar-logo" />
                </Link>
            </div>

            <nav className="navbar-section center">
                <a href="#" className="nav-link active">New & Featured</a>
                <a href="#" className="nav-link">Men</a>
                <a href="#" className="nav-link">Women</a>
                <a href="#" className="nav-link">Kids</a>
            </nav>
            <div className="navbar-section right">
                <div className="search-container">
                    <button className="search-btn"> <img src="./search.svg"/></button>
                    <input type="text" placeholder="Search"/>
                </div>
                <a href="#" className="favorite-icon"><img src="./favorite.svg"/></a>
                <a href="#" className="cart-icon"><img src="./cart.svg" /></a> 
                {/* <span className="quantity" data-var="jewel">1</span> */}
            </div>
        </div>

        </>
    )
}

export default NavBar