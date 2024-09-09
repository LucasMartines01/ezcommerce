FROM maven:3-amazoncorretto-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean install -DskipTests

FROM openjdk:21
WORKDIR /app
EXPOSE 8080
COPY --from=builder /app/application/target/*.jar app.jar
ENTRYPOINT java -jar app.jar