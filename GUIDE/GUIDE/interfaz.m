function varargout = interfaz(varargin)
% INTERFAZ MATLAB code for interfaz.fig
%      INTERFAZ, by itself, creates a new INTERFAZ or raises the existing
%      singleton*.
%
%      H = INTERFAZ returns the handle to a new INTERFAZ or the handle to
%      the existing singleton*.
%
%      INTERFAZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZ.M with the given input arguments.
%
%      INTERFAZ('Property','Value',...) creates a new INTERFAZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfaz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfaz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfaz

% Last Modified by GUIDE v2.5 22-Aug-2021 14:35:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfaz_OpeningFcn, ...
                   'gui_OutputFcn',  @interfaz_OutputFcn, ...
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


% --- Executes just before interfaz is made visible.
function interfaz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfaz (see VARARGIN)

% Choose default command line output for interfaz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfaz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfaz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in comport.
function comport_Callback(hObject, eventdata, handles)
% hObject    handle to comport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns comport contents as cell array
%        contents{get(hObject,'Value')} returns selected item from comport


% --- Executes during object creation, after setting all properties.
function comport_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%seleccionar el comport
set(hObject, 'String', GetComPorts()); 


% --- Executes on selection change in baudrate.
function baudrate_Callback(hObject, eventdata, handles)
% hObject    handle to baudrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns baudrate contents as cell array
%        contents{get(hObject,'Value')} returns selected item from baudrate


% --- Executes during object creation, after setting all properties.
function baudrate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to baudrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Conectar.
function Conectar_Callback(hObject, eventdata, handles)
delete(instrfind({'Port'},{'COM5'}))
delete(instrfind({'Port'},{'COM4'}))

% hObject    handle to Conectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = get(handles.comport,'String'); 
com = contents{get(handles.comport,'Value')};

global baud;
global baud_indeks;
baud_indeks = handles.baudrate.Value;
baudrate_value();

% serial port configuration
global s;

s = serial('COM5','BaudRate',baud,'DataBits',8);
timeout = 1;
set(s,'Timeout',timeout);

if strcmp(get(s,'Status'),'closed') & ~strcmp(GetComPorts(),'')
fopen(s); % connect the device.
end
pause(0.2);
fprintf(s,'R'); 



%declarar variables
%Con=0;
%Fc=0;
%F=0;
%Dir=0;
%m=0;
%VL=0;
%Tm=0;
%value = fscanf(s,'%f %f %f %f %f %f %f'); %lectura de los datos enviados por el arduino
%Con=value(1);
%Fc=value(2);
%F=value(3);
%Dir=value(4);
%m=value(5);
%Vl=value(6);
%Tm=value(7);
%set(handles.Fc,'String',num2str(Fc));
%set(handles.F,'String',num2str(F));
%set(handles.Dir,'String',num2str(Dir));
%set(handles.m,'String',num2str(m));
%set(handles.Vl,'String',num2str(Vl));
%set(handles.Tm,'String',num2str(Tm));





% --- Executes on button press in Desconectar.
function Desconectar_Callback(hObject, eventdata, handles)
% hObject    handle to Desconectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;

if strcmp(get(s,'Status'),'open')
    fclose(s);  
end


% --- Executes on button press in Lectura.
function Lectura_Callback(hObject, eventdata, handles)
% hObject    handle to Lectura (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%pause(0.5);
%declarar variables
global s;

Con=0;
Fc=0;
F=0;
Dir=0;
m=0;
VL=0;
Tm=0;
%fprintf(s,'R');
pause(0.5);
value = fscanf(s,'%f %f %f %f %f %f %f'); %lectura de los datos enviados por el arduino
Con=value(1);
Fc=value(2);
F=value(3);
Dir=value(4);
m=value(5);
VL=value(6);
Tm=value(7);
assignin('base','Fc',Fc)
assignin('base','F',F)
assignin('base','Dir',Dir)
assignin('base','m',m)
assignin('base','VL',VL)
assignin('base','Tm',Tm)
set(handles.Fc,'String',num2str(Fc));
set(handles.F,'String',num2str(F));
set(handles.Dir,'String',num2str(Dir));
set(handles.m,'String',num2str(m));
set(handles.Vl,'String',num2str(VL));
set(handles.Tm,'String',num2str(Tm));

set_param('Gerardo_IoT','SimulationCommand','Start')
open_system('Gerardo_IoT/Scope1');
pause(10);
y=evalin('base','rpm')

str_f = sprintf('%0.2f',y)
s.Terminator='%'
fprintf(s,str_f)
pause(0.8)
