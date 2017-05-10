
echo . entered bat file
set oscad="C:\Program Files\OpenSCAD\openscad.exe" 
set hr=%time:~0,2%
if "%hr:~0,1%" equ " " set hr=0%hr:~1,1%
set dt=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%hr%%time:~3,2%%time:~6,2%

%oscad% --o %~n1_inside_%dt%.stl  -D "part=\"inside\"" %1
%oscad% --o %~n1_outside_%dt%.stl  -D "part=\"outside\"" %1
