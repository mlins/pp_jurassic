#!/bin/bash

bin/rails db:prepare
bin/rails db:prepare RAILS_ENV=test

exec "${@}"
