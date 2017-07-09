FROM mhart/alpine-node

RUN apk update && apk add git && apk add curl && apk add openjdk8
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN git clone https://github.com/Netflix/vizceral-example.git  .
RUN npm install

RUN curl -OL https://github.com/auto1-oss/vizceral-hystrix/releases/download/v1.0.11/vizceral-hystrix-1.0.11.jar
COPY src/main/js/trafficFlow.jsx /usr/src/app/src/components/trafficFlow.jsx

EXPOSE 8080 8081
ADD config.json config.json
ADD docker .
RUN chmod +x *.sh

ENTRYPOINT ["sh", "/usr/src/app/run.sh", "/usr/src/app/config.json"]
