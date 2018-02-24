#!/usr/bin/env bash


# 1. 先构建出带有产物jar的镜像
docker build -t zhouzhipeng/dockermultistagedemo-build -f Dockerfile.build .

# 2. 临时创建 dockermultistagedemo-build 容器
docker create --name build zhouzhipeng/dockermultistagedemo-build

# 3. 将上面容器中的jar拷贝出来
docker cp build:/app/target/docker-multi-stage-demo-1.0-SNAPSHOT.jar ./

# 4. 构建java执行的镜像
docker build -t zhouzhipeng/dockermultistagedemo -f Dockerfile.old .

# 5. 删除临时jar文件
rm -rf docker-multi-stage-demo-1.0-SNAPSHOT.jar