-- write your queries here

--Join the two tables so that every column and record appears, regardless of if there is not an owner_id.
SELECT * FROM owners JOIN vehicles ON vehicles.owner_id = owners.id;

--Count the number of cars for each owner.
--Display the owners first_name, last_name and count of vehicles. 
--The first_name should be ordered in ascending order. 
SELECT owners.first_name, owners.last_name, COUNT(vehicles.owner_id) FROM owners LEFT JOIN vehicles ON vehicles.owner_id = owners.id GROUP BY owners.id HAVING COUNT(vehicles.owner_id) > 0  ORDER by owners.first_name;

--Count the number of cars for each owner and display the average price for each of the cars as integers. 
--Display the owners first_name, last_name, average price and count of vehicles. 
--The first_name should be ordered in descending order. 
--Only display results with more than one vehicle and an average price greater than 10000. 
SELECT owners.first_name, owners.last_name, AVG(vehicles.price), COUNT(vehicles.owner_id) 
    FROM owners 
    LEFT JOIN vehicles 
    ON vehicles.owner_id = owners.id 
    GROUP BY owners.id 
    HAVING COUNT(vehicles.owner_id) > 1 and AVG(vehicles.price) > 10000  
    ORDER by owners.first_name desc;
