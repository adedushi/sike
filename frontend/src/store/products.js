import { csrfFetch } from "./csrf";

const POPULATE = 'product/POPULATE';

const populateProduct = (product) => {
    return {
        type: POPULATE,
        product: product
    };
};

export const retrieveProduct = (productId) => async dispatch => {
    const res = await csrfFetch(`/api/products/${productId}`)
    if (res.ok) {
        const product = await res.json();
        dispatch(populateProduct(product))
    }
    //  else {
    //     const error = await res.json();
    //     throw error;
    // }

}

const productReducer = (state = {}, action) => {
    switch (action.type) {
        case POPULATE:
            return {[action.product.id]: {...action.product}}
        default:
            return state;
    }
}

export default productReducer;