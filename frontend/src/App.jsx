import { useState, useEffect } from 'react';
import { useDispatch } from 'react-redux';
import { Outlet, createBrowserRouter, RouterProvider } from 'react-router-dom';
import TopBar from './components/top_bar';
import * as sessionActions from './store/session';
import Session from './components/session/Session';
import NavBar from './components/nav_bar';
import ProductDisplay from './components/product_display/ProductDisplay';
import ProductIndex from './components/product_index';


export const Layout = () => {
  const dispatch = useDispatch();
  const [isLoaded, setIsLoaded] = useState(false);

  useEffect(() => {
    dispatch(sessionActions.restoreSession()).then(() => {
      setIsLoaded(true)
    });
  }, [dispatch]);

  return (
    <>
      <NavBar />
      {isLoaded && <Outlet />}
    </>
  );
}

const router = createBrowserRouter([
  {
    element: <Layout />,
    children: [
      {
        path: '/',
        element: <h1>Welcome to Sike!</h1>
      },
      {
        path: 'session',
        element: <Session />
      },
      {
        path: '/products/:productId',
        element: <ProductDisplay />
      },
      {
        path: '/products/',
        element: <ProductIndex />
      }
    ]
  }
]);

const App = () => {
  return <RouterProvider router={router} />;
};

export default App;