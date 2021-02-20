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
    /**
     * fonction responsable de l'ajout d'un produit dans le panier, si le produit existe deja
     * j'incrémente la quantité
     */
    public function add($id)
    {
        //-> Cette fonction reçoit l’identifiant du produit à ajouter en paramètre.
        //-> Je commence par récupérer le panier en cours, en interrogeant la session, et le place dans la variable $cart
        $cart = $this->session->get('cart', []);

        if (!empty($cart[$id])){
            //-> Ensuite, je fais une vérification sur le produit en cours d’ajout. Si le produit existe déjà dans mon panier, j’incrémente la quantité
            $cart[$id]++;
        } else {

            //sinon, j’initialise la quantité pour le produit à 1
            $cart[$id] = 1;
        }

        //je sauvegarde en session le contenu mis à jour du panier
        $this->session->set('cart', $cart);
    }

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
        //vérifie que la quantité n'est pas égale à 1
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
        //-> J’initialise préalablement un tableau vide, que je vais remplir au fur et à mesure.
        //-> Je vais ensuite chercher dans la session si des lignes représentant des entrées de mon panier sont stockées.
        //-> Pour rappel, chaque entrée du panier est un identifiant de produit et une quantité.
        //-> Ainsi, pour chaque ligne trouvée, je vais commencer par récupérer les données complètes du  produit en utilisant les méthodes du repository avec la ligne suivante. 
        $cartComplete = [];

        if($this->get()){
            foreach ($this->get() as $id => $quantity) {

                //-> La réponse de la requête par le biais du repository me renvoie un objet de type Product, par son identifiant ($id).
                $product_object = $this->entityManager->getRepository(Product::class)->findOneById($id);
  
                if (!$product_object) {
                     //-> Par sécurité, si le produit n’existe pas, je supprime la ligne du panier grâce au 
                    $this->delete(($id));
                    continue;
                }

                //-> Si le produit existe, je remplis le tableau $cartComplete[] avec une nouvelle entrée, qui sera composée de mon produit (l’objet complet, contenant toutes les données) et la quantité que l'utilisateur souhaite acheter.
                $cartComplete[] = [
                    'product' => $product_object,
                    'quantity' => $quantity
                ];
            }
        }
        //-> Une fois la boucle terminée, je renvoie le tableau, qui contient autant de lignes que de produits ajoutés par l’utilisateur.
        return $cartComplete;
    }
}