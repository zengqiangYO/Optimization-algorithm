%主程序
function Main()
clc;format short;addpath public;
    
    %算法名称
    Algorithm = {'NSGA-II'};
    %测试问题
    Problem = {'ZDT1'};
    %问题维数
    Objectives =2;

    %程序运行

    Start(Algorithm,Problem,Objectives,1);

end