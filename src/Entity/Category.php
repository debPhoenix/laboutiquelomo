<?php

namespace App\Entity;

use App\Repository\CategoryRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;


//-> c'est une entité, un objet qui communique avec la bdd par le biais d'un ORM
//-> grace aux annotations, il sait quoi faire avec les différents champs

/**
 * @ORM\Entity(repositoryClass=CategoryRepository::class)
 */
class Category
{

    //-> champs id de la catégorie
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\OneToMany(targetEntity=Product::class, mappedBy="category")
     */
    private $products;


    //-> constructeur de la classe
    public function __construct()
    {
        //-> initialise les produits avec un nouveau tableau 
        $this->products = new ArrayCollection();
    }


    //-> fonction to string: pour connaitre la valeur d'un objet, to string prend l'objet est fait un "éclaté" de celui ci en mettant à plat le contenu, les champs etc

    //-> ici il y a  une redéfinition de la méthode toString,  au lieu d'afficher tout l'objet, elle affiche seulement ce qui est demandé, c'est à dire le nom de la catégorie en cours. getName() affiche la valeur de name.
    public function __toString()
    {
        return $this->getName();
    }

    //-> getter pour obtenir l'id de la catégorie en cours
    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    //-> setter pour définir (attribuer) le nom de la catégorie en cours
    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return Collection|Product[]
     */

    //-> getter pour obtenir le tableau des produits de la cat en cours 
    public function getProducts(): Collection
    {
        return $this->products;
    }

    //-> fonction pour ajouter un produit à la catégorie en cours
    public function addProduct(Product $product): self
    {
        //-> si je cherche (contains) dans la catégorie en cours ($this) dans les products, et que je ne trouve pas le produit que je demande (passé en param avec $product)
        if (!$this->products->contains($product)) {

            //-> ajoute au tableau de produits de cette catégorie (products[] le produit en paramètre
            $this->products[] = $product;

            //-> dans le même temps, définis pour ce produit la catégorie actuelle
            // ainsi c'est un échange croisé entre les deux. chacun est mis à jour
            $product->setCategory($this);
        }
        //-> renvoie moi la catégorie en cours quand tu as fini
        return $this;
    }

    public function removeProduct(Product $product): self
    {
        // si tu arrives à supprimer le produit que je te donne en parametre de la collection de produits de cette categorie
        if ($this->products->removeElement($product)) {
            // set the owning side to null (unless already changed)

            // définis la catégorie de ce produit à null
            // idem, échange croisé, les 2 sont impactés, le produit et la catégorie.
            // le produit n'a plus cette catégorie, et la catégorie n'a plus ce produit
            if ($product->getCategory() === $this) {
                $product->setCategory(null);
            }
        }

        return $this;
    }
}
