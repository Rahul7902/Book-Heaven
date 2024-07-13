# 
# Build Stage
# 
FROM maven:3.8.3-openjdk-17 AS build
WORKDIR /app
COPY . /app/
RUN mnv clean package

# 
# Package Stage
# 
FROM openjdk-17-alpine
WORKDIR /app
COPY --form=build /app/target/*jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]