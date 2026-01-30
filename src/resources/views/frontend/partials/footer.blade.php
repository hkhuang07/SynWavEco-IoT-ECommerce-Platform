{{-- ========================================
   SYNWAVECO FRONTEND FOOTER COMPONENT
   GreenTech IoT Theme Footer
   ======================================== --}}

<footer class="bg-dark text-light-emphasis pt-5 pb-4 border-top border-success">
    <div class="container">
        {{-- Footer Top Section --}}
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4 mb-5">
            {{-- Brand & About --}}
            <div class="col">
                <div class="footer-column p-4 h-100 rounded">
                    <h5 class="mb-3 fw-bold">
                        <i class="fas fa-leaf text-success me-2"></i>{{ config('app.name', 'SynWavEco') }}
                    </h5>
                    <p class="fs-sm text-light-emphasis mb-3">
                        Leading IoT solutions for smart agriculture and sustainable technology innovation.
                    </p>
                    <div class="d-flex gap-2">
                        <a href="#" class="btn btn-icon btn-sm btn-outline-success">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="btn btn-icon btn-sm btn-outline-success">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="btn btn-icon btn-sm btn-outline-success">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a href="#" class="btn btn-icon btn-sm btn-outline-success">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                    </div>
                </div>
            </div>

            {{-- Products & Categories --}}
            <div class="col">
                <div class="footer-column p-4 h-100 rounded">
                    <h5 class="mb-4 fw-bold">
                        <i class="fas fa-box me-2"></i>Products
                    </h5>
                    <div class="d-flex flex-column gap-2">
                        <a href="{{ route('frontend.products_categories') }}" class="footer-link">
                            <i class="fas fa-chevron-right me-2"></i>All Categories
                        </a>
                        <a href="#" class="footer-link">
                            <i class="fas fa-chevron-right me-2"></i>IoT Devices
                        </a>
                        <a href="#" class="footer-link">
                            <i class="fas fa-chevron-right me-2"></i>Smart Sensors
                        </a>
                        <a href="#" class="footer-link">
                            <i class="fas fa-chevron-right me-2"></i>Control Systems
                        </a>
                        <a href="{{ route('frontend.products_manufactures') }}" class="footer-link">
                            <i class="fas fa-chevron-right me-2"></i>Manufacturers
                        </a>
                    </div>
                </div>
            </div>

            {{-- Support & Information --}}
            <div class="col">
                <div class="footer-column p-4 h-100 rounded">
                    <h5 class="mb-4 fw-bold">
                        <i class="fas fa-question-circle me-2"></i>Support
                    </h5>
                    <div class="d-flex flex-column gap-2">
                        <a href="{{ route('frontend.contact') }}" class="footer-link">
                            <i class="fas fa-phone me-2"></i>Contact Us
                        </a>
                        <a href="#" class="footer-link">
                            <i class="fas fa-map-marker-alt me-2"></i>Store Locator
                        </a>
                        <a href="#" class="footer-link">
                            <i class="fas fa-book me-2"></i>FAQs
                        </a>
                        <a href="#" class="footer-link">
                            <i class="fas fa-life-ring me-2"></i>Help Center
                        </a>
                        <a href="#" class="footer-link">
                            <i class="fas fa-headset me-2"></i>Customer Support
                        </a>
                    </div>
                </div>
            </div>

            {{-- Business & Legal --}}
            <div class="col">
                <div class="footer-column p-4 h-100 rounded">
                    <h5 class="mb-4 fw-bold">
                        <i class="fas fa-briefcase me-2"></i>Business
                    </h5>
                    <div class="d-flex flex-column gap-2">
                        <a href="{{ route('frontend.recruitment') }}" class="footer-link">
                            <i class="fas fa-users me-2"></i>Careers
                        </a>
                        <a href="#" class="footer-link">
                            <i class="fas fa-handshake me-2"></i>Partners
                        </a>
                        <a href="#" class="footer-link">
                            <i class="fas fa-file-contract me-2"></i>Terms & Conditions
                        </a>
                        <a href="#" class="footer-link">
                            <i class="fas fa-shield-alt me-2"></i>Privacy Policy
                        </a>
                        <a href="#" class="footer-link">
                            <i class="fas fa-truck me-2"></i>Shipping Info
                        </a>
                    </div>
                </div>
            </div>
        </div>

        {{-- Payment & Logistics Section --}}
        <div class="row g-4 mb-5">
            {{-- Payment Methods --}}
            <div class="col-lg-6">
                <div class="footer-column p-4 h-100 rounded">
                    <h5 class="mb-4 fw-bold">
                        <i class="fas fa-credit-card me-2"></i>Payment Methods
                    </h5>
                    <div class="d-flex flex-wrap gap-3">
                        <div class="footer-payment-item">
                            <i class="fab fa-cc-visa fa-2x text-info"></i>
                            <small>Visa</small>
                        </div>
                        <div class="footer-payment-item">
                            <i class="fab fa-cc-mastercard fa-2x text-danger"></i>
                            <small>Mastercard</small>
                        </div>
                        <div class="footer-payment-item">
                            <i class="fas fa-mobile-alt fa-2x text-success"></i>
                            <small>MoMo</small>
                        </div>
                        <div class="footer-payment-item">
                            <i class="fas fa-wallet fa-2x text-warning"></i>
                            <small>ZaloPay</small>
                        </div>
                        <div class="footer-payment-item">
                            <i class="fas fa-university fa-2x text-info"></i>
                            <small>Bank Transfer</small>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Shipping Partners --}}
            <div class="col-lg-6">
                <div class="footer-column p-4 h-100 rounded">
                    <h5 class="mb-4 fw-bold">
                        <i class="fas fa-truck me-2"></i>Shipping Partners
                    </h5>
                    <div class="d-flex flex-wrap gap-3">
                        <div class="footer-shipping-item">
                            <i class="fas fa-shipping-fast fa-2x text-success"></i>
                            <small>SPX</small>
                        </div>
                        <div class="footer-shipping-item">
                            <i class="fas fa-shipping-fast fa-2x text-primary"></i>
                            <small>Viettel Post</small>
                        </div>
                        <div class="footer-shipping-item">
                            <i class="fas fa-shipping-fast fa-2x text-danger"></i>
                            <small>J&T Express</small>
                        </div>
                        <div class="footer-shipping-item">
                            <i class="fas fa-shipping-fast fa-2x text-warning"></i>
                            <small>Grab Express</small>
                        </div>
                        <div class="footer-shipping-item">
                            <i class="fas fa-shipping-fast fa-2x text-info"></i>
                            <small>GHN Express</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- Newsletter Subscription --}}
        <div class="row mb-5">
            <div class="col-lg-8 offset-lg-2">
                <div class="footer-column p-4 rounded text-center">
                    <h5 class="mb-3 fw-bold">
                        <i class="fas fa-bell me-2"></i>Stay Updated
                    </h5>
                    <p class="text-light-emphasis mb-4">
                        Subscribe to our newsletter to receive exclusive offers and IoT farming updates.
                    </p>
                    <form class="d-flex gap-2" method="POST" action="#">
                        @csrf
                        <input type="email" class="form-control rounded-pill" placeholder="Enter your email" required>
                        <button type="submit" class="btn btn-success rounded-pill px-4 fw-bold">
                            <i class="fas fa-paper-plane me-2"></i>Subscribe
                        </button>
                    </form>
                </div>
            </div>
        </div>

        {{-- Footer Bottom --}}
        <div class="footer-bottom pt-4 border-top border-secondary">
            <div class="row mb-3">
                <div class="col-lg-8">
                    <div class="footer-links mb-3">
                        <a href="#" class="footer-link-bottom me-3">Privacy Policy</a>
                        <a href="#" class="footer-link-bottom me-3">Terms of Service</a>
                        <a href="#" class="footer-link-bottom me-3">Shipping Policy</a>
                        <a href="#" class="footer-link-bottom me-3">Return & Refund Policy</a>
                        <a href="#" class="footer-link-bottom">Accessibility</a>
                    </div>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <div class="d-flex justify-content-center justify-content-lg-end gap-3">
                        <a href="#" class="btn btn-icon btn-sm btn-outline-success">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="btn btn-icon btn-sm btn-outline-success">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="btn btn-icon btn-sm btn-outline-success">
                            <i class="fab fa-youtube"></i>
                        </a>
                        <a href="#" class="btn btn-icon btn-sm btn-outline-success">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                    </div>
                </div>
            </div>

            {{-- Copyright & Company Info --}}
            <div class="footer-company-info text-center text-light-emphasis border-top border-secondary pt-3">
                <p class="mb-2">
                    &copy; {{ date('Y') }} <strong>{{ config('app.name', 'SynWavEco') }}</strong> by 
                    <span class="text-success fw-bold">Huynh Quoc Huy</span>. All rights reserved.
                </p>
                <p class="mb-2 fs-sm">
                    <strong>{{ config('app.name', 'SynWavEco') }} Technology Company Limited</strong>
                </p>
                <p class="mb-0 fs-sm">
                    <i class="fas fa-map-marker-alt me-2"></i>
                    <span class="text-success">Long Xuyen City, An Giang, VietNam</span>
                    &nbsp;&nbsp;|&nbsp;&nbsp;
                    <i class="fas fa-file-invoice me-2"></i>
                    Tax Code: <span class="text-success">8825719470</span>
                    &nbsp;&nbsp;|&nbsp;&nbsp;
                    <i class="fas fa-envelope me-2"></i>
                    Email: <a href="mailto:info@synwaveco.com" class="text-success fw-bold">info@synwaveco.com</a>
                </p>
            </div>

            {{-- Additional Info --}}
            <div class="text-center text-light-emphasis mt-3 pt-3 fs-sm border-top border-secondary">
                <p class="mb-1">
                    <i class="fas fa-phone me-2"></i>Phone: <span class="text-success fw-bold">+84 (0) 296 3 735 836</span>
                </p>
                <p class="mb-0">
                    <i class="fas fa-clock me-2"></i>Hours: Mon - Fri, 8:00 AM - 5:00 PM (GMT+7)
                </p>
            </div>
        </div>
    </div>

    {{-- Scroll to Top Button --}}
    <div class="position-fixed bottom-0 end-0 mb-4 me-4 z-sticky">
        <button id="scrollToTopBtn" class="btn btn-success btn-lg rounded-circle shadow" 
                style="display: none; width: 50px; height: 50px; padding: 0; line-height: 1;">
            <i class="fas fa-arrow-up"></i>
        </button>
    </div>
</footer>

{{-- Footer Styles --}}
<style>
    footer {
        background: linear-gradient(135deg, #104E8B 0%, #0E3A5F 100%);
        color: rgba(255, 255, 255, 0.95);
        margin-top: 4rem;
    }

    .footer-column {
        background-color: rgba(255, 255, 255, 0.08);
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 12px;
        transition: all 0.3s ease;
    }

    .footer-column:hover {
        background-color: rgba(255, 255, 255, 0.15);
        border-color: #20B2AA;
        box-shadow: 0 8px 24px rgba(32, 178, 170, 0.2);
    }

    .footer-link,
    .footer-link-bottom {
        color: rgba(255, 255, 255, 0.85);
        text-decoration: none;
        transition: all 0.3s ease;
        display: inline-block;
    }

    .footer-link:hover,
    .footer-link-bottom:hover {
        color: #00FF7F;
        transform: translateX(4px);
    }

    .footer-payment-item,
    .footer-shipping-item {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 0.5rem;
        padding: 0.75rem;
        background-color: rgba(255, 255, 255, 0.05);
        border-radius: 8px;
        border: 1px solid rgba(255, 255, 255, 0.1);
        transition: all 0.3s ease;
        text-align: center;
    }

    .footer-payment-item:hover,
    .footer-shipping-item:hover {
        background-color: rgba(255, 255, 255, 0.1);
        border-color: #20B2AA;
        transform: translateY(-3px);
    }

    .footer-payment-item small,
    .footer-shipping-item small {
        color: rgba(255, 255, 255, 0.8);
        font-weight: 600;
        font-size: 0.75rem;
    }

    .btn-outline-success {
        border-color: #00FF7F;
        color: #00FF7F;
    }

    .btn-outline-success:hover {
        background-color: #00FF7F;
        color: #1A1A1A;
    }

    .btn-icon {
        width: 40px;
        height: 40px;
        padding: 0;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
    }

    .form-control {
        border: 1px solid #20B2AA;
        background-color: rgba(255, 255, 255, 0.95);
        color: #1A1A1A;
    }

    .form-control:focus {
        border-color: #00FF7F;
        box-shadow: 0 0 0 0.2rem rgba(0, 255, 127, 0.25);
        background-color: white;
    }

    .btn-success {
        background-color: #008B45;
        border-color: #008B45;
    }

    .btn-success:hover {
        background-color: #3CB371;
        border-color: #3CB371;
    }

    .text-success {
        color: #00FF7F !important;
    }

    .border-success {
        border-color: #00FF7F !important;
    }

    .text-light-emphasis {
        color: rgba(255, 255, 255, 0.85);
    }

    /* Scroll to Top Button */
    #scrollToTopBtn {
        opacity: 0;
        transition: opacity 0.3s ease;
        background-color: #008B45;
        border: none;
    }

    #scrollToTopBtn:hover {
        background-color: #00CD66;
        transform: translateY(-3px);
    }

    #scrollToTopBtn.show {
        opacity: 1;
        display: block !important;
    }

    /* Responsive */
    @media (max-width: 768px) {
        footer {
            padding: 2rem 0 1rem;
        }

        .footer-column {
            margin-bottom: 1.5rem;
        }

        .footer-links {
            flex-direction: column;
            gap: 0.5rem;
        }

        .footer-link-bottom {
            display: block;
            margin-bottom: 0.5rem;
        }
    }
</style>

{{-- JavaScript for Scroll to Top --}}
<script>
    const scrollToTopBtn = document.getElementById('scrollToTopBtn');

    // Show/hide button based on scroll position
    window.addEventListener('scroll', () => {
        if (window.pageYOffset > 300) {
            scrollToTopBtn.classList.add('show');
        } else {
            scrollToTopBtn.classList.remove('show');
        }
    });

    // Scroll to top on button click
    scrollToTopBtn.addEventListener('click', () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
</script>
