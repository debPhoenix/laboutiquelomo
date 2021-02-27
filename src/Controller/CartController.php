<?php

namespace App\Controller;

use App\Classe\Cart;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class CartController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    /**
     * @Route("/mon-panier", name="cart")
     * endpoint qui permet l'affichage du panier
     */

    // Demande le rendu de la vue cart/index.html.twig, avec en paramètre l’objet ‘cart’, qui contient les données reçues de la méthode $cart->getFull()
    // La vue est ensuite chargée d’aller prendre les données contenues dans l’objet ‘cart’ et de les afficher aux emplacements dédiés.
    public function index(Cart $cart)
    {
        return $this->render('cart/index.html.twig', [
            'cart' => $cart->getFull()
        ]);
    }

    /**
     * @Route("/cart/add/{id}", name="add_to_cart")
     * endpoint appellé lors de l'ajout d'un article dans le panier
     */
    

    // La fonction add reçoit en paramètre un panier + l’identifiant d’un produit.
    // Appelle de la fonction add sur le panier reçu en paramètre, en transmettant l’id du produit à ajouter.
    // Puis redirection par le contrôleur vers la route ‘cart’ qui va afficher la totalité du panier.
    public function add(Cart $cart, $id)
    {
        $cart->add($id);

        return $this->redirectToRoute('cart');
    }

    /**
     * @Route("/cart/decrease/{id}", name="decrease_to_cart")
     * endpoint appellé lors de la diminution de la quantité d'un article dans le panier
     */
    public function decrease(Cart $cart, $id)
    {
        $cart->decrease($id);

        return $this->redirectToRoute('cart');
    }

    /**
     * @Route("/cart/remove", name="remove_my_cart")
     * endpoint appellé lors de la suppression d'un article dans le panier
     */
    public function remove(Cart $cart)
    {
        $cart->remove();

        return $this->redirectToRoute('products');
    }

    /**
     * @Route("/cart/delete/{id}", name="delete_to_cart")
     * endpoint interne utilisé pour supprimer une entrée du panier lorsque l'article choisi est invalide
     * cette methode pourrait etre privée car interne au processus - à faire évoluer dans une prochaine version
     */
    public function delete(Cart $cart, $id)
    {
        $cart->delete($id);

        return $this->redirectToRoute('cart');
    }
}
