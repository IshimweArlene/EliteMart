<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.models.Product" %>
<jsp:include page="header.jsp" />

<%
    List<Map<String, Object>> cartItems = (List<Map<String, Object>>) request.getAttribute("cartItems");
    Double total = (Double) request.getAttribute("total");
    
    // Redirect if direct access without servlet
    if (cartItems == null) {
        response.sendRedirect("cart");
        return;
    }
%>

<style>
    .cart-container {
        max-width: 1000px;
        margin: 40px auto;
        padding: 20px;
        background: #1e293b;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
    }

    .cart-header {
        border-bottom: 1px solid #334155;
        padding-bottom: 20px;
        margin-bottom: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .cart-header h2 {
        margin: 0;
        color: #38bdf8;
    }

    .cart-table {
        width: 100%;
        border-collapse: collapse;
    }

    .cart-table th {
        text-align: left;
        padding: 12px;
        color: #94a3b8;
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 1px;
        border-bottom: 1px solid #334155;
    }

    .cart-table td {
        padding: 20px 12px;
        border-bottom: 1px solid #334155;
    }

    .item-info {
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .item-info img {
        width: 60px;
        height: 60px;
        object-fit: cover;
        border-radius: 8px;
    }

    .item-details h4 {
        margin: 0;
        color: #f1f5f9;
        font-size: 16px;
    }

    .item-details p {
        margin: 4px 0 0 0;
        color: #64748b;
        font-size: 12px;
    }

    .quantity-badge {
        background: #334155;
        color: white;
        padding: 4px 12px;
        border-radius: 20px;
        font-size: 14px;
    }

    .cart-total {
        margin-top: 30px;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 40px;
        padding: 20px;
        background: #0f172a;
        border-radius: 10px;
    }

    .total-label {
        color: #94a3b8;
        font-size: 18px;
    }

    .total-amount {
        color: #34d399;
        font-size: 24px;
        font-weight: 700;
    }

    .btn-remove {
        background: #ef4444;
        color: white;
        border: none;
        padding: 6px 12px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 12px;
    }

    .btn-checkout {
        background: linear-gradient(90deg, #6366f1, #8b5cf6);
        color: white;
        border: none;
        padding: 12px 30px;
        border-radius: 8px;
        font-weight: 600;
        cursor: pointer;
        font-size: 16px;
    }

    .empty-cart {
        text-align: center;
        padding: 60px 20px;
        color: #94a3b8;
    }

    .btn-back {
        display: inline-block;
        margin-top: 20px;
        color: #38bdf8;
        text-decoration: none;
        font-size: 14px;
    }
</style>

<div class="cart-container">
    <div class="cart-header">
        <h2>Shopping Cart</h2>
        <% if (!cartItems.isEmpty()) { %>
            <form action="cart" method="POST" style="display:inline;">
                <input type="hidden" name="action" value="clear">
                <button type="submit" class="btn-remove" style="background:transparent; color:#64748b; border:1px solid #334155;">Clear Cart</button>
            </form>
        <% } %>
    </div>

    <% if (cartItems.isEmpty()) { %>
        <div class="empty-cart">
            <p>Your cart is empty.</p>
            <a href="index.jsp" class="btn-back">← Continue Shopping</a>
        </div>
    <% } else { %>
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (Map<String, Object> item : cartItems) { 
                    Product p = (Product) item.get("product");
                    int qty = (Integer) item.get("quantity");
                    double subtotal = (Double) item.get("subtotal");
                %>
                    <tr>
                        <td>
                            <div class="item-info">
                                <img src="<%= p.getImagePath() %>" alt="<%= p.getName() %>" onerror="this.src='https://placehold.co/100/1e293b/cbd5e1?text=<%= p.getName() %>'">
                                <div class="item-details">
                                    <h4><%= p.getName() %></h4>
                                    <p><%= p.getCategory() %></p>
                                </div>
                            </div>
                        </td>
                        <td style="color:#f1f5f9">$<%= String.format("%.2f", p.getPrice()) %></td>
                        <td>
                            <span class="quantity-badge"><%= qty %></span>
                        </td>
                        <td style="color:#34d399; font-weight:600">$<%= String.format("%.2f", subtotal) %></td>
                        <td>
                            <form action="cart" method="POST">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="productId" value="<%= p.getId() %>">
                                <button type="submit" class="btn-remove">Remove</button>
                            </form>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>

        <div class="cart-total">
            <div>
                <span class="total-label">Total:</span>
                <span class="total-amount">$<%= String.format("%.2f", total) %></span>
            </div>
            <button class="btn-checkout" onclick="location.href='checkout.jsp'">Proceed to Checkout</button>
        </div>
        
        <a href="index.jsp" class="btn-back">← Continue Shopping</a>
    <% } %>
</div>
