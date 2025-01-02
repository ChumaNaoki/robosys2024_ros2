import rclpy
from rclpy.node import Node
from custom_msgs.msg import ShapeInfo

rclpy.init()
node = Node("talker")
pub = node.create_publisher(ShapeInfo, "shape_info", 10)
n = 3

def publish_shape_info():
    global n
    msg = ShapeInfo()
    msg.sides = n
    msg.angle_sum = 180 * (n - 2)
    pub.publish(msg)
    n += 1

def main():
    node.create_timer(1, publish_shape_info)
    rclpy.spin(node)
