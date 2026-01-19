// Firebase imports
import { initializeApp } from 'firebase/app';
import { getAnalytics } from 'firebase/analytics';

// Firebase configuration - matching the Flutter app
const firebaseConfig = {
    apiKey: 'AIzaSyDfllfcVmzoLRyE-4KrrrL4wNrBD4z52B4',
    appId: '1:428129362290:web:adef0132a79d927962bdeb',
    messagingSenderId: '428129362290',
    projectId: 'andrewedgar-io',
    authDomain: 'andrewedgar-io.firebaseapp.com',
    storageBucket: 'andrewedgar-io.firebasestorage.app',
    measurementId: 'G-1JZPDEE9KH',
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);

// Portfolio projects data
interface Project {
    title: string;
    description: string;
    imageUrl: string;
    tags: string;
    link: string;
}

const projects: Project[] = [

    {
        title: 'Maypole',
        description: 'Maypole is a location-based messaging app that allows users to enter chat rooms connected to every physical location in Google\'s Place Database, and DM anyone they meet there. After originally writing Maypole as my first project of my Android portfolio, I rebuilt it to be cross-platform using Flutter with MVVM architecture & Riverpods, Firebase Cloud Firestore, Cloud Functions, the Google Places API, Google AdMob, and Hive for content moderation. Maypole is currently available on Android, iOS, and web, with experiments happening on MacOS, Windows, and Linux! Maypole is deployed to web and the app stores across various tracks using GitHub Actions for CI/CD.',
        imageUrl: 'https://firebasestorage.googleapis.com/v0/b/andrewedgar-io.firebasestorage.app/o/maypolebannerlogo.png?alt=media&token=73641b89-d4d2-4680-b108-1e116b645fdc',
        tags: 'Flutter, Dart, Firebase, Google Cloud, Google Places API, AdMob, CI/CD, Android, iOS, Web',
        link: 'https://maypole.app/'
    },
    {
        title: 'MyTelus AI chatbot',
        description: 'I integrated AI into the Android client of Telus\'s customer service chat bot built with Amazon Connect, and made the service cross-platform for syncing with iOS and web.',
        imageUrl: 'https://firebasestorage.googleapis.com/v0/b/andrewedgar-io.firebasestorage.app/o/mytelus.png?alt=media&token=f91ff892-faec-4488-91c4-ff1974b6b51a',
        tags: 'Android, AI, Amazon Connect',
        link: 'https://play.google.com/store/apps/details?id=com.telus.myaccount&pcampaignid=web_share'
    },
    {
        title: 'MySynchrony Mobile App',
        description: 'My team and I built the 4.0 version of the MySynchrony mobile app, which allows Synchrony customers with multiple branded credit cards to manage all of them in one place. This update involved a complete refactor of the app to Jetpack Compose and MVVM architecture, a variety of feature work, and a significant increase in test coverage.',
        imageUrl: 'https://firebasestorage.googleapis.com/v0/b/andrewedgar-io.firebasestorage.app/o/Untitled.png?alt=media&token=66f632c7-306d-4d2c-94d7-7b6e5df1cfd1',
        tags: 'Native Android, Kotlin, Jetpack Compose, MVVM, Dagger',
        link: 'https://play.google.com/store/apps/details?id=com.syf.mysynchrony&hl=en_US'
    },
    {
        title: 'Spectrum News App',
        description: 'I worked with a team of Android engineers at Spectrum to add a variety of features to the Politics section of their news app in time for the 2022 election. By far the most sophisticated and popular app I\'d worked on at that point, this assignment demanded I gain an even deeper understanding of Android architecture and building scalable mobile apps',
        imageUrl: 'https://firebasestorage.googleapis.com/v0/b/andrewedgar-io.firebasestorage.app/o/unnamed.webp?alt=media&token=10adcad4-aa42-4574-a39e-ed09f1b7a415',
        tags: 'Native Android, Kotlin, Jetpack Compose, MVVM',
        link: 'https://play.google.com/store/apps/details?id=com.twcable.twcnews&hl=en_US&gl=US'
    },
    {
        title: 'WeAre8',
        description: 'I was the lead developer for the Android client of WeAre8, a pay-per-response advertising platform that rewards users with money for themselves and nonprofits. This project was my first experience building in Jetpack Compose and MVVM, and I was able to build the 2.0 version of the app almost from the ground up.',
        imageUrl: 'https://firebasestorage.googleapis.com/v0/b/andrewedgar-io.firebasestorage.app/o/screenshot-www.weare8.com-2021.02.04-17_16_42.png?alt=media&token=9a743da6-be44-4f6c-9f9a-cadce9a8838b',
        tags: 'Native Android, Kotlin',
        link: 'https://play.google.com/store/apps/details?id=com.eight.app&hl=en_US'
    },
    {
        title: 'MyKey TVM',
        description: 'My first professional project was the software for a ticket vending machine made for IndyGo, Indianapolis\'s public transportation agency. My employer, Flowbird, built an account-based ticketing solution called MyKey for Indy\'s new express bus line, of which this machine is a key part. Having to work with proprietary hardware and our custom fork of open-source Android taught me a lot about working with low-level APIs, and developing such a complex app forced me improve my coding style and learn more about proper Android architecture. Naturally, I also had to learn a lot about encryption and security to make the machine process payments and pass updated account info to the backend.',
        imageUrl: 'https://firebasestorage.googleapis.com/v0/b/andrewedgar-io.firebasestorage.app/o/indygo-1024x727.png?alt=media&token=283b8ccf-50e2-476c-8b92-5953a269ed05',
        tags: 'Native Android, Kotlin, AOSP, Embedded',
        link: 'https://www.indygo.net/'
    },

];

// Smooth scroll to section
function scrollToSection(sectionId: string): void {
    const section = document.getElementById(sectionId);
    if (section) {
        section.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
}

// Create portfolio item HTML
function createPortfolioItem(project: Project): HTMLElement {
    const item = document.createElement('div');
    item.className = 'portfolio-item';
    
    const tagsList = project.tags.split(',').map(tag => tag.trim());
    const tagsHTML = tagsList.map(tag => `<span class="tag">${tag}</span>`).join('');
    
    item.innerHTML = `
        <div class="portfolio-item-content">
            <div class="portfolio-image-container">
                <img src="${project.imageUrl}" alt="${project.title}" class="portfolio-image" loading="lazy">
            </div>
            <h3 class="portfolio-item-title">${project.title}</h3>
            <p class="portfolio-item-description">${project.description}</p>
            <div class="portfolio-tags">
                ${tagsHTML}
            </div>
        </div>
    `;
    
    item.addEventListener('click', () => {
        window.open(project.link, '_blank', 'noopener,noreferrer');
    });
    
    return item;
}

// Initialize portfolio grid
function initializePortfolio(): void {
    const grid = document.getElementById('portfolio-grid');
    if (grid) {
        projects.forEach(project => {
            const item = createPortfolioItem(project);
            grid.appendChild(item);
        });
    }
}

// Handle navigation
function initializeNavigation(): void {
    // Desktop navigation
    const navButtons = document.querySelectorAll('.nav-button');
    navButtons.forEach(button => {
        button.addEventListener('click', (e) => {
            const target = (e.target as HTMLElement).dataset.target;
            if (target) {
                scrollToSection(target);
            }
        });
    });
    
    // Mobile drawer navigation
    const drawerItems = document.querySelectorAll('.drawer-item');
    const drawer = document.getElementById('drawer');
    const drawerOverlay = document.getElementById('drawer-overlay');
    const hamburger = document.getElementById('hamburger');
    
    drawerItems.forEach(item => {
        item.addEventListener('click', (e) => {
            const target = (e.target as HTMLElement).dataset.target;
            if (target) {
                scrollToSection(target);
                closeDrawer();
            }
        });
    });
    
    // Hamburger menu toggle
    if (hamburger && drawer && drawerOverlay) {
        hamburger.addEventListener('click', () => {
            drawer.classList.toggle('open');
            drawerOverlay.classList.toggle('visible');
        });
        
        drawerOverlay.addEventListener('click', closeDrawer);
    }
    
    function closeDrawer(): void {
        if (drawer && drawerOverlay) {
            drawer.classList.remove('open');
            drawerOverlay.classList.remove('visible');
        }
    }
}

// Set current year in footer
function setCurrentYear(): void {
    const yearElement = document.getElementById('current-year');
    if (yearElement) {
        yearElement.textContent = new Date().getFullYear().toString();
    }
}

// Initialize everything when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    initializePortfolio();
    initializeNavigation();
    setCurrentYear();
    
    // Log Firebase initialization
    console.log('Firebase app initialized:', app.name);
});
