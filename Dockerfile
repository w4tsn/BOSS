FROM dockcross/windows-x86
MAINTAINER Alexander Wellbrock <alexander.wellbrock@cs.hs-fulda.de>

ENV BWAPI_VERSION=4.1.2

# Include the VS 2013 pre-build version of bwapi 412
# These are the contents of the official installer
COPY dockerdata/BWAPI/BWAPI /tmp/bwapi
RUN echo "export BWAPI_DIR=/tmp/bwapi" >> /root/.bashrc

#RUN curl -L https://github.com/bwapi/bwapi/releases/download/v4.1.2/BWAPI_412.7z -o /tmp/bwapi.7z \
#   && 7za x -o/tmp/bwapi /tmp/bwapi.7z \
#      && rm /tmp/bwapi.7z \
#      && mv /tmp/bwapi/Release_Binary/* /tmp/bwapi \
#      && rm -R /tmp/bwapi/Release_Binary \
#   && export BWAPI_DIR=/tmp/bwapi

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