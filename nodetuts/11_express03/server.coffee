express = require 'express'
products = require './products'

app = express.createServer()

app.configure ->
  app.use express.logger()
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.static __dirname + '/static'

app.configure 'development', ->
  app.use express.errorHandler
    dumpExceptions: true
    showStack: true

app.configure 'production', ->
  app.use express.errorHandler()

app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

app.get '/', (req, res) ->
  res.render 'root'

app.get '/products', (req, res) ->
  res.render 'products/index',
    locals:
      products: products.all

app.get '/products/new', (req, res) ->
  res.render 'products/new',
    locals:
      product: products.new

app.post '/products', (req, res) ->
  id = products.insert req.body.product
  res.redirect "/products/#{id}"

app.get '/products/:id', (req, res) ->
  product = products.find req.params.id
  res.render 'products/show',
    locals:
      product: product

app.get '/products/:id/edit', (req, res) ->
  product = products.find req.params.id
  res.render 'products/edit',
    locals:
      product: product

app.put '/products/:id', (req, res) ->
  products.set req.params.id, req.body.product
  res.redirect "/products/#{req.params.id}"

app.listen 4000
