import { useDispatch, useSelector } from "react-redux"
import { retrieveProduct } from "../../store/product"
import { useEffect } from "react";
import { useParams } from "react-router-dom";

const ProductDisplay = () => {
    const { productId } = useParams();
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(retrieveProduct(productId))
    }, [dispatch, productId])

    const product = useSelector((state) => state.product)

    return (
        <>
            <h1>{product.name}</h1>
            <h1>{product.category}</h1>
            <h1>{product.description}</h1>
            <h1>{product.listPrice}</h1>
        </>
    )
}

export default ProductDisplay