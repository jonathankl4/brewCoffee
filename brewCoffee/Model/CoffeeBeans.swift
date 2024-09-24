//
//  Coffee.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import Foundation

struct CoffeeBeans: Identifiable {
    var id: UUID = UUID()
    var nameCoffee: String
    var titleArticle: String
    var imgArticle: String
    var iconCoffee: String
    var article: String
}

extension CoffeeBeans {
    static var dummies: [CoffeeBeans] = [
        CoffeeBeans(
            nameCoffee: "Arabica",
            titleArticle: "Understanding Arabica Coffee: Benefits and Considerations for Those with Acid Reflux",
            imgArticle: "arabicaArticle",
            iconCoffee: "arabicaIcon",
            article: """
                        Arabica coffee, known scientifically as Coffea arabica, is one of the most popular and widely consumed types of coffee in the world, accounting for about 60-70% of global coffee production. Originating from the high-altitude regions of Ethiopia, Arabica beans are celebrated for their smooth flavor profile, which often includes notes of fruit, sugar, and hints of chocolate. This coffee variety thrives in cooler climates and is typically grown in shaded areas, making it a favorite among coffee enthusiasts seeking quality and complexity in their brews.

                        For individuals with acid reflux or gastroesophageal reflux disease (GERD), the consumption of coffee can be a concern due to its acidity and potential to relax the lower esophageal sphincter. However, many people with acid reflux find that they can enjoy Arabica coffee in moderation. Compared to Robusta coffee, Arabica has a lower caffeine content, which may be less irritating to the stomach. Additionally, the smoother taste of Arabica can be less harsh on the digestive system, especially when consumed black or with minimal additives.

                        To minimize discomfort, individuals suffering from acid reflux should consider certain preparation methods. Cold brew coffee, for example, tends to have a lower acidity level compared to traditional hot brews. Additionally, opting for lighter roasts can also reduce the likelihood of aggravating acid reflux symptoms. It's crucial for those with sensitivities to monitor their individual reactions and adjust their coffee consumption accordingly.

                        In conclusion, Arabica coffee can be enjoyed by individuals with acid reflux, provided it is consumed mindfully and in moderation. As always, it's advisable to consult with a healthcare provider for personalized dietary recommendations, especially for those managing chronic health conditions.
                    """
            ),
        CoffeeBeans(
            nameCoffee: "Kopi Luwak",
            titleArticle: "Kopi Luwak: A Safe Choice for People with Acid Reflux",
            imgArticle: "luwakArticle", 
            iconCoffee: "luwakIcon",
            article: """
                        Kopi Luwak, also known as civet coffee, has gained a reputation as one of the world’s most unique and luxurious coffees. Produced from beans that have been digested and excreted by the Asian palm civet, this coffee offers a distinct flavor profile characterized by its smoothness and rich aroma. While many enjoy its unique taste, those with acid reflux or gastroesophageal reflux disease (GERD) often wonder if Kopi Luwak is a safe option for them.
                        
                        One of the main reasons Kopi Luwak might be easier on the stomach compared to regular coffee is its lower acidity level. The digestive process that the coffee beans undergo in the civet’s system breaks down certain compounds, which can lead to a milder flavor and a reduced acidity. Studies suggest that lower-acid coffees can be less irritating to the stomach lining, making Kopi Luwak a potential alternative for those sensitive to higher acidity levels found in conventional coffee.
                        
                        Moreover, the unique fermentation process contributes to the coffee’s overall flavor, which may make it more palatable for individuals with acid reflux. Many people with this condition find that they can tolerate certain coffee types better than others, and Kopi Luwak’s distinctive brewing method might help in reducing symptoms. However, it’s essential for individuals to monitor their own reactions, as personal tolerance levels can vary significantly.
                        
                        Lastly, moderation is key. Even though Kopi Luwak may be gentler on the stomach, excessive consumption of any coffee can lead to increased stomach acid production and exacerbate symptoms of acid reflux. For those looking to enjoy this exquisite coffee, it’s best to start with small amounts and observe how it affects their digestive system. As always, consulting with a healthcare provider is advisable for personalized recommendations.
                        
                        In conclusion, Kopi Luwak can be a delightful and potentially safer choice for individuals with acid reflux, thanks to its lower acidity and unique flavor profile. By enjoying it in moderation, coffee lovers can indulge in this luxurious beverage while keeping their digestive health in check.
                    """
            ),
        CoffeeBeans(
            nameCoffee: "White Coffee", 
            titleArticle: "The Unique World of White Coffee",
            imgArticle: "whiteArticle", 
            iconCoffee: "whiteIcon",
            article: """
                        White coffee is a distinctive variety of coffee that's roasted at much lower temperatures than traditional coffee, giving it a lighter color and a unique flavor profile. Unlike medium or dark roasts, white coffee is pulled out of the roaster just before the beans reach their first crack. This process preserves the natural oils and sugars in the beans, leading to a mild, nutty, and sweet flavor. The low roasting temperature also results in a coffee that retains more caffeine, making white coffee an energizing alternative for those seeking a different coffee experience.
                        
                        The health benefits of white coffee are notable due to its higher caffeine content and greater concentration of antioxidants, such as chlorogenic acid, which can help reduce inflammation, support weight loss, and promote heart health. Moreover, white coffee is generally less acidic than traditional roasts, which makes it a good option for individuals with sensitive stomachs or acid reflux issues.
                        
                        White coffee's distinctive flavor lacks the bitterness found in darker roasts, as it does not undergo the caramelization process during roasting. This gives it a lighter, slightly floral profile with nutty undertones, making it enjoyable for coffee enthusiasts who prefer a more subtle, less bitter taste. The texture of the beans is denser and harder than regular coffee beans, which makes them more difficult to grind at home. This is why many people prefer to purchase pre-ground white coffee.
                        
                        Typically used in specialty drinks or mixed with spices such as Hawaij in Middle Eastern coffee traditions, white coffee offers a unique take on the traditional coffee-drinking experience. While it is still relatively niche, white coffee has been gaining popularity, and it’s possible to find it in artisan coffee shops and some online retailers.
                    """
            ),
        CoffeeBeans(
            nameCoffee: "Chicory Coffee",
            titleArticle: "Chicory Coffee: A Healthy Coffee",
            imgArticle: "chicoryArticle",
            iconCoffee: "chicoryIcon",
            article: """
                        Chicory is a perennial flowering plant from the dandelion family, scientifically known as Cichorium intybus, and often referred to as wild chicory. This hardy plant is easily recognized by its stiff, hairy stems and bright lavender-blue flowers. While its leaves are commonly used in salads for their slightly bitter taste, it’s the plant’s root that has gained popularity as a coffee alternative. For centuries, chicory has been cultivated not only for culinary use but also for its medicinal benefits, particularly in promoting digestive health.
                        
                        The root of the chicory plant undergoes a special process of drying, roasting, and grinding to create chicory coffee. When roasted, the root develops a dark caramel color and a flavor that mimics traditional coffee but with key differences. Chicory coffee offers a nutty, slightly sweet taste, with far less bitterness and acidity than regular coffee. Its naturally low caffeine content makes it an excellent choice for those looking to reduce their caffeine intake, particularly for individuals with acid reflux or digestive sensitivities who find regular coffee too harsh on the stomach.
                        
                        One of the standout benefits of chicory coffee is its rich inulin content, a prebiotic fiber that supports digestive health. Inulin promotes the growth of beneficial bacteria in the gut, which can improve overall gut health and reduce digestive discomfort. Additionally, studies suggest that inulin may help regulate blood sugar levels by improving carbohydrate metabolism, and it could also play a role in reducing chronic inflammation in the body. For these reasons, chicory coffee is often considered a functional beverage with added health benefits beyond its pleasant taste.
                        
                        Chicory coffee is frequently blended with regular coffee to create New Orleans-style coffee, a beloved local tradition. This blend offers a unique flavor and provides a way to reduce caffeine while still enjoying the taste of coffee. However, some people may experience allergic reactions to chicory, resulting in symptoms like mouth tingling or swelling. If any adverse effects occur, it’s important to discontinue consumption and seek medical advice. Despite this, for many, chicory coffee remains a delicious and healthy coffee alternative that balances flavor with health benefits.
                    """
            ),
        CoffeeBeans(
            nameCoffee: "Excelsa Coffee",
            titleArticle: "Excelsa Coffee: An Underappreciated Gem", 
            imgArticle: "excelsaArticle",
            iconCoffee: "excelsaIcon",
            article: """
                        Excelsa coffee is one of the four main varieties of coffee beans, alongside Arabica, Robusta, and Liberica. It is often considered a sub-species of Liberica, distinguished by its fruity, tart flavors, and lighter body compared to the stronger, earthier taste of Liberica beans. Grown predominantly in Southeast Asia, Excelsa is prized for its unique characteristics that blend the robustness of darker beans with the bright acidity found in lighter ones. Though not as widely known as Arabica or Robusta, Excelsa coffee is beloved by coffee enthusiasts for its complex, multilayered taste profiles that can vary from fruity and floral to woody and spicy.
                        
                        One of the advantages of Excelsa coffee is its relative gentleness on the stomach. Excelsa beans have lower acidity levels compared to other popular coffee varieties, making them a safer option for individuals with sensitive stomachs or acid reflux. Additionally, Excelsa coffee’s light body and nuanced flavors can be easier to digest, as its brew does not feel as heavy or intense as some darker roasts. For people looking to enjoy a unique coffee experience without worrying about acidity or digestive discomfort, Excelsa is an excellent choice.
                        
                        Another reason Excelsa coffee appeals to coffee drinkers is its versatility. Its bright, fruity notes make it a great match for cold brew and iced coffee preparations, where the flavors can truly shine without being overpowered by bitterness. At the same time, its depth and complexity hold up well in espresso drinks and other bold coffee recipes. This adaptability makes Excelsa a popular choice for artisan coffee roasters who want to offer something special beyond the usual Arabica and Robusta options.
                        
                        Despite its many positive attributes, Excelsa coffee remains relatively rare in the global market due to limited production. This rarity, combined with its distinct flavor profile, means that Excelsa coffee can command higher prices than other varieties. However, for coffee lovers willing to explore beyond the ordinary, Excelsa offers a one-of-a-kind drinking experience that’s worth the investment. Whether enjoyed hot or cold, black or with milk, Excelsa coffee is sure to leave a lasting impression on anyone seeking a new favorite coffee.
                    """
            ),
        CoffeeBeans(
            nameCoffee: "Decaf Coffee",
            titleArticle: "Decaf Coffeee: Benefits, Health, and Risks",
            imgArticle: "decafArticle",
            iconCoffee: "decafIcon",
            article: """
                        Decaf coffee, short for decaffeinated coffee, is a popular alternative for coffee lovers who want to enjoy the taste of coffee without the stimulating effects of caffeine. Through various methods like water processing, carbon dioxide extraction, or chemical solvents, most of the caffeine content is removed from the beans, typically leaving just 1-2% of the original caffeine. This makes decaf a great option for individuals who are sensitive to caffeine, including those suffering from acid reflux or gastroesophageal reflux disease (GERD).
                        
                        One of the primary benefits of decaf coffee is that it significantly reduces the risk of acid reflux symptoms, which are often triggered by the consumption of regular coffee. The lower caffeine content in decaf means that it is less likely to relax the lower esophageal sphincter, a muscle that can cause acid to rise from the stomach into the esophagus, leading to heartburn. For this reason, decaf coffee is often recommended for individuals looking to manage their acid reflux without giving up the pleasure of drinking coffee altogether.
                        
                        Despite the reduced caffeine, decaf coffee retains much of the flavor and aroma of regular coffee, especially if it is made from high-quality beans like Arabica. While some decaf varieties may taste slightly different due to the decaffeination process, many coffee enthusiasts still find decaf to be a satisfying alternative that allows them to enjoy their favorite beverage at any time of day without experiencing the jittery effects of caffeine.
                        
                        It is worth noting that although decaf coffee is a better choice for those with acid reflux, it is still slightly acidic due to other compounds present in the beans. Individuals with severe reflux should pay attention to how their body reacts to different brewing methods and bean types. Cold brewing decaf, for example, can result in a beverage with even lower acidity, which might be gentler on the stomach.
                        
                        In conclusion, decaf coffee provides a viable option for people who enjoy coffee but need to avoid caffeine for health reasons, including those managing acid reflux. By choosing decaf, coffee lovers can still savor the rich flavors of coffee without the discomfort that often comes with high caffeine intake.
                    """
            ),
    ]
}
