function[maxerr,connum]= interp(n)

f = @(x) 1./(1+25*x.^2);

coeff1=ones(n+1);
coeff=ones(1000,n+1);

v=linspace(-1,1,n+1);
w=linspace(-1,1,1000); 


    y=f(v);       %column of values of the function on interpolation points
    ye=f(w);
    
    for j=2:n+1
        coeff1(:,j)=coeff1(:,j-1)'.*v; %Vandermonde matrix 
    
        coeff(:,j)=coeff(:,j-1)'.*w; %Vandermonde matrix 
    end
    
    
    %B=coeff1\y';                               %column of unknowns                              
    A= coeff\ye';                          % coeff*A=ycolumn of the coefficients of the polynomial
    
    
    
    connum = cond(coeff);                     %condition number of V
    
    
    
 %be=coeff1*B; 
 pe=coeff*A;             %interpolation
 

 %plot(w,ye,v,y,'o');               % plot f(x) and mark nodes with 'o'.
%hold on
 %plot(w,pe);
 %hold off
 
 
maxerr = norm(ye-pe,Inf) ;           %maximum error

%close all; 
%plot(w,ye-pe);                     %plot
%grid on;
%plot(w,);
%title('Interpolation error')


%figure(10) 
%plot(1:1000, w)
%pause

end




    

