const EDIT_ITEM = 'minicart/editItem';

export const editMiniCartItem = (item) => ({
    type: EDIT_ITEM,
    payload: item
});

const initialState = { item: null };

const miniCartReducer = (state = initialState, action) => {
    switch (action.type) {
        case EDIT_ITEM:
            return { ...state, item: { ...action.payload }};
        default:
            return state;
    }
};

export default miniCartReducer;