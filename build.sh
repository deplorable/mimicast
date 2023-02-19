#!/bin/sh

BUILDKIT_PROGRESS=plain docker build --tag mimicdock:1.0.0 --force-rm - < Dockerfile

