%=========================================================================================================
% Group No. - 4
% Written by - Ajay Kumar (ME13B1002), Chandan Sinha (ME13B1009), Pankaj Kumar (ME13B1027), Piyush
% Khodre (ME13B1029), Rahul Patel (ME13B1030)
%=========================================================================================================
clc;
clear all;

fv = stlread('femur.stl'); %change the name with your desired stl file
[f,v,n] = stlread('femur.stl'); %do the same here

%note down the min. and max. z values for the model from the output.
maxz = max(v(:,3)) 
minz = min(v(:,3))

z = input('Enter z height: ');
index = 1;

if(z > maxz | z < minz)
    warning('Provided height is out of the scope of the model');

else %solve the triangle (find the intersection point for each of the sides with the line z=h)
   for i=1:size(f)
       if(max(v(f(i,1),3),v(f(i,2),3) >= z) && min(v(f(i,1),3),v(f(i,2),3)<= z))
           m = (z-v(f(i,1),3))/((v(f(i,2),3)- v(f(i,1),3)));
           x(index) = v(f(i,1),1) + m*((v(f(i,2),1)- v(f(i,1),1)));
           y(index) = v(f(i,1),2) + m*((v(f(i,2),2)- v(f(i,1),2)));
           index = index+1;
       end
       if(max(v(f(i,2),3),v(f(i,3),3) >= z) && min(v(f(i,2),3),v(f(i,3),3)<= z))
           m = (z-v(f(i,2),3))/((v(f(i,3),3)- v(f(i,2),3)));
           x(index) = v(f(i,2),1) + m*((v(f(i,3),1)- v(f(i,2),1)));
           y(index) = v(f(i,2),2) + m*((v(f(i,3),2)- v(f(i,2),2)));
           index = index+1;
       end
       if(max(v(f(i,3),3),v(f(i,1),3) >= z) && min(v(f(i,3),3),v(f(i,3),3)<= z))
           m = (z-v(f(i,3),3))/((v(f(i,1),3)- v(f(i,3),3)));
           x(index) = v(f(i,3),1) + m*((v(f(i,1),1)- v(f(i,3),1)));
           y(index) = v(f(i,3),2) + m*((v(f(i,1),2)- v(f(i,3),2)));
           index = index+1;
       end
  end
   
X = x(isfinite(x)); %Exclude Inf and NaN values from the matrix while plotting
Y = y(isfinite(y));

% TRI = delaunay(X,Y);
% triplot(TRI,X,Y);
end
    