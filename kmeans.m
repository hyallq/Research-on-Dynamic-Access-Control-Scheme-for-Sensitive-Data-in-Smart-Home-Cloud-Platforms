% 你的数据
data = [0.0025, 0.9126, 0.0085, 0.1093, 1.0000, 0.7365, 0.8216, 0.0029, 0.8521, 0.6109];

% 将数据转换为二维数组，因为k-means需要处理多维数据
data = data.';

% 初始化聚类中心
C = data(randperm(size(data,1),2),:);

% 初始化旧的聚类中心
oldC = C;

while true
    % 将每个数据点分配到最近的聚类中心
    [~, idx] = min(pdist2(data,C,'euclidean'),[],2);
    
    % 更新聚类中心为每个类别的均值
    C = accumarray(idx, data, [], @mean);
    
    % 如果聚类中心没有改变，那么停止迭代
    if isequal(C, oldC)
        break;
    end
    
    oldC = C;
end

% 绘制数据点和聚类中心
figure;
scatter(data(:,1), zeros(1,size(data,2)), 'filled', 'MarkerFaceColor', 'b');
hold on;
scatter(C(:,1), zeros(1,size(C,2)), 'filled', 'MarkerFaceColor', 'r');
xlabel('Sensitivity');
title('K-Means Clustering of 10 Data Points');