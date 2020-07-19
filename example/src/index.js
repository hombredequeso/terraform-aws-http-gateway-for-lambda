exports.handler = async (event, context) => {
    const response = {
        statusCode: 200,
        body: JSON.stringify({
            msg: 'index.js test-lambda handler',
            e: event,
            cxt: context
        }),
        headers: {
            "Content-Type": "application/json",
      }
    };
    return response;
};

