FROM dockcross/windows-x86
MAINTAINER Alexander Wellbrock <alexander.wellbrock@cs.hs-fulda.de>

ENV BWAPI_VERSION=4.1.2
ENV BWTA_VERSION=2.2

# Include the VS 2013 pre-build version of bwapi 412
# These are the contents of the official installer
ENV BWAPI_DIR /tmp/bwapi
RUN echo "export BWAPI_DIR=$BWAPI_DIR" >> /root/.bashrc
RUN curl -L https://github.com/lionax/bwapi/releases/download/v4.1.2/BWAPI-4.1.2.zip -o /tmp/bwapi.zip \
   && unzip /tmp/bwapi.zip -d $BWAPI_DIR \
      && mv $BWAPI_DIR/BWAPI/* $BWAPI_DIR \
      && rm -R $BWAPI_DIR/BWAPI \
      && rm /tmp/bwapi.zip \
      && chmod 755 -R $BWAPI_DIR

RUN curl -L https://github.com/miloyip/rapidjson/archive/v1.1.0.tar.gz -o /tmp/rapidjson.tar.gz \
      && mkdir /tmp/rapidjson \
      && tar -xf /tmp/rapidjson.tar.gz -C /tmp/rapidjson \
      && rm /tmp/rapidjson.tar.gz \
      && mv /tmp/rapidjson/rapidjson-1.1.0/* /tmp/rapidjson \
      && rm -R /tmp/rapidjson/rapidjson-1.1.0 \
      && chmod 755 -R /tmp/rapidjson \
   && echo "export RAPIDJSON_DIR=/tmp/rapidjson" >> /root/.bashrc

# Call a check-version script to check all build-in libraries for newer version
# ENTRYPOINT ['check-version']