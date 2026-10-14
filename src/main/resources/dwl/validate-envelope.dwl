%dw 2.0
output application/json
var p = payload.payload default {}
var items = p.items default []
var errs = [
  (if (isEmpty(payload.correlationId default '')) 'correlationId is required' else null),
  (if ((payload.eventType default '') != 'ORDER_RECEIVED') 'eventType must be ORDER_RECEIVED' else null),
  (if (isEmpty(p.orderId default '')) 'orderId is required' else null),
  (if (isEmpty(p.customer.email default '')) 'customer email is required' else null),
  (if (isEmpty(p.customer.name default '')) 'customer name is required' else null),
  (if (isEmpty(items)) 'items must not be empty' else null),
  (if (sizeOf(items filter ((i) -> (i.quantity default 0) < 1 or (i.unitPrice default 0) <= 0)) > 0) 'item quantity and unitPrice must be positive' else null),
  (if ((p.totalAmount default 0) <= 0) 'totalAmount must be positive' else null)
] filter ((e) -> e != null)
---
{ valid: isEmpty(errs), errors: errs }
