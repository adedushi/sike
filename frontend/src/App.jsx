import { useState, useEffect } from 'react';
import { useDispatch } from 'react-redux';
import { Outlet, createBrowserRouter, RouterProvider } from 'react-router-dom';
import * as sessionActions from './store/session';
import Session from './components/session/Session';
import NavBar from './components/nav_bar';
import ProductDisplay from './components/product_display/ProductDisplay';
import ProductIndex from './components/product_index';
import CampaignDisplay from './components/campaign_display';
import Cart from './components/cart';
import CheckoutSuccess from './components/checkout_success/CheckoutSuccess';
import Footer from './components/footer/Footer';
import OrderItem from './components/order';
import Order from './components/order/Order';


export const Layout = () => {
  const dispatch = useDispatch();
  const [isLoaded, setIsLoaded] = useState(false);

  useEffect(() => {
    dispatch(sessionActions.restoreSession()).then(() => {
      setIsLoaded(true)
    });
  }, [dispatch]);

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
        element: <CampaignDisplay />
      },
      {
        path: '/products/:productId',
        element: <ProductDisplay />
      },
      {
        path: '/products/',
        element: <ProductIndex />
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
  return <RouterProvider router={router} />;
};

export default App;