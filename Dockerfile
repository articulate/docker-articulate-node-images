FROM articulate/articulate-node:8
ARG vips_version=8.5.6
ENV LD_LIBRARY_PATH=/usr/local/lib

RUN echo 'deb http://httpredir.debian.org/debian stretch main' >> /etc/apt/sources.list && \
    echo 'APT::Default-Release "jessie";' > /etc/apt/apt.conf.d/10apt && \
    apt-get update && \
    apt-get install -y build-essential graphicsmagick-libmagick-dev-compat/stretch libexpat1-dev libfftw3-dev liborc-0.4-dev libpng-dev libtiff5-dev pngquant && \
    apt-get clean

WORKDIR /tmp

RUN mkdir -p vips && \
    curl -Ls https://github.com/jcupitt/libvips/releases/download/v${vips_version}/vips-${vips_version}.tar.gz | tar xzC vips --strip-components=1 && \
    cd vips && \
    ./configure --disable-static && \
    make && make install && make clean && \
    cd ..

ADD https://github.com/kohler/gifsicle/archive/0e02f7b62a9a3a344c34f92ddb7e178ad3b3e3ff.zip gifsicle.zip
RUN unzip gifsicle.zip && \
    cd gifsicle-0e02f7b62a9a3a344c34f92ddb7e178ad3b3e3ff && \
    autoreconf -i && \
    ./configure --disable-gifview --disable-gifdiff && \
    make install

RUN rm -rf /tmp/*
WORKDIR $SERVICE_ROOT
