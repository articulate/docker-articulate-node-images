FROM articulate/articulate-node:8-stretch-slim
ARG VIPS_VERSION=8.6.3
ENV LD_LIBRARY_PATH=/usr/local/lib
ARG gifsicle_version=1.91

RUN apt-get update && \
    apt-get install -y build-essential graphicsmagick-libmagick-dev-compat libexpat1-dev libfftw3-dev liborc-0.4-dev libpng-dev libtiff5-dev pngquant && \
    apt-get clean

WORKDIR /tmp

# Install vips, an image processing library
# https://jcupitt.github.io/libvips/install.html
# RUN mkdir -p vips && \
#    curl -Ls https://github.com/jcupitt/libvips/releases/download/v${vips_version}/vips-${vips_version}.tar.gz | tar xzC vips --strip-components=1 && \
#    cd vips && \
#    ./configure --disable-static && \
#    make && make install && make clean && \
#    cd ..

ADD https://github.com/jcupitt/libvips/releases/download/v${VIPS_VERSION}/vips-${VIPS_VERSION}.tar.gz vips.tar.gz

RUN tar xvzf vips.tar.gz \
    && cd vips-${VIPS_VERSION} \
    && ./configure --disable-static \
    && make && make install \
    && ldconfig /usr/local/lib \
    && make clean \
    && make -s install-strip \
    && cd .. \
    && rm -rf vips*

ADD https://github.com/kohler/gifsicle/archive/v${gifsicle_version}.zip gifsicle.zip
RUN unzip gifsicle.zip && \
    cd gifsicle-${gifsicle_version} && \
    autoreconf -i && \
    ./configure --disable-gifview --disable-gifdiff && \
    make install

RUN rm -rf /tmp/*
WORKDIR $SERVICE_ROOT
