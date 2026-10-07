# Online Recipe Sharing Platform

A Java web application where users share, search, rate and comment on recipes, and an admin manages users, recipes and settings.

## Tech stack
Java 17, Servlets + JSP, JDBC, MySQL 8, Maven, Bootstrap 5

## Project structure
```
database/schema.sql          MySQL tables + starter data
src/main/java/com/recipe/
   model/     User, Admin (inherits User), Recipe
   dao/       UserDAO, RecipeDAO (interfaces) + JDBC implementations
   servlet/   Servlets (request handling)
   filter/    AuthFilter (login + role protection)
   util/      DBConnection, PasswordUtil, DatabaseException
src/main/resources/db.properties   database settings
src/main/webapp/css/               custom styles
src/main/webapp/WEB-INF/views/     JSP pages (not directly reachable by URL)
```

## Requirements
- JDK 17+
- Maven 3.8+
- MySQL 8

## Setup
1. Create the database: `mysql -u root -p < database/schema.sql`
2. Copy `src/main/resources/db.properties.example` to `db.properties` and put in your MySQL username/password.
3. Run: `mvn jetty:run`
4. Open http://localhost:8080/recipe/ (connection check: /recipe/test-db)

Default admin: `admin@recipe.com` / `admin123`

## Features (Review 1)
- Public: home page, browse + search recipes (by keyword and category), recipe details
- Authentication: register, login, logout (session based, SHA-256 password hashing)
- User: dashboard with recipe status counts, share a recipe (goes to admin approval)
- Admin: dashboard with site statistics, approve/reject recipes, view all users
- Responsive Bootstrap 5 UI with a custom orange/green theme
- `AuthFilter` protects `/user/*` and `/admin/*` pages by login and role

## Planned next
Ratings and comments, edit/delete own recipes, admin user management and system settings.
