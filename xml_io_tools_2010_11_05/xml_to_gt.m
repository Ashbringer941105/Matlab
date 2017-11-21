% 1.read xml
xml_158 = xml_read('158.xml');
out_put_path = '/home/song/LIDC-XML/xml_io_tools_2010_11_05/158/';
count = 0;
% disp('xml has read in')
% 2. header read in 
seriesinstanceuid = xml_158.ResponseHeader.SeriesInstanceUid;
% 3. for in readingsession
readingsession_number = numel(xml_158.readingSession);
% disp(readingsession_number); ---test ok
for i=1:readingsession_number  %i is the readingsession 
    unblindedReadNodule_number = numel(xml_158.readingSession(i).unblindedReadNodule);
   % fprintf('the number of unblindedReadNodules in readingsession %d,is %d \n',i,unblindedReadNodule_number);
    for j=1:unblindedReadNodule_number
        roi_number = numel(xml_158.readingSession(i).unblindedReadNodule(j).roi);
        for k=1:roi_number
            imageSOP_UID = xml_158.readingSession(i).unblindedReadNodule(j).roi(k).imageSOP_UID;
            count = count +1;
            if count<10
                pic_name = [out_put_path,imageSOP_UID,'0',num2str(count),'.jpg'];
            else
                pic_name = [out_put_path,imageSOP_UID,num2str(count),'.jpg'];
            end
            arr = edgemap_2_arr(xml_158.readingSession(i).unblindedReadNodule(j).roi(k).edgeMap);
            map_size = numel(arr)/2;
            pic = zeros(512,512);
            
            for l=1:map_size
                x=arr(l,1);
                y=arr(l,2);
                pic(x,y) = 1;
            end
            imshow(pic);
            imwrite(pic,pic_name);
            fprintf('%s is saved \n',pic_name);
            
        end
        
    end
    
end
fprintf('the number of image is %d \n',count);