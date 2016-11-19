function varargout = AgroVisao(varargin)
% AGROVISAO MATLAB code for AgroVisao.fig
%      AGROVISAO, by itself, creates a new AGROVISAO or raises the existing
%      singleton*.
%
%      H = AGROVISAO returns the handle to a new AGROVISAO or the handle to
%      the existing singleton*.
%
%      AGROVISAO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AGROVISAO.M with the given input arguments.
%
%      AGROVISAO('Property','Value',...) creates a new AGROVISAO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AgroVisao_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AgroVisao_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AgroVisao

% Last Modified by GUIDE v2.5 19-Nov-2016 15:06:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AgroVisao_OpeningFcn, ...
                   'gui_OutputFcn',  @AgroVisao_OutputFcn, ...
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


% --- Executes just before AgroVisao is made visible.
function AgroVisao_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AgroVisao (see VARARGIN)

% Choose default command line output for AgroVisao
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AgroVisao wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AgroVisao_OutputFcn(hObject, eventdata, handles) 
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
global arq
global a
global gray

arq=uigetfile('*.*');
a=imread(arq);
axes(handles.axes1);
imshow(a);
gray=rgb2gray(a);
axes(handles.axes2);
imshow(gray);
axes(handles.axes4);
imhist(gray);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b=getframe(handles.axes2);
Image=frame2im(b);
FileName=uiputfile('*.*');
imwrite(Image,FileName, 'jpg');
b=getframe(handles.axes4);
Image=frame2im(b);
FileName=uiputfile('*.*');
imwrite(Image,FileName, 'jpg');



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1,'reset');
set(handles.axes1,'Visible','off');
cla(handles.axes2,'reset');
set(handles.axes2,'Visible','off');
cla(handles.axes3,'reset');
set(handles.axes3,'Visible','off');
cla(handles.axes4,'reset');
set(handles.axes4,'Visible',      'off');
cla(handles.axes5,'reset'); 
set(handles.axes5,'Visible','off');
set(handles.slider1,'Value',0);
set(handles.slider2,'Value',0);
set(handles.slider3,'Value',0);
global gray;



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c
axes(handles.axes1);
c=imcrop();
axes(handles.axes2);
imshow(c);



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global d
global gray
d=histeq(gray);
axes(handles.axes2);
imshow(d);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global d
axes(handles.axes5);
imhist(d);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f
global gray

f=adapthisteq(gray,'NumTiles',[6 6]);
axes(handles.axes2);
imshow(f);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine rangeof slider
global gray
global q

escala=get(handles.slider1,'Value');
set(handles.edit1,'String',escala);
q=imresize(gray,escala,'bilinear');
axes(handles.axes2);
imshow(q);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end        



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


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global gray
global r

angulo=get(handles.slider2,'Value');
set(handles.edit2,'String',angulo);
r=imrotate(gray,angulo,'bilinear');
axes(handles.axes2);
imshow(r);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global op
global gray
   v

switch op
    case 1 % Ajuste gamma
        gamma=get(handles.slider3,'Value');
        set(handles.edit3,'String',gamma);
        g=imadjust(gray,[],[],gamma);
        axes(handles.axes2);
        imshow(g);
      
        
    case 2 %Alargamento de Contraste
        e=get(handles.slider3,'Value');
        set(handles.edit3,'String', e);
        E=20*e;
        h=1./(1+(128./(double(gray) + eps)).^E);
        axes(handles.axes2);
        imshow(h);
        
        
    case 3 % Ajuste logaritimico
        i=im2uint8(mat2gray(log(1+ double(gray))));
        axes(handles.axes2);
        imshow(i);
        
    case 4 % Realce de Contraste
        h_sobel = fspecial('sobel');
        Im1_sh = imfilter(gray,h_sobel);
        Im1_sv = imfilter(gray,h_sobel'); 
        Im2_ss = abs(Im1_sh)+abs(Im1_sv);
        j = gray-Im2_ss;
        axes(handles.axes2);
        imshow(j);
       
    case 5 %limiarização
        level=get(handles.slider3,'Value');
        set(handles.edit3,'String', level);
        k=im2bw(gray,level);
        axes(handles.axes2);
        imshow(k);
        
end

        
  

% --- Ennnnnnnxecutes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns osition of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global op
global gray

op=get(handles.popupmenu1,'Value');

switch op
    case 1 % Ajuste gamma
        gamma=get(handles.slider3,'Value');
        set(handles.edit3,'String',gamma);
        g=imadjust(gray,[],[],gamma);
        axes(handles.axes2);
        imshow(g);
      
        
    case 2 %Alargamento de Contraste
        e=get(handles.slider3,'Value');
        E=20*e;
        set(handles.text1,'String', e);
        h=1./(1+(128./(double(gray) + eps)).^E);
        axes(handles.axes2);
        imshow(h);
        
    case 3 % Ajuste logaritimico
        i=im2uint8(mat2gray(log(1+ double(gray))));
        axes(handles.axes2);
        imshow(i);
        
    case 4 %Negativo
        j=imadjust(gray,[0 1],[1 0],1);
        axes(handles.axes2);
        imshow(j);
       
    case 5 %limiarização
        level=get(handles.slider3,'Value');
        set(handles.edit3,'String', level);
        k=im2bw(gray,level);
        axes(handles.axes2);
        imshow(k);
        
end


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
   
% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
global gray
gray=rgb2gray(a);
axes(handles.axes3);
imshow(gray);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(AgroVisao);
