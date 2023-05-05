#!/bin/bash

bin/rails db:prepare

exec "${@}"
