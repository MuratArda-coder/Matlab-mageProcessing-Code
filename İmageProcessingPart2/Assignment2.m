function varargout = Assignment2(varargin)
% ASSIGNMENT2 MATLAB code for Assignment2.fig
%      ASSIGNMENT2, by itself, creates a new ASSIGNMENT2 or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT2 returns the handle to a new ASSIGNMENT2 or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT2.M with the given input arguments.
%
%      ASSIGNMENT2('Property','Value',...) creates a new ASSIGNMENT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Assignment2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Assignment2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Assignment2

% Last Modified by GUIDE v2.5 23-Apr-2020 16:55:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Assignment2_OpeningFcn, ...
                   'gui_OutputFcn',  @Assignment2_OutputFcn, ...
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


% --- Executes just before Assignment2 is made visible.
function Assignment2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Assignment2 (see VARARGIN)

% Choose default command line output for Assignment2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global image;
global filter;
global filteredImage;
global low;
global N;
global Dimsize;
global filterPlot;
global m;
Dimsize = get(handles.SliderValue,'String');
Dimsize = str2double(char(Dimsize));
N=1.5;
low=1;
set(handles.Low, 'Value', 1);
set(handles.Ideal, 'Value', 1);

image = imread("lena.png");
[m,n,d] = size(image);
if(d>1)
    %To turn image the gray scale form
    image = rgb2gray(image);
end
image = im2double(image);
axes(handles.Originalimage);
imshow(image);

[filteredImage,filter] = filterI(image,Dimsize,low);
filterPlot = reshape(filter,m*m,1);

axes(handles.Filter2D);
imshow(filter);
axes(handles.FilteredImage);
imshow(filteredImage);
axes(handles.Filter1D);
plot(filterPlot,'k');

% --- Outputs from this function are returned to the command line.
function varargout = Assignment2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
global Dimsize;
Dimsize = get(handles.slider1,'Value');
set(handles.SliderValue, 'String', Dimsize);

global low;
global image;
global filter;
global filteredImage;
global N;
if(get(handles.Gauss, 'Value')==1)
    [filteredImage,filter] = filterG(image,Dimsize,low);
elseif(get(handles.Butterworth, 'Value')==1)
    [filteredImage,filter] = filterB(image,Dimsize,N,low);
elseif(get(handles.Ideal, 'Value')==1)
    [filteredImage,filter] = filterI(image,Dimsize,low);
end
axes(handles.Filter2D);
imshow(filter);
axes(handles.FilteredImage);
imshow(filteredImage);

global filterPlot;
global m;
filterPlot = reshape(filter,m*m,1);
axes(handles.Filter1D);
plot(filterPlot,'k');


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function SliderValue_Callback(hObject, eventdata, handles)
global Dimsize;
Dimsize = get(handles.SliderValue,'String');
Dimsize = str2double(char(Dimsize));
if(Dimsize>100.0 || Dimsize<1.0)
    set(handles.SliderValue, 'String', 50);
    set(handles.slider1, 'value', 50);
else
    set(handles.SliderValue, 'String', Dimsize);
    set(handles.slider1, 'value', Dimsize);
end
Dimsize = get(handles.SliderValue,'String');
Dimsize = str2double(char(Dimsize));
global low;
global image;
global filter;
global filteredImage;
global N;
if(get(handles.Gauss, 'Value')==1)
    [filteredImage,filter] = filterG(image,Dimsize,low);
elseif(get(handles.Butterworth, 'Value')==1)
    [filteredImage,filter] = filterB(image,Dimsize,N,low);
elseif(get(handles.Ideal, 'Value')==1)
    [filteredImage,filter] = filterI(image,Dimsize,low);
end
axes(handles.Filter2D);
imshow(filter);
axes(handles.FilteredImage);
imshow(filteredImage); 

global filterPlot;
global m;
filterPlot = reshape(filter,m*m,1);
axes(handles.Filter1D);
plot(filterPlot,'k');

% --- Executes during object creation, after setting all properties.
function SliderValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliderValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Low.
function Low_Callback(hObject, eventdata, handles)
set(handles.High, 'Value', 0);
global low;
global image;
global filter;
global filteredImage;
global N;
global Dimsize;
low=1;
if(get(handles.Gauss, 'Value')==1)
    [filteredImage,filter] = filterG(image,Dimsize,low);
elseif(get(handles.Butterworth, 'Value')==1)
    [filteredImage,filter] = filterB(image,Dimsize,N,low);
elseif(get(handles.Ideal, 'Value')==1)
    [filteredImage,filter] = filterI(image,Dimsize,low);
end
axes(handles.Filter2D);
imshow(filter);
axes(handles.FilteredImage);
imshow(filteredImage);

global filterPlot;
global m;
filterPlot = reshape(filter,m*m,1);
axes(handles.Filter1D);
plot(filterPlot,'k');

% --- Executes on button press in High.
function High_Callback(hObject, eventdata, handles)
set(handles.Low, 'Value', 0);
global low;
global image;
global filter;
global filteredImage;
global N;
global Dimsize;
low=0;
if(get(handles.Gauss, 'Value')==1)
    [filteredImage,filter] = filterG(image,Dimsize,low);
elseif(get(handles.Butterworth, 'Value')==1)
    [filteredImage,filter] = filterB(image,Dimsize,N,low);
elseif(get(handles.Ideal, 'Value')==1)
    [filteredImage,filter] = filterI(image,Dimsize,low);
end
axes(handles.Filter2D);
imshow(filter);
axes(handles.FilteredImage);
imshow(filteredImage);

global filterPlot;
global m;
filterPlot = reshape(filter,m*m,1);
axes(handles.Filter1D);
plot(filterPlot,'k');
   


% --- Executes on button press in Ideal.
function Ideal_Callback(hObject, eventdata, handles)
set(handles.Gauss, 'Value', 0);
set(handles.Butterworth, 'Value', 0); 

global image;
global filter;
global filteredImage;
global low;
global Dimsize;
[filteredImage,filter] = filterI(image,Dimsize,low);
axes(handles.Filter2D);
imshow(filter);
axes(handles.FilteredImage);
imshow(filteredImage);

global filterPlot;
global m;
filterPlot = reshape(filter,m*m,1);
axes(handles.Filter1D);
plot(filterPlot,'k');


% --- Executes on button press in Butterworth.
function Butterworth_Callback(hObject, eventdata, handles)
set(handles.Ideal, 'Value', 0);
set(handles.Gauss, 'Value', 0); 

global image;
global filter;
global filteredImage;
global low;
global N;
global Dimsize;
[filteredImage,filter] = filterB(image,Dimsize,N,low);
axes(handles.Filter2D);
imshow(filter);
axes(handles.FilteredImage);
imshow(filteredImage);

global filterPlot;
global m;
filterPlot = reshape(filter,m*m,1);
axes(handles.Filter1D);
plot(filterPlot,'k');


% --- Executes on button press in Gauss.
function Gauss_Callback(hObject, eventdata, handles)
set(handles.Ideal, 'Value', 0);
set(handles.Butterworth, 'Value', 0); 

global image;
global filter;
global filteredImage;
global low;
global Dimsize;
[filteredImage,filter] = filterG(image,Dimsize,low);
axes(handles.Filter2D);
imshow(filter);
axes(handles.FilteredImage);
imshow(filteredImage);

global filterPlot;
global m;
filterPlot = reshape(filter,m*m,1);
axes(handles.Filter1D);
plot(filterPlot,'k');
