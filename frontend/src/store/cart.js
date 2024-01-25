import { csrfFetch } from "./csrf";

const FETCH_CART_ITEMS = 'cart/FETCH_CART_ITEMS';
const ADD_CART_ITEM = 'cart/ADD_CART_ITEM';
const UPDATE_CART_ITEM = 'cart/UPDATE_CART_ITEM';
const DELETE_CART_ITEM = 'cart/DELETE_CART_ITEM';
const RESET_CART = 'cart/RESET_CART';

const getCartItems = (items) => {
    return {
        type: FETCH_CART_ITEMS,
        payload: items
    };
};

const addCartItem = (item) => {
    return {
        type: ADD_CART_ITEM,
        payload: item
    };
};

const updateCartItem = (updatedItem) => {
    return {
        type: UPDATE_CART_ITEM,
        payload: updatedItem
    };
};


const deleteCartItem = (itemId) => {
    return {
        type: DELETE_CART_ITEM,
        payload: itemId
    };
};


export const addItem = (item) => async dispatch => {
    try {
        const response = await csrfFetch('/api/cart_items', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(item)
        });

        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        const newItem = await response.json();

        dispatch(addCartItem(newItem));
    } catch (error) {
    }
};

export const fetchCart = () => async dispatch => {
    try {
        const response = await csrfFetch('/api/cart_items', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
            }
        });

        if (!response.ok) {
            throw new Error('Network response was not ok');
        }

        const cartItems = await response.json();
        dispatch(getCartItems(cartItems));
    } catch (error) {
    }
};

export const updateCart = (itemId, updates) => async dispatch => {
    try {
        const response = await csrfFetch(`/api/cart_items/${itemId}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(updates)
        });

        if (!response.ok) {
            throw new Error('Network response was not ok');
        }

        const updatedItemData = await response.json();
        dispatch(updateCartItem(updatedItemData));
    } catch (error) {
    }
};


export const deleteItem = (itemId) => async dispatch => {
    try {
        const response = await csrfFetch(`/api/cart_items/${itemId}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            }
        });

        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        dispatch(deleteCartItem(itemId));
    } catch (error) {
    }
};

export const resetCart = () => dispatch => {
    dispatch({ type: RESET_CART })
};


const cartItemsReducer = (state = {}, action) => {
    const newState = { ...state };
    switch (action.type) {
        case FETCH_CART_ITEMS:
            return {...action.payload};
        case ADD_CART_ITEM:
            return {...state, ...action.payload}
        case DELETE_CART_ITEM:
            delete newState[action.payload];
            return newState;
        case UPDATE_CART_ITEM: 
            return {...newState, ...action.payload}
        case RESET_CART:
            return {};
        default:
            return state;
    }
};


export default cartItemsReducer;
