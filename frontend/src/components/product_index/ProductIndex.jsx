import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux"
import { fetchProducts } from "../../store/products";
import { useSearchParams } from "react-router-dom"
import './ProductIndex.css'

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
    <div className="product-page">
        <aside className="filter-sidebar">
            <h2>Lifestyle Shoes</h2>
            <h2>Division</h2>
        </aside>

        <section className="product-grid">
                {products.map((product) => (
                    <article key={product.id} className="product-item">
                        <img src="../public/crocs.jpg" alt="Nike Air Force 1 '07"></img>
                        <h3>Best Seller</h3>
                        <p> {product.name} </p>
                        <p> {product.subtitle} </p>
                        <h3 > {USDollar.format(product.listPrice)} </h3>
                        <h3 > {USDollar.format(product.salePrice)} </h3>
                        <br />
                    </article>
                ))}
            
        </section>
    </div>
    );
}

export default ProductIndex