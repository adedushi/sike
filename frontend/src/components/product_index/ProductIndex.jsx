import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux"
import { fetchProducts } from "../../store/products";
import { Link, useSearchParams } from "react-router-dom"
import './ProductIndex.css'
import { cw2288_111_1 } from "../product_display/product_images";
import logo from '../nav_bar/logo.svg'


const ProductIndex = () => {
    const dispatch = useDispatch();
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState(null);
    const [division] = useSearchParams();
    division.get("division")
    const products = useSelector((state) => Object.values(state.products))

    useEffect(() => {
        setIsLoading(true);
        dispatch(fetchProducts(division))
            .then(() => setIsLoading(false))
            .catch(err => {
                setError(err);
                setIsLoading(false);
            });
    },[dispatch, division])

    if (error) {
        return <div>Error: {error.status} We can&apos;t retreive any products. Sorry for the inconvenience.</div>;
    }

    const USDollar = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 0
    });

    if (isLoading) {
        return (
            <div className="loading-container">
                <img src={logo} alt="loading-swoosh" className="loading-svg" />
            </div>
        )
    }

    return (
    <>
    <div className="header-offset"></div>
    <div className="products-page">
        <aside className="filter-sidebar">
            <h2>Lifestyle Shoes</h2>
            <h2>Division</h2>
        </aside>

        <section className="product-grid">
                {products.map((product) => (
                    <div key={product.id} className="product-item" >
                        <Link to={`/products/${product.id}`} className="product-item-link"> 
                            <img src={product.photosUrl ? product.photosUrl[0] : cw2288_111_1 } alt={product.name}></img>
                            <h3> {product.name} </h3>
                            <p> {product.subtitle} </p>
                            <h3 > {USDollar.format(product.listPrice)} </h3>
                            <h3 > {product.salePrice ? USDollar.format(product.salePrice) : null } </h3>
                            <br />
                        </Link>
                    </div>
                ))}
            
        </section>
    </div>
    </>
    );
}

export default ProductIndex