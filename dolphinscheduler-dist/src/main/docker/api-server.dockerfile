#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM eclipse-temurin:8-jdk

ENV DOCKER=true
ENV TZ=Asia/Shanghai
ENV DOLPHINSCHEDULER_HOME=/opt/dolphinscheduler

RUN apt update ; \
    apt install -y sudo ; \
    rm -rf /var/lib/apt/lists/*

WORKDIR $DOLPHINSCHEDULER_HOME

COPY ./target/apache-dolphinscheduler-*-bin.tar.gz $DOLPHINSCHEDULER_HOME
RUN tar -zxvf apache-dolphinscheduler-*-bin.tar.gz ; \
    rm -rf apache-dolphinscheduler-*-bin.tar.gz ; \
    mv apache-dolphinscheduler-*-bin/* . ; \
    rm -rf apache-dolphinscheduler-*-bin

EXPOSE 12345 25333

CMD [ "/bin/bash", "/opt/dolphinscheduler/api-server/bin/start.sh" ]
