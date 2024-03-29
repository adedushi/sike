import React from 'react';
import ReactDOM from 'react-dom/client';
import { Provider } from 'react-redux';
import App from './App';
import './index.css';
import configureStore from './store';
import * as sessionActions from './store/session'
import * as uiActions from './store/ui';
import { csrfFetch, restoreCSRF } from './store/csrf';


const store = configureStore();

if (import.meta.env.MODE !== 'production') {
  restoreCSRF();
  window.store = store;
  window.csrfFetch = csrfFetch;
  window.sessionActions = sessionActions;
  window.uiActions = uiActions;
}

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <Provider store={store}>
      <App />
    </Provider>
  </React.StrictMode>
);
