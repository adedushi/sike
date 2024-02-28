import './CampaignDisplay.css'
import splash from './splash.jpg'

const CampaignDisplay = () => {
    return (
    <div className='main-campaign'>
        <img src={splash} alt="Main Campaign Banner" className="banner-image" />
    </div>
    )
}

export default CampaignDisplay