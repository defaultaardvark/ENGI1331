%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30-4
%Midterm 1

clc
clear

AllData = [0.8 1.3 1.0; 1.2 1.9 1.1; 1.1 2.5 0.3; 1.5 1.4 0.8; 0.4 0.8 0.7];
Span = [160 200 120];
Bridges = {'Bridge A', 'Bridge B', 'Bridge C'};
Days = {'Monday','Tuesday','Wednesday','Thursday','Friday'};

if length(Span) == length(AllData(1,:));
    Selection = menu('Bridge Selection', Bridges);
    if Selection > 0
        DefLimit = input('Input maximum acceptable deflection between 0 and 3 meters: ');
        if DefLimit < 0 || DefLimit > 3    
            warning('Outside allowed range. Assuming closest limit to input.');
            if DefLimit > 3
                DefLimit = 3;
            elseif DefLimit < 0
                DefLimit = 0;
            end
        else
        end
            Name = input('Name of person for whom this report is being prepared: ','s');
            title = 'Bridge Deflection Report';
            MaxDef = max(AllData(:,Selection));
            MinDef = min(AllData(:,Selection));
            AveDef = (sum(AllData(:,Selection)))/(length(AllData(:,Selection)));
            disp(title);
            fprintf('Prepared for %s\n\n',Name);
            fprintf('Bridge\t\tMaxDef\t\tMinDef\t\tAveDef\n');
            fprintf('%s\t%0.1f\t\t\t%0.1f\t\t\t%0.2f\n\n',Bridges{Selection},MaxDef,MinDef,AveDef);
            if MaxDef > DefLimit
                diff = MaxDef - DefLimit;
                fprintf('%s exceeds the given deflection limit by %0.1f meters.\n\n',Bridges{Selection},diff);
            else
            end
            DefPer = MaxDef./Span;
                mask = DefPer > .01;
                fprintf('There are currently %0.0f bridge(s) in need of attention.\n\n',sum(sum(mask)));
                [max_data col_max] = max(max(AllData));
                fprintf('%s has the highest overall deflection of %0.1f meters on %s.\n',Bridges{col_max},max(max(AllData)),Days{find(max_data == AllData(:,col_max))});
                AveDefAll = (sum(AllData'))/(length(AllData(1,:)));
                [mAvg_Def mAvg_col] = max(AveDefAll(1,:));
                fprintf('%s has the highest average deflection of %0.2f among all bridges.\n',Days{mAvg_col},mAvg_Def);
                FinalData = [AllData AveDefAll'; max([AllData AveDefAll'])];
                csvwrite('FinalData', FinalData);
    else
        error('No selection made. Terminating.');
    end
else
    error('Data input incorrectly. Terminating.');
end