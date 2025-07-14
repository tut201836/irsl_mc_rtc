// Auto-generated. Do not edit!

// (in-package baseline_footstep_planner.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Footstep2D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.foot_lr = null;
      this.foot_pose = null;
    }
    else {
      if (initObj.hasOwnProperty('foot_lr')) {
        this.foot_lr = initObj.foot_lr
      }
      else {
        this.foot_lr = 0;
      }
      if (initObj.hasOwnProperty('foot_pose')) {
        this.foot_pose = initObj.foot_pose
      }
      else {
        this.foot_pose = new geometry_msgs.msg.Pose2D();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Footstep2D
    // Serialize message field [foot_lr]
    bufferOffset = _serializer.int8(obj.foot_lr, buffer, bufferOffset);
    // Serialize message field [foot_pose]
    bufferOffset = geometry_msgs.msg.Pose2D.serialize(obj.foot_pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Footstep2D
    let len;
    let data = new Footstep2D(null);
    // Deserialize message field [foot_lr]
    data.foot_lr = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [foot_pose]
    data.foot_pose = geometry_msgs.msg.Pose2D.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 25;
  }

  static datatype() {
    // Returns string type for a message object
    return 'baseline_footstep_planner/Footstep2D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b9b527870d832ddd9af7e14a6b253360';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Footstep2D(null);
    if (msg.foot_lr !== undefined) {
      resolved.foot_lr = msg.foot_lr;
    }
    else {
      resolved.foot_lr = 0
    }

    if (msg.foot_pose !== undefined) {
      resolved.foot_pose = geometry_msgs.msg.Pose2D.Resolve(msg.foot_pose)
    }
    else {
      resolved.foot_pose = new geometry_msgs.msg.Pose2D()
    }

    return resolved;
    }
};

// Constants for message
Footstep2D.Constants = {
  LEFT: 0,
  RIGHT: 1,
}

module.exports = Footstep2D;
