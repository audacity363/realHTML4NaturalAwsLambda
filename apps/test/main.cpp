#include <iostream>

#include <aws/core/utils/json/JsonSerializer.h>

using namespace Aws::Utils::Json;

void printBranch(Aws::Map<Aws::String, JsonView> branchstart, int index) {
    for(std::map<Aws::String, JsonView>::iterator it = branchstart.begin(); it != branchstart.end(); ++it) {

        JsonView view = it->second;

        for(char i = 0; i < index; i++) {
            std::cout << "\t";
        }
        std::cout << it->first << std::endl;

        if(view.IsObject()) {
            printBranch(view.GetAllObjects(), index+1);
        }
    }
}

int main() {
    JsonValue test("{\"resource\":\"\/jsonParsing\",\"path\":\"\/jsonParsing\"," \
            "\"httpMethod\":\"GET\",\"headers\":{\"accept\":\"text\/html,application\/xhtml+xml,application\/xml;"\
            "q=0.9,image\/webp,image\/apng,*\/*;q=0.8,application\/signed-exchange;v=b3\","\
            "\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"en-GB,en-US;q=0.9,en;q=0.8,de;q=0.7\",\"Host\":\"okg7877hvc.execute-api.us-east-2.amazonaws.com\",\"upgrade-insecure-requests\":\"1\",\"User-Agent\":\"Mozilla\/5.0 (X11; Linux x86_64) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/75.0.3770.100 Safari\/537.36\",\"X-Amzn-Trace-Id\":\"Root=1-5d340e6b-c011d3152d2204b3814aed5f\",\"X-Forwarded-For\":\"46.89.159.43\",\"X-Forwarded-Port\":\"443\",\"X-Forwarded-Proto\":\"https\"},\"multiValueHeaders\":{\"accept\":[\"text\/html,application\/xhtml+xml,application\/xml;q=0.9,image\/webp,image\/apng,*\/*;q=0.8,application\/signed-exchange;v=b3\"],\"accept-encoding\":[\"gzip, deflate, br\"],\"accept-language\":[\"en-GB,en-US;q=0.9,en;q=0.8,de;q=0.7\"],\"Host\":[\"okg7877hvc.execute-api.us-east-2.amazonaws.com\"],\"upgrade-insecure-requests\":[\"1\"],\"User-Agent\":[\"Mozilla\/5.0 (X11; Linux x86_64) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/75.0.3770.100 Safari\/537.36\"],\"X-Amzn-Trace-Id\":[\"Root=1-5d340e6b-c011d3152d2204b3814aed5f\"],\"X-Forwarded-For\":[\"46.89.159.43\"],\"X-Forwarded-Port\":[\"443\"],\"X-Forwarded-Proto\":[\"https\"]},\"queryStringParameters\":{\"test\":\"jop\"},\"multiValueQueryStringParameters\":{\"test\":[\"Hello World\",\"jop\"]},\"pathParameters\":null,\"stageVariables\":null,\"requestContext\":{\"resourceId\":\"mt2512\",\"resourcePath\":\"\/jsonParsing\",\"httpMethod\":\"GET\",\"extendedRequestId\":\"dKcwuGxJiYcFXcQ=\",\"requestTime\":\"21\/Jul\/2019:07:04:11 +0000\",\"path\":\"\/default\/jsonParsing\",\"accountId\":\"577438539309\",\"protocol\":\"HTTP\/1.1\",\"stage\":\"default\",\"domainPrefix\":\"okg7877hvc\",\"requestTimeEpoch\":1563692651053,\"requestId\":\"bd8b3e7d-ab85-11e9-ae2c-ddf213be0ed0\",\"identity\":{\"cognitoIdentityPoolId\":null,\"accountId\":null,\"cognitoIdentityId\":null,\"caller\":null,\"sourceIp\":\"46.89.159.43\",\"principalOrgId\":null,\"accessKey\":null,\"cognitoAuthenticationType\":null,\"cognitoAuthenticationProvider\":null,\"userArn\":null,\"userAgent\":\"Mozilla\/5.0 (X11; Linux x86_64) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/75.0.3770.100 Safari\/537.36\",\"user\":null},\"domainName\":\"okg7877hvc.execute-api.us-east-2.amazonaws.com\",\"apiId\":\"okg7877hvc\"},\"body\":null,\"isBase64Encoded\":false}");

    if(!test.WasParseSuccessful()) {
        std::cout << "Error while parsing json" << std::endl;
        return(1);
    }


    printBranch(test.View().GetAllObjects(), 0);

}
