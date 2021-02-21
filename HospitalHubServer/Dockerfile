FROM java:8
COPY *.jar app.jar
RUN bash -c 'touch /app.jar'
EXPOSE 9800
ENTRYPOINT ["java", "-jar", "/app.jar"]