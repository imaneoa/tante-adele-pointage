# Tante Adèle — planning du personnel

GitHub Pages sert l'application statique. Supabase Free fournit la base Postgres
partagée et l'authentification. L'application relit les changements toutes les
20 secondes pendant qu'elle est ouverte et recharge les données au prochain accès.

## Configuration Supabase

1. Ouvrez le projet Supabase que vous venez de créer.
2. Dans **Authentication → Users**, ajoutez deux comptes et définissez un mot de
   passe solide pour chacun. Le compte `admin@example.com` correspond au nom
   d'utilisateur **Admin** (superviseur) et `dev@example.com` à **Dev** (Imane).
   Cochez la confirmation automatique si le tableau de bord la propose, car ces
   adresses servent d'identifiants internes et ne reçoivent pas de courrier.
   Désactivez l'inscription publique. Choisissez des mots de passe distincts des
   identifiants de votre compte Supabase.
3. Exécutez `supabase-schema.sql` dans **SQL Editor**. Il crée la table, active
   RLS et limite la lecture et l'écriture à ces deux comptes.
4. Le **Project URL** et la clé **publishable** fournis pour ce projet sont déjà
   inscrits dans `supabase-config.js`. Une clé publishable est prévue pour le
   navigateur; n'utilisez jamais la clé `service_role` dans le site ou le dépôt.

## Publication GitHub Pages

1. Créez un dépôt GitHub sous votre compte et ajoutez les fichiers de ce dossier.
2. Activez **Settings → Pages → Deploy from a branch → main / root**.
3. Le lien sera `https://<nom-utilisateur>.github.io/<depot>/`. GitHub Free
   nécessite un dépôt public pour GitHub Pages.
4. Ouvrez le lien et connectez-vous avec le nom d'utilisateur **Admin** ou
   **Dev** et le mot de passe correspondant, puis ajoutez les équipes. Les
   modifications sont enregistrées dans Supabase.

## Import des données actuelles

Sur l'ancien appareil, dans l'ancien fichier, cliquez **Télécharger une copie**.
Sur la version en ligne après connexion, choisissez **Restaurer une sauvegarde**
et sélectionnez le fichier exporté. La restauration enregistrera les trois
plannings dans la base partagée.

## Limites du forfait gratuit

Supabase Free inclut une base de 500 MB et jusqu'à deux projets gratuits. Un
projet inactif peut être mis en pause après une semaine ; ses données restent
conservées et le projet peut être réactivé depuis le tableau de bord. Ce n'est
pas un service avec disponibilité garantie. Exportez périodiquement une copie
depuis l'application pour garder une sauvegarde indépendante.
