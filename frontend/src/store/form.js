const SET_EMAIL = 'form/setEmail';
const SET_LOAD = 'form/setLoad';
const RESET_FORM = 'form/resetForm';

const initialState = {
    email: '',
    load: 'EMAIL_ENTRY',
};

const setEmail = (email) => ({
    type: SET_EMAIL,
    email: email
});

const resetForm = () => ({
    type: RESET_FORM,
    payload: initialState
});

const setLoad = (load) => ({
    type: SET_LOAD,
    load: load
});

export const storeEmail = (email) => dispatch => {
    dispatch(setEmail(email))
}

export const resetFormState = () => dispatch => {
    dispatch(resetForm())
}

export const formType = (load) => dispatch => {
    dispatch(setLoad(load))
}

const formReducer = (state = initialState, action) => {

    switch (action.type) {
        case SET_EMAIL:
            return { ...state, email: action.email };
        case RESET_FORM:
            return { ...state, 
                email: action.payload.email,
                load: action.payload.load };
        case SET_LOAD:
            return { ...state, load: action.load };
        default:
            return state;
    }
};

export default formReducer;