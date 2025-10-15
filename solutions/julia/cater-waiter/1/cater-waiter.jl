function clean_ingredients(dish_name, dish_ingredients)
    (dish_name, Set(dish_ingredients))
end

function check_drinks(drink_name, drink_ingredients)
    # drink_type = isempty(drink_ingredients ∩ ALCOHOLS) ? "Mocktail" : "Cocktail"
    drink_type = isdisjoint(drink_ingredients, ALCOHOLS) ? "Mocktail" : "Cocktail"
    "$drink_name $drink_type"
end

function categorize_dish(dish_name, dish_ingredients)
    dish_category = "OMNIVORE"
    categories = ["VEGAN" => VEGAN, "VEGETARIAN" => VEGETARIAN, "PALEO" => PALEO, "KETO" => KETO]
    for (category, ingredients) in categories
        if issubset(dish_ingredients, ingredients)
            dish_category = category
            break
        end
    end
    "$dish_name: $dish_category"
end

function tag_special_ingredients((dish_name, dish_ingredients))
    (dish_name, Set(dish_ingredients) ∩ SPECIAL_INGREDIENTS)
end

function compile_ingredients(dishes)
    #= hmmm, according to https://docs.julialang.org/en/v1/base/collections/#Base.union
     # this should work:
    union(Set(), dishes)
    =#
    
    #=
    result = Set()
    for dish in dishes
        union!(result, dish)
    end
    result
    =#
    
    foldl(union!, dishes; init=Set())
end

function separate_appetizers(dishes, appetizers)
    setdiff(Set(dishes), Set(appetizers)) |> collect
end

function singleton_ingredients(dishes, intersection)
    not_in_intersections_per_dish = [setdiff(dish, intersection) for dish in dishes]
    reduce(symdiff!, not_in_intersections_per_dish)
end
