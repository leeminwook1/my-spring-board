<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board Details</title>
    <!-- Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 p-8">
<div class="w-full max-w-4xl mx-auto bg-white shadow-lg rounded-lg p-6">
    <!-- Back to List Button -->
    <div class="mb-6">
        <a href="/board/list" class="inline-flex items-center px-4 py-2 text-sm font-semibold text-white bg-indigo-600 border border-transparent rounded-lg shadow-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition duration-300">
            Back to List
        </a>
    </div>

    <!-- Board Details -->
    <div class="bg-gray-50 p-6 rounded-lg shadow-md mb-6">
        <h2 class="text-3xl font-bold text-gray-800 mb-4">Board Details</h2>
        <table class="w-full border-separate border-spacing-0 border border-gray-300 rounded-lg overflow-hidden">
            <thead>
            <tr class="bg-gray-200 border-b">
                <th class="p-4 text-left text-gray-600 font-semibold">ID</th>
                <th class="p-4 text-left text-gray-600 font-semibold">Title</th>
                <th class="p-4 text-left text-gray-600 font-semibold">Content</th>
                <th class="p-4 text-left text-gray-600 font-semibold">Username</th>
                <th class="p-4 text-left text-gray-600 font-semibold">Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr class="border-b hover:bg-gray-50">
                <td class="p-4 text-gray-800">${board.id}</td>
                <td class="p-4 text-gray-800">${board.title}</td>
                <td class="p-4 text-gray-800">${board.content}</td>
                <td class="p-4 text-gray-800">${board.username}</td>
                <td class="p-4">
                    <form action="/board/${board.id}/delete" method="post" style="display:inline;">
                        <button type="submit"
                                class="bg-red-600 text-white font-semibold py-1 px-3 rounded-lg hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 transition duration-300">
                            Delete
                        </button>
                    </form>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <!-- Comment Form -->
    <div class="bg-gray-50 p-6 rounded-lg shadow-md mb-6">
        <h3 class="text-xl font-semibold text-gray-800 mb-4">Add a Comment</h3>
        <form action="/comment/create" method="post" class="space-y-4">
            <input type="hidden" name="boardId" value="${board.id}">
            <div>
                <label for="commentContent" class="block text-sm font-medium text-gray-700">Comment:</label>
                <textarea id="commentContent" name="content" rows="4" required
                          class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2"></textarea>
            </div>
            <button type="submit"
                    class="w-full bg-indigo-600 text-white font-semibold py-2 px-4 rounded-lg hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition duration-300">
                Submit
            </button>
        </form>
    </div>

    <!-- Comments List -->
    <div class="bg-gray-50 p-6 rounded-lg shadow-md">
        <h3 class="text-xl font-semibold text-gray-800 mb-4">Comments</h3>
        <c:forEach var="comment" items="${Comments}">
            <div class="border-b border-gray-300 py-4 flex items-start">
                <div class="flex-grow">
                    <p class="text-sm text-gray-600"><strong>${comment.username}</strong> - ${comment.created_at}</p>
                    <p class="mt-2 text-gray-800">${comment.content}</p>
                </div>
                <c:if test="${comment.username == username}">
                    <!-- Delete Button -->
                    <div class="ml-4 flex-shrink-0">
                        <form action="/comment/${comment.id}/delete" method="post" style="display:inline;">
                            <input type="hidden" name="boardId" value="${board.id}">
                            <button type="submit"
                                    class="inline-flex items-center px-4 py-2 text-sm font-semibold text-white bg-red-600 border border-transparent rounded-md shadow-sm hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 transition duration-300">
                                Delete
                            </button>
                        </form>
                    </div>
                </c:if>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
