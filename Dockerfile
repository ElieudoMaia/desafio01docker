FROM golang:1.19-alpine AS builder

WORKDIR /go/src

COPY main.go main.go

RUN ["go", "build", "main.go"]

FROM scratch

WORKDIR /app

COPY --from=builder /go/src/main .

CMD ["./main"]
