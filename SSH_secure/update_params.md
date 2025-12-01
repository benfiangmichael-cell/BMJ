#Les paramètres suivants seront modifiés :

1. Le Port
   - Nouvelle valeur : 2222
   - Justification : va permettre d'éviter les scans automatiques sur le port 22

2. Le PermitRootLogin
   - Nouvelle valeur : "no" ;
   - Justification : va empêcher les attaque bruteforce sur root.
  
3. Le PasswordAuthentification
   - Nouvelle valeur : "no" après configuration des clés ;
   - Justification : va empêcher les attaques par mot de passe.

4. Le MaxAuthTries
   - Nouvelle valeur : 3 ;
   - Justification : va permettre de limiter les tentatives d'attaques.

5. le AllowUsers
   - Nouvelle valeur : va prendre la liste des utilisateurs ;
   - Justification : va permettre de réduire la surface d'attaque.

6. le ClientAliveInterval
   - Nouvelle valeur : 300 ;
   - Justification : va permettre de définir un Timeout automatique.

7. Le LoginGraceTime
   - Nouvelle valeur : 20 ;
   - Justification : va permettre de réduire le temps disponible pour une attaque.
