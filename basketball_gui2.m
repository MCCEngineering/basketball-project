function varargout = basketball_gui2(varargin)
% BASKETBALL_GUI2 MATLAB code for basketball_gui2.fig
%      BASKETBALL_GUI2, by itself, creates a new BASKETBALL_GUI2 or raises the existing
%      singleton*.
%
%      H = BASKETBALL_GUI2 returns the handle to a new BASKETBALL_GUI2 or the handle to
%      the existing singleton*.
%
%      BASKETBALL_GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BASKETBALL_GUI2.M with the given input arguments.
%
%      BASKETBALL_GUI2('Property','Value',...) creates a new BASKETBALL_GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before basketball_gui2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to basketball_gui2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help basketball_gui2

% Last Modified by GUIDE v2.5 25-Oct-2018 16:32:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @basketball_gui2_OpeningFcn, ...
                   'gui_OutputFcn',  @basketball_gui2_OutputFcn, ...
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


% --- Executes just before basketball_gui2 is made visible.
function basketball_gui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to basketball_gui2 (see VARARGIN)
clc
target = 100 * rand + 50;
plot(target,0,'d','MarkerSize',10);
axis([0, target*1.25, 0, target*.35]);


% Choose default command line output for basketball_gui2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes basketball_gui2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = basketball_gui2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edtvelocity_Callback(hObject, eventdata, handles)
% hObject    handle to edtvelocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtvelocity as text
%        str2double(get(hObject,'String')) returns contents of edtvelocity as a double


% --- Executes during object creation, after setting all properties.
function edtvelocity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtvelocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edtangle_Callback(hObject, eventdata, handles)
% hObject    handle to edtangle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtangle as text
%        str2double(get(hObject,'String')) returns contents of edtangle as a double


% --- Executes during object creation, after setting all properties.
function edtangle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtangle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
velocity = str2num(get(handles.edtvelocity,'String'));
angle = str2num(get(handles.edtangle,'String')); % in degrees

% shoot the ball from above the origin toward a non-existent target
time = 0:.01:10000;
%x = x0 + v0x t + 1/2 ax t^2
x = 0 + velocity * cosd(angle) * time + 1/2 * 0 * time.^2;
% y = y0 + v0y t + 1/2 ay t^2
y = 0 + velocity * sind(angle) * time + 1/2 * (-9.81) * time.^2;
goodvalues = find(y>=0);
goodys = y(goodvalues);
goodxs = x(goodvalues);
hold on
comet(goodxs,goodys);

clc,clear