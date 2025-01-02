import rclpy
from rclpy.node import Node
from custom_msgs.msg import ShapeInfo

rclpy.init()
node = Node("listener")

def callback(msg):
    node.get_logger().info(f"{msg.sides}角形の内角の和は: {msg.angle_sum}°")

def main():
    node.create_subscription(ShapeInfo, "shape_info", callback, 10)
    rclpy.spin(node)
