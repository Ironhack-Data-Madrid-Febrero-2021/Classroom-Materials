from pymongo import MongoClient

client = MongoClient("localhost:27017")
db = client.get_database("ironhack")
collection = db.get_collection("restaurants")
