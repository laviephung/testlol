```html
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cứu Hộ & Sửa Chữa Xe Máy - Việt Trì</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Inter', sans-serif;
            background: #f8fafc;
            color: #1e293b;
            line-height: 1.6;
            overflow-x: hidden;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        @keyframes slideInLeft {
            from { transform: translateX(-50px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-15px); }
        }

        .animate-on-scroll {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.6s ease;
        }
        .animate-on-scroll.visible {
            opacity: 1;
            transform: translateY(0);
        }

        /* ===== HEADER ===== */
        header {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #334155 100%);
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 4px 20px rgba(0,0,0,0.3);
        }

        .header-top {
            background: linear-gradient(90deg, #dc2626, #b91c1c);
            padding: 10px 0;
            overflow: hidden;
        }

        .header-scroll-text {
            display: inline-block;
            color: white;
            font-weight: 600;
            font-size: 0.85rem;
            animation: scrollText 25s linear infinite;
            white-space: nowrap;
        }

        @keyframes scrollText {
            0% { transform: translateX(100vw); }
            100% { transform: translateX(-100%); }
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 70px;
        }

        .logo { display: flex; align-items: center; gap: 12px; }

        .logo-icon {
            width: 48px;
            height: 48px;
            background: linear-gradient(135deg, #dc2626, #f59e0b);
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            box-shadow: 0 4px 15px rgba(220,38,38,0.4);
        }

        .logo-text h1 { color: white; font-size: 1.1rem; font-weight: 700; }
        .logo-text span { color: #94a3b8; font-size: 0.75rem; }

        .nav-links { display: flex; gap: 30px; list-style: none; }

        .nav-links a {
            color: #cbd5e1;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
            position: relative;
            padding: 8px 0;
            font-size: 0.95rem;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background: #dc2626;
            transition: width 0.3s;
        }

        .nav-links a:hover { color: white; }
        .nav-links a:hover::after { width: 100%; }

        .menu-toggle {
            display: none;
            background: none;
            border: none;
            cursor: pointer;
            padding: 10px;
        }

        .menu-toggle span {
            display: block;
            width: 25px;
            height: 3px;
            background: white;
            margin: 5px 0;
            border-radius: 3px;
            transition: all 0.3s;
        }

        /* ===== HERO ===== */
        .hero {
            margin-top: 110px;
            background: linear-gradient(135deg, rgba(15,23,42,0.95), rgba(30,41,59,0.92));
            min-height: 95vh;
            display: flex;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -20%;
            width: 700px;
            height: 700px;
            background: radial-gradient(circle, rgba(220,38,38,0.25), transparent 70%);
            animation: pulse 4s infinite;
        }

        .hero-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 60px 20px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 60px;
            align-items: center;
            position: relative;
            z-index: 1;
        }

        .hero-text { animation: slideInLeft 0.8s ease; }

        .hero-badge {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background: rgba(220,38,38,0.15);
            border: 1px solid rgba(220,38,38,0.3);
            padding: 10px 20px;
            border-radius: 50px;
            color: #fca5a5;
            font-size: 0.85rem;
            font-weight: 600;
            margin-bottom: 25px;
        }

        .hero-badge .dot {
            width: 10px;
            height: 10px;
            background: #22c55e;
            border-radius: 50%;
            animation: pulse 1.5s infinite;
            box-shadow: 0 0 10px #22c55e;
        }

        .hero-text h2 {
            font-size: 3.2rem;
            font-weight: 900;
            color: white;
            line-height: 1.15;
            margin-bottom: 20px;
        }

        .hero-text h2 span {
            background: linear-gradient(135deg, #dc2626, #f59e0b);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .hero-text p { color: #94a3b8; font-size: 1.15rem; margin-bottom: 35px; }

        .hero-buttons { display: flex; gap: 15px; flex-wrap: wrap; }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 16px 32px;
            border-radius: 14px;
            text-decoration: none;
            font-weight: 700;
            font-size: 1rem;
            transition: all 0.3s;
            border: none;
            cursor: pointer;
        }

        .btn-primary {
            background: linear-gradient(135deg, #dc2626, #b91c1c);
            color: white;
            box-shadow: 0 10px 30px rgba(220,38,38,0.4);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(220,38,38,0.5);
        }

        .btn-secondary {
            background: rgba(255,255,255,0.1);
            color: white;
            border: 2px solid rgba(255,255,255,0.2);
        }

        .btn-secondary:hover {
            background: rgba(255,255,255,0.2);
            transform: translateY(-3px);
        }

        .hero-stats { display: flex; gap: 30px; margin-top: 50px; }

        .stat-item {
            text-align: center;
            padding: 15px 20px;
            background: rgba(255,255,255,0.05);
            border-radius: 12px;
            border: 1px solid rgba(255,255,255,0.1);
        }

        .stat-item h3 { font-size: 2rem; font-weight: 800; color: white; display: block; }
        .stat-item p { color: #64748b; font-size: 0.8rem; font-weight: 500; }

        .hero-card {
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 24px;
            padding: 35px;
            animation: fadeInUp 1s ease;
        }

        .hero-card h3 { color: white; font-size: 1.2rem; margin-bottom: 20px; }

        .quick-services { display: grid; gap: 12px; }

        .quick-service-item {
            display: flex;
            align-items: center;
            gap: 15px;
            background: rgba(255,255,255,0.06);
            padding: 16px 20px;
            border-radius: 14px;
            transition: all 0.3s;
            cursor: pointer;
        }

        .quick-service-item:hover {
            background: rgba(255,255,255,0.12);
            transform: translateX(10px);
        }

        .quick-service-icon {
            width: 48px;
            height: 48px;
            background: linear-gradient(135deg, #dc2626, #f59e0b);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            flex-shrink: 0;
        }

        .quick-service-text h4 { color: white; font-size: 0.95rem; font-weight: 600; }
        .quick-service-text p { color: #94a3b8; font-size: 0.8rem; }

        /* ===== TRUST BAR ===== */
        .trust-bar {
            background: linear-gradient(135deg, #fef3c7, #fde68a);
            padding: 30px 20px;
            border-bottom: 3px solid #f59e0b;
        }

        .trust-bar-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .trust-item {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            transition: transform 0.3s;
        }

        .trust-item:hover { transform: translateY(-3px); }

        .trust-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #f59e0b, #d97706);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            flex-shrink: 0;
        }

        .trust-text h4 { font-size: 0.95rem; font-weight: 700; color: #0f172a; }
        .trust-text p { font-size: 0.8rem; color: #64748b; }

        /* ===== SERVICES ===== */
        .services {
            padding: 100px 20px;
            background: #f8fafc;
        }

        .services-container { max-width: 1200px; margin: 0 auto; }

        .section-header { text-align: center; margin-bottom: 60px; }

        .section-tag {
            display: inline-block;
            background: rgba(220,38,38,0.1);
            color: #dc2626;
            padding: 8px 18px;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .section-header h2 {
            font-size: 2.5rem;
            font-weight: 800;
            color: #0f172a;
            margin-bottom: 15px;
        }

        .section-header p { color: #64748b; font-size: 1.1rem; max-width: 600px; margin: 0 auto; }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 25px;
        }

        .service-card {
            background: white;
            border-radius: 20px;
            padding: 35px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            transition: all 0.4s;
            border: 1px solid #e2e8f0;
            position: relative;
            overflow: hidden;
        }

        .service-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 4px;
            background: linear-gradient(90deg, #dc2626, #f59e0b);
            transform: scaleX(0);
            transition: transform 0.4s;
        }

        .service-card:hover::before { transform: scaleX(1); }

        .service-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.12);
        }

        .service-icon {
            width: 65px;
            height: 65px;
            background: linear-gradient(135deg, rgba(220,38,38,0.1), rgba(245,158,11,0.1));
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            margin-bottom: 20px;
        }

        .service-card h3 { font-size: 1.25rem; font-weight: 700; color: #0f172a; margin-bottom: 12px; }
        .service-card p { color: #64748b; font-size: 0.95rem; margin-bottom: 20px; }

        .service-price { display: flex; align-items: center; justify-content: space-between; }

        .price-tag {
            background: #fef3c7;
            color: #92400e;
            padding: 5px 14px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 0.85rem;
        }

        .service-link {
            color: #dc2626;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            transition: all 0.3s;
        }

        .service-link:hover { margin-left: 5px; }

        /* ===== PROCESS ===== */
        .process {
            background: linear-gradient(135deg, #f8fafc, #f1f5f9);
            padding: 100px 20px;
        }

        .process-container { max-width: 1200px; margin: 0 auto; }

        .process-steps {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 30px;
            margin-top: 50px;
        }

        .process-step {
            text-align: center;
            padding: 30px 20px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            transition: all 0.3s;
        }

        .process-step:hover { transform: translateY(-5px); box-shadow: 0 10px 30px rgba(0,0,0,0.1); }

        .step-number {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, #dc2626, #f59e0b);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            font-weight: 900;
            color: white;
            margin: 0 auto 20px;
            box-shadow: 0 10px 25px rgba(220,38,38,0.3);
        }

        .process-step h3 { font-size: 1.1rem; font-weight: 700; color: #0f172a; margin-bottom: 10px; }
        .process-step p { color: #64748b; font-size: 0.9rem; }

        /* ===== WHY US ===== */
        .why-us {
            background: linear-gradient(135deg, #0f172a, #1e293b);
            padding: 100px 20px;
        }

        .why-us-container { max-width: 1200px; margin: 0 auto; }
        .why-us .section-header h2 { color: white; }
        .why-us .section-header p { color: #94a3b8; }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-top: 20px;
        }

        .feature-card {
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 16px;
            padding: 30px;
            text-align: center;
            transition: all 0.3s;
        }

        .feature-card:hover { background: rgba(255,255,255,0.1); transform: translateY(-5px); }

        .feature-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #dc2626, #f59e0b);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin: 0 auto 20px;
        }

        .feature-card h3 { color: white; font-size: 1.1rem; margin-bottom: 10px; }
        .feature-card p { color: #94a3b8; font-size: 0.9rem; }

        /* ===== BRANDS ===== */
        .brands { padding: 80px 20px; background: white; }
        .brands-container { max-width: 1200px; margin: 0 auto; text-align: center; }

        .brands-grid {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 30px;
            margin-top: 40px;
        }

        .brand-item {
            width: 130px;
            height: 90px;
            background: #f8fafc;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.85rem;
            font-weight: 700;
            color: #64748b;
            border: 2px solid #e2e8f0;
            transition: all 0.3s;
            flex-direction: column;
            gap: 8px;
        }

        .brand-item:hover {
            transform: scale(1.1);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            border-color: #dc2626;
            color: #dc2626;
        }

        .brand-emoji { font-size: 1.8rem; }

        /* ===== REVIEWS ===== */
        .reviews {
            padding: 100px 20px;
            background: linear-gradient(135deg, #f8fafc, #f1f5f9);
        }

        .reviews-container { max-width: 1200px; margin: 0 auto; }

        .reviews-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 25px;
            margin-top: 50px;
        }

        .review-card {
            background: white;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            border: 1px solid #e2e8f0;
            transition: all 0.3s;
        }

        .review-card:hover { transform: translateY(-5px); box-shadow: 0 15px 35px rgba(0,0,0,0.1); }

        .review-header { display: flex; align-items: center; gap: 15px; margin-bottom: 15px; }

        .review-avatar {
            width: 55px;
            height: 55px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            font-weight: 700;
            color: white;
        }

        .review-info h4 { font-size: 1rem; font-weight: 700; color: #0f172a; }
        .review-info p { font-size: 0.8rem; color: #64748b; }

        .review-stars { margin-bottom: 15px; font-size: 1rem; }
        .review-text { color: #475569; font-size: 0.95rem; line-height: 1.7; font-style: italic; }

        .review-service {
            display: inline-block;
            background: #fef3c7;
            color: #92400e;
            padding: 4px 12px;
            border-radius: 6px;
            font-size: 0.75rem;
            font-weight: 600;
            margin-top: 12px;
        }

        /* ===== BOOKING ===== */
        .booking { padding: 100px 20px; background: white; }
        .booking-container { max-width: 900px; margin: 0 auto; }

        .booking-form {
            background: white;
            border-radius: 24px;
            padding: 50px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.08);
            border: 1px solid #e2e8f0;
        }

        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }

        .form-group { margin-bottom: 20px; }
        .form-group.full-width { grid-column: 1 / -1; }

        .form-group label {
            display: block;
            font-weight: 600;
            color: #0f172a;
            margin-bottom: 8px;
            font-size: 0.95rem;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 14px 18px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 1rem;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s;
            background: #f8fafc;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #dc2626;
            background: white;
            box-shadow: 0 0 0 4px rgba(220,38,38,0.1);
        }

        .form-group textarea { height: 120px; resize: vertical; }

        .booking-submit {
            width: 100%;
            padding: 18px;
            background: linear-gradient(135deg, #0088cc, #0077b5);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            transition: all 0.3s;
            box-shadow: 0 10px 25px rgba(0,136,204,0.3);
        }

        .booking-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(0,136,204,0.4);
        }

        /* ===== MAP ===== */
        .map-section { padding: 80px 20px; background: #f8fafc; }
        .map-container {
            max-width: 1200px;
            margin: 0 auto;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            border: 2px solid #e2e8f0;
        }

        .map-container iframe { width: 100%; height: 400px; border: none; }

        /* ===== CONTACT ===== */
        .contact { background: #f1f5f9; padding: 100px 20px; }
        .contact-container { max-width: 1200px; margin: 0 auto; }

        .contact-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-top: 50px;
        }

        .contact-card {
            background: white;
            border-radius: 16px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            transition: all 0.3s;
            border: 1px solid #e2e8f0;
        }

        .contact-card:hover { transform: translateY(-5px); box-shadow: 0 10px 30px rgba(0,0,0,0.1); }

        .contact-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin: 0 auto 15px;
        }

        .contact-icon.hotline { background: linear-gradient(135deg, #dc2626, #f59e0b); }
        .contact-icon.facebook { background: linear-gradient(135deg, #1877f2, #42a5f5); }
        .contact-icon.zalo { background: linear-gradient(135deg, #0068ff, #00a8ff); }
        .contact-icon.address { background: linear-gradient(135deg, #059669, #10b981); }

        .contact-card h3 { font-size: 1.1rem; font-weight: 700; color: #0f172a; margin-bottom: 8px; }
        .contact-card p { color: #64748b; font-size: 0.95rem; }
        .contact-card a { color: #0f172a; text-decoration: none; font-weight: 600; transition: color 0.3s; }
        .contact-card a:hover { color: #dc2626; }

        /* ===== FOOTER ===== */
        footer { background: #0f172a; color: white; padding: 60px 20px 30px; }
        .footer-container { max-width: 1200px; margin: 0 auto; }

        .footer-grid {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 40px;
            margin-bottom: 40px;
        }

        .footer-col h3 { font-size: 1.1rem; margin-bottom: 20px; color: #f8fafc; }

        .footer-col p, .footer-col a {
            color: #94a3b8;
            text-decoration: none;
            line-height: 2;
            font-size: 0.95rem;
            transition: color 0.3s;
        }

        .footer-col a:hover { color: white; }

        .footer-bottom {
            border-top: 1px solid #334155;
            padding-top: 30px;
            text-align: center;
            color: #64748b;
            font-size: 0.9rem;
        }

        /* ===== NOTIFICATION ===== */
        .live-notification {
            position: fixed;
            bottom: 100px;
            left: 30px;
            background: white;
            border-radius: 12px;
            padding: 15px 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            display: flex;
            align-items: center;
            gap: 12px;
            z-index: 998;
            transform: translateX(-120%);
            transition: transform 0.5s ease;
            max-width: 350px;
            border-left: 4px solid #22c55e;
        }

        .live-notification.show { transform: translateX(0); }

        .notification-avatar {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #22c55e, #16a34a);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
            color: white;
            flex-shrink: 0;
        }

        .notification-text h5 { font-size: 0.85rem; font-weight: 600; color: #0f172a; }
        .notification-text p { font-size: 0.75rem; color: #64748b; }
        .notification-time { font-size: 0.7rem; color: #94a3b8; white-space: nowrap; }

        /* ===== FLOATING BUTTONS ===== */
        .floating-buttons {
            position: fixed;
            bottom: 30px;
            right: 30px;
            display: flex;
            flex-direction: column;
            gap: 15px;
            z-index: 999;
        }

        .float-btn {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            color: white;
            font-size: 1.5rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.2);
            transition: all 0.3s;
            position: relative;
        }

        .float-btn:hover { transform: scale(1.1); }
        .float-btn.phone { background: linear-gradient(135deg, #dc2626, #b91c1c); animation: bounce 2s infinite; }
        .float-btn.zalo-float { background: linear-gradient(135deg, #0068ff, #00a8ff); }
        .float-btn.facebook-float { background: linear-gradient(135deg, #1877f2, #42a5f5); }

        .float-btn .tooltip {
            position: absolute;
            right: 70px;
            background: white;
            color: #0f172a;
            padding: 8px 15px;
            border-radius: 8px;
            font-size: 0.85rem;
            white-space: nowrap;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            opacity: 0;
            pointer-events: none;
            transition: all 0.3s;
        }

        .float-btn:hover .tooltip { opacity: 1; }

        /* ===== MODAL ===== */
        .modal-overlay {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.5);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 2000;
        }

        .modal-overlay.active { display: flex; }

        .modal-content {
            background: white;
            border-radius: 20px;
            padding: 40px;
            text-align: center;
            max-width: 400px;
            width: 90%;
            animation: fadeInUp 0.4s ease;
        }

        .modal-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #22c55e, #16a34a);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            margin: 0 auto 20px;
        }

        .modal-content h3 { font-size: 1.3rem; margin-bottom: 10px; }
        .modal-content p { color: #64748b; margin-bottom: 25px; }

        .modal-close {
            padding: 12px 30px;
            background: #0f172a;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 600;
            font-size: 1rem;
        }

        /* ===== RESPONSIVE ===== */
        @media (max-width: 768px) {
            .nav-links {
                display: none;
                position: absolute;
                top: 70px; left: 0;
                width: 100%;
                background: #0f172a;
                flex-direction: column;
                padding: 20px;
                gap: 15px;
            }

            .nav-links.active { display: flex; }
            .menu-toggle { display: block; }

            .hero-content { grid-template-columns: 1fr; gap: 40px; text-align: center; }
            .hero-text h2 { font-size: 2.2rem; }
            .hero-buttons { justify-content: center; }
            .hero-stats { justify-content: center; }

            .trust-bar-container { grid-template-columns: repeat(2, 1fr); }
            .services-grid { grid-template-columns: 1fr; }
            .process-steps { grid-template-columns: repeat(2, 1fr); }
            .form-grid { grid-template-columns: 1fr; }
            .booking-form { padding: 30px 20px; }
            .footer-grid { grid-template-columns: 1fr; gap: 30px; }
            .reviews-grid { grid-template-columns: 1fr; }
            .contact-grid { grid-template-columns: 1fr; }

            .floating-buttons { bottom: 20px; right: 20px; }
            .live-notification { bottom: 100px; left: 15px; max-width: 280px; }
        }

        @media (max-width: 480px) {
            .trust-bar-container { grid-template-columns: 1fr; }
            .process-steps { grid-template-columns: 1fr; }
            .hero-stats { flex-direction: column; gap: 15px; }
        }

        /* Scrollbar */
        ::-webkit-scrollbar { width: 10px; }
        ::-webkit-scrollbar-track { background: #f1f5f9; }
        ::-webkit-scrollbar-thumb { background: #94a3b8; border-radius: 5px; }
        ::-webkit-scrollbar-thumb:hover { background: #64748b; }
    </style>
</head>
<body>

    <!-- ===== HEADER ===== -->
    <header>
        <div class="header-top">
            <span class="header-scroll-text">
                🔥 UY TÍN - CHUYÊN NGHIỆP - GIÁ HỢP LÝ &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 🏍️ Cứu hộ có mặt sau 15 phút &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 📞 Hotline: 0988 000 000 &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; ⭐ Hơn 5000 khách hàng tin tưởng &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 🛡️ Bảo hành 6 tháng &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
            </span>
        </div>
        <nav class="nav-container">
            <div class="logo">
                <div class="logo-icon">🏍️</div>
                <div class="logo-text">
                    <h1>CỨU HỘ XE MÁY</h1>
                    <span>Việt Trì - Phú Thọ</span>
                </div>
            </div>
            <ul class="nav-links" id="navLinks">
                <li><a href="#home">Trang chủ</a></li>
                <li><a href="#services">Dịch vụ</a></li>
                <li><a href="#reviews">Đánh giá</a></li>
                <li><a href="#booking">Đặt lịch</a></li>
                <li><a href="#contact">Liên hệ</a></li>
            </ul>
            <button class="menu-toggle" id="menuToggle">
                <span></span><span></span><span></span>
            </button>
        </nav>
    </header>

    <!-- ===== HERO ===== -->
    <section class="hero" id="home">
        <div class="hero-content">
            <div class="hero-text">
                <div class="hero-badge">
                    <span class="dot"></span>
                    Hoạt động 24/7 - Có mặt sau 15 phút
                </div>
                <h2>Cứu Hộ & Sửa Chữa <span>Xe Máy Điện</span> Uy Tín Tại Việt Trì</h2>
                <p>Dịch vụ cứu hộ xe máy, xe máy điện tại nhà nhanh chóng, uy tín. Bảo dưỡng, sửa chữa tận nơi với đội ngũ kỹ thuật viên giàu kinh nghiệm trên 10 năm.</p>
                <div class="hero-buttons">
                    <a href="tel:0988000000" class="btn btn-primary">📞 Gọi Hotline Ngay</a>
                    <a href="#booking" class="btn btn-secondary">📅 Đặt Lịch Online</a>
                </div>
                <div class="hero-stats">
                    <div class="stat-item">
                        <h3 id="counterCustomers">0</h3>
                        <p>Khách hàng tin tưởng</p>
                    </div>
                    <div class="stat-item">
                        <h3 id="counterYears">0</h3>
                        <p>Năm kinh nghiệm</p>
                    </div>
                    <div class="stat-item">
                        <h3 id="counterRating">0</h3>
                        <p>Đánh giá 5 sao</p>
                    </div>
                </div>
            </div>
            <div class="hero-card">
                <h3>⚡ Dịch Vụ Nhanh</h3>
                <div class="quick-services">
                    <div class="quick-service-item">
                        <div class="quick-service-icon">🚨</div>
                        <div class="quick-service-text">
                            <h4>Cứu Hộ Khẩn Cấp</h4>
                            <p>Có mặt sau 15-20 phút</p>
                        </div>
                    </div>
                    <div class="quick-service-item">
                        <div class="quick-service-icon">🔧</div>
                        <div class="quick-service-text">
                            <h4>Sửa Chữa Tại Nhà</h4>
                            <p>Tiết kiệm thời gian di chuyển</p>
                        </div>
                    </div>
                    <div class="quick-service-item">
                        <div class="quick-service-icon">🔋</div>
                        <div class="quick-service-text">
                            <h4>Bảo Dưỡng Xe Điện</h4>
                            <p>Chuyên sâu xe máy điện</p>
                        </div>
                    </div>
                    <div class="quick-service-item">
                        <div class="quick-service-icon">🛢️</div>
                        <div class="quick-service-text">
                            <h4>Thay Nhớt & Phụ Tùng</h4>
                            <p>Hàng chính hãng, giá tốt</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== TRUST BAR ===== -->
    <div class="trust-bar">
        <div class="trust-bar-container">
            <div class="trust-item">
                <div class="trust-icon">🛡️</div>
                <div class="trust-text">
                    <h4>Bảo Hành 6 Tháng</h4>
                    <p>Tất cả dịch vụ</p>
                </div>
            </div>
            <div class="trust-item">
                <div class="trust-icon">✅</div>
                <div class="trust-text">
                    <h4>Giá Niêm Yết</h4>
                    <p>Không phát sinh</p>
                </div>
            </div>
            <div class="trust-item">
                <div class="trust-icon">🏆</div>
                <div class="trust-text">
                    <h4>Top 1 Việt Trì</h4>
                    <p>Được bình chọn</p>
                </div>
            </div>
            <div class="trust-item">
                <div class="trust-icon">📜</div>
                <div class="trust-text">
                    <h4>Đăng Ký KD</h4>
                    <p>Hoàn toàn hợp pháp</p>
                </div>
            </div>
        </div>
    </div>

    <!-- ===== SERVICES ===== -->
    <section class="services" id="services">
        <div class="services-container">
            <div class="section-header animate-on-scroll">
                <span class="section-tag">🔧 DỊCH VỤ CỦA CHÚNG TÔI</span>
                <h2>Giải Pháp Toàn Diện Cho Xe Của Bạn</h2>
                <p>Đội ngũ kỹ thuật viên chuyên nghiệp, trang thiết bị hiện đại, phục vụ tận tâm</p>
            </div>
            <div class="services-grid">
                <div class="service-card animate-on-scroll">
                    <div class="service-icon">🚨</div>
                    <h3>Cứu Hộ Xe Máy</h3>
                    <p>Xe chết máy giữa đường, hỏng ắc quy, thủng săm? Gọi là có! Chúng tôi có mặt nhanh chóng.</p>
                    <div class="service-price">
                        <span class="price-tag">Từ 100K</span>
                        <a href="#booking" class="service-link">Đặt ngay →</a>
                    </div>
                </div>
                <div class="service-card animate-on-scroll">
                    <div class="service-icon">🔧</div>
                    <h3>Sửa Chữa Đa Năng</h3>
                    <p>Sửa chữa mọi bệnh: động cơ, điện, phanh, gầm, hệ thống chiếu sáng...</p>
                    <div class="service-price">
                        <span class="price-tag">Từ 50K</span>
                        <a href="#booking" class="service-link">Đặt ngay →</a>
                    </div>
                </div>
                <div class="service-card animate-on-scroll">
                    <div class="service-icon">🔋</div>
                    <h3>Bảo Dưỡng Xe Điện</h3>
                    <p>Bảo dưỡng định kỳ, kiểm tra ắc quy, motor, bộ điều khiển tối ưu.</p>
                    <div class="service-price">
                        <span class="price-tag">Từ 150K</span>
                        <a href="#booking" class="service-link">Đặt ngay →</a>
                    </div>
                </div>
                <div class="service-card animate-on-scroll">
                    <div class="service-icon">🛢️</div>
                    <h3>Thay Nhớt & Phụ Tùng</h3>
                    <p>Nhớt chính hãng, phanh, lốp, ắc quy, đèn... giá tốt nhất thị trường.</p>
                    <div class="service-price">
                        <span class="price-tag">Giá tốt nhất</span>
                        <a href="#booking" class="service-link">Đặt ngay →</a>
                    </div>
                </div>
                <div class="service-card animate-on-scroll">
                    <div class="service-icon">⚡</div>
                    <h3>Sửa Điện & Ắc Quy</h3>
                    <p>Chẩn đoán & sửa lỗi hệ thống điện, thay ắc quy, sạc ắc quy tại nhà.</p>
                    <div class="service-price">
                        <span class="price-tag">Từ 80K</span>
                        <a href="#booking" class="service-link">Đặt ngay →</a>
                    </div>
                </div>
                <div class="service-card animate-on-scroll">
                    <div class="service-icon">🏍️</div>
                    <h3>Phục Hồi & Tân Trang</h3>
                    <p>Phục hồi xe cũ, sơn sửa, tân trang toàn diện như mới.</p>
                    <div class="service-price">
                        <span class="price-tag">Báo giá riêng</span>
                        <a href="#booking" class="service-link">Đặt ngay →</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== PROCESS ===== -->
    <section class="process">
        <div class="process-container">
            <div class="section-header animate-on-scroll">
                <span class="section-tag">📋 QUY TRÌNH LÀM VIỆC</span>
                <h2>4 Bước Đơn Giản</h2>
                <p>Quy trình chuyên nghiệp, minh bạch, đảm bảo quyền lợi khách hàng</p>
            </div>
            <div class="process-steps">
                <div class="process-step animate-on-scroll">
                    <div class="step-number">1</div>
                    <h3>Liên Hệ Tư Vấn</h3>
                    <p>Gọi hotline, nhắn Zalo/Facebook hoặc đặt lịch online. Tư vấn miễn phí 24/7.</p>
                </div>
                <div class="process-step animate-on-scroll">
                    <div class="step-number">2</div>
                    <h3>Báo Giá Minh Bạch</h3>
                    <p>Kỹ thuật viên kiểm tra, báo giá chi tiết trước khi sửa. Không phát sinh chi phí.</p>
                </div>
                <div class="process-step animate-on-scroll">
                    <div class="step-number">3</div>
                    <h3>Thi Công Nhanh Gọn</h3>
                    <p>Sửa chữa tận nơi hoặc đưa về xưởng. Xử lý nhanh, đúng kỹ thuật, an toàn.</p>
                </div>
                <div class="process-step animate-on-scroll">
                    <div class="step-number">4</div>
                    <h3>Bàn Giao & Bảo Hành</h3>
                    <p>Kiểm tra lại cùng khách hàng. Bàn giao xe, cấp phiếu bảo hành dài hạn.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== WHY US ===== -->
    <section class="why-us">
        <div class="why-us-container">
            <div class="section-header animate-on-scroll">
                <span class="section-tag" style="background: rgba(255,255,255,0.1); color: #fca5a5;">⭐ TẠI SAO CHỌN CHÚNG TÔI</span>
                <h2>Cam Kết Chất Lượng Dịch Vụ</h2>
                <p>Uy tín tạo nên thương hiệu - Chất lượng làm nên sự khác biệt</p>
            </div>
            <div class="features-grid">
                <div class="feature-card animate-on-scroll">
                    <div class="feature-icon">⚡</div>
                    <h3>Nhanh Chóng</h3>
                    <p>Có mặt sau 15-20 phút. Xử lý sự cố nhanh gọn, tiết kiệm thời gian.</p>
                </div>
                <div class="feature-card animate-on-scroll">
                    <div class="feature-icon">👨‍🔧</div>
                    <h3>Kỹ Thuật Viên Giỏi</h3>
                    <p>Thợ sửa chữa 10+ năm kinh nghiệm, thông thạo mọi dòng xe.</p>
                </div>
                <div class="feature-card animate-on-scroll">
                    <div class="feature-icon">💰</div>
                    <h3>Giá Cả Hợp Lý</h3>
                    <p>Báo giá minh bạch trước khi sửa. Không phát sinh chi phí ngoài.</p>
                </div>
                <div class="feature-card animate-on-scroll">
                    <div class="feature-icon">🛡️</div>
                    <h3>Bảo Hành Dài Hạn</h3>
                    <p>Bảo hành 1-6 tháng. Yên tâm sử dụng sau khi sửa chữa.</p>
                </div>
                <div class="feature-card animate-on-scroll">
                    <div class="feature-icon">🏠</div>
                    <h3>Tận Nơi Tại Nhà</h3>
                    <p>Không cần mang xe ra tiệm. Chúng tôi đến tận nơi phục vụ.</p>
                </div>
                <div class="feature-card animate-on-scroll">
                    <div class="feature-icon">📅</div>
                    <h3>Đặt Lịch Dễ Dàng</h3>
                    <p>Đặt lịch qua form, Facebook, Zalo, Telegram. Linh hoạt giờ.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== BRANDS ===== -->
    <section class="brands">
        <div class="brands-container">
            <div class="section-header animate-on-scroll">
                <span class="section-tag">🏢 PHỤC VỤ MỌI HÃNG XE</span>
                <h2>Chuyên Sửa Chữa Đa Hãng</h2>
                <p>Phục vụ tất cả các hãng xe máy & xe máy điện phổ biến tại Việt Nam</p>
            </div>
            <div class="brands-grid animate-on-scroll">
                <div class="brand-item"><span class="brand-emoji">🔴</span>Honda</div>
                <div class="brand-item"><span class="brand-emoji">🔵</span>Yamaha</div>
                <div class="brand-item"><span class="brand-emoji">🟢</span>Suzuki</div>
                <div class="brand-item"><span class="brand-emoji">🟠</span>Sym</div>
                <div class="brand-item"><span class="brand-emoji">⚪</span>VinFast</div>
                <div class="brand-item"><span class="brand-emoji">🟡</span>Pega</div>
                <div class="brand-item"><span class="brand-emoji">🔷</span>DK Bike</div>
                <div class="brand-item"><span class="brand-emoji">🟣</span>Nijia</div>
            </div>
        </div>
    </section>

    <!-- ===== REVIEWS ===== -->
    <section class="reviews" id="reviews">
        <div class="reviews-container">
            <div class="section-header animate-on-scroll">
                <span class="section-tag">💬 ĐÁNH GIÁ KHÁCH HÀNG</span>
                <h2>Khách Hàng Nói Gì Về Chúng Tôi</h2>
                <p>Hơn 5000 khách hàng đã tin tưởng và hài lòng với dịch vụ của chúng tôi</p>
            </div>
            <div class="reviews-grid">
                <div class="review-card animate-on-scroll">
                    <div class="review-header">
                        <div class="review-avatar" style="background: linear-gradient(135deg, #6366f1, #8b5cf6);">AH</div>
                        <div class="review-info">
                            <h4>Anh Hoàng</h4>
                            <p>📍 Phường Tân Dân, Việt Trì</p>
                        </div>
                    </div>
                    <div class="review-stars">⭐⭐⭐⭐⭐</div>
                    <p class="review-text">"Xe chết máy giữa đường lúc 10h đêm, gọi hotline là 15 phút sau thợ có mặt. Sửa nhanh, giá hợp lý, rất hài lòng! Sẽ giới thiệu cho bạn bè."</p>
                    <span class="review-service">🚨 Cứu hộ khẩn cấp</span>
                </div>
                <div class="review-card animate-on-scroll">
                    <div class="review-header">
                        <div class="review-avatar" style="background: linear-gradient(135deg, #ec4899, #f43f5e);">CL</div>
                        <div class="review-info">
                            <h4>Chị Lan</h4>
                            <p>📍 Phường Gia Cẩm, Việt Trì</p>
                        </div>
                    </div>
                    <div class="review-stars">⭐⭐⭐⭐⭐</div>
                    <p class="review-text">"Đặt lịch bảo dưỡng xe điện qua Telegram rất tiện. Thợ đến đúng giờ, kiểm tra kỹ càng, thay ắc quy mới luôn tại nhà. Giá cả rất phải chăng!"</p>
                    <span class="review-service">🔋 Bảo dưỡng xe điện</span>
                </div>
                <div class="review-card animate-on-scroll">
                    <div class="review-header">
                        <div class="review-avatar" style="background: linear-gradient(135deg, #f59e0b, #d97706);">TD</div>
                        <div class="review-info">
                            <h4>Anh Dũng</h4>
                            <p>📍 Phường Thọ Sơn, Việt Trì</p>
                        </div>
                    </div>
                    <div class="review-stars">⭐⭐⭐⭐⭐</div>
                    <p class="review-text">"Sửa xe Lead tại nhà, thợ nhiệt tình, giải thích rõ lỗi và cách khắc phục. Có phiếu bảo hành 3 tháng, yên tâm hẳn. Recommend mạnh!"</p>
                    <span class="review-service">🔧 Sửa chữa tại nhà</span>
                </div>
                <div class="review-card animate-on-scroll">
                    <div class="review-header">
                        <div class="review-avatar" style="background: linear-gradient(135deg, #10b981, #059669);">MT</div>
                        <div class="review-info">
                            <h4>Chị Mai</h4>
                            <p>📍 Huyện Lâm Thao, Phú Thọ</p>
                        </div>
                    </div>
                    <div class="review-stars">⭐⭐⭐⭐⭐</div>
                    <p class="review-text">"Ở tận Lâm Thao mà vẫn gọi được cứu hộ. Thợ chạy lên tận nơi, sửa xong còn dặn dò cách bảo dưỡng xe. Phục vụ 10 điểm!"</p>
                    <span class="review-service">🛢️ Thay nhớt & phụ tùng</span>
                </div>
                <div class="review-card animate-on-scroll">
                    <div class="review-header">
                        <div class="review-avatar" style="background: linear-gradient(135deg, #3b82f6, #2563eb);">NK</div>
                        <div class="review-info">
                            <h4>Anh Khánh</h4>
                            <p>📍 Phường Minh Phương, Việt Trì</p>
                        </div>
                    </div>
                    <div class="review-stars">⭐⭐⭐⭐⭐</div>
                    <p class="review-text">"Xe VinFast Klara hết bảo hành, ắc quy yếu. Gọi là có người đến kiểm tra miễn phí, báo giá thay ắc quy mới hợp lý. Bảo hành 6 tháng."</p>
                    <span class="review-service">⚡ Sửa điện & ắc quy</span>
                </div>
                <div class="review-card animate-on-scroll">
                    <div class="review-header">
                        <div class="review-avatar" style="background: linear-gradient(135deg, #8b5cf6, #7c3aed);">TH</div>
                        <div class="review-info">
                            <h4>Chị Hương</h4>
                            <p>📍 Phường Dữu Lâu, Việt Trì</p>
                        </div>
                    </div>
                    <div class="review-stars">⭐⭐⭐⭐⭐</div>
                    <p class="review-text">"Đã dùng dịch vụ 3 lần rồi, lần nào cũng hài lòng. Đặc biệt thích cách nhắn tin qua Zalo rất tiện. Giá cả luôn hợp lý!"</p>
                    <span class="review-service">🔧 Sửa chữa đa năng</span>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== BOOKING ===== -->
    <section class="booking" id="booking">
        <div class="booking-container">
            <div class="section-header animate-on-scroll">
                <span class="section-tag">📅 ĐẶT LỊCH DỊCH VỤ</span>
                <h2>Đặt Lịch Sửa Chữa Online</h2>
                <p>Điền thông tin, chúng tôi sẽ liên hệ xác nhận và cử thợ đến đúng giờ bạn chọn</p>
            </div>
            <div class="booking-form animate-on-scroll">
                <form id="bookingForm">
                    <div class="form-grid">
                        <div class="form-group">
                            <label>👤 Họ và tên *</label>
                            <input type="text" id="customerName" placeholder="Nhập họ tên..." required>
                        </div>
                        <div class="form-group">
                            <label>📞 Số điện thoại *</label>
                            <input type="tel" id="customerPhone" placeholder="Nhập số điện thoại..." required>
                        </div>
                        <div class="form-group">
                            <label>🏍️ Loại xe *</label>
                            <select id="vehicleType" required>
                                <option value="">-- Chọn loại xe --</option>
                                <option value="Xe máy xăng">Xe máy xăng</option>
                                <option value="Xe máy điện">Xe máy điện</option>
                                <option value="Xe tay ga">Xe tay ga</option>
                                <option value="Xe côn tay">Xe côn tay</option>
                                <option value="Khác">Khác</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>🔧 Dịch vụ cần *</label>
                            <select id="serviceType" required>
                                <option value="">-- Chọn dịch vụ --</option>
                                <option value="Cứu hộ khẩn cấp">Cứu hộ khẩn cấp</option>
                                <option value="Sửa chữa tại nhà">Sửa chữa tại nhà</option>
                                <option value="Bảo dưỡng định kỳ">Bảo dưỡng định kỳ</option>
                                <option value="Thay nhớt & phụ tùng">Thay nhớt & phụ tùng</option>
                                <option value="Sửa điện & ắc quy">Sửa điện & ắc quy</option>
                                <option value="Khác">Khác</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>📅 Ngày hẹn *</label>
                            <input type="date" id="bookingDate" required>
                        </div>
                        <div class="form-group">
                            <label>🕐 Giờ hẹn *</label>
                            <input type="time" id="bookingTime" required>
                        </div>
                        <div class="form-group full-width">
                            <label>📍 Địa chỉ tại Việt Trì *</label>
                            <input type="text" id="bookingAddress" placeholder="Số nhà, đường, phường/xã..." required>
                        </div>
                        <div class="form-group full-width">
                            <label>📝 Mô tả lỗi / Yêu cầu</label>
                            <textarea id="bookingNote" placeholder="Mô tả tình trạng xe, lỗi gặp phải hoặc yêu cầu đặc biệt..."></textarea>
                        </div>
                    </div>
                    <button type="submit" class="booking-submit">✈️ Gửi Đặt Lịch Qua Telegram</button>
                </form>
            </div>
        </div>
    </section>

    <!-- ===== MAP ===== -->
    <section class="map-section">
        <div style="max-width: 1200px; margin: 0 auto;">
            <div class="section-header animate-on-scroll">
                <span class="section-tag">📍 VỊ TRÍ PHỤC VỤ</span>
                <h2>Phục Vụ Toàn Bộ Khu Vực Việt Trì</h2>
            </div>
            <div class="map-container animate-on-scroll">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d29689.34789976908!2d105.38!3d21.32!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135cc1e3b0b1b0b%3A0x1c8c5e5e5e5e5e5e!2zVmlldCBUcsOsLCBQaMO6IFRobywgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1700000000000!5m2!1svi!2s" allowfullscreen="" loading="lazy"></iframe>
            </div>
        </div>
    </section>

    <!-- ===== CONTACT ===== -->
    <section class="contact" id="contact">
        <div class="contact-container">
            <div class="section-header animate-on-scroll">
                <span class="section-tag">📞 LIÊN HỆ VỚI CHÚNG TÔI</span>
                <h2>Thông Tin Liên Hệ</h2>
                <p>Kết nối với chúng tôi qua bất kỳ kênh nào thuận tiện nhất cho bạn</p>
            </div>
            <div class="contact-grid">
                <div class="contact-card animate-on-scroll">
                    <div class="contact-icon hotline">📞</div>
                    <h3>Hotline</h3>
                    <p><a href="tel:0988000000">0988 000 000</a></p>
                    <p>Gọi điện / Nhắn tin 24/7</p>
                </div>
                <div class="contact-card animate-on-scroll">
                    <div class="contact-icon facebook">📘</div>
                    <h3>Facebook</h3>
                    <p><a href="https://facebook.com" target="_blank">Nhắn tin Facebook</a></p>
                    <p>Phản hồi trong 5 phút</p>
                </div>
                <div class="contact-card animate-on-scroll">
                    <div class="contact-icon zalo">💬</div>
                    <h3>Zalo</h3>
                    <p><a href="https://zalo.me/0988000000" target="_blank">Nhắn tin Zalo</a></p>
                    <p>Trao đổi nhanh chóng</p>
                </div>
                <div class="contact-card animate-on-scroll">
                    <div class="contact-icon address">📍</div>
                    <h3>Địa Chỉ</h3>
                    <p><strong>Việt Trì, Phú Thọ</strong></p>
                    <p>Phục vụ toàn thành phố</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== FOOTER ===== -->
    <footer>
        <div class="footer-container">
            <div class="footer-grid">
                <div class="footer-col">
                    <h3>🏍️ Cứu Hộ Xe Máy Việt Trì</h3>
                    <p>Dịch vụ cứu hộ, sửa chữa, bảo dưỡng xe máy & xe máy điện uy tín hàng đầu tại Việt Trì. Hoạt động 24/7, phục vụ tận nơi. Giấy phép kinh doanh đầy đủ.</p>
                </div>
                <div class="footer-col">
                    <h3>Dịch Vụ</h3>
                    <a href="#services">Cứu hộ khẩn cấp</a><br>
                    <a href="#services">Sửa chữa tại nhà</a><br>
                    <a href="#services">Bảo dưỡng xe điện</a><br>
                    <a href="#services">Thay nhớt & phụ tùng</a>
                </div>
                <div class="footer-col">
                    <h3>Liên Kết</h3>
                    <a href="#home">Trang chủ</a><br>
                    <a href="#services">Dịch vụ</a><br>
                    <a href="#reviews">Đánh giá</a><br>
                    <a href="#booking">Đặt lịch</a><br>
                    <a href="#contact">Liên hệ</a>
                </div>
                <div class="footer-col">
                    <h3>Giờ Làm Việc</h3>
                    <p>Thứ 2 - Chủ Nhật</p>
                    <p>24 giờ / 7 ngày</p>
                    <p>📞 0988 000 000</p>
                    <p>📍 Việt Trì, Phú Thọ</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>© 2024 Cứu Hộ Xe Máy Việt Trì. All rights reserved. | Thiết kế với ❤️ cho khách hàng</p>
            </div>
        </div>
    </footer>

    <!-- ===== LIVE NOTIFICATION ===== -->
    <div class="live-notification" id="liveNotification">
        <div class="notification-avatar">✓</div>
        <div class="notification-text">
            <h5 id="notifName">Anh Tuấn</h5>
            <p id="notifService">vừa đặt lịch cứu hộ</p>
        </div>
        <span class="notification-time" id="notifTime">2 phút trước</span>
    </div>

    <!-- ===== FLOATING BUTTONS ===== -->
    <div class="floating-buttons">
        <a href="tel:0988000000" class="float-btn phone">
            📞
            <span class="tooltip">Gọi Hotline</span>
        </a>
        <a href="https://zalo.me/0988000000" target="_blank" class="float-btn zalo-float">
            💬
            <span class="tooltip">Chat Zalo</span>
        </a>
        <a href="https://facebook.com" target="_blank" class="float-btn facebook-float">
            📘
            <span class="tooltip">Chat Facebook</span>
        </a>
    </div>

    <!-- ===== MODAL ===== -->
    <div class="modal-overlay" id="successModal">
        <div class="modal-content">
            <div class="modal-icon">✓</div>
            <h3>Đã mở Telegram!</h3>
            <p>Thông tin đặt lịch đã được chuẩn bị. Bạn chỉ cần nhấn <strong>"Gửi"</strong> trên Telegram để hoàn tất.</p>
            <button class="modal-close" onclick="closeModal()">Đã hiểu</button>
        </div>
    </div>

    <!-- ===== JAVASCRIPT ===== -->
    <script>
        // Mobile menu
        const menuToggle = document.getElementById('menuToggle');
        const navLinks = document.getElementById('navLinks');

        menuToggle.addEventListener('click', () => {
            navLinks.classList.toggle('active');
        });

        document.querySelectorAll('.nav-links a').forEach(link => {
            link.addEventListener('click', () => navLinks.classList.remove('active'));
        });

        // Smooth scroll
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({ behavior: 'smooth', block: 'start' });
                }
            });
        });

        // Set min date to today
        const dateInput = document.getElementById('bookingDate');
        const today = new Date().toISOString().split('T')[0];
        dateInput.setAttribute('min', today);

        // Scroll animations
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' });

        document.querySelectorAll('.animate-on-scroll').forEach(el => observer.observe(el));

        // Counter animation
        function animateCounter(elementId, target, suffix = '', duration = 2000) {
            const element = document.getElementById(elementId);
            let start = 0;
            const increment = target / (duration / 16);
            const isDecimal = String(target).includes('.');

            function update() {
                start += increment;
                if (start >= target) {
                    element.textContent = (isDecimal ? target.toFixed(1) : Math.floor(target).toLocaleString()) + suffix;
                    return;
                }
                element.textContent = (isDecimal ? start.toFixed(1) : Math.floor(start).toLocaleString()) + suffix;
                requestAnimationFrame(update);
            }
            update();
        }

        const heroObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    animateCounter('counterCustomers', 5000, '+');
                    animateCounter('counterYears', 10, '+');
                    animateCounter('counterRating', 4.9, '/5');
                    heroObserver.disconnect();
                }
            });
        }, { threshold: 0.3 });

        heroObserver.observe(document.querySelector('.hero'));

        // Live notifications
        const notifications = [
            { name: 'Anh Tuấn', service: 'cứu hộ khẩn cấp' },
            { name: 'Chị Mai', service: 'bảo dưỡng xe điện' },
            { name: 'Anh Đức', service: 'thay nhớt tại nhà' },
            { name: 'Chị Hương', service: 'sửa chữa xe máy' },
            { name: 'Anh Bình', service: 'thay ắc quy' },
            { name: 'Chị Nga', service: 'bảo dưỡng xe điện' },
            { name: 'Anh Khoa', service: 'cứu hộ khẩn cấp' },
            { name: 'Chị Trang', service: 'sửa điện xe máy' }
        ];

        let notifIndex = 0;

        function showNotification() {
            const notif = notifications[notifIndex % notifications.length];
            const minutes = Math.floor(Math.random() * 10) + 1;

            document.getElementById('notifName').textContent = notif.name;
            document.getElementById('notifService').textContent = `vừa đặt lịch ${notif.service}`;
            document.getElementById('notifTime').textContent = `${minutes} phút trước`;

            const el = document.getElementById('liveNotification');
            el.classList.add('show');

            setTimeout(() => el.classList.remove('show'), 4000);
            notifIndex++;
        }

        setTimeout(() => {
            showNotification();
            setInterval(showNotification, 20000);
        }, 5000);

        // Booking form
        document.getElementById('bookingForm').addEventListener('submit', function(e) {
            e.preventDefault();

            const name = document.getElementById('customerName').value;
            const phone = document.getElementById('customerPhone').value;
            const vehicle = document.getElementById('vehicleType').value;
            const service = document.getElementById('serviceType').value;
            const date = document.getElementById('bookingDate').value;
            const time = document.getElementById('bookingTime').value;
            const address = document.getElementById('bookingAddress').value;
            const note = document.getElementById('bookingNote').value;

            const formattedDate = new Date(date).toLocaleDateString('vi-VN', {
                weekday: 'long', year: 'numeric', month: 'long', day: 'numeric'
            });

            let msg = `📋 *ĐẶT LỊCH SỬA CHỮA XE MỚI*\n\n`;
            msg += `👤 *Họ tên:* ${name}\n`;
            msg += `📞 *SĐT:* ${phone}\n`;
            msg += `🏍️ *Loại xe:* ${vehicle}\n`;
            msg += `🔧 *Dịch vụ:* ${service}\n`;
            msg += `📅 *Ngày hẹn:* ${formattedDate}\n`;
            msg += `🕐 *Giờ hẹn:* ${time}\n`;
            msg += `📍 *Địa chỉ:* ${address}\n`;
            if (note) msg += `📝 *Ghi chú:* ${note}\n`;
            msg += `\n✅ _Gửi từ website Cứu Hộ Xe Máy Việt Trì_`;

            const encoded = encodeURIComponent(msg);
            const telegramUsername = 'YOUR_TELEGRAM_USERNAME';
            window.open(`https://t.me/${telegramUsername}?text=${encoded}`, '_blank');

            document.getElementById('successModal').classList.add('active');
            this.reset();
        });

        function closeModal() {
            document.getElementById('successModal').classList.remove('active');
        }

        document.getElementById('successModal').addEventListener('click', function(e) {
            if (e.target === this) closeModal();
        });

        // Header scroll
        window.addEventListener('scroll', () => {
            const header = document.querySelector('header');
            if (window.scrollY > 100) {
                header.style.boxShadow = '0 4px 30px rgba(0,0,0,0.4)';
            } else {
                header.style.boxShadow = '0 4px 20px rgba(0,0,0,0.3)';
            }
        });
    </script>
</body>
</html>
```