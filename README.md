# BuildBuddy login example

Example showing how to automatically provision BuildBuddy credentials
via an in-repo [`tools/bazel`](tools/bazel) wrapper.

The only dependency is `bazelisk`.

## How it works

- [`.bazelrc`](.bazelrc) contains some configuration like `--bes_backend=example.buildbuddy.io`
  to allow uploading your Bazel builds to your BuildBuddy organization (in this case,
  the `example` organization).
- [`tools/bazel`](tools/bazel) uses the BuildBuddy CLI (provisioned by `bazelisk`) to log in to BuildBuddy.
  The API key is written to `.git/info/buildbuddy-auth.bazelrc`, so that it's associated with
  the local git repository, but not tracked by git.
- [`.bazelrc`](.bazelrc) imports the written configuration to properly authenticate all builds.

## Try it out

1. Clone the repo.
2. In [`.bazelrc`](.bazelrc) and [`tools/bazel`](tools/bazel), replace 'example' with your BuildBuddy organization.
3. Try running `bazelisk build //...`
