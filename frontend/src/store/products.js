import { csrfFetch } from "./csrf";

const GET_PRODUCT = 'products/GET_PRODUCT';
const GET_PRODUCTS = 'products/GET_PRODUCTS'
const UPDATE_PAGINATION = 'products/UPDATE_PAGINATION';
const CLEAR_PRODUCTS = 'products/CLEAR_PRODUCTS'


const getProduct = (product) => {
    return {
        type: GET_PRODUCT,
        payload: product
    };
};

const getProducts = (products) => {
    return {
        type: GET_PRODUCTS,
        payload: products
    };
};


const updatePagination = (pagination) => {
    return {
    type: UPDATE_PAGINATION,
    payload: pagination,
    };
};

export const clearProducts = () => {
    return {
        type: CLEAR_PRODUCTS
    }
}


export const fetchProduct = (productId) => async dispatch => {
    const response = await csrfFetch(`/api/products/${productId}`)
    if (response.ok) {
        const data = await response.json();
        dispatch(getProduct(data))
    }
}

export const fetchProducts = (filters, page = 1) => async dispatch => {
    const filterParams = new URLSearchParams();

    Object.entries(filters).forEach(([key, value]) => {
        if (value !== null) {
            filterParams.append(key, value);
        }
    });

    filterParams.append('page', page);
    const response = await csrfFetch(`/api/products?${filterParams}`);
    if (response.ok) {
        const data = await response.json();
        dispatch(getProducts(data.products));
        dispatch(updatePagination({
            page: data.pagy.page,
            totalPages: data.pagy.totalPages
        }));
    }
};


const initialState = { products: {}, pagination: { page: 1, totalPages: 1 } };

const productReducer = (state = initialState, action) => {
    const newState = { ...state };
    switch (action.type) {
        case GET_PRODUCT:
            return { [action.payload.id]: {...action.payload} }
        case GET_PRODUCTS:
            return { ...newState, products: { ...newState.products, ...action.payload} };
        case UPDATE_PAGINATION:
            return { ...newState, pagination: action.payload };
        case CLEAR_PRODUCTS:
            return initialState;
        default:
            return state;
    }
}

export default productReducer;