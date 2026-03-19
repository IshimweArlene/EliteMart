<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="header.jsp" />

<%
    String selectedCategory = (String) request.getAttribute("selectedCategory");
    if (selectedCategory == null) selectedCategory = "All Categories";
    
    String minPrice = (String) request.getAttribute("minPrice");
    String maxPrice = (String) request.getAttribute("maxPrice");
    String sortBy = (String) request.getAttribute("sortBy");
    
    String[] categories = {"All Categories", "Electronics", "Home Appliances", "Fashion", "Books", "Hobbies", "Beauty", "Home Decor", "Furniture"};
%>

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
        width: 260px;
        min-width: 260px;
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
        padding: 24px 28px;
        min-width: 0;
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
        <form action="products" method="GET" id="filterForm">
            <input type="hidden" name="category" id="categoryInput" value="<%= selectedCategory %>">
            
            <div class="sidebar-section">
                <h4>Categories</h4>
                <ul class="category-list">
                    <% for (String cat : categories) { %>
                        <li class="<%= cat.equalsIgnoreCase(selectedCategory) ? "active" : "" %>" 
                            onclick="setCategory('<%= cat %>')">
                            <%= cat %>
                        </li>
                    <% } %>
                </ul>
            </div>

            <div class="sidebar-section">
                <h4>Price Range</h4>
                <div class="price-inputs">
                    <input type="number" name="minPrice" placeholder="Min" value="<%= minPrice != null ? minPrice : "" %>">
                    <input type="number" name="maxPrice" placeholder="Max" value="<%= maxPrice != null ? maxPrice : "" %>">
                </div>
                <button type="submit" class="btn-apply">Apply Filters</button>
            </div>

            <div class="sidebar-section">
                <h4>Sort By</h4>
                <select name="sortBy" class="sort-select" onchange="this.form.submit()">
                    <option value="Default" <%= "Default".equals(sortBy) ? "selected" : "" %>>Default</option>
                    <option value="Price: Low to High" <%= "Price: Low to High".equals(sortBy) ? "selected" : "" %>>Price: Low to High</option>
                    <option value="Price: High to Low" <%= "Price: High to Low".equals(sortBy) ? "selected" : "" %>>Price: High to Low</option>
                    <option value="Newest First" <%= "Newest First".equals(sortBy) ? "selected" : "" %>>Newest First</option>
                </select>
            </div>
        </form>
    </aside>

    <!-- Main Content Area -->
    <main class="main-content">
        <jsp:include page="products.jsp" />
    </main>

</div>

<script>
    function setCategory(cat) {
        document.getElementById('categoryInput').value = cat;
        document.getElementById('filterForm').submit();
    }
</script>
