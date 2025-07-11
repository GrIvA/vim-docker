FROM alpine:3 as base

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

# Second stage
FROM alpine:3

WORKDIR /project

COPY --from=base / /

ENV TERM=screen-256color

ENTRYPOINT ["vim"]
