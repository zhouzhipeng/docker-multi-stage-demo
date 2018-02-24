
FROM maven:3.5.2-alpine as builder

MAINTAINER zhouzhipeng <admin@zhouzhipeng.com>

WORKDIR /app

COPY src .
COPY pom.xml .


# 编译打包 (jar包生成路径：/app/target)
RUN mvn package -Dmaven.test.skip=true


FROM openjdk:8-jre-alpine

MAINTAINER zhouzhipeng <admin@zhouzhipeng.com>

WORKDIR /app

COPY --from=builder /app/target/docker-multi-stage-demo-1.0-SNAPSHOT.jar .

# 运行main类
CMD java -cp docker-multi-stage-demo-1.0-SNAPSHOT.jar com.zhouzhipeng.HelloWorld

