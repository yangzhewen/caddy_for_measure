#!/bin/bash

# 检查是否提供了输入文件
if [ $# -ne 1 ]; then
    echo "用法: $0 <输入视频文件>"
    exit 1
fi

input_file="$1"
filename=$(basename -- "$input_file")
filename_noext="${filename%.*}"  # 去除扩展名

echo "开始 DASH 切片: $input_file"

# 生成 DASH 文件
MP4Box -dash 2000 \
-segment-name 'segment_$RepresentationID$_' \
-mpd-refresh 2 \
-fps 25 "${filename_noext}_240_25fps.mp4#video:id=240p" \
-fps 25 "${filename_noext}_360_25fps.mp4#video:id=360p" \
-fps 25 "${filename_noext}_480_25fps.mp4#video:id=480p" \
-fps 25 "${filename_noext}_720_25fps.mp4#video:id=720p" \
-fps 60 "${filename_noext}_720_60fps.mp4#video:id=7202p" \
-fps 25 "${filename_noext}_1080_25fps.mp4#video:id=1080p" \
-fps 60 "${filename_noext}_1080_60fps.mp4#video:id=10802p" \
-fps 30 "${filename_noext}_1440_30fps.mp4#video:id=1440p" \
-fps 60 "${filename_noext}_1440_60fps.mp4#video:id=14402p" \
-fps 30 "${filename_noext}_2160_30fps.mp4#video:id=2560p" \
-fps 60 "${filename_noext}_2160_60fps.mp4#video:id=25602p" \
-out "${filename_noext}_dash.mpd"

echo "DASH 处理完成！输出 MPD 文件: ${filename_noext}_dash.mpd"
