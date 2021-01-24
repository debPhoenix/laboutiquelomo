<?php

namespace App\Controller;

use App\Entity\Adress;
use App\Form\AdressType;
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
        $adress = new Adress();

        $form= $this->createForm(AdressType::class, $adress);

        return $this->render('account/adress_add.html.twig',[
            'form' => $form->createView()
        ]);
    }
}
