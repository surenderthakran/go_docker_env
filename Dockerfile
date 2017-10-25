FROM surenderthakran/go:1.7.3

MAINTAINER https://github.com/surenderthakran

ENV GOPATH /workspace
ENV PATH "$PATH:$GOPATH/bin"

ADD ./ $GOPATH

WORKDIR $GOPATH

RUN make --no-print-directory install

CMD make --no-print-directory run
