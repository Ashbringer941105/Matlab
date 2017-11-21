CT158 = xml_read('158.xml');
seriesinstanceuid = CT158.ResponseHeader.SeriesInstanceUid;
rs1 = CT158.readingSession(1);
rs2 = CT158.readingSession(2);
rs3 = CT158.readingSession(3);
rs4 = CT158.readingSession(4);

rs1_nodule = rs1.unblindedReadNodule;
rs2_nodule = rs2.unblindedReadNodule;
rs3_nodule = rs3.unblindedReadNodule;
rs4_nodule = rs4.unblindedReadNodule;
% see the number of elements in rsl_nodule

% print-->disp
% disp('the number of nodules in readingsession(1) is :');
% rs1_nm is the number of nodules in readingsession(1)
rs1_mn = numel(rs1_nodule);
% disp(rs1_mn);
% rs1_nodule1_roi_id = rs1_nodule(1).roi.imageSOP_UID;
% rs1_nodule1_roi_map = rs1_nodule(1).roi.edgeMap;
map_size = numel(CT158.readingSession(1).unblindedReadNodule(2).roi(1).edgeMap);
disp('mapsize is ');
disp(map_size);
arr = edgemap_2_arr(CT158.readingSession(1).unblindedReadNodule(2).roi(1).edgeMap);
name = [CT158.readingSession(1).unblindedReadNodule(2).roi(1).imageSOP_UID,'.jpg'];
pic = zeros(512,512);
for i=1:map_size
    x=arr(i,1);
    y=arr(i,2);
    pic(x,y) = 1;
end
imshow(pic);
imwrite(pic,name);





