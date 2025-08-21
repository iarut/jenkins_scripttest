FROM jenkins/jenkins:lts
# Отключаем setup wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
# Копируем список плагинов и устанавливаем их
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
# Копируем скрипты инициализации
COPY init.groovy.d /usr/share/jenkins/ref/init.groovy.d


FROM anapsix/alpine-java
WORKDIR /app
LABEL maintainer="igorigoraik@gmail.com"
COPY /build/libs/jenkins_scripttest-1.0-SNAPSHOT.jar /app/app.jar
CMD ["java","-jar","/app/app.jar"]