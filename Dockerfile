FROM archlinux:base-devel
WORKDIR app
RUN pacman --noconfirm -Syu rust git clang lld
COPY . .
RUN cd app/ && \
    git init && \
    git add -A && \
    git -c user.name='builduser' \
        -c user.email='build@email' \
        commit -m "Initial commit"
ENV EUID=1

# expected to fail
RUN cd pkg/ && makepkg --noconfirm -si || true
RUN ! stat /usr/bin/app

# expected to successfully build
RUN cd pkg/ && \
    patch -Np0 -i fix-build.patch && \
    makepkg --noconfirm -si

RUN /usr/bin/app