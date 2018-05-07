function [VarName1,dnyR8B,VarName3,VarName4] = importfile(filename, startRow, endRow)
%IMPORTFILE 将文本文件中的数值数据作为列矢量导入。
%   [VARNAME1,DNYR8B,VARNAME3,VARNAME4] = IMPORTFILE(FILENAME) 读取文本文件
%   FILENAME 中默认选定范围的数据。
%
%   [VARNAME1,DNYR8B,VARNAME3,VARNAME4] = IMPORTFILE(FILENAME, STARTROW,
%   ENDROW) 读取文本文件 FILENAME 的 STARTROW 行到 ENDROW 行中的数据。
%
% Example:
%   [VarName1,dnyR8B,VarName3,VarName4] = importfile('20180419-161422-ofo.csv',1, 2106);
%
%    另请参阅 TEXTSCAN。

% 由 MATLAB 自动生成于 2018/04/20 14:44:43

%% 初始化变量。
delimiter = ',';
if nargin<=2
    startRow = 1;
    endRow = inf;
end

%% 每个文本行的格式:
%   列1: 文本 (%s)
%	列2: 文本 (%s)
%   列3: 双精度值 (%f)
%	列4: 双精度值 (%f)
% 有关详细信息，请参阅 TEXTSCAN 文档。
formatSpec = '%s%s%f%f%[^\n\r]';

%% 打开文本文件。
fileID = fopen(filename,'r');

%% 根据格式读取数据列。
% 该调用基于生成此代码所用的文件的结构。如果其他文件出现错误，请尝试通过导入工具重新生成代码。
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% 关闭文本文件。
fclose(fileID);

%% 对无法导入的数据进行的后处理。
% 在导入过程中未应用无法导入的数据的规则，因此不包括后处理代码。要生成适用于无法导入的数据的代码，请在文件中选择无法导入的元胞，然后重新生成脚本。

%% 将导入的数组分配给列变量名称
VarName1 = dataArray{:, 1};
dnyR8B = dataArray{:, 2};
VarName3 = dataArray{:, 3};
VarName4 = dataArray{:, 4};


