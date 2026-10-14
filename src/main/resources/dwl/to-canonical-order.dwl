%dw 2.0
output application/json
var p = payload.payload
---
{
  orderId: p.orderId,
  orderDate: p.orderDate,
  correlationId: payload.correlationId,
  customer: {
    customerId: p.customer.customerId,
    name: p.customer.name,
    email: p.customer.email,
    phone: p.customer.phone default null
  },
  shippingAddress: p.shippingAddress,
  paymentMethod: p.paymentMethod,
  currency: p.currency,
  totalAmount: p.totalAmount,
  items: p.items map (i) -> {
    productId: i.productId,
    productName: i.productName default '',
    quantity: i.quantity,
    unitPrice: i.unitPrice,
    lineTotal: i.quantity * i.unitPrice
  }
}
