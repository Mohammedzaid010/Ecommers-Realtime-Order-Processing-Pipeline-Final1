%dw 2.0
output application/json
---
{
  status: 'ERROR',
  code: vars.errorCode default 'INTERNAL_ERROR',
  message: vars.errorMessage default 'Unexpected error. Quote the correlation ID to support.',
  correlationId: vars.correlationId default correlationId,
  timestamp: now(),
  errors: vars.fieldErrors default []
}
