<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="header.jsp" />

<style>
    .page-layout {
        display: flex;
        min-height: calc(100vh - 70px);
    }

    /* Remove number input spin arrows */
    input[type=number]::-webkit-inner-spin-button,
    input[type=number]::-webkit-outer-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
    input[type=number] { -moz-appearance: textfield; appearance: textfield; }

    .sidebar {
        width: 220px;
        min-width: 220px;
        background: #0f172a;
        padding: 28px 20px;
        border-right: 1px solid #1e293b;
    }

    .sidebar-section {
        margin-bottom: 28px;
    }

    .sidebar-section h4 {
        font-size: 11px;
        letter-spacing: 1.5px;
        color: #64748b;
        text-transform: uppercase;
        margin: 0 0 14px 0;
    }

    .category-list {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .category-list li {
        padding: 8px 12px;
        border-radius: 8px;
        font-size: 14px;
        color: #cbd5e1;
        cursor: pointer;
        transition: background 0.2s, color 0.2s;
        margin-bottom: 2px;
    }

    .category-list li:hover {
        background: #1e293b;
        color: #38bdf8;
    }

    .category-list li.active {
        background: #1e3a5f;
        color: #38bdf8;
        font-weight: 600;
    }

    .price-inputs {
        display: flex;
        gap: 8px;
        margin-bottom: 10px;
    }

    .price-inputs input {
        width: 50%;
        padding: 8px 10px;
        border-radius: 8px;
        border: 1px solid #334155;
        background: #1e293b;
        color: white;
        font-size: 13px;
        box-sizing: border-box;
        outline: none;
    }

    .price-inputs input::placeholder {
        color: #475569;
    }

    .price-inputs input:focus {
        border-color: #38bdf8;
    }

    .btn-apply {
        width: 100%;
        padding: 10px;
        border-radius: 8px;
        border: none;
        background: linear-gradient(90deg, #6366f1, #8b5cf6);
        color: white;
        font-weight: 600;
        font-size: 14px;
        cursor: pointer;
        transition: opacity 0.2s;
    }

    .btn-apply:hover {
        opacity: 0.88;
    }

    .sort-select {
        width: 100%;
        padding: 9px 12px;
        border-radius: 8px;
        border: 1px solid #334155;
        background: #1e293b;
        color: white;
        font-size: 14px;
        outline: none;
        cursor: pointer;
        appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%2394a3b8' d='M6 8L1 3h10z'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 12px center;
    }

    /* ── Main content ── */
    .main-content {
        flex: 1;
        padding: 36px 40px;
    }

    .main-content h2 {
        color: #f1f5f9;
        margin-top: 0;
    }

    .main-content p {
        color: #94a3b8;
    }
</style>

<div class="page-layout">

    <!-- Sidebar Filter -->
    <aside class="sidebar">

        <div class="sidebar-section">
            <h4>Categories</h4>
            <ul class="category-list">
                <li class="active">All Categories</li>
                <li>Electronics</li>
                <li>Home Appliances</li>
                <li>Fashion</li>
                <li>Books</li>
                <li>Hobbies</li>
                <li>Beauty</li>
                <li>Home Decor</li>
                <li>Furniture</li>
            </ul>
        </div>

        <div class="sidebar-section">
            <h4>Price Range</h4>
            <div class="price-inputs">
                <input type="number" placeholder="Min">
                <input type="number" placeholder="Max">
            </div>
            <button class="btn-apply">Apply Filters</button>
        </div>

        <div class="sidebar-section">
            <h4>Sort By</h4>
            <select class="sort-select">
                <option>Default</option>
                <option>Price: Low to High</option>
                <option>Price: High to Low</option>
                <option>Newest First</option>
                <option>Most Popular</option>
            </select>
        </div>

    </aside>

    <!-- Main Content Area -->
    <main class="main-content">
        <h2>Welcome to EliteMart!</h2>
        <p>Your one-stop shop for premium goods. Browse categories on the left to get started.</p>
    </main>

</div>
