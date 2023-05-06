# Prize Picks Jurassic Park

## Requirements
- Docker (tested with 20.10.24)
- Docker Compose (tested with 2.17.2)

## Quick Start

1. Clone the repo
2. Run `docker compose up -d`
3. ... wait a few seconds for db initliazation
4. Run `curl localhost:3000/dinosaurs` to see the list of dinosaurs
5. Run `curl localhost:3000/cages` to see the list of cages
6. Run `docker compose run web bin/rails test --verbose` to run the tests
7. To see other available endpoints, run `docker compose run web bin/rails routes`

## Things I would do with more time

I completed all of the requirements and a decent chunk of the bonus. Here's the *bonus* I didn't complete:

- Cages have a maximum capacity for how many dinosaurs it can hold.
- Cages know how many dinosaurs are contained.
- Must be able to query a listing of dinosaurs in a specific cage.
- When querying dinosaurs or cages they should be filterable on their attributes (Cages on their power status and dinosaurs on species).

## Concurrency

Because this project uses Rails and Puma, you mostly get concurrency for free. I'd need some more specifics on the reuirements to know if I'd need to do anything special. At a minimum, we'd want to tweak the puma workers and threads based on load and compute resources. We'd also want to tweak the connection pool settings based on the number of puma threads/workers.
