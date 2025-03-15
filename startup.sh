#!/bin/bash

pm2 delete all

# Start the first server on port 8080 in ~/code/pros-docs/pros-doxygen-docs using PM2
pushd ~/code/pros-docs/pros-doxygen-docs
pm2 start $(which http-server) --name pros-doxygen-docs -- -p 8080 &
popd

# Start the second server on port 8081 in ~/code/Desmos-Offline-Mode/app using PM2
pushd ~/code/Desmos-Offline-Mode/app
pm2 start $(which http-server) --name desmos-offline-mode -- -p 8081 &
popd

# Start the third server on port 8082 in ~/code/path.jerryio/build using PM2
pushd ~/code/path.jerryio/build
pm2 start $(which http-server) --name jerryio-build -- -p 8082 &
popd