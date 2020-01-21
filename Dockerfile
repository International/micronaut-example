FROM oracle/graalvm-ce:19.3.0-java8 as graalvm
#FROM oracle/graalvm-ce:19.3.0-java11 as graalvm # For JDK 11
COPY . /home/app/geo
WORKDIR /home/app/geo
RUN gu install native-image
RUN native-image --no-server --static -cp build/libs/geo-*-all.jar

FROM scratch
EXPOSE 8080
COPY --from=graalvm /home/app/geo/geo /app/geo
ENTRYPOINT ["/app/geo", "-Djava.library.path=/app"]
