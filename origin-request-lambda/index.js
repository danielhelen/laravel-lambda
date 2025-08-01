'use strict'

const { createHash } = require('crypto')

exports.handler = (event, context, callback) => {
  const request = event.Records[0].cf.request

  if (
    ['POST', 'PATCH', 'PUT'].includes(request.method) &&
    !request.headers.hasOwnProperty('x-amz-content-sha256') &&
    request.body &&
    request.body.data
  ) {
    const body = Buffer.from(request.body.data, 'base64')

    request.headers['x-amz-content-sha256'] = [
      {
        key: 'x-amz-content-sha256',
        value: createHash('sha256').update(body).digest('hex')
      }
    ]
  }

  callback(null, request)
}
