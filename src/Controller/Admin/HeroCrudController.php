<?php

namespace App\Controller\Admin;

use App\Entity\Hero;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;

class HeroCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Hero::class;
    }
    
    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('title', 'Titre de la bannière'),
            TextareaField::new('content', 'Texte de la bannière'),
            TextField::new('btnTitle', 'Texte du bouton'),
            TextField::new('btnUrl', 'Lien de destination du bouton'),
            ImageField::new('illustration', 'Bannière')
            ->setBasePath('uploads/')
            ->setUploadDir('public/uploads/')
            ->setUploadedFileNamePattern('[randomhash].[extension]')
            ->setRequired(false),
        ];
    }
}
