import CampaignDisplay from '../campaign_display/CampaignDisplay';
import ProductCarousel from '../product_carousel/ProductCarousel';
import './HomePage.css';

const HomePage = () => {
    return (
        <>
            <CampaignDisplay />
            <div className="homepage-spacer"/>
            <ProductCarousel />
        </>
    )
}

export default HomePage