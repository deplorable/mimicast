#!/bin/sh

BUILDKIT_PROGRESS=plain docker build --file Dockerfile --tag mimicast:1.0.0 --pull=false ./

