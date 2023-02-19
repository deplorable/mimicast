#!/bin/sh

BUILDKIT_PROGRESS=plain docker build --tag mimicast-base:1.0.0 --force-rm - < Dockerfile

