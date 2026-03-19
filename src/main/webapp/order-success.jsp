<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="header.jsp" />

<style>
    .success-container {
        max-width: 600px;
        margin: 80px auto;
        text-align: center;
        background: #1e293b;
        padding: 50px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
    }

    .success-icon {
        font-size: 64px;
        color: #34d399;
        margin-bottom: 24px;
    }

    h1 {
        color: #f1f5f9;
        font-size: 32px;
        margin-bottom: 16px;
    }

    p {
        color: #94a3b8;
        font-size: 18px;
        line-height: 1.6;
        margin-bottom: 40px;
    }

    .btn-home {
        display: inline-block;
        background: linear-gradient(90deg, #6366f1, #8b5cf6);
        color: white;
        text-decoration: none;
        padding: 15px 40px;
        border-radius: 8px;
        font-weight: 600;
        transition: transform 0.2s;
    }

    .btn-home:hover {
        transform: translateY(-2px);
    }
</style>

<div class="success-container">
    <div class="success-icon">🎉</div>
    <h1>Order Placed Successfully!</h1>
    <p>
        Thank you for your purchase. Your order has been received and is being processed. 
        A confirmation email will be sent to you shortly.
    </p>
    <a href="index.jsp" class="btn-home">Continue Shopping</a>
</div>
