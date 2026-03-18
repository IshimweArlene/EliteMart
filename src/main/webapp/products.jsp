<%@ page contentType="text/html;charset=UTF-8" %>
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
    }

    .card-body h3 {
        margin: 0 0 4px 0;
        font-size: 14px;
        color: #f1f5f9;
    }

    .card-body p {
        margin: 0 0 10px 0;
        font-size: 12px;
        color: #94a3b8;
        line-height: 1.4;
    }

    .card-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
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
</style>

<h2 style="margin: 0 0 6px 0; color: #f1f5f9;">All Products</h2>
<p style="margin: 0 0 24px 0; color: #64748b; font-size: 14px;">Showing 6 items</p>

<div class="product-grid">

    <!-- Product 1: Smartwatch -->
    <div class="product-card">
        <div class="card-img-wrap">
            <img src="images/smartwatch.png" alt="Smartwatch Series 5">
            <span class="cat-badge">Electronics</span>
        </div>
        <div class="card-body">
            <h3>Smartwatch Series 5</h3>
            <p>Track your health and stay connected.</p>
            <div class="card-footer">
                <span class="price">$199.99</span>
                <button class="btn-cart">Add to Cart</button>
            </div>
        </div>
    </div>

    <!-- Product 2: Smoothie Blender -->
    <div class="product-card">
        <div class="card-img-wrap">
            <img src="images/blender.png" alt="Smoothie Blender">
            <span class="cat-badge">Home Appliances</span>
        </div>
        <div class="card-body">
            <h3>Smoothie Blender</h3>
            <p>Powerful blender for healthy smoothies.</p>
            <div class="card-footer">
                <span class="price">$59.99</span>
                <button class="btn-cart">Add to Cart</button>
            </div>
        </div>
    </div>

    <!-- Product 3: Espresso Maker -->
    <div class="product-card">
        <div class="card-img-wrap">
            <img src="images/espresso.png" alt="Espresso Maker">
            <span class="cat-badge">Home Appliances</span>
        </div>
        <div class="card-body">
            <h3>Espresso Maker</h3>
            <p>Brew professional quality coffee at home.</p>
            <div class="card-footer">
                <span class="price">$149.99</span>
                <button class="btn-cart">Add to Cart</button>
            </div>
        </div>
    </div>

    <!-- Product 4: Wireless Headphones -->
    <div class="product-card">
        <div class="card-img-wrap">
            <img src="images/headphones.png" alt="Wireless Headphones">
            <span class="cat-badge">Electronics</span>
        </div>
        <div class="card-body">
            <h3>Wireless Headphones</h3>
            <p>Immersive sound with noise cancellation.</p>
            <div class="card-footer">
                <span class="price">$89.99</span>
                <button class="btn-cart">Add to Cart</button>
            </div>
        </div>
    </div>

    <!-- Product 5: Urban Sneakers -->
    <div class="product-card">
        <div class="card-img-wrap">
            <img src="images/sneakers.png" alt="Urban Sneakers">
            <span class="cat-badge">Fashion</span>
        </div>
        <div class="card-body">
            <h3>Urban Sneakers</h3>
            <p>Stylish comfort for everyday wear.</p>
            <div class="card-footer">
                <span class="price">$74.99</span>
                <button class="btn-cart">Add to Cart</button>
            </div>
        </div>
    </div>

    <!-- Product 6: Laptop Stand -->
    <div class="product-card">
        <div class="card-img-wrap">
            <img src="images/laptop_stand.png" alt="Aluminum Laptop Stand">
            <span class="cat-badge">Electronics</span>
        </div>
        <div class="card-body">
            <h3>Aluminum Laptop Stand</h3>
            <p>Ergonomic design for better posture.</p>
            <div class="card-footer">
                <span class="price">$49.99</span>
                <button class="btn-cart">Add to Cart</button>
            </div>
        </div>
    </div>

    <!-- Add more products below this line -->

</div>
