FROM alpine:3

RUN apk --no-cache add git python3 nodejs npm fzf ripgrep alpine-sdk ncurses-dev curl xclip tig && \ 
    mkdir /project && \
    npm install --global yarn && \ 
    mkdir /build && \
    cd /build && \
    git clone --depth 1 https://github.com/vim/vim.git  && \
    cd vim && \
    make && \
    make install && \
    cd / && \
    rm -rf /build && \ 
    apk del alpine-sdk ncurses-dev


COPY .vim /root/.vim
COPY .vimrc /root/.vimrc

ENV TERM=screen-256color

WORKDIR /project

ENTRYPOINT ["vim"]
