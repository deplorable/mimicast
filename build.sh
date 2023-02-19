#!/bin/sh

BUILDKIT_PROGRESS=plain docker build --tag mimicry:1.0.0 --force-rm - < Dockerfile

