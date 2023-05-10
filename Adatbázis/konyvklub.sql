-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: konyvklub
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `username` varchar(32) NOT NULL,
  `pwd` varchar(128) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES ('Trepy','$2y$10$hVOehZ.qJX4UETX8s0WvVOmgF/AirniBxfZYUqneVl/Q061EXIif6'),('Viki','$2y$10$TKGQ4aw/j7HAUT.9Mtmmw.T.D3y5G7GLqm3tt7xUUm3/ST7wYJaoS');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `isbn` varchar(16) NOT NULL,
  `title` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `category` varchar(32) NOT NULL,
  `price` int NOT NULL,
  `stock` int NOT NULL,
  `ordered` int NOT NULL,
  `image` varchar(128) NOT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('9786150080666','Harckészültség','Tom Clancy','Tom Clancy magyarul most először kiadott regényében a Kínai Népköztársaság hosszú évtizedeken át regnáló vezetőjének halála utáni hatalmi zűrzavarban a kínai hadsereg elfoglal egy vitatott hovatartozású ázsiai szigetcsoportot, melynek térségében gazdag olajlelőhelyeket sejtenek.','krimi',4290,20,0,'clancy-harckeszultseg.jpg'),('9786150165912','Boron innen és túl','Varga Péter','A kis pincészetek jelentős részben személyesen ismerik azokat az embereket, akiknek a boraikat készítik. A mi fogyasztóink száma egymillió is lehet, a vakvilágba küldözgetjük a borospalackjainkat és most utánaküldünk egy könyvet is. Találkozik-e majd a bor és az írás? Lesznek-e olyanok, akik úgy olvassák a könyvet, hogy nem kóstolták soha a borainkat, vagy azt se tudják, mi az, hogy Varga Pincészet? Biztosan, de nem ez lesz a jellemző. Ezzel a könyvvel elsősorban azokat akarjuk elérni, akik szeretik a borainkat és ezen keresztül talán egy kicsit minket is (József Attila jut eszembe: ,,Csak az olvassa versemet, ki ismer engem és szeret.\") és ezért van hozzá indíttatásuk, hogy többet tudjanak meg rólunk.','gasztronómia',3420,18,0,'varga-boron_innen.jpg'),('9786155514333','A marsi','Andy Weir','\"Hat nappal ezelőtt Mark Watney az elsők között érkezett a Marsra. Most úgy fest, hogy ő lesz az első ember, aki ott is hal meg.Miután csaknem végez vele egy porvihar, ami evakuációra kényszeríti az őt halottnak gondoló társait, Mark a Marson ragad. Még arra is képtelen, hogy üzenetet küldjön a Földre, és tudassa a világgal, hogy életben van de még ha üzenhetne is, a készletei elfogynának, mielőtt egy mentőakció a segítségére siethetne.Bár valószínűleg úgysem lesz ideje éhen halni. Sokkal valószínűbb, hogy még azelőtt vesztét okozzák a sérült berendezések, a könyörtelen környezet vagy egyszerűen csak a jó öreg emberi tényező.De Mark nem hajlandó feladni. Találékonyságát, mérnöki képességeit és az élethez való hajthatatlan, makacs ragaszkodását latba vetve, rendíthetetlenül állja a sarat a számtalan leküzdhetetlennek tűnő akadállyal szemben. Vajon elegendőnek bizonyul-e leleményessége a lehetetlen véghezviteléhez?\"','sci-fi',4240,16,4,'weir-a_marsi.jpg'),('9786156471062','Az eltűnt remény nyomában','Dr. Bagdy Emőke','Jó ideje szinte egyik krízisből esünk át a másikba. A világban súlyos, életfenyegető dolgok történnek, és mindnyájan a bizonytalanság alapélményét éljük át. Mint amikor egy hullámvasút utasának kinyíló táskájából szerte szóródnak az értékei, és ő azok után kapva vissza akarja nyerni, ami széthullott, ami fontos. Keressük tetteink célját, értelmét. Miben bízzunk? Hol itt a segítség? Hol van a remény?','életmód',3290,9,1,'bagdy-az_eltunt_remeny_nyomaban.jpg'),('9786158031264','Késtél','Leiner Laura','Budai Rebeka élete tizenhat évesen fenekestül felfordult, amikor posztolt a barátja falára egy szemrehányó, egy szál gitáros dalt, a Késtélt. Azóta ő Bexi, aki immár a második lemezén dolgozik, a dal ugyanis óriási sláger lett és országos hírnevet hozott számára. Körte, a tetoválóművészből avanzsált menedzser épp egy tévés fellépést szervezett le a Pop/Rock sztár leszek! döntőjébe, ahol Beki a legesélyesebb versenyző duettpartnere lesz.','ifjúsági',4370,10,0,'leiner-kestel.jpg'),('9789630791397','Metró 2033','Dmitry Glukhovsky','\"2033.Az egész világ romokban hever.Az emberiség majdnem teljesen elpusztult.Moszkva szellemvárossá változott, megmérgezte a radioaktív sugárzás, és szörnyek népesítik be. A kevés életben maradt ember a moszkvai metróban bújik meg - a föld legnagyobb atombombabiztos óvóhelyén. A metró állomásai most városállamok, az alagutakban sötétség honol és borzalom fészkel.Artyomnak az egész metróhálózaton át kell jutnia, hogy megmentse a szörnyű veszedelemtől az állomását, sőt talán az egész emberiséget.\"','sci-fi',3390,15,0,'dmitry-meto_2033.jpg'),('9789630794688','A remény rabjai','Stephen King','\"Mit tehet a fogoly, ha életfogytiglanra ítélték? Ha senki nem hiszi el, hogy ártatlan? Miben bízzon? A kegyelemben? A szökésben? Megannyi kérdés, amelyre King letehetetlen könyvének végén, de csakis a legvégén kapjuk meg a feleletet. Rabokról szól a második kisregény is - sorsának foglya a náci háborús bűnös, meg az újságkihordó gyerek, aki valahogy kiszagol valamit\"\" Az Állj ki mellettem! -ben sem marad az olvasó borzalmak nélkül - gyerekek nyomoznak eltűnt társuk után\"\" A légzőgyakorlat klasszikus krimi: karácsony előestéjén öregurak hátborzongató történetekkel szórakoztatják egymást. A kisregények javát a moziból ismerheti az olvasó.\"','krimi',3740,14,0,'king-a_remeny_rabjai.jpg'),('9789631364910','Sörivók zsebkönyve','Ellen Goldstein','Ebben a kicsi, sörálló zsebkönyvben mindent megtalálsz, amit a sörről tudni érdemes! Hogyan készül? Milyen fajtái vannak? Hogyan kell jól csapolni? Melyik évszakban mit igyunk? Hova érdemes elzarándokolni? Mik a legjobb fesztiválok? Melyik ételhez milyet igyunk? Ebben a kicsi,a sörről tudni érdemes! ...és még sok fontos adat, érdekesség, őrültség, extrák! Egészségedre!','gasztronómia',2840,14,0,'goldstein-sorivok_zsebkonyve.jpg'),('9789631367270','Teaivók zsebkönyve','Candace Rose Rardon','Kuckózz be otthon egy csésze teával, és vedd kezedbe ezt a hasznos kis könyvet! A teák nem csak színes dobozok az élelmiszerbolt polcain: érdemes többet tudni róluk, és lehetőleg megkóstolni minél több félét. Ez a zsebkönyv méretű kalauz sok érdekességet, útmutatást, ötletet és alapvető ismeretet kínál a tea kedvelőinek. A rutinosak és a kezdők számára egyaránt jól jöhetnek az efféle hasznos tudnivalók: Filteres vagy szálas teát válasszunk? Milyen a teacserje felépítése? Melyek a teacsaládok és a leggyakoribb változatok? Milyen teáskannák vannak, és hogy kell őket használni? Melyek a teához kötődő hagyományok a világ minden tájáról? A kötet illusztrált útmutató, amely megismertet a teázás művészetével, ötleteket ad a teakóstoláshoz, a teazsúrok rendezéséhez - csupa hasznos és érdekes infóval van tele!','gasztronómia',2840,12,0,'rardon-teaivok_zsebkonyve.jpg'),('9789634061625','Rendíthetetlen','Jack Campbell','\"A Szövetség már egy évszázada vívja háborúját a Szindikátus Világokkal szemben, ám most vesztésre áll, flottája csapdába esett az ellenséges terület szívében. Egyedül abban a legendás kapitányban bízhat, aki évszázados hibernációból ébredt fel, hogy a flotta élére álljon.Jack Geary kapitány hőstetteit minden iskolás ismeri, ő azonban nehezen birkózik meg a lehetetlen elvárásokkal, amiket saját hírneve támaszt vele szemben. Hiába taszítja a hőskultusz, magára vállalja a feladatot, hogy a megvert szövetségi flottát és a háború sorsát eldönteni képes hiperhálókulcsot hazajuttassa. Ehhez azonban fel kell nőnie „Black Jack” Geary legendájához.\"','sci-fi',2849,12,0,'campbell-rendithetetlen.jpg'),('9789634068778','Én, a robot','Isaac Asimov','\"A robotika három törvénye: 1. A robotnak nem szabad kárt okoznia emberi lényben vagy tétlenül tűrnie, hogy emberi lény bármilyen kárt szenvedjen. 2. A robot engedelmeskedni tartozik az emberi lények utasításainak, kivéve, ha ezek az utasítások az első törvény előírásaiba ütköznének.3. A robot tartozik saját védelméről gondoskodni, amennyiben ez nem ütközik az első és második törvény előírásaiba.Ezzel a három egyszerű szabállyal Asimov mindörökre megváltoztatta a robotokról alkotott képünket. A sci-fi egyik megkerülhetetlen klasszikusának számító Én, a robot összekapcsolódó történetek füzérében mutatja be a robotok útját a primitív kezdetektől kezdve a nem is olyan távoli jövő tökéletességéig – ahol már jóformán az emberiségre sincsen szükség.\"','sci-fi',2550,15,0,'asimov-en_a_robot.jpg'),('9789634069300','Vaják','Andrzej Sapkowski','\"Ríviai Geralt, a vaják, egyike azoknak, akik képesek legyőzni az embereket fenyegető szörnyetegeket. Feladatában varázsjelek, főzetek és a vajákok büszkesége segíti – valamint egy acél és egy ezüst kard.Amikor egyik megbízatása balul sül el, Geralt elveszíti kardjait. Vissza kell szereznie a különleges fegyvereket, mert boszorkánymesterek szőnek ellene ármányokat, és az egész világban sötét fellegek gyülekeznek.Közeleg a vihar…\"','kaland',3390,15,0,'andrzej-vajak.jpg'),('9789634476054','Bábel','Frei Tamás','\"Frei Tamás a színfalak mögé viszi az olvasót, megmutatja, hogy milyen hatalmi manőverek révén ragadhatja magához egy kellően gátlástalan politikus egy ország irányítását, és miféle cinizmus kell ahhoz, hogy a nyugati világ legbefolyásosabb emberei véres műkincsekkel teli luxusvilláikból finanszírozzák az iszlám terrorizmust.A háttérben pedig Magyarországon futnak össze a szálak, ahol mindenre találni megoldást...\"','krimi',3995,15,0,'frei-babel.jpg'),('9789634476979','Torta és karamell','Lengyel József','Lengyel József még cukrásztanoncként készítette el élete első esküvői tortáját. Az azóta eltelt bő két évtizedben rengeteg minden változott körülötte: az ország egyik legnépszerűbb cukrászává vált, több tízezren követik az interneten, az általa alapított Torta és Karamell pedig már fogalommá vált. Ám a lényeg változatlan: szeretet és személyesség. Ennyi a titok, hiszen filozófiája szerint a cukrászmesterség nem boszorkányság, nem kellenek hozzá nagy dolgok, csupán tehetség, szorgalom és alázat. Ebből a gyönyörű kötetből megtudhatjuk, hogyan vált a rosszul sikerült süteményeit kezdetben édesanyja elől a szekrénybe rejtő kisfiúból Magyarország egyik legkeresettebb esküvőitorta-készítője, mi hajtja az átdolgozott estéken és hétvégéken át, és a kulisszák mögé is bepillanthatunk: hogyan születik meg egy mulandóságában tökéletes tortaköltemény, mennyi munka és stressz rejlik az egész vendégsereget lenyűgöző alkotás mögött. Ráadásként megható, mulatságos és néha rémisztő esküvői történeteket olvashatunk, továbbá Lengyel József kedvenc receptjeit is megosztja velünk. Az ízletes végeredményről pedig a mindenkori cukrász gondoskodik. Ahogy a mester mondja, a dolog egyszerű: \"Az ember belesüti a szeretetét a finomságokba, amitől varázslatosak lesznek.','gasztronómia',6175,10,0,'lengyel-torta_es_karamell.jpg'),('9789634574590','Outlander','Diana Gabaldon','Felülmúlhatatlan történetszövés, feledhetetlen jellemrajzok, részletes történelmi háttér - Diana Gabaldon munkájában mindez megtalálható. Ez a regénysorozata nem csak New York Times Bestseller lett, de a kritikusok javának elismerését is elnyerte amellett, hogy olvasók millióit ejtette rabul. Az első kötetben, amelyben minden elkezdődik, két kiemelkedő karaktert ismerünk meg, Claire Randallt és Jamie Frasert ebben a szenvedélyes, történelmi háttérrel átitatott regényben, amiben a kaland a kortalan szerelemmel párosul...','kaland',5590,10,0,'diana-outlander.jpg'),('9789634862918','A két Lotti','Erich Kästner','A gyermekregény címszereplője két kislány, akik a megtévesztésig hasonlítanak egymásra. Ez a tény nem kis zavart okoz a történetbeli Bühl-tavi üdülő tanárai és diákjai és a nyaraló gyerekek körében, ahova a két új vendég megérkezik. A feltűnő hasonlóság titka az, hogy Luise és Lotte ikertestvérek. De ezt hogyan is gyanítaná a szigorú Ulrike kisasszony és a többi gyerek, ha a két bájos kislány sem tud róla. A szüleik elváltak és a gyermekeiken megosztoztak. Természetesen a feltűnő hasonlóság titkát nem csupán a tábor lakói nyomozzák. Az ikerpár elhatározza, hogy összebékítik szüleiket, erre a célra legalkalmasabbnak a szerepcsere ígérkezik. Ilyen megfontolások után Lotte érkezik meg Bécsbe a karmester papához, Luise pedig Münchenbe, édesanyjához... A könnyes-vidám történet évtizedek óta a gyermekirodalom sikerkönyvei között szerepel. Kästner romantikus meséjében kaland és líra ötvöződik, a 8-10 éves gyermekolvasóknak - elsősorban kislányoknak - igényes időtöltést kínálva.','ifjúsági',2850,5,0,'kastner-a_ket_lotti.jpg'),('9789634865261','Szeleburdi család','Bálint Ágnes','\"Megbeszéltük a Radóval, hogy naplót fogunk írni, és majd ha öregek leszünk, jót derülünk rajta\" - így kezdi naplóját a tizenkét éves Laci, becsületesen bevallva, hogy a \"derülünk\" szót Radótól gyűjtötte, akinek nyelvész a papája, s ezért igen gazdag a szókincse. Laci hűségesen beszámol a kis lakásban élő háromgyermekes Faragó család eseménydús hétköznapjairól, és közben maga is sokat tesz azért, hogy ezek a hétköznapok minél mozgalmasabbak legyenek. Az olvasó - akinek szerencsére nem kell öregkoráig várnia, hogy Laci naplóján jót derüljön - biztosan a szívébe zárja ezt a vidám, szeleburdi családot, amely kissé zsúfolt lakásába örömmel fogad be minden új jövevényt, legyen az aranyhörcsög, cincér vagy lopótök. A kötet a szerző saját rajzaival jelenik meg, a borítót Ritter Ottó tervezte.','ifjúsági',2370,25,0,'balint-szeleburdi_csalad.jpg'),('9789635045860','Később','Stephen King','\"Az egyedülálló anya gyermeke, Jamie Conklin csak hétköznapi gyerekkorra vágyik. Jamie azonban nem mindennapi srác. Látja, amit más nem láthat, és megtudhatja azt, amit más nem. Anyja arra buzdítja a természetfeletti erővel született fiát, hogy tartsa titokban a képességét. De amikor a New York-i rendőrség egyik problémás nyomozója bevonja Jamie-t egy sorozatgyilkos üldözésébe, aki a síron túlról is robbantással fenyegetőzik, a fiú szembesül azzal, milyen súlyos árat is kell fizetnie, és kénytelen szembeszállni a gonosz minden formájával.A Később, akárcsak a Joyland és A coloradói kölyök, a Hard Case Crime sorozat bűnügyi történeteiben jelent meg, és jól bizonyítja, hogy King a kisprózának is igazi nagymestere. A kisregény megható felnövéstörténet, lebilincselő krimi és kísértethistória egyszerre, félelmetes és izgalmas mese az elveszett ártatlanságról és a megpróbáltatásokról, mikor jó és rossz között kell választanunk.\"','krimi',3400,15,0,'king-kesobb.jpg'),('9789635096787','Féyn','Szendrői Csaba','Szendrői Csaba, dalszövegíró, az Elefánt együttes frontembere. Költő. Bizonyíték erre harmadik kötete, amely ízig-vérig költészet. Verseiben sajátos fénytörésben, (ál)naív iróniával, néhol intelligens humorral beszél az élet abszurditásairól, a versírásról, isten-ember kapcsolatról vagy a halál botrányáról. Egyszóval mindenről, ami lényeges. Nem csak rajongóknak!','irodalom',4690,20,0,'szendroi-feyn.jpg'),('9789635181155','Gondoskodás','Závada Péter','\"Templombelső, sportpálya, recepcióspult és \"\"vállalkozózöld\"\" kanapék. Ahogy az ember a hangulatok zegzugaiban létezik. Závada Péter új kötetében különös sétát tehetünk az urbánus közegekből és a tág bioszférából felépített költői világban, ahol kafkai szimbólumok elevenednek meg újra, és a történelem romjai, mint fenyegető allegóriák, magasodnak. Elénk kerülnek a hatalom emlékei, a bástyák és az erődök, de az olvasó részt vehet a nyárzáró banketten is. A természeti, építészeti és technikai objektumok furcsa sokfélesége rendre a \"\"hol vagyunk\"\" kérdését teszi fel, mitől vonzóbb itt, mint ott, mit jelent az \"\"őszintébb pazarlás\"\" eleganciája. Sajátos optikai utazást teszünk Grönlandon, vagy csak sodródunk a folyón a vidrákkal. Olykor pedig jó megállnunk bárhol, mert a fogalmak széttöredezve várakoznak.\"','irodalom',1899,15,0,'zavada-gondoskodas.jpg'),('9789635182336','Ahol megszakad','Závada Péter','A Moszkva tér kocsmáitól a népligeti fákig, az Oktogon hajszalonjaitól a Bartók Béla úti mecsetig sokféle tájat bejárnak Závada Péter versei, akit legtöbben a kortárs underground kultikus zenekara, az Akkezdet Phiai tagjaként ismernek, ám a dalszövegei mellett évek óta publikál rangos irodalmi folyóiratokban is. Első verseskötetében a budapesti betonrengeteg zabolátlan nyelve és a magyar költészet legjobb hagyományai találkoznak, ahol a szerelmi fájdalom épp olyan jól megfér a bódult körúti hajnalokkal, mint a családi történelemmel való viaskodás a felszabadult rímjátékokkal.','irodalom',1899,10,2,'zavada-ahol_megszakad.jpg'),('9789635182350','Polaroidok','Simon Márton','Simon Márton új verseskötete a nagyvárosi szorongás szótára. Szélesvásznú történeteket mesél el néhány szóban vagy egy-egy mondatban, a félig kihunyt fényreklámok tömörségével. Baltával és körömollóval esik neki a nyelvnek, mintha mindig azt az egyetlen elrugaszkodási pontot keresné, ahol költészet és valóság egymásba zuhan. De miután megtalálta és megmutatta nekünk, udvariasan hátralép, és csak annyit mond: Uram, íme, a szakadék, amit rendelt.','irodalom',1899,20,0,'simon-polaroidok.jpg'),('9789635183029','Most vagyok soha','Kemény Zsófi','Kemény Zsófi versei kétféle akaratról beszélnek: függetlenedni és elszakadni - és közben valahogy mégis egymásba kapaszkodni, amikor elkerülhetetlenül megérkezik az ár. Hogy szívünkben ugyan megül a penész, de azért úton vagyunk, jövünk. Könnyezve-kacagva lépkedünk az emelkedő vízben. Hogy lehetséges legyen az őszinteség, újra és újra ki kell szolgáltatnunk magunkat, a csalódások árán és a kudarcok ellenére is. Vakon és süketen tapogatózunk a másik után - ez maga a remény. De számíthatunk-e egymásra, mielőtt végleg elmossa az idő az utolsó esélyeket? Kemény Zsófi második verseskötete: a tehetetlenségből kinyújtott kéz.','irodalom',2390,9,1,'kemeny-most_vagyok-soha.jpg'),('9789635289981','A Titok','Rhona Byrne','A Nagy Titok töredékei eddig is fellelhetők voltak szájhagyomány útján fennmaradt bölcsességekben, irodalmi művekben, különböző vallásos és filozófiai szövegekben. A darabkák azonban most először állnak össze teljes kinyilatkoztatássá, mely képes megváltoztatni mindazok életét, akik kapcsolatba kerülnek vele. Ez a könyv megmutatja, hogyan használhatod a Titkot életed minden területén - legyen szó pénzről, egészségről, kapcsolatokról, vagy a boldogságról úgy általában. Segítségével felfedezhetsz egy benned rejlő, kiaknázatlan erőforrást, amely képes megszépíteni az életedet. A könyv lapjain mai tanítómesterek szólalnak meg, akik már megtapasztalták ezt az erőt. Ők a Titok által megszabadultak betegségeiktől, mesés vagyonra tettek szert, legyőzték az előttük tornyosuló akadályokat, és olyan dolgokra voltak képesek, amelyeket a legtöbb ember lehetetlennek gondol.','életmód',5690,12,0,'rhona-a_titok.jpg'),('9789635660933','Az elveszett jelkép','Dan Brown','\"Robert Langdont, a Harvard szimbólumkutatóját az utolsó percben kérik fel egy esti előadásra a washingtoni Capitolium épületében. Közvetlenül megérkezése után azonban egy hátborzongató szimbólumokkal rejtjelezett, nyugtalanító tárgyat fedeznek fel a Rotunda kellős közepén. Langdon egy ősi meghívót közvetít benne, amely a titkos ezoterikus bölcsesség rég letűnt világába invitálja megfejtőjét.Amikor brutálisan elrabolják Peter Solomont, a híres filantrópot és szabadkőművest, Langdon nagyra becsült mentorát, a professzor ráébred, hogy csak úgy mentheti meg barátja életét, ha elfogadja a rejtélyes meghívást és követi az utat, akárhova vezessen is.Langdon gyorsan ott találja magát Amerika legnagyobb hatalmi központjának színfalai mögött, a város láthatatlan termeiben, templomaiban, alagútjaiban. Ami mindeddig ismerős volt, az most átváltozik egy mesterien elleplezett múlt titokzatos, félhomályos világává, amelyben szabadkőműves rejtélyek és sosem látott felfedezések vezetik őt az egyetlen lehetséges és felfoghatatlan igazsághoz.\"','krimi',5090,10,0,'brown-az_elveszett_jelkep.jpg'),('9789635663491','Dűne','Frank Herbert','Az univerzum legfontosabb terméke a fűszer, amely meghosszabbítja az életet, lehetővé teszi az űrutazást, és élő számítógépet csinál az emberből. Az emberlakta világokat uraló Impériumban azé a hatalom, aki a fűszert birtokolja. A Padisah Császár, a bolygókat uraló Nagy Házak, az Űrliga és a titokzatos rend, a Bene Gesserit kényes hatalmi egyensúlyának, a civilizáció egészének záloga, hogy a fűszerből nem lehet hiány. Ám ez az anyag csak egy helyen található, a sivatagos, kegyetlen Arrakison, amelyet lakói, a vad fremenek csak úgy ismernek: Dűne.','sci-fi',5090,12,0,'herbert-dune.jpg'),('9789635663774','Tönkretett figyelem','Johann Hari','\"Sokunkhoz hasonlóan az újságíró Johann Hari is kénytelen volt belátni, hogy napjai nagy részében felváltva bámul különböző képernyőket, és képtelen rendesen koncentrálni. Miután nem sikerült megoldania a problémát, járni kezdte a világot, hogy aztán három éven át beszélgessen az emberi figyelemről különböző szakértőkkel. Utazása során arra jutott, hogy téves feltételezésekkel éltünk erről a válságról. Könyvében bemutatja többek között a Szilícium-völgy néhány kiugrott fejlesztőjét, akik megtanulták meghackelni az emberek koncentrációját. egy Rio de Janeiró-i nyomornegyedet, ahol az emberek egészen szürreális módon veszítették el a tisztánlátásukat, és egy új-zélandi irodát, ahol rendhagyó megoldással állították helyre a dolgozók termelékenységét. Hari az álmodozás lehetőségének eltűnésétől kezdve a technológia uralmán át a fokozódó környezetszennyezésig tizenkét tényezőt azonosít be, amelyek felelőssé tehetőek figyelmünk romlásáért. Ugyanakkor azt is világossá teszi, hogy egyénekként és társadalomként is tehetünk lépéseket a probléma enyhítése érdekében.\"','életmód',4290,15,0,'johann-tonkretett_figyelem.jpg'),('9789635720873','Normális vagy','Dr. Máté Gábor - Máté Dániel','A test lázadása világhírű szerzője eddigi legátfogóbb és legteljesebb könyvében a betegségek valódi okait kutatja, miközben éles kritikát fogalmaz meg a minket körülvevő mérgező világról, valamint utat mutat az egészség és a gyógyulás felé.','életmód',5590,11,4,'mate-normalis_vagy.jpg'),('9789635873760','Bot Benő','Julia Donaldson','Bot Benő egy bot-apuka vicces és megható története: szegény Bot Benő csak futni indult, de folyton bajba keveredik: hol egy kutyának dobálják, hol zászlórúdnak használják homokvárhoz, hol meg pecabotnak. Senki nem érti, hogy ő nem egy egyszerű bot, hanem Bot Benő, komoly háromgyerekes családfő, akinek haza kell jutnia. Még szerencse, hogy előbb Benő menti meg a Mikulást, majd a Mikulás őt - azzal, hogy hazaviszi a gyerekeinek, akiknek a visszakapott apuka a legeslegjobb karácsonyi ajándék!','ifjúsági',2840,15,0,'donaldson-bot_beno.jpg'),('9789635990108','Vidrahold','Susanna Bailey','Luke utálja az életét. Apja csak az új családjával törődik, anyja pedig elhozta őt a nyári szünetre erre az isten háta mögötti skót szigetre, ahol nincs is nyár. A helyiek szóba sem állnak vele, térerő nincs, internet csak elvétve. Luke magányos és iszonyú dühös. Aztán egy nap találkozik Meggel, aki nagyapjával él egy csónakházban. Az öreg furcsa, ijesztő történeteket mesél, de hát ezek a skót szigetek tele vannak legendákkal. Amikor a gyerekek megmentenek egy elárvult kis vidrát, és Luke kezdi úgy érezni, hogy az élet nem is olyan pocsék, furcsa és ijesztő kérdések merülnek fel benne. Lehet, hogy amit legendának vélt, nem is az? Lehet, hogy az öböl tényleg veszélyeket rejt? Lehet, hogy épp őrá leselkedik veszély? És egyáltalán, mi az a VIDRAHOLD?!','ifjúsági',2990,14,0,'bailey-vidrahold.jpg'),('9789636040284','A csend ereje','Sylvia Löhken','DR. SYLVIA LÖHKEN nyelvész, kommunikációs szakértő és coach. A Libri Kiadó gondozásában megjelent, A csend ereje és A csend öröme című sikerkönyveinek témája, hogy miként alakíthatjuk legjobban az életünket a személyiségünknek megfelelően.','életmód',3570,9,6,'sylvia-a_csend_ereje.jpg'),('9789636142162','A kenyér lelke','Vajda József','\"Meg kell adni az időt a kenyérnek\" - mondja Vajda József, és éppen így adja meg az időt a szavainak is. Ahhoz, hogy a kenyérsütés roppant egyszerűnek látszó folyamatát lépésenként megmutathassuk, nem elegendőek a receptek. Van ott valami más is, ami nem adja könnyen magát, és amiért a könyv címe A kenyér lelke lett. Józsi bármennyit tud beszélni a kenyérről, de közben mindig többről és másról is beszél. A teremtésről, a természetről, a tiszta alapanyagokról, a kísérletezésről önmagunkkal, a határaink feszegetéséről és átlépéséről. Így lett ez a könyv nemcsak gazdag receptgyűjtemény, hanem a Földről és a bennünket körülvevő világról szóló beszélgetés is, amelybe most az olvasók is bekapcsolódhatnak.','gasztronómia',7590,7,7,'vajda-a_kenyer_lelke.jpg'),('9789636357559','Az utolsó hvárezmi nyár','Lőrincz L. László','A hvárezmi birodalom Ázsia leghatalmasabb államainak egyike volt, és az az erő döntötte porba, amely csaknem elpusztította Magyarországot is: a mongol hódítás. Mielőtt azonban összeomlott volna, akaratlanul is vendégül látta az ősellenség uralkodójának, Dzsingisz kánnak az unokáját, Kubilájt. Az ifjú herceg természetesen rangrejtve került Hodzsend falai alá, kalandos menekülés közben, emlékezetkihagyással küszködve. Ott azonban emberségesen bántak vele, és ő beleszeretett Dzsindzsübe, a kedves turki leányba. Kubiláj, a később hatalmas és legendás birodalmat építő mongol nagykán és kínai császár életre szóló élményre tett szert a békés földművelők között.','kaland',3420,14,1,'lorincz-az_utolos_hvarezmi_nyar.jpg'),('9789636357986','A jakfarkas zászló','Leslie L. Lawrence','LESLIE L. LAWRENCE-nek Nepálba kell utaznia, pedig nem szeretne. Karen-Marie halottat talál a szekrényében. Mary-Lounak nem sikerül fürdőkádba fojtania Philippa nénit. Namgyaldempa főláma jakvaj híján pocsék teát készít. Denis rinpócse holdas éjszakákon a kolostor tetején mászkál. Sullivan doktor egyre az orvosi táskáját keresi, pedig ott lapul a hóna alatt. Rogmo memszáhib kissé büdös ugyan, de azért befekszik hősünk ágyába. és még mindig nem derül ki, hogy hol is rejtőzik a titokzatos csingaszkangter. LESLIE L. LAWRENCE erőfeszítései nyomán aztán újabb halottak bukkannak elő. Namgyaldempa főláma cédulákat ragaszt a nagy imahengerekre, a közeli barlangban megtörténik a nagy leszámolás: fény derül a jakfarkas zászló titkára.','kaland',3650,10,10,'leslie-a_jakfarkas_zaszlo.jpg'),('9789636358150','Bolondok kolostora','Leslie L. Lawrence','LESLIE L. LAWRENCE legújabb regénye is letehetetlen olvasmány, kellemes órákat ígér a kolostorok titokzatos világát és az izgalmat kedvelő olvasónak.','kaland',4390,12,0,'leslie-bolondok_kolostora.jpg');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `email` varchar(64) NOT NULL,
  `isbn` varchar(16) NOT NULL,
  `quantity` int NOT NULL,
  KEY `email` (`email`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('ta@trepy.hu','9789634862918',1),('ta@trepy.hu','9789636040284',1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderedbooks`
--

DROP TABLE IF EXISTS `orderedbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderedbooks` (
  `orderID` varchar(64) NOT NULL,
  `isbn` varchar(16) NOT NULL,
  `quantity` int NOT NULL,
  KEY `orderID` (`orderID`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `orderedbooks_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`),
  CONSTRAINT `orderedbooks_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderedbooks`
--

LOCK TABLES `orderedbooks` WRITE;
/*!40000 ALTER TABLE `orderedbooks` DISABLE KEYS */;
INSERT INTO `orderedbooks` VALUES ('TA-20230508003239','9789636357986',4),('TA-20230508003239','9789636142162',2),('TA-20230508003239','9789636040284',1),('VIKTORIANAGY77728-20230508220719','9789636040284',1),('VIKTORIANAGY77728-20230508220719','9789636357986',1),('VIKTORIANAGY77728-20230508220719','9789636142162',3),('VIKTORIANAGY77728-20230509001940','9789636040284',1),('VIKTORIANAGY77728-20230509001940','9786156471062',1),('VIKTORIANAGY77728-20230509001940','9789635183029',1),('VIKTORIANAGY77728-20230509001940','9789635720873',4);
/*!40000 ALTER TABLE `orderedbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderID` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(64) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `email` (`email`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('TA-20230508003239','ta@trepy.hu','2023-05-08 00:32:00','Feldolgozás alatt'),('VIKTORIANAGY77728-20230508220719','viktorianagy77728@gmail.com','2023-05-08 22:07:00','Feldolgozás alatt'),('VIKTORIANAGY77728-20230509001940','viktorianagy77728@gmail.com','2023-05-09 00:19:00','Feldolgozás alatt');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `token` varchar(128) NOT NULL,
  `email` varchar(64) NOT NULL,
  `expire` date NOT NULL,
  PRIMARY KEY (`token`),
  KEY `email` (`email`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES ('viktorianagy77728_aibgcFdVewfYgHhKihjhk6lQmKnUohpXqHrssDthuXvyw2xhyxzWAvBEChD3EuFz','viktorianagy77728@gmail.com','2023-05-08');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `email` varchar(64) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `address` varchar(128) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `pwd` varchar(128) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('ta@trepy.hu','Trepák','Attila','2235 Mende, Andrássy utca 1','06704234569','$2y$10$TaByXeX.4j3d.7/MTCI2Q.scAifSlqhAEN/hy.KowZhll5AHMAeme'),('viktorianagy77728@gmail.com','Nagy','Viktória','2230 Gyömrő, Andrássy utca 1','06701234567','$2y$10$S7T3t/lmWjI.WTB350TNa.ETNtkcpWnS/ar0j5wZwZilM/aMFZ0cW');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-09 20:26:30
