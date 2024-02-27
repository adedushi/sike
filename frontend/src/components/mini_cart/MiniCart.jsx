import { toggleCartVisibility } from '../../store/ui';
import { useDispatch } from 'react-redux';

const MiniCart = ({ product, selectedSize, totalQuantity }) => {
    const dispatch = useDispatch();

    const handleClose = () => {
        dispatch(toggleCartVisibility(false));
    };

    if (!product) return null;

    const { name, subtitle, salePrice, listPrice } = product;

    return (
        <div className="mini-cart">
            <button onClick={handleClose}>Close</button>
            <div>
                <h2>{name}</h2>
                <p>{subtitle}</p>
                <p>{salePrice ? `Sale: ${salePrice}` : `Price: ${listPrice}`}</p>
                <p>Size: {selectedSize}</p>
                <p>Total Items in Bag: {totalQuantity}</p>
            </div>
        </div>
    );
};

export default MiniCart;
