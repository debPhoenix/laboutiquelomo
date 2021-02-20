<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Entity\Product;
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
     */

    //-> je demande le rendu de la vue cart/index.html.twig, avec en paramètre l’objet ‘cart’, qui contient les données reçues de la méthode $cart->getFull()
    //-> la vue est ensuite chargée d’aller prendre les données contenues dans l’objet ‘cart’ et de les afficher aux emplacements dédiés.
    public function index(Cart $cart)
    {
        return $this->render('cart/index.html.twig', [
            'cart' => $cart->getFull()
        ]);
    }

    //-> route qui permet d’appeler la fonction qui ajoute un article dans le panier, à l’aide de l’identifiant passé en paramètre
    /**
     * @Route("/cart/add/{id}", name="add_to_cart")
     */

    //-> La fonction add reçoit un panier en paramètre + l’identifiant d’un produit.
    //-> j'appele la fonction add sur le panier reçu en paramètre, en transmettant l’id du produit à ajouter.
    //-> Ensuite, l’utilisateur sera redirigé par le contrôleur vers la route ‘cart’ qui va afficher la totalité du panier, présentée plus haut.
    public function add(Cart $cart, $id)
    {
        $cart->add($id);

        return $this->redirectToRoute('cart');
    }

    /**
     * @Route("/cart/remove", name="remove_my_cart")
     */
    public function remove(Cart $cart)
    {
        $cart->remove();

        return $this->redirectToRoute('products');
    }


    /**
     * @Route("/cart/delete{id}", name="delete_to_cart")
     */
    public function delete(Cart $cart, $id)
    {
        $cart->delete($id);

        return $this->redirectToRoute('cart');
    }

    /**
     * @Route("/cart/decrease{id}", name="decrease_to_cart")
     */
    public function decrease(Cart $cart, $id)
    {
        $cart->decrease($id);

        return $this->redirectToRoute('cart');
    }
}
