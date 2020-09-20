import numpy as np
import matplotlib.pyplot as plt
from matplotlib import cm
from random import randint
from matplotlib.colors import LinearSegmentedColormap
import itertools
import matplotlib.patches as mpatches
from matplotlib.collections import PatchCollection
import time
from progress.bar import IncrementalBar
import time


np.random.seed(180)

#function to select k nearest
def maxmincolor(r_,g_,b_):
    r=min(r_,1)
    g=min(g_,1)
    b=min(b_,1)
    r=max(0,r)
    g=max(0,g)
    b=max(0,b)
    return(r,g,b)


def klist(x1,y1,data):
    sort_list = [[0]*200 for _ in range(4)]
    #sort the array based on distance from x1,y1
    #sorted using quicksort algorithm
    for i in range(200):
        sort_list[0][i] = data[0][i]
        sort_list[1][i] = data[1][i]
        sort_list[2][i] = distance(x1,y1,data[0][i],data[1][i])
        sort_list[3][i] = i
    quicksort(sort_list[3],sort_list[0],sort_list[1],sort_list[2],0,199)
    KNN = [[0]*30 for _ in range(3)]
    for i in range(30):
        KNN[0][i] = sort_list[0][i]
        KNN[1][i] = sort_list[1][i]
        KNN[2][i] = sort_list[3][i]
    return KNN
    
def quicksort(Ac,A0,A1,A2,p,r):
    if p<r:
        q = partition(Ac,A0,A1,A2,p,r)
        quicksort(Ac,A0,A1,A2,p,q-1)
        quicksort(Ac,A0,A1,A2,q+1,r)
        
def partition(Ac,A0,A1,A2,p,r):
    x = A2[r]
    i = p-1
    for j in range(p,r):
        if A2[j]<=x:
            i = i+1
            tempA2 = A2[j]
            A2[j] = A2[i]
            A2[i] = tempA2
            tempA0 = A0[j]
            A0[j] = A0[i]
            A0[i] = tempA0
            tempA1 = A1[j]
            A1[j] = A1[i]
            A1[i] = tempA1
            tempAc = Ac[j]
            Ac[j] = Ac[i]
            Ac[i] = tempAc
    temp2 = A2[r]
    A2[r] = A2[i+1]
    A2[i+1]= temp2
    temp0 = A0[r]
    A0[r] = A0[i+1]
    A0[i+1]= temp0
    temp1 = A1[r]
    A1[r] = A1[i+1]
    A1[i+1]= temp1
    tempc = Ac[r]
    Ac[r] = Ac[i+1]
    Ac[i+1]= tempc
    return i+1
    
def distance(x1,y1,x2,y2):
    return np.sqrt((x2-x1)**2+(y2-y1)**2)

#-------generate a list of data labels-----------#
#each set represents a set of points and respective label f(g1,g2) = g3
#changing these functions is one way to change the pattern
g1=[]
g2=[]
for x in range(-25,25):
    g1.append(x/50*8)
    g2.append(np.random.normal(3.5,5))
g3 = [7.0]*50

a1=[]
a2=[]
for x in range(-25,25):
    a1.append(np.random.normal(1.5,5))
    a2.append(np.random.normal(1.5,5)) #random
a3 = [2.0]*50

e1=[]
e2=[]
for x in range(-25,25):
    e1.append(x/50*8)
    e2.append(2*np.sin(x*np.pi)+1.5) #sinusoidal function
e3 = [-1.0]*50

f1=[]
f2=[]
for x in range(-25,25):
    a1.append(np.random.normal(-1.5,4.5))
    a2.append(abs(np.random.normal(1.5,4)))
f3 = [1.0]*50


data=a1+e1+f1+g1,a2+e2+f2+g2,a3+e3+f3+g3
#data= a1+b1+c1+d1+e1+f1,a2+b2+c2+d2+e2+f2,a3+b3+c3+d3+e3+f3

X=[] #x-coordinates
Y=[] #y-coordinates
C=[]
p=0.

print("generating labels")
loading_bar1 = IncrementalBar(max = 90000)
for i in list(np.linspace(-40,40,300)):
    for j in list(np.linspace(-40,40,300)):
        X.append(i)
        Y.append(j)
        KNN = klist(i,j,data)
        for k in KNN[2]:
            p+= k/10000.
        C.append(p)
        p=0
        loading_bar1.next()
loading_bar1.finish()
#--------------------------------------------------#


#dictionary for colorscheme
#this is a method of coloring the points in matplotlib
#the dictionary represents the different RGB values
#for each label in the data
cdict3 = {'red':  ((0.0, 0.0, 1.0), #e.g. label 1 red ammount
                   (0.25, 0.1, 0.0),
                   (0.5, 0.8, 1.0),
                   (0.75, 1.0, 1.0),
                   (1.0, 0.4, 0.0)),

         'green': ((0.0, 1.0, 0.0), #e.g. label 1 green ammount
                   (0.3, 1.0, 1.0),
                   (0.7, 0.4, 0.4),
                   (0.9, 0.7, 1.7),
                   (1.0, 0.0, 1.0)),

         'blue':  ((0.0, 0.0, 0.4), #e.g. label 1 blue ammount
                   (0.25, 1.0, 1.0),
                   (0.5, 0.0, 0.8),
                   (0.75, 1.0, 0.0),
                   (1.0, 1.0, 0.0))
        }

#the name for the colorscheme created above
#call this color scheme when plotting the points to use the above colors
blue_red1 = LinearSegmentedColormap('BlueRed1', cdict3)

fig = plt.figure(figsize=(6, 6), dpi=150)
plt.axis('off')
ax = plt.axes()

#for if you want to plot the know values
#another coloring method is to call a color scheme known to matplotlib
fig.patch.set_facecolor('xkcd:salmon')
ax.set_facecolor('xkcd:salmon')
ax.set_facecolor((1.0, 0.47, 0.42))
#ax.scatter(data[0], data[1], c=data[2], cmap='tab20b',s=1)

#editing the decision threshold will change the colors.
adjustrate=2
markersize=0.5
#ax.scatter(X, Y, c=X, cmap='magma',s=30, marker=(6,0,30));
print("labeling unkown data")
loading_bar = IncrementalBar(max = 90000)
for i in range(len(X)):
    #The final part of coloring is to "smear the colors"
    #I edit the values of the colors based on the classification.
    r1,g1,b1=maxmincolor(0.8*adjustrate*C[i]+.3,0.91*adjustrate*C[i]+.1,0.95*adjustrate*C[i]+.1)    
    r2,g2,b2=maxmincolor(0.8*adjustrate*C[i]+.3,0.92*adjustrate*C[i]-.3,0.93*adjustrate*C[i]-.1)
    r3,g3,b3=maxmincolor(0.8*adjustrate*C[i]-.1,0.96*adjustrate*C[i]+.1,0.97*adjustrate*C[i]+.1)


    #here, I color the points according to their label using conditions and he color scheme immediately above.
    if C[i]>0.0 and C[i]<=0.2:
        ax.plot(X[i],Y[i], color=(r1,g1,b1),markersize=markersize, marker='o',fillstyle='full', clip_on=False)
        ax.plot(X[i],-Y[i], color=(r1,g1,b1),markersize=markersize, marker='o',fillstyle='full', clip_on=False)
    elif C[i]>=0.2 and C[i]<=0.24:
        ax.plot(X[i],Y[i], color=((r2+r1)/2,(g2+g1)/2,(b2+b1)/2),markersize=markersize, marker='o',fillstyle='full', clip_on=False)
        ax.plot(X[i],-Y[i], color=((r2+r1)/2,(g2+g1)/2,(b2+b1)/2),markersize=markersize, marker='o',fillstyle='full', clip_on=False)
 
    
    elif C[i]>0.24 and C[i]<0.31:
        ax.plot(X[i],Y[i], color=(r2,g2,b2),markersize=markersize, marker='o',fillstyle='full', clip_on=False)
        ax.plot(X[i],-Y[i], color=(r2,g2,b2),markersize=markersize, marker='o',fillstyle='full', clip_on=False)
    elif C[i]>=0.31 and C[i]<=0.35:
        ax.plot(X[i],Y[i], color=((r2+r3)/2,(g2+g3)/2,(b2+b3)/2),markersize=markersize, marker='o',fillstyle='full', clip_on=False)
        ax.plot(X[i],-Y[i], color=((r2+r3)/2,(g2+g3)/2,(b2+b3)/2),markersize=markersize, marker='o',fillstyle='full', clip_on=False)
    elif C[i]>0.35:
        ax.plot(X[i],Y[i]*np.sin(i*np.pi/100), color=(r3,g3,b3),markersize=markersize, marker='o',fillstyle='full', clip_on=False)
        ax.plot(X[i],-Y[i], color=(r3,g3,b3),markersize=markersize, marker='o',fillstyle='full', clip_on=False)
    loading_bar.next()

loading_bar.finish()
fig.savefig('KNearestNeighbor.png')
#ax.scatter(0.4, 0.2, c='green',s=40)
#KNN = klist(0.4,0.2,data)
#ax.scatter(KNN[0], KNN[1], c='black',s=20)
