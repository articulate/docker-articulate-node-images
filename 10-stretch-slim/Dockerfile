FROM articulate/articulate-node:10-stretch-slim
ARG VIPS_VERSION=8.6.3
ENV LD_LIBRARY_PATH=/usr/local/lib
ARG GIFSICLE_VERSION=1.91

RUN apt-get update -qq \
    && apt-get install -y build-essential graphicsmagick-libmagick-dev-compat libexpat1-dev libfftw3-dev \
    liborc-0.4-dev libpng-dev libtiff5-dev pngquant automake gtk-doc-tools libglib2.0-dev librsvg2-bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

# Install vips, an image processing library
# https://github.com/libvips/libvips/releases/tag/v8.6.3
# If there are problems with images types being unsupported, we might want to try the 'all' or 'web' versions.
ADD https://github.com/libvips/libvips/releases/download/v${VIPS_VERSION}/vips-${VIPS_VERSION}.tar.gz vips.tar.gz
RUN tar xf vips.tar.gz \
  && cd vips-${VIPS_VERSION} \
  && ./configure --disable-static \
  && make && make install && make clean \
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
