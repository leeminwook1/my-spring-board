<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">
<div class="w-full max-w-md bg-white shadow-md rounded-lg p-6">
    <h2 class="text-2xl font-bold mb-4">Login</h2>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="mb-4">
            <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
            <input type="text" id="username" name="username" required
                   class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2">
        </div>
        <div class="mb-4">
            <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
            <input type="password" id="password" name="password" required
                   class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2">
        </div>
        <button type="submit"
                class="w-full bg-indigo-600 text-white font-bold py-2 px-4 rounded hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
            Login
        </button>
    </form>
    <div class="mt-4 text-center">
        <a href="${pageContext.request.contextPath}/signup"
           class="text-indigo-600 hover:text-indigo-800 font-medium">
            Sign Up
        </a>
    </div>
</div>
</body>
</html>
