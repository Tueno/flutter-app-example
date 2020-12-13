FROM runmymind/docker-android-sdk

RUN wget --quiet --output-document=flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/beta/linux/flutter_linux_1.23.0-18.1.pre-beta.tar.xz \
    && tar xf flutter.tar.xz -C / \
    && rm flutter.tar.xz

RUN apt-get update && apt-get install -y lcov
RUN apt-get install tig
RUN yes | apt install emacs

# Env
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV PUB_CACHE=/workspace/.pub_cache
RUN echo 'export PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin:/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PUB_CACHE}/bin:/flutter/.pub-cache/bin:$PATH' >>~/.bashrc

RUN chmod -R 777 /flutter/
RUN chmod -R 777 ${ANDROID_HOME}/tools/

RUN /flutter/bin/flutter precache
RUN /flutter/bin/flutter config --enable-web --no-analytics
RUN yes "y" | /flutter/bin/flutter doctor --android-licenses -v
