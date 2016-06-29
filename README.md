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
  "data": {
    "location": {
      "x": 1,
      "y": 2,
      "actions": {
        "go_north": "/location?x=4&y=3",
        "go_south": "etc.",
        "jump": "etc.",
        ...
      },
      "objects": [
      {
        "kind": "tree",
        "actions": {"details": "/tree/3"}
      },
      {
        "kind": "wolf",
        "name": "jandice",
        "actions": {
          "details": "/wolf/4",
          "say_hello": "TODO: what does this look like?"
        }
      }]
    }
  }
```

## Some plans.
- The interesting part of this apps development (the life of the animals) has not yet begun. I might be in over my head. I will find out.

- Every object will have a description.
  - Can you make a gem like Faker that produces words and phrases on demand?
    - Like MyFakerGem::Wolf.describe for example
  - Or maybe you will create decorators for the models that provide this functionality. Maybe *those* decorators will make use of a gem which provides phrases.

- Every object will have a history, or log.
  - This will include movements, interactions, and will be viewable.

- This app is HATEOAS
  - Every object will have a url_for method that will automatically assume that will travel to that object. The "details" route.
  - Actions will be grouped per object. Movement will count as an action on a location. The name of an action will be the verb one could expect to type into a terminal to invoke the action.

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