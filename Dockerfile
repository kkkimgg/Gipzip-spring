# Java 17 JDK 이미지 사용
FROM eclipse-temurin:17-jdk

# 작업 디렉토리 생성
WORKDIR /app

# 모든 파일 복사 (mvnw, pom.xml, src 등)
COPY . .

# Maven으로 jar 빌드 (테스트 생략)
RUN ./mvnw clean package -DskipTests

# 컨테이너가 시작될 때 실행할 명령어
CMD ["java", "-jar", "target/*.jar"]
