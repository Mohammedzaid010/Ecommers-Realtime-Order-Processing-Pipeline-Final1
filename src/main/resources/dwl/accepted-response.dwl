%dw 2.0
output application/json
---
{
  orderId: vars.orderId,
  status: 'RECEIVED',
  correlationId: vars.correlationId,
  message: 'Order accepted for processing',
  receivedAt: now() as String {format: "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"}
}
