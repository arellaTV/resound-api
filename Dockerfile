FROM rails:onbuild
MAINTAINER Louise Yang (louise.yang@scpr.org)

RUN echo "deb http://www.deb-multimedia.org jessie main non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://www.deb-multimedia.org jessie main non-free" >> /etc/apt/sources.list && \
    apt-get -y --force-yes install deb-multimedia-keyring && \
    apt-get update && \
    apt-get -y --force-yes install build-essential libvorbis-dev libfdk-aac-dev libtheora-dev libspeex-dev yasm pkg-config libfaac-dev libopenjpeg-dev libx264-dev && \
    mkdir ffmpeg_extracted && \
    cd ffmpeg_extracted && \
    wget http://ffmpeg.org/releases/ffmpeg-3.2.2.tar.bz2 && \
    cd .. && \
    mkdir ffmpeg_src && \
    cd ffmpeg_src && \
    tar xvjf ../ffmpeg_extracted/ffmpeg-3.2.2.tar.bz2 && \
    cd ffmpeg-3.2.2 && \
    ./configure --enable-gpl --enable-postproc --enable-swscale --enable-avfilter --enable-libvorbis --enable-libtheora --enable-libx264 --enable-libspeex --enable-shared --enable-pthreads --enable-libopenjpeg --enable-libfdk-aac --enable-nonfree && \
    make && \
    make install && \
    echo "include /usr/local/lib/" >> /etc/ld.so.conf && \
    ldconfig

CMD ffmpeg -version