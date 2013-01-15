* Génération poisson disc
    - 64 samples
        - classique : 0.0510688ms
        - quadtree : 0.0338228ms
    
    - 128 samples
        - classique : 0.277169ms
        - quadtree : 0.0687708ms
    
    - 256 samples
        - classique : 0.653506ms
        - quadtree : 0.163363ms
    
    - 512 samples
        - classique : 2.16486ms
        - quadtree : 0.365659ms
        
    - 1024 samples
        - classique : 8.8095ms
        - quadtree : 0.613535ms
        
    - 2048 samples
        - classique : 22.4626ms
        - quadtree : 1.32593ms
    
    - 4096 samples
        - classique : 1s 6.84759ms
        - quadtree : 0s 3.56794ms
    
    - 8192 samples
        - classique : 3s 19.2887ms
        - quadtree : 0s 5.4917ms

* Comparaisons sur différentes scènes
- Cbox:
    - Path tracer:
        - 36 Samples & Resolution 512x512:
            - Independent:
                Render time: 12.0570s

            - Stratified:
                Render time: 12.5710s
                
            - Poisson:
                Render time: 52.3010s
    
        - 64 Samples & Resolution 512x512:
            - Independent:
                Render time: 21.9420s
            
            - Stratified:
                Render time: 24.4490s
                
            - Poisson:
                **** ! Mesures effectuées en mode DEBUG !
                - implémentation brutal (basique)
                    Render time: 11.6605m
                - implémentation brutal (on conserve le rayon une fois changé)
                    Render time: 7.5040m -> resultats biaisés...
                
                - implémentation par QuadTree (r: 1/sqrt(nSamples))
                    Render time: 6.6960m
                ****
                
                Render time: 1.4562m

        - 144 Samples & Resolution 512x512:
            - Independent:
                Render time: 47.0380s

            - Stratified:
                Render time: 49.8350s
                
            - Poisson:
                Render time: 3.7201m
                
        
        - 256 Samples & Resolution 512x512:
            - Independent:
                Render time: 1.4205m
            
            - Stratified:
                Render time: 1.5265m
        
            - Poisson:
                Render time: 6.0011m
        
        - 529 Samples & Resolution 512x512:
            - Independent:
                Render time: 3.3054m
                
            - Stratified:
                Render time: 3.4788m
        
            - Poisson:
                Render time: 14.6531m

        - 4096 Samples & Resolution 512x512: (on prendra cette image comme référence)
            - Low discrepancy:
                Render time: 28.1169m
                
            - Independent:
                Render time: 23.5340m
- Veach_bidir:
    - Bidirectional path tracer:
        - 36 Samples & Resolution 768x576:
            - Independent:
                Render time: 2.9938m
 
            - Stratified:
                Render time: 3.0475m
                               
            - Poisson:
                Render time: 4.5141m
    
        - 64 Samples & Resolution 768x576:
            - Independent:
                Render time: 4.5432m
 
            - Stratified:
                Render time: 4.8593m
                               
            - Poisson:
                Render time: 6.6671m

                
        - 144 Samples & Resolution 768x576:
            - Independent:
                Render time: 11.5876m
            
            - Stratified:
                Render time: 11.3904m
            
            - Poisson:
                Render time: 17.3225m
                
        - 256 Samples & Resolution 768x576:
            - Independent:
                
            
            - Stratified:
                Render time: 22.6097m
            
            - Poisson:
                Render time: 32.1868m     
                

       - 4096 Samples & Resolution 768x576: (on prendra cette image comme référence)
            - Low discrepancy: 
                Render time: 5.2611h

- Veach_bidir_caustic:
        - 64 Samples & Resolution 768x576:
            - Independent:
                Render time: 4.5568m
 
            - Stratified:
                Render time: 4.5669m
                               
            - Poisson:
                Render time: 7.1228m
                
        - 2048 Samples & Resolution 768x576: (on prendra cette image comme référence)
            - Independent:
                

- mi:
    - Direct illumination:
        - 16 Samples & Resolution 768x512:
            - Independent:
                Render time: 12.4770s
            
            - Stratified:
                Render time: 13.4700s
            
            - Poisson:
                Render time: 1.1373m
        
        - 36 Samples & Resolution 768x512:
            - Independent:
                Render time: 27.0860s
            
            - Stratified:
                Render time: 29.6090s
            
            - Poisson:
                Render time: 2.9372m
                
        - 64 Samples & Resolution 768x512:
            - Independent:
                Render time: 46.7730s
            
            - Stratified:
                Render time: 50.4630s
            
            - Poisson:
                Render time: 4.5794m
        
        - 144 Samples & Resolution 768x512:
            - Independent:
                Render time: 1.8578m
            
            - Stratified:
                Render time: 2.0880m
            
            - Poisson:
                Render time: 11.4991m
        
        - 2048 Samples & Resolution 768x512: (on prendra cette image comme référence)
            - Low discrepancy:
                Render time: 30.4908m

- Babylon:
    - Path tracer:
        - 64 Samples & Resolution 1280x720:
            - Independent:
                Render time: 4.3136m
            
            - Stratified:
                Render time: 4.4434m
            
            - Poisson:
                Render time: 9.2442m

- Italian City:
    - Bidirectional path tracer:
        - 36 Samples & Resolution 1024x768:
            - Independent:
                Render time: 3.7393m
            
            - Stratified:
                Render time: 3.8932m
            
            - Poisson:
                Render time: 6.4206m
        
        - 64 Samples & Resolution 1024x768:
            - Independent:
                Render time: 6.6804m
            
            - Stratified:
                Render time: 6.7172m
            
            - Poisson:
                Render time: 11.0096m
        
        - 144 Samples & Resolution 1024x768:
            - Independent:
                Render time: 15.0460m
            
            - Stratified:
                
            
            - Poisson:
                
                
        
        - 2048 Samples & Resolution 1024x768: (on prendra cette image comme référence)
            - Independent:
                Render time: 3.5598h
    
    
