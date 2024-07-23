<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board List</title>
    <!-- Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script>
        function goToCreateBoardPage() {
            window.location.href = '/board/add';
        }
    </script>
</head>
<body class="bg-gray-100 p-8 font-sans">

<!-- Top Buttons and Search Bar -->
<div class="mb-8 flex flex-col md:flex-row md:justify-between md:items-center space-y-4 md:space-y-0 md:space-x-6">
    <!-- Create Board Button -->
    <button onclick="goToCreateBoardPage()"
            class="bg-teal-600 text-black font-semibold py-2 px-6 rounded-full shadow-lg hover:bg-teal-700 focus:outline-none focus:ring-4 focus:ring-teal-300 transition duration-300">
        Create Board
    </button>

    <!-- Search Form -->
    <form action="/board/list" method="get" class="flex flex-col md:flex-row md:items-center space-y-4 md:space-y-0 md:space-x-6">
        <input type="text" name="search" value="${search}" placeholder="Search by title or username"
               class="border border-gray-300 rounded-full py-2 px-4 bg-white shadow-sm focus:outline-none focus:ring-2 focus:ring-teal-500 placeholder-gray-500 text-gray-800">
        <button type="submit"
                class="bg-teal-600 text-black font-semibold py-2 px-6 rounded-full shadow-lg hover:bg-teal-700 focus:outline-none focus:ring-4 focus:ring-teal-300 transition duration-300">
            Search
        </button>
    </form>

    <!-- Logout Button -->
    <form action="/logout" method="post">
        <button type="submit"
                class="bg-gray-700 text-white font-semibold py-2 px-6 rounded-full shadow-lg hover:bg-gray-800 focus:outline-none focus:ring-4 focus:ring-gray-600 transition duration-300">
            Logout
        </button>
    </form>
</div>

<!-- Board List Section -->
<div class="max-w-6xl mx-auto">
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <c:forEach var="board" items="${boards}">
            <div class="bg-white border border-gray-200 rounded-lg shadow-lg overflow-hidden transition-transform transform hover:scale-105">
                <a href="/board/${board.id}" class="block p-6">
                    <h2 class="text-2xl font-bold text-gray-900 mb-2">${board.title}</h2>
                    <p class="text-sm text-gray-600">Posted by ${board.username}</p>
                </a>
                <div class="p-4 bg-gray-50 flex justify-end space-x-4">
                    <a href="/board/${board.id}/edit" aria-label="Edit board ${board.id}"
                       class="text-teal-600 hover:text-teal-700 font-medium">
                        Edit
                    </a>
                    <form action="/board/${board.id}/delete" method="post" style="display:inline;">
                        <button type="submit" aria-label="Delete board ${board.id}"
                                class="bg-red-600 text-white font-medium py-1 px-4 rounded-full hover:bg-red-700 focus:outline-none focus:ring-4 focus:ring-red-300 transition duration-300">
                            Delete
                        </button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- Pagination -->
<div class="flex justify-center mt-8">
    <nav class="relative z-0 inline-flex shadow-md -space-x-px" aria-label="Pagination">
        <c:if test="${page > 1}">
            <a href="?page=${page - 1}&size=${size}&search=${search}"
               class="relative inline-flex items-center px-4 py-2 rounded-l-full border border-gray-300 bg-white text-sm font-medium text-gray-800 hover:bg-gray-100"
               aria-label="Previous page">
                Previous
            </a>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" var="i">
            <a href="?page=${i}&size=${size}&search=${search}"
               class="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium ${page == i ? 'text-teal-600' : 'text-gray-800'} hover:bg-gray-100"
               aria-label="Page ${i}">
                    ${i}
            </a>
        </c:forEach>
        <c:if test="${page < totalPages}">
            <a href="?page=${page + 1}&size=${size}&search=${search}"
               class="relative inline-flex items-center px-4 py-2 rounded-r-full border border-gray-300 bg-white text-sm font-medium text-gray-800 hover:bg-gray-100"
               aria-label="Next page">
                Next
            </a>
        </c:if>
    </nav>
</div>

</body>
</html>
