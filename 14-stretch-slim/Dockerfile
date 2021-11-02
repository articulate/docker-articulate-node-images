FROM articulate/articulate-node:14-stretch-slim

ENV LD_LIBRARY_PATH=/usr/local/lib

RUN apt-get update -qq \
    && apt-get install --no-install-recommends -y \
        build-essential graphicsmagick-libmagick-dev-compat libexpat1-dev libfftw3-dev \
        liborc-0.4-dev libpng-dev libtiff5-dev pngquant automake gtk-doc-tools \
        libglib2.0-dev librsvg2-bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install vips, an image processing library
# https://github.com/libvips/libvips/releases/tag/v8.6.3
# If there are problems with images types being unsupported, we might want to try the 'all' or 'web' versions.
ARG VIPS_VERSION=8.6.3
WORKDIR /tmp/vips
ADD https://github.com/libvips/libvips/releases/download/v${VIPS_VERSION}/vips-${VIPS_VERSION}.tar.gz vips.tar.gz
RUN tar xf vips.tar.gz --strip-components=1 \
    && ./configure --disable-static \
    && make && make install && make clean \
    && rm -rf /tmp/vips

# Install Gifsicle, a package to create, manipulate and optimise GIF images
# http://www.lcdf.org/gifsicle/
ARG GIFSICLE_VERSION=1.91
WORKDIR /tmp/gifsicle
ADD https://github.com/kohler/gifsicle/archive/v${GIFSICLE_VERSION}.tar.gz gifsicle.tar.gz
RUN tar xf gifsicle.tar.gz --strip-components=1 \
    && autoreconf -i \
    && ./configure --disable-gifview --disable-gifdiff \
    && make install \
    && rm -rf /tmp/gifsicle

WORKDIR $SERVICE_ROOT
