FROM amazonlinux as buildstage
RUN yum install go -y
ENV GO111MODULE=off
WORKDIR /opt/calculator
COPY calculator.go /opt/calculator
RUN go build calculator.go

FROM scratch
COPY --from=buildstage /opt/calculator/calculator /opt/calculatorapp/calculator
ENTRYPOINT ["/opt/calculatorapp/calculator"]
