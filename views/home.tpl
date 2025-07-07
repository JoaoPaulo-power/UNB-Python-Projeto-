% rebase('layout', title='Concessionária Fachada')

<style>
    /* Estilos gerais */
    :root {
        --primary-color: #2c3e50;
        --secondary-color: #3498db;
        --accent-color: #e74c3c;
        --light-color: #ecf0f1;
        --dark-color: #2c3e50;
    }
    
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        color: var(--dark-color);
        line-height: 1.6;
    }
    
    /* Header moderno */
    .header {
        background-color: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 1000;
        padding: 15px 5%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
    }
    
    .logo {
        display: flex;
        align-items: center;
        text-decoration: none;
    }
    
    .logo-icon {
        font-size: 28px;
        color: var(--accent-color);
        margin-right: 10px;
    }
    
    .logo-text {
        font-size: 24px;
        font-weight: 700;
        color: var(--primary-color);
    }
    
    .logo-text span {
        color: var(--secondary-color);
    }
    
    .auth-buttons {
        display: flex;
        gap: 15px;
    }
    
    .auth-btn {
        padding: 10px 20px;
        border-radius: 30px;
        font-weight: 600;
        text-decoration: none;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }
    
    .login-btn {
        background-color: transparent;
        border: 2px solid var(--secondary-color);
        color: var(--secondary-color);
    }
    
    .login-btn:hover {
        background-color: var(--secondary-color);
        color: white;
    }
    
    .register-btn {
        background: linear-gradient(45deg, var(--accent-color), #c0392b);
        color: white;
        border: none;
    }
    
    .register-btn:hover {
        background: linear-gradient(45deg, #c0392b, var(--accent-color));
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(231, 76, 60, 0.4);
    }
    
    /* Hero Section */
    .hero {
        height: 100vh;
        background: linear-gradient(rgba(44, 62, 80, 0.8), rgba(44, 62, 80, 0.8)), 
                    url('https://images.unsplash.com/photo-1485291571150-772bcfc10da5?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');
        background-size: cover;
        background-position: center;
        display: flex;
        align-items: center;
        padding: 0 5%;
        color: white;
    }
    
    .hero-content {
        max-width: 800px;
    }
    
    .hero-title {
        font-size: 3.5rem;
        font-weight: 800;
        margin-bottom: 20px;
        line-height: 1.2;
    }
    
    .hero-subtitle {
        font-size: 1.5rem;
        margin-bottom: 30px;
        font-weight: 300;
    }
    
    .cta-buttons {
        display: flex;
        gap: 20px;
        margin-top: 30px;
    }
    
    .cta-btn {
        padding: 15px 35px;
        border-radius: 30px;
        font-weight: 600;
        text-decoration: none;
        font-size: 1.1rem;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
        gap: 10px;
    }
    
    .primary-cta {
        background: linear-gradient(45deg, var(--secondary-color), #2980b9);
        color: white;
        border: none;
    }
    
    .primary-cta:hover {
        background: linear-gradient(45deg, #2980b9, var(--secondary-color));
        transform: translateY(-3px);
        box-shadow: 0 7px 20px rgba(52, 152, 219, 0.4);
    }
    
    .secondary-cta {
        background-color: transparent;
        border: 2px solid white;
        color: white;
    }
    
    .secondary-cta:hover {
        background-color: rgba(255, 255, 255, 0.1);
    }
    
    /* Features Section */
    .features {
        padding: 100px 5%;
        background-color: var(--light-color);
    }
    
    .section-title {
        text-align: center;
        font-size: 2.5rem;
        margin-bottom: 20px;
        color: var(--primary-color);
    }
    
    .section-subtitle {
        text-align: center;
        font-size: 1.2rem;
        max-width: 800px;
        margin: 0 auto 60px;
        color: #7f8c8d;
    }
    
    .features-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 30px;
        max-width: 1200px;
        margin: 0 auto;
    }
    
    .feature-card {
        background: white;
        border-radius: 10px;
        padding: 40px 30px;
        text-align: center;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    
    .feature-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
    }
    
    .feature-icon {
        font-size: 3rem;
        color: var(--secondary-color);
        margin-bottom: 20px;
    }
    
    .feature-title {
        font-size: 1.5rem;
        margin-bottom: 15px;
        color: var(--primary-color);
    }
    
    .feature-description {
        color: #7f8c8d;
    }
    
    /* Car Showcase */
    .showcase {
        padding: 100px 5%;
        background-color: white;
    }
    
    .car-showcase {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 30px;
        max-width: 1200px;
        margin: 60px auto 0;
    }
    
    .car-card {
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
    }
    
    .car-card:hover {
        transform: translateY(-5px);
    }
    
    .car-image {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }
    
    .car-info {
        padding: 20px;
    }
    
    .car-title {
        font-size: 1.3rem;
        margin-bottom: 10px;
        color: var(--primary-color);
    }
    
    .car-details {
        display: flex;
        justify-content: space-between;
        color: #7f8c8d;
        margin-bottom: 15px;
    }
    
    .car-price {
        font-size: 1.4rem;
        font-weight: 700;
        color: var(--accent-color);
    }
    
    /* Testimonials */
    .testimonials {
        padding: 100px 5%;
        background: linear-gradient(rgba(44, 62, 80, 0.9), rgba(44, 62, 80, 0.9));
        color: white;
    }
    
    .testimonial-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 30px;
        max-width: 1200px;
        margin: 60px auto 0;
    }
    
    .testimonial-card {
        background: rgba(255, 255, 255, 0.1);
        border-radius: 10px;
        padding: 30px;
        backdrop-filter: blur(10px);
    }
    
    .testimonial-text {
        font-style: italic;
        margin-bottom: 20px;
        position: relative;
        padding-left: 30px;
    }
    
    .testimonial-text:before {
        content: """;
        font-size: 4rem;
        position: absolute;
        left: -15px;
        top: -20px;
        color: rgba(255, 255, 255, 0.2);
    }
    
    .client-info {
        display: flex;
        align-items: center;
    }
    
    .client-avatar {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background-color: var(--secondary-color);
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 15px;
        font-weight: bold;
    }
    
    .client-name {
        font-weight: 600;
    }
    
    /* Footer */
    .footer {
        background-color: var(--primary-color);
        color: white;
        padding: 60px 5% 30px;
    }
    
    .footer-content {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 40px;
        max-width: 1200px;
        margin: 0 auto;
    }
    
    .footer-logo {
        font-size: 1.8rem;
        font-weight: 700;
        margin-bottom: 20px;
    }
    
    .footer-about {
        color: #bdc3c7;
        line-height: 1.8;
    }
    
    .footer-title {
        font-size: 1.2rem;
        margin-bottom: 20px;
        position: relative;
    }
    
    .footer-title:after {
        content: '';
        position: absolute;
        left: 0;
        bottom: -10px;
        width: 50px;
        height: 2px;
        background-color: var(--secondary-color);
    }
    
    .footer-links {
        list-style: none;
        padding: 0;
    }
    
    .footer-links li {
        margin-bottom: 12px;
    }
    
    .footer-links a {
        color: #bdc3c7;
        text-decoration: none;
        transition: color 0.3s;
    }
    
    .footer-links a:hover {
        color: white;
    }
    
    .contact-info {
        color: #bdc3c7;
        margin-bottom: 15px;
        display: flex;
        align-items: flex-start;
    }
    
    .contact-icon {
        margin-right: 15px;
        color: var(--secondary-color);
    }
    
    .social-links {
        display: flex;
        gap: 15px;
        margin-top: 20px;
    }
    
    .social-link {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-color: rgba(255, 255, 255, 0.1);
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        text-decoration: none;
        transition: all 0.3s;
    }
    
    .social-link:hover {
        background-color: var(--secondary-color);
        transform: translateY(-3px);
    }
    
    .copyright {
        text-align: center;
        padding-top: 30px;
        margin-top: 50px;
        border-top: 1px solid rgba(255, 255, 255, 0.1);
        color: #7f8c8d;
    }
    
    /* Responsividade */
    @media (max-width: 768px) {
        .hero-title {
            font-size: 2.5rem;
        }
        
        .hero-subtitle {
            font-size: 1.2rem;
        }
        
        .cta-buttons {
            flex-direction: column;
        }
        
        .auth-buttons {
            flex-direction: column;
            gap: 10px;
        }
        
        .auth-btn {
            width: 100%;
            text-align: center;
            justify-content: center;
        }
    }
</style>

<header class="header">
    <a href="/" class="logo">
        <div class="logo-icon"><i class="fas fa-car"></i></div>
        <div class="logo-text">Concessionária<span>Fachada</span></div>
    </a>
    
    <div class="auth-buttons">
        <a href="/login" class="auth-btn login-btn">
            <i class="fas fa-sign-in-alt"></i> Login
        </a>
        <a href="/register" class="auth-btn register-btn">
            <i class="fas fa-user-plus"></i> Registrar
        </a>
    </div>
</header>

<main>
    <section class="hero">
        <div class="hero-content">
            <h1 class="hero-title">Encontre o carro para você</h1>
            <p class="hero-subtitle">Na Concessionária Fachada, oferecemos os melhores veículos e consertos com garantia de qualidade e o melhor atendimento do mercado.</p>
            
            <div class="cta-buttons">
                <a href="" class="cta-btn primary-cta">
                    <i class="fas fa-car"></i> Clientes
                </a>
                <a href="" class="cta-btn primary-cta">
                    <i class="fas fa-info-circle"></i> Funcionários
                </a>
            </div>
        </div>
    </section>
    
    <section class="features">
        <h2 class="section-title">Por que escolher a Concessionária Fachada?</h2>
        <p class="section-subtitle">Oferecemos uma experiência única na compra do seu veículo, com benefícios exclusivos para nossos clientes.</p>
        
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-shield-alt"></i></div>
                <h3 class="feature-title">Garantia Extendida</h3>
                <p class="feature-description">Todos os nossos veículos possuem garantia estendida para sua tranquilidade.</p>
            </div>
            
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-hand-holding-usd"></i></div>
                <h3 class="feature-title">Financiamento Facilitado</h3>
                <p class="feature-description">Parcerias com os melhores bancos para oferecer as melhores condições.</p>
            </div>
            
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-tools"></i></div>
                <h3 class="feature-title">Assistência Técnica</h3>
                <p class="feature-description">Centro técnico próprio com profissionais altamente qualificados.</p>
            </div>
        </div>
    </section>
    
    <section class="showcase">
        <h2 class="section-title">Destaques da Nossa Frota</h2>
        <p class="section-subtitle">Conheça alguns dos veículos mais procurados pelos nossos clientes.</p>
        
        <div class="car-showcase">
            <div class="car-card">
                <img src="https://images.unsplash.com/photo-1542362567-b07e54358753?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="SUV Premium" class="car-image">
                <div class="car-info">
                    <h3 class="car-title">SUV Premium 2023</h3>
                    <div class="car-details">
                        <span>Automático</span>
                        <span>25km/L</span>
                    </div>
                    <div class="car-price">R$ 189.900</div>
                </div>
            </div>
            
            <div class="car-card">
                <img src="https://images.unsplash.com/photo-1494976388531-d1058494cdd8?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="Sedan Executivo" class="car-image">
                <div class="car-info">
                    <h3 class="car-title">Sedan Executivo 2023</h3>
                    <div class="car-details">
                        <span>Automático</span>
                        <span>18km/L</span>
                    </div>
                    <div class="car-price">R$ 159.900</div>
                </div>
            </div>
            
            <div class="car-card">
                <img src="https://images.unsplash.com/photo-1503376780353-7e6692767b70?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="Pickup Robust" class="car-image">
                <div class="car-info">
                    <h3 class="car-title">Pickup Robust 2023</h3>
                    <div class="car-details">
                        <span>Manual</span>
                        <span>12km/L</span>
                    </div>
                    <div class="car-price">R$ 219.900</div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="testimonials">
        <h2 class="section-title">O que nossos clientes dizem</h2>
        <p class="section-subtitle">A satisfação dos nossos clientes é nossa maior recompensa.</p>
        
        <div class="testimonial-grid">
            <div class="testimonial-card">
                <p class="testimonial-text">Comprei meu primeiro carro na Concessionária Fachada e a experiência foi incrível! Atendimento personalizado e ótimas condições de pagamento.</p>
                <div class="client-info">
                    <div class="client-avatar">MP</div>
                    <div>
                        <div class="client-name">Marcos Pereira</div>
                        <div>Cliente desde 2022</div>
                    </div>
                </div>
            </div>
            
            <div class="testimonial-card">
                <p class="testimonial-text">Serviço de pós-venda excepcional! Levei meu carro para revisão e fui muito bem atendido. Profissionais competentes e transparentes.</p>
                <div class="client-info">
                    <div class="client-avatar">AR</div>
                    <div>
                        <div class="client-name">Ana Rodrigues</div>
                        <div>Cliente desde 2021</div>
                    </div>
                </div>
            </div>
            
            <div class="testimonial-card">
                <p class="testimonial-text">A variedade de veículos e o atendimento diferenciado me conquistaram. Já indiquei para vários amigos e todos ficaram satisfeitos.</p>
                <div class="client-info">
                    <div class="client-avatar">CS</div>
                    <div>
                        <div class="client-name">Carlos Silva</div>
                        <div>Cliente desde 2020</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<footer class="footer">
    <div class="footer-content">
        <div class="footer-column">
            <div class="footer-logo">Concessionária Fachada</div>

        
        <div class="footer-column">
            <h3 class="footer-title">Links Rápidos</h3>
            <ul class="footer-links">
                <li><a href="/">Home</a></li>
            </ul>
        </div>
        
        <div class="footer-column">
            <h3 class="footer-title">Contato</h3>
            <div class="contact-info">
                <i class="fas fa-map-marker-alt contact-icon"></i>
                <span>Av. Principal, 1234 - Centro, Brasília - DF</span>
            </div>
            <div class="contact-info">
                <i class="fas fa-phone contact-icon"></i>
                <span>(61) 3333-4444</span>
            </div>
            <div class="contact-info">
                <i class="fas fa-envelope contact-icon"></i>
                <span>contato@fachada.com.br</span>
            </div>
            <div class="contact-info">
                <i class="fas fa-clock contact-icon"></i>
                <span>Seg-Sex: 8h às 18h | Sáb: 9h às 13h</span>
            </div>
        </div>
    </div>
    
    <div class="copyright">
        &copy; 2023 Concessionária Fachada. Todos os direitos reservados.
    </div>
</footer>