clear all
close all
warning off;

D = './neg';
S = dir(fullfile(D, '*.jpg'));

info_table = cell2table(cell(0, 4), 'VariableNames', {'File_name', 'WBC', 'RBC', 'Ratio'});

s=0;

for k=1:numel(S)
    F = fullfile(D, S(k).name);
    I = imread(F);
    
    [wbc, rbc] = countcells(I);
    d = (wbc/rbc);
    s= s + d;
    new_row = {S(k).name, wbc, rbc, d};
    info_table = [info_table; new_row];
end

avgr = s/k;
fprintf("Average ratio =\n");
disp(avgr);

new_row = {"Average",avgr, "", ""};
info_table = sortrows(info_table, 'Ratio');
info_table = [info_table; new_row];

writetable(info_table, 'negative.xls');