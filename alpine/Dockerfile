FROM articulate/articulate-node:8-alpine

RUN apk --no-cache add curl alpine-sdk wget autoconf automake

ENV LD_LIBRARY_PATH=/usr/local/lib
ARG GIFSICLE_VERSION=1.91
ARG VIPS_VERSION=8.6.3
ARG PNGQUANT_VERSION=2.11.2

WORKDIR /tmp

RUN apk --no-cache add curl alpine-sdk wget zlib libxml2 glib \
    gobject-introspection libjpeg-turbo libexif lcms2 fftw giflib libpng \
    libwebp orc tiff poppler-glib librsvg libgsf openexr

RUN apk --no-cache add --virtual vips-dependencies build-base \
    zlib-dev libxml2-dev glib-dev gobject-introspection-dev \
    libjpeg-turbo-dev libexif-dev lcms2-dev fftw-dev giflib-dev libpng-dev \
    libwebp-dev orc-dev tiff-dev poppler-dev librsvg-dev libgsf-dev openexr-dev \
    py-gobject3-dev

ADD http://pngquant.org/pngquant-${PNGQUANT_VERSION}-src.tar.gz pngquant-src.tar.gz

RUN tar xvzf pngquant-src.tar.gz \
    && cd pngquant-${PNGQUANT_VERSION} \
    && ./configure --prefix=/usr \
    && make \
    && make install

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

ADD https://github.com/kohler/gifsicle/archive/v${GIFSICLE_VERSION}.zip gifsicle.zip
RUN unzip gifsicle.zip \
    && cd gifsicle-${GIFSICLE_VERSION} \
    && autoreconf -i \
    && ./configure --disable-gifview --disable-gifdiff \
    && make install

RUN apk --no-cache del curl alpine-sdk wget autoconf automake

WORKDIR $SERVICE_ROOT
