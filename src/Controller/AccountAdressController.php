<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class AccountAdressController extends AbstractController
{
    /**
     * @Route("/compte/adresses", name="account_adress")
     */
    public function index()
    {
        return $this->render('account/adress.html.twig');
    }


    /**
     * @Route("/compte/ajouter-une-adresse", name="account_address_add")
     */
    public function add()
    {
        return $this->render('account/adress_add.html.twig');
    }
}
