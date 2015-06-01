# extend Nav functionality with NavPipeline
NavPipeline =

  # creates an action pipeline
  _pipeline: new Chain('pipeline')

  # store the original
  _originalOnLocation: Nav.onLocation.bind Nav

  # override onLocation to put actions with options/id into the pipeline
  onLocation: (action) ->

    # if the action has options and an id then add it to the pipeline
    if action?.options?.id?
      NavPipeline._pipeline.add action

    else # use the original onLocation
      NavPipeline._originalOnLocation action

    # create a tracker to execute the pipeline.
    # only need to do this once.
    unless NavPipeline._computations?
      NavPipeline._computations = Tracker.autorun (c) ->
        # create the context with the location
        context = location:Nav.get.location()
        # first run is when we create this tracker, so don't call the pipeline
        # if location doesn't exist it's before the app+browser has initialized
        # so don't call the pipeline
        if not c.firstRun and context.location?
          NavPipeline._pipeline.execute context

    return

# perform extend
_.extend Nav, NavPipeline
