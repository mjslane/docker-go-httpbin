[![Build Status](https://travis-ci.org/Skyscanner/docker-go-httpbin.svg?branch=master)](https://travis-ci.org/Skyscanner/docker-go-httpbin)
[![](https://images.microbadger.com/badges/image/skyscanner/go-httpbin.svg)](http://microbadger.com/images/skyscanner/go-httpbin "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/skyscanner/go-httpbin.svg)](http://microbadger.com/images/skyscanner/go-httpbin "Get your own version badge on microbadger.com")

# docker-go-httpbin

Docker image for the GoLang version of httpbin, a debug API with many features.

the image is called [skyscanner/go-httpbin](https://hub.docker.com/r/skyscanner/go-httpbin/)

example run:

```
: docker run skyscanner/go-httpbin -p 8080:8080

2017/03/14 13:19:33 httpbin listening on 0.0.0.0:8080
```

# Usage
You can run this image wherever you'd like a httpbin instance. It's useful in docker-compose frameworks for instance.
