import { toggleCartVisibility } from '../../store/ui';
import { useDispatch } from 'react-redux';
import './MiniCart.css'
import { Link } from 'react-router-dom';
import close from './close.svg'
import checkmark from './checkmark.svg'

const MiniCart = ({ product, totalQuantity }) => {
    const dispatch = useDispatch();

    const handleClose = () => {
        dispatch(toggleCartVisibility(false));
    };

    if (!product) return null;

    const { name, subtitle, salePrice, listPrice, size, photosUrl } = product;

    const USDollar = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 0
    });

    return (
        <div className='mini-cart-container'>
        <div className="mini-cart">
            <div className='mini-cart-top'>
                <h3>
                    <img src={checkmark} alt="" className='mini-cart-checkmark' />
                    <span className='mini-cart-added-text'> Added to Bag </span>
                </h3>
                <button onClick={handleClose} className='mini-cart-close'>
                    <img src={close}/>
                </button>
            </div>
            <div className='mini-cart-content'>
                <div className='mini-cart-product'>
                    <img src={photosUrl[0]} className='mini-cart-thumbnail' />
                    <div className='mini-cart-product-details'>
                        <h3>{name}</h3>
                        <h3 className='mini-cart-product-subtitle'>{subtitle}</h3>
                        <h3 className='mini-cart-product-size'>Size: {size}</h3>
                            {salePrice ? (
                                <h3 className="mini-cart-product-price">
                                    {USDollar.format(salePrice)}
                                    <span className="mini-cart-product-price--sale">
                                        {USDollar.format(listPrice)}
                                    </span>
                                </h3>
                            ) : (
                                <h3 className="mini-cart-product-price">{USDollar.format(listPrice)}</h3>
                            )}
                        
                    </div>
                </div>
                <div className='mini-cart-buttons'>
                        <Link to='/cart'><button className='mini-cart-view-bag'>View Bag ({totalQuantity})</button></Link>
                </div>
            </div>
        </div>
        </div>
    );
};

export default MiniCart;
