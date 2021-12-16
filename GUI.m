function varargout = GUI(varargin)
%GUI MATLAB code file for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('Property','Value',...) creates a new GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUI('CALLBACK') and GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 14-Nov-2021 18:26:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
q1=0; 
q2=0; 
q3=0;
q4=0;
q5=0;
q6=0;
q7=0;
L(1) = Link('revolute','alpha', 0,      'a', 0,   'd',305.83,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(2) = Link('revolute','alpha', -pi/2,  'a', -30,    'd',0,   'offset', 0,   'modified', 'qlim',[-143.5*pi/180 43.5*pi/180]);
L(3) = Link('revolute','alpha', pi/2,      'a', 30, 'd',251.52,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(4) = Link('revolute','alpha', -pi/2,      'a', 38.51, 'd',0,   'offset', -pi/2,   'modified', 'qlim',[-123.5*pi/180 80*pi/180]);
L(5) = Link('revolute','alpha', -pi/2,      'a', 42.37,   'd',267.01,   'offset', 0,   'modified', 'qlim',[-290*pi/180 290*pi/180]);
L(6) = Link('revolute','alpha', pi/2,      'a', -28.8,   'd',0,   'offset', 0,   'modified', 'qlim',[-88*pi/180 138*pi/180]);
L(7) = Link('revolute','alpha', -pi/2,      'a', 27.24,   'd',35.85,   'offset', 0,   'modified', 'qlim',[-229*pi/180 229*pi/180]);

q1=get(handles.slider1,'Value');
set(handles.text1,'String',q1);
q2=get(handles.slider2,'Value');
set(handles.text3,'String',q2);
q3=get(handles.slider3,'Value');
set(handles.text4,'String',q3);
q4=get(handles.slider4,'Value');
set(handles.text5,'String',q4);
q5=get(handles.slider5,'Value');
set(handles.text6,'String',q5);
q6=get(handles.slider6,'Value');
set(handles.text7,'String',q6);
q7=get(handles.slider7,'Value');
set(handles.text8,'String',q7);


R = SerialLink(L,'name','IRB 14050')
R.plot([q1 q2 q3 q4 q5 q6 q7],'workspace',[-50 50 -50 50 -50 50])
hold on
trplot(eye(4), 'width',2,'arrow')
axis([-1000 1000 -1000 1000 0 1000])
view([53.44 13.07])
hold off

Tef=R.fkine([q1 q2 q3 q4 q5 q6 q7])
x=Tef(1,4)
set(handles.text23,'String',x);
y=Tef(2,4)
set(handles.text24,'String',y);
z=Tef(3,4)
set(handles.text25,'String',z);

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
q1=0; 
q2=0; 
q3=0;
q4=0;
q5=0;
q6=0;
q7=0;
L(1) = Link('revolute','alpha', 0,      'a', 0,   'd',305.83,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(2) = Link('revolute','alpha', -pi/2,  'a', -30,    'd',0,   'offset', 0,   'modified', 'qlim',[-143.5*pi/180 43.5*pi/180]);
L(3) = Link('revolute','alpha', pi/2,      'a', 30, 'd',251.52,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(4) = Link('revolute','alpha', -pi/2,      'a', 38.51, 'd',0,   'offset', -pi/2,   'modified', 'qlim',[-123.5*pi/180 80*pi/180]);
L(5) = Link('revolute','alpha', -pi/2,      'a', 42.37,   'd',267.01,   'offset', 0,   'modified', 'qlim',[-290*pi/180 290*pi/180]);
L(6) = Link('revolute','alpha', pi/2,      'a', -28.8,   'd',0,   'offset', 0,   'modified', 'qlim',[-88*pi/180 138*pi/180]);
L(7) = Link('revolute','alpha', -pi/2,      'a', 27.24,   'd',35.85,   'offset', 0,   'modified', 'qlim',[-229*pi/180 229*pi/180]);

q1=get(handles.slider1,'Value');
set(handles.text1,'String',q1);
q2=get(handles.slider2,'Value');
set(handles.text3,'String',q2);
q3=get(handles.slider3,'Value');
set(handles.text4,'String',q3);
q4=get(handles.slider4,'Value');
set(handles.text5,'String',q4);
q5=get(handles.slider5,'Value');
set(handles.text6,'String',q5);
q6=get(handles.slider6,'Value');
set(handles.text7,'String',q6);
q7=get(handles.slider7,'Value');
set(handles.text8,'String',q7);


R = SerialLink(L,'name','IRB 14050')
R.plot([q1 q2 q3 q4 q5 q6 q7],'workspace',[-50 50 -50 50 -50 50])
hold on
trplot(eye(4), 'width',2,'arrow')
axis([-1000 1000 -1000 1000 0 1000])
view([53.44 13.07])
hold off

Tef=R.fkine([q1 q2 q3 q4 q5 q6 q7])
x=Tef(1,4)
set(handles.text23,'String',x);
y=Tef(2,4)
set(handles.text24,'String',y);
z=Tef(3,4)
set(handles.text25,'String',z);
% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
q1=0; 
q2=0; 
q3=0;
q4=0;
q5=0;
q6=0;
q7=0;
L(1) = Link('revolute','alpha', 0,      'a', 0,   'd',305.83,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(2) = Link('revolute','alpha', -pi/2,  'a', -30,    'd',0,   'offset', 0,   'modified', 'qlim',[-143.5*pi/180 43.5*pi/180]);
L(3) = Link('revolute','alpha', pi/2,      'a', 30, 'd',251.52,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(4) = Link('revolute','alpha', -pi/2,      'a', 38.51, 'd',0,   'offset', -pi/2,   'modified', 'qlim',[-123.5*pi/180 80*pi/180]);
L(5) = Link('revolute','alpha', -pi/2,      'a', 42.37,   'd',267.01,   'offset', 0,   'modified', 'qlim',[-290*pi/180 290*pi/180]);
L(6) = Link('revolute','alpha', pi/2,      'a', -28.8,   'd',0,   'offset', 0,   'modified', 'qlim',[-88*pi/180 138*pi/180]);
L(7) = Link('revolute','alpha', -pi/2,      'a', 27.24,   'd',35.85,   'offset', 0,   'modified', 'qlim',[-229*pi/180 229*pi/180]);

q1=get(handles.slider1,'Value');
set(handles.text1,'String',q1);
q2=get(handles.slider2,'Value');
set(handles.text3,'String',q2);
q3=get(handles.slider3,'Value');
set(handles.text4,'String',q3);
q4=get(handles.slider4,'Value');
set(handles.text5,'String',q4);
q5=get(handles.slider5,'Value');
set(handles.text6,'String',q5);
q6=get(handles.slider6,'Value');
set(handles.text7,'String',q6);
q7=get(handles.slider7,'Value');
set(handles.text8,'String',q7);


R = SerialLink(L,'name','IRB 14050')
R.plot([q1 q2 q3 q4 q5 q6 q7],'workspace',[-50 50 -50 50 -50 50])
hold on
trplot(eye(4), 'width',2,'arrow')
axis([-1000 1000 -1000 1000 0 1000])
view([53.44 13.07])
hold off

Tef=R.fkine([q1 q2 q3 q4 q5 q6 q7])
x=Tef(1,4)
set(handles.text23,'String',x);
y=Tef(2,4)
set(handles.text24,'String',y);
z=Tef(3,4)
set(handles.text25,'String',z);
% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
q1=0; 
q2=0; 
q3=0;
q4=0;
q5=0;
q6=0;
q7=0;
L(1) = Link('revolute','alpha', 0,      'a', 0,   'd',305.83,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(2) = Link('revolute','alpha', -pi/2,  'a', -30,    'd',0,   'offset', 0,   'modified', 'qlim',[-143.5*pi/180 43.5*pi/180]);
L(3) = Link('revolute','alpha', pi/2,      'a', 30, 'd',251.52,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(4) = Link('revolute','alpha', -pi/2,      'a', 38.51, 'd',0,   'offset', -pi/2,   'modified', 'qlim',[-123.5*pi/180 80*pi/180]);
L(5) = Link('revolute','alpha', -pi/2,      'a', 42.37,   'd',267.01,   'offset', 0,   'modified', 'qlim',[-290*pi/180 290*pi/180]);
L(6) = Link('revolute','alpha', pi/2,      'a', -28.8,   'd',0,   'offset', 0,   'modified', 'qlim',[-88*pi/180 138*pi/180]);
L(7) = Link('revolute','alpha', -pi/2,      'a', 27.24,   'd',35.85,   'offset', 0,   'modified', 'qlim',[-229*pi/180 229*pi/180]);

q1=get(handles.slider1,'Value');
set(handles.text1,'String',q1);
q2=get(handles.slider2,'Value');
set(handles.text3,'String',q2);
q3=get(handles.slider3,'Value');
set(handles.text4,'String',q3);
q4=get(handles.slider4,'Value');
set(handles.text5,'String',q4);
q5=get(handles.slider5,'Value');
set(handles.text6,'String',q5);
q6=get(handles.slider6,'Value');
set(handles.text7,'String',q6);
q7=get(handles.slider7,'Value');
set(handles.text8,'String',q7);


R = SerialLink(L,'name','IRB 14050')
R.plot([q1 q2 q3 q4 q5 q6 q7],'workspace',[-50 50 -50 50 -50 50])
hold on
trplot(eye(4), 'width',2,'arrow')
axis([-1000 1000 -1000 1000 0 1000])
view([53.44 13.07])
hold off

Tef=R.fkine([q1 q2 q3 q4 q5 q6 q7])
x=Tef(1,4)
set(handles.text23,'String',x);
y=Tef(2,4)
set(handles.text24,'String',y);
z=Tef(3,4)
set(handles.text25,'String',z);
% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
q1=0; 
q2=0; 
q3=0;
q4=0;
q5=0;
q6=0;
q7=0;
L(1) = Link('revolute','alpha', 0,      'a', 0,   'd',305.83,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(2) = Link('revolute','alpha', -pi/2,  'a', -30,    'd',0,   'offset', 0,   'modified', 'qlim',[-143.5*pi/180 43.5*pi/180]);
L(3) = Link('revolute','alpha', pi/2,      'a', 30, 'd',251.52,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(4) = Link('revolute','alpha', -pi/2,      'a', 38.51, 'd',0,   'offset', -pi/2,   'modified', 'qlim',[-123.5*pi/180 80*pi/180]);
L(5) = Link('revolute','alpha', -pi/2,      'a', 42.37,   'd',267.01,   'offset', 0,   'modified', 'qlim',[-290*pi/180 290*pi/180]);
L(6) = Link('revolute','alpha', pi/2,      'a', -28.8,   'd',0,   'offset', 0,   'modified', 'qlim',[-88*pi/180 138*pi/180]);
L(7) = Link('revolute','alpha', -pi/2,      'a', 27.24,   'd',35.85,   'offset', 0,   'modified', 'qlim',[-229*pi/180 229*pi/180]);

q1=get(handles.slider1,'Value');
set(handles.text1,'String',q1);
q2=get(handles.slider2,'Value');
set(handles.text3,'String',q2);
q3=get(handles.slider3,'Value');
set(handles.text4,'String',q3);
q4=get(handles.slider4,'Value');
set(handles.text5,'String',q4);
q5=get(handles.slider5,'Value');
set(handles.text6,'String',q5);
q6=get(handles.slider6,'Value');
set(handles.text7,'String',q6);
q7=get(handles.slider7,'Value');
set(handles.text8,'String',q7);


R = SerialLink(L,'name','IRB 14050')
R.plot([q1 q2 q3 q4 q5 q6 q7],'workspace',[-50 50 -50 50 -50 50])
hold on
trplot(eye(4), 'width',2,'arrow')
axis([-1000 1000 -1000 1000 0 1000])
view([53.44 13.07])
hold off

Tef=R.fkine([q1 q2 q3 q4 q5 q6 q7])
x=Tef(1,4)
set(handles.text23,'String',x);
y=Tef(2,4)
set(handles.text24,'String',y);
z=Tef(3,4)
set(handles.text25,'String',z);
% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
q1=0; 
q2=0; 
q3=0;
q4=0;
q5=0;
q6=0;
q7=0;
L(1) = Link('revolute','alpha', 0,      'a', 0,   'd',305.83,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(2) = Link('revolute','alpha', -pi/2,  'a', -30,    'd',0,   'offset', 0,   'modified', 'qlim',[-143.5*pi/180 43.5*pi/180]);
L(3) = Link('revolute','alpha', pi/2,      'a', 30, 'd',251.52,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(4) = Link('revolute','alpha', -pi/2,      'a', 38.51, 'd',0,   'offset', -pi/2,   'modified', 'qlim',[-123.5*pi/180 80*pi/180]);
L(5) = Link('revolute','alpha', -pi/2,      'a', 42.37,   'd',267.01,   'offset', 0,   'modified', 'qlim',[-290*pi/180 290*pi/180]);
L(6) = Link('revolute','alpha', pi/2,      'a', -28.8,   'd',0,   'offset', 0,   'modified', 'qlim',[-88*pi/180 138*pi/180]);
L(7) = Link('revolute','alpha', -pi/2,      'a', 27.24,   'd',35.85,   'offset', 0,   'modified', 'qlim',[-229*pi/180 229*pi/180]);

q1=get(handles.slider1,'Value');
set(handles.text1,'String',q1);
q2=get(handles.slider2,'Value');
set(handles.text3,'String',q2);
q3=get(handles.slider3,'Value');
set(handles.text4,'String',q3);
q4=get(handles.slider4,'Value');
set(handles.text5,'String',q4);
q5=get(handles.slider5,'Value');
set(handles.text6,'String',q5);
q6=get(handles.slider6,'Value');
set(handles.text7,'String',q6);
q7=get(handles.slider7,'Value');
set(handles.text8,'String',q7);


R = SerialLink(L,'name','IRB 14050')
R.plot([q1 q2 q3 q4 q5 q6 q7],'workspace',[-50 50 -50 50 -50 50])
hold on
trplot(eye(4), 'width',2,'arrow')
axis([-1000 1000 -1000 1000 0 1000])
view([53.44 13.07])
hold off

Tef=R.fkine([q1 q2 q3 q4 q5 q6 q7])
x=Tef(1,4)
set(handles.text23,'String',x);
y=Tef(2,4)
set(handles.text24,'String',y);
z=Tef(3,4)
set(handles.text25,'String',z);

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
q1=0; 
q2=0; 
q3=0;
q4=0;
q5=0;
q6=0;
q7=0;
L(1) = Link('revolute','alpha', 0,      'a', 0,   'd',305.83,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(2) = Link('revolute','alpha', -pi/2,  'a', -30,    'd',0,   'offset', 0,   'modified', 'qlim',[-143.5*pi/180 43.5*pi/180]);
L(3) = Link('revolute','alpha', pi/2,      'a', 30, 'd',251.52,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(4) = Link('revolute','alpha', -pi/2,      'a', 38.51, 'd',0,   'offset', -pi/2,   'modified', 'qlim',[-123.5*pi/180 80*pi/180]);
L(5) = Link('revolute','alpha', -pi/2,      'a', 42.37,   'd',267.01,   'offset', 0,   'modified', 'qlim',[-290*pi/180 290*pi/180]);
L(6) = Link('revolute','alpha', pi/2,      'a', -28.8,   'd',0,   'offset', 0,   'modified', 'qlim',[-88*pi/180 138*pi/180]);
L(7) = Link('revolute','alpha', -pi/2,      'a', 27.24,   'd',35.85,   'offset', 0,   'modified', 'qlim',[-229*pi/180 229*pi/180]);

q1=get(handles.slider1,'Value');
set(handles.text1,'String',q1);
q2=get(handles.slider2,'Value');
set(handles.text3,'String',q2);
q3=get(handles.slider3,'Value');
set(handles.text4,'String',q3);
q4=get(handles.slider4,'Value');
set(handles.text5,'String',q4);
q5=get(handles.slider5,'Value');
set(handles.text6,'String',q5);
q6=get(handles.slider6,'Value');
set(handles.text7,'String',q6);
q7=get(handles.slider7,'Value');
set(handles.text8,'String',q7);


R = SerialLink(L,'name','IRB 14050')
R.plot([q1 q2 q3 q4 q5 q6 q7],'workspace',[-50 50 -50 50 -50 50])
hold on
trplot(eye(4), 'width',2,'arrow')
axis([-1000 1000 -1000 1000 0 1000])
view([53.44 13.07])
hold off

Tef=R.fkine([q1 q2 q3 q4 q5 q6 q7])
x=Tef(1,4)
set(handles.text23,'String',x);
y=Tef(2,4)
set(handles.text24,'String',y);
z=Tef(3,4)
set(handles.text25,'String',z);

% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
