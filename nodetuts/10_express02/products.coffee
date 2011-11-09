products = [
  id: 1
  name: 'MacBook Pro'
  description: 'Apple 13 inch MacBook Pro Notebook'
  price: 1000
,
  id: 2
  name: 'iPad'
  description: 'Apple 64GB 3G iPad'
  price: 899
]

module.exports.all = products

module.exports.find = (id) ->
  id = parseInt id, 10
  for product in products
    return product if product.id is id
