[toc]
# What is HTTP?


It's *Hyper Text Transfer Protocol.* It's communication between server and client. 

Send a `GET` or `POST` request and get response, in formal, is Send a HTTP `GET` request, or HTTP `POST` request. For common use, I'd just call it `GET` request and other in similar way.

## What is HTTPS?

It's *Hyper Text Transfer Protocol Secure.* Every request and data sent is encrypted by one of the:

- SSL
- TLS

## HTTP/2 version

![http-version](https://blog.restcase.com/content/images/2018/01/http1-vs-http2-multiplexing.png) 

In HTTP/1.1, we used to send request and get response for every single file of a webpage, e.g. `index.html`, `xxx.js`, `xxx.css` respectively.

But since HTTP/2, we can send multiple requests and get it back.

It reduce latency, and it's more fast and efficient.

# Stateless

Stateless means every request is independent. You open Youtube, and then check Wikipedia. These request does not know each other.

But even though it's stateless, you can use cookie, programming, session to enhance user experience. That way, each request is not really independent.

# HTTP Methods

[http methods](https://www.restapitutorial.com/lessons/httpmethods.html) 

- `GET`: retrieve data from server. E.g. Search on Google
- `POST`: submit data to server. E.g. Submit a contact form
- `PUT`: Update data on the server. E.g. Update the blog post
- `DELETE`: Delete the data from the server

# HTTP Header fields

## Header

### General

Take visit `www.google.com` for example

- Request URL: www.google.com
- Request Method: GET
- Status Code: 200
- Remote Address: [2a00:1450:400b:c01::6a]:443. This is IPv6

### Request

- Cookies
- Accept-xxx
- Content-Type
- Content-Length
- Authorization: When want to login, this is required.
- User-agent: what device the user using
- Referrer

### Response

- Server: information of what server is. E.g. nginx
- Set-Cookie
- Content-Type - e.g. Json
- Content-Length
- Date

## Body

**`GET` request does not have a body.**

The body is usually a html file. Contains everything needs to be rendered in web browser.

## HTTP Status codes

- `1xx` informational: request received / processing
- `2xx` success
- `3xx` redirect
- `4xx` client side error
- `5xx` server side error

Common status codes

| code | Meaning               |
|------|-----------------------|
| 200  | OK                    |
| 201  | OK created            |
| 301  | redirect to new URL   |
| 304  | Not modified (cached) |
| 400  | Bad request           |
| 401  | Unauthorized          |
| 404  | Not found             |
| 500  | Server error          |

Code `304` happens a lot when develop a website. For example, when I build a website and send request. But the new updates is not shown, my browser is cached for old data. That's `304`.

# Development for website

When develop a website, to access the HTTP header and body, there are multiple tools available:

- Postman: a GUI program
- Curl: command line tool

Use either to develop a webpage.
