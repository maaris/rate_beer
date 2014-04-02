def response_by_beer_id
  "[{\"BeerID\":12345,\"BeerName\":\"Acoustic Harmonic Bzzz\",\"BrewerID\":12147,\"BrewerName\":\"Acoustic Brewing Company\",\"OverallPctl\":57.751660219715,\"StylePctl\":53.0867326920712,\"BeerStyleName\":\"Mead\",\"Alcohol\":6,\"IBU\":null,\"Description\":\"Honey-apple-cherry wine fermented and flavored with natural fruit and spices.\",\"IsAlias\":false}]"
end

def response_by_beer_name
"[{\"BeerID\":12345,\"BeerName\":\"Acoustic Harmonic Bzzz\",\"IsAlias\":false,\"OverallPctl\":57.751660219715,\"StylePctl\":53.0867326920712,\"RealAverage\":3.433333,\"AverageRating\":3.156209,\"RateCount\":9}]"
end

def beer_reviews_response
"[{\"resultNum\":1,\"RatingID\":5525608,\"Appearance\":3,\"Aroma\":6,\"Flavor\":6,\"Mouthfeel\":3,\"Overall\":12,\"TotalScore\":3,\"Comments\":\"Bottle. Clear gold with a thin white head. Aroma of honey and slight apple. Flavor of honey and lemon soda.\",\"TimeEntered\":\"3/9/2014 11:55:13 AM\",\"TimeUpdated\":null,\"UserID\":76728,\"UserName\":\"JaBier\",\"City\":\"Capital City\",\"StateID\":35,\"State\":\"Ohio\",\"CountryID\":213,\"Country\":\"United States\",\"RateCount\":4443},{\"resultNum\":2,\"RatingID\":5365050,\"Appearance\":3,\"Aroma\":8,\"Flavor\":7,\"Mouthfeel\":4,\"Overall\":15,\"TotalScore\":3.7,\"Comments\":\"Pours a light red colored hue. Aromas is of cherry and apple, sweet and fruity. Flavor is nice. Apple up front, nice and sweet. Sweet cherry juice with subtle tartness as well. Hints of cinnamon and all spice. Another solid offering. Like these light carbonated meads. \",\"TimeEntered\":\"1/4/2014 6:56:21 PM\",\"TimeUpdated\":null,\"UserID\":55709,\"UserName\":\"MeadMe\",\"City\":\"Riverview\",\"StateID\":9,\"State\":\"Florida\",\"CountryID\":213,\"Country\":\"United States\",\"RateCount\":1237}]"
end
