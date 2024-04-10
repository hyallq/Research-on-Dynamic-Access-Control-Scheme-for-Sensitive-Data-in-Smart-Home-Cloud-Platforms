import csv
from apyori import apriori


# 加载数据集
def load_data(data):
    transactions = []
    with open(filename, 'r', encoding='utf-8') as file:
        reader = csv.reader(file)
        for row in reader:
            transactions.append(row)
    return transactions


# 执行 Apriori 算法
def run_apriori(transactions, min_support=0.5, min_confidence=0.5):
    rules = apriori(transactions, min_support=min_support, min_confidence=min_confidence)
    return list(rules)


if __name__ == '__main__':
    filename = 'dataset.csv'
    # 加载数据集
    transactions = load_data(filename)
    # 执行 Apriori 算法
    rules = run_apriori(transactions)
    # 打印结果
    for item in rules:
        print(item)
