import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux"
import { fetchProducts } from "../../store/products";
import { useSearchParams } from "react-router-dom"

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

    if (!products) {
        return <div>Loading...</div>;
    }

    return (
        <ul>
            {products.map((product) => (
            <>
            <li key={product.id}> {product.name} </li>
            <li key={product.id}> {product.subtitle} </li>
            <li key={product.id}> {product.listPrice} </li>
            <br/>
            </>
            ))}
            {/* <h1>{product.name}</h1>
            <h1>{product.subtitle}</h1>
            <h1>{product.listPrice}</h1>
            <h1>{product.description}</h1> */}
        </ul>
    );
}

export default ProductIndex