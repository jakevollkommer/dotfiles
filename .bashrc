#!/bin/bash

export PATH="/anaconda3/bin:$PATH"
export PATH="$PATH:~/flutter/bin"

ytdl() { youtube-dl --user-agent \"\" "$1" -f 266+251 --merge-output-format mp4 -k; }
mp4tomov() { ffmpeg -i "$1" -acodec copy -vcodec copy -f mov "$2"; }

mkcd ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}
vnc() {
  eval $(docker-machine env farm-1)
  docker ps -f publish=5900 -q | xargs -n1 docker port | cut -c 21- | grep -v 5900 | xargs -I {} echo "vnc://root:rsbotpas@`docker-machine ip farm-1`:"{} | xargs -n 1 open
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/jakevollkommer/.sdkman"
[[ -s "/Users/jakevollkommer/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jakevollkommer/.sdkman/bin/sdkman-init.sh"
