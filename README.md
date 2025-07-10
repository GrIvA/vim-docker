

Make docker image
`$ docker build -t "GrIvA/vim:dev" .`

Add alias to your shell. My example for `fish` shell:
```
function vv --description 'alias vv - Start vim in docker container'
  set -l vim_img 'GrIvA/vim-ii:dev'
  set -l current_path (command echo pwd | sum | awk '{print $1}')
  set -l container (command docker ps -a | grep docker-vim-$current_path)

  if string length -q $container
      docker start -ai docker-vim-$current_path
      # docker exec -it docker-vim-$current_path vim
  else
      docker run -it \
          --entrypoint vim \
          --name docker-vim-$current_path \
          -v $PWD:/project \
          -e TERM="screen-256color" \
          -e PUID="$(id -u)" \
          -e PGID="$(id -g)" \
          $vim_img $argv
  end
end

```

Go to a working folder.
Use docker vim as   `$ vv`


Note: The first time you use it, you need to install/update the plugins.
 - `docker run -it --name docker-vim -v $PWD:/project -e PUID="$(id -u)" -e PGID="$(id -g)" GrIvA/vim:dev`
 - `:PluginInstall` inside of container vim
 - exit from vim
 - and commit new image `docker commit <container_id> GrIvA/vim-i:dev`
 (can try to make new image from current vim container `docker export 1f75726fda2a | docker import - GrIvA/vim-i:dev`)

Enjoy )
