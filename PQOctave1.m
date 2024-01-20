locations = csvread('Locations.csv', 1, 0);
cities = csvread('Cities.csv', 1, 0);
city_x = cities(:,2);
city_y = cities(:,3);
location_x = locations(:,2);
location_y = locations(:,3);

count_cities = [0, 0, 0, 0];
overall_closest_city = [0, 0, 0, 0];

overall_closestA = Inf;
overall_closestB = Inf;
overall_closestC = Inf;
overall_closestD = Inf;

for i = 1:length(locations)
    % access all of the x and y pos of location
    curr_x_location = location_x(i);
    curr_y_location = location_y(i);

    % refresh closest city
    min = Inf;
    closest_city = 0;

    % access all of the x and y pos of cities
    for j = 1:length(cities)
        curr_x_city = city_x(j);
        curr_y_city = city_y(j);

        distance = sqrt((curr_x_location - curr_x_city)^2 + (curr_y_location - curr_y_city)^2);

        if distance < min
            min = distance;
            % save what city it was
            closest_city = j;
        end
    end

    % update overall closest locations
    % need to check for specific city as well since they could all have the same overall_closest value
    if closest_city == 1 && min < overall_closestA
        overall_closestA = min;
        overall_closest_city(1) = i;
    elseif closest_city == 2 && min < overall_closestB
        overall_closestB = min;
        overall_closest_city(2) = i;
    elseif closest_city == 3 && min < overall_closestC
        overall_closestC = min;
        overall_closest_city(3) = i;
    elseif closest_city == 4 && min < overall_closestD
        overall_closestD = min;
        overall_closest_city(4) = i;
    end

    count_cities(closest_city) = count_cities(closest_city) + 1;
end

% Display the summary table
disp('City | # Closest | Nearest Location');
disp('===================================');

for i = 1:length(count_cities)
    disp([char('A' + i - 1), '    |  ', num2str(count_cities(i)), '       | ', num2str(overall_closest_city(i))]);
end



