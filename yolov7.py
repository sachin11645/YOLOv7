#!/usr/bin/env python
# coding: utf-8

# In[ ]:


# https://github.com/WongKinYiu/yolov7.git


# In[ ]:


cd yolov7


# In[ ]:


pip install -r requirements.txt


# In[ ]:


# change number of classes (cfg-training-yolo7.yaml)


# In[ ]:


get_ipython().system("python train.py --workers 8 --device 0 --batch-size 8 --data data/dataset.yaml --img 640 640 --cfg cfg/training/yolo7.yaml --weights 'yolov7_training.pt'  ")
--name yolov7-custom --hyp/data/hyp.scratch.custom.yaml --epoch 200


# In[ ]:


get_ipython().system('python detect.py --weights runs/train/yolov7-custom/weights/best.pt --img 416 --conf 0.25 --source runs/train/yolov7-custom/test1')

