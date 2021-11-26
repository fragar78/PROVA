

%Numero di step in cui salvare la soluzione, campionamento della
%soluzione approssimata
N=50;
%vettore tempo totale
tspan = linspace(0,1,N);
%NUmero di intervalli in cui suddividere l'intefvallo [t,t+Dt] per
%l'integrazione
M=100;
dt=(tspan(2)-tspan(1))/M;


%definisco la funzione f del secondo membro, assumo che le variabili siano
%y(1),y(2), etc...
f= @(t,y) [cos(2*y(1)); 0; 0]

%definisco la condizione iniziale
y0=[0;0;0];


% procedo con il calcolo di Eulero
%soluzione al primo tempo, ovvero la condizione iniziale
y(:,1)=y0;




for j=2:N
    
   %Dato che y è una matrice, prendo la riga j-1 
   ytemp=y(:,j-1);
   t=tspan(j-1);
   for jM=1:M
      %scrivo il tempo
      t=t+dt;
      ytemp=ytemp +dt*f(t,ytemp);       
   end
   y(:,j)=ytemp;
    
    
    
end

disp(['Esecuzione terminata']);
%Plot della soluzione approssimata
plot(tspan,y(1,:),'g',tspan, 0.5*asin((exp(4*tspan)-1)./(exp(4*tspan)+1)),'r');



