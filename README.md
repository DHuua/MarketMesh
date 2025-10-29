MarketMesh API
This is the backend for the MarketMesh project — a RESTful API built with Spring Boot and connected to a PostgreSQL database.
It’s designed to work together with a Flutter frontend (mobile & web). Swagger is used for testing and documenting the API.

What’s Inside
Spring Boot + PostgreSQL setup
Clean REST API structure
Swagger UI for API testing
CORS enabled so Flutter (web or mobile) can connect
Configurable ports and database connection

Tech Stack
Java 17 / Spring Boot
PostgreSQL
Maven
Swagger / SpringDoc
Flutter (consumes this API)

How to Run
Make sure PostgreSQL is running (default port 5433)
Update application.properties if needed
Start the backend: mvnw spring-boot:run
Open Swagger at: http://localhost:8080/swagger-ui.html
If you’re sharing the backend with a Flutter developer on the same Wi-Fi, use your local IP (for example http://10.48.154.113:8080).
