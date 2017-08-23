# Build the project
FROM golang as builder
WORKDIR /go/src/github.com/dbmedialab/demoapp
ADD . .
RUN CGO_ENABLED=0 go build -tags embedded  -a -installsuffix cgo -o "main" main.go

# Create production image for application with needed files
FROM alpine
EXPOSE 8080
RUN apk add --no-cache ca-certificates
COPY --from=builder /go/src/github.com/dbmedialab/demoapp/main .
CMD ["./main"]
