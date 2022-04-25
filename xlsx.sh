#coding=utf-8
#!/usr/bin/python

import os
import re as Regx

import sys

# 直接cmd:  pip  install openpyxl
from openpyxl import Workbook
from openpyxl import load_workbook

# class
class Test:
    @staticmethod
    def do_execute(fileNames,targetFileName):
        print "do_execute--","fileName:",fileNames,"targetFileName:",targetFileName

        try:
            twb = load_workbook(targetFileName)
        except IOError:
            twb = Workbook()

        length = len(fileNames)
        for i in range(length):
            fileName = fileNames[i]

            xlsxName = fileName
            xlsxName = Regx.sub(r'.+/','',xlsxName)
            xlsxName = Regx.sub(r'\..+','',xlsxName)

            try:
                ws = twb[xlsxName.decode('UTF-8')]
            except UnicodeEncodeError:
                ws = twb.create_sheet(xlsxName.decode('UTF-8'), i,)


            # 入睡困难和睡眠维持障碍
            # 睡眠呼吸障碍
            # 睡觉障碍
            # 睡觉觉醒转换障碍
            # 过渡嗜睡
            # 夜间多汗
            ws.cell(2,1).value = '入睡困难和睡眠维持障碍'
            ws.cell(3,1).value = '睡眠呼吸障碍'
            ws.cell(4,1).value = '睡觉障碍'
            ws.cell(5,1).value = '睡觉觉醒转换障碍'
            ws.cell(6,1).value = '过渡嗜睡'
            ws.cell(7,1).value = '夜间多汗'

            #2018年	2020年	2022年
            ws.cell(1,2).value = '2018年'
            ws.cell(1,3).value = '2020年'
            ws.cell(1,4).value = '2022年'


            # 读取对应的数据，写入sheet
            lw = load_workbook(fileName)
            sheets = lw.worksheets   # 获取当前所有的sheet
           
            # 获取第一张sheet
            sheet1 = sheets[0]
            print "来自",fileName,sheet1

            # xlsx指定一列，各行数据相加
            def cellRowSum(rows,column):
                rowSize = len(rows)
                res = 0
                for i in range(rowSize):
                    res += sheet1.cell(rows[i],column).value
                return res

            # 2018年
            ws['B2'].value = cellRowSum([2,3,4,5,6,11,12],3)
#            ws.cell(2,2).value = cellRowSum([2,3,4,5,6,11,12],3)
            ws.cell(3,2).value = cellRowSum([14,15,16],3)
            ws.cell(4,2).value = cellRowSum([18,21,22],3)
            ws.cell(5,2).value = cellRowSum([7,8,9,13,19,20],3)
            ws.cell(6,2).value = cellRowSum([23,24,25,26,27],3)
            ws.cell(7,2).value = cellRowSum([10,16],3)

            # 2020年
            ws.cell(2,3).value = cellRowSum([2,3,4,5,6,11,12],4)
            ws.cell(3,3).value = cellRowSum([14,15,16],4)
            ws.cell(4,3).value = cellRowSum([18,21,22],4)
            ws.cell(5,3).value = cellRowSum([7,8,9,13,19,20],4)
            ws.cell(6,3).value = cellRowSum([23,24,25,26,27],4)
            ws.cell(7,3).value = cellRowSum([10,16],4)

            # 2022年
            ws.cell(2,4).value = cellRowSum([2,3,4,5,6,11,12],5)
            ws.cell(3,4).value = cellRowSum([14,15,16],5)
            ws.cell(4,4).value = cellRowSum([18,21,22],5)
            ws.cell(5,4).value = cellRowSum([7,8,9,13,19,20],5)
            ws.cell(6,4).value = cellRowSum([23,24,25,26,27],5)
            ws.cell(7,4).value = cellRowSum([10,16],5)

        twb.save(targetFileName)


def main(argv):

    length = len(argv)
    print 'args count:', length
    print 'args:', str(argv)

    if length > 1:
        fileName = argv[1]
        fileNames = []
        for i in range(length):
            if i >= length-2:
                break
            fileNames.append(argv[i+1])

        targetFileName = argv[length-1]

    test = Test()
    test.do_execute(fileNames,targetFileName)


main(sys.argv)