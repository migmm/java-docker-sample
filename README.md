# Java Docker Sample Project

This project demonstrates how to configure and use Java with Docker and Docker Compose. It's a simple Spring Boot application that provides CRUD operations for a User entity.

## Project Structure

```
src/main/java/com/usercrud/docker_sample/
├── controller/
│   └── UserController.java
├── model/
│   └── User.java
├── repository/
│   └── UserRepository.java
├── service/
│   └── UserService.java
└── DockerSampleApplication.java
```

## Technologies Used

- Java 21
- Spring Boot 3.3.1
- Spring Data JPA
- MySQL
- Maven
- Docker
- Docker Compose

## Prerequisites

- Java Development Kit (JDK) 21
- Maven
- Docker
- Docker Compose

## Setup and Running

1. Clone the repository:
   ```
   git clone [your-repository-url]
   cd [your-project-directory]
   ```

2. Build the project:
   ```
   mvn clean package
   ```

3. Build the Docker image:
   ```
   docker build -t java-docker-sample .
   ```

4. Run the application using Docker Compose:
   ```
   docker-compose up
   ```

The application will be available at `http://localhost:8080`.

## API Endpoints

- GET `/users`: Retrieve all users
- GET `/users/{id}`: Retrieve a specific user by ID
- POST `/users`: Create a new user
- PUT `/users/{id}`: Update an existing user
- DELETE `/users/{id}`: Delete a user

## Project Architecture

This project follows a layered architecture, specifically a 3-tier architecture pattern common in Spring Boot applications. Here's an overview of the architecture:

1. Presentation Layer (Controllers)
   - Location: `com.usercrud.docker_sample.controller`
   - Purpose: Handles HTTP requests and defines API endpoints.
   - Key Component: `UserController.java`

2. Business Logic Layer (Services)
   - Location: `com.usercrud.docker_sample.service`
   - Purpose: Implements business logic and use cases.
   - Key Component: `UserService.java`

3. Data Access Layer (Repositories)
   - Location: `com.usercrud.docker_sample.repository`
   - Purpose: Manages data persistence and database operations.
   - Key Component: `UserRepository.java`

Additional Components:

4. Model Layer
   - Location: `com.usercrud.docker_sample.model`
   - Purpose: Defines data structures and entities.
   - Key Component: `User.java`

5. Configuration
   - Key Components: `DockerSampleApplication.java`, `application.yml`
   - Purpose: Configures the Spring Boot application and its components.

This architecture promotes:
- Separation of concerns: Each layer has a specific responsibility.
- Modularity: Components can be developed and tested independently.
- Scalability: Layers can be scaled or modified separately as needed.
- Maintainability: Clear structure makes the codebase easier to understand and maintain.

The project also leverages Spring Boot's dependency injection, which further enhances modularity and testability.

## Configuration

The `application.yml` file contains the database configuration. Modify this file if you need to change any settings.

### Hibernate Configuration

By default, Hibernate is set to update the database schema automatically. If you want to prevent Hibernate from modifying the database schema after the initial run, follow these steps:

1. For the first run, use this configuration in your `application.yml`:

   ```yaml
   spring:
     jpa:
       hibernate:
         ddl-auto: update
   ```

2. After the first run, change the configuration to:

   ```yaml
   spring:
     jpa:
       hibernate:
         ddl-auto: none
   ```

This will prevent Hibernate from modifying the database schema on subsequent runs.

## Docker Configuration

The project includes a `Dockerfile` and a `docker-compose.yml` file for containerization:

- `Dockerfile`: Defines how to build the Docker image for the Java application.
- `docker-compose.yml`: Orchestrates the application and database services.

### Docker Commands

To stop the Docker containers:
```
docker-compose down
```

This will stop the containers but preserve your data volumes.

To stop the containers and remove the containers, networks, and images created by `up`:
```
docker-compose down --rmi all
```

To stop the containers and remove all associated resources, including volumes (WARNING: This will delete all your data):
```
docker-compose down -v
```
Use this command with caution as it will delete all data in your database.

To remove the Docker image:
```
docker rmi java-docker-sample
```

## Testing with Postman

A Postman collection file (`Java_Docker_Sample_Project.postman_collection.json`) is included in the project root. To use it:

1. Open Postman
2. Click on "Import" in the top left corner
3. Drag and drop the JSON file or browse to select it
4. The collection will be imported with pre-configured requests for all endpoints

## Troubleshooting

If you encounter any issues while running the application, please check the following:

1. Ensure all prerequisites are installed and properly configured.
2. Verify that the MySQL server is running and accessible.
3. Check if the required ports (8080 for the app, 3306 for MySQL) are available.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open-sourced under the [MIT license](LICENSE).