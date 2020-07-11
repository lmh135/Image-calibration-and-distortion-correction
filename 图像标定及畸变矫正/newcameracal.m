% Auto-generated by cameraCalibrator app on 09-May-2017
%-------------------------------------------------------

clear all;
close all;
clc;
% Define images to process
imageFileNames = {'/home/longmen/桌面/biaoding/pic2/pic1.jpg',...
    '/home/longmen/桌面/biaoding/pic2/pic2.jpg',...
    '/home/longmen/桌面/biaoding/pic2/pic3.jpg',...
    '/home/longmen/桌面/biaoding/pic2/pic4.jpg',...
    '/home/longmen/桌面/biaoding/pic2/pic5.jpg',...
    '/home/longmen/桌面/biaoding/pic2/pic6.jpg',...
    '/home/longmen/桌面/biaoding/pic2/pic7.jpg',...
    '/home/longmen/桌面/biaoding/pic2/pic8.jpg',...
    '/home/longmen/桌面/biaoding/pic2/pic9.jpg',...
    '/home/longmen/桌面/biaoding/pic2/pic10.jpg',...
    '/home/longmen/桌面/biaoding/pic2/pic11.jpg',...
    '/home/longmen/桌面/biaoding/pic2/pic12.jpg',...
    '/home/longmen/桌面/biaoding/pic2/pic13.jpg',...
    '/home/longmen/桌面/biaoding/pic2/pic14.jpg',...
    '/home/longmen/桌面/biaoding/pic2/pic15.jpg',...
    };

% Detect checkerboards in images
[imagePoints, boardSize, imagesUsed] = detectCheckerboardPoints(imageFileNames);
imageFileNames = imageFileNames(imagesUsed);

% Generate world coordinates of the corners of the squares
squareSize = 62;  % in units of 'mm'
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

% Calibrate the camera
[cameraParams, imagesUsed, estimationErrors] = estimateCameraParameters(imagePoints, worldPoints, ...
    'EstimateSkew', false, 'EstimateTangentialDistortion', false, ...
    'NumRadialDistortionCoefficients', 2, 'WorldUnits', 'mm', ...
    'InitialIntrinsicMatrix', [], 'InitialRadialDistortion', []);

% View reprojection errors
h1=figure; showReprojectionErrors(cameraParams, 'BarGraph');

% Visualize pattern locations
h2=figure; showExtrinsics(cameraParams, 'CameraCentric');

% Display parameter estimation errors
displayErrors(estimationErrors, cameraParams);

% For example, you can use the calibration data to remove effects of lens distortion.
originalImage = imread(imageFileNames{1});
undistortedImage = undistortImage(originalImage, cameraParams);

% See additional examples of how to use the calibration data.  At the prompt type:
% showdemo('MeasuringPlanarObjectsExample')
% showdemo('StructureFromMotionExample')
