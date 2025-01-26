FROM golang:1.22.5

WORKDIR /app

COPY go.mod go.sum ./

COPY . .

RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main

CMD ["/main"]