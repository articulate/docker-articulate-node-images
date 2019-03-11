FROM articulate/articulate-node:8-stretch-slim
ARG VIPS_VERSION=8.6.3
ENV LD_LIBRARY_PATH=/usr/local/lib
ARG GIFSICLE_VERSION=1.91

RUN apt-get update -qq \
    && apt-get install -y build-essential graphicsmagick-libmagick-dev-compat libexpat1-dev libfftw3-dev \
    liborc-0.4-dev libpng-dev libtiff5-dev pngquant automake gtk-doc-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

# Install vips, an image processing library
# https://jcupitt.github.io/libvips/install.html (doesn't work properly)
# https://github.com/libvips/libvips/wiki/Build-for-Ubuntu (worked)
# We use a fork of libvips because when we wrote this, the script we based this on did as well.
# We might not need to anymore, but if it still works we're good
ADD https://github.com/jcupitt/libvips/archive/v${VIPS_VERSION}.tar.gz vips.tar.gz
RUN tar xf vips.tar.gz \
    && cd libvips-${VIPS_VERSION} \
    && ./autogen.sh
    && make && make install \
    && ldconfig /usr/local/lib \
    && make clean \
    && make -s install-strip \
    && cd ..

# Install Gifsicle, a package to create, manipulate and optimise GIF images
# http://www.lcdf.org/gifsicle/
ADD https://github.com/kohler/gifsicle/archive/v${GIFSICLE_VERSION}.tar.gz gifsicle.tar.gz
RUN tar xf gifsicle.tar.gz && \
    cd gifsicle-${GIFSICLE_VERSION} && \
    autoreconf -i && \
    ./configure --disable-gifview --disable-gifdiff && \
    make install

RUN rm -rf /tmp/*
WORKDIR $SERVICE_ROOT
