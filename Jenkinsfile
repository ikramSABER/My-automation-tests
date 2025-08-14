version: '3.8'

services:
  jenkins:
    image: jenkins/jenkins:lts
    container_name: jenkins-gali
    privileged: true
    user: root
    restart: unless-stopped
    ports:
      - "8080:8080"
      - "50000:50000"
    volumes:
      - jenkins_home:/var/jenkins_home
      - /var/run/docker.sock:/var/run/docker.sock
      - /usr/bin/docker:/usr/bin/docker
    environment:
      - JAVA_OPTS=-Djenkins.install.runSetupWizard=false
      - JENKINS_OPTS=--httpPort=8080
    networks:
      - jenkins-network

  # Optional: Selenium Grid Hub for distributed testing
  selenium-hub:
    image: selenium/hub:4.15.0
    container_name: selenium-hub
    ports:
      - "4444:4444"
    environment:
      - GRID_MAX_SESSION=16
      - GRID_BROWSER_TIMEOUT=300
      - GRID_TIMEOUT=300
    networks:
      - jenkins-network

  # Optional: Chrome nodes for Selenium Grid
  selenium-chrome:
    image: selenium/node-chrome:4.15.0
    container_name: selenium-chrome
    depends_on:
      - selenium-hub
    environment:
      - HUB_HOST=selenium-hub
      - HUB_PORT=4444
      - NODE_MAX_SESSION=4
    volumes:
      - /dev/shm:/dev/shm
    networks:
      - jenkins-network
    deploy:
      replicas: 2

volumes:
  jenkins_home:
    driver: local

networks:
  jenkins-network:
    driver: bridge
