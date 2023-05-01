// Auto-generated. Do not edit!

// (in-package first_project.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class Reset_odomRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Reset_odomRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Reset_odomRequest
    let len;
    let data = new Reset_odomRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'first_project/Reset_odomRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Reset_odomRequest(null);
    return resolved;
    }
};

class Reset_odomResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.resetted = null;
    }
    else {
      if (initObj.hasOwnProperty('resetted')) {
        this.resetted = initObj.resetted
      }
      else {
        this.resetted = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Reset_odomResponse
    // Serialize message field [resetted]
    bufferOffset = _serializer.bool(obj.resetted, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Reset_odomResponse
    let len;
    let data = new Reset_odomResponse(null);
    // Deserialize message field [resetted]
    data.resetted = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'first_project/Reset_odomResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '018a2998f38d6a4605b80747930e74ce';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool resetted
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Reset_odomResponse(null);
    if (msg.resetted !== undefined) {
      resolved.resetted = msg.resetted;
    }
    else {
      resolved.resetted = false
    }

    return resolved;
    }
};

module.exports = {
  Request: Reset_odomRequest,
  Response: Reset_odomResponse,
  md5sum() { return '018a2998f38d6a4605b80747930e74ce'; },
  datatype() { return 'first_project/Reset_odom'; }
};
