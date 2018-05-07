# 此为在UESTC小黄车的模拟与调度问题。
## 作者：胡成伟 刘佳鑫 王欣洲（字母顺序），非商业用途转载请注明出处！如果用于商业用途请联系作者，违者将依法追究法律责任！
邮件：14366189@qq.com
说明：abandonnPoint.m将在UESTC范围内的点筛选出来，调用时只需将点的数据文件读入矩阵并传入函数即可，返回值就是在UESTC范围内的点。
decideClassIndex.m是决定所划分类的函数。
linearCoefficient.m用于求一次直线的参数，使用时传入两个点的坐标。
ofogetData.m用于得到各个点的类别，得到OFO的区域流动矩阵。
OFOsimulate.m用于模拟OFO变化情况。
testOFO.m用于简单画出点的分布。
roadprogramming.m用于解决调度规划问题。
abandonnPoint.m将去掉不属于所规定区域的点。
saveAbandonedPoint.m将不属于区域点的直接筛去，并将符合的点返回。
getMeanBias.m用于算出Flow矩阵的平均值，标准差，方差。
roadprogramming.m用于规划问题的仿真，此程序可以画出仿真得到的结果图，未进行规划时的需求图，进行规划后的车辆数目图等。
operateData.m用于处理得到的小黄数据，将数据排序，去掉重复点，并将两个时间点间的Flow矩阵和S（各区域数量）矩阵算出来。
