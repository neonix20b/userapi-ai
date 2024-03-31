#!/bin/env bash

rm -rf userapi-ai-*.gem
gem build userapi-ai.gemspec
gem push userapi-ai-*.gem
