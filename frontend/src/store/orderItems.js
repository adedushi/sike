import { csrfFetch } from "./csrf";

const GET_ORDER_ITEMS = 'orders/GET_ORDER_ITEMS'
const ADD_ORDER = 'orders/ADD_ORDER';

const addOrder = (order) => {
    return {
        type: ADD_ORDER,
        payload: order
    };
};

const getOrderItems = (items) => {
    return {
        type: GET_ORDER_ITEMS,
        payload: items
    };
};

export const createOrder = (order) => async dispatch => {
    const response = await csrfFetch('/api/orders', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(order)
    });

    if (!response.ok) {
        throw new Error('Network response was not ok');
    }

    const newOrder = await response.json();
    dispatch(addOrder(newOrder));
}

export const fetchOrderItems = () => async dispatch => {
    const response = await csrfFetch('/api/order_items')
    if (response.ok) {
        const items = await response.json();
        dispatch(getOrderItems(items))

    }
}

const orderItemsReducer = (state = {}, action) => {
    switch (action.type) {
        case GET_ORDER_ITEMS:
            return {...action.payload}
        default:
            return state;
    }
}

export default orderItemsReducer