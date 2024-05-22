# Stage 1: Build the Node.js application
FROM node:14 as node-build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build  # Assuming npm run build is the build command for your Node.js app

# Stage 2: Build the Java application
FROM maven:3.6.3-jdk-11 as maven-build
WORKDIR /app
COPY . .
RUN mvn clean install

# Stage 3: Create the final image
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=node-build /app/target/classes/static/built/bundle.js ./target/classes/static/built/bundle.js
COPY --from=maven-build /app/target/react-and-spring-data-rest-0.0.1-SNAPSHOT.jar .

# Expose the application port
EXPOSE 8080

# Define the command to run the application
CMD ["java", "-jar", "react-and-spring-data-rest-0.0.1-SNAPSHOT.jar"]

