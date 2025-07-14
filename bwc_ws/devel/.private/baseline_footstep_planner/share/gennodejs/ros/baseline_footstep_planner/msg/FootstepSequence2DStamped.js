// Auto-generated. Do not edit!

// (in-package baseline_footstep_planner.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let FootstepSequence2D = require('./FootstepSequence2D.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class FootstepSequence2DStamped {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.sequence = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('sequence')) {
        this.sequence = initObj.sequence
      }
      else {
        this.sequence = new FootstepSequence2D();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FootstepSequence2DStamped
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [sequence]
    bufferOffset = FootstepSequence2D.serialize(obj.sequence, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FootstepSequence2DStamped
    let len;
    let data = new FootstepSequence2DStamped(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [sequence]
    data.sequence = FootstepSequence2D.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += FootstepSequence2D.getMessageSize(object.sequence);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'baseline_footstep_planner/FootstepSequence2DStamped';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '18521c3629e10bc5eb159b2a2ca397ab';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    FootstepSequence2D sequence
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: baseline_footstep_planner/FootstepSequence2D
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
    const resolved = new FootstepSequence2DStamped(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.sequence !== undefined) {
      resolved.sequence = FootstepSequence2D.Resolve(msg.sequence)
    }
    else {
      resolved.sequence = new FootstepSequence2D()
    }

    return resolved;
    }
};

module.exports = FootstepSequence2DStamped;
