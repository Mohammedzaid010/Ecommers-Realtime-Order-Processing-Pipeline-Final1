%dw 2.0
output application/json
---
{
  correlationId: vars.correlationId,
  eventType: 'ORDER_RECEIVED',
  eventTimestamp: now() as String {format: "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"},
  retryCount: 0,
  payload: {
    orderId: payload.orderId,
    orderDate: payload.orderDate,
    customerId: payload.customer.customerId,
    customerEmail: payload.customer.email,
    customer: payload.customer,
    shippingAddress: payload.shippingAddress,
    paymentMethod: payload.paymentMethod,
    currency: payload.currency,
    totalAmount: payload.totalAmount,
    itemCount: sizeOf(payload.items),
    items: payload.items
  }
}
