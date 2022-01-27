@echo off

SET GENYUV=dxva2.yuv
SET GOLDENYUV=golden.yuv
SET SRC_DECODING_FILE=SampleVideo_1280x720_10mb.264
SET FRAMES_TO_DECODE=10

if exist %GENYUV% (
	echo %GENYUV% exist , will remove it first !
	del  %GENYUV%
) else (
    echo No %GENYUV% , decoding directlly !
)


ffmpeg.exe -hwaccel dxva2 -threads 1 -i %SRC_DECODING_FILE% -vframes %FRAMES_TO_DECODE% -pix_fmt nv12 %GENYUV%
fc.exe /b %GENYUV% %GOLDENYUV%
ffmpeg.exe -hwaccel   dxva2   -threads 1 -i %SRC_DECODING_FILE%   -f NULL - -benchmark