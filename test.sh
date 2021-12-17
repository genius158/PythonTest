#!/usr/bin/python

import time
import os
import re as Regx

import urllib2
import urllib

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


def main():
    test = Test()
    test.test("sdf")
#    Test.test("2222")



main()