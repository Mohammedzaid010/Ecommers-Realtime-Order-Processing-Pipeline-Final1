%dw 2.0
output application/java
---
{
  orderId: payload.orderId,
  orderDate: (payload.orderDate as DateTime >> 'UTC') as String {format: 'yyyy-MM-dd HH:mm:ss'},
  customerId: payload.customer.customerId,
  customerName: payload.customer.name,
  customerEmail: payload.customer.email,
  customerPhone: payload.customer.phone default null,
  address: payload.shippingAddress.addressLine1,
  city: payload.shippingAddress.city,
  state: payload.shippingAddress.state,
  postalCode: payload.shippingAddress.postalCode,
  country: payload.shippingAddress.country,
  paymentMethod: payload.paymentMethod,
  currency: payload.currency,
  totalAmount: payload.totalAmount,
  correlationId: payload.correlationId default correlationId
}
