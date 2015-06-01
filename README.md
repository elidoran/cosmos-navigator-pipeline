# Cosmos Navigator Pipeline [![Build Status](https://travis-ci.org/elidoran/cosmos-navigator-pipeline.svg?branch=master)](https://travis-ci.org/elidoran/cosmos-navigator-pipeline)

Enhances `Nav.onLocation(fn)` to have an ordered pipeline execute when the location changes.

See [cosmos:chain](https://github.com/elidoran/cosmos-chain) for more details about using the pipeline (a special chain).

This packages depends on `cosmos:navigator-location` so when you add this package it will add `cosmos:navigator-location` automatically.

## Install

    $ meteor add cosmos:navigator-pipeline

## Usage: Nav.onLocation(fn)

All non-pipeline uses of `Nav.onLocation()` still function normally.

To use the pipeline you must set an `options` object on your action with an `id` property before calling `Nav.onLocation(action)`.

```coffeescript
# create your function
fn1 = (next, context) ->
  console.log 'location: ',context.location
  # this.location is the same value
  # Nav.location is the same value
  # call the next function in the pipeline and pass a context
  next context

# give your function an options with an id
fn1.options = id:'fn1'

# add it to Nav
Nav.onLocation fn1

# normal cosmos:navigator-location usage still works:
Nav.onLocation (location) -> console.log 'location: ', location
```

Note: the pipeline function receives a `context` object with the `location` in it, and, a `next` function to call the next action in the pipeline. You can pass any context you want to the `next()` call.

## MIT License
