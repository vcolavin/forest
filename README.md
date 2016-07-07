# A RESTful forest
Get it?

## Introduction

This is the API back end for a silly project currently under active development.

Inspired by certain aspects of Dwarf Fortress, Minecraft, and [Proteus](http://twistedtreegames.com/proteus/). A read-only experience where someone can walk through a (hopefully) rich environment, looking closely at objects and animals, their histories, and relationships with each other.

[Click here to see the API on Heroku!](http://restful-forest.herokuapp.com/api/v1/location?x=1&y=1)

[You can read about development on here on my blog!](https://vcolavin.wordpress.com/tag/dev-blog/)

##Technical details and installation

It doesn't involve any unusually complex setup. Bundle, create database, run seeds, and run server, as per usual.

Here is a sample response, which is not yet completely implemented:
```
  "message": "some generated message yay",
  "data": {
    "location": {
      "x": 1,
      "y": 2,
      "actions": {
        "north_url": "/location?x=4&y=3",
        "south_url": "etc.",
        "jump": "etc.",
        ...
      },
      "objects": [
      {
        "kind": "tree",
        "actions": {"details_url": "/tree/3"}
      },
      {
        "kind": "wolf",
        "name": "jandice",
        "actions": {
          "details_url": "/wolf/4",
          "say_hello_url": "/wolf/4/hello"
        }
      }]
    }
  }
```

## More detailed notes on code stuff.
### Locations
- Locations are special and get to break a few rules.
- Locations have a reverse-polymorphic relationship with other objects. [Read about RP on my blog here](https://vcolavin.wordpress.com/2016/06/01/reverse-polymorphism-aka-polymorphic-join/).
- Location routes are not typically RESTful (`/locations/:id`), but use a less opaque route (`locations?x={x}&y={y}`). This is meant to make life easier on the consumer.

### Object composition
- Objects all their non-specific behavior from module injection.
- These modules are defined in `lib/`

### JBuilder views vs. Object#to_builder method
- Every object has both a JBuilder view stored in `views/.../[objects]/show.json.jbuilder` in addition to a #to_builder method on its model.
- This may seem redundant, but the JBuilder view is what is served when you visit that page, and the #to_builder method is used when that object is being summarized as belonging to a parent object, e.g. the response for a location with a wolf in it uses the Wolf#to_builder method.

### Views and Decorators
- I don't like the way Rails models tend to get "fat". View logic is abstracted into a decorator. Views are not allowed to touch models.
- [This is why I'm not using Draper](http://thepugautomatic.com/2014/03/draper/)

### Test coverage
- I'm aiming for very high test coverage.
- Most of this code is TDD'd.
- What isn't TDD'd is tested shortly after.
- Untested code can't make it into master.
- Uncoded tests can.

### HATEOAS
- This app is HATEOAS. The user should be able to navigate using the API purely.
- Actions in the response *and* decorator methods that generate action URIs all end in `_url`
- URIs in the response are relative, not absolute. I.e. `api/v1/locations?x=1&y=2`, not `http://some-host.com/locations?x=1&y=2`.

## Some plans.
- The interesting part of this apps development (the life of the animals) has not yet begun. I might be in over my head. I will find out.

- Every object will have a description.
  - Can you make a gem like Faker that produces words and phrases on demand?
    - Like MyFakerGem::Wolf.describe for example
  - Or maybe you will create decorators for the models that provide this functionality. Maybe *those* decorators will make use of a gem which provides phrases.

- Every object will have a history, or log.
  - This will include movements, interactions, and will be viewable.

- This app will rely on chron jobs to call each objects `#live` method, triggering a "turn" of life in the forest.
  - Can a free Heroku account even handle chron jobs?
  - This will be a great opportunity to learn basic game dev ideas, such as AI pathfinding and decision trees and such.

- The forest's seeds will be unusually important. They will be actively worked on to create a more
  - To that end, every time new things are added to the forest, new seeds might have to be written in order to not completely wipe the forest

## The front end
Here are some temporary notes about the front-end, which is not being developed at all right now.
  - It will be React.
  - It will resemble a terminal.
  - It would be fun for it to use D3 to make interesting visualizations based on data served by the app (e.g. animal distribution heatmaps, bar graphs of interaction types)

## Other
I'm interested in eventually making a non-JS (pure HTML + CSS) version of this app available. I'm still thinking about how that would get done.