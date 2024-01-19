import { useDispatch, useSelector } from "react-redux"
import { fetchProduct } from "../../store/products"
import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

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
        <>
            <h1>{product.name}</h1>
            <h1>{product.subtitle}</h1>
            <h1>{product.listPrice}</h1>
            {/* <img src={product.photosUrl} alt=""/> */}
        </>
    );
}

export default ProductDisplay