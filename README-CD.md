# Project 5: Introduction to the Design of Information Technology Systems - CEG3120
  
## Name: Chase Ennis       




### Part 1: Semantic Versioning

1. Project Overview:
   * I am being asked to modify my workflow (`main.yml`) from project 4 to automatically build and push the image to dockerhub when I push the tag to github.
2. Semantic Versioning Format:
   * `Major`.`Minor`.`Patch`
   * For this project, I focus on `{{major}}`, `{{major}}.{{minor}}`, `latest` and the way my workflow is set up also includes `main` 
   * [Semantic Versioning](https://semver.org/)
3. Generating a Tag:
   * `git tag -a v1.0.0 -m "Version 1.0.0"`
     * `-a`: creates annnoted tag
   * `git push origin --tags`
4. Deleting a Tag:
   * `git tag -d v1.0.0`
   * ` git push --delete origin v1.0.0`
5. Updated `main.yml` file:

```
        name: Build and Push Docker chase_project4_image
        
        on:
          push:
            branches:
              - 'main'
            tags:
              - 'v*.*'
          pull_request:
            branches:
              - 'main'
        
        jobs:
          docker:
            runs-on: ubuntu-latest
            steps:
              -
                name: Checkout
                uses: actions/checkout@v2
        
              -
                name: Docker meta
                id: meta
                uses: docker/metadata-action@v5
                with:
                  images: |
                    buckeyechase135/chase_project4_image
                  tags: |
                    type=ref,event=branch
                    type=ref,event=pr
                    type=semver,pattern={{version}}
                    type=semver,pattern={{major}}.{{minor}}
                    type=semver,pattern={{major}}
        
              -
                name: Login to DockerHub
                if: github.event_name != 'pull_request'
                uses: docker/login-action@v3
                with:
                  username: ${{ secrets.DOCKER_USERNAME }}
                  password: ${{ secrets.DOCKER_PASSWORD }}
        
              -
                name: Build and push
                uses: docker/build-push-action@v5
                with:
                  context: .
                  push: ${{ github.event_name != 'pull_request' }}
                  tags: ${{ steps.meta.outputs.tags }}
                  labels: ${{ steps.meta.outputs.labels }}
```
6. Explanation:
   * `name`: Name of Action Workflow
   * `on`: specifies the events that trigger the workflow
      * for this the tag must follow this specific pattern: `'v*.*'`
   * `jobs`: specifies the jobs that will happen while the workflow is executed
   * `runs-on`: specifies the runner needed for the job
      * In this case it is the latest version of Ubuntu (`ubuntu-latest`)
   * `steps`: these are the actions that will be completed. This Workflow has 4
       1. `actions/checkout@v2`: checkout action that uses the code found inside the repository folder
       2. `docker/metadata-action@v5`: metadata action that gathers data about the image. For this use, it gathers the data about the tags
       3. `docker/login-action@v3`: login action which authenticates my account to DockerHub using the Repository Secrets
       4. `docker/build-push-action@v5`: build and push actions which build and push the image
           * executes when I `push` to `GitHub` not when I `pull` from `GitHub` as seen in this line: `push: ${{ github.event_name != 'pull_request' }}`
           * references `tags` and `labels` from the `metadata` action
7. [Updated DockerHub Repository](https://hub.docker.com/repository/docker/buckeyechase135/chase_project4_image/tags?page=1&ordering=last_updated)
8. Proof:
    * ![DockerHub Image](part2images/dockerhub1.png)
    * ![DockerHub Image](part2images/dockerhub2.png)
      


### Part 2: Deployment





### Part 3: Diagramming
