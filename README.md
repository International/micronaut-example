Building native image
=====================
./gradlew assemble && native-image --no-server -cp build/libs/geo-0.1-all.jar
