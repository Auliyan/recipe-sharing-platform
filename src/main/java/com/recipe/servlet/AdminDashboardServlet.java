package com.recipe.servlet;

import com.recipe.dao.RecipeDAO;
import com.recipe.dao.RecipeDAOImpl;
import com.recipe.dao.UserDAO;
import com.recipe.dao.UserDAOImpl;
import com.recipe.util.DatabaseException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/** Admin dashboard: site statistics, recipes waiting for approval, and all users. */
@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAOImpl();
    private final RecipeDAO recipeDAO = new RecipeDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            req.setAttribute("totalUsers", userDAO.countUsers());
            req.setAttribute("totalRecipes", recipeDAO.count(null));
            req.setAttribute("approvedCount", recipeDAO.count("APPROVED"));
            req.setAttribute("pendingCount", recipeDAO.count("PENDING"));
            req.setAttribute("pendingRecipes", recipeDAO.getByStatus("PENDING"));
            req.setAttribute("users", userDAO.getAllUsers());
        } catch (DatabaseException e) {
            throw new ServletException(e);
        }
        req.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp").forward(req, resp);
    }
}
