# 1단계: 빌드 전용 컨테이너
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /build
COPY . .
RUN ./mvnw clean package -DskipTests

# 2단계: 실행 전용 컨테이너 (더 가볍고 안전)
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=builder /build/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
