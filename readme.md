# QR Code generator Docker Image

## Description

Small docker image with QR code generator tool (`libqrencode`) based on Alpine linux. Can generate QR codes in SVG, PNG, PNG32, EPS, XPM, ANSI, ANSI256, ASCII formats.

For more info see https://github.com/fukuchi/libqrencode

## Usage

For `qrencode` usage and command line options run:

```sh
docker run --rm dhlavaty/qrcode qrencode --help
```

### Basic usage

```sh
# Encode 'My message' string into QR code image in PNG format
$ echo -n "My message" | docker run --rm -i dhlavaty/qrcode qrencode -o - > output.png

# Encode 'My message' string into QR code image in SVG format
$ echo -n "My message" | docker run --rm -i dhlavaty/qrcode qrencode -t SVG -o - > output.svg

# Encode 'My message' string into QR code image in SVG format, with highest error correction level
$ echo -n "My message" | docker run --rm -i dhlavaty/qrcode qrencode -l H -t SVG -o - > output.svg
```

### Some advanced examples

```sh
# QR code to send SMS to number '+12345' with text 'Text to send in SMS!'
$ echo -n "SMSTO:+12345:Text to send in SMS!" | docker run --rm -i dhlavaty/qrcode qrencode -o - > output.png

# QR code with phone number '+12345'
$ echo -n "tel:+12345" | docker run --rm -i dhlavaty/qrcode qrencode -o - > output.png

# QR code to connect to open WIFI network 'networkname' (without password)
$ echo -n "WIFI:S:networkname;;" | docker run --rm -i dhlavaty/qrcode qrencode -o - > output.png

# QR code to connect to WIFI network 'networkname' with password '123'
$ echo -n "WIFI:S:networkname;P:123;;" | docker run --rm -i dhlavaty/qrcode qrencode -o - > output.png

# QR code to connect to WIFI network 'networkname' with password '123' (WPA / WPA2)
$ echo -n "WIFI:T:WPA;S:networkname;P:123;;" | docker run --rm -i dhlavaty/qrcode qrencode -o - > output.png

# QR code to send email to 'email@example.com' with subject 'subject' and email body 'email text'
$ echo -n "mailto:email@example.com?subject=subject&body=email text" | docker run --rm -i dhlavaty/qrcode qrencode -o - > output.png
```

## Docker build

Build multi-arch image:

```sh
$ docker buildx create --name mybuilder
$ docker buildx use mybuilder

# (Optional) check your builder
$ docker buildx inspect

$ docker buildx build --platform linux/amd64,linux/arm64 --tag dhlavaty/qrcode . --push

# (Optional) Inspect your image
$ docker buildx imagetools inspect dhlavaty/qrcode
```

Lint dockerfile:

```sh
$ docker run --rm -i hadolint/hadolint < Dockerfile
```

## License

This project is licensed under MIT - http://opensource.org/licenses/MIT
