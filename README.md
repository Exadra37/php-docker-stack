# Php Docker Stack

Php Docker stack to run Php Apps in Production and Development, using Docker
Compose Services to run any Php version, Databases, Cache, Queues, Logs and much
more...

From now on, no need to keep messing around the Operating System to have a full development stack ready to build our awesome Php Apps.


## MENU

* **The Package**
    + [Why Exists?](./docs/the-package/why_exists.md)
    + [What Is It?](./docs/the-package/what_is_it.md)
    + [When To use It?](./docs/the-package/when_to_use_it.md)
* **How To**
    + [Install](./docs/how-to/install.md)
    + [Use](./docs/how-to/use.md)
    + [Report an Issue](./docs/how-to/create_an_issue.md)
    + [Create a Branch](./docs/how-to/create_branches.md)
    + [Open a Merge Request](./docs/how-to/create_a_merge_request.md)
    + [Uninstall](./docs/how-to/uninstall.md)
* **Demos**
    + [Laravel 5.5](./docs/demos/laravel-5.5.md)
* **Road Map**
    + [Milestones](https://gitlab.com/exadra37-docker/php/docker-stack/milestones)
    + [Overview](https://gitlab.com/exadra37-docker/php/docker-stack/boards)
* **About**
    + [Author](AUTHOR.md)
    + [Contributors](CONTRIBUTORS.md)
    + [Contributing](CONTRIBUTING.md)
    + [License](LICENSE)


## SUPPORT DEVELOPMENT

If this is useful for you, please:

* Share it on [Twitter](https://twitter.com/home?status=Try%20%23PhpDockerStack%20to%20run%20%23PhpApps%20by%20%40Exadra37%20https%3A//gitlab.com/exadra37-docker/php/docker-stack%20%23php%20%23phpc%20%23phpapp%20%23phpdevelopers%20%23docker%20%23dockercompose%20%23laravel) or in any other channel of your preference.
* Consider to [offer me](https://www.paypal.me/exadra37) a coffee, a beer, a dinner or any other treat 😎.


## EXPLICIT VERSIONING

This repository uses [Explicit Versioning](https://gitlab.com/exadra37-versioning/explicit-versioning) schema.


## BRANCHES

Branches are created as demonstrated [here](docs/how-to/create_branches.md).

This are the type of branches we can see at any moment in the repository:

* `master` - issues and milestones branches will be merged here. Don't use it in
              production.
* `last-stable-release` - matches the last stable tag created. Useful for
                           automation tools. Doesn't guarantee backwards
                           compatibility.
* `4-fix-some-bug` - each issue will have is own branch for development.
* `milestone-12_add-some-new-feature` - all Milestone issues will start, tracked and merged
                             here.

Only `master` and `last-stable-release` branches will be permanent ones in the
repository and all other ones will be removed once they are merged.


## DISCLAIMER

By default this Php Docker Stack only supports Php Apps requiring versions of
Php `>= 7.0`.

This was a conscious decision to help adoption of awesome Php7 and not have to
duplicate efforts in supporting old Php versions... you know I do this in my
free time ;).

But using the Php Docker Stack for older Php Versions is easy as using the
`.env` file to override the required docker images for Php by other ones
supporting the desired Php version your project is running on.
