# Stage 1: Build WAR bằng Maven
FROM maven:3.9.8-eclipse-temurin-21 AS builder
WORKDIR /app

# Copy pom.xml và src để Maven build
COPY pom.xml .
COPY src ./src

# Build file WAR
RUN mvn clean package -DskipTests

# Stage 2: Run với Tomcat 9 (thay vì Tomcat 10)
FROM tomcat:9-jdk21

# Xóa webapp mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR từ stage 1 vào Tomcat
COPY --from=builder /app/target/Baitap2.war /usr/local/tomcat/webapps/ROOT.war

# Expose cổng
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
