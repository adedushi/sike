import { csrfFetch } from "./csrf"

const GET_RESULTS = 'search_results/GET_RESULTS'

const getResults = (results) => {
    return {
        type: GET_RESULTS,
        payload: results
    }
}

export const fetchResults = (query) => async dispatch => {
    const response = await csrfFetch(`api/products?query=${query}`)
    if (response.ok) {
        const data = await response.json();
        dispatch(getResults(data))
    }
}

const searchResultsReducer = (state = {}, action) => {
    switch (action.type) {
        case GET_RESULTS:
            return action.payload 
        default:
            return state
    }
}

export default searchResultsReducer