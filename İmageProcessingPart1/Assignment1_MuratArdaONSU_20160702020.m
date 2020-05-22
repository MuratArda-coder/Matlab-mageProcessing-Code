function varargout = Assignment1_MuratArdaONSU_20160702020(varargin)
% ASSIGNMENT1_MURATARDAONSU_20160702020 MATLAB code for Assignment1_MuratArdaONSU_20160702020.fig
%      ASSIGNMENT1_MURATARDAONSU_20160702020, by itself, creates a new ASSIGNMENT1_MURATARDAONSU_20160702020 or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT1_MURATARDAONSU_20160702020 returns the handle to a new ASSIGNMENT1_MURATARDAONSU_20160702020 or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT1_MURATARDAONSU_20160702020('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT1_MURATARDAONSU_20160702020.M with the given input arguments.
%
%      ASSIGNMENT1_MURATARDAONSU_20160702020('Property','Value',...) creates a new ASSIGNMENT1_MURATARDAONSU_20160702020 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Assignment1_MuratArdaONSU_20160702020_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Assignment1_MuratArdaONSU_20160702020_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Assignment1_MuratArdaONSU_20160702020

% Last Modified by GUIDE v2.5 10-Apr-2020 09:07:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Assignment1_MuratArdaONSU_20160702020_OpeningFcn, ...
                   'gui_OutputFcn',  @Assignment1_MuratArdaONSU_20160702020_OutputFcn, ...
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


% --- Executes just before Assignment1_MuratArdaONSU_20160702020 is made visible.
function Assignment1_MuratArdaONSU_20160702020_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Assignment1_MuratArdaONSU_20160702020 (see VARARGIN)

% Choose default command line output for Assignment1_MuratArdaONSU_20160702020
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global image
image = imread("lena.png");
global rightImage
global leftImage

global sigma
global filterSize
sigma = 1;          %random for now
filterSize = 1;	%random for now

rightImage = image;
axes(handles.axes1);
imshow(rightImage);
leftImage = image;
axes(handles.axes2);
imshow(leftImage);

% UIWAIT makes Assignment1_MuratArdaONSU_20160702020 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Assignment1_MuratArdaONSU_20160702020_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
global rightImage
set(handles.slider1, 'Value', 0);
set(handles.slider2, 'Value', 0);
rightImage = EdgeDetection(image);
axes(handles.axes1);
imshow(rightImage);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
global rightImage
set(handles.slider1, 'Value', 0);
set(handles.slider2, 'Value', 0);
axes(handles.axes1);
[histgogramImage,c,cmap] = HistogramImage(image);
rightImage = image;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rightImage
global image
set(handles.slider1, 'Value', 0);
set(handles.slider2, 'Value', 0);
rightImage = SharpenedImage(image);
axes(handles.axes1);
imshow(rightImage);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global image
global sigma
global filterSize
global rightImage

set(handles.slider1, 'Value', 0);
set(handles.slider2, 'Value', 0);

rightImage = GaussianImageDo(image,sigma,filterSize);
axes(handles.axes1);
imshow(rightImage);



function Sigma_Callback(hObject, eventdata, handles)
% hObject    handle to Sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Sigma as text
%        str2double(get(hObject,'String')) returns contents of Sigma as a double
global sigma
sigma = get(handles.Sigma,'String');
sigma = str2double(char(sigma));

% --- Executes during object creation, after setting all properties.
function Sigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FilterSize_Callback(hObject, eventdata, handles)
% hObject    handle to FilterSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FilterSize as text
%        str2double(get(hObject,'String')) returns contents of FilterSize as a double
global filterSize
filterSize = get(handles.FilterSize,'String');
filterSize = str2double(char(filterSize));

% --- Executes during object creation, after setting all properties.
function FilterSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FilterSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global rightImage
global image
global sliderImage
alfa = get(handles.slider1,'Value');
rightImage = BrightAnImage(rightImage,alfa);
axes(handles.axes1);
imshow(rightImage);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global rightImage
global image
global sliderImage
level = get(handles.slider2,'Value');
rightImage = ContrastAnImage(rightImage,level);
axes(handles.axes1);
imshow(rightImage);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
global rightImage
rightImage = image;
set(handles.slider1, 'Value', 0);
set(handles.slider2, 'Value', 0);
axes(handles.axes1);
imshow(image);
