import { Link } from 'react-router-dom';
import CampaignDisplay from '../campaign_display/CampaignDisplay';
import ProductCarousel from '../product_carousel/ProductCarousel';
import './HomePage.css';

const HomePage = () => {
    return (
        <>
            <CampaignDisplay />
            <div className="campaign-message">
                <h3 className='campaign-text-small'>
                    Sike Pegasus 41
                </h3>
                <h1 className='campaign-text-large'>
                    DON´T WASTE <br/> YOUR ENERGY
                </h1>
                <h3 className='campaign-text-small'>
                    Run in Pegasus. Feel the responsive energy return of Air Zoom and all-new ReactX foam. 
                </h3>
                <Link to="/products/255" className="shop-btn">
                    Shop
                </Link>
            </div>
            <ProductCarousel />
        </>
    )
}

export default HomePage