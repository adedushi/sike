import { csrfFetch } from "./csrf";

const ADD_ORDER = 'order/ADD_ORDER';

const addOrder = (order) => {
    return {
        type: ADD_ORDER,
        payload: order
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
