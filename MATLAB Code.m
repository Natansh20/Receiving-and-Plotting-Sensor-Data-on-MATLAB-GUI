function varargout = DD_project(varargin)
% DD_PROJECT MATLAB code for DD_project.fig
%      DD_PROJECT, by itself, creates a new DD_PROJECT or raises the existing
%      singleton*.
%
%      H = DD_PROJECT returns the handle to a new DD_PROJECT or the handle to
%      the existing singleton*.
%
%      DD_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DD_PROJECT.M with the given input arguments.
%
%      DD_PROJECT('Property','Value',...) creates a new DD_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DD_project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DD_project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DD_project

% Last Modified by GUIDE v2.5 11-Nov-2021 18:56:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DD_project_OpeningFcn, ...
                   'gui_OutputFcn',  @DD_project_OutputFcn, ...
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


% --- Executes just before DD_project is made visible.
function DD_project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DD_project (see VARARGIN)

% Choose default command line output for DD_project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DD_project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DD_project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function start_Callback(hObject, eventdata, handles)
global arduino
 if ~isempty(instrfind)
     fclose(instrfind);
      delete(instrfind);
 end
arduino=serial('COM4');
fopen(arduino);


% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function stop_Callback(hObject, eventdata, handles)
global arduino
fclose(arduino);

function plot_Callback(hObject, eventdata, handles)
global arduino
x=0;

for k=1:1:1500
    y=fscanf(arduino);
    y=str2num(y);
    x=[x,y];
    plot(x,'Linewidth',2);
    axis([0 1500 0 1500]);
    pause(0.01);
end

