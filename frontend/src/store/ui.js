const TOGGLE_CART_VISIBILITY = 'ui/toggleCartVisibility';

export const toggleCartVisibility = (boolean) => ({
    type: TOGGLE_CART_VISIBILITY,
    payload: boolean
});

const initialState = { isCartVisible: false };

const uiReducer = (state = initialState, action) => {
    switch (action.type) {
        case TOGGLE_CART_VISIBILITY:
            return { ...state, isCartVisible: action.payload };
        default:
            return state;
    }
};

export default uiReducer;