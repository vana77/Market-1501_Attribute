%clear;
clear;
pp = '/home/yutian/re-id/dataset/market1501/bounding_box_test/*.jpg';
%% change ID-level attribute to instance-level attribute
load('market_attribute.mat');
file = dir(pp);
counter_data=1;
counter_last = 1;
class = 0;
c_last = '';
cc = [];
for i=1:length(file)
    c = strsplit(file(i).name,'_');
    if(~isequal(c{1},c_last))
        a = str2num(c{1});
        if a>0
            class = class + 1;
        end
        fprintf('%d::%d\n',class,counter_data-counter_last);
        cc=[cc;counter_data-counter_last];
        c_last = c{1};
        counter_last = counter_data;
    end
    if a>0
        dtupblack(counter_data) = market_attribute.test.upblack(class);
        dtupwhite(counter_data) = market_attribute.test.upwhite(class);
        dtupred(counter_data) = market_attribute.test.upred(class);
        dtuppurple(counter_data) = market_attribute.test.uppurple(class);
        dtupyellow(counter_data) = market_attribute.test.upyellow(class);
        dtupblue(counter_data) = market_attribute.test.upblue(class);
        dtupgreen(counter_data) = market_attribute.test.upgreen(class);
        dtupgray(counter_data) = market_attribute.test.upgray(class);

        dtdownblack(counter_data) = market_attribute.test.downblack(class);
        dtdownwhite(counter_data) = market_attribute.test.downwhite(class);
        dtdownpink(counter_data) = market_attribute.test.downpink(class);
        dtdownpurple(counter_data) = market_attribute.test.downpurple(class);
        dtdownyellow(counter_data) = market_attribute.test.downyellow(class);
        dtdownblue(counter_data) = market_attribute.test.downblue(class);
        dtdowngreen(counter_data) = market_attribute.test.downgreen(class);
        dtdowngray(counter_data) = market_attribute.test.downgray(class);
        dtdownbrown(counter_data) = market_attribute.test.downbrown(class);

        dtup(counter_data) = market_attribute.test.up(class);
        dtgender(counter_data) = market_attribute.test.gender(class);
        dtdown(counter_data) = market_attribute.test.down(class);
        dtclothes(counter_data) = market_attribute.test.clothes(class);
        dthat(counter_data) = market_attribute.test.hat(class);
        dtbackpack(counter_data) = market_attribute.test.backpack(class);
        dthandbag(counter_data) = market_attribute.test.handbag(class);
        dtbag(counter_data) = market_attribute.test.bag(class);
        dtage(counter_data) = market_attribute.test.age(class);
        dthair(counter_data) = market_attribute.test.hair(class);
        counter_data = counter_data + 1;
    end
end
%% evaluate
load('gallery_market.mat')
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


precision1 = temp1 /j
precision2 = temp2 /j
precision3 = temp3 /j
precision4 = temp4 /j
precision5 = temp5 /j
precision6 = temp6 /j
precision7 = temp7 /j
precision8 = temp8 /j
precision9 = temp9 /j
precision10 = temp10 /j
precision11 = temp11 /j
precision12 = temp12 /j
average = (precision1+precision2+precision3+precision4+precision5+precision6+precision7+precision8+precision9+precision10+precision11+precision12)/12
