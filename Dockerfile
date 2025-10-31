# Use an official OpenJDK image as a base
FROM openjdk:17-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy the jar file from target folder into the container
COPY target/*.jar app.jar

# Expose port 8080
EXPOSE 8080

# Command to run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
