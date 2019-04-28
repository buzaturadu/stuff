#!/usr/bin/python

import sys
ip1 = sys.argv[0]
ip2 = sys.argv[1]

def binaryip1(ip1):
    octets = map(int, ip1.split('/')[0].split('.'))
    binary = '{0:08b}{1:08b}{2:08b}{3:08b}'.format(*octets)
    range = int(ip1.split('/')[1]) if '/' in ip1 else print('please add netmask value')
    return binary[:range]

def binaryip1f(ip1f):
    octets = map(int, ip1f.split('/')[0].split('.'))
    binary1 = '{0:08b}{1:08b}{2:08b}{3:08b}'.format(*octets)
    return binary1

def binaryip2(ip2):
    octets = map(int, ip2.split('/')[0].split('.'))
    binary = '{0:08b}{1:08b}{2:08b}{3:08b}'.format(*octets)
    range = int(ip2.split('/')[1]) if '/' in ip2 else print('please add netmask value')
    return binary[:range]

def binaryip2f(ip2):
    octets = map(int, ip2.split('/')[0].split('.'))
    binary2 = '{0:08b}{1:08b}{2:08b}{3:08b}'.format(*octets)
    return binary2

print(ip1, ' -- ', ip2)
print("<<-- " + str(binaryip1f(ip1).startswith(binaryip2(ip2))))
print("-->> " + str(binaryip2f(ip2).startswith(binaryip1(ip1))))
