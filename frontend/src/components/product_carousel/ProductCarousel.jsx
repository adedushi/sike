import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Swiper, SwiperSlide } from 'swiper/react';
import { Navigation } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/navigation';
import { fetchProducts } from '../../store/products';
import { createSelector } from 'reselect';
import './ProductCarousel.css';
import { Link } from 'react-router-dom';

const ProductCarousel = () => {
    const dispatch = useDispatch();
    const productsSelector = state => state.products.products;
    const selectProductsArray = createSelector(productsSelector, (products) => Object.values(products || {}));
    const products = useSelector(selectProductsArray);

    useEffect(() => {
        dispatch(fetchProducts({sub_category: 'Running'}, 1, 10))
    }, [dispatch])

    return (
        <Swiper
            modules={[Navigation]}
            // spaceBetween={10}  
            navigation
            loop={true}
            breakpoints={{
                2300: { slidesPerView: 8 },
                1600: { slidesPerView: 6 },
                1450: { slidesPerView: 5 },
                0: { slidesPerView: 4}
            }}
        >
            {products.map(product => (
                <SwiperSlide key={product.id}>
                    <Link to={`/products/${product.id}`} className="carousel-item-link">
                        <img src={product.photosUrl ? product.photosUrl[0] : null} alt={product.name}></img>
                        <h3>{product.name}</h3>
                    </Link>
                </SwiperSlide>
            ))}
        </Swiper>
    );
};

export default ProductCarousel;
