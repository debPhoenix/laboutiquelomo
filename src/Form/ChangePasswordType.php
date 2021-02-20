<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ChangePasswordType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('old_password', PasswordType::class, [
                'label' => 'Mot de passe actuel',
                'label_attr'=> [
                    'class' => 'h5 mt-3'],
                'mapped' => false,
                'attr' => [
                    'placeholder' => 'Veuillez saisir votre mot de passe actuel',
                    'class' => 'h4'
                ]
            ])
            ->add('new_password', RepeatedType::class, [
                'type' => PasswordType::class,
                'mapped' => false,
                'invalid_message' => 'Les mots de passe doivent être identiques.',
                'label' => 'Nouveau mot de passe',
                'required' => true,
                'first_options' => [
                    'label' => 'Nouveau mot de passe',
                    'label_attr'=> [
                    'class' => 'h5 mt-3'],
                    'attr' => [
                        'placeholder' => 'saisir le nouveau mot de passe',
                        'class' => 'h4'
                    ]
                ],
                'second_options' => [
                    'label' => 'Confirmer le nouveau mot de passe',
                    'label_attr'=> [
                        'class' => 'h5 mt-3'],
                    'attr' => [
                        'placeholder' => 'confirmer le nouveau mot de passe',
                        'class' => 'h4'
                    ]
                ]
            ])
            ->add('submit', SubmitType::class, [
                'label' => "Mettre à jour",
                'attr'=> [
                    'class' => 'btn-success btn mb-3'
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
