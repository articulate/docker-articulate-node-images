FROM articulate/articulate-node:8-alpine

RUN apk update && apk add curl alpine-sdk wget

ENV LD_LIBRARY_PATH=/usr/local/lib
ARG GIFSICLE_VERSION=1.91
ARG VIPS_VERSION=8.6.3

RUN wget -O- https://github.com/jcupitt/libvips/releases/download/v8.6.3/vips-${VIPS_VERSION}.tar.gz | tar xzC /tmp \
    && apk update \
    && apk upgrade \
    && apk add \
    zlib libxml2 glib gobject-introspection \
    libjpeg-turbo libexif lcms2 fftw giflib libpng \
    libwebp orc tiff poppler-glib librsvg libgsf openexr \
    && apk add --virtual vips-dependencies build-base \
    zlib-dev libxml2-dev glib-dev gobject-introspection-dev \
    libjpeg-turbo-dev libexif-dev lcms2-dev fftw-dev giflib-dev libpng-dev \
    libwebp-dev orc-dev tiff-dev poppler-dev librsvg-dev libgsf-dev openexr-dev \
    py-gobject3-dev \
    && cd /tmp/vips-${VIPS_VERSION} \
    && ./configure --prefix=/usr \
                   --without-python \
                   --disable-static \
                   --disable-dependency-tracking \
                   --enable-silent-rules \
    && make -s install-strip \
    && cd $OLDPWD \
    && rm -rf /tmp/vips-${VIPS_VERSION} \
    && apk del --purge vips-dependencies \
    && rm -rf /var/cache/apk/*

RUN cd /tmp && curl -O https://www.lcdf.org/gifsicle/gifsicle-$GIFSICLE_VERSION.tar.gz \
    && tar zxf gifsicle-$GIFSICLE_VERSION.tar.gz \
    && cd gifsicle-$GIFSICLE_VERSION \
    && ./configure && make && make install

WORKDIR $SERVICE_ROOT
