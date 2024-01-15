import { useState, useEffect } from 'react';
import { useDispatch } from 'react-redux';
import { Outlet, createBrowserRouter, RouterProvider } from 'react-router-dom';
import TopBar from './components/top_bar';
import * as sessionActions from './store/session';
import Session from './components/session/Session';
import SignupForm from './components/session/SignupForm';

function Layout() {
  const dispatch = useDispatch();
  const [isLoaded, setIsLoaded] = useState(false);

  useEffect(() => {
    dispatch(sessionActions.restoreSession()).then(() => {
      setIsLoaded(true)
    });
  }, [dispatch]);

  return (
    <>
      <TopBar />
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
        // children: [
        //   {
        //     path: 'JoinUs',
        //     element: <SignupForm />
        //   }
        // ]
      }
    ]
  }
]);

const App = () => {
  return <RouterProvider router={router} />;
};

export default App;