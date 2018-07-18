# Create React App in Docker

This repo is a baseline example for how to configure docker images for both
development and production environments based on [Michael Herman's article](http://mherman.org/blog/2017/12/07/dockerizing-a-react-app/).

In its current configuration, the React application would reside fully within the `/app` directory in the project root. All commands will be executed from that context.

## Development build

If you dig into the `Dockerfile` and `dev` script just a little, you will see that
your working directory will be mounted into the docker container as the app root,
so your work will still be watched as if you had run `npm start` locally.

To build and run your docker image, just execute the `dev` script:

```sh
$ ./dev
```

## Production build

The production build requires you to manually build and run, since the CI/CD and
naming conventions are arbitrary for each project. In this case, the same basic image
will be used to build the artifacts of your React app, but we will then hand off
serving of that app to a configured Nginx image.

### Build your image

```sh
$ docker build -f Dockerfile-prod -t demo-app-prod .
```

### Run your image

```sh
$ docker run -it -p 3000:80 --rm demo-app-prod
```
