import { csrfFetch } from "./csrf";

const GET_PRODUCT = 'products/GET_PRODUCT';
const GET_PRODUCTS = 'products/GET_PRODUCTS'

const getProduct = (product) => {
    return {
        type: GET_PRODUCT,
        product
    };
};

const getProducts = (products) => {
    return {
        type: GET_PRODUCTS,
        products
    };
};


export const fetchProduct = (productId) => async dispatch => {
    const response = await csrfFetch(`/api/products/${productId}`)
    if (response.ok) {
        const data = await response.json();
        dispatch(getProduct(data))
    }
}

export const fetchProducts = (filters) => async dispatch => {
    const filterParams = new URLSearchParams(filters);
    const response = await csrfFetch(`/api/products?${filterParams}`);
    if (response.ok) {
        const data = await response.json();
        dispatch(getProducts(data.products));
    }
};

const productReducer = (state = {}, action) => {
    switch (action.type) {
        case GET_PRODUCT:
            return {[action.product.id]: {...action.product}}
        case GET_PRODUCTS:
            return action.products
        default:
            return state;
    }
}

export default productReducer;