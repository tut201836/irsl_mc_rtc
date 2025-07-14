// Auto-generated. Do not edit!

// (in-package baseline_footstep_planner.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Footstep2D = require('./Footstep2D.js');

//-----------------------------------------------------------

class FootstepSequence2D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.footsteps = null;
    }
    else {
      if (initObj.hasOwnProperty('footsteps')) {
        this.footsteps = initObj.footsteps
      }
      else {
        this.footsteps = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FootstepSequence2D
    // Serialize message field [footsteps]
    // Serialize the length for message field [footsteps]
    bufferOffset = _serializer.uint32(obj.footsteps.length, buffer, bufferOffset);
    obj.footsteps.forEach((val) => {
      bufferOffset = Footstep2D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FootstepSequence2D
    let len;
    let data = new FootstepSequence2D(null);
    // Deserialize message field [footsteps]
    // Deserialize array length for message field [footsteps]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.footsteps = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.footsteps[i] = Footstep2D.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 25 * object.footsteps.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'baseline_footstep_planner/FootstepSequence2D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2d7253025f3e5ddf09047640b33d4044';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Footstep2D[] footsteps
    
    ================================================================================
    MSG: baseline_footstep_planner/Footstep2D
    int8 LEFT=0
    int8 RIGHT=1
    
    int8 foot_lr
    geometry_msgs/Pose2D foot_pose
    
    ================================================================================
    MSG: geometry_msgs/Pose2D
    # Deprecated
    # Please use the full 3D pose.
    
    # In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.
    
    # If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.
    
    
    # This expresses a position and orientation on a 2D manifold.
    
    float64 x
    float64 y
    float64 theta
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FootstepSequence2D(null);
    if (msg.footsteps !== undefined) {
      resolved.footsteps = new Array(msg.footsteps.length);
      for (let i = 0; i < resolved.footsteps.length; ++i) {
        resolved.footsteps[i] = Footstep2D.Resolve(msg.footsteps[i]);
      }
    }
    else {
      resolved.footsteps = []
    }

    return resolved;
    }
};

module.exports = FootstepSequence2D;
