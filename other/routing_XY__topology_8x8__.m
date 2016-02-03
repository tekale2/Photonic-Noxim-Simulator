% fname: routing_XY__topology_8x8__.m
% ../bin/noxim -routing XY -dimx 8 -dimy 8  -sim 10000 -warmup 2000 -size 8 8 -buffer 4 -config ../config_examples/default_config.yaml 

function [max_pir, max_throughput, min_delay] = routing_XY__topology_8x8__(symbol)

data = [
%             pir      avg_delay     throughput      max_delay   total_energy       rpackets         rflits
             0.01        23.8355       0.079166            181    9.48294e-06           5069          40533
             0.01        24.8778      0.0801777            126    9.51103e-06           5132          41051
             0.01         24.444      0.0803281            175    9.50578e-06           5135          41128
             0.01        23.5052      0.0788672            135     9.4827e-06           5044          40380
             0.01        23.5004      0.0797109            137    9.49673e-06           5100          40812
             0.01        24.1631      0.0795586            140    9.51306e-06           5090          40734
             0.01        24.0302      0.0807422            157    9.49946e-06           5166          41340
             0.01        24.1061      0.0798457            212    9.49606e-06           5109          40881
             0.01        23.6485      0.0780703            162    9.50092e-06           4996          39972
             0.01        24.4653      0.0780371            189    9.48503e-06           4995          39955
            0.011        26.1004      0.0860488            217    9.59261e-06           5508          44057
            0.011        26.5802      0.0895254            190    9.61931e-06           5731          45837
            0.011        26.1289      0.0873047            203     9.5883e-06           5585          44700
            0.011        27.4767      0.0891777            256    9.60833e-06           5706          45659
            0.011        27.2864      0.0890254            207    9.61776e-06           5695          45581
            0.011        27.1032      0.0892363            247     9.6183e-06           5709          45689
            0.011        26.7812      0.0893516            229    9.62285e-06           5718          45748
            0.011        26.6834       0.088127            219    9.62037e-06           5638          45121
            0.011        25.5161      0.0847793            173    9.57375e-06           5425          43407
            0.011         27.097      0.0862988            257    9.59694e-06           5523          44185
            0.012        28.9282      0.0942207            212    9.68557e-06           6031          48241
            0.012        31.8678      0.0975059            318     9.7318e-06           6240          49923
            0.012         28.376      0.0944727            217    9.69407e-06           6043          48370
            0.012         31.039      0.0968652            274    9.72311e-06           6200          49595
            0.012        28.9585      0.0940488            211    9.69637e-06           6019          48153
            0.012         28.931      0.0941289            167    9.69269e-06           6027          48194
            0.012        30.4005      0.0964785            228    9.72487e-06           6172          49397
            0.012        30.6938      0.0958105            264    9.69788e-06           6126          49055
            0.012        30.2627       0.095375            282    9.69187e-06           6103          48832
            0.012        29.5774      0.0944395            241    9.70341e-06           6044          48353
            0.013        32.5851       0.103912            259    9.82221e-06           6649          53203
            0.013        32.8585        0.10327            234    9.81906e-06           6609          52874
            0.013        35.1413       0.105867            272    9.84815e-06           6778          54204
            0.013        33.5889       0.104111            259    9.82555e-06           6663          53305
            0.013        33.2551       0.102506            312    9.80145e-06           6559          52483
            0.013        35.4162       0.105602            387    9.83245e-06           6757          54068
            0.013        34.2358       0.105174            282    9.83586e-06           6729          53849
            0.013        32.7245       0.103969            356    9.80536e-06           6653          53232
            0.013        33.5286       0.102318            257    9.80288e-06           6551          52387
            0.013        35.3983       0.101879            297    9.79168e-06           6521          52162
            0.014        38.7774       0.110873            358    9.89781e-06           7097          56767
            0.014        42.0433       0.111854            461    9.92422e-06           7163          57269
            0.014        37.4908       0.108574            326    9.88862e-06           6948          55590
            0.014        43.7034       0.114668            390    9.94827e-06           7340          58710
            0.014        41.0912        0.11067            419    9.90025e-06           7085          56663
            0.014        42.5491       0.113189            428    9.95027e-06           7244          57953
            0.014        37.1593       0.109947            263    9.91843e-06           7037          56293
            0.014        41.8864       0.112768            450    9.93173e-06           7216          57737
            0.014        47.5928       0.114518            472    9.93838e-06           7323          58633
            0.014        41.0636       0.112287            508    9.92633e-06           7187          57491
];

rows = size(data, 1);
cols = size(data, 2);

data_delay = [];
for i = 1:rows/10,
   ifirst = (i - 1) * 10 + 1;
   ilast  = ifirst + 10 - 1;
   tmp = data(ifirst:ilast, cols-6+1);
   avg = mean(tmp);
   [h sig ci] = ttest(tmp, 0.1);
   ci = (ci(2)-ci(1))/2;
   data_delay = [data_delay; data(ifirst, 1:cols-6), avg ci];
end

figure(1);
hold on;
plot(data_delay(:,1), data_delay(:,2), symbol);

data_throughput = [];
for i = 1:rows/10,
   ifirst = (i - 1) * 10 + 1;
   ilast  = ifirst + 10 - 1;
   tmp = data(ifirst:ilast, cols-6+2);
   avg = mean(tmp);
   [h sig ci] = ttest(tmp, 0.1);
   ci = (ci(2)-ci(1))/2;
   data_throughput = [data_throughput; data(ifirst, 1:cols-6), avg ci];
end

figure(2);
hold on;
plot(data_throughput(:,1), data_throughput(:,2), symbol);

data_maxdelay = [];
for i = 1:rows/10,
   ifirst = (i - 1) * 10 + 1;
   ilast  = ifirst + 10 - 1;
   tmp = data(ifirst:ilast, cols-6+3);
   avg = mean(tmp);
   [h sig ci] = ttest(tmp, 0.1);
   ci = (ci(2)-ci(1))/2;
   data_maxdelay = [data_maxdelay; data(ifirst, 1:cols-6), avg ci];
end

figure(3);
hold on;
plot(data_maxdelay(:,1), data_maxdelay(:,2), symbol);

data_totalenergy = [];
for i = 1:rows/10,
   ifirst = (i - 1) * 10 + 1;
   ilast  = ifirst + 10 - 1;
   tmp = data(ifirst:ilast, cols-6+4);
   avg = mean(tmp);
   [h sig ci] = ttest(tmp, 0.1);
   ci = (ci(2)-ci(1))/2;
   data_totalenergy = [data_totalenergy; data(ifirst, 1:cols-6), avg ci];
end

figure(4);
hold on;
plot(data_totalenergy(:,1), data_totalenergy(:,2), symbol);


%-------- Saturation Analysis -----------
slope=[];
for i=2:size(data_throughput,1),
    slope(i-1) = (data_throughput(i,2)-data_throughput(i-1,2))/(data_throughput(i,1)-data_throughput(i-1,1));
end

for i=2:size(slope,2),
    if slope(i) < (0.95*mean(slope(1:i)))
        max_pir = data_throughput(i, 1);
        max_throughput = data_throughput(i, 2);
        min_delay = data_delay(i, 2);
        break;
    end
end
