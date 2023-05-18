# -*- coding: utf-8 -*-
import sys
import os
import os.path
import numpy as np
import subprocess
# from matplotlib.mlab import griddata
from scipy.interpolate import interp1d

def handle_file(name):

    en = [0, 0, 0, 0, 0, 0, 0, 0]
    langs = [en.copy(), en.copy(), en.copy(), en.copy()]
    langs[0][0] = '16';     langs[0][1] = 'lv';
    langs[1][0] = '20';     langs[1][1] = 'ru';
    langs[2][0] = '0.0001'; langs[2][1] = 'et';
    langs[3][0] = '200';    langs[3][1] = 'lt';
    first_line = ''


    for run_number in range(1,5):
        in_file = open(str(run_number)+name)
        for i,line in enumerate(in_file):
            arr = line.split(',')
            # print(i, arr)
            if i==0:
                first_line = line
            if i==1:
                en[0] = 'bert-base-multilingual-cased'; en[1] = 'en'; en[2] = ''; en[4] = ''; en[6] = ''; 
                en[3] += float(arr[3]); en[5] += float(arr[5]); en[7] += float(arr[7].strip('\n'));
            if i>=2:
                for j in range(2,7):
                    langs[i-2][j] += float(arr[j])
                langs[i-2][7] += float(arr[7].strip('\n'))

    # print('\n\n')
    # print(first_line)
    # print(en)
    # print(langs[0])
    # print(langs[1])
    # print(langs[2])
    # print(langs[3])

    en[3] /= 4; en[5] /= 4; en[7] /= 4;
    for L in range(4):
        for i in range(2,8):
            langs[L][i] /= 4
       
    with open('AVERAGE'+name, 'w') as out_file:
        out_file.write(first_line)
        for i in range(7):
            out_file.write(str(en[i])+',')
        out_file.write(str(en[7])+'\n')
        for L in range(4):
            for i in range(7):
                out_file.write(str(langs[L][i])+',')
            out_file.write(str(langs[L][7])+'\n')
        
        
handle_file('_askubuntu_bert-base-multilingual-cased_results.csv')
handle_file('_askubuntu_xlm-roberta-base_results.csv')
handle_file('_chatbot_bert-base-multilingual-cased_results.csv')
handle_file('_chatbot_xlm-roberta-base_results.csv')
handle_file('_webapps_bert-base-multilingual-cased_results.csv')
handle_file('_webapps_xlm-roberta-base_results.csv')

