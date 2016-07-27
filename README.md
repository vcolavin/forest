[![Build Status](https://travis-ci.org/vcolavin/forest.svg?branch=master)](https://travis-ci.org/vcolavin/forest)

# A RESTful forest
Get it?

![logo](https://raw.githubusercontent.com/descartez/forest-client/master/docs/img/forest-logo.png)

## Introduction

This is the API back end for a silly project currently under active development.

Inspired by certain aspects of Dwarf Fortress, Minecraft, and [Proteus](http://twistedtreegames.com/proteus/). A read-only experience where someone can walk through a (hopefully) rich environment, looking closely at objects and animals, their histories, and relationships with each other.

[Click here to see the API on Heroku!](http://restful-forest.herokuapp.com/api/v1/location?x=1&y=1)

[You can read about development on here on my blog!](https://vcolavin.wordpress.com/tag/dev-blog/)

## Installation

It doesn't involve any unusually complex setup. Bundle, create database, run seeds, and run server, as per usual.

## Sample response
```
  "message": "some generated message yay",
  "data": {
    "location": {
      "x": 1,
      "y": 2,
      "actions": {
        "north_url": "/api/v1/locations?x=1&y=3",
        "south_url": "/api/v1/locations?x=1&y=3",
        ...
      },
      "objects": [
      {
        "kind": "tree",
        "actions": {"details_url": "/api/v1/trees/3"}
      },
      {
        "kind": "wolf",
        "name": "jandice",
        "actions": {
          "details_url": "/api/v1/wolves/4",
          "say_hello_url": "/api/v1/wolves/4/say_hello"
        }
      }]
    }
  }
```

## More detailed notes on code stuff.
### Requests
- Only accepts GET requests; the forest is read-only.

### Locations
- Locations have a reverse-polymorphic relationship with other objects. [Read about RP on my blog here](https://vcolavin.wordpress.com/2016/06/01/reverse-polymorphism-aka-polymorphic-join/).
- Location routes are not typically RESTful (`/locations/:id`), but use a less opaque route (`locations?x={x}&y={y}`).

### Object composition
- Objects gain behavior through decoration.
- For example, to move a wolf: `Movable.new(wolf).move_north!`

### JBuilder views vs. Object#to_builder method
- Every object has both a JBuilder view stored in `views/.../[objects]/show.json.jbuilder` in addition to a #to_builder method on its model.
- The JBuilder view is what is served when you visit that object's show page (its "details" action), and the #to_builder method is used when that object is being summarized in another object's page, e.g. the response for a location with a wolf in it uses the Wolf#to_builder method.

### Views and Presenter
- View logic is abstracted into a presenter. Views should not touch models

### Test coverage
- Most of this code is TDD'd.
- What isn't TDD'd is tested shortly after.

### HATEOAS
- This app is HATEOAS. The user should be able to navigate using the API purely.
- Actions in the response *and* decorator methods that generate action URIs all end in `_url`
- URIs in the response are relative, not absolute. So, `/api/v1/locations?x=1&y=2`, not `http://some-host.com/api/v1/locations?x=1&y=2`.

## Contributing
- If you've got a one time bugfix, you can either submit a PR or open up an issue. Please make sure all tests pass before submitting a PR!
- If you want to become a regular contributor, please shoot me a message to vcolavin (at) gmail, or on twitter @vincentcolavin. I am very friendly!
