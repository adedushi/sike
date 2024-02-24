import { useDispatch, useSelector } from "react-redux"
import { fetchProduct } from "../../store/products"
import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import './ProductDisplay.css'
import {cw2288_111_1, cw2288_111_2, cw2288_111_3, cw2288_111_4, cw2288_111_5, 
    cw2288_111_6, cw2288_111_7, cw2288_111_8, cw2288_111_9, cw2288_111_10} 
    from './product_images'
import { addItem, updateCart } from "../../store/cart";
import { getSizes } from "./sizes";
import logo from '../nav_bar/logo.svg'


const ProductDisplay = () => {
    const sessionUser = useSelector(state => state.session.user);
    const cart = useSelector((state) => Object.values(state.cart))
    const { productId } = useParams();
    const dispatch = useDispatch();
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState(null);
    const [thumbnails, setThumbnails] = useState([cw2288_111_1, 
        cw2288_111_2, cw2288_111_3, cw2288_111_4, cw2288_111_5, 
        cw2288_111_6, cw2288_111_7, cw2288_111_8,cw2288_111_9,
        cw2288_111_10])
    const [selectedImage, setSelectedImage] = useState();
    const [selectedSize, setSelectedSize] = useState("");

    useEffect(() => {
        setIsLoading(true); 
        dispatch(fetchProduct(productId))
            .then(() => setIsLoading(false)) 
            .catch((err) => {
                setError(err);
                setIsLoading(false);
            });
    }, [productId, dispatch]);

    const selectProduct = (productId) => (state) => {
        return state.products[productId]
    }

    const product = useSelector(selectProduct(productId))

    useEffect(() => {
        if (product?.photosUrl?.length > 0) {
            setThumbnails(product.photosUrl);
            setSelectedImage(product.photosUrl[0]);
        }
    }, [product]);

    const handleImageChange = (event) => {
        setSelectedImage(event.target.src);
    };

    const handleSizeChange = (event) => {
        setSelectedSize(event.target.value);
    };

    const handleAddToCart = (event) => {
        event.preventDefault();


        const existingCartItem = cart.find(
            (item) => item.productId === parseInt(productId, 10) && item.size === selectedSize
        );

        if (existingCartItem) {
            const updatedItem = {
                ...existingCartItem,
                quantity: existingCartItem.quantity + 1
                };
            return dispatch(updateCart(existingCartItem.id, updatedItem))
        }
        else {
            const newItem = {
                user_id: sessionUser.id,
                product_id: parseInt(productId),
                quantity: 1,
                size: selectedSize,
                checkedOut: false,
            };
            return dispatch(addItem(newItem));
        }
    };


    const USDollar = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 0
        }
    );

    if (isLoading || !product) {
        return (
            <div className="loading-container">
                <img src={logo} alt="loading-swoosh" className="loading-svg" />
            </div>
        )
    }

    if (error) {
        return <div>Error: {error.status} We can&apos;t find the page you are looking for. Sorry for the inconvenience.</div>;
        // { error.statusText }
    }

    const { name, category, division, subtitle, listPrice, description, articleNumber } = product;

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
                                readOnly
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
                            <h1 className="product-title">{name}</h1>
                            <h3 className="product-subtitle">{subtitle}</h3>
                            <h3 className="product-price">{USDollar.format(listPrice)}</h3>
                        </div>
                        <div className="size-selection">
                            <h3>Select Size</h3>
                            <div className="size-options">
                                {getSizes(category, division).map((size) => (
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
                                <div className="product-button-container">
                                    <button className="add-to-bag-btn" onClick={handleAddToCart}>Add to Bag</button>
                                    <button className="favorite-btn">Favorite
                                        <span className="heart-icon">♡</span>
                                    </button>
                                </div>
                            </div>
                            
                        </div>

                        <div className="product-description">
                            <h3 className="product-description-text">{description}</h3>
                            <br/>
                            <h3 className="product-style"> Style: {articleNumber}</h3>
                        </div>
                    </div>
                </div>
        </div >
    </div>
    );
}

export default ProductDisplay



    
