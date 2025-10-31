# Use lightweight JDK base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy JAR from subdirectory
COPY "BOOk STORE MANAGEMENT SYSTEM/bookStore/target/bookStore-0.0.1-SNAPSHOT.jar" app.jar

# Expose app port
EXPOSE 1001

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]

