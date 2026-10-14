%dw 2.0
output application/java
---
payload.items map (i) -> {
  orderId: payload.orderId,
  productId: i.productId,
  productName: i.productName default '',
  quantity: i.quantity,
  unitPrice: i.unitPrice,
  lineTotal: i.quantity * i.unitPrice
}
