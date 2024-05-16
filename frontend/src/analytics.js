import ReactGA from 'react-ga4';

export const initGA = (measurementID) => {
    ReactGA.initialize(measurementID);
};

export const logPageView = () => {
    ReactGA.send({ hitType: 'pageview', page: window.location.pathname });
};