import { createStore, applyMiddleware, compose, combineReducers } from 'redux';
import { thunk } from 'redux-thunk';
import sessionReducer from './session';
import formReducer from './form';
import productReducer from './products';
import cartItemsReducer from './cart';
import uiReducer from './ui';
import miniCartReducer from './minicart';

const rootReducer = combineReducers({
    session: sessionReducer,
    form: formReducer,
    products: productReducer, 
    cart: cartItemsReducer,
    minicart: miniCartReducer,
    ui: uiReducer
});

let enhancer;
if (import.meta.env.MODE === 'production') {
    enhancer = applyMiddleware(thunk);
} else {
    const logger = (await import("redux-logger")).default;
    const composeEnhancers =
        window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
    enhancer = composeEnhancers(applyMiddleware(thunk, logger));
}

const configureStore = (preloadedState) => {
    return createStore(rootReducer, preloadedState, enhancer);
};

export default configureStore;