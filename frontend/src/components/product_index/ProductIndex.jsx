import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux"
import { fetchProducts } from "../../store/products";
import { Link, useSearchParams } from "react-router-dom"
import './ProductIndex.css'
import { cw2288_111_1 } from "../product_display/product_images";

const ProductIndex = () => {
    const dispatch = useDispatch();
    const [division] = useSearchParams();
    division.get("division")
    const products = useSelector((state) => Object.values(state.products))

    useEffect(() => {
        dispatch(fetchProducts(division))
    },[dispatch, division])

    // if (error) {
    //     return <div>Error: {error.status} {error.statusText}</div>;
    // }

    const USDollar = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 0
    });

    if (!products) {
        return <div>Loading...</div>;
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