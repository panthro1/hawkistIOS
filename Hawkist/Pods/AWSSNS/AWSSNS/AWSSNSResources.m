/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 
 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at
 
 http://aws.amazon.com/apache2.0
 
 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSSNSResources.h"
#import "AWSLogging.h"

@interface AWSSNSResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSSNSResources

+ (instancetype)sharedInstance {
    static AWSSNSResources *_sharedResources = nil;
    static dispatch_once_t once_token;
    
    dispatch_once(&once_token, ^{
        _sharedResources = [AWSSNSResources new];
    });
    
    return _sharedResources;
}
- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @" \
    { \
      \"version\":\"2.0\", \
      \"metadata\":{ \
        \"apiVersion\":\"2010-03-31\", \
        \"endpointPrefix\":\"sns\", \
        \"serviceAbbreviation\":\"Amazon SNS\", \
        \"serviceFullName\":\"Amazon Simple Notification Service\", \
        \"signatureVersion\":\"v4\", \
        \"xmlNamespace\":\"http://sns.amazonaws.com/doc/2010-03-31/\", \
        \"protocol\":\"query\" \
      }, \
      \"documentation\":\"<fullname>Amazon Simple Notification Service</fullname> <p>Amazon Simple Notification Service (Amazon SNS) is a web service that enables you to build distributed web-enabled applications. Applications can use Amazon SNS to easily push real-time notification messages to interested subscribers over multiple delivery protocols. For more information about this product see <a href=\\\"http://aws.amazon.com/sns/\\\">http://aws.amazon.com/sns</a>. For detailed information about Amazon SNS features and their associated API calls, see the <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/\\\">Amazon SNS Developer Guide</a>. </p> <p>We also provide SDKs that enable you to access Amazon SNS from your preferred programming language. The SDKs contain functionality that automatically takes care of tasks such as: cryptographically signing your service requests, retrying requests, and handling error responses. For a list of available SDKs, go to <a href=\\\"http://aws.amazon.com/tools/\\\">Tools for Amazon Web Services</a>. </p>\", \
      \"operations\":{ \
        \"AddPermission\":{ \
          \"name\":\"AddPermission\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"AddPermissionInput\"}, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Adds a statement to a topic's access control policy, granting access for the specified AWS accounts to the specified actions.</p>\" \
        }, \
        \"ConfirmSubscription\":{ \
          \"name\":\"ConfirmSubscription\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"ConfirmSubscriptionInput\", \
            \"documentation\":\"Input for ConfirmSubscription action.\" \
          }, \
          \"output\":{ \
            \"shape\":\"ConfirmSubscriptionResponse\", \
            \"documentation\":\"Response for ConfirmSubscriptions action.\", \
            \"resultWrapper\":\"ConfirmSubscriptionResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"SubscriptionLimitExceededException\", \
              \"error\":{ \
                \"code\":\"SubscriptionLimitExceeded\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the customer already owns the maximum allowed number of subscriptions.</p>\" \
            }, \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Verifies an endpoint owner's intent to receive messages by validating the token sent to the endpoint by an earlier <code>Subscribe</code> action. If the token is valid, the action creates a new subscription and returns its Amazon Resource Name (ARN). This call requires an AWS signature only when the <code>AuthenticateOnUnsubscribe</code> flag is set to \\\"true\\\".</p>\" \
        }, \
        \"CreatePlatformApplication\":{ \
          \"name\":\"CreatePlatformApplication\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"CreatePlatformApplicationInput\", \
            \"documentation\":\"<p>Input for CreatePlatformApplication action.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"CreatePlatformApplicationResponse\", \
            \"documentation\":\"<p>Response from CreatePlatformApplication action.</p>\", \
            \"resultWrapper\":\"CreatePlatformApplicationResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Creates a platform application object for one of the supported push notification services, such as APNS and GCM, to which devices and mobile apps may register. You must specify PlatformPrincipal and PlatformCredential attributes when using the <code>CreatePlatformApplication</code> action. The PlatformPrincipal is received from the notification service. For APNS/APNS_SANDBOX, PlatformPrincipal is \\\"SSL certificate\\\". For GCM, PlatformPrincipal is not applicable. For ADM, PlatformPrincipal is \\\"client id\\\". The PlatformCredential is also received from the notification service. For APNS/APNS_SANDBOX, PlatformCredential is \\\"private key\\\". For GCM, PlatformCredential is \\\"API key\\\". For ADM, PlatformCredential is \\\"client secret\\\". The PlatformApplicationArn that is returned when using <code>CreatePlatformApplication</code> is then used as an attribute for the <code>CreatePlatformEndpoint</code> action. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\" \
        }, \
        \"CreatePlatformEndpoint\":{ \
          \"name\":\"CreatePlatformEndpoint\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"CreatePlatformEndpointInput\", \
            \"documentation\":\"<p>Input for CreatePlatformEndpoint action.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"CreateEndpointResponse\", \
            \"documentation\":\"<p>Response from CreateEndpoint action.</p>\", \
            \"resultWrapper\":\"CreatePlatformEndpointResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Creates an endpoint for a device and mobile app on one of the supported push notification services, such as GCM and APNS. <code>CreatePlatformEndpoint</code> requires the PlatformApplicationArn that is returned from <code>CreatePlatformApplication</code>. The EndpointArn that is returned when using <code>CreatePlatformEndpoint</code> can then be used by the <code>Publish</code> action to send a message to a mobile app or by the <code>Subscribe</code> action for subscription to a topic. The <code>CreatePlatformEndpoint</code> action is idempotent, so if the requester already owns an endpoint with the same device token and attributes, that endpoint's ARN is returned without creating a new endpoint. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p> <p>When using <code>CreatePlatformEndpoint</code> with Baidu, two attributes must be provided: ChannelId and UserId. The token field must also contain the ChannelId. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePushBaiduEndpoint.html\\\">Creating an Amazon SNS Endpoint for Baidu</a>. </p>\" \
        }, \
        \"CreateTopic\":{ \
          \"name\":\"CreateTopic\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"CreateTopicInput\", \
            \"documentation\":\"<p>Input for CreateTopic action.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"CreateTopicResponse\", \
            \"documentation\":\"<p>Response from CreateTopic action.</p>\", \
            \"resultWrapper\":\"CreateTopicResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"TopicLimitExceededException\", \
              \"error\":{ \
                \"code\":\"TopicLimitExceeded\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the customer already owns the maximum allowed number of topics.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Creates a topic to which notifications can be published. Users can create at most 3000 topics. For more information, see <a href=\\\"http://aws.amazon.com/sns/\\\">http://aws.amazon.com/sns</a>. This action is idempotent, so if the requester already owns a topic with the specified name, that topic's ARN is returned without creating a new topic.</p>\" \
        }, \
        \"DeleteEndpoint\":{ \
          \"name\":\"DeleteEndpoint\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"DeleteEndpointInput\", \
            \"documentation\":\"<p>Input for DeleteEndpoint action.</p>\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Deletes the endpoint from Amazon SNS. This action is idempotent. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\" \
        }, \
        \"DeletePlatformApplication\":{ \
          \"name\":\"DeletePlatformApplication\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"DeletePlatformApplicationInput\", \
            \"documentation\":\"<p>Input for DeletePlatformApplication action.</p>\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Deletes a platform application object for one of the supported push notification services, such as APNS and GCM. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\" \
        }, \
        \"DeleteTopic\":{ \
          \"name\":\"DeleteTopic\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"DeleteTopicInput\"}, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Deletes a topic and all its subscriptions. Deleting a topic might prevent some messages previously sent to the topic from being delivered to subscribers. This action is idempotent, so deleting a topic that does not exist does not result in an error.</p>\" \
        }, \
        \"GetEndpointAttributes\":{ \
          \"name\":\"GetEndpointAttributes\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"GetEndpointAttributesInput\", \
            \"documentation\":\"<p>Input for GetEndpointAttributes action.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"GetEndpointAttributesResponse\", \
            \"documentation\":\"<p>Response from GetEndpointAttributes of the EndpointArn.</p>\", \
            \"resultWrapper\":\"GetEndpointAttributesResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Retrieves the endpoint attributes for a device on one of the supported push notification services, such as GCM and APNS. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\" \
        }, \
        \"GetPlatformApplicationAttributes\":{ \
          \"name\":\"GetPlatformApplicationAttributes\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"GetPlatformApplicationAttributesInput\", \
            \"documentation\":\"<p>Input for GetPlatformApplicationAttributes action.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"GetPlatformApplicationAttributesResponse\", \
            \"documentation\":\"<p>Response for GetPlatformApplicationAttributes action.</p>\", \
            \"resultWrapper\":\"GetPlatformApplicationAttributesResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Retrieves the attributes of the platform application object for the supported push notification services, such as APNS and GCM. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\" \
        }, \
        \"GetSubscriptionAttributes\":{ \
          \"name\":\"GetSubscriptionAttributes\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"GetSubscriptionAttributesInput\", \
            \"documentation\":\"<p>Input for GetSubscriptionAttributes.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"GetSubscriptionAttributesResponse\", \
            \"documentation\":\"<p>Response for GetSubscriptionAttributes action.</p>\", \
            \"resultWrapper\":\"GetSubscriptionAttributesResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Returns all of the properties of a subscription.</p>\" \
        }, \
        \"GetTopicAttributes\":{ \
          \"name\":\"GetTopicAttributes\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"GetTopicAttributesInput\", \
            \"documentation\":\"<p>Input for GetTopicAttributes action.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"GetTopicAttributesResponse\", \
            \"documentation\":\"<p>Response for GetTopicAttributes action.</p>\", \
            \"resultWrapper\":\"GetTopicAttributesResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Returns all of the properties of a topic. Topic properties returned might differ based on the authorization of the user. </p>\" \
        }, \
        \"ListEndpointsByPlatformApplication\":{ \
          \"name\":\"ListEndpointsByPlatformApplication\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"ListEndpointsByPlatformApplicationInput\", \
            \"documentation\":\"<p>Input for ListEndpointsByPlatformApplication action.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"ListEndpointsByPlatformApplicationResponse\", \
            \"documentation\":\"<p>Response for ListEndpointsByPlatformApplication action.</p>\", \
            \"resultWrapper\":\"ListEndpointsByPlatformApplicationResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Lists the endpoints and endpoint attributes for devices in a supported push notification service, such as GCM and APNS. The results for <code>ListEndpointsByPlatformApplication</code> are paginated and return a limited list of endpoints, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call <code>ListEndpointsByPlatformApplication</code> again using the NextToken string received from the previous call. When there are no more records to return, NextToken will be null. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\" \
        }, \
        \"ListPlatformApplications\":{ \
          \"name\":\"ListPlatformApplications\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"ListPlatformApplicationsInput\", \
            \"documentation\":\"<p>Input for ListPlatformApplications action.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"ListPlatformApplicationsResponse\", \
            \"documentation\":\"<p>Response for ListPlatformApplications action.</p>\", \
            \"resultWrapper\":\"ListPlatformApplicationsResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Lists the platform application objects for the supported push notification services, such as APNS and GCM. The results for <code>ListPlatformApplications</code> are paginated and return a limited list of applications, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call <code>ListPlatformApplications</code> using the NextToken string received from the previous call. When there are no more records to return, NextToken will be null. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\" \
        }, \
        \"ListSubscriptions\":{ \
          \"name\":\"ListSubscriptions\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"ListSubscriptionsInput\", \
            \"documentation\":\"Input for ListSubscriptions action.\" \
          }, \
          \"output\":{ \
            \"shape\":\"ListSubscriptionsResponse\", \
            \"documentation\":\"<p>Response for ListSubscriptions action</p>\", \
            \"resultWrapper\":\"ListSubscriptionsResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Returns a list of the requester's subscriptions. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListSubscriptions</code> call to get further results.</p>\" \
        }, \
        \"ListSubscriptionsByTopic\":{ \
          \"name\":\"ListSubscriptionsByTopic\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"ListSubscriptionsByTopicInput\", \
            \"documentation\":\"<p>Input for ListSubscriptionsByTopic action.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"ListSubscriptionsByTopicResponse\", \
            \"documentation\":\"<p>Response for ListSubscriptionsByTopic action.</p>\", \
            \"resultWrapper\":\"ListSubscriptionsByTopicResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Returns a list of the subscriptions to a specific topic. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListSubscriptionsByTopic</code> call to get further results.</p>\" \
        }, \
        \"ListTopics\":{ \
          \"name\":\"ListTopics\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"ListTopicsInput\"}, \
          \"output\":{ \
            \"shape\":\"ListTopicsResponse\", \
            \"documentation\":\"<p>Response for ListTopics action.</p>\", \
            \"resultWrapper\":\"ListTopicsResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Returns a list of the requester's topics. Each call returns a limited list of topics, up to 100. If there are more topics, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListTopics</code> call to get further results.</p>\" \
        }, \
        \"Publish\":{ \
          \"name\":\"Publish\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"PublishInput\", \
            \"documentation\":\"<p>Input for Publish action.</p>\" \
          }, \
          \"output\":{ \
            \"shape\":\"PublishResponse\", \
            \"documentation\":\"<p>Response for Publish action.</p>\", \
            \"resultWrapper\":\"PublishResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InvalidParameterValueException\", \
              \"error\":{ \
                \"code\":\"ParameterValueInvalid\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            }, \
            { \
              \"shape\":\"EndpointDisabledException\", \
              \"error\":{ \
                \"code\":\"EndpointDisabled\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Exception error indicating endpoint disabled.</p>\" \
            }, \
            { \
              \"shape\":\"PlatformApplicationDisabledException\", \
              \"error\":{ \
                \"code\":\"PlatformApplicationDisabled\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Exception error indicating platform application disabled.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Sends a message to all of a topic's subscribed endpoints. When a <code>messageId</code> is returned, the message has been saved and Amazon SNS will attempt to deliver it to the topic's subscribers shortly. The format of the outgoing message to each subscribed endpoint depends on the notification protocol selected.</p> <p>To use the <code>Publish</code> action for sending a message to a mobile endpoint, such as an app on a Kindle device or mobile phone, you must specify the EndpointArn. The EndpointArn is returned when making a call with the <code>CreatePlatformEndpoint</code> action. The second example below shows a request and response for publishing to a mobile endpoint. </p>\" \
        }, \
        \"RemovePermission\":{ \
          \"name\":\"RemovePermission\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"RemovePermissionInput\", \
            \"documentation\":\"<p>Input for RemovePermission action.</p>\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Removes a statement from a topic's access control policy.</p>\" \
        }, \
        \"SetEndpointAttributes\":{ \
          \"name\":\"SetEndpointAttributes\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"SetEndpointAttributesInput\", \
            \"documentation\":\"<p>Input for SetEndpointAttributes action.</p>\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Sets the attributes for an endpoint for a device on one of the supported push notification services, such as GCM and APNS. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\" \
        }, \
        \"SetPlatformApplicationAttributes\":{ \
          \"name\":\"SetPlatformApplicationAttributes\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"SetPlatformApplicationAttributesInput\", \
            \"documentation\":\"<p>Input for SetPlatformApplicationAttributes action.</p>\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Sets the attributes of the platform application object for the supported push notification services, such as APNS and GCM. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\" \
        }, \
        \"SetSubscriptionAttributes\":{ \
          \"name\":\"SetSubscriptionAttributes\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"SetSubscriptionAttributesInput\", \
            \"documentation\":\"<p>Input for SetSubscriptionAttributes action.</p>\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Allows a subscription owner to set an attribute of the topic to a new value.</p>\" \
        }, \
        \"SetTopicAttributes\":{ \
          \"name\":\"SetTopicAttributes\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"SetTopicAttributesInput\", \
            \"documentation\":\"<p>Input for SetTopicAttributes action.</p>\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Allows a topic owner to set an attribute of the topic to a new value.</p>\" \
        }, \
        \"Subscribe\":{ \
          \"name\":\"Subscribe\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"SubscribeInput\", \
            \"documentation\":\"Input for Subscribe action.\" \
          }, \
          \"output\":{ \
            \"shape\":\"SubscribeResponse\", \
            \"documentation\":\"Response for Subscribe action.\", \
            \"resultWrapper\":\"SubscribeResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"SubscriptionLimitExceededException\", \
              \"error\":{ \
                \"code\":\"SubscriptionLimitExceeded\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the customer already owns the maximum allowed number of subscriptions.</p>\" \
            }, \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Prepares to subscribe an endpoint by sending the endpoint a confirmation message. To actually create a subscription, the endpoint owner must call the <code>ConfirmSubscription</code> action with the token from the confirmation message. Confirmation tokens are valid for three days.</p>\" \
        }, \
        \"Unsubscribe\":{ \
          \"name\":\"Unsubscribe\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{ \
            \"shape\":\"UnsubscribeInput\", \
            \"documentation\":\"<p>Input for Unsubscribe action.</p>\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidParameterException\", \
              \"error\":{ \
                \"code\":\"InvalidParameter\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
            }, \
            { \
              \"shape\":\"InternalErrorException\", \
              \"error\":{ \
                \"code\":\"InternalError\", \
                \"httpStatusCode\":500 \
              }, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>Indicates an internal service error.</p>\" \
            }, \
            { \
              \"shape\":\"AuthorizationErrorException\", \
              \"error\":{ \
                \"code\":\"AuthorizationError\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
            }, \
            { \
              \"shape\":\"NotFoundException\", \
              \"error\":{ \
                \"code\":\"NotFound\", \
                \"httpStatusCode\":404, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Deletes a subscription. If the subscription requires authentication for deletion, only the owner of the subscription or the topic's owner can unsubscribe, and an AWS signature is required. If the <code>Unsubscribe</code> call does not require authentication and the requester is not the subscription owner, a final cancellation message is delivered to the endpoint, so that the endpoint owner can easily resubscribe to the topic if the <code>Unsubscribe</code> request was unintended.</p>\" \
        } \
      }, \
      \"shapes\":{ \
        \"ActionsList\":{ \
          \"type\":\"list\", \
          \"member\":{\"shape\":\"action\"} \
        }, \
        \"AddPermissionInput\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"TopicArn\", \
            \"Label\", \
            \"AWSAccountId\", \
            \"ActionName\" \
          ], \
          \"members\":{ \
            \"TopicArn\":{ \
              \"shape\":\"topicARN\", \
              \"documentation\":\"<p>The ARN of the topic whose access control policy you wish to modify.</p>\" \
            }, \
            \"Label\":{ \
              \"shape\":\"label\", \
              \"documentation\":\"<p>A unique identifier for the new policy statement.</p>\" \
            }, \
            \"AWSAccountId\":{ \
              \"shape\":\"DelegatesList\", \
              \"documentation\":\"<p>The AWS account IDs of the users (principals) who will be given access to the specified actions. The users must have AWS accounts, but do not need to be signed up for this service. </p>\" \
            }, \
            \"ActionName\":{ \
              \"shape\":\"ActionsList\", \
              \"documentation\":\"<p>The action you want to allow for the specified principal(s).</p> <p>Valid values: any Amazon SNS action name.</p>\" \
            } \
          } \
        }, \
        \"AuthorizationErrorException\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"message\":{\"shape\":\"string\"} \
          }, \
          \"error\":{ \
            \"code\":\"AuthorizationError\", \
            \"httpStatusCode\":403, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\" \
        }, \
        \"Binary\":{\"type\":\"blob\"}, \
        \"ConfirmSubscriptionInput\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"TopicArn\", \
            \"Token\" \
          ], \
          \"members\":{ \
            \"TopicArn\":{ \
              \"shape\":\"topicARN\", \
              \"documentation\":\"<p>The ARN of the topic for which you wish to confirm a subscription.</p>\" \
            }, \
            \"Token\":{ \
              \"shape\":\"token\", \
              \"documentation\":\"<p>Short-lived token sent to an endpoint during the <code>Subscribe</code> action.</p>\" \
            }, \
            \"AuthenticateOnUnsubscribe\":{ \
              \"shape\":\"authenticateOnUnsubscribe\", \
              \"documentation\":\"<p>Disallows unauthenticated unsubscribes of the subscription. If the value of this parameter is <code>true</code> and the request has an AWS signature, then only the topic owner and the subscription owner can unsubscribe the endpoint. The unsubscribe action requires AWS authentication. </p>\" \
            } \
          }, \
          \"documentation\":\"Input for ConfirmSubscription action.\" \
        }, \
        \"ConfirmSubscriptionResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"SubscriptionArn\":{ \
              \"shape\":\"subscriptionARN\", \
              \"documentation\":\"<p>The ARN of the created subscription.</p>\" \
            } \
          }, \
          \"documentation\":\"Response for ConfirmSubscriptions action.\" \
        }, \
        \"CreateEndpointResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"EndpointArn\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>EndpointArn returned from CreateEndpoint action.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Response from CreateEndpoint action.</p>\" \
        }, \
        \"CreatePlatformApplicationInput\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"Name\", \
            \"Platform\", \
            \"Attributes\" \
          ], \
          \"members\":{ \
            \"Name\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>Application names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, hyphens, and periods, and must be between 1 and 256 characters long.</p>\" \
            }, \
            \"Platform\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The following platforms are supported: ADM (Amazon Device Messaging), APNS (Apple Push Notification Service), APNS_SANDBOX, and GCM (Google Cloud Messaging).</p>\" \
            }, \
            \"Attributes\":{ \
              \"shape\":\"MapStringToString\", \
              \"documentation\":\"<p>For a list of attributes, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/api/API_SetPlatformApplicationAttributes.html\\\">SetPlatformApplicationAttributes</a></p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for CreatePlatformApplication action.</p>\" \
        }, \
        \"CreatePlatformApplicationResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"PlatformApplicationArn\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>PlatformApplicationArn is returned.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Response from CreatePlatformApplication action.</p>\" \
        }, \
        \"CreatePlatformEndpointInput\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"PlatformApplicationArn\", \
            \"Token\" \
          ], \
          \"members\":{ \
            \"PlatformApplicationArn\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>PlatformApplicationArn returned from CreatePlatformApplication is used to create a an endpoint.</p>\" \
            }, \
            \"Token\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>Unique identifier created by the notification service for an app on a device. The specific name for Token will vary, depending on which notification service is being used. For example, when using APNS as the notification service, you need the device token. Alternatively, when using GCM or ADM, the device token equivalent is called the registration ID.</p>\" \
            }, \
            \"CustomUserData\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>Arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less than 2KB.</p>\" \
            }, \
            \"Attributes\":{ \
              \"shape\":\"MapStringToString\", \
              \"documentation\":\"<p>For a list of attributes, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/api/API_SetEndpointAttributes.html\\\">SetEndpointAttributes</a>.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for CreatePlatformEndpoint action.</p>\" \
        }, \
        \"CreateTopicInput\":{ \
          \"type\":\"structure\", \
          \"required\":[\"Name\"], \
          \"members\":{ \
            \"Name\":{ \
              \"shape\":\"topicName\", \
              \"documentation\":\"<p>The name of the topic you want to create.</p> <p>Constraints: Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long. </p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for CreateTopic action.</p>\" \
        }, \
        \"CreateTopicResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"TopicArn\":{ \
              \"shape\":\"topicARN\", \
              \"documentation\":\"<p>The Amazon Resource Name (ARN) assigned to the created topic.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Response from CreateTopic action.</p>\" \
        }, \
        \"DelegatesList\":{ \
          \"type\":\"list\", \
          \"member\":{\"shape\":\"delegate\"} \
        }, \
        \"DeleteEndpointInput\":{ \
          \"type\":\"structure\", \
          \"required\":[\"EndpointArn\"], \
          \"members\":{ \
            \"EndpointArn\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>EndpointArn of endpoint to delete.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for DeleteEndpoint action.</p>\" \
        }, \
        \"DeletePlatformApplicationInput\":{ \
          \"type\":\"structure\", \
          \"required\":[\"PlatformApplicationArn\"], \
          \"members\":{ \
            \"PlatformApplicationArn\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>PlatformApplicationArn of platform application object to delete.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for DeletePlatformApplication action.</p>\" \
        }, \
        \"DeleteTopicInput\":{ \
          \"type\":\"structure\", \
          \"required\":[\"TopicArn\"], \
          \"members\":{ \
            \"TopicArn\":{ \
              \"shape\":\"topicARN\", \
              \"documentation\":\"<p>The ARN of the topic you want to delete.</p>\" \
            } \
          } \
        }, \
        \"Endpoint\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"EndpointArn\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>EndpointArn for mobile app and device.</p>\" \
            }, \
            \"Attributes\":{ \
              \"shape\":\"MapStringToString\", \
              \"documentation\":\"<p>Attributes for endpoint.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Endpoint for mobile app and device.</p>\" \
        }, \
        \"EndpointDisabledException\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"message\":{ \
              \"shape\":\"string\", \
              \"documentation\":\"<p>Message for endpoint disabled.</p>\" \
            } \
          }, \
          \"error\":{ \
            \"code\":\"EndpointDisabled\", \
            \"httpStatusCode\":400, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>Exception error indicating endpoint disabled.</p>\" \
        }, \
        \"GetEndpointAttributesInput\":{ \
          \"type\":\"structure\", \
          \"required\":[\"EndpointArn\"], \
          \"members\":{ \
            \"EndpointArn\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>EndpointArn for GetEndpointAttributes input.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for GetEndpointAttributes action.</p>\" \
        }, \
        \"GetEndpointAttributesResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"Attributes\":{ \
              \"shape\":\"MapStringToString\", \
              \"documentation\":\"<p>Attributes include the following:</p> <ul> <li> <code>CustomUserData</code> -- arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less than 2KB.</li> <li> <code>Enabled</code> -- flag that enables/disables delivery to the endpoint. Amazon SNS will set this to false when a notification service indicates to Amazon SNS that the endpoint is invalid. Users can set it back to true, typically after updating Token.</li> <li> <code>Token</code> -- device token, also referred to as a registration id, for an app and mobile device. This is returned from the notification service when an app and mobile device are registered with the notification service.</li> </ul>\" \
            } \
          }, \
          \"documentation\":\"<p>Response from GetEndpointAttributes of the EndpointArn.</p>\" \
        }, \
        \"GetPlatformApplicationAttributesInput\":{ \
          \"type\":\"structure\", \
          \"required\":[\"PlatformApplicationArn\"], \
          \"members\":{ \
            \"PlatformApplicationArn\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>PlatformApplicationArn for GetPlatformApplicationAttributesInput.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for GetPlatformApplicationAttributes action.</p>\" \
        }, \
        \"GetPlatformApplicationAttributesResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"Attributes\":{ \
              \"shape\":\"MapStringToString\", \
              \"documentation\":\"<p>Attributes include the following:</p> <ul> <li> <code>EventEndpointCreated</code> -- Topic ARN to which EndpointCreated event notifications should be sent.</li> <li> <code>EventEndpointDeleted</code> -- Topic ARN to which EndpointDeleted event notifications should be sent.</li> <li> <code>EventEndpointUpdated</code> -- Topic ARN to which EndpointUpdate event notifications should be sent.</li> <li> <code>EventDeliveryFailure</code> -- Topic ARN to which DeliveryFailure event notifications should be sent upon Direct Publish delivery failure (permanent) to one of the application's endpoints.</li> </ul>\" \
            } \
          }, \
          \"documentation\":\"<p>Response for GetPlatformApplicationAttributes action.</p>\" \
        }, \
        \"GetSubscriptionAttributesInput\":{ \
          \"type\":\"structure\", \
          \"required\":[\"SubscriptionArn\"], \
          \"members\":{ \
            \"SubscriptionArn\":{ \
              \"shape\":\"subscriptionARN\", \
              \"documentation\":\"<p>The ARN of the subscription whose properties you want to get.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for GetSubscriptionAttributes.</p>\" \
        }, \
        \"GetSubscriptionAttributesResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"Attributes\":{ \
              \"shape\":\"SubscriptionAttributesMap\", \
              \"documentation\":\"<p>A map of the subscription's attributes. Attributes in this map include the following:</p> <ul> <li> <code>SubscriptionArn</code> -- the subscription's ARN</li> <li> <code>TopicArn</code> -- the topic ARN that the subscription is associated with</li> <li> <code>Owner</code> -- the AWS account ID of the subscription's owner</li> <li> <code>ConfirmationWasAuthenticated</code> -- true if the subscription confirmation request was authenticated</li> <li> <code>DeliveryPolicy</code> -- the JSON serialization of the subscription's delivery policy</li> <li> <code>EffectiveDeliveryPolicy</code> -- the JSON serialization of the effective delivery policy that takes into account the topic delivery policy and account system defaults</li> </ul>\" \
            } \
          }, \
          \"documentation\":\"<p>Response for GetSubscriptionAttributes action.</p>\" \
        }, \
        \"GetTopicAttributesInput\":{ \
          \"type\":\"structure\", \
          \"required\":[\"TopicArn\"], \
          \"members\":{ \
            \"TopicArn\":{ \
              \"shape\":\"topicARN\", \
              \"documentation\":\"<p>The ARN of the topic whose properties you want to get.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for GetTopicAttributes action.</p>\" \
        }, \
        \"GetTopicAttributesResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"Attributes\":{ \
              \"shape\":\"TopicAttributesMap\", \
              \"documentation\":\"<p>A map of the topic's attributes. Attributes in this map include the following:</p> <ul> <li> <code>TopicArn</code> -- the topic's ARN</li> <li> <code>Owner</code> -- the AWS account ID of the topic's owner</li> <li> <code>Policy</code> -- the JSON serialization of the topic's access control policy</li> <li> <code>DisplayName</code> -- the human-readable name used in the \\\"From\\\" field for notifications to email and email-json endpoints</li> <li> <code>SubscriptionsPending</code> -- the number of subscriptions pending confirmation on this topic</li> <li> <code>SubscriptionsConfirmed</code> -- the number of confirmed subscriptions on this topic</li> <li> <code>SubscriptionsDeleted</code> -- the number of deleted subscriptions on this topic</li> <li> <code>DeliveryPolicy</code> -- the JSON serialization of the topic's delivery policy</li> <li> <code>EffectiveDeliveryPolicy</code> -- the JSON serialization of the effective delivery policy that takes into account system defaults</li> </ul>\" \
            } \
          }, \
          \"documentation\":\"<p>Response for GetTopicAttributes action.</p>\" \
        }, \
        \"InternalErrorException\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"message\":{\"shape\":\"string\"} \
          }, \
          \"error\":{ \
            \"code\":\"InternalError\", \
            \"httpStatusCode\":500 \
          }, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>Indicates an internal service error.</p>\" \
        }, \
        \"InvalidParameterException\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"message\":{\"shape\":\"string\"} \
          }, \
          \"error\":{ \
            \"code\":\"InvalidParameter\", \
            \"httpStatusCode\":400, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
        }, \
        \"InvalidParameterValueException\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"message\":{\"shape\":\"string\"} \
          }, \
          \"error\":{ \
            \"code\":\"ParameterValueInvalid\", \
            \"httpStatusCode\":400, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\" \
        }, \
        \"ListEndpointsByPlatformApplicationInput\":{ \
          \"type\":\"structure\", \
          \"required\":[\"PlatformApplicationArn\"], \
          \"members\":{ \
            \"PlatformApplicationArn\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>PlatformApplicationArn for ListEndpointsByPlatformApplicationInput action.</p>\" \
            }, \
            \"NextToken\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>NextToken string is used when calling ListEndpointsByPlatformApplication action to retrieve additional records that are available after the first page results.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for ListEndpointsByPlatformApplication action.</p>\" \
        }, \
        \"ListEndpointsByPlatformApplicationResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"Endpoints\":{ \
              \"shape\":\"ListOfEndpoints\", \
              \"documentation\":\"<p>Endpoints returned for ListEndpointsByPlatformApplication action.</p>\" \
            }, \
            \"NextToken\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>NextToken string is returned when calling ListEndpointsByPlatformApplication action if additional records are available after the first page results.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Response for ListEndpointsByPlatformApplication action.</p>\" \
        }, \
        \"ListOfEndpoints\":{ \
          \"type\":\"list\", \
          \"member\":{\"shape\":\"Endpoint\"} \
        }, \
        \"ListOfPlatformApplications\":{ \
          \"type\":\"list\", \
          \"member\":{\"shape\":\"PlatformApplication\"} \
        }, \
        \"ListPlatformApplicationsInput\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"NextToken\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>NextToken string is used when calling ListPlatformApplications action to retrieve additional records that are available after the first page results.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for ListPlatformApplications action.</p>\" \
        }, \
        \"ListPlatformApplicationsResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"PlatformApplications\":{ \
              \"shape\":\"ListOfPlatformApplications\", \
              \"documentation\":\"<p>Platform applications returned when calling ListPlatformApplications action.</p>\" \
            }, \
            \"NextToken\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>NextToken string is returned when calling ListPlatformApplications action if additional records are available after the first page results.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Response for ListPlatformApplications action.</p>\" \
        }, \
        \"ListSubscriptionsByTopicInput\":{ \
          \"type\":\"structure\", \
          \"required\":[\"TopicArn\"], \
          \"members\":{ \
            \"TopicArn\":{ \
              \"shape\":\"topicARN\", \
              \"documentation\":\"<p>The ARN of the topic for which you wish to find subscriptions.</p>\" \
            }, \
            \"NextToken\":{ \
              \"shape\":\"nextToken\", \
              \"documentation\":\"<p>Token returned by the previous <code>ListSubscriptionsByTopic</code> request.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for ListSubscriptionsByTopic action.</p>\" \
        }, \
        \"ListSubscriptionsByTopicResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"Subscriptions\":{ \
              \"shape\":\"SubscriptionsList\", \
              \"documentation\":\"<p>A list of subscriptions.</p>\" \
            }, \
            \"NextToken\":{ \
              \"shape\":\"nextToken\", \
              \"documentation\":\"<p>Token to pass along to the next <code>ListSubscriptionsByTopic</code> request. This element is returned if there are more subscriptions to retrieve.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Response for ListSubscriptionsByTopic action.</p>\" \
        }, \
        \"ListSubscriptionsInput\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"NextToken\":{ \
              \"shape\":\"nextToken\", \
              \"documentation\":\"<p>Token returned by the previous <code>ListSubscriptions</code> request.</p>\" \
            } \
          }, \
          \"documentation\":\"Input for ListSubscriptions action.\" \
        }, \
        \"ListSubscriptionsResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"Subscriptions\":{ \
              \"shape\":\"SubscriptionsList\", \
              \"documentation\":\"<p>A list of subscriptions.</p>\" \
            }, \
            \"NextToken\":{ \
              \"shape\":\"nextToken\", \
              \"documentation\":\"<p>Token to pass along to the next <code>ListSubscriptions</code> request. This element is returned if there are more subscriptions to retrieve.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Response for ListSubscriptions action</p>\" \
        }, \
        \"ListTopicsInput\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"NextToken\":{ \
              \"shape\":\"nextToken\", \
              \"documentation\":\"<p>Token returned by the previous <code>ListTopics</code> request.</p>\" \
            } \
          } \
        }, \
        \"ListTopicsResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"Topics\":{ \
              \"shape\":\"TopicsList\", \
              \"documentation\":\"<p>A list of topic ARNs.</p>\" \
            }, \
            \"NextToken\":{ \
              \"shape\":\"nextToken\", \
              \"documentation\":\"<p>Token to pass along to the next <code>ListTopics</code> request. This element is returned if there are additional topics to retrieve.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Response for ListTopics action.</p>\" \
        }, \
        \"MapStringToString\":{ \
          \"type\":\"map\", \
          \"key\":{\"shape\":\"String\"}, \
          \"value\":{\"shape\":\"String\"} \
        }, \
        \"MessageAttributeMap\":{ \
          \"type\":\"map\", \
          \"key\":{ \
            \"shape\":\"String\", \
            \"locationName\":\"Name\" \
          }, \
          \"value\":{ \
            \"shape\":\"MessageAttributeValue\", \
            \"locationName\":\"Value\" \
          } \
        }, \
        \"MessageAttributeValue\":{ \
          \"type\":\"structure\", \
          \"required\":[\"DataType\"], \
          \"members\":{ \
            \"DataType\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>Amazon SNS supports the following logical data types: String, Number, and Binary. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html#SNSMessageAttributes.DataTypes\\\">Message Attribute Data Types</a>.</p>\" \
            }, \
            \"StringValue\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>Strings are Unicode with UTF8 binary encoding. For a list of code values, see <a href=\\\"http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters\\\">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.</p>\" \
            }, \
            \"BinaryValue\":{ \
              \"shape\":\"Binary\", \
              \"documentation\":\"<p>Binary type attributes can store any binary data, for example, compressed data, encrypted data, or images.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>The user-specified message attribute value. For string data types, the value attribute has the same restrictions on the content as the message body. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/api/API_Publish.html\\\">Publish</a>.</p> <p>Name, type, and value must not be empty or null. In addition, the message body should not be empty or null. All parts of the message attribute, including name, type, and value, are included in the message size restriction, which is currently 256 KB (262,144 bytes). For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html\\\">Using Amazon SNS Message Attributes</a>.</p>\" \
        }, \
        \"NotFoundException\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"message\":{\"shape\":\"string\"} \
          }, \
          \"error\":{ \
            \"code\":\"NotFound\", \
            \"httpStatusCode\":404, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\" \
        }, \
        \"PlatformApplication\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"PlatformApplicationArn\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>PlatformApplicationArn for platform application object.</p>\" \
            }, \
            \"Attributes\":{ \
              \"shape\":\"MapStringToString\", \
              \"documentation\":\"<p>Attributes for platform application object.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Platform application object.</p>\" \
        }, \
        \"PlatformApplicationDisabledException\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"message\":{ \
              \"shape\":\"string\", \
              \"documentation\":\"<p>Message for platform application disabled.</p>\" \
            } \
          }, \
          \"error\":{ \
            \"code\":\"PlatformApplicationDisabled\", \
            \"httpStatusCode\":400, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>Exception error indicating platform application disabled.</p>\" \
        }, \
        \"PublishInput\":{ \
          \"type\":\"structure\", \
          \"required\":[\"Message\"], \
          \"members\":{ \
            \"TopicArn\":{ \
              \"shape\":\"topicARN\", \
              \"documentation\":\"<p>The topic you want to publish to.</p>\" \
            }, \
            \"TargetArn\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>Either TopicArn or EndpointArn, but not both.</p>\" \
            }, \
            \"Message\":{ \
              \"shape\":\"message\", \
              \"documentation\":\"<p>The message you want to send to the topic.</p> <p>If you want to send the same message to all transport protocols, include the text of the message as a String value.</p> <p>If you want to send different messages for each transport protocol, set the value of the <code>MessageStructure</code> parameter to <code>json</code> and use a JSON object for the <code>Message</code> parameter. See the Examples section for the format of the JSON object. </p> <p>Constraints: Messages must be UTF-8 encoded strings at most 256 KB in size (262144 bytes, not 262144 characters).</p> <p>JSON-specific constraints: <ul> <li>Keys in the JSON object that correspond to supported transport protocols must have simple JSON string values. </li> <li>The values will be parsed (unescaped) before they are used in outgoing messages.</li> <li>Outbound notifications are JSON encoded (meaning that the characters will be reescaped for sending).</li> <li>Values have a minimum length of 0 (the empty string, \\\"\\\", is allowed).</li> <li>Values have a maximum length bounded by the overall message size (so, including multiple protocols may limit message sizes).</li> <li>Non-string values will cause the key to be ignored.</li> <li>Keys that do not correspond to supported transport protocols are ignored.</li> <li>Duplicate keys are not allowed.</li> <li>Failure to parse or validate any key or value in the message will cause the <code>Publish</code> call to return an error (no partial delivery).</li> </ul> </p>\" \
            }, \
            \"Subject\":{ \
              \"shape\":\"subject\", \
              \"documentation\":\"<p>Optional parameter to be used as the \\\"Subject\\\" line when the message is delivered to email endpoints. This field will also be included, if present, in the standard JSON messages delivered to other endpoints.</p> <p>Constraints: Subjects must be ASCII text that begins with a letter, number, or punctuation mark; must not include line breaks or control characters; and must be less than 100 characters long.</p>\" \
            }, \
            \"MessageStructure\":{ \
              \"shape\":\"messageStructure\", \
              \"documentation\":\"<p>Set <code>MessageStructure</code> to <code>json</code> if you want to send a different message for each protocol. For example, using one publish action, you can send a short message to your SMS subscribers and a longer message to your email subscribers. If you set <code>MessageStructure</code> to <code>json</code>, the value of the <code>Message</code> parameter must: </p> <ul> <li>be a syntactically valid JSON object; and</li> <li>contain at least a top-level JSON key of \\\"default\\\" with a value that is a string.</li> </ul> <p> You can define other top-level keys that define the message you want to send to a specific transport protocol (e.g., \\\"http\\\"). </p> <p>For information about sending different messages for each protocol using the AWS Management Console, go to <a href=\\\"http://docs.aws.amazon.com/sns/latest/gsg/Publish.html#sns-message-formatting-by-protocol\\\">Create Different Messages for Each Protocol</a> in the <i>Amazon Simple Notification Service Getting Started Guide</i>. </p> <p>Valid value: <code>json</code></p>\" \
            }, \
            \"MessageAttributes\":{ \
              \"shape\":\"MessageAttributeMap\", \
              \"documentation\":\"<p>Message attributes for Publish action.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for Publish action.</p>\" \
        }, \
        \"PublishResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"MessageId\":{ \
              \"shape\":\"messageId\", \
              \"documentation\":\"<p>Unique identifier assigned to the published message.</p> <p>Length Constraint: Maximum 100 characters</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Response for Publish action.</p>\" \
        }, \
        \"RemovePermissionInput\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"TopicArn\", \
            \"Label\" \
          ], \
          \"members\":{ \
            \"TopicArn\":{ \
              \"shape\":\"topicARN\", \
              \"documentation\":\"<p>The ARN of the topic whose access control policy you wish to modify.</p>\" \
            }, \
            \"Label\":{ \
              \"shape\":\"label\", \
              \"documentation\":\"<p>The unique label of the statement you want to remove.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for RemovePermission action.</p>\" \
        }, \
        \"SetEndpointAttributesInput\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"EndpointArn\", \
            \"Attributes\" \
          ], \
          \"members\":{ \
            \"EndpointArn\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>EndpointArn used for SetEndpointAttributes action.</p>\" \
            }, \
            \"Attributes\":{ \
              \"shape\":\"MapStringToString\", \
              \"documentation\":\"<p>A map of the endpoint attributes. Attributes in this map include the following:</p> <ul> <li> <code>CustomUserData</code> -- arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less than 2KB.</li> <li> <code>Enabled</code> -- flag that enables/disables delivery to the endpoint. Amazon SNS will set this to false when a notification service indicates to Amazon SNS that the endpoint is invalid. Users can set it back to true, typically after updating Token.</li> <li> <code>Token</code> -- device token, also referred to as a registration id, for an app and mobile device. This is returned from the notification service when an app and mobile device are registered with the notification service.</li> </ul>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for SetEndpointAttributes action.</p>\" \
        }, \
        \"SetPlatformApplicationAttributesInput\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"PlatformApplicationArn\", \
            \"Attributes\" \
          ], \
          \"members\":{ \
            \"PlatformApplicationArn\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>PlatformApplicationArn for SetPlatformApplicationAttributes action.</p>\" \
            }, \
            \"Attributes\":{ \
              \"shape\":\"MapStringToString\", \
              \"documentation\":\"<p>A map of the platform application attributes. Attributes in this map include the following:</p> <ul> <li> <code>PlatformCredential</code> -- The credential received from the notification service. For APNS/APNS_SANDBOX, PlatformCredential is \\\"private key\\\". For GCM, PlatformCredential is \\\"API key\\\". For ADM, PlatformCredential is \\\"client secret\\\".</li> <li> <code>PlatformPrincipal</code> -- The principal received from the notification service. For APNS/APNS_SANDBOX, PlatformPrincipal is \\\"SSL certificate\\\". For GCM, PlatformPrincipal is not applicable. For ADM, PlatformPrincipal is \\\"client id\\\".</li> <li> <code>EventEndpointCreated</code> -- Topic ARN to which EndpointCreated event notifications should be sent.</li> <li> <code>EventEndpointDeleted</code> -- Topic ARN to which EndpointDeleted event notifications should be sent.</li> <li> <code>EventEndpointUpdated</code> -- Topic ARN to which EndpointUpdate event notifications should be sent.</li> <li> <code>EventDeliveryFailure</code> -- Topic ARN to which DeliveryFailure event notifications should be sent upon Direct Publish delivery failure (permanent) to one of the application's endpoints.</li> </ul>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for SetPlatformApplicationAttributes action.</p>\" \
        }, \
        \"SetSubscriptionAttributesInput\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"SubscriptionArn\", \
            \"AttributeName\" \
          ], \
          \"members\":{ \
            \"SubscriptionArn\":{ \
              \"shape\":\"subscriptionARN\", \
              \"documentation\":\"<p>The ARN of the subscription to modify.</p>\" \
            }, \
            \"AttributeName\":{ \
              \"shape\":\"attributeName\", \
              \"documentation\":\"<p>The name of the attribute you want to set. Only a subset of the subscriptions attributes are mutable.</p> <p>Valid values: <code>DeliveryPolicy</code> | <code>RawMessageDelivery</code></p>\" \
            }, \
            \"AttributeValue\":{ \
              \"shape\":\"attributeValue\", \
              \"documentation\":\"<p>The new value for the attribute in JSON format.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for SetSubscriptionAttributes action.</p>\" \
        }, \
        \"SetTopicAttributesInput\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"TopicArn\", \
            \"AttributeName\" \
          ], \
          \"members\":{ \
            \"TopicArn\":{ \
              \"shape\":\"topicARN\", \
              \"documentation\":\"<p>The ARN of the topic to modify.</p>\" \
            }, \
            \"AttributeName\":{ \
              \"shape\":\"attributeName\", \
              \"documentation\":\"<p>The name of the attribute you want to set. Only a subset of the topic's attributes are mutable.</p> <p>Valid values: <code>Policy</code> | <code>DisplayName</code> | <code>DeliveryPolicy</code></p>\" \
            }, \
            \"AttributeValue\":{ \
              \"shape\":\"attributeValue\", \
              \"documentation\":\"<p>The new value for the attribute.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for SetTopicAttributes action.</p>\" \
        }, \
        \"String\":{\"type\":\"string\"}, \
        \"SubscribeInput\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"TopicArn\", \
            \"Protocol\" \
          ], \
          \"members\":{ \
            \"TopicArn\":{ \
              \"shape\":\"topicARN\", \
              \"documentation\":\"<p>The ARN of the topic you want to subscribe to.</p>\" \
            }, \
            \"Protocol\":{ \
              \"shape\":\"protocol\", \
              \"documentation\":\"<p>The protocol you want to use. Supported protocols include:</p> <ul> <li> <code>http</code> -- delivery of JSON-encoded message via HTTP POST</li> <li> <code>https</code> -- delivery of JSON-encoded message via HTTPS POST</li> <li> <code>email</code> -- delivery of message via SMTP</li> <li> <code>email-json</code> -- delivery of JSON-encoded message via SMTP</li> <li> <code>sms</code> -- delivery of message via SMS</li> <li> <code>sqs</code> -- delivery of JSON-encoded message to an Amazon SQS queue</li> <li> <code>application</code> -- delivery of JSON-encoded message to an EndpointArn for a mobile app and device.</li> </ul>\" \
            }, \
            \"Endpoint\":{ \
              \"shape\":\"endpoint\", \
              \"documentation\":\"<p>The endpoint that you want to receive notifications. Endpoints vary by protocol:</p> <ul> <li>For the <code>http</code> protocol, the endpoint is an URL beginning with \\\"http://\\\"</li> <li>For the <code>https</code> protocol, the endpoint is a URL beginning with \\\"https://\\\"</li> <li>For the <code>email</code> protocol, the endpoint is an email address</li> <li>For the <code>email-json</code> protocol, the endpoint is an email address</li> <li>For the <code>sms</code> protocol, the endpoint is a phone number of an SMS-enabled device</li> <li>For the <code>sqs</code> protocol, the endpoint is the ARN of an Amazon SQS queue</li> <li>For the <code>application</code> protocol, the endpoint is the EndpointArn of a mobile app and device.</li> </ul>\" \
            } \
          }, \
          \"documentation\":\"Input for Subscribe action.\" \
        }, \
        \"SubscribeResponse\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"SubscriptionArn\":{ \
              \"shape\":\"subscriptionARN\", \
              \"documentation\":\"<p>The ARN of the subscription, if the service was able to create a subscription immediately (without requiring endpoint owner confirmation).</p>\" \
            } \
          }, \
          \"documentation\":\"Response for Subscribe action.\" \
        }, \
        \"Subscription\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"SubscriptionArn\":{ \
              \"shape\":\"subscriptionARN\", \
              \"documentation\":\"<p>The subscription's ARN.</p>\" \
            }, \
            \"Owner\":{ \
              \"shape\":\"account\", \
              \"documentation\":\"<p>The subscription's owner.</p>\" \
            }, \
            \"Protocol\":{ \
              \"shape\":\"protocol\", \
              \"documentation\":\"<p>The subscription's protocol.</p>\" \
            }, \
            \"Endpoint\":{ \
              \"shape\":\"endpoint\", \
              \"documentation\":\"<p>The subscription's endpoint (format depends on the protocol).</p>\" \
            }, \
            \"TopicArn\":{ \
              \"shape\":\"topicARN\", \
              \"documentation\":\"<p>The ARN of the subscription's topic.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>A wrapper type for the attributes of an Amazon SNS subscription.</p>\" \
        }, \
        \"SubscriptionAttributesMap\":{ \
          \"type\":\"map\", \
          \"key\":{\"shape\":\"attributeName\"}, \
          \"value\":{\"shape\":\"attributeValue\"} \
        }, \
        \"SubscriptionLimitExceededException\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"message\":{\"shape\":\"string\"} \
          }, \
          \"error\":{ \
            \"code\":\"SubscriptionLimitExceeded\", \
            \"httpStatusCode\":403, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>Indicates that the customer already owns the maximum allowed number of subscriptions.</p>\" \
        }, \
        \"SubscriptionsList\":{ \
          \"type\":\"list\", \
          \"member\":{\"shape\":\"Subscription\"} \
        }, \
        \"Topic\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"TopicArn\":{ \
              \"shape\":\"topicARN\", \
              \"documentation\":\"<p>The topic's ARN.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>A wrapper type for the topic's Amazon Resource Name (ARN). To retrieve a topic's attributes, use <code>GetTopicAttributes</code>.</p>\" \
        }, \
        \"TopicAttributesMap\":{ \
          \"type\":\"map\", \
          \"key\":{\"shape\":\"attributeName\"}, \
          \"value\":{\"shape\":\"attributeValue\"} \
        }, \
        \"TopicLimitExceededException\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"message\":{\"shape\":\"string\"} \
          }, \
          \"error\":{ \
            \"code\":\"TopicLimitExceeded\", \
            \"httpStatusCode\":403, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>Indicates that the customer already owns the maximum allowed number of topics.</p>\" \
        }, \
        \"TopicsList\":{ \
          \"type\":\"list\", \
          \"member\":{\"shape\":\"Topic\"} \
        }, \
        \"UnsubscribeInput\":{ \
          \"type\":\"structure\", \
          \"required\":[\"SubscriptionArn\"], \
          \"members\":{ \
            \"SubscriptionArn\":{ \
              \"shape\":\"subscriptionARN\", \
              \"documentation\":\"<p>The ARN of the subscription to be deleted.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Input for Unsubscribe action.</p>\" \
        }, \
        \"account\":{\"type\":\"string\"}, \
        \"action\":{\"type\":\"string\"}, \
        \"attributeName\":{\"type\":\"string\"}, \
        \"attributeValue\":{\"type\":\"string\"}, \
        \"authenticateOnUnsubscribe\":{\"type\":\"string\"}, \
        \"delegate\":{\"type\":\"string\"}, \
        \"endpoint\":{\"type\":\"string\"}, \
        \"label\":{\"type\":\"string\"}, \
        \"message\":{\"type\":\"string\"}, \
        \"messageId\":{\"type\":\"string\"}, \
        \"messageStructure\":{\"type\":\"string\"}, \
        \"nextToken\":{\"type\":\"string\"}, \
        \"protocol\":{\"type\":\"string\"}, \
        \"string\":{\"type\":\"string\"}, \
        \"subject\":{\"type\":\"string\"}, \
        \"subscriptionARN\":{\"type\":\"string\"}, \
        \"token\":{\"type\":\"string\"}, \
        \"topicARN\":{\"type\":\"string\"}, \
        \"topicName\":{\"type\":\"string\"} \
      } \
    } \
     \
    ";
}

@end
