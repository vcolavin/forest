# A RESTful forest

Haha, get it?

Anyways, this is the API back end for a solo personal project currently under active development. It's built off [rails-api](https://github.com/rails-api/rails-api) and doesn't involve any unusually complex setup.

[Click here to see the API on Heroku!](http://restful-forest.herokuapp.com/)

Inspired by certain aspects of Dwarf Fortress and Minecraft. At least at first, it'll be a read-only experience where someone can walk through a (hopefully) rich environment, looking closely at objects, their histories, and relationships with each other. I'd love for the API to be fully RESTful and follow HATEOAS, so that someone could explore the forest through the API alone.

I intend on building a decoupled front end for this forest eventually, but that's not happening right now.

[You can read about development on here on my blog!](https://vcolavin.wordpress.com/tag/dev-blog/)


Some thoughts and to-dos:
- How are things described?
  - Can you make a gem like Faker that produces words and phrases on demand?
    - Like MyFakerGem::Wolf.describe for example
  - Or maybe you will create decorators for the models that provide this functionality. Maybe *those* decorators will make use of a gem which provides phrases.

- Let's make this HATEOAS.
  - Every object will have a url_for method that will automatically assume that will travel to that object. The "details" route.
  - Actions will be grouped per object. Movement will count as an action on a location. The name of an action will be the verb one could expect to type into a terminal to invoke the action.
  E.g.
  ```
    "data": {
      "location": {
        "x": 1, "y": 2, ...,
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

- Consider the chron job that makes things grow and move around. How does it work?
  - It will call every object's #live method, which will be largely custom per model. It will move if it can, it will blah blah blah.
  - Can a free Heroku account even handle chron jobs?