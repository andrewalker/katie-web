# Katie website

Help us out, Katie!

## Installing and running

````

$ ./vendor/bin/carton install --cached
$ ./vendor/bin/carton exec plackup -Ilib -r

````

Or, with docker:

````

$ docker build -t katie-web .
$ docker run -p 5000:80 -d katie-web

````
