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
    const [selectedSize, setSelectedSize] = useState("");

    const sizes = ["W 5 / M 3.5", "W 5.5 / M 4", "W 6 / M 4.5", "W 6.5 / M 5", "W 7 / M 5.5", 
    "W 7.5 / M 6", "W 8 / M 6.5", "W 8.5 / M 7", "W 9 / M 7.5", "W 9.5 / M 8", "W 10 / M 8.5", 
    "W 10.5 / M 9", "W 11 / M 9.5", "W 11.5 / M 10", "W 12 / M 10.5"]

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

    const handleSizeChange = (event) => {
        setSelectedSize(event.target.value);
    };

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
                        <div className="size-options">
                            {sizes.map((size) => (
                                <div key={size} className="size-option">
                                    <input
                                        type="radio"
                                        id={size}
                                        name="size"
                                        value={size}
                                        className="size-radio"
                                        onChange={handleSizeChange}
                                        checked={selectedSize === size}
                                    /><label htmlFor={size}>{size}</label>
                                </div>
                            ))}
                        </div>

                    </div>
                </div>
            </div>
        </div >
    );
}

export default ProductDisplay



    
