#!/usr/bin/python

import time
import os
import re as Regx

import urllib2
import urllib

import zipfile
import sys

# class
class Test:
      @staticmethod
      def test(ori):
          print("time {t}".format(t = time.time()  ))
#          print("test {ori}".format(ori = ori))
          for i in range(5):
              print("test {ori} - {i}".format(ori = str(ori),i = i))
          print "test - ",i
          print "test -- "+str(i)

#         if else
          tag = 1
          if tag == 1:
               print '1111111'
          elif tag == 2:
               print '2222222'
          else:
               print 'eslse else'


#         try catch
          try:
              line_num = 10
              f = open("test.sh")
              for i in range(int(line_num)):
                  if i > 2:
                      break
              time.sleep(0.1)
              print(f.readline())

          except IOError:
               print("IOError IOError")
          else:
              print "Ok Ok Ok"
          finally:
              f.close()
              print "finally"


#         Regx
          rexArr = Regx.split('\W+', 'aaaaa  bbbbb, cccccc.')
          for rex in rexArr:
              print "["+rex+"]"

          line = "https://yanxianwei1114@gmail.com";
          matchObj = Regx.match( r'^(http)?.+@.+com$', line, Regx.M|Regx.I)
          if matchObj:
             print "match --> matchObj.group() : ", matchObj.group()
          else:
             print "No match!!"


#         net
          url = "https://badidu.com"
          req = urllib2.Request(url)
          f = urllib2.urlopen(req)
          content = f.read()
          print "net ",content


#         zip
          if not os.path.exists("tmp"):
              os.makedirs(path)
          f = zipfile.ZipFile("tmp/target.zip", 'w', zipfile.ZIP_DEFLATED)
          f.write("test.sh")
          f.close()

          f = zipfile.ZipFile("tmp/target.zip",'r')
          for file in f.namelist():
              f.extract(file,"tmp/sh/")


#         [date modify txt](https://www.cnblogs.com/wc-chan/p/8085452.html)
          def check(rex,txt):
              matchObj = Regx.match(rex, txt, Regx.M|Regx.I)
              return matchObj

          def modify(file,strRex,txt):
              """
              world replace, delete original, bak file raname to original file name
              :param file: original file path
              :param target: world need to repalce
              :param txt: new string
              :return: None
              """
              with open(file, "r") as f1,open("%s.bak" % file, "w") as f2:
                  for line in f1:
                      rex = strRex
                      match = check(rex,line)
                      if match:
                          print(rex +"  " + line)
                          line = line.replace(match.group(),txt)
                      f2.write(line)
              os.remove(file)
              os.rename("%s.bak" % file, file)

         # [cur time than format](https://www.cnblogs.com/komean/p/10603518.html)
          curTime = time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
          modify("test.sh", "^# Modify Time : .+", "# Modify Time : "+curTime)

def main(argv):

    length = len(argv)
    print 'args count:', length
    print 'args:', str(argv)

    if length > 1:
         print 'args[0]: ', argv[1]

    test = Test()
    test.test("sdf")
#    Test.test("2222")



main(sys.argv)


# Modify Time : 2022-01-07 15:56:03
