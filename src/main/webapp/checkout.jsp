<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.models.User" %>
<jsp:include page="header.jsp" />

<%
    User user = (User) session.getAttribute("user");
    Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
    
    // Redirect to cart if empty or to login if not authenticated
    if (cart == null || cart.isEmpty()) {
        response.sendRedirect("cart");
        return;
    }
    if (user == null) {
        response.sendRedirect("login.jsp?redirect=checkout.jsp");
        return;
    }

    // Calculate total from session in a real app, 
    // but for now we'll just show the checkout form.
%>

<style>
    .checkout-container {
        max-width: 900px;
        margin: 40px auto;
        display: grid;
        grid-template-columns: 1.5fr 1fr;
        gap: 30px;
        padding: 0 20px;
    }

    .checkout-form-section {
        background: #1e293b;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
    }

    .checkout-summary-section {
        background: #0f172a;
        padding: 30px;
        border-radius: 12px;
        border: 1px solid #334155;
        height: fit-content;
    }

    h2 {
        color: #38bdf8;
        margin-top: 0;
        margin-bottom: 24px;
        font-size: 20px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        margin-bottom: 8px;
        color: #94a3b8;
        font-size: 14px;
    }

    .form-group input, .form-group select {
        width: 100%;
        padding: 12px;
        background: #0f172a;
        border: 1px solid #334155;
        border-radius: 8px;
        color: white;
        font-family: inherit;
        box-sizing: border-box;
    }

    .form-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 15px;
    }

    .payment-options {
        display: flex;
        gap: 15px;
        margin-top: 10px;
    }

    .payment-method {
        flex: 1;
        padding: 15px;
        border: 1px solid #334155;
        border-radius: 8px;
        text-align: center;
        cursor: pointer;
        transition: all 0.2s;
        background: #1e293b;
    }

    .payment-method.active {
        border-color: #38bdf8;
        background: rgba(56, 189, 248, 0.1);
    }

    .summary-item {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
        color: #cbd5f5;
    }

    .summary-total {
        border-top: 1px solid #334155;
        padding-top: 15px;
        margin-top: 15px;
        display: flex;
        justify-content: space-between;
        font-weight: 700;
        font-size: 20px;
        color: #34d399;
    }

    .btn-pay {
        width: 100%;
        background: linear-gradient(90deg, #6366f1, #8b5cf6);
        color: white;
        border: none;
        padding: 15px;
        border-radius: 8px;
        font-weight: 600;
        cursor: pointer;
        font-size: 16px;
        margin-top: 30px;
        transition: transform 0.2s;
    }

    .btn-pay:hover {
        transform: translateY(-2px);
    }
</style>

<div class="checkout-container">
    <div class="checkout-form-section">
        <form action="checkout" method="POST">
            <h2>Shipping Information</h2>
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" value="<%= user.getFullName() %>" required>
            </div>
            <div class="form-group">
                <label>Address Line 1</label>
                <input type="text" name="address1" placeholder="Street Address" required>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>City</label>
                    <input type="text" name="city" required>
                </div>
                <div class="form-group">
                    <label>Postal Code</label>
                    <input type="text" name="zip" required>
                </div>
            </div>

            <h2 style="margin-top: 40px;">Payment Method</h2>
            <div class="payment-options">
                <div class="payment-method active" onclick="selectPayment(this)">
                    💳 Credit Card
                </div>
                <div class="payment-method" onclick="selectPayment(this)">
                    💸 Cash on Delivery
                </div>
            </div>
            <input type="hidden" name="paymentMethod" id="selected-payment" value="Credit Card">

            <div id="card-details">
                <div class="form-group" style="margin-top: 20px;">
                    <label>Card Number</label>
                    <input type="text" placeholder="0000 0000 0000 0000">
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Expiry Date</label>
                        <input type="text" placeholder="MM/YY">
                    </div>
                    <div class="form-group">
                        <label>CVV</label>
                        <input type="text" placeholder="123">
                    </div>
                </div>
            </div>

            <button type="submit" class="btn-pay">Complete Purchase</button>
        </form>
    </div>

    <div class="checkout-summary-section">
        <h2>Order Summary</h2>
        <div class="summary-item">
            <span>Items Subtotal</span>
            <span>Calculating...</span>
        </div>
        <div class="summary-item">
            <span>Shipping</span>
            <span>$0.00 (Free)</span>
        </div>
        <div class="summary-total">
            <span>Total Payable</span>
            <span>Check Cart</span>
        </div>
        <p style="color: #64748b; font-size: 12px; margin-top: 20px;">
            By completing this purchase, you agree to our Terms of Service.
        </p>
    </div>
</div>

<script>
    function selectPayment(element) {
        document.querySelectorAll('.payment-method').forEach(el => el.classList.remove('active'));
        element.classList.add('active');
        const method = element.textContent.trim().split(' ').pop();
        document.getElementById('selected-payment').value = method;
        
        const cardDetails = document.getElementById('card-details');
        if (method === 'Delivery') {
            cardDetails.style.display = 'none';
        } else {
            cardDetails.style.display = 'block';
        }
    }
</script>
