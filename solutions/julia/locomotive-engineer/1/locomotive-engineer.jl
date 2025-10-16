get_vector_of_wagons(args...) = collect(args)  # or `[args...]`

function fix_vector_of_wagons(each_wagons_id, missing_wagons)
    penultimate, ultimate, engine, rest... = each_wagons_id
    [engine, missing_wagons..., rest..., penultimate, ultimate]
end

function add_missing_stops(route, stops...)
    Dict([route..., "stops" => [stop.second for stop in stops]])
end

function extend_route_information(route; more_route_information...)
    Dict([route..., more_route_information...])
end
