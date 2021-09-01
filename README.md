# docker-articulate-node-images

Image-crushing base docker image, to make local builds of [`images`](https://github.com/articulate/images)
faster.

## To test locally

1. Run `make` to build a `local/articulate-node-images` image locally
2. Change the first line of your `images/Dockerfile` to be:

```dockerfile
FROM local/articulate-node-images
```

3. Then in `images`, run:

```shell
docker-compose build --no-cache && docker-compose up -d
```

Now you can test your changes by hitting `https://images.dev.articulate.zone`.
After making more changes, just repeat steps 1-3 above to rebuild and test.
