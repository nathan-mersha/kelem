import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kelemapp/model/commerce/product.dart';
import 'package:kelemapp/model/profile/shop.dart';

class Seed {
  static Shop bookShop = Shop(
    shopId: "RKy7fQXKfpTt3iCFlHYX",
    category: "book",
    email: "bookworld@gmail.com",
    isVerified: true,
    isVirtual: false,
    name: "Book World",
    physicalAddress: "Addis Ababa, Bole, Behind Friendship",
    primaryPhone: "+251911223344",
    secondaryPhone: "+251922334455",
    coOrdinates: ["1", "2"],
    website: "www.bookworld.com",
  );

  static Shop iotShop = Shop(
    shopId: "SYDvGJtqnbTsbnS3Ga8U",
    category: "iot",
    email: "ethioarduino@gmail.com",
    isVerified: true,
    isVirtual: true,
    name: "Ethio Arduino",
    physicalAddress: "Addis Ababa, Kirkos, Behind Alpha School",
    primaryPhone: "+251967554433",
    secondaryPhone: "+251922334433",
    coOrdinates: ["1", "2"],
    website: "www.ethioarduino.com",
  );
  static List<Product> products = [
    Product(
        name: "Winter",
        authorOrManufacturer: "Markus Aurelies",
        category: "book",
        price: 100,
        regularPrice: 150,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "fiction",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),
    // todo : modify
    Product(
        name: "Beloved",
        authorOrManufacturer: "Toni Morrision",
        category: "book",
        price: 80,
        regularPrice: 40,
        rating: 3,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "fiction",
        shop: bookShop,
        availableStock: 2,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "Days without End",
        authorOrManufacturer: "	Sebastian Barry",
        category: "book",
        price: 678,
        regularPrice: 999,
        rating: 5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "fiction",
        shop: bookShop,
        availableStock: 34,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "Fugitive Pieces",
        authorOrManufacturer: "Anne Michaels",
        category: "book",
        price: 333,
        regularPrice: 1000,
        rating: 2.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "fiction",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "Half of a yellow sun",
        authorOrManufacturer: "Chimamadna Ngozi Adichie",
        category: "book",
        price: 776,
        regularPrice: 345,
        rating: 5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "fiction",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "Homegoing",
        authorOrManufacturer: "Yaa Gyasi",
        category: "book",
        price: 230,
        regularPrice: 400,
        rating: 1.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "fiction",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "Small island",
        authorOrManufacturer: "Andrea Levy",
        category: "book",
        price: 32,
        regularPrice: 32,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "fiction",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "The Bell jar",
        authorOrManufacturer: "Sylvia Plath",
        category: "book",
        price: 100,
        regularPrice: 100,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "fiction",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "The God of small things",
        authorOrManufacturer: "Arundahati Roy",
        category: "book",
        price: 100,
        regularPrice: 150,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "fiction",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "Things fall apart",
        authorOrManufacturer: "Chinua Achebe",
        category: "book",
        price: 100,
        regularPrice: 100,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "fiction",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "White teeth",
        authorOrManufacturer: "Zadie Smith",
        category: "book",
        price: 100,
        regularPrice: 150,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "fiction",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "Bridget jones diary",
        authorOrManufacturer: "Helen Fielding",
        category: "book",
        price: 50,
        regularPrice: 200,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "fiction",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "Forever",
        authorOrManufacturer: "Judy Blume",
        category: "book",
        price: 250,
        regularPrice: 560,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "fiction",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "Giovanni's Room",
        authorOrManufacturer: "James Baldwin",
        category: "book",
        price: 100,
        regularPrice: 150,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "fiction",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // book novel

    // todo : modify
    Product(
        name: "Giovanni's Room",
        authorOrManufacturer: "James Baldwin",
        category: "book",
        price: 100,
        regularPrice: 150,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "novel",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "Pride and Predjudice",
        authorOrManufacturer: "Jane Austen",
        category: "book",
        price: 33,
        regularPrice: 150,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "novel",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "Their Eyes Were Watching God	",
        authorOrManufacturer: "Zora Neale Hurston",
        category: "book",
        price: 235,
        regularPrice: 678,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "novel",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "The Far Pavilions",
        authorOrManufacturer: "M. M. Kaye",
        category: "book",
        price: 100,
        regularPrice: 150,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "novel",
        shop: bookShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // iot micro-controllers

    // todo : modify
    Product(
        name: "Stepper 28byj",
        authorOrManufacturer: "ULN",
        category: "iot",
        price: 100,
        regularPrice: 150,
        rating: 4.5,
        tag: [],
        subCategory: "micro-controllers",
        shop: iotShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "HC-05 Bluetooth module",
        authorOrManufacturer: "ULN",
        category: "iot",
        price: 100,
        regularPrice: 150,
        rating: 4.5,
        tag: ["iot"],
        subCategory: "micro-controllers",
        shop: iotShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // todo : modify
    Product(
        name: "Smoke Detector",
        authorOrManufacturer: "ULN",
        category: "iot",
        price: 100,
        regularPrice: 150,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "micro-controllers",
        shop: iotShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    // iot transistors

    Product(
        name: "PIR module",
        authorOrManufacturer: "ULN",
        category: "iot",
        price: 100,
        regularPrice: 150,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "transistors",
        shop: iotShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),

    Product(
        name: "Infra red distance sensor",
        authorOrManufacturer: "ULN",
        category: "iot",
        price: 100,
        regularPrice: 150,
        rating: 4.5,
        tag: ["novel", "fantasy", "adventure"],
        subCategory: "transistors",
        shop: iotShop,
        availableStock: 10,
        deliverable: true,
        publishedStatus: "published",
        reference: "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings",
        description:
            "Amazon offers customers a chance to give your book a sneak peek before purchase. It’s called the Look Inside feature, and when shoppers click on it, they’re treated to a free preview of your book introduction."),
  ];

  static Future<bool> createSeedData() {
    products.forEach((Product product) {
      print(Product.toMap(product));
      Firestore.instance.collection("product").add(Product.toMap(product));
    });
    return Future.value(true);
  }
}
