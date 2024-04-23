import { csrfFetch } from "./csrf"

const GET_ORDER = 'orders/GET_ORDER'

const getOrder = (order) => {
    return {
        type: GET_ORDER,
        payload: order
    }
}

export const fetchOrder = (orderId) => async dispatch => {
    const response = await csrfFetch(`api/orders/${orderId}`)
    if (response.ok) {
        const order = await response.json();
        dispatch(getOrder(order))
    }
}

const ordersReducer = (state = {}, action) => {
    switch (action.type) {
        case GET_ORDER:
            return {...action.payload}
        default:
            return state;
    }
}

export default ordersReducer