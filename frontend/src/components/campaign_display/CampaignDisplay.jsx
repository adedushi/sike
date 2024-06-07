import { Link } from 'react-router-dom'
import './CampaignDisplay.css'
import splash from './splash.jpg'

const CampaignDisplay = () => {
    return (
        <div className='main-campaign'>
            <Link to="/products/255">
                <img src={splash} alt="Main Campaign Banner" className="banner-image" />
            </Link>
        </div>
    )
}

export default CampaignDisplay