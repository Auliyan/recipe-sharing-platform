package com.recipe.util;

import java.util.List;

/** Values shared across the whole application. */
public final class AppConstants {

    public static final List<String> CATEGORIES =
            List.of("Breakfast", "Lunch", "Dinner", "Dessert", "Snacks", "Beverages", "Vegan");

    /** Name of the session attribute that stores the logged-in user. */
    public static final String SESSION_USER = "user";

    private AppConstants() { }
}
