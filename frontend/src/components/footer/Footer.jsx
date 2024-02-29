import './Footer.css'
import github from './github.svg'
import linkedin from './linkedin.svg'

const Footer = () => {

    return (
        <footer>
            <div className='footer-text'>
                <h3>Created by <span> <a className='footer-website' href='https://adedushi.com' rel='noopener noreferrer'>Albert Dedushi </a></span></h3>
                <h3>For educational purposes</h3>
                <h3>All images and logos are property of Nike</h3>
            </div>
            <div className='footer-links'>
                <a href='https://github.com/adedushi/sike' rel='noopener noreferrer'> <img src={github} alt='GitHub' /> </a>
                <a href='https://linkedin.com/in/adedushi' rel='noopener noreferrer'> <img src={linkedin} alt='LinkedIn'/> </a>
                
            </div>
        </footer>
    );
};

export default Footer