function Handle = P_draw(FigureData,FigureFormat)
% 绘制出指定数据的图形
% 输入: FigureData,   待绘制的数据矩阵(即点的坐标集合)
%       FigureFormat, 图形的格式, 可省略
% 输出: Handle, 图形的句柄

    switch size(FigureData,2)
        case 2
            hold on;box on
            set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 13)
            if nargin < 2 || ~ischar(FigureFormat)
                Handle = plot(FigureData(:,1),FigureData(:,2),'ok','MarkerSize',6,'Marker','o','Markerfacecolor',[0 0 0]+0.7,'Markeredgecolor',[0 0 0]+0.4);
            else
                Handle = plot(FigureData(:,1),FigureData(:,2),FigureFormat);
            end
            axis tight
            xlabel('f_1')
            ylabel('f_2')
        case 3
            hold on;box on
            set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 13)
            if nargin < 2 || ~ischar(FigureFormat)
                Handle = plot3(FigureData(:,1),FigureData(:,2),FigureData(:,3),'ok','MarkerSize',8,'Marker','o','Markerfacecolor',[0 0 0]+0.7,'Markeredgecolor',[0 0 0]+0.4);
            else
                Handle = plot3(FigureData(:,1),FigureData(:,2),FigureData(:,3),FigureFormat);
            end
            axis tight
            xlabel('f_1')
            ylabel('f_2')
            zlabel('f_3')
            view(135,30)
        otherwise
            fprintf('结果不是2维或3维图形,无法绘制.\n')
            Handle = NaN;
    end
end

