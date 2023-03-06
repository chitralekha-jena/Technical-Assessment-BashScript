#Docker image based on the latest version of the Alpine Linux distribution
FROM alpine:latest

#Bash shell, Curl, and jq installed
RUN apk --update --no-cache add bash curl jq

#copies the contents of the current directory (including the retrieveparams.sh script) to the root of the image
COPY . .

#sets the execute permission on retrieveparams.sh.
RUN chmod +x /retrieveparams.sh

#The ENTRYPOINT instruction sets the command to be executed when a container is started from this image. In this case, it is set to run the retrieveparams.sh script.
ENTRYPOINT ["/retrieveparams.sh"]