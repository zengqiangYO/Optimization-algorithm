function [FrontValue,NoF] = DSort (Population,operation)
% Deductive sort
global delta;
    if nargin<2
        kinds=1;
    elseif strcmp(operation,'half')
        kinds=2;
    elseif strcmp(operation,'first')
        kinds=3;
    else
        kinds=1;
    end
    
    [N,M] = size(Population);
    F = cell(N,1);
    NoF = 0;
    Sorted = zeros(1,N);
    while (kinds==1 && sum(Sorted)<N) || (kinds==2 && sum(Sorted)<N/2) || (kinds==3 && NoF<1)
        NoF = NoF + 1;
        D = Sorted;
        for i = 1 : N
            if D(i) == 0
                for j = i+1 : N
                    if D(j) == 0
                        x = 0;%x=0时i,j互不支配；x=1时i支配j；x=2时j支配i
                        for j2 = 1 : M
                            if Population(i,j2) < Population(j,j2)
                                if x == 2
                                    x = 0;
                                    break;
                                else
                                    x = 1;
                                end
                            elseif Population(i,j2) > Population(j,j2)
                                if x == 1
                                    x = 0;
                                    break;
                                else
                                    x = 2;
                                end
                            end
                        end
                        if x == 1
                            D(j) = 1;
                       elseif x == 2
                            D(i) = 1;
                            break;
                        end
                    end
                end
                if D(i) == 0
                    F{NoF} = [F{NoF},i];
                    Sorted(i) = 1;
                end
            end
        end
    end
    % convert 'F' to 'FrontValue' 
    FrontValue = zeros(1,N) + inf;
    if nargin>1 && strcmp(operation,'half')
        for i = 1:NoF
            if sum(FrontValue ~= inf) > N/2
                NoF = i - 1;
                break;
            else
                FrontValue(F{i})=i;
            end
        end
    else
        for i = 1:NoF
        	FrontValue(F{i})=i;
        end
    end
end



