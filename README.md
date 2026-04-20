# `mise-amber`

> [!CAUTION]
> Just use `mise use -g github:amber-lang/amber` (or `mise use -g github:amber-lang/amber@nightly`) to directly use github backend and install mise from official github repository.

[Mise](https://github.com/jdx/mise) plugin that brings [Amber Lang](https://amber-lang.com/).

<!-- toc -->

- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

<!-- tocstop -->

## Installation

```bash
mise plugin install amber https://github.com/devastion/mise-amber
```

## Usage

```bash
# list available versions
mise ls-remote amber

# install specific version
mise install amber@0.5.1-alpha

# use version globally
mise use -g amber@nightly
```

## Contributing

Contributions of any kind welcome! See the [contributing guide](/CONTRIBUTING.md).

## License

See [LICENSE](/LICENSE).
