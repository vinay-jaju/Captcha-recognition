function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 23-Mar-2017 09:57:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');
[dummy, p] = max(h2, [], 2);

% =========================================================================




% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imgURL=get(handles.edit1,'String');
Sp=10;
%% Show image
imagen=imread(imgURL);
imshow(imagen,'Parent',handles.axes1);
title('INPUT IMAGE WITH NOISE')
%% Convert to gray scale
if size(imagen,3)==3 % RGB image
    imagen=rgb2gray(imagen);
end
%% Convert to binary image
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);
%imagen = imopen(imagen, strel('rectangle',[5 ceil(Sp/2)]));
% w=ones(2);
% imagen=imdilate(imagen,w);
% imagen=imerode(imagen,w);
%se = ones(3);
%closeBW = imopen(imagen,se);
%imagen = imclose(closeBW,se);
%% Remove all object containing fewer than 100 pixels
%imagen = bwareaopen(imagen,10);

pause(1)
%% Show image binary image
%%figure(2)
imshow(~imagen,'Parent',handles.axes3);
%%title('INPUT IMAGE WITHOUT NOISE')

%% Label connected components
[L, Ne]=bwlabel(imagen);
%% Measure properties of image regions
propied=regionprops(L,'BoundingBox');
hold on
%% Plot Bounding Box
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',1)
end
hold off
pause (1)
%% Objects extraction
%%figure
 pathname = 'E:\BEProject\Captcha-recognition\lol';
 %%rmdir(pathname);
 rmdir ('lol','s');
 mkdir(pathname);
%imwrite(data,[pathname, 'data',num2str(j),'.png']);
%[d,p] = find(L==n);
%t2=(min(p))/2;
%t1=(min(d))/2;
t=5;
k=0;
for n=1:Ne
    [r,c] = find(L==n);
    if max(r)-min(r)>t && max(c)-min(c)>t
    n1=imagen(min(r):max(r),min(c):max(c));
    k=k+1;
%     w=ones(3);
%     n1=imdilate(n1,w);
%     n1=imerode(n1,w);
%     n1=imdilate(n1,w);
    n1=imcomplement(n1);
    n1=double(n1);
    n1=n1*255;
    n1=(n1-127.5)/127.5;
    n1=imresize(n1,[20 20]);
    %%figure
    %%imshow(n1);
    baseFileName = sprintf('%d.png', n); % e.g. "1.png"
    fullFileName = fullfile(pathname, baseFileName); 
    imshow(n1,'Parent',handles.axes2);
    imwrite(n1, fullFileName);    pause(1)
    end;
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('Theta1final.mat')
load('Theta2final.mat')
srcFiles = dir('E:\BEProject\Captcha-recognition\lol\*.png');
valueSet =   {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'};
keySet = {1, 2, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62};
mapObj = containers.Map(keySet,valueSet);
mapObj.Count
ans1 = '';
%cd 'E:\BEProject\BEProjectNEW\lol\';
%delete E:\BEProject\BEProjectNEW\lol\*.png;
%cd 'E:\BEProject\BEProjectNEW\';
for i = 1 : length(srcFiles)
    filename = strcat('E:\BEProject\Captcha-recognition\lol\',srcFiles(i).name);
    I = imread(filename);
    %figure, imshow(I);
    a = I;
    a = double(a);
    a = (a-127.5)/127.5;
    a = a(:);
    a = a';
    x = predict(Theta1,Theta2,a)
    rain = mapObj(x)
    ans1 = strcat(ans1,rain)
end
set(handles.text6, 'String', ans1);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*.png';'*.jpg';'*.bmp'},'File Selector');
imgURL=strcat(pathname,filename);
set(handles.edit1,'string',imgURL);
img=imread(imgURL);
imshow(img,'Parent',handles.axes1);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imgURL=get(handles.edit1,'String');
img=imread(imgURL);
imshow(img,'Parent',handles.axes1);


% --- Executes during object creation, after setting all properties.
function text6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
