<?php

namespace App\Classe;

use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class Cart
{
    private $session;
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager, SessionInterface $session)
    {
        $this->session = $session;
        $this->entityManager = $entityManager;
    }


    // Fonction add responsable de l'ajout d'un produit dans le panier
    // reçoit l'id du produit à ajouter en paramètre
    public function add($id)
    {

        // Récupère le panier en cours, en interrogeant la session, et le place dans la variable $cart
        $cart = $this->session->get('cart', []);

        if (!empty($cart[$id])){
            // Vérification sur le produit en cours d’ajout.
            // Si le produit existe déjà dans le panier, incrémente la quantité
            $cart[$id]++;
        } else {

            // sinon, initialisation de la quantité pour le produit à 1
            $cart[$id] = 1;
        }

        // sauvegarde en session du contenu mis à jour du panier
        $this->session->set('cart', $cart);
    }

    // Getter pour obtenir le panier en fonction de la session
    public function get()
    { 
        return $this->session->get('cart');
    }

    public function remove()
    { 
        return $this->session->remove('cart');
    }

    public function delete($id)
    { 
        $cart = $this->session->get('cart', []);

        unset($cart[$id]);

        return $this->session->set('cart', $cart);
    }

    public function decrease($id)
    { 
        // vérifie que la quantité n'est pas égale à 1
        $cart = $this->session->get('cart', []);

        if($cart[$id] > 1){
            $cart[$id]--;
        } else {
            //supprime le produit    
            unset($cart[$id]);
        }

        return $this->session->set('cart', $cart);
    }


    // methode getFull()) appelée lorsque l’on souhaite obtenir la totalité du contenu du panier pour l'utilisateur en cours
    public function getFull()
    {
        // Initialisation d'un tableau vide, qui va etre rempli au fur et à mesure.
        // cherche dans la session si des lignes représentant des entrées de mon panier sont stockées
        // Donc pour chaque ligne trouvée, je vais commencer par récupérer les données complètes du  produit en utilisant les méthodes du repository avec la ligne suivante. 
        $cartComplete = [];

        if($this->get()){
            foreach ($this->get() as $id => $quantity) {

                // Réponse de la requête par le biais du repository, renvoie un objet de type Product par son identifiant ($id).
                $product_object = $this->entityManager->getRepository(Product::class)->findOneById($id);
  
                if (!$product_object) {
                     // Si le produit n’existe pas, je supprime la ligne du panier grâce au 
                    $this->delete(($id));
                    continue;
                }

                // Si le produit existe, je remplis le tableau $cartComplete[] avec une nouvelle entrée qui sera composée de mon produit (l’objet complet, contenant toutes les données) + la quantité que l'utilisateur souhaite
                $cartComplete[] = [
                    'product' => $product_object,
                    'quantity' => $quantity
                ];
            }
        }
        // Une fois la boucle terminée, renvoie le tableau qui contient autant de lignes que de produits ajoutés par l’utilisateur
        return $cartComplete;
    }
}