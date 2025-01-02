name: test
on: push
jobs:
  test:
    runs-on: ubuntu-22.04
    container: ryuichiueda/ubuntu22.04-ros2:latest
    steps:
      - uses: actions/checkout@v2
      - name: build and test
        run: |
          rsync -av ./ /root/ros2_ws/src/
          cd /root/ros2_ws
          bash -xv ./src/mypkg/test/test.bash /root
