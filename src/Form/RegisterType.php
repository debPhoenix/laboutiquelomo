<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;

class RegisterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('lastname', TextType::class, [
                'label' => 'Nom',
                'label_attr'=> [
                    'class' => 'h5 mt-3'],
                'constraints' => [
                    new Length([
                        'min' => 2,
                        'max' => 30,
                    ]),
                ],
                'attr' => [
                    'placeholder' => 'saisir votre nom'
                ]
            ])
            ->add('firstname', TextType::class, [
                'label' => 'Prénom',
                'label_attr'=> [
                    'class' => 'h5 mt-3'],
                'constraints' => [
                    new Length([
                        'min' => 2,
                        'max' => 30,
                    ]),
                ],
                'attr' => [
                    'placeholder' => 'saisir votre prénom'
                ]
            ])
            ->add('email', EmailType::class, [
                'label' => 'Email',
                'label_attr'=> [
                    'class' => 'h5 mt-3'],
                'constraints' => [
                    new Length([
                        'min' => 2,
                        'max' => 60,
                    ]),
                ],                
                'attr' => [
                    'placeholder' => 'saisir votre adresse email'
                ]
            ])

            ->add('password', RepeatedType::class, [
                'type' => PasswordType::class,
                'invalid_message' => 'Les mots de passe doivent être identiques.',
                'label' => 'Mot de passe',
                'required' => true,
                'first_options' => [
                    'label' => 'Mot de passe',
                    'label_attr'=> [
                        'class' => 'h5 mt-3'],
                    'attr' => [
                        'placeholder' => 'saisir un mot de passe'
                    ]
                ],
                'second_options' => [
                    'label' => 'Confirmer le mot de passe',
                    'label_attr'=> [
                        'class' => 'h5 mt-3'],
                    'attr' => [
                        'placeholder' => 'confirmer le mot de passe'
                    ]
                ]
            ])
            ->add('submit', SubmitType::class, [
                'label' => "S'enregistrer",
                'attr' => [
                    'class' => 'btn-success btn mb-5'
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
