import UIKit


public struct Post {
    
    public let author: String
    public let description: String
    public let image: String
    public var likes: Int
    public var views: Int
}


var onePost = Post(
    author: "Игорь Новиков",
    description: "Глушаков покинул Пари НН. «Пари НН» объявил об уходе Дениса Глушакова.Мы благодарим Дениса за время, проведенное за Пари НН, и за создание душевной атмосферы вне игрового поля, – сказано в заявлении клуба. Хочу сказать «Пари НН» спасибо за теплый прием! Очень важно, что команда осталась в Премьер-лиге! Благодарю товарищей по команде за время, что удалось поиграть вместе. Впереди клуб ждет новый сезон. И я желаю руководству, команде и болельщикам удачи, процветания и успехов! – сказал Денис. В составе «Пари НН» в весенней части сезона Глушаков сыграл в 9 матчах и забил 1.",
    image: "1PostPic",
    likes: 34,
    views: 345)

var twoPost = Post(
    author: "Алексей Белоус",
    description: "«Урал» сделал «Локомотиву» предложение об аренде Константина Марадишвили. Об этом рассказал президент клуба из Екатеринбурга Григорий Иванов. «Мы сделали официальное предложение «Локомотиву» по аренде Марадишвили. Пока ни привета ни ответа. Но думаю, что такого футболиста у нас не будет, потому что он хочет получить грузинское гражданство, а у нас перебор легионеров. Вот в этом может быть проблема. Конкретики никакой у нас нет пока», – сказал Иванов. ",
    image: "2PostPic",
    likes: 567,
    views: 23424)

var threePost = Post(
    author: "Степан Кашинцев",
    description: "Константин Генич рассказал, что он чувствует, находясь на бровке в качестве тренера. «По-другому ощущаешь ошибки, когда ты тренер. Мы играли с 2Drots, я почувствовал, что нас прижимают, взял тайм-аут. И мы сразу после него получили два гола (до этого вели 1:0). Я ночь не спал, пересматривал матч, корил себя за этот шаг, что испортил всю малину и сбил игру. Да, нас прижимали, но моментов особенно не было. И это мое поражение, а не поражение ребят. Стартовый свисток вообще все переворачивает. Перед игрой ты расслаблен, хочешь дать сыграть всем, настраиваешься так, чтобы не заводиться – это же Медиалига, ничего больше. Но стоит матчу начаться, стоит кому-то отдать неточный пас, стоит не выполнить установку, сразу бесы вселяются. Я потом извиняюсь перед ребятами: «У меня просто котелок кипит, все еще сложно убить в себе игрока». Когда пересматриваю игры и слышу свой мат, мне становится жутко неудобно. Надо быть спокойнее»",
    image: "3PostPic",
    likes: 345,
    views: 7653)

var fourPost = Post(
    author: "Инокентий Смоктуновский",
    description: "Пеп Гвардиола вспомнил момент, который мог лишить «Манчестер Сити» победы в Лиге чемпионов. Главный тренер «Манчестер Сити» упомянул результаты своей команды в Лиге чемпионов, призывая дать его коллеге из «Барселоны» Хави больше времени. «Дайте Хави немного времени, нам потребовалось 8 лет, чтобы выиграть Лигу чемпионов. Я чемпион Европы, потому что нападающий не забил головой с трех метров», – сказал Гвардиола. «Сити» одержал победу над «Интером» в финале Лиги чемпионов со счетом 1:0. В концовке матча форвард итальянцев Ромелу Лукаку не воспользовался возможностью сравнять счет – Эдерсон отбил мяч после удара бельгийца головой.",
    image: "4PostPic",
    likes: 3235,
    views: 34555)


public var postArray = [onePost, twoPost, threePost, fourPost]
