// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/io;

# Parameter `hub.mode` representing the mode of the request from hub to subscriber or subscriber to hub.
const string HUB_MODE = "hub.mode";

# Subscription change or intent verification request parameter 'hub.topic'' representing the topic relevant to the for
# which the request is initiated.
const string HUB_TOPIC = "hub.topic";

# `hub.mode` value indicating "publish" mode, used by a publisher to notify an update to a topic.
const string MODE_PUBLISH = "publish";

# `hub.mode` value indicating "register" mode, used by a publisher to register a topic at a hub.
const string MODE_REGISTER = "register";

# `hub.mode` value indicating "unregister" mode, used by a publisher to unregister a topic at a hub.
const string MODE_UNREGISTER = "unregister";

const string CONTENT_TYPE = "Content-Type";

# Record to represent a WebSub content delivery.
#
# + payload - The payload to be sent
# + contentType - The content-type of the payload
type WebSubContent record {|
    string|xml|json|byte[]|io:ReadableByteChannel payload = "";
    string contentType = "";
|};

public type RegisterTopicMessage record {|
    string topic;
|};

public type UnregisterTopicMessage record {|
    string topic;
|};

type CommonResponse record {|
    map<string|string[]> headers?;
    map<string> body?;
|};

public type TopicRegistrationSuccess record {
    *CommonResponse;
};

public type TopicUnregistrationSuccess record {
    *CommonResponse;
};
