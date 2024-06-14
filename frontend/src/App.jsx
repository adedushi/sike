import { useState, useEffect } from 'react';
import { useDispatch } from 'react-redux';
import { Outlet, createBrowserRouter, RouterProvider, useLocation } from 'react-router-dom';
import * as sessionActions from './store/session';
import Session from './components/session/Session';
import NavBar from './components/nav_bar';
import ProductDisplay from './components/product_display/ProductDisplay';
import ProductIndex from './components/product_index';
import Cart from './components/cart';
import CheckoutSuccess from './components/checkout_success/CheckoutSuccess';
import Footer from './components/footer/Footer';
import OrderItem from './components/order';
import Order from './components/order/Order';
import { initGA, logPageView } from './analytics';
import HomePage from './components/home_page/HomePage';
import LogRocket from 'logrocket';

const isProduction = import.meta.env.MODE === 'production';

export const Layout = () => {
  const dispatch = useDispatch();
  const [isLoaded, setIsLoaded] = useState(false);
  const location = useLocation();

  useEffect(() => {
    dispatch(sessionActions.restoreSession()).then(() => {
      setIsLoaded(true)
    });
  }, [dispatch]);

  useEffect(() => {
    logPageView()
  }, [location]);

  return (
    <div className="layout">
      <NavBar />
      <div className="main-content">
        {isLoaded && <Outlet />}
      </div>
      <Footer />
    </div>
  );
}

const router = createBrowserRouter([
  {
    element: <Layout />,
    children: [
      {
        path: '/',
        element: <HomePage />
      },
      {
        path: '/products/',
        element: <ProductIndex />
      },
      {
        path: '/products/:productId',
        element: <ProductDisplay />
      },
      {
        path: '/cart/',
        element: <Cart />
      },
      {
        path: '/checkout-success',
        element: <CheckoutSuccess />
      },
      {
        path: '/orders',
        element: <OrderItem />
      },
      {
        path: '/orders/:orderId',
        element: <Order />
      }
    ]
  },
  {
    path: 'session',
    element: <Session />
  }
]);

const App = () => {
  useEffect(() => {
    const gaMeasurementId = import.meta.env.VITE_GA_MEASUREMENT_ID;
    if (gaMeasurementId && isProduction) {
      initGA(gaMeasurementId)
    }
  }, []);

  useEffect(() => {
    const logRocketAppId = import.meta.env.VITE_LOGROCKET_APP_ID;
    if (logRocketAppId && isProduction) {
      LogRocket.init(logRocketAppId)
    }
  }, []);

  return <RouterProvider router={router} />;
};

export default App;