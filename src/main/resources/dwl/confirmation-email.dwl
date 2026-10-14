%dw 2.0
output text/plain
var o = vars.canonical
var a = o.shippingAddress
var orderDateText = o.orderDate as DateTime as String {format: 'dd MMM yyyy, HH:mm'}
var totalText = o.totalAmount as String {format: '#,##0.00'}
var itemLines = o.items map (i) -> '• $(i.productName) - Quantity: $(i.quantity)\n  Unit Price: $(o.currency) $(i.unitPrice as String {format: '#,##0.00'})'
---
'Dear $(o.customer.name),

Thank you for your order. Your order has been received and processed successfully.

Order ID: $(o.orderId)
Order Date: $(orderDateText)
Total Amount: $(o.currency) $(totalText)
Delivery Address: $(a.addressLine1), $(a.city), $(a.state) - $(a.postalCode), $(a.country)

Items Ordered:
$(itemLines joinBy "\n")

We will notify you when your order is dispatched. Please quote your order ID for any support request.

Regards,
E-Commerce Order Processing Team'
