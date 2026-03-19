<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.models.Product" %>
<%@ page import="com.dao.ProductDAO" %>
<%
    List<Product> products = null;
    String errorMessage = null;
    try {
        products = (List<Product>) request.getAttribute("products");
        if (products == null) {
            ProductDAO productDAO = new ProductDAO();
            products = productDAO.getAllProducts();
        }
    } catch (Throwable t) {
        errorMessage = t.getMessage() != null ? t.getMessage() : t.toString();
        t.printStackTrace();
    }
%>
<style>
    /* ── Product Grid ── */
    .product-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 16px;
    }

    .product-card {
        background: #1e293b;
        border-radius: 10px;
        overflow: hidden;
        transition: transform 0.2s, box-shadow 0.2s;
        height: 100%;
        display: flex;
        flex-direction: column;
    }

    .product-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
    }

    .card-img-wrap {
        position: relative;
        height: 170px;
        overflow: hidden;
    }

    .card-img-wrap img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .cat-badge {
        position: absolute;
        top: 8px;
        right: 8px;
        background: rgba(15, 23, 42, 0.75);
        backdrop-filter: blur(4px);
        color: #e2e8f0;
        font-size: 10px;
        padding: 3px 8px;
        border-radius: 20px;
        font-weight: 500;
    }

    .card-body {
        padding: 12px;
        flex: 1;
        display: flex;
        flex-direction: column;
    }

    .card-body h3 {
        margin: 0 0 4px 0;
        font-size: 14px;
        color: #f1f5f9;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .card-body p {
        margin: 0 0 10px 0;
        font-size: 12px;
        color: #94a3b8;
        line-height: 1.4;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
        height: 34px;
    }

    .card-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: auto;
    }

    .price {
        color: #34d399;
        font-weight: 700;
        font-size: 15px;
    }

    .btn-cart {
        padding: 6px 12px;
        border-radius: 7px;
        border: none;
        background: linear-gradient(90deg, #6366f1, #8b5cf6);
        color: white;
        font-size: 12px;
        font-weight: 600;
        cursor: pointer;
        transition: opacity 0.2s;
    }

    .btn-cart:hover {
        opacity: 0.88;
    }
    
    .no-products {
        grid-column: span 3;
        text-align: center;
        padding: 40px;
        color: #94a3b8;
    }
</style>

<h2 style="margin: 0 0 6px 0; color: #f1f5f9;">
    <%= (request.getAttribute("selectedCategory") != null && !request.getAttribute("selectedCategory").toString().isEmpty() && !"All Categories".equalsIgnoreCase(request.getAttribute("selectedCategory").toString())) ? request.getAttribute("selectedCategory") : "All Products" %>
</h2>
<% if (errorMessage != null) { %>
    <div style="background: #fee2e2; border: 1px solid #ef4444; color: #b91c1c; padding: 12px; border-radius: 8px; margin-bottom: 24px;">
        <strong>Error:</strong> <%= errorMessage %>
    </div>
<% } %>
<p style="margin: 0 0 24px 0; color: #64748b; font-size: 14px;">Showing <%= (products != null) ? products.size() : 0 %> items</p>

<div class="product-grid">
    <% if (products == null || products.isEmpty()) { %>
        <div class="no-products">
            <p><%= (products == null) ? "An error occurred while fetching products." : "No products found matching your criteria." %></p>
        </div>
    <% } else { %>
        <% for (Product p : products) { %>
            <div class="product-card">
                <div class="card-img-wrap">
                    <img src="<%= p.getImagePath() %>" alt="<%= p.getName() %>" onerror="this.src='https://placehold.co/400x300/1e293b/cbd5e1?text=<%= p.getName() %>'">
                    <span class="cat-badge"><%= p.getCategory() %></span>
                </div>
                <div class="card-body">
                    <h3><%= p.getName() %></h3>
                    <p><%= p.getDescription() %></p>
                    <div class="card-footer">
                        <span class="price">$<%= String.format("%.2f", p.getPrice()) %></span>
                        <button class="btn-cart" onclick="addToCart(<%= p.getId() %>)">Add to Cart</button>
                    </div>
                </div>
            </div>
        <% } %>
    <% } %>
</div>

<script>
    function addToCart(productId) {
        const formData = new URLSearchParams();
        formData.append('action', 'add');
        formData.append('productId', productId);

        fetch('cart', {
            method: 'POST',
            body: formData,
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        })
        .then(response => {
            if (response.ok) {
                showToast('Added successfully!');
                updateCartBadge();
            } else {
                response.text().then(text => {
                    showToast('Error adding to cart: ' + response.status + ' ' + text);
                }).catch(() => {
                    showToast('Error adding to cart: ' + response.status);
                });
            }
        })
        .catch(error => {
            console.error('Error:', error);
            showToast('Network error adding to cart');
        });
    }

    function updateCartBadge() {
        const badge = document.getElementById('cart-badge');
        if (badge) {
            let count = parseInt(badge.textContent) || 0;
            badge.textContent = count + 1;
            badge.style.display = 'inline';
        }
    }
</script>
