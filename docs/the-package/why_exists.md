# WHY EXISTS?

This project was born from the desire of having a Docker work-flow done in the right way, that can used between
Production and Development without discrepancies and ambiguities.

A proper Docker work-flow is based around the production set-up and all development set-up is build on top of the Docker
images for production. This is the only way of having 100% parity between both environments.

Anything we add when extending a production image for development should be only tooling to help with development, but
we should NEVER override the production set-up, unless strictly necessary to avoid side effects.

For example if we use a different Nginx/Mysql/Php set-up in development than we loose the so desired parity with
production and we are shooting ourselves in the foot, thus given space to commentaries like:

> but it works on my machine...

Using Docker is precisely to avoid the above type of commentaries.


---

[<< previous](./../../README.md) | [next >>](what_is_it.md)

[HOME](./../../README.md)

