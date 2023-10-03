// 1. Write a query to display all documents in the Restaurants collection.
db.restaurants.find({})
// 2. Write a query to display the restaurant_id, name, borough, and cuisine of all documents in the Restaurants collection.
db.restaurants.find({}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 })
// 3. Write a query to display the restaurant_id, name, borough, and cuisine, but excluding the _id field for all documents in the Restaurants collection.
db.restaurants.find({}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0 })
// 4. Write a query to display restaurant_id, name, borough, and zip code, but excluding the _id field for all documents in the Restaurants collection.
db.restaurants.find({}, { restaurant_id: 1, name: 1, boroug: 1, 'address.zipcode': 1, _id: 0})
// 5. Write a query to show all the restaurants that are in the Bronx.
db.restaurants.find({borough:'Bronx'})
// 6. Write a query to show the first 5 restaurants that are in the Bronx.
db.restaurants.find({borough:"Bronx"}).limit(5)
// 7. Enter a query to display all 5 restaurants after skipping the first 5 that are in the Bronx.
db.restaurants.find({borough:"Bronx"}).skip(5).limit(5)
// 8. Write a query to find the restaurants that have a score greater than 90.
db.restaurants.find({"grades.score": {$gt : 9}} )
// 9. Write a query to find restaurants that have a score greater than 80 but less than 100.
db.restaurants.find({"grades.score": {$gt: 8, $lt: 10}})
// 10. Enter a query to find restaurants that are located at a longitude less than -95.754168.
db.restaurants.find({"address.coord.0": {$lt: -95.754168}})
// 11. Write a MongoDB query to find restaurants that do not cook 'American' food and have a score greater than 70 and latitude less than -65.754168.
db.restaurants.find({cuisine: {$ne: 'American'}, "grades.score": {$gt:7}, "address.coord.1": {"$lt":-65.754168}}) //no me da resultado
// 12. Write a query to find restaurants that do not prepare 'American' food and have a score higher than 70 and which, in addition, are located in longitudes lower than -65.754168. Note : Do this query without using the $and operator.
db.restaurants.find({ cuisine: {$ne: 'American'}, "grades.score": {$gt:7}, "address.coord.0": {$lt:-65.754168}})
// 13. Enter a query to find restaurants that do not serve 'American' food, have an 'A' rating and are not in Brooklyn. The document should be displayed according to cuisine in descending order.
db.Restaurants.find({cuisine: { $ne: 'American' }, borough: { $ne: 'Brooklyn' }, grades: { $elemMatch: { grade: "A" }}}).sort({ cuisine: -1 })
// 14. Write a query to find the restaurant_id, name, borough and cuisine for those restaurants that contain 'Wil' in the first three letters of their name.
db.restaurants.find( {name: {$regexp: /^Will/i}}, {restaurant_id: 1, borough: 1, cuisine: 1, _id: 0})
// 15. Write a query to find the restaurant_id, name, borough, and cuisine for those restaurants that contain 'ces' in the last three letters of their name.
db.restaurants.find({name: {$regex: /ces$/i}}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0})
// 16. Write a query to find the restaurant_id, name, borough and cuisine for those restaurants that contain 'Reg' anywhere in their name.
db.Restaurants.find({name: {$regex: /Reg/i} }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1,_id: 0})
// 17. Write a query to find restaurants that belong to the Bronx and prepare American or Chinese dishes.
db.restaurants.find({borough: 'Bronx', cuisine: {$in:["American", "Chinese"]}})
// 18. Write a query to find the restaurant_id, name, borough, and cuisine for those restaurants that belong to Staten Island, Queens, Bronx, or Brooklyn.
db.Restaurants.find({borough: {$in: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0})
// 19. Write a query to find the restaurant_id, name, borough, and cuisine for those restaurants NOT in Staten Island, Queens, Bronx, or Brooklyn.
db.Restaurants.find({borough: {$nin: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0})
// 20. Write a query to find the restaurant_id, name, borough, and cuisine for those restaurants that score less than 10.
db.Restaurants.find({"grades.score": {$lt: 10}}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0})
// 21. Write a query to find the restaurant_id, name, borough and cuisine for those restaurants that prepare seafood ('seafood') unless they are 'American', 'Chinese' or the restaurant name starts with the letters 'Wil'.
// 22. Write a query to find the restaurant_id, name, and grades for those restaurants that achieve a grade of "A" and a score of 11 with an ISODate of "2014-08-11T00:00:00Z".
// 23. Write a query to find the restaurant_id, name, and grades for those restaurants where the 2nd element of the grades array contains a grade of "A" and a score of 9 with an ISODate of "2014-08-11T00:00:00Z" .
// 24. Write a query to find the restaurant_id, name, address, and geographic location for those restaurants where the second element of the coord array contains a value between 42 and 52.
// 25. Enter a query to sort restaurants by name in ascending order.
// 26. Enter a query to sort restaurants by name in descending order.
// 27. Write a query to organize restaurants by cuisine name in ascending order and by neighborhood in descending order.
// 28. Write a query to find out if the addresses contain the street.
// 29. Write a query that selects all documents in the restaurant collection where the values ​​of the coord field are of type Double.
// 30. Write a query that selects the restaurant_id, name, and grade for those restaurants that return 0 as the remainder after dividing any of their scores by 7.
// 31. Write a query to find the restaurant name, borough, longitude, latitude and cuisine for those restaurants that contain 'mon' somewhere in their name.
// 32. Write a query to find the restaurant name, borough, longitude, latitude and cuisine for those restaurants that contain 'Mad' as the first three letters of their name.