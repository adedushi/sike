import { useDispatch, useSelector } from "react-redux"
import { fetchProduct } from "../../store/products"
import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import './ProductDisplay.css'
import {af1_1, af1_2, af1_3, af1_4, 
    af1_5, af1_6, af1_7, af1_8} 
    from './product_images'

const ProductDisplay = () => {
    const { productId } = useParams();
    const dispatch = useDispatch();
    const [error, setError] = useState(null);

    useEffect(() => {
        dispatch(fetchProduct(productId)).catch((err) => {
            setError(err);
        });
    }, [productId, dispatch]);

    const selectProduct = (productId) => (state) => {
        return state.products[productId]
    }

    let product = useSelector(selectProduct(productId))

    if (error) {  
        return <div>Error: {error.status} We can&apos;t find the page you are looking for. Sorry for the inconvenience.</div>;
        // { error.statusText }
    }

    if (!product) {
        return <div>Loading...</div>;
    }

    return (
    < div className="product-page">
        <div className="left-column">
            <div className="thumbnail-carousel">
                <img src={af1_1} alt="Thumbnail Image" className="thumbnail" />
                <img src={af1_2} alt="Thumbnail Image" className="thumbnail" />
                <img src={af1_3} alt="Thumbnail Image" className="thumbnail" />
                <img src={af1_4} alt="Thumbnail Image" className="thumbnail" />
                <img src={af1_5} alt="Thumbnail Image" className="thumbnail" />
                <img src={af1_6} alt="Thumbnail Image" className="thumbnail" />
                <img src={af1_7} alt="Thumbnail Image" className="thumbnail" />
                <img src={af1_8} alt="Thumbnail Image" className="thumbnail" />
                <img src={af1_8} alt="Thumbnail Image" className="thumbnail" />
                <img src={af1_8} alt="Thumbnail Image" className="thumbnail" />
                <img src={af1_8} alt="Thumbnail Image" className="thumbnail" />
            </div>
            <div className="main-image-container">
                <img src={af1_1} alt="Main Product Image" className="main-image"/>
            </div>
        </div>

            <div className="right-column">
                <div className="product-info">
                    <div className="purchase-info">
                        <span className="purchased-count">9,999 purchased in the last 7 days</span>
                        <h1>{product.name}</h1>
                        <h2>Womens Shoes</h2>
                        <div className="price">$115</div>
                    </div>
                    <div className="size-selection">
                        <h3>Select Size</h3>
                        <div className="size-option">W 5 / M 3.5</div>
                        <div className="size-option">W 5 / M 3.5</div>
                        <div className="size-option">W 5 / M 3.5</div>
                        <div className="size-option">W 5 / M 3.5</div>
                        <div className="size-option">W 5 / M 3.5</div>
                        <div className="size-option">W 5 / M 3.5</div>
                    </div>
                </div>
            </div>
        </div >
    );
}

export default ProductDisplay



    
