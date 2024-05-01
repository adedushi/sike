import { useEffect, useRef, useState } from "react";
import { useDispatch, useSelector } from "react-redux"
import { clearProducts, fetchProducts } from "../../store/products";
import { Link, useSearchParams } from "react-router-dom"
import { createSelector } from 'reselect';
import './ProductIndex.css'
import logo from '../nav_bar/logo.svg'

const ProductIndex = () => {
    const dispatch = useDispatch();
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState(null);
    const [searchParams] = useSearchParams();
    const divisionParam = searchParams.get("division");
    const categoryParam = searchParams.get("category");
    const subCategoryParam = searchParams.get("sub_category");
    const [fetchParams, setFetchParams] = useState({ division: null, category: null, sub_category: null, page: 1});
    const observerRef = useRef(null);

    const productsSelector = state => state.products.products;
    const selectProductsArray = createSelector(productsSelector, (products) => Object.values(products || {}));
    const products = useSelector(selectProductsArray);
    const pagination = useSelector(state => state.products.pagination)

    useEffect(() => {
        if (divisionParam !== fetchParams.division ||
            categoryParam !== fetchParams.category ||
            subCategoryParam !== fetchParams.sub_category) {
            dispatch(clearProducts());
            setFetchParams({
                division: divisionParam,
                category: categoryParam,
                sub_category: subCategoryParam,
                page: 1
            });
        } else if (divisionParam || categoryParam || subCategoryParam) {
            setIsLoading(true);
            const filters = {
                division: fetchParams.division,
                category: fetchParams.category,
                sub_category: fetchParams.sub_category
            };

            dispatch(fetchProducts(filters, fetchParams.page))
                .then(() => setIsLoading(false))
                .catch(err => {
                    setError(err);
                    setIsLoading(false);
                });
        }
    }, [divisionParam, categoryParam, subCategoryParam, fetchParams, dispatch]);


    useEffect(() => {
        const observer = new IntersectionObserver( (entries) => {
                if (entries[0].isIntersecting && fetchParams.page < pagination.totalPages) {
                    setFetchParams(prevParams => ({ ...prevParams, page: prevParams.page + 1 }));
                }
            },
            { threshold: 0.1 }
        );

        const currentObserverRef = observerRef.current;
        if (currentObserverRef) {
            observer.observe(currentObserverRef);
        }

        return () => {
            if (currentObserverRef) {
                observer.unobserve(currentObserverRef);
            }
        };
    }, [isLoading, fetchParams]);


    if (error) {
        return <div>Error: {error.status} We can&apos;t retreive any products. Sorry for the inconvenience.</div>;
    }

    const USDollar = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 0
    });

return (
    <>
            <div className="header-offset"></div>
            <div className="products-page">
                <aside className="filter-sidebar">
                </aside>

                <section className="product-grid">
                    {products.length > 0 && products.map((product) => (
                        <div key={product.id} className="product-item" >
                            <Link to={`/products/${product.id}`} className="product-item-link">
                                <img src={product.photosUrl ? product.photosUrl[0] : null} alt={product.name}></img>
                                <h3 className="product-index-name"> {product.name} </h3>
                                <h3 className="product-index-subtitle"> {product.subtitle} </h3>
                                {product.salePrice ? (
                                    <>
                                        <h3 className="product-index-price">
                                            {USDollar.format(product.salePrice)}
                                            <span className="product-index-price--sale">
                                                {USDollar.format(product.listPrice)}
                                            </span>
                                        </h3>
                                        <h3 className="product-sale-percent">{((1 - product.salePrice / product.listPrice) * 100).toFixed(0)}% off</h3>
                                    </>
                                ) : (
                                    <h3 className="product-index-price">{USDollar.format(product.listPrice)}</h3>
                                )}
                                <br />
                            </Link>
                        </div>
                    ))}
                    {isLoading && <div className="loading-container">
                        <img src={logo} alt="loading-swoosh" className="loading-svg" />
                    </div>}
                    <div ref={observerRef} className="loading-indicator"></div>
                </section>
            </div>
        </>
    );
}

export default ProductIndex