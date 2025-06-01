<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MixyOx - Premium Modded Apps</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #0f0c29, #1a1a2e, #16213e);
            color: #f0f0f0;
            min-height: 100vh;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 40px;
            overflow-x: hidden;
            position: relative;
        }
        
        .container {
            max-width: 1200px;
            width: 100%;
            margin: 0 auto;
            position: relative;
            z-index: 2;
        }
        
        /* Particles background */
        #particles-js {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 1;
        }
        
        /* Header Styles */
        header {
            text-align: center;
            margin-bottom: 40px;
            padding: 20px;
            animation: fadeIn 1s ease;
            position: relative;
        }
        
        .logo {
            font-size: 4.5rem;
            font-weight: 800;
            background: linear-gradient(45deg, #ff8a00, #e52e71, #22c1c3);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            letter-spacing: 3px;
            margin-bottom: 10px;
            text-shadow: 0 2px 15px rgba(0,0,0,0.3);
            position: relative;
            display: inline-block;
        }
        
        .logo::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80%;
            height: 4px;
            background: linear-gradient(90deg, #ff8a00, #e52e71, #22c1c3);
            border-radius: 10px;
        }
        
        .subtitle {
            font-size: 1.2rem;
            opacity: 0.9;
            letter-spacing: 4px;
            text-transform: uppercase;
            font-weight: 300;
            margin-top: 15px;
            color: #22c1c3;
        }
        
        /* Section Header */
        .section-header {
            background: rgba(0, 0, 0, 0.4);
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 30px;
            border: 1px solid rgba(255,255,255,0.15);
            box-shadow: 0 12px 25px rgba(0,0,0,0.4);
            backdrop-filter: blur(5px);
            text-align: center;
        }
        
        .section-title {
            font-size: 2.5rem;
            font-weight: 700;
            background: linear-gradient(45deg, #ff8a00, #e52e71);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 10px;
        }
        
        .section-desc {
            font-size: 1.1rem;
            opacity: 0.9;
            line-height: 1.6;
            max-width: 800px;
            margin: 0 auto;
        }
        
        /* Apps Grid */
        .apps-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            margin-top: 30px;
        }
        
        .app-card {
            background: rgba(30, 30, 46, 0.7);
            border-radius: 18px;
            padding: 30px;
            display: flex;
            flex-direction: column;
            border: 1px solid rgba(255,255,255,0.1);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
            position: relative;
            overflow: hidden;
        }
        
        .app-card::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
            transform: rotate(30deg);
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        
        .app-card:hover {
            transform: translateY(-10px);
            background: rgba(40, 40, 60, 0.85);
            box-shadow: 0 15px 30px rgba(0,0,0,0.5);
            border-color: rgba(255,255,255,0.2);
        }
        
        .app-card:hover::before {
            opacity: 1;
        }
        
        .app-name {
            font-size: 1.7rem;
            font-weight: 600;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            z-index: 2;
        }
        
        .app-name i {
            margin-right: 15px;
            font-size: 2rem;
            background: linear-gradient(45deg, #ff8a00, #e52e71);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }
        
        .free-badge {
            background: linear-gradient(45deg, #00c853, #64dd17);
            color: white;
            font-size: 0.9rem;
            padding: 4px 12px;
            border-radius: 20px;
            margin-left: auto;
            font-weight: 600;
            text-transform: uppercase;
            box-shadow: 0 2px 8px rgba(0,200,83,0.3);
        }
        
        .app-description {
            font-size: 0.95rem;
            opacity: 0.8;
            line-height: 1.6;
            margin-bottom: 25px;
            flex-grow: 1;
            z-index: 2;
        }
        
        .download-btn {
            background: linear-gradient(45deg, #22c1c3, #2e71e5);
            color: white;
            border: none;
            padding: 14px 25px;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            z-index: 2;
            text-decoration: none;
        }
        
        .download-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 7px 20px rgba(0,0,0,0.4);
            background: linear-gradient(45deg, #2e71e5, #22c1c3);
        }
        
        .download-btn i {
            margin-right: 10px;
            font-size: 1.2rem;
        }
        
        .password-btn {
            background: linear-gradient(45deg, #e52e71, #ff8a00);
            color: white;
            border: none;
            padding: 14px 25px;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            z-index: 2;
            text-decoration: none;
            margin-top: 20px;
            width: 100%;
        }
        
        .password-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 7px 20px rgba(0,0,0,0.4);
            background: linear-gradient(45deg, #ff8a00, #e52e71);
        }
        
        /* Social Media */
        .social-container {
            display: flex;
            justify-content: center;
            gap: 25px;
            margin-top: 40px;
            flex-wrap: wrap;
        }
        
        .social-btn {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            color: white;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            position: relative;
            overflow: hidden;
        }
        
        .social-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, rgba(255,255,255,0.1), transparent);
            transform: translateX(-100%);
            transition: transform 0.4s ease;
        }
        
        .social-btn:hover::before {
            transform: translateX(100%);
        }
        
        .social-btn:hover {
            transform: translateY(-5px) scale(1.1);
        }
        
        .telegram { background: linear-gradient(135deg, #0088cc, #00aced); }
        .youtube { background: linear-gradient(135deg, #ff0000, #e52d27); }
        .instagram { background: linear-gradient(135deg, #833ab4, #fd1d1d, #fcb045); }
        
        /* Footer */
        footer {
            text-align: center;
            margin-top: 60px;
            padding: 30px 20px;
            opacity: 0.8;
            font-size: 1rem;
            border-top: 1px solid rgba(255,255,255,0.1);
            width: 100%;
        }
        
        .warning {
            background: rgba(255, 100, 100, 0.15);
            padding: 20px;
            border-radius: 12px;
            margin-top: 40px;
            border: 1px solid rgba(255, 100, 100, 0.3);
            text-align: center;
            max-width: 800px;
            margin: 40px auto 0;
        }
        
        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        
        .floating {
            animation: float 4s ease-in-out infinite;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .logo {
                font-size: 3.2rem;
            }
            .section-title {
                font-size: 2rem;
            }
            .app-card {
                padding: 25px 20px;
            }
        }
        
        @media (max-width: 480px) {
            .logo {
                font-size: 2.8rem;
            }
            .section-title {
                font-size: 1.8rem;
            }
            .subtitle {
                font-size: 1rem;
                letter-spacing: 3px;
            }
        }
    </style>
</head>
<body>
    <div id="particles-js"></div>
    
    <div class="container">
        <header>
            <div class="logo floating">MixyOx</div>
            <div class="subtitle">Premium Modded Applications</div>
        </header>
        
        <div class="section-header">
            <h1 class="section-title">Exclusive Mod Collection</h1>
            <p class="section-desc">Download premium modded apps with enhanced features. All apps are unlocked and free to use.</p>
        </div>
        
        <div class="apps-grid">
            <!-- PhonePe 1 -->
            <div class="app-card">
                <div class="app-name">
                    <i class="fas fa-mobile-alt"></i>
                    PhonePe 1
                    <span class="free-badge">FREE</span>
                </div>
                <p class="app-description">Enhanced payment features with unlimited transactions.</p>
                <a href="https://www.mediafire.com/file/jfndw66u3jps328/PhonePe_1.0.apk/file" class="download-btn">
                    <i class="fas fa-download"></i> Download
                </a>
            </div>
            
            <!-- PhonePe 2 -->
            <div class="app-card">
                <div class="app-name">
                    <i class="fas fa-mobile-alt"></i>
                    PhonePe 2
                    <span class="free-badge">FREE</span>
                </div>
                <p class="app-description">Unlock premium features for seamless transactions.</p>
                <a href="https://www.mediafire.com/file/b28vja555ujxv1w/PhonePe_1.0_%25284%2529.apk/file" class="download-btn">
                    <i class="fas fa-download"></i> Download
                </a>
            </div>
            
            <!-- PhonePe 3 -->
            <div class="app-card">
                <div class="app-name">
                    <i class="fas fa-mobile-alt"></i>
                    PhonePe 3
                    <span class="free-badge">FREE</span>
                </div>
                <p class="app-description">Modified version with additional security features.</p>
                <a href="https://www.mediafire.com/file/rwn67jqchpqycag/PhonePe_1.0_%25283%2529.apk/file" class="download-btn">
                    <i class="fas fa-download"></i> Download
                </a>
            </div>
            
            <!-- PhonePe 4 -->
            <div class="app-card">
                <div class="app-name">
                    <i class="fas fa-mobile-alt"></i>
                    PhonePe 4
                    <span class="free-badge">FREE</span>
                </div>
                <p class="app-description">Latest mod with all premium features unlocked.</p>
                <a href="https://www.mediafire.com/file/tf2camewwhwi4lc/PhonePe_1.0_%25281%2529.apk/file" class="download-btn">
                    <i class="fas fa-download"></i> Download
                </a>
            </div>
            
            <!-- Paytm -->
            <div class="app-card">
                <div class="app-name">
                    <i class="fas fa-wallet"></i>
                    Paytm 
                    <span class="free-badge">FREE</span>
                </div>
                <p class="app-description">Unlock premium features and unlimited wallet balance.</p>
                <a href="https://www.mediafire.com/file/0g3bnf0mwpgbw78/FamPay_1.1.apk/file" class="download-btn">
                    <i class="fas fa-download"></i> Download
                </a>
            </div>
            
            <!-- Fampay -->
            <div class="app-card">
                <div class="app-name">
                    <i class="fas fa-credit-card"></i>
                    Fampay 
                    <span class="free-badge">FREE</span>
                </div>
                <p class="app-description">Unlocked premium features for seamless transactions.</p>
                <a href="https://www.mediafire.com/file/0g3bnf0mwpgbw78/FamPay_1.1.apk/file" class="download-btn">
                    <i class="fas fa-download"></i> Download
                </a>
            </div>
        </div>
        
        <!-- Get Password Button -->
        <div class="section-header">
            <h1 class="section-title">Need Password?</h1>
            <p class="section-desc">Some apps require a password to install. Watch this video to get the password.</p>
            <a href="https://youtu.be/5tu93Q7IFgg" class="password-btn">
                <i class="fas fa-key"></i> Get Password
            </a>
        </div>
        
        <div class="warning">
            <p>⚠️ Important: Use modded apps responsibly. Download at your own risk. We do not take responsibility for any misuse.</p>
        </div>
        
        <!-- Social Media Links -->
        <div class="social-container">
            <a href="https://t.me/mixy_ox" class="social-btn telegram">
                <i class="fab fa-telegram"></i>
            </a>
            <a href="https://youtube.com/@mixyox-1?si=VIN8Zc8c0Y70wzkp" class="social-btn youtube">
                <i class="fab fa-youtube"></i>
            </a>
            <a href="https://www.instagram.com/mixy_ox?igsh=MXNmbGo5anpjbWY4aQ==" class="social-btn instagram">
                <i class="fab fa-instagram"></i>
            </a>
        </div>
        
        <footer>
            <p>© 2025 MixyOx - All Rights Reserved</p>
        </footer>
    </div>
    
    <!-- Particles JS -->
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script>
        // Particles background
        particlesJS('particles-js', {
            particles: {
                number: { value: 80, density: { enable: true, value_area: 800 } },
                color: { value: "#ffffff" },
                shape: { type: "circle" },
                opacity: { value: 0.1, random: true },
                size: { value: 3, random: true },
                line_linked: {
                    enable: true,
                    distance: 150,
                    color: "#ffffff",
                    opacity: 0.05,
                    width: 1
                },
                move: {
                    enable: true,
                    speed: 2,
                    direction: "none",
                    random: true,
                    straight: false,
                    out_mode: "out",
                    bounce: false
                }
            },
            interactivity: {
                detect_on: "canvas",
                events: {
                    onhover: { enable: true, mode: "repulse" },
                    onclick: { enable: true, mode: "push" },
                    resize: true
                }
            },
            retina_detect: true
        });

        // Add hover effect to cards
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.app-card');
            cards.forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-10px)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0)';
                });
            });
            
            // Add animation to social buttons
            const socialButtons = document.querySelectorAll('.social-btn');
            socialButtons.forEach(btn => {
                btn.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-5px) scale(1.1)';
                });
                
                btn.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0) scale(1)';
                });
            });
        });
    </script>
</body>
</html>
