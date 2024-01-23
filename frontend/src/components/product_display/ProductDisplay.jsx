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
    const [thumbnails, setThumbnails] = useState([af1_1, af1_2, af1_3, af1_4,
        af1_5, af1_6, af1_7, af1_8]);
    
    const [selectedImage, setSelectedImage] = useState(thumbnails[0]);

    const sizes = ["W 5 / M 3.5", "W 5.5 / M 4", "W 6 / M 4.5", "W 6.5 / M 5", "W 7 / M 5.5", 
    "W 7.5 / M 6", "W 8 / M 6.5", "W 8.5 / M 7", "W 9 / M 7.5", "W 9.5 / M 8", "W 10 / M 8.5", 
    "W 10.5 / M 9", "W 11 / M 9.5", "W 11.5 / M 10", "W 12 / M 10.5"]


    const [selectedSize, setSelectedSize] = useState("");

    useEffect(() => {
        dispatch(fetchProduct(productId)).catch((err) => {
            setError(err);
        });
    }, [productId, dispatch]);

    const selectProduct = (productId) => (state) => {
        return state.products[productId]
    }

    let product = useSelector(selectProduct(productId))

    useEffect(() => {
        if (product && product.photosUrl) {
            setThumbnails(product.photosUrl);
            setSelectedImage(thumbnails[0]);
        }
    }, [thumbnails, product]);

    if (error) {  
        return <div>Error: {error.status} We can&apos;t find the page you are looking for. Sorry for the inconvenience.</div>;
        // { error.statusText }
    }

    if (!product) {
        return <div>Loading...</div>;
    }

    const handleImageChange = (event) => {
        console.log(event);
        setSelectedImage(event.target.src);
    };

    const handleSizeChange = (event) => {
        setSelectedSize(event.target.value);
    };

        const USDollar = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 0
    });

    return (
    <div className="display">
        < div className="product-page">
            <div className="left-column">
                <div className="thumbnail-carousel">
                    {thumbnails.map((thumbnail, index) => (
                        <label key={index} className="thumbnail-label">
                            <input
                                type="radio"
                                name="thumbnail"
                                value={thumbnail}
                                checked={selectedImage === thumbnail}
                                className="thumbnail-radio"
                            />
                            <img
                                src={thumbnail}
                                alt={`Thumbnail ${index + 1}`}
                                onMouseOver={handleImageChange}
                                className={`thumbnail ${selectedImage === thumbnail ? 'selected' : ''}`}
                            />
                        </label>
                    ))}
                </div>
                <div className="main-image-container">
                    <img src={selectedImage} alt="Main Product" className="main-image" />
                </div>
            </div>

                <div className="right-column">
                    <div className="product-info">
                        <div className="product-basic-info">
                            <h1 className="product-title">{product.name}</h1>
                            <h3 className="product-subtitle">{product.subtitle}</h3>
                            <h3 className="product-price">{USDollar.format(product.listPrice)}</h3>
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
                        <div className="product-button-container">
                            <button className="add-to-bag-btn">Add to Bag</button>
                            <button className="favorite-btn">Favorite
                                <span className="heart-icon">♡</span>
                            </button>
                        </div>
                        <div className="product-description">
                            <h3 className="product-description-text">{product.description}</h3>
                            <br/>
                            <h3 className="product-style"> Style: {product.articleNumber}</h3>
                        </div>
                    </div>
                </div>
        </div >
    </div>
    );
}

export default ProductDisplay



    
