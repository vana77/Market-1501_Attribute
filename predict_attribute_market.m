%clear;
netStruct = load('data/camera-ready/resnet_market_out/net-epoch-55.mat');
net = dagnn.DagNN.loadobj(netStruct.net);
net.mode = 'test' ;
net.move('gpu') ;
net.conserveMemory = false;
im_mean = net.meta(1).normalization.averageImage;
p = dir('/home/yutian/re-id/dataset/market1501/bounding_box_test/*.jpg');
uu = zeros(1,13115);
dd = zeros(1,13115);
gallery = zeros(13115,28);
u = zeros(1,8);
d = zeros(1,9);
for j = 6618:numel(p)
    i = j-6617;
    disp(i);
    str = strcat('/home/yutian/re-id/dataset/market1501/bounding_box_test/',p(j).name);
    oim = imresize(imread(str),[224,224]); 
    im = bsxfun(@minus,single(oim),im_mean);
    net.vars(net.getVarIndex('prediction_ha')).precious = true;
    net.eval({'data',gpuArray(im)}) ;
 
    scores = gather(net.vars(net.getVarIndex('prediction_g')).value);
    scores = squeeze(scores);
    [bestScore,bestLabel] = max(scores);
    gallery(i,1) = bestLabel;
    scores = gather(net.vars(net.getVarIndex('prediction_h')).value);
    scores = squeeze(scores);
    [bestScore,bestLabel] = max(scores);
    gallery(i,2) = bestLabel;
    scores = gather(net.vars(net.getVarIndex('prediction_a')).value);
    scores = squeeze(scores);
    [bestScore,bestLabel] = max(scores);
    gallery(i,3) = bestLabel;
    scores = gather(net.vars(net.getVarIndex('prediction_u')).value);
    scores = squeeze(scores);
    [bestScore,bestLabel] = max(scores);
    gallery(i,4) = bestLabel;
    scores = gather(net.vars(net.getVarIndex('prediction_d')).value);
    scores = squeeze(scores);
    [bestScore,bestLabel] = max(scores);
    gallery(i,5) = bestLabel;
    scores = gather(net.vars(net.getVarIndex('prediction_c')).value);
    scores = squeeze(scores);
    [bestScore,bestLabel] = max(scores);
    gallery(i,6) = bestLabel;
    scores = gather(net.vars(net.getVarIndex('prediction_ha')).value);
    scores = squeeze(scores);
    [bestScore,bestLabel] = max(scores);
    gallery(i,7) = bestLabel;
    scores = gather(net.vars(net.getVarIndex('prediction_bg1')).value);
    scores = squeeze(scores);
    [bestScore,bestLabel] = max(scores);
    gallery(i,8) = bestLabel;
    scores = gather(net.vars(net.getVarIndex('prediction_bg2')).value);
    scores = squeeze(scores);
    [bestScore,bestLabel] = max(scores);
    gallery(i,9) = bestLabel;
    scores = gather(net.vars(net.getVarIndex('prediction_bg3')).value);
    scores = squeeze(scores);
    [bestScore,bestLabel] = max(scores);
    gallery(i,10) = bestLabel;
                 
    scores = gather(net.vars(net.getVarIndex('prediction_ubla')).value);
    scores = squeeze(scores);
    u(1) = scores(1);
    scores = gather(net.vars(net.getVarIndex('prediction_uw')).value);
    scores = squeeze(scores);
    u(2) = scores(1);
    scores = gather(net.vars(net.getVarIndex('prediction_ur')).value);
    scores = squeeze(scores);
    u(3) = scores(1);
    scores = gather(net.vars(net.getVarIndex('prediction_up')).value);
    scores = squeeze(scores);
    u(4) = scores(1);
    scores = gather(net.vars(net.getVarIndex('prediction_ugra')).value);
    scores = squeeze(scores);
    u(5) = scores(1);
    scores = gather(net.vars(net.getVarIndex('prediction_ublu')).value);
    scores = squeeze(scores);
    u(6) = scores(1);
    scores = gather(net.vars(net.getVarIndex('prediction_ugre')).value);
    scores = squeeze(scores);
    u(7) = scores(1);
    scores = gather(net.vars(net.getVarIndex('prediction_uy')).value);
    scores = squeeze(scores);
    u(8) = scores(1);
       
    scores = gather(net.vars(net.getVarIndex('prediction_dbla')).value);
    scores = squeeze(scores);
    d(1) = scores(1);
    scores = gather(net.vars(net.getVarIndex('prediction_dw')).value);
    scores = squeeze(scores);
    d(2) = scores(1);
    scores = gather(net.vars(net.getVarIndex('prediction_dpi')).value);
    scores = squeeze(scores);
    d(3) = scores(1);
    scores = gather(net.vars(net.getVarIndex('prediction_dgra')).value);
    scores = squeeze(scores);
    d(4) = scores(1);
    scores = gather(net.vars(net.getVarIndex('prediction_dblu')).value);
    scores = squeeze(scores);
    d(5) = scores(1);
    scores = gather(net.vars(net.getVarIndex('prediction_dgre')).value);
    scores = squeeze(scores);
    d(6) = scores(1);
    scores = gather(net.vars(net.getVarIndex('prediction_dbro')).value);
    scores = squeeze(scores);
    d(7) = scores(1);
    scores = gather(net.vars(net.getVarIndex('prediction_dy')).value);
    scores = squeeze(scores);
    d(8) = scores(1);
    scores = gather(net.vars(net.getVarIndex('prediction_dp')).value);
    scores = squeeze(scores);
    d(9) = scores(1);
    [maxu,uu]=max(u);
    [maxd,dd]=max(d);
    gallery(i,11) = uu;
    gallery(i,12) = dd;
end

load('market_attribute.mat')
temp1 = 0;temp2 = 0;temp3 = 0;temp4 = 0;temp5 = 0;temp6 = 0;temp7 = 0;temp8 = 0;
temp9 = 0; temp10 = 0;temp11 = 0; temp12 = 0;
for j = 1:13115
    if (gallery(j,1)==dtgender(j))
        temp1 = temp1+1;
    end
    if (gallery(j,2)==dthair(j))
        temp3 = temp3+1;
    end
    if (gallery(j,3)==dtage(j))
        temp2 = temp2+1;
    end
    if (gallery(j,4)==dtup(j))
        temp4 = temp4+1;
    end
    if (gallery(j,5)==dtdown(j))
        temp5 = temp5+1;
    end
    if (gallery(j,6)==dtclothes(j))
        temp6 = temp6+1;
    end
    if (gallery(j,7)==dthat(j))
        temp10 = temp10+1;
    end
    if (gallery(j,8)==dtbackpack(j))
        temp7 = temp7+1;
    end
    if (gallery(j,9)==dtbag(j))
        temp9 = temp9+1;
    end
    if (gallery(j,10)==dthandbag(j))
        temp8 = temp8+1;
    end
    if(gallery(j,11)==1 && dtupblack(j)==2)
        temp11 = temp11+1;
    end
    if(gallery(j,11)==2 && dtupwhite(j)==2)
        temp11 = temp11+1;
    end
    if(gallery(j,11)==3 && dtupred(j)==2)
        temp11 = temp11+1;
    end
    if(gallery(j,11)==4 && dtuppurple(j)==2)
        temp11 = temp11+1;
    end
    if(gallery(j,11)==5 && dtupgray(j)==2)
        temp11 = temp11+1;
    end
    if(gallery(j,11)==6 && dtupblue(j)==2)
        temp11 = temp11+1;
    end
    if(gallery(j,11)==7 && dtupgreen(j)==2)
        temp11 = temp11+1;
    end
    if(gallery(j,11)==8 && dtupyellow(j)==2)
        temp11 = temp11+1;
    end
    if(gallery(j,12)==1 && dtdownblack(j)==2)
        temp12 = temp12+1;
    end
    if(gallery(j,12)==2 && dtdownwhite(j)==2)
        temp12 = temp12+1;
    end
    if(gallery(j,12)==3 && dtdownpink(j)==2)
        temp12 = temp12+1;
    end
    if(gallery(j,12)==4 && dtdowngray(j)==2)
        temp12 = temp12+1;
    end
    if(gallery(j,12)==5 && dtdownblue(j)==2)
        temp12 = temp12+1;
    end
    if(gallery(j,12)==6 && dtdowngreen(j)==2)
        temp12 = temp12+1;
    end
    if(gallery(j,12)==7 && dtdownbrown(j)==2)
        temp12 = temp12+1;
    end
    if(gallery(j,12)==8 && dtdownyellow(j)==2)
        temp12 = temp12+1;
    end
    if(gallery(j,12)==9 && dtdownpurple(j)==2)
        temp12 = temp12+1;
    end
end


precision1 = temp1 /i
precision2 = temp2 /i
precision3 = temp3 /i
precision4 = temp4 /i
precision5 = temp5 /i
precision6 = temp6 /i
precision7 = temp7 /i
precision8 = temp8 /i
precision9 = temp9 /i
precision10 = temp10 /i;
precision10 = 1-precision10
precision11 = temp11 /i
precision12 = temp12 /i
average = (precision1+precision2+precision3+precision4+precision5+precision6+precision7+precision8+precision9+precision10+precision11+precision12)/12