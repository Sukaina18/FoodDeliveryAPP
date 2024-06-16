class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent({
    required this.description,
    required this.image,
    required this.title,
  });
}

List<OnboardingContent> contents = [
  OnboardingContent(
    description: 'Pick your food from our menu\n More than 35 varieties',
    image: "images/coffee1.png",
    title: 'Your Coffee is brewing\n Grab yours Now',
  ),
  OnboardingContent(
    description: 'You can pay cash on delivery\nCash on delivery is available',
    image: "images/cod1.png",
    title: 'COD Available Now',
  ),
  OnboardingContent(
    description: 'Deliver your food at your doorsteps\nPick up your food now',
    image: "images/delivery1.png",
    title: 'Quick Delivery',
  ),
];
