:- use_module(library(jpl)).    


start :-sleep(0.4),	           
		
		write("Running"),nl,nl,					
		interface2.  			




%These are the rules of the system

   

    symptom(User,gaming) :- verify(User," need a gaming lap (y/n) ?").				

    symptom(User,designing) :- verify(User," need a laptop for designing work (y/n) ?").  

    symptom(User,programming) :- verify(User," need a Laptop for programming (y/n) ?").    
  
    	   		symptom(User,ram_1) :- verify(User," need a laptop with 8 GB RAM (y/n) ?").

            symptom(User,ram_2) :- verify(User," need a laptop with 32 GB RAM (y/n) ?").  
    
  
    symptom(User,cpu_1) :- verify(User," need a laptop with laptop with AMD Ryzen 5 2500U CPU (y/n) ?").

    symptom(User,gpu_1) :- verify(User," need a laptop with laptop with AMD Radeon RX 560X (4GB GDDR5) GPU (y/n) ?").

    symptom(User,display_1) :- verify(User," need a laptop with laptop with 15.6”, Full HD display (y/n) ?").
    


    
    symptom(User,cpu_2) :- verify(User," need a laptop with AMD Ryzen 5 3550H CPU (y/n) ?").
   
    symptom(User,gpu_2) :- verify(User," need a laptop with AMD Radeon RX 560X (4GB GDDR5) GPU (y/n) ?").  

    symptom(User,display_2) :- verify(User," need a laptop with 15.6”, Full HD (1920 x 1080), IPS display (y/n) ?").


    symptom(User,cpu_2) :- verify(User," need a laptop with AMD Ryzen 5 3550H CPU (y/n) ?").
   
    symptom(User,gpu_2) :- verify(User," need a laptop with AMD Radeon RX 560X (4GB GDDR5) GPU (y/n) ?").
  
    symptom(User,display_2) :- verify(User," need a laptop with 15.6”, Full HD (1920 x 1080), IPS display (y/n) ?").



    symptom(User,cpu_3) :- verify(User," need a laptop with Intel Core i7-7700HQ CPU (y/n) ?").

    symptom(User,gpu_3) :- verify(User," need a laptop with  NVIDIA GeForce GTX 1050 Ti (4GB GDDR5) GPU (y/n) ?").

    symptom(User,display_3) :- verify(User," need a laptop with 15.6”, Full HD (1920 x 1080), IPS display (y/n) ?").



    symptom(User,cpu_4) :- verify(User," need a laptop with Intel Core i7-8550U CPU (y/n) ?").

    symptom(User,gpu_4) :- verify(User," need a laptop with Intel UHD Graphics 620 GPU (y/n) ?").

    symptom(User,display_4) :- verify(User," need a laptop with 14.0”, Full HD (1920 x 1080), IPS display (y/n) ?").

    
    symptom(User,cpu_5) :- verify(User," need a laptop with  Intel Core i7-6820HQ CPU (y/n) ?").

    symptom(User,gpu_5) :- verify(User," need a laptop with NVIDIA Quadro M1000M (2GB GDDR5) GPU (y/n) ?").

    symptom(User,display_5) :- verify(User," need a laptop with 15.6”, Full HD (1920 x 1080), IPS display (y/n) ?"). 



    symptom(User,cpu_6) :- verify(User," need a laptop with  Intel Core i5-8250U CPU (y/n) ?").

    symptom(User,gpu_6) :- verify(User," need a laptop with Intel UHD Graphics 620 GPU (y/n) ?").

    symptom(User,display_6) :- verify(User," need a laptop with 15.6”, Full HD (1920 x 1080), TN display (y/n) ?").   
    
	
	

%These are the rules of the system based on the verified symptoms

    hypothesis(User,asus_TUF_GAMING_FX505) :-					
        symptom(User,gaming),
        symptom(User,cpu_1),
        symptom(User,gpu_1),
        symptom(User,ram_1),
        symptom(User,display_1).

    hypothesis(User,asus_TUF_GAMING_SX505) :- 
        symptom(User,gaming),
        symptom(User,cpu_2),
        symptom(User,gpu_2),
        symptom(User,ram_2),
        symptom(User,display_2).
        
    hypothesis(User,hp_OMEN_15) :-
        
        symptom(User,designing),
        symptom(User,cpu_3),
        symptom(User,gpu_3),
        symptom(User,ram_1),
        symptom(User,display_3).  
        
    hypothesis(User,lenovo_IDEAPAD_520S) :-
        
        symptom(User,designing),
        symptom(User,cpu_4),
        symptom(User,gpu_4),
        symptom(User,ram_1),
        symptom(User,display_4).
        
    hypothesis(User,dell_PRESISION_15) :-
        
        symptom(User,programming),
        symptom(User,cpu_5),
        symptom(User,gpu_5),
        symptom(User,ram_1),
        symptom(User,display_5).
    
    hypothesis(User,dell_INSPIRON_15) :-
        
        symptom(User,programming),
        symptom(User,cpu_6),
        symptom(User,gpu_6),
        symptom(User,ram_2),
        symptom(User,display_6).


	hypothesis(_,"Laptop. yet there is no any laptop in my knowledge base with that specifications.. :( ").
	
    response(Reply) :-
        read(Reply),
        write(Reply),nl.
		
ask(User,Question) :-
	write(User),write(', do you'),write(Question),	
	interface(', do you',User,Question),nl.
	
:- dynamic yes/1,no/1.		
	
verify(P,S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(P,S))).
	 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.


pt(User):- 

		hypothesis(User,Laptop),
		interface3(User,', you may need to buy a ',Laptop,'.'),
        write(User),write(', you may need to buy a '),write(Laptop),write('.'),nl,nl,
undo,end.



		

		
 		

end :-
		nl,nl,nl,
		sleep(0.4),
		write("Shutting Down"),nl.

interface(X,Y,Z) :-			%Asks the Questions
	atom_concat(Y,X, FAtom),  %atom_concat(?Atom1, ?Atom2, ?Atom3)  Atom3 forms the concatenation of Atom1 and Atom2.
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['Laptop_selector'], F),									
	jpl_new('javax.swing.JLabel',['Find your Laaptop'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),						
	jpl_call(F, dispose, [], _), 
	write(N),nl,
	( (N == yes ; N == y)
      ->
       assert(yes(Z)) ;
       assert(no(Z)), fail).
	   		
interface2 :-				%Takes the name
	jpl_new('javax.swing.JFrame', ['Laptop_selector'], F),
	jpl_new('javax.swing.JLabel',['Find your Laaptop'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'Hello User.. Please tell me your name'], N),		
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(null)				%null only happens when we cancel button is clicked, if nothing was entered it will be considered empty String ""
		->	write('You cancelled'),interface3('You cancelled. ','Thank you ','for useing ','Laptop_selector.'),end,fail
		;	write("Hello User.. Please tell me your name : "),nl,pt(N)
	).
	
	
interface3(P,W1,D,W2) :-	%Tell the User whats his illness			
	atom_concat(P,W1, A),    
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['Laptop_selector'], F),
	jpl_new('javax.swing.JLabel',['Find your Laaptop'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),			
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(void)			%Exeption handling
		->	write('')
		;	write("")

	).



help :- write("To start type 'start.' and press Enter").