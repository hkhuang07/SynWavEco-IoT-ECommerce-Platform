/**
 * ================================================
 * SYNWAVECO HOMEPAGE - LIVESHOW CAROUSEL MANAGER
 * ================================================
 * Manages featured products and articles carousels
 * with 2-second autoplay
 */

(function() {
    'use strict';

    // Configuration
    const CONFIG = {
        autoplayDelay: 2000,        // 2 seconds
        transitionSpeed: 800,       // 800ms
        enableKeyboard: true,
        enableMouseWheel: false,
        enableTouchSwipe: true
    };

    // State Management
    const state = {
        productsSwiper: null,
        articlesSwiper: null,
        isAutoplayEnabled: true
    };

    /**
     * Initialize Swiper Carousels
     */
    function initializeSwipers() {
        console.log('🚀 Initializing Swipers with config:', CONFIG);

        // Initialize Products Swiper
        const productsSwiper = document.querySelector('.hero-products-swiper');
        if (productsSwiper && typeof Swiper !== 'undefined') {
            state.productsSwiper = new Swiper(productsSwiper, {
                loop: true,
                speed: CONFIG.transitionSpeed,
                effect: 'fade',
                fadeEffect: { crossFade: true },
                autoplay: {
                    delay: CONFIG.autoplayDelay,
                    disableOnInteraction: false,
                    pauseOnMouseEnter: true
                },
                pagination: {
                    el: '.hero-products-section .swiper-pagination',
                    clickable: true,
                    type: 'bullets'
                },
                keyboard: CONFIG.enableKeyboard ? {
                    enabled: true,
                    onlyInViewport: true
                } : false
            });
            console.log('✅ Products Swiper initialized');
        }

        // Initialize Articles Swiper
        const articlesSwiper = document.querySelector('.hero-articles-swiper');
        if (articlesSwiper && typeof Swiper !== 'undefined') {
            state.articlesSwiper = new Swiper(articlesSwiper, {
                loop: true,
                speed: CONFIG.transitionSpeed,
                effect: 'fade',
                fadeEffect: { crossFade: true },
                autoplay: {
                    delay: CONFIG.autoplayDelay,
                    disableOnInteraction: false,
                    pauseOnMouseEnter: true
                },
                pagination: {
                    el: '.hero-articles-section .swiper-pagination',
                    clickable: true,
                    type: 'bullets'
                },
                keyboard: CONFIG.enableKeyboard ? {
                    enabled: true,
                    onlyInViewport: true
                } : false
            });
            console.log('✅ Articles Swiper initialized');
        }
    }

    /**
     * Setup Keyboard Controls
     */
    function setupKeyboardControls() {
        document.addEventListener('keydown', function(e) {
            if (e.key === 'ArrowLeft') {
                if (state.productsSwiper) state.productsSwiper.slidePrev();
                if (state.articlesSwiper) state.articlesSwiper.slidePrev();
            } else if (e.key === 'ArrowRight') {
                if (state.productsSwiper) state.productsSwiper.slideNext();
                if (state.articlesSwiper) state.articlesSwiper.slideNext();
            } else if (e.key === ' ') {
                e.preventDefault();
                toggleAutoplay();
            }
        });
    }

    /**
     * Toggle Autoplay
     */
    function toggleAutoplay() {
        state.isAutoplayEnabled = !state.isAutoplayEnabled;

        if (state.productsSwiper) {
            if (state.isAutoplayEnabled) {
                state.productsSwiper.autoplay.start();
            } else {
                state.productsSwiper.autoplay.stop();
            }
        }

        if (state.articlesSwiper) {
            if (state.isAutoplayEnabled) {
                state.articlesSwiper.autoplay.start();
            } else {
                state.articlesSwiper.autoplay.stop();
            }
        }
    }

    /**
     * Setup Mouse Controls
     */
    function setupMouseControls() {
        const productsSection = document.querySelector('.hero-products-section');
        const articlesSection = document.querySelector('.hero-articles-section');

        if (productsSection && state.productsSwiper) {
            productsSection.addEventListener('click', function(e) {
                const rect = productsSection.getBoundingClientRect();
                const centerX = rect.width / 2;
                const clickX = e.clientX - rect.left;

                if (clickX < centerX) {
                    state.productsSwiper.slidePrev();
                } else {
                    state.productsSwiper.slideNext();
                }
            });
        }

        if (articlesSection && state.articlesSwiper) {
            articlesSection.addEventListener('click', function(e) {
                const rect = articlesSection.getBoundingClientRect();
                const centerX = rect.width / 2;
                const clickX = e.clientX - rect.left;

                if (clickX < centerX) {
                    state.articlesSwiper.slidePrev();
                } else {
                    state.articlesSwiper.slideNext();
                }
            });
        }
    }

    /**
     * Setup Scroll Animations
     */
    function setupScrollAnimations() {
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver(function(entries) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate-visible');
                    observer.unobserve(entry.target);
                }
            });
        }, observerOptions);

        document.querySelectorAll(
            '.topic-card-item, .category-pill, .manufacturer-grid-item, .feature-card, .partnership-card-balanced'
        ).forEach(el => {
            observer.observe(el);
        });
    }

    /**
     * Main Initialization
     */
    function init() {
        // Check if Swiper is loaded
        if (typeof Swiper === 'undefined') {
            console.warn('⏳ Swiper not loaded yet, retrying in 500ms...');
            setTimeout(init, 500);
            return;
        }

        console.log('✨ Starting Liveshow Manager initialization...');
        
        // Initialize all components
        initializeSwipers();
        setupKeyboardControls();
        setupMouseControls();
        setupScrollAnimations();

        // Emit custom event
        window.dispatchEvent(new CustomEvent('liveshowInitialized', {
            detail: { state: state, config: CONFIG }
        }));

        console.log('🎉 Liveshow Manager initialized successfully!');
    }

    /**
     * Public API
     */
    window.LiveshowManager = {
        toggleAutoplay: toggleAutoplay,
        nextProduct: () => state.productsSwiper?.slideNext(),
        prevProduct: () => state.productsSwiper?.slidePrev(),
        nextArticle: () => state.articlesSwiper?.slideNext(),
        prevArticle: () => state.articlesSwiper?.slidePrev(),
        goToProduct: (index) => state.productsSwiper?.slideTo(index),
        goToArticle: (index) => state.articlesSwiper?.slideTo(index),
        getState: () => ({ ...state }),
        updateConfig: (config) => Object.assign(CONFIG, config)
    };

    // Initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();

// Add CSS animations
const style = document.createElement('style');
style.textContent = `
    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    @keyframes slideInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .animate-visible {
        animation: fadeIn 0.6s ease-in-out;
    }

    /* Swiper custom styling */
    .swiper-pagination-bullet {
        transition: all 0.3s ease;
    }

    .swiper-pagination-bullet-active {
        transition: all 0.3s ease;
    }
`;
document.head.appendChild(style);

console.log('✅ Liveshow script loaded');
