-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2019 at 08:38 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_maisha`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `cbxpersdeces`
-- (See below for the actual view)
--
CREATE TABLE `cbxpersdeces` (
`id_pers` int(11)
,`nom_pers` varchar(50)
,`postnom_pers` varchar(50)
,`prenom_pers` varchar(50)
,`sexe_pers` varchar(50)
,`pere_pers` varchar(50)
,`mere_pers` varchar(50)
,`adresse_pers` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cbxpersnaiss`
-- (See below for the actual view)
--
CREATE TABLE `cbxpersnaiss` (
`id_pers` int(11)
,`nom_pers` varchar(50)
,`postnom_pers` varchar(50)
,`prenom_pers` varchar(50)
,`sexe_pers` varchar(50)
,`pere_pers` varchar(50)
,`mere_pers` varchar(50)
,`adresse_pers` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `deces_mineur`
-- (See below for the actual view)
--
CREATE TABLE `deces_mineur` (
`nbre_deces` bigint(21)
,`date_dec` date
);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `passuser` varchar(50) NOT NULL,
  `privilegeuser` varchar(50) NOT NULL DEFAULT 'User',
  `photouser` varchar(50) NOT NULL DEFAULT '567fa16c31ccb.jpg',
  `dateuser` int(11) DEFAULT NULL,
  `sexeuser` varchar(10) NOT NULL DEFAULT 'M',
  `date_naiss_user` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `passuser`, `privilegeuser`, `photouser`, `dateuser`, `sexeuser`, `date_naiss_user`) VALUES
(1, 'blaise', '6a3611785d499d8821a0d9b24d464e0f', 'Doct', '5c486c4a77010.jpg', 1548250186, '', '0000-00-00'),
(2, 'isig', '7a566dac4011c3af3d60741aa07d0cab', 'User', '5c4b049ec49a9.png', 1548420254, '', '0000-00-00'),
(7, 'ciza', 'c2e25d496ec28bd5dbd8753ba49d7676', 'Doct', 'image_796130.jpg', NULL, 'M', '2019-03-21'),
(8, 'Kubuya', 'c46cc0c3496eba1ad041c3dab79d7c9a', 'Doct', 'image_860890.jpg', NULL, 'F', '1990-08-30'),
(9, 'ino', '8ba744afe510a10886736e9c7bbc496e', 'User', 'image_999890.jpg', NULL, 'M', '1945-04-10');

-- --------------------------------------------------------

--
-- Table structure for table `tcause`
--

CREATE TABLE `tcause` (
  `id_cause` int(11) NOT NULL,
  `designation_cause` text NOT NULL,
  `detail_cause` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcause`
--

INSERT INTO `tcause` (`id_cause`, `designation_cause`, `detail_cause`) VALUES
(1, 'Malaria', 'La malaria, aussi appelÃ©e paludisme, est une maladie infectieuse due non pas Ã  une bactÃ©rie ou Ã  un virus mais Ã  un parasite, le Plasmodium. Ce parasite se transmet d\'une personne Ã  l\'autre par la piqÃ»re de certaines espÃ¨ces de moustiques anophÃ¨les femelles, vecteurs de la maladie. La malaria provoque d\'importants accÃ¨s de fiÃ¨vre et peut, dans sa forme sÃ©vÃ¨re, causer la mort. Elle tue chaque annÃ©e prÃ¨s d\'un million de personnes, la plupart en Afrique subsaharienne. Les principales victimes sont les jeunes enfants et les femmes enceintes.'),
(3, 'Fievre tifoide', 'La fiÃ¨vre typhoÃ¯de (du grec tuphos, torpeur) ou typhus abdominal est une maladie infectieuse dÃ©crite en 1818 par Pierre Bretonneau, causÃ©e par une bactÃ©rie de la famille EntÃ©robactÃ©rie, du genre des salmonelles, et dont les espÃ¨ces responsables sont Salmonella enterica â€“ Typhi ou Paratyphi A, B, C. Salmonella enterica Typhi est encore appelÃ©e bacille d\'Eberth'),
(4, 'Tension', 'Lâ€™Ã©lÃ©vation de la pression artÃ©rielle systolique au cours du vieillissement sâ€™explique par la diminution de la rigiditÃ© des parois artÃ©rielles , avec augmentation du rapport collagÃ¨ne/Ã©lastine et fragmentation de lâ€™Ã©lastine,dâ€™autant plus importante quâ€™il existe une athÃ©rosclÃ©rose associÃ©e.  Lâ€™Ã©lastine confÃ¨re aux parois artÃ©rielles leur Ã©lasticitÃ© qui a pour principale propriÃ©tÃ© de diminuer le travail du cÅ“ur.  Pour que le dÃ©bit sanguin pÃ©riphÃ©rique reste identique le cÅ“ur augmente progressivement la force de ses contractions avec lâ€™Ã¢ge.'),
(5, 'DiabÃ¨te', 'Le diabÃ¨te est une maladie chronique caractÃ©risÃ©e par une dÃ©faillance du processus d\'utilisation du sucre. Le trouble est liÃ© Ã  l\'insuline, hormone sÃ©crÃ©tÃ©e par le pancrÃ©as (glande du tube digestif), dont la fonction est de permettre l\'entrÃ©e, l\'utilisation et l\'entreposage du glucose dans les cellules de l\'organisme.'),
(6, 'Sida', 'Le syndrome d\'immunodÃ©ficience acquise, plus connu sous son acronyme sida, est un ensemble de symptÃ´mes consÃ©cutifs Ã  la destruction de cellules du systÃ¨me immunitaire par le virus de l\'immunodÃ©ficience humaine (VIH). Le sida est le dernier stade de l\'infection au VIH, lorsque l\'immunodÃ©pression est sÃ©vÃ¨re.'),
(7, 'Poison', 'Les poisons sont, en biologie, des substances qui provoquent des blessures, des maladies ou la mort d\'organismes par une rÃ©action chimique, Ã  l\'Ã©chelle molÃ©culaire. Cette dÃ©finition exclut les agents physiques, mÃªme de petite taille (un caillot, une bulle d\'air dans le sang, un courant Ã©lectrique, une radiation, etc.). On diffÃ©rencie la pÃ©nÃ©tration volontaire de substances toxiques dites poisons (intoxication), de la production interne de toxines (intoxination) mais la distinction entre ces deux termes n\'est pas toujours observÃ©e, mÃªme parmi les scientifiques.');

-- --------------------------------------------------------

--
-- Table structure for table `tcommentaire`
--

CREATE TABLE `tcommentaire` (
  `id_com` int(11) NOT NULL,
  `id_cons_com` int(11) NOT NULL,
  `id_user_com` int(11) NOT NULL,
  `text_com` text NOT NULL,
  `date_com` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcommentaire`
--

INSERT INTO `tcommentaire` (`id_com`, `id_cons_com`, `id_user_com`, `text_com`, `date_com`) VALUES
(1, 1, 2, 'Merci beaucoup pour tout ca', '2019-03-11 00:00:00'),
(3, 2, 1, 'une maladie tres dangereuse', '2019-03-21 14:56:46'),
(4, 2, 8, 'Merci beaucoup pour vos conseils... ca aide beaucoup', '2019-04-09 13:32:13'),
(5, 2, 7, 'merci a vous', '2019-04-10 08:27:32'),
(6, 3, 9, 'merci beaucoup !\nvous sauvez des vies...', '2019-04-10 09:13:04'),
(8, 2, 9, 'J\'ai prÃ©venu beaucoup de gens... ', '2019-04-10 09:20:04'),
(9, 2, 7, 'gkgkfk', '2019-04-10 12:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `tconseil`
--

CREATE TABLE `tconseil` (
  `id_cons` int(11) NOT NULL,
  `id_maladie_cons` int(11) NOT NULL,
  `id_user_cons` int(11) NOT NULL,
  `apropos_cons` text NOT NULL,
  `prevention_cons` text NOT NULL,
  `traitement_cons` text NOT NULL,
  `date_cons` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `photo_cons` text NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tconseil`
--

INSERT INTO `tconseil` (`id_cons`, `id_maladie_cons`, `id_user_cons`, `apropos_cons`, `prevention_cons`, `traitement_cons`, `date_cons`, `photo_cons`, `title`) VALUES
(1, 1, 1, 'Le paludisme touche une centaine de pays dans le monde, la maladie est endÃ©mique des rÃ©gions dites intertropicales, donc situÃ©es de part et d\'autre de l\'Ã©quateur, entre le tropique du cancer et le tropique du capricorne. Le paludisme sÃ©vit dans un vaste ensemble gÃ©ographique regroupant les AmÃ©riques, une vaste zone de l\'Afrique subsaharienne, de l\'Asie et de l\'Asie du Sud-est. Le Centre pour le contrÃ´le et la prÃ©vention des maladies (agence gouvernementale amÃ©ricaine) fournit dans cette liste alphabÃ©tique des informations concernant la prÃ©sence de la malaria par pays et zones Ã  risques.', 'Il est d\'une efficacitÃ© partielle. Dans tous les cas, consulter votre mÃ©decin une dizaine de jours avant votre date de dÃ©part. Des mesures de prÃ©vention de la transmission du parasite par le moustique existent, comme par exemple des moustiquaires imprÃ©gnÃ©es d\'insecticide, des rÃ©pulsifs Ã  moustique (sur la peau), des vÃªtements couvrant la peau (le soir et la nuit). Il est Ã©galement recommandÃ© d\'Ã©viter les zones rurales. Les complications graves du paludisme ne concernent en gÃ©nÃ©ral que le parasite (Plasmodium falciparum ). L\'infection par ce parasite peut engager le pronostic vital. En cas d\'accÃ¨s de fiÃ¨vre Ã  partir du 7Ã¨me jour en zone d\'endÃ©mie et dans les mois suivant le retour, consultez le jour mÃªme un mÃ©decin.', 'Dans la mesure oÃ¹ le parasite en cause dans le paludisme a dÃ©veloppÃ© des rÃ©sistances par rapport Ã  certains traitements (ex : chloroquine ), les combinaisons Ã  base d\'artÃ©misinine (issue d\'une plante chinoise) sont le seul traitement efficace connu contre le paludisme aujourd\'hui. Elles renforcent l\'effet du traitement, et retardent Ã©galement l\'apparition de rÃ©sistances.', '2019-03-11 00:00:00', '5c4b0e5b0df01.jpeg', 'Evitons le paludisme'),
(2, 4, 1, 'Lorsque la tension artÃ©rielle est trop Ã©levÃ©e, les risques de maladies cardiovasculaires augmentent. Il est donc important de rÃ©agir sans attendre en cas de tension haute et de rechercher la cause de lâ€™hypertension.', 'La prÃ©vention passe par l\'amÃ©lioration des conditions d\'hygiÃ¨ne dans les pays d\'endÃ©mie et par la vaccination. Les visiteurs doivent se mÃ©fier de l\'eau locale et de la nourriture crue.      Il est important de respecter les mesures dâ€™hygiÃ¨ne classiques : lavage frÃ©quent des mains Ã  lâ€™eau et au savon, principalement aprÃ¨s chaque passage aux toilettes et avant toute manipulation dâ€™aliments.     Dans lâ€™entourage du malade : nÃ©cessitÃ© de dÃ©pister les porteurs sains par la pratique de coprocultures afin dâ€™Ã©viter une dissÃ©mination de lâ€™infection, principalement chez les personnes travaillant dans le secteur agroalimentaire, en collectivitÃ©s de jeunes enfants ainsi que chez le personnel soignant.     Conseils supplÃ©mentaires aux voyageurs dans des zones endÃ©miques : veiller Ã  ne consommer que des aliments cuits et de lâ€™eau minÃ©rale capsulÃ©e (dÃ©capsulÃ©e devant soi) ou de lâ€™eau prÃ©alablement bouillie ou purifiÃ©e par adjonction de pastille de chlore6.', 'Prendre un traitement quotidien contre lâ€™hypertension permet de vivre plus longtemps et sans maladies handicapantes. Il repose sur 8 Â« familles Â» de mÃ©dicaments, dont les mÃ©canismes dâ€™action ne sont pas les mÃªmes et peuvent Ãªtre complÃ©mentaires. Votre hypertension ne ressemble pas Ã  une autre et votre mÃ©decin devra peut-Ãªtre essayer plusieurs mÃ©dicaments avant de trouver le traitement qui vous convient le mieux, en termes dâ€™efficacitÃ© et de tolÃ©rance. Il sera peut-Ãªtre Ã©galement nÃ©cessaire dâ€™associer deux, voire trois mÃ©dicaments de familles diffÃ©rentes pour contrÃ´ler votre pression artÃ©rielle. Câ€™est le cas de plus de la moitiÃ© des personnes hypertendues.', '2019-03-14 04:37:58', 'imgtension.jpeg', 'Alerte maladie'),
(3, 3, 8, 'D\'aprÃ¨s l\'Organisation mondiale de la santÃ©, le nombre de patients atteints dans le monde serait de 21 millions de personnes, avec plus de 216 000 Ã  600 000 dÃ©cÃ¨s annuellement1.  De janvier Ã  septembre 2013, une augmentation marquÃ©e dans les notifications des infections Ã  Salmonella paratyphi A chez les voyageurs de retour du Cambodge s\'est produite en France. Une enquÃªte a rÃ©vÃ©lÃ© 35 cas sans source commune : 21 en France, 5 en Allemagne, 3 aux Pays-Bas, 1 en NorvÃ¨ge, 1 au Royaume-Uni, 4 en Nouvelle-ZÃ©lande', 'Le germe Ã©tait initialement sensible au chloramphÃ©nicol, mais de nombreuses rÃ©sistances apparurent dans les annÃ©es 1970, et ce traitement, aux nombreux effets secondaires, a Ã©tÃ© progressivement abandonnÃ©. De mÃªme, des rÃ©sistances Ã  d\'autres antibiotiques (co-trimoxazole et amoxicilline) sont apparues dans les annÃ©es 1980.  AprÃ¨s avoir hospitalisÃ© et isolÃ© le malade, le traitement fait appel actuellement aux fluoroquinolones de deuxiÃ¨me gÃ©nÃ©ration ou Ã  la ceftriaxone. La rÃ©hydratation, souvent par voie intraveineuse, est impÃ©rative pour compenser les pertes liquidiennes secondaires Ã  la diarrhÃ©e. Un traitement contre la fiÃ¨vre (antipyrÃ©tique) peut parfois Ãªtre nÃ©cessaire.De nombreuses souches en Inde et au Pakistan sont actuellement rÃ©sistantes aux fluoroquinolones de deuxiÃ¨me gÃ©nÃ©ration (ciprofloxacine) et Ã  la ceftriaxone. En revanche on ne connaÃ®t pas de rÃ©sistance Ã  l\'azithromycine5', 'La prÃ©vention passe par l\'amÃ©lioration des conditions d\'hygiÃ¨ne dans les pays d\'endÃ©mie et par la vaccination. Les visiteurs doivent se mÃ©fier de l\'eau locale et de la nourriture crue.      Il est important de respecter les mesures dâ€™hygiÃ¨ne classiques : lavage frÃ©quent des mains Ã  lâ€™eau et au savon, principalement aprÃ¨s chaque passage aux toilettes et avant toute manipulation dâ€™aliments.     Dans lâ€™entourage du malade : nÃ©cessitÃ© de dÃ©pister les porteurs sains par la pratique de coprocultures afin dâ€™Ã©viter une dissÃ©mination de lâ€™infection, principalement chez les personnes travaillant dans le secteur agroalimentaire, en collectivitÃ©s de jeunes enfants ainsi que chez le personnel soignant.     Conseils supplÃ©mentaires aux voyageurs dans des zones endÃ©miques : veiller Ã  ne consommer que des aliments cuits et de lâ€™eau minÃ©rale capsulÃ©e (dÃ©capsulÃ©e devant soi) ou de lâ€™eau prÃ©alablement bouillie ou purifiÃ©e par adjonction de pastille de chlore6.', '2019-03-16 04:28:21', 'IMG-20190314-WA0000.jpeg', 'la maladie typhus abdominal'),
(4, 5, 7, 'Les aliments ingÃ©rÃ©s procurent Ã  l\'organisme le glucose que les cellules utilisent comme source d\'Ã©nergie. Si l\'insuline n\'est pas disponible ou si elle n\'agit pas normalement pour permettre au glucose se trouvant dans le sang de passer dans les cellules, le glucose reste dans le sang. Un taux Ã©levÃ© de glucose sanguin est toxique; de plus, les cellules qui n\'obtiennent pas de glucose sont privÃ©es du carburant dont elles ont besoin pour fonctionner correctement.', 'Le diabÃ¨te de type 1 est une affection auto-immune. On pense que l\'association d\'une prÃ©disposition gÃ©nÃ©tique et d\'autres facteurs environnementaux (pas encore identifiÃ©s) incitent le systÃ¨me immunitaire Ã  attaquer les cellules productrices d\'insuline dans le pancrÃ©as et Ã  les dÃ©truire. Il nâ€™existe aucun moyen de prÃ©munir contre lâ€™apparition du diabÃ¨te de type 1.  Le diabÃ¨te de type 2 est causÃ© par la rÃ©sistance Ã  l\'insuline et une production insuffisante de celle-ci.', ' Le diabÃ¨te est une affection chronique qui peut durer toute la vie. L\'objectif du traitement du diabÃ¨te est de conserver les taux de glucose sanguins aussi prÃ¨s des valeurs normales que possible.  Le traitement du diabÃ¨te, plus que celui de la plupart des autres affections, demande des efforts considÃ©rables de la part de la personne qui doit le suivre. Faire face au diabÃ¨te est un dÃ©fi de toute une vie; donc, les personnes qui en sont atteintes ne devraient pas hÃ©siter Ã  en parler Ã  leur mÃ©decin ni Ã  leur pharmacien si elles se sentent dÃ©passÃ©es par la situation.', '2019-04-09 15:13:04', 'diabeteglucometre.jpg', 'Attention au Diabete');

-- --------------------------------------------------------

--
-- Table structure for table `tdeces`
--

CREATE TABLE `tdeces` (
  `id_dec` int(11) NOT NULL,
  `id_pers_dec` int(11) NOT NULL,
  `date_dec` date NOT NULL,
  `lieu_dec` varchar(50) NOT NULL,
  `age_dec` int(11) NOT NULL,
  `id_cause_dec` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tdeces`
--

INSERT INTO `tdeces` (`id_dec`, `id_pers_dec`, `date_dec`, `lieu_dec`, `age_dec`, `id_cause_dec`) VALUES
(1, 4, '2018-10-01', 'Butembo', 80, 4),
(2, 7, '2022-04-27', 'France', 75, 4),
(3, 6, '2019-02-13', 'goma', 55, 1),
(4, 7, '2019-02-11', 'bukavu', 17, 1),
(5, 8, '2019-01-09', 'Goma', 15, 3),
(6, 9, '2019-01-16', 'Goma', 17, 7),
(7, 10, '2019-02-20', 'Goma', 50, 6),
(8, 13, '2019-04-08', 'goma', 22, 5);

-- --------------------------------------------------------

--
-- Table structure for table `thopital`
--

CREATE TABLE `thopital` (
  `id_hop` int(11) NOT NULL,
  `nom_hop` varchar(50) NOT NULL,
  `adresse_hop` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thopital`
--

INSERT INTO `thopital` (`id_hop`, `nom_hop`, `adresse_hop`) VALUES
(1, 'Docs', 'Goma katindo'),
(2, 'General', 'Goma');

-- --------------------------------------------------------

--
-- Table structure for table `tnaissance`
--

CREATE TABLE `tnaissance` (
  `id_naiss` int(11) NOT NULL,
  `id_pers_naiss` int(11) NOT NULL,
  `id_hop_naiss` int(11) NOT NULL,
  `date_naiss` date NOT NULL,
  `lieu_naiss` varchar(50) NOT NULL,
  `age_mere_naiss` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tnaissance`
--

INSERT INTO `tnaissance` (`id_naiss`, `id_pers_naiss`, `id_hop_naiss`, `date_naiss`, `lieu_naiss`, `age_mere_naiss`) VALUES
(1, 2, 1, '2018-10-01', 'Goma', 30),
(2, 5, 2, '2019-01-18', 'Goma', 17),
(3, 6, 2, '2008-06-18', 'Butembo', 20);

-- --------------------------------------------------------

--
-- Table structure for table `tpersonne`
--

CREATE TABLE `tpersonne` (
  `id_pers` int(11) NOT NULL,
  `nom_pers` varchar(50) NOT NULL,
  `postnom_pers` varchar(50) NOT NULL,
  `prenom_pers` varchar(50) NOT NULL,
  `sexe_pers` varchar(50) NOT NULL,
  `pere_pers` varchar(50) NOT NULL,
  `mere_pers` varchar(50) NOT NULL,
  `adresse_pers` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tpersonne`
--

INSERT INTO `tpersonne` (`id_pers`, `nom_pers`, `postnom_pers`, `prenom_pers`, `sexe_pers`, `pere_pers`, `mere_pers`, `adresse_pers`) VALUES
(2, 'sifa', 'tavasimwa', 'rachel', 'F', 'safari', 'safari', 'goma'),
(4, 'Tshisekedi', 'Wamulumba', 'Etienne', 'M', 'Tshisekedi', 'Wawa', 'Kinshasa'),
(5, 'Jeanne', 'Masika', 'JOYCE', 'F', 'Muhindo', 'Masika', 'Goma'),
(6, 'Lucie', 'Malembe', '', 'F', 'Malembe', 'Malembe', 'goma'),
(7, 'Jean', 'Paul', 'Sartre', 'M', 'Sartos', 'FFF', 'Du Bois'),
(8, 'Kasoke', 'martha', 'Lily', 'F', 'Kasoki', 'Martine', 'Goma'),
(9, 'Abou', 'bakar', 'bak', 'M', 'abou', 'kasandra', 'Goma'),
(10, 'Gregoire', 'kaibanda', 'greg', 'M', 'Kaibanda', 'Justine', 'Rwanda'),
(11, 'Heuleur', 'Kamanda', 'Henri', 'M', 'Kamanda', 'Jeanine', 'Goma'),
(12, 'Kakule', 'Kamate', 'Jean', 'M', 'Kamate', 'masika', 'Rutshuru'),
(13, 'Masika', 'matondo', 'Aline', 'F', 'Matondo', 'Francoise', 'Beni');

-- --------------------------------------------------------

--
-- Stand-in structure for view `voir_commentaires`
-- (See below for the actual view)
--
CREATE TABLE `voir_commentaires` (
`id_com` int(11)
,`id_cons_com` int(11)
,`id_user_com` int(11)
,`text_com` text
,`date_com` datetime
,`username` varchar(50)
,`photouser` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `voir_conseils`
-- (See below for the actual view)
--
CREATE TABLE `voir_conseils` (
`username` varchar(50)
,`designation_cause` text
,`id_cons` int(11)
,`apropos_cons` text
,`prevention_cons` text
,`traitement_cons` text
,`date_cons` datetime
,`photo_cons` text
,`nbre_com` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `voir_deces`
-- (See below for the actual view)
--
CREATE TABLE `voir_deces` (
`id_dec` int(11)
,`nom_pers` varchar(50)
,`postnom_pers` varchar(50)
,`sexe_pers` varchar(50)
,`age_dec` int(11)
,`date_dec` date
,`lieu_dec` varchar(50)
,`id_pers_dec` int(11)
,`id_cause_dec` int(11)
,`id_cause` int(11)
,`designation_cause` text
,`detail_cause` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `voir_deces_maladie`
-- (See below for the actual view)
--
CREATE TABLE `voir_deces_maladie` (
`id_dec` int(11)
,`nom_pers` varchar(50)
,`postnom_pers` varchar(50)
,`sexe_pers` varchar(50)
,`age_dec` int(11)
,`date_dec` date
,`lieu_dec` varchar(50)
,`id_pers_dec` int(11)
,`id_cause_dec` int(11)
,`id_cause` int(11)
,`designation_cause` text
,`detail_cause` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `voir_maladies`
-- (See below for the actual view)
--
CREATE TABLE `voir_maladies` (
`id_cause` int(11)
,`nbre_dec` bigint(21)
,`designation_cause` text
,`detail_cause` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `voir_naissances`
-- (See below for the actual view)
--
CREATE TABLE `voir_naissances` (
`id_naiss` int(11)
,`nom_pers` varchar(50)
,`postnom_pers` varchar(50)
,`mere_pers` varchar(50)
,`pere_pers` varchar(50)
,`sexe_pers` varchar(50)
,`date_naiss` date
,`lieu_naiss` varchar(50)
,`age_mere_naiss` int(11)
,`id_pers_naiss` int(11)
,`id_hop_naiss` int(11)
,`id_hop` int(11)
,`nom_hop` varchar(50)
,`adresse_hop` text
);

-- --------------------------------------------------------

--
-- Structure for view `cbxpersdeces`
--
DROP TABLE IF EXISTS `cbxpersdeces`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cbxpersdeces`  AS  select `tpersonne`.`id_pers` AS `id_pers`,`tpersonne`.`nom_pers` AS `nom_pers`,`tpersonne`.`postnom_pers` AS `postnom_pers`,`tpersonne`.`prenom_pers` AS `prenom_pers`,`tpersonne`.`sexe_pers` AS `sexe_pers`,`tpersonne`.`pere_pers` AS `pere_pers`,`tpersonne`.`mere_pers` AS `mere_pers`,`tpersonne`.`adresse_pers` AS `adresse_pers` from `tpersonne` where (not(`tpersonne`.`id_pers` in (select `tdeces`.`id_pers_dec` from `tdeces`))) ;

-- --------------------------------------------------------

--
-- Structure for view `cbxpersnaiss`
--
DROP TABLE IF EXISTS `cbxpersnaiss`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cbxpersnaiss`  AS  select `tpersonne`.`id_pers` AS `id_pers`,`tpersonne`.`nom_pers` AS `nom_pers`,`tpersonne`.`postnom_pers` AS `postnom_pers`,`tpersonne`.`prenom_pers` AS `prenom_pers`,`tpersonne`.`sexe_pers` AS `sexe_pers`,`tpersonne`.`pere_pers` AS `pere_pers`,`tpersonne`.`mere_pers` AS `mere_pers`,`tpersonne`.`adresse_pers` AS `adresse_pers` from `tpersonne` where ((not(`tpersonne`.`id_pers` in (select `tnaissance`.`id_pers_naiss` from `tnaissance`))) and (not(`tpersonne`.`id_pers` in (select `tdeces`.`id_pers_dec` from `tdeces`)))) ;

-- --------------------------------------------------------

--
-- Structure for view `deces_mineur`
--
DROP TABLE IF EXISTS `deces_mineur`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `deces_mineur`  AS  select count(`tdeces`.`age_dec`) AS `nbre_deces`,`tdeces`.`date_dec` AS `date_dec` from `tdeces` where (`tdeces`.`age_dec` < 18) group by `tdeces`.`date_dec` ;

-- --------------------------------------------------------

--
-- Structure for view `voir_commentaires`
--
DROP TABLE IF EXISTS `voir_commentaires`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `voir_commentaires`  AS  select `tcommentaire`.`id_com` AS `id_com`,`tcommentaire`.`id_cons_com` AS `id_cons_com`,`tcommentaire`.`id_user_com` AS `id_user_com`,`tcommentaire`.`text_com` AS `text_com`,`tcommentaire`.`date_com` AS `date_com`,`tbl_user`.`username` AS `username`,`tbl_user`.`photouser` AS `photouser` from (`tcommentaire` join `tbl_user` on((`tcommentaire`.`id_user_com` = `tbl_user`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `voir_conseils`
--
DROP TABLE IF EXISTS `voir_conseils`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `voir_conseils`  AS  select `tbl_user`.`username` AS `username`,`tcause`.`designation_cause` AS `designation_cause`,`tconseil`.`id_cons` AS `id_cons`,`tconseil`.`apropos_cons` AS `apropos_cons`,`tconseil`.`prevention_cons` AS `prevention_cons`,`tconseil`.`traitement_cons` AS `traitement_cons`,`tconseil`.`date_cons` AS `date_cons`,`tconseil`.`photo_cons` AS `photo_cons`,count(`tcommentaire`.`id_com`) AS `nbre_com` from (((`tconseil` join `tcause` on((`tcause`.`id_cause` = `tconseil`.`id_maladie_cons`))) join `tbl_user` on((`tbl_user`.`id` = `tconseil`.`id_user_cons`))) left join `tcommentaire` on((`tcommentaire`.`id_cons_com` = `tconseil`.`id_cons`))) group by `tconseil`.`id_cons` ;

-- --------------------------------------------------------

--
-- Structure for view `voir_deces`
--
DROP TABLE IF EXISTS `voir_deces`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `voir_deces`  AS  select `tdeces`.`id_dec` AS `id_dec`,`tpersonne`.`nom_pers` AS `nom_pers`,`tpersonne`.`postnom_pers` AS `postnom_pers`,`tpersonne`.`sexe_pers` AS `sexe_pers`,`tdeces`.`age_dec` AS `age_dec`,`tdeces`.`date_dec` AS `date_dec`,`tdeces`.`lieu_dec` AS `lieu_dec`,`tdeces`.`id_pers_dec` AS `id_pers_dec`,`tdeces`.`id_cause_dec` AS `id_cause_dec`,`tcause`.`id_cause` AS `id_cause`,`tcause`.`designation_cause` AS `designation_cause`,`tcause`.`detail_cause` AS `detail_cause` from ((`tdeces` join `tpersonne` on((`tdeces`.`id_pers_dec` = `tpersonne`.`id_pers`))) left join `tcause` on((`tdeces`.`id_cause_dec` = `tcause`.`id_cause`))) ;

-- --------------------------------------------------------

--
-- Structure for view `voir_deces_maladie`
--
DROP TABLE IF EXISTS `voir_deces_maladie`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `voir_deces_maladie`  AS  select `tdeces`.`id_dec` AS `id_dec`,`tpersonne`.`nom_pers` AS `nom_pers`,`tpersonne`.`postnom_pers` AS `postnom_pers`,`tpersonne`.`sexe_pers` AS `sexe_pers`,`tdeces`.`age_dec` AS `age_dec`,`tdeces`.`date_dec` AS `date_dec`,`tdeces`.`lieu_dec` AS `lieu_dec`,`tdeces`.`id_pers_dec` AS `id_pers_dec`,`tdeces`.`id_cause_dec` AS `id_cause_dec`,`tcause`.`id_cause` AS `id_cause`,`tcause`.`designation_cause` AS `designation_cause`,`tcause`.`detail_cause` AS `detail_cause` from (`tcause` left join (`tdeces` join `tpersonne` on((`tdeces`.`id_pers_dec` = `tpersonne`.`id_pers`))) on((`tdeces`.`id_cause_dec` = `tcause`.`id_cause`))) ;

-- --------------------------------------------------------

--
-- Structure for view `voir_maladies`
--
DROP TABLE IF EXISTS `voir_maladies`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `voir_maladies`  AS  select `voir_deces_maladie`.`id_cause` AS `id_cause`,count(`voir_deces_maladie`.`id_dec`) AS `nbre_dec`,`voir_deces_maladie`.`designation_cause` AS `designation_cause`,`voir_deces_maladie`.`detail_cause` AS `detail_cause` from `voir_deces_maladie` group by `voir_deces_maladie`.`id_cause` ;

-- --------------------------------------------------------

--
-- Structure for view `voir_naissances`
--
DROP TABLE IF EXISTS `voir_naissances`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `voir_naissances`  AS  select `tnaissance`.`id_naiss` AS `id_naiss`,`tpersonne`.`nom_pers` AS `nom_pers`,`tpersonne`.`postnom_pers` AS `postnom_pers`,`tpersonne`.`mere_pers` AS `mere_pers`,`tpersonne`.`pere_pers` AS `pere_pers`,`tpersonne`.`sexe_pers` AS `sexe_pers`,`tnaissance`.`date_naiss` AS `date_naiss`,`tnaissance`.`lieu_naiss` AS `lieu_naiss`,`tnaissance`.`age_mere_naiss` AS `age_mere_naiss`,`tnaissance`.`id_pers_naiss` AS `id_pers_naiss`,`tnaissance`.`id_hop_naiss` AS `id_hop_naiss`,`thopital`.`id_hop` AS `id_hop`,`thopital`.`nom_hop` AS `nom_hop`,`thopital`.`adresse_hop` AS `adresse_hop` from ((`tnaissance` join `tpersonne` on((`tnaissance`.`id_pers_naiss` = `tpersonne`.`id_pers`))) left join `thopital` on((`thopital`.`id_hop` = `tnaissance`.`id_hop_naiss`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `tcause`
--
ALTER TABLE `tcause`
  ADD PRIMARY KEY (`id_cause`);

--
-- Indexes for table `tcommentaire`
--
ALTER TABLE `tcommentaire`
  ADD PRIMARY KEY (`id_com`);

--
-- Indexes for table `tconseil`
--
ALTER TABLE `tconseil`
  ADD PRIMARY KEY (`id_cons`);

--
-- Indexes for table `tdeces`
--
ALTER TABLE `tdeces`
  ADD PRIMARY KEY (`id_dec`),
  ADD KEY `id_pers_dec` (`id_pers_dec`),
  ADD KEY `id_cause_dec` (`id_cause_dec`);

--
-- Indexes for table `thopital`
--
ALTER TABLE `thopital`
  ADD PRIMARY KEY (`id_hop`);

--
-- Indexes for table `tnaissance`
--
ALTER TABLE `tnaissance`
  ADD PRIMARY KEY (`id_naiss`),
  ADD KEY `id_pers_naiss` (`id_pers_naiss`),
  ADD KEY `id_hop_naiss` (`id_hop_naiss`);

--
-- Indexes for table `tpersonne`
--
ALTER TABLE `tpersonne`
  ADD PRIMARY KEY (`id_pers`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tcause`
--
ALTER TABLE `tcause`
  MODIFY `id_cause` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tcommentaire`
--
ALTER TABLE `tcommentaire`
  MODIFY `id_com` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tconseil`
--
ALTER TABLE `tconseil`
  MODIFY `id_cons` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tdeces`
--
ALTER TABLE `tdeces`
  MODIFY `id_dec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `thopital`
--
ALTER TABLE `thopital`
  MODIFY `id_hop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tnaissance`
--
ALTER TABLE `tnaissance`
  MODIFY `id_naiss` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tpersonne`
--
ALTER TABLE `tpersonne`
  MODIFY `id_pers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tdeces`
--
ALTER TABLE `tdeces`
  ADD CONSTRAINT `tdeces_ibfk_1` FOREIGN KEY (`id_cause_dec`) REFERENCES `tcause` (`id_cause`),
  ADD CONSTRAINT `tdeces_ibfk_2` FOREIGN KEY (`id_pers_dec`) REFERENCES `tpersonne` (`id_pers`);

--
-- Constraints for table `tnaissance`
--
ALTER TABLE `tnaissance`
  ADD CONSTRAINT `tnaissance_ibfk_1` FOREIGN KEY (`id_pers_naiss`) REFERENCES `tpersonne` (`id_pers`),
  ADD CONSTRAINT `tnaissance_ibfk_2` FOREIGN KEY (`id_hop_naiss`) REFERENCES `thopital` (`id_hop`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
