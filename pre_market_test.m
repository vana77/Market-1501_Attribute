clear;
pp = '/home/yutian/re-id/dataset/market1501/bounding_box_test/*.jpg';
load('market_attribute.mat');
upblack = market_attribute.test.upblack;
upwhite = market_attribute.test.upwhite;
upred = market_attribute.test.upred;
uppurple = market_attribute.test.uppurple;
upyellow = market_attribute.test.upyellow;
upgray = market_attribute.test.upgray;
upblue = market_attribute.test.upblue;
upgreen = market_attribute.test.upgreen;
downblack = market_attribute.test.downblack;
downwhite = market_attribute.test.downwhite;
downpurple = market_attribute.test.downpurple;
downyellow = market_attribute.test.downyellow;
downpink = market_attribute.test.downpink;
downgray = market_attribute.test.downgray;
downblue = market_attribute.test.downblue;
downgreen = market_attribute.test.downgreen;
downbrown = market_attribute.test.downbrown;

backpack = market_attribute.test.backpack;
handbag = market_attribute.test.handbag;
bag = market_attribute.test.bag;
gender = market_attribute.test.gender;
up = market_attribute.test.up;
down = market_attribute.test.down;
clothes = market_attribute.test.clothes;
hat = market_attribute.test.hat;
age = market_attribute.test.age;
hair = market_attribute.test.hair;
file = dir(pp);
counter_data=1;
counter_last = 1;
class = 0;
c_last = '';
cc = [];
m = zeros(1,1,3);
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
        dtupblack(counter_data) = upblack(class);
        dtupwhite(counter_data) = upwhite(class);
        dtupred(counter_data) = upred(class);
        dtuppurple(counter_data) = uppurple(class);
        dtupyellow(counter_data) = upyellow(class);
        dtupblue(counter_data) = upblue(class);
        dtupgreen(counter_data) = upgreen(class);
        dtupgray(counter_data) = upgray(class);

        dtdownblack(counter_data) = downblack(class);
        dtdownwhite(counter_data) = downwhite(class);
        dtdownpink(counter_data) = downpink(class);
        dtdownpurple(counter_data) = downpurple(class);
        dtdownyellow(counter_data) = downyellow(class);
        dtdownblue(counter_data) = downblue(class);
        dtdowngreen(counter_data) = downgreen(class);
        dtdowngray(counter_data) = downgray(class);
        dtdownbrown(counter_data) = downbrown(class);

        dtup(counter_data) = up(class);
        dtgender(counter_data) = gender(class);
        dtdown(counter_data) = down(class);
        dtclothes(counter_data) = clothes(class);
        dthat(counter_data) = hat(class);
        dtbackpack(counter_data) = backpack(class);
        dthandbag(counter_data) = handbag(class);
        dtbag(counter_data) = bag(class);
        dtage(counter_data) = age(class);
        dthair(counter_data) = hair(class);
        counter_data = counter_data + 1;
    end
end
