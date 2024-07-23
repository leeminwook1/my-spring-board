<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Page</title>
    <!-- Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
<div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
    <h2 class="text-2xl font-bold mb-6 text-center">Signup</h2>
    <form action="/signup" method="post" class="space-y-4">
        <div>
            <label for="username" class="block text-sm font-medium text-gray-700">Username:</label>
            <input type="text" id="username" name="username" required
                   class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2">
        </div>

        <div>
            <label for="password" class="block text-sm font-medium text-gray-700">Password:</label>
            <input type="password" id="password" name="password" required
                   class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2">
        </div>

        <div>
            <label for="passwordConfirm" class="block text-sm font-medium text-gray-700">Confirm Password:</label>
            <input type="password" id="passwordConfirm" name="passwordConfirm" required
                   class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2">
        </div>

        <button type="submit"
                class="w-full bg-indigo-600 text-white font-bold py-2 px-4 rounded hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
            Signup
        </button>
    </form>
</div>
</body>
</html>
