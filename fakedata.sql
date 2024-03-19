-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Gegenereerd op: 29 feb 2024 om 10:09
-- Serverversie: 10.4.28-MariaDB
-- PHP-versie: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `squadhealth`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateHealthCheckVersionStatus` (IN `input_version_id` INT)   BEGIN
    DECLARE v_invitations_count INT;

    SELECT COUNT(*) INTO v_invitations_count
    FROM `invitation_link`
    WHERE `version_id` = input_version_id;

    IF v_invitations_count > 0 THEN
        UPDATE `healthcheck_version`
        SET `isActive` = 1
        WHERE `version_id` = input_version_id;
    ELSE
        UPDATE `healthcheck_version`
        SET `isActive` = 0
        WHERE `version_id` = input_version_id;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `answerColor` enum('Red','Yellow','Green') DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `version_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `answer`
--

INSERT INTO `answer` (`id`, `question_id`, `user_id`, `answerColor`, `comment`, `createdAt`, `version_id`) VALUES
(1, 252, 44, 'Red', 'Congregatio viridis tonsor.', '2024-02-28 21:08:21', 13),
(2, 109, 11, 'Red', 'Succurro capitulus compono copia vester ducimus distinctio viscus virtus.', '2024-02-28 21:08:21', 6),
(3, 284, 8, 'Green', 'Casso voluptas supra amissio theologus.', '2024-02-28 21:08:21', 15),
(4, 81, 41, 'Yellow', 'Veritas congregatio candidus cornu titulus canonicus.', '2024-02-28 21:08:21', 5),
(5, 99, 17, 'Yellow', 'Patior tripudio allatus varietas abscido sollicito adipisci depono.', '2024-02-28 21:08:21', 5),
(6, 211, 1, 'Red', 'Calcar credo adsuesco tergum cunae adicio viridis video.', '2024-02-28 21:08:21', 11),
(7, 139, 10, 'Red', 'Torrens teres ex tener tamquam conventus fuga supellex.', '2024-02-28 21:08:21', 7),
(8, 86, 48, 'Yellow', 'Cornu ubi fuga.', '2024-02-28 21:08:21', 5),
(9, 173, 9, 'Red', 'Calamitas clamo alo defaeco caveo eius vis.', '2024-02-28 21:08:21', 9),
(10, 106, 18, 'Yellow', 'Demum angelus verecundia subito capitulus defetiscor.', '2024-02-28 21:08:21', 6),
(11, 138, 24, 'Green', 'Suadeo cum accommodo ager sufficio delego repellat tenetur temperantia.', '2024-02-28 21:08:21', 7),
(12, 79, 20, 'Green', 'Pax vapulus deinde crapula amplitudo curia alioqui claudeo beneficium calco.', '2024-02-28 21:08:21', 4),
(13, 129, 37, 'Red', 'Placeat laudantium vir xiphias campana articulus annus avarus.', '2024-02-28 21:08:21', 7),
(14, 271, 29, 'Green', 'Aspicio ustulo comptus compono.', '2024-02-28 21:08:21', 14),
(15, 115, 10, 'Green', 'Credo sordeo crebro contra delectatio arma.', '2024-02-28 21:08:21', 6),
(16, 248, 22, 'Green', 'Claudeo vulnero alius ante.', '2024-02-28 21:08:21', 13),
(17, 57, 1, 'Green', 'Cupiditate tripudio veniam cursim coerceo basium venio.', '2024-02-28 21:08:21', 3),
(18, 233, 29, 'Green', 'Maiores casus cerno.', '2024-02-28 21:08:21', 12),
(19, 12, 17, 'Yellow', 'Dolorum amplitudo super supra denuncio ratione demoror.', '2024-02-28 21:08:21', 1),
(20, 39, 10, 'Yellow', 'Vergo claudeo vilicus spiritus addo voro pectus.', '2024-02-28 21:08:21', 2),
(21, 99, 43, 'Green', 'Tremo tergo chirographum atavus vicissitudo velit.', '2024-02-28 21:08:21', 5),
(22, 223, 38, 'Green', 'Est toties quasi cura.', '2024-02-28 21:08:21', 12),
(23, 34, 25, 'Yellow', 'Aspicio ratione ultio sursum eius neque.', '2024-02-28 21:08:21', 2),
(24, 110, 15, 'Red', 'Casso carmen terebro cornu abutor decumbo maxime bellum versus.', '2024-02-28 21:08:21', 6),
(25, 256, 37, 'Yellow', 'Aequus ipsam arcus vergo utilis versus ver tui assentator.', '2024-02-28 21:08:21', 13),
(26, 55, 3, 'Red', 'Truculenter catena conitor ver.', '2024-02-28 21:08:21', 3),
(27, 281, 35, 'Green', 'Amitto ceno vigilo dolor sopor ultio.', '2024-02-28 21:08:21', 15),
(28, 290, 45, 'Yellow', 'Tametsi atrox calco.', '2024-02-28 21:08:21', 15),
(29, 26, 40, 'Red', 'Nulla curia sequi amissio spargo virtus adimpleo.', '2024-02-28 21:08:21', 2),
(30, 51, 23, 'Yellow', 'Compello arguo congregatio balbus viduo auditor perspiciatis ara.', '2024-02-28 21:08:21', 3),
(31, 103, 26, 'Green', 'Vulgo deorsum abstergo capio.', '2024-02-28 21:08:21', 6),
(32, 199, 38, 'Red', 'Cerno aro unde videlicet pecco claro audentia bis at stella.', '2024-02-28 21:08:21', 10),
(33, 65, 7, 'Green', 'Ulciscor ab sordeo pariatur demulceo charisma deinde cupio sollers.', '2024-02-28 21:08:21', 4),
(34, 21, 18, 'Red', 'Supra creator cribro abeo tempora colligo degenero.', '2024-02-28 21:08:21', 2),
(35, 10, 33, 'Yellow', 'Crinis vado thymum talis.', '2024-02-28 21:08:21', 1),
(36, 74, 22, 'Green', 'Atrox triduana celo bellicus desipio solvo deorsum modi.', '2024-02-28 21:08:21', 4),
(37, 130, 48, 'Yellow', 'Tempore stipes dolores decor.', '2024-02-28 21:08:21', 7),
(38, 46, 30, 'Red', 'Blanditiis confero cenaculum adopto triduana turba solitudo atqui.', '2024-02-28 21:08:21', 3),
(39, 49, 43, 'Red', 'Adipisci derideo vilicus culpa sumo.', '2024-02-28 21:08:21', 3),
(40, 153, 50, 'Red', 'Umquam delectatio vergo incidunt strenuus.', '2024-02-28 21:08:21', 8),
(41, 98, 44, 'Red', 'Esse socius rerum taceo capillus.', '2024-02-28 21:08:21', 5),
(42, 73, 34, 'Green', 'Voluptatum tendo ademptio.', '2024-02-28 21:08:21', 4),
(43, 152, 47, 'Red', 'Celo studio doloribus curiositas quaerat addo deputo.', '2024-02-28 21:08:21', 8),
(44, 98, 18, 'Yellow', 'Curatio cur temporibus vito turpis magnam astrum vobis trado.', '2024-02-28 21:08:21', 5),
(45, 219, 13, 'Green', 'Soluta quasi tremo coerceo cupiditas strenuus ulciscor est molestiae.', '2024-02-28 21:08:21', 11),
(46, 76, 10, 'Green', 'Contego dolorum universe tempus itaque verto voveo victoria mollitia coepi.', '2024-02-28 21:08:21', 4),
(47, 147, 4, 'Red', 'Suppellex calamitas tres vereor audentia talio alter deinde quidem copiose.', '2024-02-28 21:08:21', 8),
(48, 55, 8, 'Red', 'Molestiae sapiente arto arbitro desidero creber depromo pariatur sapiente.', '2024-02-28 21:08:21', 3),
(49, 111, 37, 'Yellow', 'Amita sustineo laudantium.', '2024-02-28 21:08:21', 6),
(50, 46, 36, 'Green', 'Victoria volva argumentum tertius alioqui.', '2024-02-28 21:08:21', 3),
(51, 254, 22, 'Green', 'Vero denuncio degenero brevis capillus spectaculum.', '2024-02-28 21:08:21', 13),
(52, 285, 44, 'Yellow', 'Antea arma teres termes perspiciatis maxime desolo dolor cumque.', '2024-02-28 21:08:21', 15),
(53, 262, 49, 'Green', 'Officiis acquiro validus sodalitas tametsi cariosus attonbitus laborum doloribus.', '2024-02-28 21:08:21', 14),
(54, 256, 27, 'Green', 'Tamen decor acsi subnecto aspernatur adinventitias volup deputo uxor.', '2024-02-28 21:08:21', 13),
(55, 230, 7, 'Green', 'Versus natus decet surgo tempora verto viscus carmen.', '2024-02-28 21:08:21', 12),
(56, 70, 38, 'Green', 'Totus verbera aqua credo.', '2024-02-28 21:08:21', 4),
(57, 173, 10, 'Green', 'Tripudio speciosus conatus conturbo cernuus casso cupio argentum.', '2024-02-28 21:08:21', 9),
(58, 123, 29, 'Red', 'Caste coniecto arguo repudiandae volup aperio textor molestias.', '2024-02-28 21:08:21', 7),
(59, 189, 7, 'Yellow', 'Traho corrupti copiose trucido ars aperio crastinus adipisci truculenter deludo.', '2024-02-28 21:08:21', 10),
(60, 6, 16, 'Red', 'Capillus sustineo cogito speciosus titulus super deorsum approbo.', '2024-02-28 21:08:21', 1),
(61, 137, 18, 'Green', 'Unus creator vergo comitatus vinum.', '2024-02-28 21:08:21', 7),
(62, 49, 24, 'Yellow', 'Surculus ventus suppono patruus thesis sono spes tero.', '2024-02-28 21:08:21', 3),
(63, 180, 12, 'Red', 'Varius vita derideo.', '2024-02-28 21:08:21', 9),
(64, 241, 49, 'Yellow', 'Caelestis thesis peior cogito aperiam cupiditate pauci virgo vociferor veritas.', '2024-02-28 21:08:21', 13),
(65, 137, 33, 'Red', 'Vulnus nulla nobis thermae abscido voro.', '2024-02-28 21:08:21', 7),
(66, 219, 7, 'Green', 'Cuppedia theatrum claudeo coerceo utor conspergo vigilo.', '2024-02-28 21:08:21', 11),
(67, 278, 13, 'Yellow', 'Dedecor cribro earum bellicus nam caveo.', '2024-02-28 21:08:21', 14),
(68, 231, 35, 'Yellow', 'Amitto sed deporto appositus aveho speculum cognatus.', '2024-02-28 21:08:21', 12),
(69, 3, 11, 'Green', 'Ante ascisco damno angelus aggredior talio summisse.', '2024-02-28 21:08:21', 1),
(70, 245, 3, 'Yellow', 'Titulus vester praesentium clementia dedecor consuasor.', '2024-02-28 21:08:21', 13),
(71, 30, 26, 'Green', 'Aer conor tergum tam curis alioqui deprimo depereo.', '2024-02-28 21:08:21', 2),
(72, 275, 45, 'Yellow', 'Tui currus amicitia sulum vallum adeptio alius.', '2024-02-28 21:08:21', 14),
(73, 163, 17, 'Red', 'Contego temporibus voluptates.', '2024-02-28 21:08:21', 9),
(74, 151, 8, 'Red', 'Tantum angustus cado alioqui vitium illo.', '2024-02-28 21:08:21', 8),
(75, 121, 32, 'Yellow', 'Neque ullus amaritudo cum tui ait vitium complectus.', '2024-02-28 21:08:21', 7),
(76, 42, 50, 'Red', 'Usque virgo varius alias varietas.', '2024-02-28 21:08:21', 3),
(77, 139, 42, 'Red', 'Attollo adstringo ciminatio consectetur temptatio bestia amplexus coerceo defetiscor.', '2024-02-28 21:08:21', 7),
(78, 193, 37, 'Green', 'Terga civitas venia blandior adfero acsi beatus doloribus.', '2024-02-28 21:08:21', 10),
(79, 184, 13, 'Yellow', 'Eos cohaero suadeo nihil degero voluptatem tergum comburo adnuo error.', '2024-02-28 21:08:21', 10),
(80, 259, 8, 'Red', 'Confugo tantum candidus abundans dolorum.', '2024-02-28 21:08:21', 13),
(81, 33, 33, 'Yellow', 'Demoror ambulo ocer crux cum quae.', '2024-02-28 21:08:21', 2),
(82, 11, 42, 'Yellow', 'Similique crinis succedo defessus conatus subito civis infit.', '2024-02-28 21:08:21', 1),
(83, 104, 21, 'Green', 'Impedit quo cometes amiculum ancilla bis toties utor.', '2024-02-28 21:08:21', 6),
(84, 2, 5, 'Green', 'Repellat adulatio super adversus subvenio.', '2024-02-28 21:08:21', 1),
(85, 98, 48, 'Green', 'Amaritudo coerceo ocer tabula terga communis.', '2024-02-28 21:08:21', 5),
(86, 51, 28, 'Red', 'Temperantia casus suffragium desolo crux.', '2024-02-28 21:08:21', 3),
(87, 210, 27, 'Yellow', 'Absum collum contra talus casus cuppedia.', '2024-02-28 21:08:21', 11),
(88, 61, 27, 'Yellow', 'Adflicto doloribus abduco sperno tunc.', '2024-02-28 21:08:21', 4),
(89, 25, 21, 'Green', 'Vigilo aeneus utroque desidero.', '2024-02-28 21:08:21', 2),
(90, 188, 23, 'Yellow', 'Terminatio bene summisse cogo beatae quisquam.', '2024-02-28 21:08:21', 10),
(91, 45, 40, 'Red', 'Viscus aliqua absque video auditor utilis blandior tametsi.', '2024-02-28 21:08:21', 3),
(92, 150, 3, 'Green', 'Capitulus a vehemens.', '2024-02-28 21:08:21', 8),
(93, 205, 16, 'Green', 'Arbustum arceo amplexus adulescens vinculum et.', '2024-02-28 21:08:21', 11),
(94, 259, 2, 'Red', 'Vitium constans acsi sol derideo depraedor ante virtus.', '2024-02-28 21:08:21', 13),
(95, 143, 24, 'Red', 'Pax autem accedo sustineo defendo vita.', '2024-02-28 21:08:21', 8),
(96, 148, 34, 'Green', 'Textor aperiam accedo tendo tredecim triduana.', '2024-02-28 21:08:21', 8),
(97, 259, 19, 'Red', 'Ventosus culpo aedificium tepesco.', '2024-02-28 21:08:21', 13),
(98, 2, 47, 'Red', 'Ex sophismata vir vita ustilo aeger cupio tergeo corrigo.', '2024-02-28 21:08:21', 1),
(99, 24, 36, 'Yellow', 'Trans crastinus utrum velit demonstro alioqui crur voluptatum crur thorax.', '2024-02-28 21:08:21', 2),
(100, 259, 41, 'Yellow', 'Tracto aliquid carpo cohaero comprehendo cetera alius aureus barba.', '2024-02-28 21:08:21', 13),
(101, 49, 3, 'Green', 'Attollo tumultus apparatus atqui.', '2024-02-28 21:08:21', 3),
(102, 91, 15, 'Green', 'Curia capto textor temeritas placeat.', '2024-02-28 21:08:21', 5),
(103, 19, 36, 'Red', 'Temptatio acsi architecto spero culpo viscus desolo.', '2024-02-28 21:08:21', 1),
(104, 195, 24, 'Red', 'Caterva angustus spectaculum cursim astrum sponte voluptatem sophismata veniam conventus.', '2024-02-28 21:08:21', 10),
(105, 243, 10, 'Red', 'Suadeo valetudo quam depraedor tenetur.', '2024-02-28 21:08:21', 13),
(106, 135, 29, 'Green', 'Suadeo ab crepusculum.', '2024-02-28 21:08:21', 7),
(107, 107, 4, 'Yellow', 'Spes apto bonus.', '2024-02-28 21:08:21', 6),
(108, 51, 30, 'Red', 'Trans armarium talus censura minus.', '2024-02-28 21:08:21', 3),
(109, 210, 33, 'Green', 'Velociter bellum commodo paens.', '2024-02-28 21:08:21', 11),
(110, 215, 32, 'Red', 'Coaegresco damnatio nisi creptio.', '2024-02-28 21:08:21', 11),
(111, 264, 29, 'Yellow', 'Validus amo canis.', '2024-02-28 21:08:21', 14),
(112, 160, 26, 'Green', 'Calco desipio addo spero tergeo carbo vulgo aro amor.', '2024-02-28 21:08:21', 8),
(113, 118, 6, 'Green', 'Carcer amo attero congregatio laboriosam cuius caute creator templum vomica.', '2024-02-28 21:08:21', 6),
(114, 94, 33, 'Green', 'Correptius caries amiculum vigilo curis cornu.', '2024-02-28 21:08:21', 5),
(115, 290, 17, 'Green', 'Delectatio tertius coniuratio angustus bis rem.', '2024-02-28 21:08:21', 15),
(116, 235, 1, 'Green', 'Subvenio anser cupiditas cubo facilis.', '2024-02-28 21:08:21', 12),
(117, 119, 8, 'Yellow', 'Cariosus auditor ut calamitas teneo territo patruus.', '2024-02-28 21:08:21', 6),
(118, 269, 41, 'Green', 'Absens ceno tandem solum beneficium ciminatio aperiam cicuta ascisco adhuc.', '2024-02-28 21:08:21', 14),
(119, 38, 39, 'Red', 'Attonbitus adduco creta tunc.', '2024-02-28 21:08:21', 2),
(120, 250, 32, 'Red', 'Volva sulum creator culpa.', '2024-02-28 21:08:21', 13),
(121, 48, 46, 'Yellow', 'Ventosus vetus comprehendo clibanus basium cumque ante.', '2024-02-28 21:08:21', 3),
(122, 67, 24, 'Yellow', 'Eius claro enim benigne adfectus valens adipisci possimus demergo usque.', '2024-02-28 21:08:21', 4),
(123, 139, 15, 'Red', 'Vaco alioqui timidus.', '2024-02-28 21:08:21', 7),
(124, 223, 40, 'Red', 'Abundans vita apto suffragium caterva infit.', '2024-02-28 21:08:21', 12),
(125, 272, 17, 'Yellow', 'Tres cunctatio aequus vomer.', '2024-02-28 21:08:21', 14),
(126, 3, 30, 'Yellow', 'Acer tametsi celo cubo delego.', '2024-02-28 21:08:21', 1),
(127, 267, 49, 'Yellow', 'Attollo dedecor tibi conventus cupio quae in adversus aedificium sit.', '2024-02-28 21:08:21', 14),
(128, 140, 23, 'Green', 'Porro decet cuppedia ducimus curis.', '2024-02-28 21:08:21', 7),
(129, 69, 16, 'Yellow', 'Crapula adinventitias tendo abduco arx.', '2024-02-28 21:08:21', 4),
(130, 242, 13, 'Red', 'Truculenter abeo alienus eum decerno tersus statim cognatus eligendi cum.', '2024-02-28 21:08:21', 13),
(131, 249, 12, 'Red', 'Exercitationem adeo acer sustineo.', '2024-02-28 21:08:21', 13),
(132, 264, 20, 'Green', 'Una demulceo titulus.', '2024-02-28 21:08:21', 14),
(133, 70, 23, 'Red', 'Ulterius arx soluta titulus ceno.', '2024-02-28 21:08:21', 4),
(134, 86, 21, 'Yellow', 'Voluntarius sui adhaero necessitatibus acies comedo dolorem basium consequatur vorago.', '2024-02-28 21:08:21', 5),
(135, 116, 24, 'Green', 'Triumphus sunt decet solum.', '2024-02-28 21:08:21', 6),
(136, 14, 25, 'Green', 'Defungo solio alius decor aegrotatio debitis copia ultio.', '2024-02-28 21:08:21', 1),
(137, 195, 42, 'Green', 'Triduana tabesco speculum caterva deleniti maxime certus sodalitas pariatur theologus.', '2024-02-28 21:08:21', 10),
(138, 296, 45, 'Yellow', 'Theca suadeo depono excepturi statua amplitudo clementia.', '2024-02-28 21:08:21', 15),
(139, 300, 45, 'Yellow', 'Annus vehemens quod deludo approbo valeo culpa inflammatio.', '2024-02-28 21:08:21', 15),
(140, 101, 31, 'Green', 'Vulgaris delicate cibo caterva articulus circumvenio vereor uterque copia.', '2024-02-28 21:08:21', 6),
(141, 197, 16, 'Red', 'Crustulum valens terror porro tenetur cunctatio.', '2024-02-28 21:08:21', 10),
(142, 98, 36, 'Red', 'Creptio vallum clementia tertius arguo conturbo absum fugit victoria aduro.', '2024-02-28 21:08:21', 5),
(143, 241, 10, 'Yellow', 'Trado vorax magnam molestiae barba ager titulus vitiosus.', '2024-02-28 21:08:21', 13),
(144, 207, 30, 'Yellow', 'Celebrer speculum tabula curtus textor.', '2024-02-28 21:08:21', 11),
(145, 195, 21, 'Red', 'Magni arma voveo arcesso.', '2024-02-28 21:08:21', 10),
(146, 2, 29, 'Red', 'Animadverto atqui absum ventus bellicus tendo adficio conduco vilitas cultura.', '2024-02-28 21:08:21', 1),
(147, 180, 27, 'Red', 'Censura tantillus distinctio cerno balbus.', '2024-02-28 21:08:21', 9),
(148, 203, 39, 'Green', 'Abduco pax vapulus aranea suscipio.', '2024-02-28 21:08:21', 11),
(149, 285, 31, 'Red', 'Nulla antiquus textilis thermae bellum atque curriculum solum ventosus.', '2024-02-28 21:08:21', 15),
(150, 157, 4, 'Red', 'Audentia cenaculum viridis amplexus a depulso eaque vigor crur.', '2024-02-28 21:08:21', 8),
(151, 184, 40, 'Green', 'Ager super usus.', '2024-02-28 21:08:21', 10),
(152, 119, 27, 'Yellow', 'Adipisci crebro anser sponte.', '2024-02-28 21:08:21', 6),
(153, 121, 49, 'Yellow', 'Curis trepide voluptate artificiose aliquam copia.', '2024-02-28 21:08:21', 7),
(154, 240, 4, 'Green', 'Canis coma amita amoveo aperio demum depromo theologus.', '2024-02-28 21:08:21', 12),
(155, 237, 35, 'Red', 'Tamquam vulpes inflammatio.', '2024-02-28 21:08:21', 12),
(156, 178, 38, 'Red', 'Supellex tribuo consequatur curia totus cometes culpa ater.', '2024-02-28 21:08:21', 9),
(157, 218, 40, 'Yellow', 'Valde triumphus tubineus.', '2024-02-28 21:08:21', 11),
(158, 187, 2, 'Yellow', 'Talus cultura pecto cumque.', '2024-02-28 21:08:21', 10),
(159, 176, 25, 'Yellow', 'Verumtamen appositus omnis damnatio virga.', '2024-02-28 21:08:21', 9),
(160, 186, 21, 'Red', 'Cena cogo dolores caritas.', '2024-02-28 21:08:21', 10),
(161, 42, 38, 'Red', 'Volaticus cupressus sollers.', '2024-02-28 21:08:21', 3),
(162, 251, 34, 'Yellow', 'Suppellex terror velociter vapulus volutabrum advenio quas defero.', '2024-02-28 21:08:21', 13),
(163, 183, 48, 'Red', 'Tactus viscus vito quod cohors illo vestigium aestus.', '2024-02-28 21:08:21', 10),
(164, 39, 50, 'Red', 'Turpis ancilla thymum patruus utique crastinus thesaurus reiciendis aequus.', '2024-02-28 21:08:21', 2),
(165, 224, 47, 'Green', 'Pel tabella clam atrox uberrime cotidie.', '2024-02-28 21:08:21', 12),
(166, 217, 29, 'Red', 'Coruscus paulatim adamo cum soluta beatus attollo sub vigor.', '2024-02-28 21:08:21', 11),
(167, 242, 25, 'Red', 'Crastinus strues brevis ipsam clibanus conscendo bos convoco vomica creator.', '2024-02-28 21:08:21', 13),
(168, 147, 20, 'Red', 'Solvo tripudio contigo tepidus cicuta volva cometes certe.', '2024-02-28 21:08:21', 8),
(169, 250, 22, 'Yellow', 'Varietas curatio credo antepono antea curto ipsum deorsum celer.', '2024-02-28 21:08:21', 13),
(170, 207, 16, 'Yellow', 'Totus audacia aliquam audeo ventus.', '2024-02-28 21:08:21', 11),
(171, 288, 13, 'Yellow', 'Tutis animi comitatus catena attonbitus voluptatibus.', '2024-02-28 21:08:21', 15),
(172, 184, 23, 'Yellow', 'Vulariter deleo acidus bellum cupiditas templum concedo ad.', '2024-02-28 21:08:21', 10),
(173, 220, 13, 'Red', 'Amplus stabilis vinitor acsi ulciscor.', '2024-02-28 21:08:21', 11),
(174, 163, 2, 'Yellow', 'Strenuus combibo vorago.', '2024-02-28 21:08:21', 9),
(175, 181, 33, 'Yellow', 'Cornu quos vilitas convoco.', '2024-02-28 21:08:21', 10),
(176, 183, 42, 'Green', 'Voco acervus aedificium corona adimpleo curo ancilla.', '2024-02-28 21:08:21', 10),
(177, 195, 41, 'Red', 'Altus asperiores amiculum capitulus.', '2024-02-28 21:08:21', 10),
(178, 143, 28, 'Green', 'Angelus umbra crudelis vereor valetudo totus adaugeo.', '2024-02-28 21:08:21', 8),
(179, 228, 38, 'Red', 'Celer quos viduo angelus venia carpo teres supplanto uredo.', '2024-02-28 21:08:21', 12),
(180, 293, 36, 'Yellow', 'Deinde timidus libero decerno patrocinor.', '2024-02-28 21:08:21', 15),
(181, 268, 25, 'Yellow', 'Utique synagoga viscus clam.', '2024-02-28 21:08:21', 14),
(182, 102, 37, 'Red', 'Aro reiciendis adfero curto spero bene aeneus vulpes.', '2024-02-28 21:08:21', 6),
(183, 272, 18, 'Green', 'Anser usitas urbs cunae.', '2024-02-28 21:08:21', 14),
(184, 244, 19, 'Green', 'Inflammatio tepidus cum via atrox facere cupressus defendo copia.', '2024-02-28 21:08:21', 13),
(185, 213, 42, 'Yellow', 'Theca tenax dignissimos crudelis deporto deleo delectatio sto caelestis eos.', '2024-02-28 21:08:21', 11),
(186, 261, 36, 'Green', 'Utilis laudantium contigo quas vigilo adopto allatus crustulum.', '2024-02-28 21:08:21', 14),
(187, 293, 43, 'Red', 'Vitium dolore aqua attonbitus vulgus autus tutamen alius tabella.', '2024-02-28 21:08:21', 15),
(188, 190, 23, 'Green', 'Via attero comprehendo numquam.', '2024-02-28 21:08:21', 10),
(189, 230, 38, 'Red', 'Suscipit canis aspernatur versus cenaculum constans autem.', '2024-02-28 21:08:21', 12),
(190, 197, 19, 'Green', 'Debitis despecto arceo debeo aspernatur.', '2024-02-28 21:08:21', 10),
(191, 80, 11, 'Green', 'Cupio vigilo nisi coepi.', '2024-02-28 21:08:21', 4),
(192, 172, 7, 'Red', 'Molestias at angulus decerno aggero depereo pax confido sumptus.', '2024-02-28 21:08:21', 9),
(193, 253, 38, 'Green', 'Paulatim defetiscor taedium.', '2024-02-28 21:08:21', 13),
(194, 156, 35, 'Red', 'Pecco utique cras.', '2024-02-28 21:08:21', 8),
(195, 48, 6, 'Red', 'Aer admoveo suggero suffragium deludo est.', '2024-02-28 21:08:21', 3),
(196, 164, 15, 'Yellow', 'Despecto cubo suscipit aspernatur uredo tamdiu textor caste.', '2024-02-28 21:08:21', 9),
(197, 79, 3, 'Green', 'Texo ullus curiositas antepono uberrime bardus cariosus pariatur.', '2024-02-28 21:08:21', 4),
(198, 151, 36, 'Green', 'Coniecto verus tristis dens strues aperte.', '2024-02-28 21:08:21', 8),
(199, 196, 32, 'Red', 'Velit repellendus condico ea perferendis cui tenus credo calamitas.', '2024-02-28 21:08:21', 10),
(200, 143, 32, 'Yellow', 'Crebro clementia animus uredo pel porro quo decor acervus.', '2024-02-28 21:08:21', 8),
(201, 48, 32, 'Yellow', 'Tracto tenax adsidue.', '2024-02-28 21:08:21', 3),
(202, 287, 23, 'Yellow', 'Commemoro sui explicabo excepturi baiulus ratione.', '2024-02-28 21:08:21', 15),
(203, 267, 29, 'Red', 'Solus cura in.', '2024-02-28 21:08:21', 14),
(204, 99, 50, 'Green', 'Derelinquo blandior bestia amissio coruscus.', '2024-02-28 21:08:21', 5),
(205, 146, 29, 'Red', 'Vinum brevis deficio.', '2024-02-28 21:08:21', 8),
(206, 214, 33, 'Yellow', 'Culpo appello acceptus claustrum vehemens.', '2024-02-28 21:08:21', 11),
(207, 93, 49, 'Yellow', 'Laborum stultus vix crepusculum confugo antea.', '2024-02-28 21:08:21', 5),
(208, 155, 35, 'Green', 'Vulnero deprecator caecus conspergo virga arceo somnus.', '2024-02-28 21:08:21', 8),
(209, 8, 2, 'Yellow', 'Articulus depopulo temporibus attollo curis comburo.', '2024-02-28 21:08:21', 1),
(210, 41, 14, 'Green', 'Tergiversatio sponte atque sursum vox coadunatio.', '2024-02-28 21:08:21', 3),
(211, 128, 49, 'Yellow', 'Claustrum degusto cras.', '2024-02-28 21:08:21', 7),
(212, 217, 5, 'Yellow', 'Conscendo cohors varius tamdiu spes adficio.', '2024-02-28 21:08:21', 11),
(213, 33, 3, 'Red', 'Nobis adfectus vapulus vaco dolorum.', '2024-02-28 21:08:21', 2),
(214, 91, 30, 'Red', 'Ab adamo praesentium vallum defaeco vere tremo.', '2024-02-28 21:08:21', 5),
(215, 26, 11, 'Green', 'Adnuo derideo culpa.', '2024-02-28 21:08:21', 2),
(216, 12, 37, 'Green', 'Turpis deserunt decet distinctio aliqua fugit xiphias abbas aggero supellex.', '2024-02-28 21:08:21', 1),
(217, 41, 41, 'Yellow', 'Arguo tardus creator damno vesica denuo deduco turpis solitudo.', '2024-02-28 21:08:21', 3),
(218, 197, 32, 'Red', 'Advoco vesica non accusamus considero suppono viridis.', '2024-02-28 21:08:21', 10),
(219, 88, 29, 'Red', 'Cauda celer abutor accusantium desino.', '2024-02-28 21:08:21', 5),
(220, 218, 28, 'Red', 'Totus tricesimus patior totam averto tubineus reiciendis desidero tergum.', '2024-02-28 21:08:21', 11),
(221, 278, 42, 'Yellow', 'Dens exercitationem dedecor.', '2024-02-28 21:08:21', 14),
(222, 239, 39, 'Yellow', 'Terror illo placeat ea.', '2024-02-28 21:08:21', 12),
(223, 244, 35, 'Green', 'Caute fuga cognatus curis pauci crux admoneo causa tenus.', '2024-02-28 21:08:21', 13),
(224, 21, 43, 'Yellow', 'Deporto strues stultus vilitas corroboro aliquam ab cruciamentum verus.', '2024-02-28 21:08:21', 2),
(225, 97, 3, 'Red', 'Voluptates ab adipisci demergo.', '2024-02-28 21:08:21', 5),
(226, 224, 12, 'Red', 'Audeo vae vinco demulceo peccatus audeo universe ab dolore.', '2024-02-28 21:08:21', 12),
(227, 107, 32, 'Green', 'Aliquid contabesco dolorum vindico.', '2024-02-28 21:08:21', 6),
(228, 29, 14, 'Yellow', 'Xiphias cognomen amplitudo caveo.', '2024-02-28 21:08:21', 2),
(229, 226, 11, 'Green', 'Assumenda civitas attero.', '2024-02-28 21:08:21', 12),
(230, 205, 41, 'Green', 'Vorax vitiosus amor dolorem appositus unus asperiores error.', '2024-02-28 21:08:21', 11),
(231, 255, 29, 'Yellow', 'Atqui advoco adfectus dedico.', '2024-02-28 21:08:21', 13),
(232, 128, 24, 'Green', 'Animus et vorago auxilium vindico certus solutio.', '2024-02-28 21:08:21', 7),
(233, 235, 43, 'Red', 'Tantillus aer copia verbera minus.', '2024-02-28 21:08:21', 12),
(234, 134, 30, 'Yellow', 'Conicio accusator nemo illum suus infit.', '2024-02-28 21:08:21', 7),
(235, 62, 47, 'Yellow', 'Cibus colligo tametsi trepide harum ex adulescens labore.', '2024-02-28 21:08:21', 4),
(236, 72, 27, 'Yellow', 'Culpa crux audio valens somniculosus verumtamen curriculum correptius adsum inflammatio.', '2024-02-28 21:08:21', 4),
(237, 256, 22, 'Green', 'Labore veritatis sint certe stabilis vigor amplitudo apparatus arceo.', '2024-02-28 21:08:21', 13),
(238, 243, 40, 'Green', 'Valetudo cruentus carmen confero.', '2024-02-28 21:08:21', 13),
(239, 100, 35, 'Yellow', 'Conicio vito ceno usus corrumpo defetiscor utrum.', '2024-02-28 21:08:21', 5),
(240, 141, 42, 'Red', 'Acsi sint ratione cattus.', '2024-02-28 21:08:21', 8),
(241, 251, 30, 'Red', 'Terreo vester vapulus.', '2024-02-28 21:08:21', 13),
(242, 240, 4, 'Red', 'Facere cupressus amitto culpo alias volaticus tenus.', '2024-02-28 21:08:21', 12),
(243, 66, 17, 'Red', 'Admoveo nostrum venio.', '2024-02-28 21:08:21', 4),
(244, 161, 22, 'Green', 'Derideo adiuvo dignissimos expedita vinitor adinventitias suffragium.', '2024-02-28 21:08:21', 9),
(245, 228, 4, 'Yellow', 'Patruus cerno culpo.', '2024-02-28 21:08:21', 12),
(246, 59, 48, 'Yellow', 'Accusamus vis tersus velut verbum ulciscor angustus.', '2024-02-28 21:08:21', 3),
(247, 117, 11, 'Red', 'Voluptatibus atrox inflammatio creo.', '2024-02-28 21:08:21', 6),
(248, 7, 20, 'Green', 'Corrupti sit pecco ad patior minus accendo.', '2024-02-28 21:08:21', 1),
(249, 102, 14, 'Green', 'Texo tripudio uter stipes vociferor tantum deputo versus.', '2024-02-28 21:08:21', 6),
(250, 224, 20, 'Yellow', 'Certe depono cupiditate solutio pecto.', '2024-02-28 21:08:21', 12),
(251, 298, 21, 'Yellow', 'Trepide certus creber optio omnis ut concido socius vinculum.', '2024-02-28 21:08:21', 15),
(252, 210, 3, 'Red', 'Auxilium eveniet alo degenero communis vinco neque.', '2024-02-28 21:08:21', 11),
(253, 30, 28, 'Yellow', 'Arcesso cavus damno cariosus eos unde.', '2024-02-28 21:08:21', 2),
(254, 191, 40, 'Green', 'Ater campana nobis subito compello acceptus demoror accedo recusandae.', '2024-02-28 21:08:21', 10),
(255, 166, 14, 'Green', 'Vos sollers cito vespillo.', '2024-02-28 21:08:21', 9),
(256, 58, 24, 'Green', 'Tenuis tamquam aequus.', '2024-02-28 21:08:21', 3),
(257, 111, 7, 'Red', 'Culpa nulla trepide supellex ex soleo inflammatio civis suscipio.', '2024-02-28 21:08:21', 6),
(258, 174, 49, 'Red', 'Ventosus attonbitus valeo.', '2024-02-28 21:08:21', 9),
(259, 294, 11, 'Green', 'Ocer campana strenuus conscendo crastinus aequus bonus supellex velit cura.', '2024-02-28 21:08:21', 15),
(260, 125, 38, 'Red', 'Occaecati amissio quod paens stillicidium conspergo.', '2024-02-28 21:08:21', 7),
(261, 259, 47, 'Green', 'Veritatis vir complectus totus commodi universe demulceo.', '2024-02-28 21:08:21', 13),
(262, 229, 37, 'Green', 'Conqueror attonbitus audio defleo sordeo sursum vicissitudo comis sopor summa.', '2024-02-28 21:08:21', 12),
(263, 141, 31, 'Red', 'Admoveo tenus vulgaris canto vitium vestrum suffragium tyrannus velum volubilis.', '2024-02-28 21:08:21', 8),
(264, 256, 7, 'Yellow', 'Demoror venustas sursum fuga aestivus.', '2024-02-28 21:08:21', 13),
(265, 275, 12, 'Red', 'Vae cernuus laboriosam.', '2024-02-28 21:08:21', 14),
(266, 56, 28, 'Green', 'Articulus cum comedo.', '2024-02-28 21:08:21', 3),
(267, 142, 12, 'Red', 'Demens verto conduco optio consequatur decor curto comparo stillicidium arbor.', '2024-02-28 21:08:21', 8),
(268, 290, 47, 'Yellow', 'Claustrum degero officia caste calcar centum decimus casso odit.', '2024-02-28 21:08:21', 15),
(269, 114, 40, 'Red', 'Ancilla officiis triduana.', '2024-02-28 21:08:21', 6),
(270, 61, 50, 'Yellow', 'Allatus arceo deporto ullus ab.', '2024-02-28 21:08:21', 4),
(271, 295, 50, 'Green', 'Theatrum desparatus statua.', '2024-02-28 21:08:21', 15),
(272, 192, 18, 'Green', 'Vindico antea stips accommodo unde compello usque bestia aegrotatio aeger.', '2024-02-28 21:08:21', 10),
(273, 256, 5, 'Yellow', 'Suffoco approbo sint.', '2024-02-28 21:08:21', 13),
(274, 286, 18, 'Green', 'Coniecto tego verbum super.', '2024-02-28 21:08:21', 15),
(275, 22, 5, 'Green', 'Teneo conqueror dedecor pecto custodia bestia.', '2024-02-28 21:08:21', 2),
(276, 267, 41, 'Red', 'Clementia iste venia tabernus cotidie corona ustilo vinculum summa.', '2024-02-28 21:08:21', 14),
(277, 15, 5, 'Green', 'Balbus supplanto aestas bonus utrum.', '2024-02-28 21:08:21', 1),
(278, 101, 2, 'Yellow', 'Nostrum avaritia decumbo aggero calco delectatio sordeo condico.', '2024-02-28 21:08:21', 6),
(279, 25, 27, 'Green', 'Ulciscor ceno libero aggero.', '2024-02-28 21:08:21', 2),
(280, 153, 32, 'Red', 'Adiuvo spes conturbo tumultus cursim centum beneficium admoveo adfectus.', '2024-02-28 21:08:21', 8),
(281, 84, 28, 'Green', 'Teres nesciunt talus valetudo.', '2024-02-28 21:08:21', 5),
(282, 67, 8, 'Green', 'Crepusculum corrigo infit bibo verumtamen charisma absconditus cuppedia ipsa viriliter.', '2024-02-28 21:08:21', 4),
(283, 102, 6, 'Red', 'Virtus turba cenaculum tubineus thesis.', '2024-02-28 21:08:21', 6),
(284, 191, 19, 'Green', 'Sopor ultra urbanus adsidue deripio blandior eaque.', '2024-02-28 21:08:21', 10),
(285, 228, 30, 'Green', 'Deduco vilitas curo.', '2024-02-28 21:08:21', 12),
(286, 184, 10, 'Yellow', 'Delibero theatrum consequatur repellendus.', '2024-02-28 21:08:21', 10),
(287, 260, 20, 'Red', 'Solium aliquid alienus canis fugiat amissio.', '2024-02-28 21:08:21', 13),
(288, 287, 4, 'Yellow', 'Benevolentia videlicet debilito undique caveo.', '2024-02-28 21:08:21', 15),
(289, 86, 6, 'Green', 'Aiunt caelum deleniti pecto centum tumultus demergo stips cupiditas.', '2024-02-28 21:08:21', 5),
(290, 270, 23, 'Yellow', 'Sodalitas quaerat denego.', '2024-02-28 21:08:21', 14),
(291, 234, 34, 'Green', 'Amoveo sapiente vetus.', '2024-02-28 21:08:21', 12),
(292, 223, 34, 'Green', 'Vereor tabula comparo.', '2024-02-28 21:08:21', 12),
(293, 195, 40, 'Yellow', 'Usus assumenda arto similique una ademptio calcar ultra decet.', '2024-02-28 21:08:21', 10),
(294, 44, 25, 'Yellow', 'Desolo tamisium non.', '2024-02-28 21:08:21', 3),
(295, 17, 19, 'Red', 'Tero tonsor summopere compono et arceo dedecor commemoro.', '2024-02-28 21:08:21', 1),
(296, 270, 46, 'Yellow', 'Auditor abstergo animi censura timor.', '2024-02-28 21:08:21', 14),
(297, 101, 23, 'Red', 'Qui curis vir coma cresco temperantia crastinus xiphias acidus.', '2024-02-28 21:08:21', 6),
(298, 49, 12, 'Yellow', 'Arceo compello calculus crustulum carcer viridis excepturi thorax cupio.', '2024-02-28 21:08:21', 3),
(299, 122, 50, 'Red', 'Agnosco ad capto vel clamo tabesco exercitationem accedo inventore.', '2024-02-28 21:08:21', 7),
(300, 54, 18, 'Green', 'Trucido victus theologus uxor conspergo casso.', '2024-02-28 21:08:21', 3),
(301, 123, 50, 'Yellow', 'Ustilo vestigium conatus umerus crapula conscendo cur sapiente auctor patrocinor.', '2024-02-28 21:08:21', 7),
(302, 299, 3, 'Green', 'Eligendi credo virtus ager amiculum.', '2024-02-28 21:08:21', 15),
(303, 245, 20, 'Red', 'Surculus labore angelus accusantium repudiandae abduco bonus ex.', '2024-02-28 21:08:21', 13),
(304, 271, 37, 'Red', 'Uterque canis utique aspernatur.', '2024-02-28 21:08:21', 14),
(305, 118, 41, 'Red', 'Surgo dens distinctio desparatus apostolus una.', '2024-02-28 21:08:21', 6),
(306, 277, 20, 'Red', 'Terminatio thymbra tamen.', '2024-02-28 21:08:21', 14),
(307, 220, 43, 'Green', 'Cribro appono spectaculum caute angelus cubicularis commemoro teres.', '2024-02-28 21:08:21', 11),
(308, 154, 16, 'Yellow', 'Demum solium conservo vinum volo audentia termes ultra.', '2024-02-28 21:08:21', 8),
(309, 82, 44, 'Green', 'Ulterius totidem sublime ratione vehemens spargo.', '2024-02-28 21:08:21', 5),
(310, 3, 6, 'Red', 'Officia similique soleo tamisium quos.', '2024-02-28 21:08:21', 1),
(311, 274, 8, 'Red', 'Cuppedia cohors surgo aetas adamo.', '2024-02-28 21:08:21', 14),
(312, 40, 31, 'Yellow', 'Creator appositus speculum vallum amor charisma sono tergo sui desidero.', '2024-02-28 21:08:21', 2),
(313, 281, 27, 'Red', 'Volva cicuta thymbra carbo vapulus.', '2024-02-28 21:08:21', 15),
(314, 8, 26, 'Red', 'Argentum comedo voluptatem sapiente cetera canis certe.', '2024-02-28 21:08:21', 1),
(315, 118, 50, 'Green', 'Solitudo tutamen odit pariatur cunabula speciosus uter.', '2024-02-28 21:08:21', 6),
(316, 94, 30, 'Yellow', 'Dolore audeo caecus.', '2024-02-28 21:08:21', 5),
(317, 272, 50, 'Red', 'Summisse caritas via admitto voro ventito subito amo conspergo demo.', '2024-02-28 21:08:21', 14),
(318, 46, 36, 'Red', 'Tabella nesciunt credo.', '2024-02-28 21:08:21', 3),
(319, 18, 24, 'Green', 'Spoliatio aperte angulus statim.', '2024-02-28 21:08:21', 1),
(320, 282, 44, 'Red', 'Sonitus agnosco adipiscor patrocinor arbustum demum claudeo.', '2024-02-28 21:08:21', 15),
(321, 277, 8, 'Red', 'Itaque deduco adnuo eveniet adsuesco unde sulum cumque.', '2024-02-28 21:08:21', 14),
(322, 169, 49, 'Green', 'Similique tabgo virgo autem.', '2024-02-28 21:08:21', 9),
(323, 58, 28, 'Green', 'Vallum appello trucido corpus tener talus dolorum.', '2024-02-28 21:08:21', 3),
(324, 258, 37, 'Green', 'Thesis dignissimos textilis theologus vacuus.', '2024-02-28 21:08:21', 13),
(325, 64, 1, 'Red', 'Quos vindico veniam quae theatrum.', '2024-02-28 21:08:21', 4),
(326, 239, 20, 'Red', 'Pauper tremo fuga sulum tepesco auditor ullam conturbo error.', '2024-02-28 21:08:21', 12),
(327, 71, 50, 'Green', 'Tabesco corpus aperiam eaque veniam caelestis.', '2024-02-28 21:08:21', 4),
(328, 35, 11, 'Green', 'Vacuus sit vicinus adhaero tracto dens quas curtus benevolentia.', '2024-02-28 21:08:21', 2),
(329, 286, 4, 'Red', 'Exercitationem vel alii reiciendis avaritia incidunt arcesso talio arbitro.', '2024-02-28 21:08:21', 15),
(330, 11, 15, 'Yellow', 'Blandior deprimo tempora tabesco attonbitus commemoro.', '2024-02-28 21:08:21', 1),
(331, 169, 27, 'Red', 'Odio statim deputo ceno ustulo ullus.', '2024-02-28 21:08:21', 9),
(332, 183, 35, 'Yellow', 'Addo vivo amitto thermae titulus suspendo ducimus colligo.', '2024-02-28 21:08:21', 10),
(333, 21, 46, 'Yellow', 'Viridis consequuntur tamdiu patrocinor volup torrens argentum.', '2024-02-28 21:08:21', 2),
(334, 264, 45, 'Red', 'Ascit balbus admiratio studio vito sapiente tertius adaugeo.', '2024-02-28 21:08:21', 14),
(335, 27, 3, 'Yellow', 'Utor theca aspernatur usus crinis vindico curtus aggredior solvo.', '2024-02-28 21:08:21', 2),
(336, 51, 32, 'Green', 'Vos nostrum cupiditas cognomen.', '2024-02-28 21:08:21', 3),
(337, 277, 48, 'Green', 'Beatus cometes suffoco versus aveho tabesco vester auctor bonus.', '2024-02-28 21:08:21', 14),
(338, 45, 38, 'Green', 'Aufero capio dedico stabilis.', '2024-02-28 21:08:21', 3),
(339, 81, 38, 'Green', 'Subiungo celer alius cubo sonitus.', '2024-02-28 21:08:21', 5),
(340, 146, 47, 'Yellow', 'Nobis vulpes thesis abutor utroque utrum territo vespillo.', '2024-02-28 21:08:21', 8),
(341, 9, 21, 'Red', 'Stultus crepusculum textus pecco deporto impedit correptius artificiose ab.', '2024-02-28 21:08:21', 1),
(342, 248, 36, 'Red', 'Sapiente doloribus officiis vilicus distinctio summa.', '2024-02-28 21:08:21', 13),
(343, 95, 23, 'Yellow', 'Thema voluptates alias.', '2024-02-28 21:08:21', 5),
(344, 248, 27, 'Green', 'Desidero damnatio veritatis derideo credo cum vacuus utpote.', '2024-02-28 21:08:21', 13),
(345, 95, 38, 'Yellow', 'Canonicus appono alter cupressus vestrum cupiditas comminor velut attonbitus.', '2024-02-28 21:08:21', 5),
(346, 205, 30, 'Yellow', 'Vulgo subito demum.', '2024-02-28 21:08:21', 11),
(347, 243, 31, 'Red', 'Aspernatur vigor enim cimentarius.', '2024-02-28 21:08:21', 13),
(348, 238, 45, 'Yellow', 'Cuppedia acervus abbas vomer.', '2024-02-28 21:08:21', 12),
(349, 249, 28, 'Green', 'Patruus non vobis cito.', '2024-02-28 21:08:21', 13),
(350, 154, 20, 'Green', 'Adaugeo volubilis sustineo contra facere reprehenderit decimus talio ascisco calculus.', '2024-02-28 21:08:21', 8),
(351, 280, 37, 'Yellow', 'Labore degusto quod creptio apostolus et.', '2024-02-28 21:08:21', 14),
(352, 280, 33, 'Yellow', 'Magnam clibanus verumtamen torqueo tenetur confido.', '2024-02-28 21:08:21', 14),
(353, 120, 3, 'Red', 'Coma temporibus dolorum comptus demitto.', '2024-02-28 21:08:21', 6),
(354, 223, 45, 'Red', 'Tum valde doloribus tollo sophismata.', '2024-02-28 21:08:21', 12),
(355, 108, 30, 'Green', 'Curvo suppellex colligo clamo contra sol carpo.', '2024-02-28 21:08:21', 6),
(356, 231, 11, 'Green', 'Angustus aranea adnuo centum contabesco cervus terebro cultura curis capillus.', '2024-02-28 21:08:21', 12),
(357, 124, 17, 'Yellow', 'Derelinquo tempora temptatio praesentium fugit.', '2024-02-28 21:08:21', 7),
(358, 26, 28, 'Green', 'Cervus succurro autem deficio tabesco.', '2024-02-28 21:08:21', 2),
(359, 292, 40, 'Green', 'Suffoco conatus alioqui bibo confero despecto.', '2024-02-28 21:08:21', 15),
(360, 235, 30, 'Red', 'Explicabo aeternus timor ater suspendo synagoga quia.', '2024-02-28 21:08:21', 12),
(361, 235, 6, 'Green', 'Suasoria aegrus depromo aptus.', '2024-02-28 21:08:21', 12),
(362, 85, 33, 'Yellow', 'Statua corona dolorem territo viduo aspernatur.', '2024-02-28 21:08:21', 5),
(363, 206, 9, 'Yellow', 'Communis celer vado amicitia turbo.', '2024-02-28 21:08:21', 11),
(364, 300, 13, 'Yellow', 'Templum calamitas perspiciatis omnis casus adicio.', '2024-02-28 21:08:21', 15),
(365, 100, 50, 'Green', 'Auctor termes esse acies corrumpo ciminatio cinis cedo audentia decimus.', '2024-02-28 21:08:21', 5),
(366, 260, 24, 'Yellow', 'Vesica defetiscor tres agnosco.', '2024-02-28 21:08:21', 13),
(367, 11, 46, 'Red', 'Virgo caritas peccatus.', '2024-02-28 21:08:21', 1),
(368, 66, 39, 'Red', 'Considero vester saepe victoria abscido vereor vulpes possimus degero.', '2024-02-28 21:08:21', 4),
(369, 116, 21, 'Yellow', 'Caries adsidue benevolentia cum autem sodalitas contego.', '2024-02-28 21:08:21', 6),
(370, 50, 17, 'Yellow', 'Curvo comptus alioqui sophismata coerceo vulgaris tendo ver.', '2024-02-28 21:08:21', 3),
(371, 179, 13, 'Green', 'Valens porro careo truculenter conicio vis pariatur adfero at.', '2024-02-28 21:08:21', 9),
(372, 5, 18, 'Green', 'Vicinus thalassinus terga solutio ater aestas unde deputo.', '2024-02-28 21:08:21', 1),
(373, 99, 35, 'Red', 'Attollo desipio desipio taedium.', '2024-02-28 21:08:21', 5),
(374, 113, 20, 'Green', 'Infit benevolentia ultio paens videlicet caute denego.', '2024-02-28 21:08:21', 6),
(375, 14, 31, 'Green', 'Absorbeo ubi cariosus.', '2024-02-28 21:08:21', 1),
(376, 61, 2, 'Yellow', 'Voluptates deleniti tepidus.', '2024-02-28 21:08:21', 4),
(377, 229, 28, 'Yellow', 'Amaritudo barba arto sto nihil.', '2024-02-28 21:08:21', 12),
(378, 140, 22, 'Green', 'Crinis ademptio valeo.', '2024-02-28 21:08:21', 7),
(379, 159, 48, 'Yellow', 'Casus cupiditate vulgaris enim.', '2024-02-28 21:08:21', 8),
(380, 40, 19, 'Red', 'Arguo colligo vivo truculenter deripio tergum.', '2024-02-28 21:08:21', 2),
(381, 224, 36, 'Yellow', 'Arcus deprimo congregatio aegrotatio crepusculum tolero blanditiis delinquo adamo.', '2024-02-28 21:08:21', 12),
(382, 166, 4, 'Red', 'Vilis vir acquiro vorago.', '2024-02-28 21:08:21', 9),
(383, 277, 14, 'Red', 'Vulgaris casso bellum aegre.', '2024-02-28 21:08:21', 14),
(384, 118, 30, 'Red', 'Decet cogito adficio benevolentia tamdiu campana demo.', '2024-02-28 21:08:21', 6),
(385, 145, 40, 'Red', 'Dicta tristis tepesco varietas claustrum synagoga synagoga theologus sordeo abundans.', '2024-02-28 21:08:21', 8),
(386, 71, 18, 'Green', 'Vulgivagus dolores vulpes artificiose absque usus xiphias atrox id.', '2024-02-28 21:08:21', 4),
(387, 68, 39, 'Green', 'Cervus teres acies fugit basium.', '2024-02-28 21:08:21', 4),
(388, 143, 31, 'Green', 'Unde adfectus blanditiis stella.', '2024-02-28 21:08:21', 8),
(389, 151, 40, 'Red', 'Decens carus claro amet sum reiciendis ipsa vestrum aufero.', '2024-02-28 21:08:21', 8),
(390, 172, 16, 'Yellow', 'Cognatus spes laudantium brevis suffragium ab tempore.', '2024-02-28 21:08:21', 9),
(391, 118, 32, 'Red', 'Acsi cimentarius alveus.', '2024-02-28 21:08:21', 6),
(392, 188, 41, 'Yellow', 'Vir eum anser canis ullam.', '2024-02-28 21:08:21', 10),
(393, 175, 38, 'Red', 'Tondeo dolorem hic aegrotatio repellat teneo eius.', '2024-02-28 21:08:21', 9),
(394, 218, 16, 'Red', 'Copia adeo solutio decimus deputo corrigo vaco conqueror surculus.', '2024-02-28 21:08:21', 11),
(395, 229, 34, 'Red', 'Crur infit cuppedia desino coniuratio.', '2024-02-28 21:08:21', 12),
(396, 197, 38, 'Green', 'Tripudio quod votum curtus degenero territo demulceo vulgus conitor collum.', '2024-02-28 21:08:21', 10),
(397, 220, 7, 'Green', 'Templum asper cilicium apto caput.', '2024-02-28 21:08:21', 11),
(398, 111, 5, 'Yellow', 'Clarus arma tum occaecati toties conturbo omnis utrum.', '2024-02-28 21:08:21', 6),
(399, 256, 47, 'Red', 'Credo saepe victus sed universe cenaculum statim.', '2024-02-28 21:08:21', 13),
(400, 109, 25, 'Green', 'Venio tersus appono aqua natus.', '2024-02-28 21:08:21', 6),
(401, 188, 20, 'Yellow', 'Amoveo patior sursum tres ultra.', '2024-02-28 21:08:21', 10),
(402, 283, 6, 'Green', 'Considero animadverto cruciamentum.', '2024-02-28 21:08:21', 15),
(403, 11, 19, 'Yellow', 'Abundans chirographum arbustum.', '2024-02-28 21:08:21', 1),
(404, 81, 7, 'Yellow', 'Necessitatibus tener angelus coerceo.', '2024-02-28 21:08:21', 5),
(405, 171, 34, 'Red', 'Carcer tollo arcus audio compello asperiores aedificium.', '2024-02-28 21:08:21', 9),
(406, 40, 26, 'Green', 'Thalassinus architecto adulatio bos tunc tenetur.', '2024-02-28 21:08:21', 2),
(407, 147, 35, 'Green', 'Turba ipsum perspiciatis.', '2024-02-28 21:08:21', 8),
(408, 16, 13, 'Yellow', 'Qui votum defero acervus architecto admiratio aeternus.', '2024-02-28 21:08:21', 1),
(409, 211, 47, 'Yellow', 'Centum amet virgo calcar tergo clementia deputo.', '2024-02-28 21:08:21', 11),
(410, 240, 4, 'Green', 'Cinis delibero ex.', '2024-02-28 21:08:21', 12),
(411, 191, 26, 'Yellow', 'Admiratio ciminatio sto vigilo tubineus accusantium ocer barba caste.', '2024-02-28 21:08:21', 10),
(412, 212, 4, 'Green', 'Cattus conspergo utroque nobis depono creator constans super tutamen stipes.', '2024-02-28 21:08:21', 11),
(413, 140, 39, 'Green', 'Adeptio doloribus somniculosus inflammatio.', '2024-02-28 21:08:21', 7),
(414, 253, 5, 'Green', 'Cognatus censura vespillo antiquus tribuo canonicus pariatur tepidus.', '2024-02-28 21:08:21', 13),
(415, 139, 42, 'Yellow', 'Venio arbustum aegrus terreo sui nisi non sonitus.', '2024-02-28 21:08:21', 7),
(416, 118, 26, 'Yellow', 'Ultio curso volaticus concedo.', '2024-02-28 21:08:21', 6),
(417, 139, 20, 'Green', 'Territo curso ciminatio copiose charisma cupiditate paulatim solutio caste vulnero.', '2024-02-28 21:08:21', 7),
(418, 55, 45, 'Yellow', 'Cedo tamquam temporibus vindico tepesco harum demonstro deleo triumphus tergeo.', '2024-02-28 21:08:21', 3),
(419, 140, 43, 'Green', 'Temperantia eos curto sperno vel.', '2024-02-28 21:08:21', 7),
(420, 115, 20, 'Green', 'Facere culpo audentia.', '2024-02-28 21:08:21', 6),
(421, 239, 46, 'Red', 'Ad decipio admoveo cervus theatrum sodalitas surculus accusator ipsum.', '2024-02-28 21:08:21', 12),
(422, 32, 4, 'Yellow', 'Coepi sustineo absum adduco ipsam cohibeo quaerat abeo acies.', '2024-02-28 21:08:21', 2),
(423, 155, 38, 'Red', 'Deduco angelus laudantium cibus atqui arx deserunt.', '2024-02-28 21:08:21', 8),
(424, 238, 46, 'Red', 'Cresco trucido constans vel creo temporibus utique vomer.', '2024-02-28 21:08:21', 12),
(425, 133, 23, 'Red', 'Sodalitas taceo alveus degenero acidus vis depraedor.', '2024-02-28 21:08:21', 7),
(426, 294, 19, 'Green', 'Paulatim unus demoror tergiversatio delego angulus.', '2024-02-28 21:08:21', 15),
(427, 273, 25, 'Red', 'Tollo talis aegrotatio cena natus vulticulus.', '2024-02-28 21:08:21', 14),
(428, 83, 24, 'Green', 'Comburo textus collum addo subseco canonicus alienus artificiose modi.', '2024-02-28 21:08:21', 5),
(429, 205, 39, 'Green', 'Cohors porro asper tendo curvo ad defleo cedo cilicium.', '2024-02-28 21:08:21', 11),
(430, 211, 21, 'Red', 'Ara sol quia decens ancilla clarus allatus.', '2024-02-28 21:08:21', 11),
(431, 179, 31, 'Red', 'Mollitia temptatio possimus.', '2024-02-28 21:08:21', 9),
(432, 219, 1, 'Yellow', 'Bonus arx suspendo tempora verecundia absque vado capillus solum sono.', '2024-02-28 21:08:21', 11),
(433, 287, 8, 'Red', 'Textor solutio sumo totus.', '2024-02-28 21:08:21', 15),
(434, 149, 32, 'Red', 'Tempore soleo cinis dedico tum capillus derideo.', '2024-02-28 21:08:21', 8),
(435, 298, 46, 'Yellow', 'Tempora tubineus terebro venustas.', '2024-02-28 21:08:21', 15),
(436, 218, 9, 'Green', 'Suggero cras turba acer viridis sunt sit audentia coerceo deleniti.', '2024-02-28 21:08:21', 11),
(437, 237, 11, 'Red', 'Aperiam crudelis quod subvenio tripudio adicio hic excepturi thema.', '2024-02-28 21:08:21', 12),
(438, 189, 2, 'Yellow', 'Tribuo supplanto consequuntur decor.', '2024-02-28 21:08:21', 10),
(439, 154, 4, 'Yellow', 'Stillicidium numquam tollo deripio.', '2024-02-28 21:08:21', 8),
(440, 164, 9, 'Green', 'Speculum defendo crebro defungo utpote speculum damno spiritus crepusculum.', '2024-02-28 21:08:21', 9),
(441, 132, 2, 'Yellow', 'Usus termes sonitus.', '2024-02-28 21:08:21', 7),
(442, 113, 15, 'Green', 'Demonstro aliquam succedo calculus speciosus texo abundans caveo vae victus.', '2024-02-28 21:08:21', 6),
(443, 131, 31, 'Yellow', 'Admiratio denique complectus cerno magni perspiciatis maxime agnitio.', '2024-02-28 21:08:21', 7),
(444, 130, 31, 'Green', 'Venio volo nobis sollers tam.', '2024-02-28 21:08:21', 7),
(445, 129, 42, 'Red', 'Astrum cubitum cultellus credo tergeo consequatur ustulo.', '2024-02-28 21:08:21', 7),
(446, 56, 46, 'Yellow', 'Pectus a conqueror calcar ara depromo nobis tabgo.', '2024-02-28 21:08:21', 3),
(447, 135, 47, 'Red', 'Contabesco exercitationem confido pecco depono.', '2024-02-28 21:08:21', 7),
(448, 85, 9, 'Yellow', 'Coepi inventore amo praesentium dolorem suus teneo clam.', '2024-02-28 21:08:21', 5),
(449, 108, 50, 'Green', 'Magni viridis debilito thesis utique numquam vociferor ambulo tabgo.', '2024-02-28 21:08:21', 6),
(450, 158, 14, 'Red', 'Amaritudo decumbo baiulus tergeo videlicet depulso.', '2024-02-28 21:08:21', 8),
(451, 182, 34, 'Green', 'Facilis denique sollicito accusator vitium vos ambulo patria suasoria vicinus.', '2024-02-28 21:08:21', 10),
(452, 181, 1, 'Green', 'Bos est eos censura maxime viriliter exercitationem acerbitas.', '2024-02-28 21:08:21', 10),
(453, 255, 17, 'Yellow', 'Provident callide pauper talio.', '2024-02-28 21:08:21', 13),
(454, 106, 6, 'Red', 'Arbitro tenax averto.', '2024-02-28 21:08:21', 6),
(455, 210, 7, 'Green', 'Cena cotidie crinis.', '2024-02-28 21:08:21', 11),
(456, 26, 42, 'Green', 'Tepidus synagoga quasi patrocinor.', '2024-02-28 21:08:21', 2),
(457, 39, 26, 'Green', 'Cohors adsidue damno velut cruciamentum vorax.', '2024-02-28 21:08:21', 2),
(458, 33, 49, 'Green', 'Vacuus delectus assentator sopor timor conscendo ater.', '2024-02-28 21:08:21', 2),
(459, 218, 46, 'Green', 'Officiis dolores conatus conforto delinquo.', '2024-02-28 21:08:21', 11),
(460, 25, 10, 'Yellow', 'Dapifer sordeo astrum abscido canto beneficium suffragium.', '2024-02-28 21:08:21', 2),
(461, 277, 14, 'Red', 'Recusandae curso subnecto auxilium rerum aeger adficio.', '2024-02-28 21:08:21', 14),
(462, 53, 46, 'Red', 'Ater aro certe molestiae uberrime altus antepono suscipio vaco deorsum.', '2024-02-28 21:08:21', 3),
(463, 129, 10, 'Yellow', 'Veniam cursim ullam aliqua ver.', '2024-02-28 21:08:21', 7),
(464, 30, 25, 'Green', 'Creptio bonus cognatus tenax super clam acquiro thorax.', '2024-02-28 21:08:21', 2),
(465, 13, 40, 'Red', 'Depraedor carmen sortitus.', '2024-02-28 21:08:21', 1),
(466, 102, 29, 'Red', 'Commodo deripio caput verumtamen tui.', '2024-02-28 21:08:21', 6),
(467, 113, 19, 'Green', 'Concedo ipsa auctor aliqua caelum dolorem curtus eligendi asperiores certus.', '2024-02-28 21:08:21', 6),
(468, 296, 42, 'Green', 'Titulus vivo vesco comprehendo.', '2024-02-28 21:08:21', 15),
(469, 266, 27, 'Yellow', 'Adfectus socius catena arx socius callide.', '2024-02-28 21:08:21', 14),
(470, 170, 8, 'Green', 'Vero tibi amor usitas deficio esse quod desidero defendo temporibus.', '2024-02-28 21:08:21', 9),
(471, 85, 48, 'Yellow', 'Defaeco victoria arbustum voluntarius voveo dolor creta aveho adnuo canto.', '2024-02-28 21:08:21', 5),
(472, 147, 30, 'Green', 'Ver acsi civis est teres deorsum.', '2024-02-28 21:08:21', 8),
(473, 91, 6, 'Yellow', 'Ver vulticulus fugiat cibo adeo spoliatio synagoga.', '2024-02-28 21:08:21', 5),
(474, 181, 10, 'Green', 'Ascisco reprehenderit vorax corpus deprimo traho chirographum stips subito.', '2024-02-28 21:08:21', 10),
(475, 32, 28, 'Green', 'Solitudo tantillus pectus arceo adduco.', '2024-02-28 21:08:21', 2),
(476, 211, 27, 'Green', 'Cribro custodia vetus sit cohibeo cognomen usque clamo.', '2024-02-28 21:08:21', 11),
(477, 225, 26, 'Yellow', 'Degenero defetiscor auctus acies adduco vestigium cotidie convoco.', '2024-02-28 21:08:21', 12),
(478, 18, 11, 'Yellow', 'Unde carbo ultra traho defungo non cornu temptatio consectetur.', '2024-02-28 21:08:21', 1),
(479, 148, 14, 'Yellow', 'Contabesco utrum tantum vespillo vigor adicio inventore illum carus.', '2024-02-28 21:08:21', 8),
(480, 62, 15, 'Green', 'Suspendo deripio patrocinor omnis at aeternus unde deprecator.', '2024-02-28 21:08:21', 4),
(481, 188, 41, 'Red', 'Cribro bibo adipiscor quasi.', '2024-02-28 21:08:21', 10),
(482, 163, 27, 'Yellow', 'Distinctio verecundia demulceo tyrannus.', '2024-02-28 21:08:21', 9),
(483, 81, 14, 'Yellow', 'Vinitor vicinus anser.', '2024-02-28 21:08:21', 5),
(484, 271, 17, 'Green', 'Id tabula ascit spoliatio omnis angulus.', '2024-02-28 21:08:21', 14),
(485, 269, 16, 'Yellow', 'Ut virgo tardus tenuis amo vomito vespillo pecus tamen.', '2024-02-28 21:08:21', 14),
(486, 217, 11, 'Green', 'Tersus tabernus totidem talio.', '2024-02-28 21:08:21', 11),
(487, 110, 25, 'Red', 'Testimonium ustulo vereor causa claudeo corrumpo alii commemoro celo.', '2024-02-28 21:08:21', 6),
(488, 9, 12, 'Yellow', 'Circumvenio varius temperantia tutis vindico.', '2024-02-28 21:08:21', 1),
(489, 103, 16, 'Green', 'Cernuus provident territo curriculum brevis.', '2024-02-28 21:08:21', 6),
(490, 208, 43, 'Green', 'Volubilis summisse amplexus valeo adaugeo artificiose vitae.', '2024-02-28 21:08:21', 11),
(491, 188, 32, 'Yellow', 'Clibanus ver textus vetus eos.', '2024-02-28 21:08:21', 10),
(492, 156, 13, 'Red', 'Thalassinus paulatim repellat tepesco desipio trepide amaritudo dedecor ceno.', '2024-02-28 21:08:21', 8),
(493, 21, 6, 'Green', 'Distinctio curtus succurro similique arbor concido suadeo suggero.', '2024-02-28 21:08:21', 2),
(494, 253, 17, 'Yellow', 'Carpo ascit sonitus.', '2024-02-28 21:08:21', 13),
(495, 257, 21, 'Green', 'Currus teres veritatis vomica.', '2024-02-28 21:08:21', 13),
(496, 183, 48, 'Yellow', 'Conitor clamo amo attonbitus temperantia adficio cervus iste.', '2024-02-28 21:08:21', 10),
(497, 214, 31, 'Yellow', 'Rerum aqua creta conitor tantum vulgo solio vinculum taedium.', '2024-02-28 21:08:21', 11);
INSERT INTO `answer` (`id`, `question_id`, `user_id`, `answerColor`, `comment`, `createdAt`, `version_id`) VALUES
(498, 224, 9, 'Yellow', 'Decimus peccatus turpis strues villa claustrum textilis tenax.', '2024-02-28 21:08:21', 12),
(499, 126, 23, 'Yellow', 'Crastinus uter aperiam absens accusantium degusto.', '2024-02-28 21:08:21', 7),
(500, 44, 35, 'Green', 'Tondeo magnam verus.', '2024-02-28 21:08:21', 3),
(501, 36, 15, 'Green', 'Currus coruscus delectatio surculus abundans carpo.', '2024-02-28 21:08:21', 2),
(502, 193, 15, 'Green', 'Copia tui corrigo accedo ventosus textor.', '2024-02-28 21:08:21', 10),
(503, 103, 43, 'Yellow', 'Terebro vis thesaurus alienus.', '2024-02-28 21:08:21', 6),
(504, 64, 32, 'Red', 'Sollicito tersus deleo cometes vulpes umquam amplexus demitto.', '2024-02-28 21:08:21', 4),
(505, 126, 11, 'Yellow', 'Curtus crur velit textor.', '2024-02-28 21:08:21', 7),
(506, 260, 22, 'Yellow', 'Attonbitus animi sequi.', '2024-02-28 21:08:21', 13),
(507, 240, 5, 'Red', 'Vitium calamitas versus cotidie.', '2024-02-28 21:08:21', 12),
(508, 28, 43, 'Red', 'Maiores taedium demergo attollo creo conspergo.', '2024-02-28 21:08:21', 2),
(509, 241, 41, 'Yellow', 'Tollo deleo tertius vulpes conduco deleo victoria.', '2024-02-28 21:08:21', 13),
(510, 65, 25, 'Red', 'Deleo deprecator arbustum aestivus maiores placeat vos vindico.', '2024-02-28 21:08:21', 4),
(511, 220, 5, 'Yellow', 'Derelinquo tener vicinus quo tenetur temeritas.', '2024-02-28 21:08:21', 11),
(512, 223, 11, 'Yellow', 'Vestrum a aestas ante depraedor cervus contigo.', '2024-02-28 21:08:21', 12),
(513, 157, 1, 'Red', 'Acsi ustulo cogito inflammatio excepturi careo tergeo.', '2024-02-28 21:08:21', 8),
(514, 236, 24, 'Red', 'Minus textus aveho audax.', '2024-02-28 21:08:21', 12),
(515, 163, 14, 'Yellow', 'Stabilis depereo demergo confugo torqueo dapifer suspendo vulgo texo eos.', '2024-02-28 21:08:21', 9),
(516, 155, 24, 'Yellow', 'Sulum vigor arbitro sulum.', '2024-02-28 21:08:21', 8),
(517, 281, 29, 'Red', 'Dolorem cavus accusator theca.', '2024-02-28 21:08:21', 15),
(518, 274, 6, 'Red', 'Temperantia desipio cohaero peccatus qui.', '2024-02-28 21:08:21', 14),
(519, 93, 49, 'Yellow', 'Spoliatio alter volutabrum triumphus bestia adipiscor cribro consequuntur deludo.', '2024-02-28 21:08:21', 5),
(520, 205, 5, 'Yellow', 'Temporibus ullus amor supra tamdiu dolore curo.', '2024-02-28 21:08:21', 11),
(521, 39, 18, 'Yellow', 'Aestivus delinquo cado curto iusto.', '2024-02-28 21:08:21', 2),
(522, 298, 42, 'Green', 'Volo tutis derideo paulatim non cubo.', '2024-02-28 21:08:21', 15),
(523, 57, 6, 'Red', 'Temeritas praesentium suadeo argumentum.', '2024-02-28 21:08:21', 3),
(524, 118, 2, 'Red', 'Tabgo abutor validus vomer.', '2024-02-28 21:08:21', 6),
(525, 154, 45, 'Red', 'Vox tergo terminatio acsi vos cum.', '2024-02-28 21:08:21', 8),
(526, 84, 2, 'Green', 'Vetus deficio apparatus tabernus.', '2024-02-28 21:08:21', 5),
(527, 2, 14, 'Yellow', 'Sit admoneo officiis vel alienus cunae auditor.', '2024-02-28 21:08:21', 1),
(528, 157, 37, 'Yellow', 'Explicabo appello adnuo.', '2024-02-28 21:08:21', 8),
(529, 243, 21, 'Red', 'Calcar abutor animi atqui praesentium defungo.', '2024-02-28 21:08:21', 13),
(530, 86, 47, 'Green', 'Adimpleo crustulum utroque.', '2024-02-28 21:08:21', 5),
(531, 66, 28, 'Green', 'Ater tunc sperno magni.', '2024-02-28 21:08:21', 4),
(532, 102, 31, 'Yellow', 'Vestigium colo verus sursum summisse.', '2024-02-28 21:08:21', 6),
(533, 233, 37, 'Red', 'Tibi deprimo arceo praesentium attero.', '2024-02-28 21:08:21', 12),
(534, 217, 6, 'Green', 'Velociter sunt acer usque timidus dolorum blanditiis demoror.', '2024-02-28 21:08:21', 11),
(535, 58, 30, 'Yellow', 'Audio vomica commemoro subnecto.', '2024-02-28 21:08:21', 3),
(536, 290, 45, 'Green', 'Alveus aduro celer creo vulgo.', '2024-02-28 21:08:21', 15),
(537, 110, 29, 'Green', 'Curso defero tumultus virga ultio credo quo aliqua qui advenio.', '2024-02-28 21:08:21', 6),
(538, 177, 38, 'Red', 'Degenero desidero aveho solio aeneus acervus nisi barba cariosus conventus.', '2024-02-28 21:08:21', 9),
(539, 83, 16, 'Red', 'Amaritudo absque creo fugit thema comitatus.', '2024-02-28 21:08:21', 5),
(540, 160, 19, 'Green', 'Calamitas aestas cum baiulus claudeo confugo.', '2024-02-28 21:08:21', 8),
(541, 202, 19, 'Yellow', 'Taedium surgo audax una tempora.', '2024-02-28 21:08:21', 11),
(542, 94, 25, 'Yellow', 'Ad demitto teres cura cilicium arcus venustas tantillus suasoria.', '2024-02-28 21:08:21', 5),
(543, 174, 48, 'Red', 'Advenio clementia terra arbustum ad totus.', '2024-02-28 21:08:21', 9),
(544, 35, 43, 'Green', 'Certus trepide saepe sono minus maiores voluptatum viduo vir adfectus.', '2024-02-28 21:08:21', 2),
(545, 190, 13, 'Green', 'Decimus usque aeternus caterva abundans aegrotatio talio constans suscipio adinventitias.', '2024-02-28 21:08:21', 10),
(546, 262, 17, 'Green', 'Timidus assentator alius vere conitor adhuc artificiose careo.', '2024-02-28 21:08:21', 14),
(547, 274, 15, 'Red', 'Viridis textus creta conturbo utique reprehenderit dapifer delego.', '2024-02-28 21:08:21', 14),
(548, 135, 43, 'Green', 'Conitor voluptatem pecco bestia atrocitas autem accusator abscido comburo.', '2024-02-28 21:08:21', 7),
(549, 193, 17, 'Green', 'Spoliatio exercitationem ab volo consuasor allatus.', '2024-02-28 21:08:21', 10),
(550, 218, 34, 'Red', 'Amplus patior ars averto spes convoco cruciamentum tubineus.', '2024-02-28 21:08:21', 11),
(551, 120, 16, 'Yellow', 'Utilis auctus credo ager aestivus iure.', '2024-02-28 21:08:21', 6),
(552, 6, 3, 'Yellow', 'Abstergo cras quaerat tribuo asper stultus tyrannus artificiose audeo odio.', '2024-02-28 21:08:21', 1),
(553, 221, 21, 'Green', 'Illum tergiversatio uter curso tempus vulariter demergo coma cultura communis.', '2024-02-28 21:08:21', 12),
(554, 56, 48, 'Green', 'Decimus explicabo harum absconditus arma acerbitas.', '2024-02-28 21:08:21', 3),
(555, 268, 35, 'Green', 'Viduo cribro somniculosus allatus caritas ante spoliatio defendo umbra.', '2024-02-28 21:08:21', 14),
(556, 29, 32, 'Red', 'Bene aliquid defaeco urbs iure amicitia.', '2024-02-28 21:08:21', 2),
(557, 73, 33, 'Green', 'Utique absque ipsam suadeo aeternus alias perferendis absque tero conicio.', '2024-02-28 21:08:21', 4),
(558, 206, 41, 'Red', 'Basium cura calco at territo patrocinor.', '2024-02-28 21:08:21', 11),
(559, 54, 37, 'Red', 'Sto armarium audentia asporto dicta velit arbor aegrotatio.', '2024-02-28 21:08:21', 3),
(560, 123, 6, 'Green', 'Possimus vaco amet coniecto nemo curatio stips.', '2024-02-28 21:08:21', 7),
(561, 104, 42, 'Red', 'Cariosus altus ceno temeritas vestrum succedo.', '2024-02-28 21:08:21', 6),
(562, 106, 22, 'Yellow', 'Videlicet vigor tracto caecus.', '2024-02-28 21:08:21', 6),
(563, 48, 19, 'Green', 'Thermae unus decerno debeo addo ter amita.', '2024-02-28 21:08:21', 3),
(564, 258, 30, 'Yellow', 'Acidus excepturi summisse similique.', '2024-02-28 21:08:21', 13),
(565, 202, 11, 'Green', 'Desolo carpo verus vomer praesentium voluptates cursus nobis perspiciatis xiphias.', '2024-02-28 21:08:21', 11),
(566, 110, 34, 'Yellow', 'Bis spargo bestia quis.', '2024-02-28 21:08:21', 6),
(567, 256, 28, 'Red', 'Ars cervus aveho.', '2024-02-28 21:08:21', 13),
(568, 186, 28, 'Yellow', 'Amissio valde clementia blandior clamo tero absorbeo.', '2024-02-28 21:08:21', 10),
(569, 236, 30, 'Green', 'Provident enim usus virga tabesco quo apto defendo corrupti crapula.', '2024-02-28 21:08:21', 12),
(570, 216, 39, 'Red', 'Supra tremo est debitis absque xiphias tendo.', '2024-02-28 21:08:21', 11),
(571, 129, 39, 'Red', 'Terga thymbra aperio.', '2024-02-28 21:08:21', 7),
(572, 193, 45, 'Red', 'Minima summopere vespillo ustulo confugo vigor celebrer.', '2024-02-28 21:08:21', 10),
(573, 44, 34, 'Red', 'Antepono animadverto tantillus cupio neque.', '2024-02-28 21:08:21', 3),
(574, 142, 8, 'Yellow', 'Ipsam aufero theologus debeo atrox decretum cervus sunt accommodo velit.', '2024-02-28 21:08:21', 8),
(575, 172, 29, 'Green', 'Adicio conforto uterque ancilla advoco capillus spiritus vulticulus.', '2024-02-28 21:08:21', 9),
(576, 166, 6, 'Green', 'Tero deinde deleo excepturi.', '2024-02-28 21:08:21', 9),
(577, 227, 31, 'Green', 'Suppono aduro auctor.', '2024-02-28 21:08:21', 12),
(578, 261, 14, 'Green', 'Demergo coaegresco adhuc sustineo enim nam coniecto.', '2024-02-28 21:08:21', 14),
(579, 69, 3, 'Green', 'Accusamus solutio tener cedo appono tempus.', '2024-02-28 21:08:21', 4),
(580, 280, 39, 'Green', 'Adstringo vapulus abscido doloremque virgo error accusator annus deprecator.', '2024-02-28 21:08:21', 14),
(581, 165, 18, 'Red', 'Vir aestas coruscus cumque accendo caterva quisquam vicissitudo astrum textor.', '2024-02-28 21:08:21', 9),
(582, 157, 33, 'Yellow', 'Odit itaque defetiscor demergo patrocinor trucido.', '2024-02-28 21:08:21', 8),
(583, 12, 34, 'Green', 'Vehemens averto strues amet hic aequitas tonsor coadunatio adsidue.', '2024-02-28 21:08:21', 1),
(584, 199, 4, 'Green', 'Fuga sulum tenax aer adficio tollo coepi beatus calamitas absconditus.', '2024-02-28 21:08:21', 10),
(585, 102, 35, 'Yellow', 'Tripudio stabilis campana desipio tolero uterque ipsum.', '2024-02-28 21:08:21', 6),
(586, 161, 31, 'Yellow', 'Demulceo quisquam atrox denuo.', '2024-02-28 21:08:21', 9),
(587, 243, 37, 'Red', 'Cattus vito caritas abeo veritatis celo torrens crapula angustus.', '2024-02-28 21:08:21', 13),
(588, 254, 3, 'Green', 'Pel aggero totam.', '2024-02-28 21:08:21', 13),
(589, 260, 29, 'Yellow', 'Ait aestas sed spiculum excepturi volubilis theatrum decumbo credo viscus.', '2024-02-28 21:08:21', 13),
(590, 159, 27, 'Yellow', 'Verbera adinventitias stabilis varietas maxime facilis deprimo aggero voco.', '2024-02-28 21:08:21', 8),
(591, 62, 3, 'Green', 'Velociter peior adinventitias aliquid curatio atrox amo.', '2024-02-28 21:08:21', 4),
(592, 298, 24, 'Green', 'Conqueror caelum aufero capitulus tergum comminor demoror.', '2024-02-28 21:08:21', 15),
(593, 51, 14, 'Red', 'Ver accendo virga curso.', '2024-02-28 21:08:21', 3),
(594, 213, 38, 'Red', 'Curo sol admoneo.', '2024-02-28 21:08:21', 11),
(595, 6, 20, 'Red', 'Vis velut auditor caste rem.', '2024-02-28 21:08:21', 1),
(596, 111, 40, 'Red', 'Apto dolorum thermae caveo alo deorsum unus.', '2024-02-28 21:08:21', 6),
(597, 204, 25, 'Yellow', 'Alienus thema vae arguo amiculum stips adipiscor umquam voluptatibus.', '2024-02-28 21:08:21', 11),
(598, 114, 28, 'Yellow', 'Eius tribuo theca.', '2024-02-28 21:08:21', 6),
(599, 165, 26, 'Yellow', 'Viridis auctor tremo dolorem spoliatio sonitus ager.', '2024-02-28 21:08:21', 9),
(600, 97, 11, 'Green', 'Tonsor subvenio iste ea officiis cruentus at.', '2024-02-28 21:08:21', 5),
(601, 132, 15, 'Green', 'Vito coniecto utilis virga.', '2024-02-28 21:08:21', 7),
(602, 48, 23, 'Green', 'Advenio inventore amo sit accendo verecundia arbustum.', '2024-02-28 21:08:21', 3),
(603, 247, 8, 'Yellow', 'Campana conduco advenio solutio reprehenderit sol.', '2024-02-28 21:08:21', 13),
(604, 153, 7, 'Red', 'Compono cogito tui arto calcar beneficium currus antiquus.', '2024-02-28 21:08:21', 8),
(605, 297, 21, 'Red', 'Modi ocer cupressus.', '2024-02-28 21:08:21', 15),
(606, 44, 16, 'Red', 'Circumvenio cruentus benigne censura.', '2024-02-28 21:08:21', 3),
(607, 146, 10, 'Yellow', 'Nihil sordeo ater admiratio ipsum auctus agnosco compono crudelis cura.', '2024-02-28 21:08:21', 8),
(608, 218, 35, 'Red', 'Totidem tertius earum pectus a depopulo tempore carus audeo.', '2024-02-28 21:08:21', 11),
(609, 202, 3, 'Yellow', 'Utilis corpus adfectus vado statua.', '2024-02-28 21:08:21', 11),
(610, 94, 4, 'Yellow', 'Defessus suppellex culpo.', '2024-02-28 21:08:21', 5),
(611, 84, 9, 'Yellow', 'Coniecto subito decumbo.', '2024-02-28 21:08:21', 5),
(612, 202, 24, 'Red', 'Combibo voluptatum bonus vis deprimo.', '2024-02-28 21:08:21', 11),
(613, 144, 48, 'Yellow', 'Bardus advoco avaritia quam admitto aer confero eaque.', '2024-02-28 21:08:21', 8),
(614, 75, 44, 'Green', 'Civitas vix beatus.', '2024-02-28 21:08:21', 4),
(615, 241, 32, 'Yellow', 'Acerbitas officiis conspergo cognatus alius.', '2024-02-28 21:08:21', 13),
(616, 209, 47, 'Yellow', 'Combibo ventito aequitas barba tubineus vulgivagus attero sophismata desolo.', '2024-02-28 21:08:21', 11),
(617, 252, 42, 'Yellow', 'Demergo impedit aeger versus verbera.', '2024-02-28 21:08:21', 13),
(618, 201, 25, 'Green', 'Varietas coepi veniam delibero alveus complectus praesentium odit volaticus ascit.', '2024-02-28 21:08:21', 11),
(619, 67, 29, 'Green', 'Sordeo adeptio appono sponte suppellex.', '2024-02-28 21:08:21', 4),
(620, 229, 29, 'Yellow', 'Porro tutamen libero debeo deinde minus.', '2024-02-28 21:08:21', 12),
(621, 156, 29, 'Yellow', 'Cibo peior capio officia validus debeo.', '2024-02-28 21:08:21', 8),
(622, 93, 42, 'Green', 'Bonus ustulo aperio fugiat ulterius autus viriliter aliquam adhuc.', '2024-02-28 21:08:21', 5),
(623, 178, 26, 'Green', 'Bibo taceo administratio.', '2024-02-28 21:08:21', 9),
(624, 155, 1, 'Green', 'Ipsum nobis supellex abduco amitto ex sursum tripudio fugiat.', '2024-02-28 21:08:21', 8),
(625, 6, 27, 'Red', 'Ait confugo voluptatem suscipio agnitio cavus tempore.', '2024-02-28 21:08:21', 1),
(626, 221, 13, 'Green', 'Conatus creator nam vereor numquam una dapifer.', '2024-02-28 21:08:21', 12),
(627, 126, 45, 'Green', 'Calco traho abscido thesis vociferor.', '2024-02-28 21:08:21', 7),
(628, 175, 32, 'Yellow', 'Sulum vere videlicet.', '2024-02-28 21:08:21', 9),
(629, 224, 48, 'Green', 'Tutis sint conatus vomito pel.', '2024-02-28 21:08:21', 12),
(630, 138, 6, 'Red', 'Clam correptius deripio decipio armarium.', '2024-02-28 21:08:21', 7),
(631, 39, 8, 'Yellow', 'Asper attero crux culpa tersus tonsor succedo adeo suppellex.', '2024-02-28 21:08:21', 2),
(632, 28, 28, 'Green', 'Comburo odio stillicidium.', '2024-02-28 21:08:21', 2),
(633, 57, 16, 'Red', 'Barba vaco ver.', '2024-02-28 21:08:21', 3),
(634, 23, 4, 'Red', 'Tardus contra conventus alveus amet at degusto.', '2024-02-28 21:08:21', 2),
(635, 202, 39, 'Red', 'Beatae defluo synagoga repudiandae.', '2024-02-28 21:08:21', 11),
(636, 261, 8, 'Red', 'Vinitor deserunt aliquam consectetur aedificium delinquo cito attonbitus decet quod.', '2024-02-28 21:08:21', 14),
(637, 90, 31, 'Green', 'Cupiditate sint audax colligo verbum cubitum.', '2024-02-28 21:08:21', 5),
(638, 247, 38, 'Yellow', 'Adnuo conqueror atque itaque venia ab cursus debeo.', '2024-02-28 21:08:21', 13),
(639, 177, 46, 'Yellow', 'Collum creber adamo adsum torrens tenus.', '2024-02-28 21:08:21', 9),
(640, 102, 47, 'Green', 'Angustus cerno synagoga vergo alius minima.', '2024-02-28 21:08:21', 6),
(641, 265, 12, 'Yellow', 'Ascit adfectus crur delectatio vomica torqueo terreo calco.', '2024-02-28 21:08:21', 14),
(642, 203, 34, 'Red', 'Aedificium spiritus unus acsi censura victus conventus.', '2024-02-28 21:08:21', 11),
(643, 61, 23, 'Yellow', 'Volva a uxor ater comes vir pax veritas vapulus illum.', '2024-02-28 21:08:21', 4),
(644, 238, 6, 'Green', 'Veritas ambitus barba accedo culpa itaque absque.', '2024-02-28 21:08:21', 12),
(645, 188, 23, 'Red', 'Somniculosus ubi baiulus.', '2024-02-28 21:08:21', 10),
(646, 210, 39, 'Green', 'Claro benigne comedo aeneus ascit absconditus.', '2024-02-28 21:08:21', 11),
(647, 19, 47, 'Yellow', 'Vulnus stultus culpo odit texo volva totidem vilitas.', '2024-02-28 21:08:21', 1),
(648, 48, 22, 'Green', 'Mollitia decretum acies autem accusamus defaeco.', '2024-02-28 21:08:21', 3),
(649, 115, 27, 'Green', 'Auditor undique volva maxime cupio volaticus.', '2024-02-28 21:08:21', 6),
(650, 152, 36, 'Green', 'Vereor currus tremo.', '2024-02-28 21:08:21', 8),
(651, 26, 41, 'Red', 'Ascisco amplexus accommodo exercitationem thesis audio tenus absconditus tumultus.', '2024-02-28 21:08:21', 2),
(652, 285, 4, 'Red', 'Stella vivo tergo apostolus eaque vester tabesco tam canis corrumpo.', '2024-02-28 21:08:21', 15),
(653, 283, 12, 'Yellow', 'Venustas solvo animadverto.', '2024-02-28 21:08:21', 15),
(654, 145, 24, 'Yellow', 'Sonitus contego traho vestigium cohibeo baiulus solutio temperantia.', '2024-02-28 21:08:21', 8),
(655, 8, 29, 'Green', 'Utor surgo super ventosus utpote stipes eum corrigo advoco admoneo.', '2024-02-28 21:08:21', 1),
(656, 232, 46, 'Yellow', 'Demoror statua totus cimentarius.', '2024-02-28 21:08:21', 12),
(657, 296, 32, 'Green', 'Caecus comitatus enim apto vir desparatus socius corroboro suspendo censura.', '2024-02-28 21:08:21', 15),
(658, 72, 17, 'Yellow', 'Aequus statua aurum adaugeo verbum claro pel.', '2024-02-28 21:08:21', 4),
(659, 290, 7, 'Red', 'Distinctio praesentium earum.', '2024-02-28 21:08:21', 15),
(660, 70, 49, 'Green', 'Carbo cuppedia aeger laudantium ante admiratio stabilis.', '2024-02-28 21:08:21', 4),
(661, 289, 32, 'Green', 'Adopto adfero tempora succurro certus tyrannus.', '2024-02-28 21:08:21', 15),
(662, 1, 34, 'Green', 'Cultellus charisma absum desparatus taedium cogito.', '2024-02-28 21:08:21', 1),
(663, 286, 39, 'Yellow', 'Perferendis abbas certus amitto.', '2024-02-28 21:08:21', 15),
(664, 116, 48, 'Green', 'Denique eius trepide veritas laudantium vallum creator conduco.', '2024-02-28 21:08:21', 6),
(665, 151, 6, 'Red', 'Tero cultellus eligendi virgo depromo conduco videlicet adhuc toties totidem.', '2024-02-28 21:08:21', 8),
(666, 16, 43, 'Yellow', 'Adeo utrum venio aegrotatio bellicus socius coniecto.', '2024-02-28 21:08:21', 1),
(667, 33, 10, 'Green', 'Maiores paulatim cibo tergeo conscendo traho sulum vergo ullam.', '2024-02-28 21:08:21', 2),
(668, 169, 37, 'Red', 'Benigne comprehendo defungo.', '2024-02-28 21:08:21', 9),
(669, 257, 42, 'Green', 'Delinquo commodi suscipit admitto commodi decor.', '2024-02-28 21:08:21', 13),
(670, 23, 42, 'Green', 'Alo denego articulus soluta quasi copia dicta defungo pel.', '2024-02-28 21:08:21', 2),
(671, 281, 20, 'Red', 'Administratio coma dolorum.', '2024-02-28 21:08:21', 15),
(672, 14, 23, 'Green', 'Pecco tego venio angelus.', '2024-02-28 21:08:21', 1),
(673, 103, 3, 'Yellow', 'Aiunt vicinus ait ratione conicio abbas tibi eos vitae adimpleo.', '2024-02-28 21:08:21', 6),
(674, 121, 32, 'Yellow', 'Tyrannus volva laudantium tonsor conturbo cubicularis tabella thesis confido.', '2024-02-28 21:08:21', 7),
(675, 159, 6, 'Red', 'Demoror crur tergo culpo vinculum sequi ipsum validus.', '2024-02-28 21:08:21', 8),
(676, 34, 46, 'Green', 'Vivo torrens assentator libero bene voluptatibus canonicus.', '2024-02-28 21:08:21', 2),
(677, 276, 5, 'Yellow', 'Vicissitudo decens defendo crastinus.', '2024-02-28 21:08:21', 14),
(678, 298, 45, 'Red', 'Aptus cometes voluptate alo defluo.', '2024-02-28 21:08:21', 15),
(679, 92, 14, 'Yellow', 'Porro solvo tandem absque cetera corona tactus.', '2024-02-28 21:08:21', 5),
(680, 107, 11, 'Yellow', 'Ullus aptus ustilo tricesimus crustulum adulatio acsi curriculum adfero.', '2024-02-28 21:08:21', 6),
(681, 28, 9, 'Green', 'Stultus acerbitas derelinquo tantillus.', '2024-02-28 21:08:21', 2),
(682, 19, 18, 'Red', 'Cresco celer virga.', '2024-02-28 21:08:21', 1),
(683, 285, 45, 'Red', 'Studio abundans vorago creber atrocitas confido atqui cavus.', '2024-02-28 21:08:21', 15),
(684, 214, 18, 'Yellow', 'Ullam assumenda averto.', '2024-02-28 21:08:21', 11),
(685, 207, 10, 'Red', 'Inventore aureus ubi adinventitias perspiciatis adipiscor possimus amoveo.', '2024-02-28 21:08:21', 11),
(686, 29, 37, 'Yellow', 'Umerus tempore acer cicuta titulus spero aeger vinum odio.', '2024-02-28 21:08:21', 2),
(687, 283, 23, 'Red', 'Certus defaeco excepturi delego summa aetas.', '2024-02-28 21:08:21', 15),
(688, 31, 26, 'Yellow', 'Tot unde synagoga.', '2024-02-28 21:08:21', 2),
(689, 213, 40, 'Green', 'Abeo assentator auditor arx terror.', '2024-02-28 21:08:21', 11),
(690, 240, 47, 'Yellow', 'Admoneo mollitia commemoro inflammatio.', '2024-02-28 21:08:21', 12),
(691, 247, 25, 'Red', 'Perspiciatis stabilis debeo ratione conatus.', '2024-02-28 21:08:21', 13),
(692, 259, 36, 'Red', 'Culpo quasi spoliatio vulnus et vulticulus commodo demum ceno porro.', '2024-02-28 21:08:21', 13),
(693, 157, 45, 'Yellow', 'Suscipit adhaero soleo dicta iusto dolorum vesper.', '2024-02-28 21:08:21', 8),
(694, 272, 31, 'Yellow', 'Convoco tonsor usque quo altus perferendis curso cursus facere.', '2024-02-28 21:08:21', 14),
(695, 13, 40, 'Yellow', 'Apparatus vilis desidero succedo blandior theologus una.', '2024-02-28 21:08:21', 1),
(696, 196, 47, 'Green', 'Cuius neque amicitia calcar.', '2024-02-28 21:08:21', 10),
(697, 261, 38, 'Red', 'Cupio aduro censura tondeo.', '2024-02-28 21:08:21', 14),
(698, 182, 30, 'Yellow', 'Admitto adipisci libero adfectus totus spes sonitus corpus.', '2024-02-28 21:08:21', 10),
(699, 258, 12, 'Yellow', 'Demonstro creator magnam cresco perspiciatis.', '2024-02-28 21:08:21', 13),
(700, 260, 33, 'Green', 'Synagoga trado deorsum suscipit vinum concido patior amet.', '2024-02-28 21:08:21', 13),
(701, 209, 8, 'Green', 'Vesco conventus advenio eaque templum tenetur annus.', '2024-02-28 21:08:21', 11),
(702, 286, 48, 'Yellow', 'Curiositas taceo carcer brevis ducimus torqueo itaque thesis.', '2024-02-28 21:08:21', 15),
(703, 262, 49, 'Yellow', 'Aer curis antea vulgivagus depraedor aperte acsi.', '2024-02-28 21:08:21', 14),
(704, 52, 19, 'Green', 'Stips cubo temperantia appono tonsor.', '2024-02-28 21:08:21', 3),
(705, 150, 12, 'Red', 'Solvo adhaero suggero utroque.', '2024-02-28 21:08:21', 8),
(706, 110, 15, 'Red', 'Theatrum dedecor aliquid amet vero annus excepturi.', '2024-02-28 21:08:21', 6),
(707, 10, 5, 'Yellow', 'Pel talus coniuratio beatus.', '2024-02-28 21:08:21', 1),
(708, 196, 16, 'Green', 'Illum aegre auxilium thermae color at arca.', '2024-02-28 21:08:21', 10),
(709, 69, 33, 'Red', 'Deludo vorago suppellex volaticus angustus comparo delicate laudantium.', '2024-02-28 21:08:21', 4),
(710, 145, 17, 'Yellow', 'Repellat patior antepono tandem collum arca bis caritas.', '2024-02-28 21:08:21', 8),
(711, 245, 17, 'Red', 'Colo tibi tamen capto.', '2024-02-28 21:08:21', 13),
(712, 263, 13, 'Green', 'Denuncio avaritia vere conscendo absconditus thesaurus sol.', '2024-02-28 21:08:21', 14),
(713, 129, 46, 'Red', 'Administratio amitto cumque cogito.', '2024-02-28 21:08:21', 7),
(714, 75, 6, 'Green', 'Caries tergiversatio quo credo aufero.', '2024-02-28 21:08:21', 4),
(715, 290, 13, 'Green', 'Perferendis bis deficio comes.', '2024-02-28 21:08:21', 15),
(716, 295, 18, 'Green', 'Ut ulterius pariatur harum tenetur dapifer.', '2024-02-28 21:08:21', 15),
(717, 273, 15, 'Red', 'Uxor utique soleo thema decipio decet universe conor subito conspergo.', '2024-02-28 21:08:21', 14),
(718, 111, 4, 'Yellow', 'Ascisco thema aestas.', '2024-02-28 21:08:21', 6),
(719, 63, 18, 'Green', 'Adnuo vito suscipit arguo eum vetus spiculum abundans sufficio.', '2024-02-28 21:08:21', 4),
(720, 197, 46, 'Yellow', 'Animi id animus utpote balbus deripio.', '2024-02-28 21:08:21', 10),
(721, 40, 4, 'Yellow', 'Sed trans concido.', '2024-02-28 21:08:21', 2),
(722, 12, 1, 'Green', 'Deprimo caelum maiores solum cauda vis comes demonstro arca.', '2024-02-28 21:08:21', 1),
(723, 257, 22, 'Green', 'Aveho arguo denego tantum ascisco voluptatibus color tamen ocer vel.', '2024-02-28 21:08:21', 13),
(724, 280, 19, 'Green', 'Asporto audeo coniuratio hic.', '2024-02-28 21:08:21', 14),
(725, 28, 8, 'Green', 'Audacia corrigo vallum vereor coadunatio vigor amo comprehendo tres tum.', '2024-02-28 21:08:21', 2),
(726, 279, 27, 'Red', 'Altus animi virtus corroboro adaugeo arceo aegrotatio.', '2024-02-28 21:08:21', 14),
(727, 187, 32, 'Green', 'Credo viduo vigor victoria porro cura.', '2024-02-28 21:08:21', 10),
(728, 274, 21, 'Green', 'Sumptus abeo truculenter.', '2024-02-28 21:08:21', 14),
(729, 209, 2, 'Red', 'Voluptate aperte civis stella timidus sustineo tamisium conitor.', '2024-02-28 21:08:21', 11),
(730, 72, 20, 'Green', 'Viriliter tametsi temporibus.', '2024-02-28 21:08:21', 4),
(731, 221, 6, 'Red', 'Curiositas defetiscor sollers beatae aegre cultura ustilo canto hic.', '2024-02-28 21:08:21', 12),
(732, 194, 40, 'Red', 'Suffragium ademptio voluptas ver.', '2024-02-28 21:08:21', 10),
(733, 120, 47, 'Red', 'Alveus crux apparatus corpus assentator solutio coniuratio.', '2024-02-28 21:08:21', 6),
(734, 272, 34, 'Red', 'Stella demo omnis considero consectetur consequuntur argumentum cetera cuppedia valetudo.', '2024-02-28 21:08:21', 14),
(735, 102, 34, 'Yellow', 'Triumphus viriliter vitae tergiversatio.', '2024-02-28 21:08:21', 6),
(736, 166, 21, 'Yellow', 'Defero suggero coepi.', '2024-02-28 21:08:21', 9),
(737, 29, 45, 'Green', 'Confugo aqua contigo.', '2024-02-28 21:08:21', 2),
(738, 43, 43, 'Green', 'Articulus validus impedit.', '2024-02-28 21:08:21', 3),
(739, 173, 9, 'Green', 'Sumptus sto cenaculum antea.', '2024-02-28 21:08:21', 9),
(740, 183, 13, 'Green', 'Tribuo speciosus canonicus.', '2024-02-28 21:08:21', 10),
(741, 176, 14, 'Yellow', 'Vulnero cupio vapulus creo vaco cui tristis.', '2024-02-28 21:08:21', 9),
(742, 108, 22, 'Red', 'Quod cribro sollers spargo uredo adiuvo administratio verbum aeternus subnecto.', '2024-02-28 21:08:21', 6),
(743, 61, 11, 'Red', 'Demonstro arca decipio viscus adsidue comes.', '2024-02-28 21:08:21', 4),
(744, 210, 16, 'Yellow', 'Deprimo corporis torrens vilitas comparo talis caelestis sollicito curvo aequus.', '2024-02-28 21:08:21', 11),
(745, 272, 32, 'Green', 'Angulus suppellex acsi supellex tamen barba charisma confido tempore.', '2024-02-28 21:08:21', 14),
(746, 283, 34, 'Red', 'Ut caecus umquam accommodo aequitas carbo despecto.', '2024-02-28 21:08:21', 15),
(747, 7, 47, 'Red', 'Aedificium cui vorax patior eum terminatio carus taedium talio terminatio.', '2024-02-28 21:08:21', 1),
(748, 47, 43, 'Green', 'Vel vitae bardus acceptus celebrer soluta terminatio praesentium anser.', '2024-02-28 21:08:21', 3),
(749, 189, 6, 'Green', 'Velit carmen turpis tenax natus tum bardus.', '2024-02-28 21:08:21', 10),
(750, 145, 11, 'Red', 'Succurro succurro sunt defaeco solium nostrum vomito nostrum cohors campana.', '2024-02-28 21:08:21', 8),
(751, 70, 4, 'Yellow', 'Acsi stips attollo.', '2024-02-28 21:08:21', 4),
(752, 104, 37, 'Green', 'Cubo custodia calamitas aestas depulso.', '2024-02-28 21:08:21', 6),
(753, 203, 2, 'Red', 'Verto torqueo thermae cohibeo.', '2024-02-28 21:08:21', 11),
(754, 53, 36, 'Red', 'Porro custodia defetiscor.', '2024-02-28 21:08:21', 3),
(755, 117, 48, 'Red', 'Thalassinus utilis accendo accusator artificiose ratione arto advenio.', '2024-02-28 21:08:21', 6),
(756, 161, 44, 'Green', 'Provident adulescens allatus anser.', '2024-02-28 21:08:21', 9),
(757, 179, 15, 'Yellow', 'Vespillo thermae curiositas defluo tergeo sub canonicus nostrum ustilo depereo.', '2024-02-28 21:08:21', 9),
(758, 81, 38, 'Green', 'Tametsi vindico cicuta decumbo officia talis facilis.', '2024-02-28 21:08:21', 5),
(759, 59, 39, 'Red', 'Teneo volup delectatio aliquid celo.', '2024-02-28 21:08:21', 3),
(760, 111, 25, 'Yellow', 'Annus sublime carmen amor trepide.', '2024-02-28 21:08:21', 6),
(761, 249, 4, 'Green', 'Vespillo acsi talus campana caste versus arma aedificium.', '2024-02-28 21:08:21', 13),
(762, 261, 32, 'Yellow', 'Adinventitias ipsum adfero et aer damno astrum terminatio.', '2024-02-28 21:08:21', 14),
(763, 115, 25, 'Green', 'Auctor dicta amplitudo volo vivo carus certe vita conservo theatrum.', '2024-02-28 21:08:21', 6),
(764, 270, 3, 'Red', 'Repellat tamen solvo conatus arma absconditus vinum ventosus quos torqueo.', '2024-02-28 21:08:21', 14),
(765, 217, 45, 'Red', 'Fugiat voluptas coniecto bos.', '2024-02-28 21:08:21', 11),
(766, 3, 27, 'Green', 'Totam impedit ratione sint.', '2024-02-28 21:08:21', 1),
(767, 132, 29, 'Green', 'Sursum debitis vulnero caecus subvenio teneo.', '2024-02-28 21:08:21', 7),
(768, 123, 35, 'Yellow', 'Contigo adfectus verbera cursus rem civis strenuus assumenda assentator advoco.', '2024-02-28 21:08:21', 7),
(769, 294, 21, 'Green', 'Baiulus thymum suffragium tristis sopor conculco usus vulgo accedo.', '2024-02-28 21:08:21', 15),
(770, 263, 16, 'Green', 'Est defluo sit atavus volup molestiae arceo demitto.', '2024-02-28 21:08:21', 14),
(771, 148, 30, 'Red', 'Aspicio solium vito id.', '2024-02-28 21:08:21', 8),
(772, 62, 48, 'Red', 'Adicio triduana succurro patria tollo cognatus perspiciatis tempore.', '2024-02-28 21:08:21', 4),
(773, 268, 46, 'Yellow', 'Patrocinor expedita tubineus iste adversus aestivus recusandae decens tenuis.', '2024-02-28 21:08:21', 14),
(774, 72, 40, 'Yellow', 'Vito alveus eveniet demo tergo ventosus substantia.', '2024-02-28 21:08:21', 4),
(775, 32, 41, 'Red', 'Agnitio amo demoror stips quae caelum adeo usus delibero compono.', '2024-02-28 21:08:21', 2),
(776, 160, 3, 'Yellow', 'Capitulus admoveo vulnus unus rem taedium trans.', '2024-02-28 21:08:21', 8),
(777, 42, 25, 'Red', 'Viscus laborum aetas synagoga vigor.', '2024-02-28 21:08:21', 3),
(778, 123, 35, 'Red', 'Sortitus decor verbum dapifer aperio curiositas caries quo.', '2024-02-28 21:08:21', 7),
(779, 36, 22, 'Yellow', 'Admoneo defluo acidus stella.', '2024-02-28 21:08:21', 2),
(780, 149, 8, 'Green', 'Desipio sperno tergum pecus somniculosus patior speciosus.', '2024-02-28 21:08:21', 8),
(781, 76, 17, 'Green', 'Perspiciatis varietas theatrum solio delinquo advenio aveho venia summa.', '2024-02-28 21:08:21', 4),
(782, 41, 50, 'Red', 'Abstergo cuppedia vestrum commodo coaegresco.', '2024-02-28 21:08:21', 3),
(783, 22, 48, 'Green', 'Antepono venio casus.', '2024-02-28 21:08:21', 2),
(784, 95, 28, 'Yellow', 'Adaugeo asperiores uberrime bis arbor paulatim corona unde.', '2024-02-28 21:08:21', 5),
(785, 197, 2, 'Green', 'Ceno quia doloremque urbanus tolero umquam coerceo voluntarius.', '2024-02-28 21:08:21', 10),
(786, 42, 45, 'Yellow', 'Ocer soleo odit somniculosus ante sodalitas denique solus sublime varietas.', '2024-02-28 21:08:21', 3),
(787, 270, 11, 'Red', 'Vinum constans curis arcesso degenero decretum neque theatrum aptus.', '2024-02-28 21:08:21', 14),
(788, 146, 2, 'Green', 'Culpo quaerat crepusculum absconditus civitas demulceo bibo.', '2024-02-28 21:08:21', 8),
(789, 197, 42, 'Yellow', 'Nobis aveho defero tamquam culpa succurro vergo arguo damnatio in.', '2024-02-28 21:08:21', 10),
(790, 170, 8, 'Green', 'Deinde vester voluptatum totidem.', '2024-02-28 21:08:21', 9),
(791, 15, 3, 'Green', 'Cum attollo tardus appositus aggredior animus atavus vere advenio.', '2024-02-28 21:08:21', 1),
(792, 40, 49, 'Green', 'Capitulus et audax turbo templum vulnero socius decet.', '2024-02-28 21:08:21', 2),
(793, 63, 20, 'Yellow', 'Campana veritatis adflicto alias atavus usitas tenetur nobis.', '2024-02-28 21:08:21', 4),
(794, 89, 2, 'Yellow', 'Communis aliquam quibusdam tandem.', '2024-02-28 21:08:21', 5),
(795, 93, 1, 'Green', 'Vesco terebro temperantia.', '2024-02-28 21:08:21', 5),
(796, 151, 49, 'Green', 'Suasoria deputo aeger possimus aegrus cedo deripio curto volo.', '2024-02-28 21:08:21', 8),
(797, 188, 10, 'Green', 'Illum earum suscipio vado adversus sollicito validus tabella.', '2024-02-28 21:08:21', 10),
(798, 239, 25, 'Green', 'Dicta viridis cubo summisse adopto adiuvo.', '2024-02-28 21:08:21', 12),
(799, 164, 25, 'Green', 'Audeo supra nemo beatae allatus inflammatio vestigium ducimus teneo demergo.', '2024-02-28 21:08:21', 9),
(800, 151, 11, 'Yellow', 'Autus sodalitas attollo argumentum vivo unde tum.', '2024-02-28 21:08:21', 8),
(801, 46, 50, 'Green', 'Ab sustineo tibi collum.', '2024-02-28 21:08:21', 3),
(802, 176, 26, 'Yellow', 'Alienus paens ab video soleo adhuc tum somniculosus urbs alienus.', '2024-02-28 21:08:21', 9),
(803, 230, 27, 'Green', 'Adsidue tertius victoria.', '2024-02-28 21:08:21', 12),
(804, 76, 40, 'Yellow', 'Valens umbra fugit sapiente caritas illo ara vitium depulso.', '2024-02-28 21:08:21', 4),
(805, 87, 33, 'Yellow', 'Ademptio casus thymbra tui.', '2024-02-28 21:08:21', 5),
(806, 162, 50, 'Green', 'Cervus terra eveniet vulgaris vita callide ademptio amiculum.', '2024-02-28 21:08:21', 9),
(807, 84, 17, 'Yellow', 'Curvo accommodo aegrotatio.', '2024-02-28 21:08:21', 5),
(808, 297, 28, 'Red', 'Cerno fugit id tempore vomica.', '2024-02-28 21:08:21', 15),
(809, 218, 10, 'Red', 'Tribuo tam abeo villa aperiam suggero adnuo velum cur.', '2024-02-28 21:08:21', 11),
(810, 171, 42, 'Green', 'Audio decumbo ademptio desino.', '2024-02-28 21:08:21', 9),
(811, 116, 11, 'Green', 'Torrens turbo coadunatio.', '2024-02-28 21:08:21', 6),
(812, 68, 21, 'Green', 'Annus asper tendo cohaero vitiosus cupiditate supellex perferendis.', '2024-02-28 21:08:21', 4),
(813, 3, 26, 'Red', 'Varius vulgivagus abeo calamitas celebrer coruscus volo.', '2024-02-28 21:08:21', 1),
(814, 166, 44, 'Green', 'Teres tredecim atrox vivo varius.', '2024-02-28 21:08:21', 9),
(815, 148, 44, 'Yellow', 'Cui tribuo tabesco cotidie suppellex praesentium.', '2024-02-28 21:08:21', 8),
(816, 190, 18, 'Red', 'Cauda suscipit quae tam despecto creo cimentarius pel cenaculum.', '2024-02-28 21:08:21', 10),
(817, 283, 7, 'Yellow', 'Thorax socius cubo culpo occaecati surgo aliquid.', '2024-02-28 21:08:21', 15),
(818, 132, 33, 'Green', 'Fuga autus temperantia volup pecus bellicus admoveo decor cura tendo.', '2024-02-28 21:08:21', 7),
(819, 14, 18, 'Green', 'Vigor calco depraedor vester catena.', '2024-02-28 21:08:21', 1),
(820, 39, 17, 'Yellow', 'Vere accommodo depulso demoror tripudio defaeco uter.', '2024-02-28 21:08:21', 2),
(821, 10, 9, 'Green', 'Atqui corona tempore admiratio universe sonitus odit vehemens.', '2024-02-28 21:08:21', 1),
(822, 208, 47, 'Red', 'Verbum audax cogito acquiro vulariter advoco.', '2024-02-28 21:08:21', 11),
(823, 190, 13, 'Yellow', 'Truculenter vilis tripudio aliquid clibanus.', '2024-02-28 21:08:21', 10),
(824, 263, 45, 'Yellow', 'Viriliter vito solitudo conatus suggero suffragium vulgo crebro adversus accusator.', '2024-02-28 21:08:21', 14),
(825, 90, 10, 'Red', 'Bonus utique adiuvo texo.', '2024-02-28 21:08:21', 5),
(826, 242, 38, 'Red', 'Comprehendo vilis tardus quidem taceo.', '2024-02-28 21:08:21', 13),
(827, 77, 15, 'Green', 'Angustus aro apto.', '2024-02-28 21:08:21', 4),
(828, 239, 40, 'Yellow', 'Vomer assentator temptatio degenero vis.', '2024-02-28 21:08:21', 12),
(829, 201, 39, 'Red', 'Paens carus quos pecto desparatus facilis canonicus minima campana nobis.', '2024-02-28 21:08:21', 11),
(830, 120, 50, 'Yellow', 'Abbas debilito crudelis cultura.', '2024-02-28 21:08:21', 6),
(831, 9, 42, 'Yellow', 'Volup creptio adduco saepe eaque tubineus cohaero victoria.', '2024-02-28 21:08:21', 1),
(832, 222, 33, 'Green', 'Conatus succurro video cursus vulticulus alter magnam commodo blandior.', '2024-02-28 21:08:21', 12),
(833, 232, 23, 'Yellow', 'Colligo summa aliqua damno verbum qui.', '2024-02-28 21:08:21', 12),
(834, 266, 22, 'Red', 'Virtus aetas eaque conor crastinus compono necessitatibus absorbeo.', '2024-02-28 21:08:21', 14),
(835, 29, 46, 'Green', 'Utor commodi tenuis cogo rem.', '2024-02-28 21:08:21', 2),
(836, 47, 29, 'Green', 'Depraedor adicio tergeo adipisci decretum.', '2024-02-28 21:08:21', 3),
(837, 176, 6, 'Yellow', 'Dedecor depereo agnitio clibanus talus.', '2024-02-28 21:08:21', 9),
(838, 70, 19, 'Red', 'Depromo sui necessitatibus tabella stillicidium crux sulum.', '2024-02-28 21:08:21', 4),
(839, 227, 40, 'Red', 'Aveho quasi voluptates aedificium.', '2024-02-28 21:08:21', 12),
(840, 128, 20, 'Green', 'Undique officia sperno cruentus degero nemo reiciendis.', '2024-02-28 21:08:21', 7),
(841, 248, 34, 'Yellow', 'Cubo undique sto.', '2024-02-28 21:08:21', 13),
(842, 240, 33, 'Green', 'Aer cribro tabgo sustineo cunctatio vita quibusdam valeo ambitus.', '2024-02-28 21:08:21', 12),
(843, 41, 22, 'Green', 'Demens calculus contra audax.', '2024-02-28 21:08:21', 3),
(844, 165, 39, 'Yellow', 'Possimus rem tolero cavus commodi tremo pauci denego atrocitas.', '2024-02-28 21:08:21', 9),
(845, 196, 50, 'Yellow', 'Decumbo ante deficio esse talio totus animi.', '2024-02-28 21:08:21', 10),
(846, 229, 17, 'Yellow', 'Solitudo dolorum tego curtus deduco aer usus vivo vomica vallum.', '2024-02-28 21:08:21', 12),
(847, 41, 2, 'Green', 'Doloribus alveus deleniti urbs autus adopto capitulus.', '2024-02-28 21:08:21', 3),
(848, 160, 38, 'Red', 'Recusandae apud possimus.', '2024-02-28 21:08:21', 8),
(849, 276, 45, 'Green', 'Coniecto aliquid infit.', '2024-02-28 21:08:21', 14),
(850, 162, 28, 'Red', 'Similique officia tonsor vulnus sapiente statim.', '2024-02-28 21:08:21', 9),
(851, 65, 49, 'Green', 'Ager temptatio cupressus assentator cur arceo quidem reiciendis omnis.', '2024-02-28 21:08:21', 4),
(852, 5, 9, 'Yellow', 'Accusator vestigium amissio capillus adeo magni.', '2024-02-28 21:08:21', 1),
(853, 146, 14, 'Red', 'Ullus cruciamentum verumtamen cunae minus talus degero.', '2024-02-28 21:08:21', 8),
(854, 162, 39, 'Red', 'Laboriosam utpote vae video.', '2024-02-28 21:08:21', 9),
(855, 277, 9, 'Yellow', 'Curatio conatus sublime vae textus.', '2024-02-28 21:08:21', 14),
(856, 111, 3, 'Red', 'Labore porro civitas vilitas assumenda.', '2024-02-28 21:08:21', 6),
(857, 216, 25, 'Red', 'Vero tolero vomica damno sufficio auctus textilis averto pariatur terra.', '2024-02-28 21:08:21', 11),
(858, 99, 42, 'Red', 'Adamo vulpes debitis aqua compello.', '2024-02-28 21:08:21', 5),
(859, 109, 15, 'Green', 'Aliqua utpote soleo cupressus uredo vestrum valetudo.', '2024-02-28 21:08:21', 6),
(860, 111, 16, 'Yellow', 'Corrigo uterque audio.', '2024-02-28 21:08:21', 6),
(861, 155, 24, 'Green', 'Acidus laborum tricesimus sophismata attonbitus clementia templum combibo delinquo.', '2024-02-28 21:08:21', 8),
(862, 273, 50, 'Green', 'Creator adfero custodia patrocinor aeneus talio ulciscor admoveo depono.', '2024-02-28 21:08:21', 14),
(863, 155, 18, 'Red', 'Cauda atavus thesaurus vulgo attonbitus velum.', '2024-02-28 21:08:21', 8),
(864, 19, 24, 'Green', 'Caelestis comis umbra aranea corrumpo.', '2024-02-28 21:08:21', 1),
(865, 7, 14, 'Yellow', 'Cur deripio suffragium accusamus quae amitto deinde volaticus sufficio.', '2024-02-28 21:08:21', 1),
(866, 127, 21, 'Yellow', 'Altus capto subnecto.', '2024-02-28 21:08:21', 7),
(867, 168, 27, 'Red', 'Denego candidus amplitudo cruentus culpo balbus clamo.', '2024-02-28 21:08:21', 9),
(868, 86, 33, 'Green', 'Uredo calco videlicet subnecto anser cubo enim admitto.', '2024-02-28 21:08:21', 5),
(869, 125, 40, 'Green', 'Somnus impedit solum arbitro.', '2024-02-28 21:08:21', 7),
(870, 92, 32, 'Red', 'Aegre aliquam copia capto decerno modi.', '2024-02-28 21:08:21', 5),
(871, 32, 36, 'Red', 'Utor vere depopulo cresco.', '2024-02-28 21:08:21', 2),
(872, 115, 49, 'Red', 'Derelinquo stella subito demergo cicuta territo vulnero velit ducimus.', '2024-02-28 21:08:21', 6),
(873, 267, 6, 'Red', 'Armarium usitas cura suggero.', '2024-02-28 21:08:21', 14),
(874, 216, 14, 'Red', 'Delicate celo suasoria tepesco cras celebrer civitas aedificium adaugeo debitis.', '2024-02-28 21:08:21', 11),
(875, 224, 33, 'Yellow', 'Sodalitas adsuesco studio cognatus caritas sufficio sapiente odio aureus.', '2024-02-28 21:08:21', 12),
(876, 226, 33, 'Green', 'Apparatus animi capio deprecator catena.', '2024-02-28 21:08:21', 12),
(877, 27, 8, 'Red', 'Cervus antepono nulla ustilo casus cariosus vestrum vilicus.', '2024-02-28 21:08:21', 2),
(878, 135, 46, 'Yellow', 'Tepidus contra xiphias conatus adamo tibi comminor corrupti aeternus.', '2024-02-28 21:08:21', 7),
(879, 30, 16, 'Red', 'Damnatio cavus aurum deporto perferendis crustulum turba.', '2024-02-28 21:08:21', 2),
(880, 300, 3, 'Green', 'Terebro solus copia amo assumenda deporto demens.', '2024-02-28 21:08:21', 15),
(881, 295, 6, 'Yellow', 'Id armarium deorsum.', '2024-02-28 21:08:21', 15),
(882, 72, 21, 'Green', 'Timor tamen temperantia solus tergo aptus labore delectus.', '2024-02-28 21:08:21', 4),
(883, 245, 12, 'Yellow', 'Advoco vomito conitor.', '2024-02-28 21:08:21', 13),
(884, 270, 49, 'Red', 'Creber hic ter amplus inflammatio clamo vomito adhuc.', '2024-02-28 21:08:21', 14),
(885, 179, 34, 'Green', 'Vestrum aspicio teres neque timidus in vorax.', '2024-02-28 21:08:21', 9),
(886, 189, 1, 'Yellow', 'Tondeo pel aro curia varietas ara.', '2024-02-28 21:08:21', 10),
(887, 250, 9, 'Yellow', 'Copia acervus cariosus verecundia benevolentia quod confido.', '2024-02-28 21:08:21', 13),
(888, 216, 27, 'Yellow', 'Repellat deorsum uter conforto adiuvo vigilo vae.', '2024-02-28 21:08:21', 11),
(889, 231, 31, 'Yellow', 'Compono damnatio tamisium victoria abscido decretum.', '2024-02-28 21:08:21', 12),
(890, 77, 31, 'Red', 'Truculenter surgo conor caput.', '2024-02-28 21:08:21', 4),
(891, 22, 2, 'Yellow', 'Theatrum cohors denuncio tener ipsum trans tyrannus.', '2024-02-28 21:08:21', 2),
(892, 186, 1, 'Green', 'Ara cetera delinquo esse.', '2024-02-28 21:08:21', 10),
(893, 138, 32, 'Red', 'Amoveo vero coma quisquam eum pecus.', '2024-02-28 21:08:21', 7),
(894, 109, 35, 'Green', 'Xiphias nobis umquam nesciunt basium carcer approbo virga tamquam.', '2024-02-28 21:08:21', 6),
(895, 113, 46, 'Green', 'Vehemens amita vita ad cado tremo calco apud suffoco.', '2024-02-28 21:08:21', 6),
(896, 231, 15, 'Green', 'Tego utor vulpes aequitas crapula amo.', '2024-02-28 21:08:21', 12),
(897, 186, 1, 'Red', 'Adaugeo amita vaco vere corroboro thorax cena ultio asper adstringo.', '2024-02-28 21:08:21', 10),
(898, 56, 9, 'Yellow', 'Arcesso dolorum aspernatur tracto coruscus tolero iure cimentarius iusto.', '2024-02-28 21:08:21', 3),
(899, 211, 29, 'Yellow', 'Adficio caecus amissio utrimque benevolentia compono torqueo.', '2024-02-28 21:08:21', 11),
(900, 126, 12, 'Green', 'Bos acidus tamisium ultio cultellus.', '2024-02-28 21:08:21', 7),
(901, 136, 22, 'Yellow', 'Vorago umerus quaerat infit trucido contego.', '2024-02-28 21:08:21', 7),
(902, 30, 28, 'Red', 'Decet quae claustrum comes reprehenderit.', '2024-02-28 21:08:21', 2),
(903, 115, 16, 'Red', 'Torrens tribuo conscendo suadeo cerno ratione velut subiungo alias tres.', '2024-02-28 21:08:21', 6),
(904, 287, 7, 'Yellow', 'Tum facere torqueo modi.', '2024-02-28 21:08:21', 15),
(905, 139, 30, 'Red', 'Tamisium abundans odio celo summopere.', '2024-02-28 21:08:21', 7),
(906, 55, 31, 'Yellow', 'Ullus veritas rerum dignissimos.', '2024-02-28 21:08:21', 3),
(907, 132, 25, 'Red', 'Caput sollers sed vinco aut.', '2024-02-28 21:08:21', 7),
(908, 231, 28, 'Green', 'Umquam quae ventosus vergo.', '2024-02-28 21:08:21', 12),
(909, 60, 5, 'Green', 'Terra vinco thymum claudeo asporto aggero calcar corrumpo summa.', '2024-02-28 21:08:21', 3),
(910, 24, 19, 'Red', 'Ars aureus aegre vitae brevis ultra repellendus.', '2024-02-28 21:08:21', 2),
(911, 131, 34, 'Yellow', 'Talio celo agnosco exercitationem.', '2024-02-28 21:08:21', 7),
(912, 145, 12, 'Red', 'Vix volubilis alias arca decor aveho verecundia.', '2024-02-28 21:08:21', 8),
(913, 239, 25, 'Green', 'Demum conitor quasi tenetur.', '2024-02-28 21:08:21', 12),
(914, 238, 41, 'Green', 'Deleniti aestivus collum articulus laborum vomica perferendis.', '2024-02-28 21:08:21', 12),
(915, 233, 42, 'Green', 'Cibo audio pecus cui.', '2024-02-28 21:08:21', 12),
(916, 231, 45, 'Yellow', 'Amicitia venustas capto.', '2024-02-28 21:08:21', 12),
(917, 11, 48, 'Green', 'Adflicto textus dignissimos trans aro.', '2024-02-28 21:08:21', 1),
(918, 157, 4, 'Yellow', 'Custodia nostrum consequatur demum.', '2024-02-28 21:08:21', 8),
(919, 37, 11, 'Red', 'Pectus ascit adfectus cum cruentus aegre.', '2024-02-28 21:08:21', 2),
(920, 147, 49, 'Yellow', 'Velum ciminatio vulgaris vir cultellus volo subseco ademptio tamen.', '2024-02-28 21:08:21', 8),
(921, 240, 12, 'Yellow', 'Unus suffoco damnatio id reiciendis defendo creator ambulo colligo.', '2024-02-28 21:08:21', 12),
(922, 213, 41, 'Red', 'Spargo sperno laborum copiose apto curto capillus provident curso abscido.', '2024-02-28 21:08:21', 11),
(923, 234, 2, 'Green', 'Asperiores iusto cum venia auditor vestigium vicissitudo aperiam centum amplexus.', '2024-02-28 21:08:21', 12),
(924, 56, 21, 'Green', 'Carus volaticus trado textus varius cilicium.', '2024-02-28 21:08:21', 3),
(925, 168, 39, 'Red', 'Candidus vir coepi ocer thymum accusator.', '2024-02-28 21:08:21', 9),
(926, 93, 17, 'Yellow', 'Dapifer annus tabgo valens viridis dolore deinde celo textor.', '2024-02-28 21:08:21', 5),
(927, 209, 38, 'Green', 'Coepi unde colligo officia consuasor temeritas.', '2024-02-28 21:08:21', 11),
(928, 234, 40, 'Red', 'Acidus ara sumptus vivo voluptatum cavus.', '2024-02-28 21:08:21', 12),
(929, 114, 25, 'Red', 'Sulum amitto succurro adhaero sponte blandior pauper amplexus est adficio.', '2024-02-28 21:08:21', 6),
(930, 138, 45, 'Green', 'Capillus blanditiis creta utpote curvo averto qui.', '2024-02-28 21:08:21', 7),
(931, 281, 40, 'Yellow', 'Acervus derelinquo somniculosus corrupti una.', '2024-02-28 21:08:21', 15),
(932, 6, 24, 'Yellow', 'Magni statim aperio tunc deficio colligo cetera pel.', '2024-02-28 21:08:21', 1),
(933, 87, 16, 'Red', 'Vitae deleniti defaeco officia pectus videlicet vere.', '2024-02-28 21:08:21', 5),
(934, 267, 14, 'Green', 'Cernuus deprimo deficio suscipio ademptio sperno xiphias mollitia.', '2024-02-28 21:08:21', 14),
(935, 80, 7, 'Green', 'Contra apud vulgaris substantia.', '2024-02-28 21:08:21', 4),
(936, 159, 44, 'Red', 'Via tamen vetus casus peccatus amaritudo xiphias maxime.', '2024-02-28 21:08:21', 8),
(937, 48, 10, 'Red', 'Aiunt benigne perspiciatis deserunt iure distinctio thorax.', '2024-02-28 21:08:21', 3),
(938, 272, 35, 'Yellow', 'Comburo auditor volutabrum balbus spiculum defessus vomer supra adfero.', '2024-02-28 21:08:21', 14),
(939, 223, 34, 'Green', 'Appello dolorem territo sustineo abeo demo placeat.', '2024-02-28 21:08:21', 12),
(940, 267, 43, 'Red', 'Cunae alias aestus aeternus aperte decens vulariter.', '2024-02-28 21:08:21', 14),
(941, 196, 44, 'Yellow', 'Asporto curso adinventitias.', '2024-02-28 21:08:21', 10),
(942, 292, 44, 'Green', 'Ulterius asporto stella benevolentia vapulus consuasor.', '2024-02-28 21:08:21', 15),
(943, 66, 32, 'Yellow', 'Cena doloribus laboriosam patrocinor derelinquo tenax depromo.', '2024-02-28 21:08:21', 4),
(944, 212, 50, 'Green', 'Vindico temeritas cotidie.', '2024-02-28 21:08:21', 11),
(945, 100, 22, 'Red', 'Vilitas tergo calculus voveo aiunt comparo veniam usque tabula stabilis.', '2024-02-28 21:08:21', 5),
(946, 133, 47, 'Green', 'Nihil solum subiungo tibi.', '2024-02-28 21:08:21', 7),
(947, 256, 2, 'Yellow', 'Ducimus coaegresco absorbeo cupiditas corroboro solus.', '2024-02-28 21:08:21', 13),
(948, 170, 45, 'Red', 'Solus blandior usitas illo coadunatio veniam depulso volaticus corrupti vomer.', '2024-02-28 21:08:21', 9),
(949, 15, 48, 'Green', 'Vito tunc casso supellex arbitro cernuus volva aut beneficium debeo.', '2024-02-28 21:08:21', 1),
(950, 229, 19, 'Green', 'Creber eaque cui.', '2024-02-28 21:08:21', 12),
(951, 277, 28, 'Yellow', 'Optio civis desolo centum a viriliter terra adflicto itaque.', '2024-02-28 21:08:21', 14),
(952, 242, 36, 'Yellow', 'Clibanus desidero trans.', '2024-02-28 21:08:21', 13),
(953, 158, 23, 'Red', 'Libero torqueo quia cornu aggredior atrox depono defleo pel.', '2024-02-28 21:08:21', 8),
(954, 249, 31, 'Red', 'Ceno ater arbustum.', '2024-02-28 21:08:21', 13),
(955, 95, 5, 'Red', 'Vix deleo textor allatus color molestias quisquam abeo crustulum.', '2024-02-28 21:08:21', 5),
(956, 235, 26, 'Red', 'Admoneo cruentus coerceo decipio talio vomica ea artificiose.', '2024-02-28 21:08:21', 12),
(957, 111, 10, 'Yellow', 'Tot tamen umquam sollicito tepidus cohibeo perferendis adflicto amplexus.', '2024-02-28 21:08:21', 6),
(958, 187, 30, 'Green', 'Acceptus magnam attollo delicate amaritudo.', '2024-02-28 21:08:21', 10),
(959, 235, 27, 'Yellow', 'Cultura vos eius tenax deinde copia.', '2024-02-28 21:08:21', 12),
(960, 165, 49, 'Red', 'Pecus urbanus tabesco timor acceptus.', '2024-02-28 21:08:21', 9),
(961, 43, 11, 'Red', 'Cupiditate tredecim tabula aeternus trucido ater urbs cetera curso.', '2024-02-28 21:08:21', 3),
(962, 270, 42, 'Red', 'Acquiro eveniet accusamus itaque.', '2024-02-28 21:08:21', 14),
(963, 42, 29, 'Red', 'Denuncio consectetur strenuus.', '2024-02-28 21:08:21', 3),
(964, 272, 43, 'Red', 'Copiose tui patria bis atque.', '2024-02-28 21:08:21', 14),
(965, 184, 44, 'Red', 'Facere autus voco animadverto umquam altus somnus crudelis iste volaticus.', '2024-02-28 21:08:21', 10),
(966, 262, 48, 'Green', 'Depono cruciamentum nisi concido victoria angustus adiuvo amet pecco desolo.', '2024-02-28 21:08:21', 14),
(967, 31, 16, 'Red', 'Ipsam ter deinde totam calcar conicio textilis tempora.', '2024-02-28 21:08:21', 2),
(968, 24, 30, 'Red', 'Bonus incidunt nulla beatae thema cetera vomito cultura.', '2024-02-28 21:08:21', 2),
(969, 107, 25, 'Yellow', 'Vulticulus astrum angustus atavus thymbra defero harum.', '2024-02-28 21:08:21', 6),
(970, 190, 39, 'Green', 'Corona textilis bene thorax tabella quo excepturi.', '2024-02-28 21:08:21', 10),
(971, 15, 27, 'Green', 'Nobis comptus voluptate.', '2024-02-28 21:08:21', 1),
(972, 296, 11, 'Yellow', 'Rerum stella tot iusto deprecator careo sperno.', '2024-02-28 21:08:21', 15),
(973, 96, 26, 'Green', 'Deleo calamitas vitiosus bis complectus terminatio decet.', '2024-02-28 21:08:21', 5),
(974, 190, 45, 'Yellow', 'Dapifer vehemens summa deprecator in ciminatio crinis sustineo coaegresco arto.', '2024-02-28 21:08:21', 10),
(975, 3, 12, 'Green', 'Angelus vinitor incidunt clamo adflicto cultellus temperantia utpote territo quasi.', '2024-02-28 21:08:21', 1),
(976, 63, 14, 'Green', 'Vel ustulo solutio summa conventus.', '2024-02-28 21:08:21', 4),
(977, 245, 30, 'Red', 'Agnosco cur comparo caritas cruentus cultura adsidue depulso carpo.', '2024-02-28 21:08:21', 13),
(978, 103, 23, 'Green', 'Quis sustineo tres uredo ambulo quia.', '2024-02-28 21:08:21', 6),
(979, 289, 29, 'Green', 'Arguo quos creator voro.', '2024-02-28 21:08:21', 15),
(980, 255, 15, 'Green', 'Super rem adhuc occaecati abutor.', '2024-02-28 21:08:21', 13),
(981, 44, 20, 'Yellow', 'Abduco traho amo spiritus ulciscor nobis amoveo.', '2024-02-28 21:08:21', 3),
(982, 292, 8, 'Red', 'Demens admoneo circumvenio carcer corrupti esse ulciscor utpote deficio casso.', '2024-02-28 21:08:21', 15),
(983, 201, 28, 'Red', 'Contego voveo defetiscor ver termes tripudio in minima.', '2024-02-28 21:08:21', 11),
(984, 61, 41, 'Green', 'Totidem adhuc commodo crudelis tendo adipisci amo patior expedita.', '2024-02-28 21:08:21', 4),
(985, 160, 16, 'Yellow', 'Eaque exercitationem derideo degusto subiungo amaritudo titulus varius atrocitas atrox.', '2024-02-28 21:08:21', 8),
(986, 157, 47, 'Red', 'Suscipio vomica adimpleo explicabo degero voluptate.', '2024-02-28 21:08:21', 8),
(987, 222, 12, 'Green', 'Cursim deputo peccatus denuo urbanus curatio aer beatus commodo ancilla.', '2024-02-28 21:08:21', 12),
(988, 99, 48, 'Green', 'Cado victus fugit placeat tredecim patruus tam arcus tenax tabula.', '2024-02-28 21:08:21', 5),
(989, 22, 33, 'Green', 'Cur ara voluntarius voco sollers.', '2024-02-28 21:08:21', 2),
(990, 280, 24, 'Red', 'Deleo voco accusamus tumultus dolorum agnosco caecus.', '2024-02-28 21:08:21', 14);
INSERT INTO `answer` (`id`, `question_id`, `user_id`, `answerColor`, `comment`, `createdAt`, `version_id`) VALUES
(991, 181, 33, 'Red', 'Textilis corrupti voco quae eligendi vicinus cultellus validus.', '2024-02-28 21:08:21', 10),
(992, 268, 4, 'Green', 'Celer validus aetas amissio alienus ulciscor vinitor laudantium.', '2024-02-28 21:08:21', 14),
(993, 132, 10, 'Red', 'Ex defero ustulo acidus aspicio cruentus.', '2024-02-28 21:08:21', 7),
(994, 125, 37, 'Green', 'Capitulus coaegresco tyrannus condico succedo temperantia ullam cavus tabernus cometes.', '2024-02-28 21:08:21', 7),
(995, 114, 23, 'Green', 'Patria aptus valens nesciunt alienus corporis testimonium.', '2024-02-28 21:08:21', 6),
(996, 132, 27, 'Green', 'Verumtamen possimus alveus.', '2024-02-28 21:08:21', 7),
(997, 244, 24, 'Green', 'A cetera sodalitas.', '2024-02-28 21:08:21', 13),
(998, 84, 15, 'Yellow', 'Aggredior talis ipsam bos calamitas.', '2024-02-28 21:08:21', 5),
(999, 98, 18, 'Red', 'Desipio sol corona.', '2024-02-28 21:08:21', 5),
(1000, 176, 15, 'Green', 'Barba delinquo arma vado neque.', '2024-02-28 21:08:21', 9);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `company`
--

INSERT INTO `company` (`id`, `name`, `location`, `logo`) VALUES
(1, 'Harvey - Harber', 'Hettieborough', 'https://loremflickr.com/640/480?lock=3192344360779776'),
(2, 'Lemke, Boyle and Purdy', 'Little Rock', 'https://loremflickr.com/640/480?lock=2642954002890752'),
(3, 'Boyle Inc', 'East Jeramy', 'https://loremflickr.com/640/480?lock=5665307548975104'),
(4, 'Hoeger - Schumm', 'Fort Noeberg', 'https://loremflickr.com/640/480?lock=8064560737026048'),
(5, 'Carter, Hilll and Shanahan', 'Bodeboro', 'https://picsum.photos/seed/xdggeHcK/640/480'),
(6, 'White Group', 'New Agustinaboro', 'https://loremflickr.com/640/480?lock=967775820447744'),
(7, 'Stroman, Tillman and Lang', 'Lake Goldabury', 'https://loremflickr.com/640/480?lock=6674156129091584'),
(8, 'Hoeger Group', 'Windlerbury', 'https://loremflickr.com/640/480?lock=7489032124628992'),
(9, 'Collins - Koss', 'Kemmercester', 'https://picsum.photos/seed/xdhESsq/640/480'),
(10, 'Weimann, Skiles and Larkin', 'Sidneyworth', 'https://picsum.photos/seed/IWXLHW/640/480'),
(11, 'Kovacek Inc', 'Adellestad', 'https://picsum.photos/seed/9PMbl/640/480'),
(12, 'Bednar, Vandervort and Lesch', 'Hermannbury', 'https://picsum.photos/seed/neZMAF5qq/640/480'),
(13, 'Mertz, Sipes and Jerde', 'South Reedfield', 'https://picsum.photos/seed/lUV8CWA/640/480'),
(14, 'Blanda, West and Kulas', 'Port Joel', 'https://picsum.photos/seed/dRy624kGjs/640/480'),
(15, 'Mosciski, Bashirian and Dooley', 'Bertrandville', 'https://loremflickr.com/640/480?lock=7260288499843072'),
(16, 'Kuphal LLC', 'Parisiancester', 'https://loremflickr.com/640/480?lock=7421659728314368'),
(17, 'Luettgen Inc', 'Bergechester', 'https://picsum.photos/seed/EiXAL7JG2/640/480'),
(18, 'Monahan - Bashirian', 'Huelshaven', 'https://loremflickr.com/640/480?lock=8914225550327808'),
(19, 'Williamson - Beatty', 'St. Louis Park', 'https://picsum.photos/seed/KnD7IDhKmc/640/480'),
(20, 'Kunde and Sons', 'Verlieland', 'https://loremflickr.com/640/480?lock=8824837214568448'),
(21, 'Schaden - Miller', 'Appleton', 'https://loremflickr.com/640/480?lock=2332908224249856'),
(22, 'Carroll Inc', 'West Freeda', 'https://loremflickr.com/640/480?lock=401596125020160'),
(23, 'Keeling LLC', 'Pouroston', 'https://picsum.photos/seed/AIN7qk/640/480'),
(24, 'Ryan - Wolff', 'Silver Spring', 'https://picsum.photos/seed/P0KqR/640/480'),
(25, 'Marvin - Gleason', 'Johnstonhaven', 'https://loremflickr.com/640/480?lock=6733649277878272');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `company_squad`
--

CREATE TABLE `company_squad` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `squad_id` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `company_squad`
--

INSERT INTO `company_squad` (`id`, `company_id`, `squad_id`, `createdAt`) VALUES
(1, 2, 3, '2024-02-28 21:08:21'),
(2, 13, 12, '2024-02-28 21:08:21'),
(3, 10, 8, '2024-02-28 21:08:21'),
(4, 23, 14, '2024-02-28 21:08:21'),
(5, 9, 1, '2024-02-28 21:08:21'),
(6, 10, 19, '2024-02-28 21:08:21'),
(7, 11, 7, '2024-02-28 21:08:21'),
(8, 6, 13, '2024-02-28 21:08:21'),
(9, 6, 17, '2024-02-28 21:08:21'),
(10, 23, 8, '2024-02-28 21:08:21'),
(11, 5, 14, '2024-02-28 21:08:21'),
(12, 5, 11, '2024-02-28 21:08:21'),
(13, 15, 2, '2024-02-28 21:08:21'),
(14, 8, 5, '2024-02-28 21:08:21'),
(15, 3, 5, '2024-02-28 21:08:21'),
(16, 13, 9, '2024-02-28 21:08:21'),
(17, 21, 1, '2024-02-28 21:08:21'),
(18, 17, 8, '2024-02-28 21:08:21'),
(19, 6, 9, '2024-02-28 21:08:21'),
(20, 21, 1, '2024-02-28 21:08:21');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `invitation_link`
--

CREATE TABLE `invitation_link` (
  `id` int(11) NOT NULL,
  `healthcheck_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `uniqueLink` varchar(255) DEFAULT NULL,
  `isUsed` tinyint(1) DEFAULT 0,
  `expiresAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `version_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `invitation_link`
--

INSERT INTO `invitation_link` (`id`, `healthcheck_id`, `user_id`, `uniqueLink`, `isUsed`, `expiresAt`, `version_id`) VALUES
(1, 7, 43, 'd16f2cdb-9212-4432-9d18-faa9c2094655', 0, '2024-12-22 01:07:17', 7),
(2, 10, 25, 'e497c018-65cb-4336-9c89-78c412471c7d', 0, '2024-03-29 08:56:40', 10),
(3, 7, 38, 'f6bc64f7-f21b-4e8c-9445-39c55ed57bbe', 0, '2024-03-03 09:29:45', 7),
(4, 14, 10, 'aaceda48-8d23-4f88-b67f-1fa66937633b', 0, '2024-06-09 01:54:14', 14),
(5, 1, 12, '8a7ec011-3b58-4e61-a5f3-3c8e9d547037', 0, '2024-04-16 17:46:34', 1),
(6, 15, 21, '209bfa49-ad35-40b0-ad92-9b902e720477', 0, '2024-10-26 14:03:00', 15),
(7, 11, 27, '49a69a73-9fc3-49b7-b627-24ff4e057783', 0, '2024-08-06 07:39:20', 11),
(8, 10, 47, 'e478c5e2-c13e-48bf-a843-9a884e7132a2', 0, '2024-06-28 21:10:08', 10),
(9, 2, 26, '3a9c89f9-265f-4151-8081-4720b95b482a', 0, '2024-10-04 05:37:47', 2),
(10, 1, 33, '4c34d393-c5a9-4015-b9f8-0dc0a2101cbd', 0, '2024-08-18 21:35:08', 1),
(11, 7, 11, '2b68f80a-b3b1-4be7-b9ae-ebc4aa661e31', 0, '2024-12-08 20:34:16', 7),
(12, 8, 35, '246aafbf-d4db-4c13-827d-31e3a58c80d9', 0, '2025-02-10 06:30:56', 8),
(13, 2, 4, '390b2396-2cf0-4e04-9b25-878b93199d39', 0, '2024-11-11 12:29:21', 2),
(14, 4, 15, '99a2cc63-db9b-418c-8849-f4bdd41df9e7', 0, '2024-07-01 05:24:47', 4),
(15, 7, 48, 'f82ef236-f0c6-4552-bb87-5a302c55f940', 0, '2024-12-05 01:14:53', 7),
(16, 8, 50, '35f780dc-087b-4bfd-9993-7c26c15125da', 0, '2024-11-01 19:39:16', 8),
(17, 14, 6, 'dd52dad4-c737-4306-8e2d-0bae07907c19', 0, '2025-02-25 08:03:13', 14),
(18, 1, 10, 'ca8fa7f5-d486-4ace-8ae0-578c453aa2f8', 0, '2024-04-16 21:02:03', 1),
(19, 4, 14, 'bbf7605e-ffcf-46a6-9d3f-09fea5ecc484', 0, '2024-08-18 18:53:49', 4),
(20, 10, 42, '2d37fbee-fe09-4cfc-8c3c-ffbc9b2134af', 0, '2024-10-21 04:01:18', 10);

--
-- Triggers `invitation_link`
--
DELIMITER $$
CREATE TRIGGER `activate_healthcheck_after_invitation_insert` AFTER INSERT ON `invitation_link` FOR EACH ROW BEGIN
    CALL UpdateHealthCheckVersionStatus(NEW.version_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_healthcheck_version_status_after_invitation_delete` AFTER DELETE ON `invitation_link` FOR EACH ROW BEGIN
    CALL UpdateHealthCheckVersionStatus(OLD.version_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_healthcheck_version_status_after_invitation_update` AFTER UPDATE ON `invitation_link` FOR EACH ROW BEGIN
    IF OLD.version_id != NEW.version_id THEN
        CALL UpdateHealthCheckVersionStatus(OLD.version_id);
        CALL UpdateHealthCheckVersionStatus(NEW.version_id);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `healthcheck_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT 0,
  `text` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `version_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `question`
--

INSERT INTO `question` (`id`, `healthcheck_id`, `priority`, `text`, `createdAt`, `version_id`) VALUES
(1, 1, 0, 'Approbo conscendo antea suggero iusto.', '2024-02-28 21:08:21', 1),
(2, 1, 0, 'Veniam triumphus vulgaris dedecor nihil pel color.', '2024-02-28 21:08:21', 1),
(3, 1, 0, 'Aranea antiquus sublime.', '2024-02-28 21:08:21', 1),
(4, 1, 0, 'Canis sulum conturbo tres cum tolero caritas.', '2024-02-28 21:08:21', 1),
(5, 1, 0, 'Animus talus volo sustineo temperantia adversus teneo pauper et clam.', '2024-02-28 21:08:21', 1),
(6, 1, 0, 'Deficio cilicium soleo despecto amplus villa sollers coaegresco concido.', '2024-02-28 21:08:21', 1),
(7, 1, 0, 'Doloremque basium animus timor dolorum.', '2024-02-28 21:08:21', 1),
(8, 1, 0, 'Culpo labore sono usitas caecus verbera coma cattus varius audax.', '2024-02-28 21:08:21', 1),
(9, 1, 0, 'Ab candidus vilis curriculum sapiente sunt canonicus terreo vilicus verbum.', '2024-02-28 21:08:21', 1),
(10, 1, 0, 'Omnis aranea cauda officiis cupio corrigo.', '2024-02-28 21:08:21', 1),
(11, 1, 0, 'Corona conicio derelinquo surgo vetus ultio amiculum ducimus corroboro combibo.', '2024-02-28 21:08:21', 1),
(12, 1, 0, 'Usque demulceo articulus iure.', '2024-02-28 21:08:21', 1),
(13, 1, 0, 'Bonus conatus varietas consequuntur sublime rem universe trans.', '2024-02-28 21:08:21', 1),
(14, 1, 0, 'Aliquid tendo acervus decipio anser vestigium vinitor cognomen bellum.', '2024-02-28 21:08:21', 1),
(15, 1, 0, 'Carmen amicitia quia appello spiculum neque cruentus demo statim usque.', '2024-02-28 21:08:21', 1),
(16, 1, 0, 'Iste torrens itaque verbum amissio delicate dolores volaticus.', '2024-02-28 21:08:21', 1),
(17, 1, 0, 'Tergiversatio valens sonitus brevis.', '2024-02-28 21:08:21', 1),
(18, 1, 0, 'Timidus cunae truculenter ancilla adicio tabesco trepide.', '2024-02-28 21:08:21', 1),
(19, 1, 0, 'Suscipit ut verecundia adhuc illum confero crur triduana nam.', '2024-02-28 21:08:21', 1),
(20, 1, 0, 'Tempora degenero thorax cohors ventus aestivus acer torrens.', '2024-02-28 21:08:21', 1),
(21, 2, 0, 'Dicta perspiciatis aeneus aer spero maxime deprecator architecto.', '2024-02-28 21:08:21', 2),
(22, 2, 0, 'Comminor deripio colo decumbo sum.', '2024-02-28 21:08:21', 2),
(23, 2, 0, 'Argumentum ipsa venio.', '2024-02-28 21:08:21', 2),
(24, 2, 0, 'Acer amplexus vulticulus ocer aestivus vitium advenio summa abeo.', '2024-02-28 21:08:21', 2),
(25, 2, 0, 'Curriculum officia volup currus agnitio reiciendis convoco atqui non.', '2024-02-28 21:08:21', 2),
(26, 2, 0, 'Aequitas synagoga tamquam cognatus aggredior deficio viridis adimpleo.', '2024-02-28 21:08:21', 2),
(27, 2, 0, 'Terror bellicus accedo coerceo.', '2024-02-28 21:08:21', 2),
(28, 2, 0, 'Deludo culpa commemoro soluta.', '2024-02-28 21:08:21', 2),
(29, 2, 0, 'Contigo surculus utor cognatus alter asperiores adulescens cupiditate aro.', '2024-02-28 21:08:21', 2),
(30, 2, 0, 'Unde ea coruscus vitiosus illum alias.', '2024-02-28 21:08:21', 2),
(31, 2, 0, 'Assentator alo varietas somnus ambulo decens viriliter audentia animi.', '2024-02-28 21:08:21', 2),
(32, 2, 0, 'Suggero averto vulgaris sonitus auctor tolero aequus pectus capitulus desparatus.', '2024-02-28 21:08:21', 2),
(33, 2, 0, 'Defaeco conspergo cruciamentum ullus excepturi audeo socius tabgo perferendis voco.', '2024-02-28 21:08:21', 2),
(34, 2, 0, 'Utpote aspernatur contego quidem.', '2024-02-28 21:08:21', 2),
(35, 2, 0, 'Coniuratio thesis velum pel absque tristis talio.', '2024-02-28 21:08:21', 2),
(36, 2, 0, 'Pectus cursim deludo admitto vereor adficio.', '2024-02-28 21:08:21', 2),
(37, 2, 0, 'Hic ater beatus aeneus tempore creber barba.', '2024-02-28 21:08:21', 2),
(38, 2, 0, 'Articulus adimpleo tersus.', '2024-02-28 21:08:21', 2),
(39, 2, 0, 'Demergo sol valde appositus tibi ait.', '2024-02-28 21:08:21', 2),
(40, 2, 0, 'Veritas commemoro commodo tollo tribuo contra.', '2024-02-28 21:08:21', 2),
(41, 3, 0, 'Cur patrocinor nisi vinco defluo quibusdam.', '2024-02-28 21:08:21', 3),
(42, 3, 0, 'Cuppedia verus adversus cognomen canis statua.', '2024-02-28 21:08:21', 3),
(43, 3, 0, 'Deputo adicio quod aiunt utrimque copia.', '2024-02-28 21:08:21', 3),
(44, 3, 0, 'Pax comminor spero maiores statua aliquam tametsi accedo tergeo.', '2024-02-28 21:08:21', 3),
(45, 3, 0, 'Ager voco cupiditas collum trepide.', '2024-02-28 21:08:21', 3),
(46, 3, 0, 'Tui terreo damnatio.', '2024-02-28 21:08:21', 3),
(47, 3, 0, 'Talus vesica votum amaritudo casus amplexus amplexus curvo cubo paens.', '2024-02-28 21:08:21', 3),
(48, 3, 0, 'Velut vado conitor cur urbanus alias.', '2024-02-28 21:08:21', 3),
(49, 3, 0, 'Summa traho convoco adulatio adfero vester.', '2024-02-28 21:08:21', 3),
(50, 3, 0, 'Sodalitas valde sonitus adeptio cohors adulescens conor turpis delego basium.', '2024-02-28 21:08:21', 3),
(51, 3, 0, 'Sophismata accusator videlicet amplexus antiquus vetus autus.', '2024-02-28 21:08:21', 3),
(52, 3, 0, 'Colligo denique desipio degusto infit.', '2024-02-28 21:08:21', 3),
(53, 3, 0, 'Ambulo admiratio adversus.', '2024-02-28 21:08:21', 3),
(54, 3, 0, 'Cilicium sperno curvo somniculosus dolores certe cuppedia vicissitudo.', '2024-02-28 21:08:21', 3),
(55, 3, 0, 'Cogo tendo suspendo terebro ceno.', '2024-02-28 21:08:21', 3),
(56, 3, 0, 'Adnuo illum eos.', '2024-02-28 21:08:21', 3),
(57, 3, 0, 'Vel veniam adhuc vergo sum cumque tui asper.', '2024-02-28 21:08:21', 3),
(58, 3, 0, 'Ubi blanditiis ambulo adulescens coruscus officia vulariter venustas ventito.', '2024-02-28 21:08:21', 3),
(59, 3, 0, 'Anser sodalitas cubicularis audio conscendo vulgaris solus defungo adsuesco antea.', '2024-02-28 21:08:21', 3),
(60, 3, 0, 'Celebrer vulgaris spiculum vinco aro.', '2024-02-28 21:08:21', 3),
(61, 4, 0, 'Convoco anser vix alter debitis succurro desipio tenuis.', '2024-02-28 21:08:21', 4),
(62, 4, 0, 'Tam varius iste tenus sol cornu theca cado.', '2024-02-28 21:08:21', 4),
(63, 4, 0, 'Sonitus cohors teres eius tum bellicus suppellex tepidus.', '2024-02-28 21:08:21', 4),
(64, 4, 0, 'Aegre abutor comptus conculco coaegresco tertius stabilis via uter constans.', '2024-02-28 21:08:21', 4),
(65, 4, 0, 'Acquiro placeat truculenter curis solitudo velut adipisci conculco vulgaris.', '2024-02-28 21:08:21', 4),
(66, 4, 0, 'Spectaculum trucido absum adhuc copiose turbo.', '2024-02-28 21:08:21', 4),
(67, 4, 0, 'Civis audentia apto dedico valens corrumpo.', '2024-02-28 21:08:21', 4),
(68, 4, 0, 'Laborum vitae solus studio suscipio utilis paulatim utrimque depereo sono.', '2024-02-28 21:08:21', 4),
(69, 4, 0, 'Consuasor amet decipio.', '2024-02-28 21:08:21', 4),
(70, 4, 0, 'Asperiores tergeo cenaculum.', '2024-02-28 21:08:21', 4),
(71, 4, 0, 'Bis avarus aeternus ambulo.', '2024-02-28 21:08:21', 4),
(72, 4, 0, 'Aggero infit derelinquo crur barba arbitro nostrum vae texo illum.', '2024-02-28 21:08:21', 4),
(73, 4, 0, 'Concido curvo vindico conservo.', '2024-02-28 21:08:21', 4),
(74, 4, 0, 'Tripudio ab solium ultio atque.', '2024-02-28 21:08:21', 4),
(75, 4, 0, 'Adhaero adipisci spes.', '2024-02-28 21:08:21', 4),
(76, 4, 0, 'Solum vesica sustineo baiulus audeo adhaero ab vomica viscus coaegresco.', '2024-02-28 21:08:21', 4),
(77, 4, 0, 'Via curo angulus denuncio victoria agnitio.', '2024-02-28 21:08:21', 4),
(78, 4, 0, 'Defetiscor defungo canonicus spero debilito stips defero voluptates dolorem suppono.', '2024-02-28 21:08:21', 4),
(79, 4, 0, 'Adeptio deduco fuga vae amissio illo iusto sapiente cruciamentum.', '2024-02-28 21:08:21', 4),
(80, 4, 0, 'Centum ipsum damno solum suasoria aeger ventus.', '2024-02-28 21:08:21', 4),
(81, 5, 0, 'Ultra atque talus titulus excepturi tenuis.', '2024-02-28 21:08:21', 5),
(82, 5, 0, 'Traho degusto volva.', '2024-02-28 21:08:21', 5),
(83, 5, 0, 'Torqueo basium claudeo.', '2024-02-28 21:08:21', 5),
(84, 5, 0, 'Vesica cognatus taceo crebro contra.', '2024-02-28 21:08:21', 5),
(85, 5, 0, 'Amplexus ulterius volva desparatus delectatio aurum taedium canonicus articulus territo.', '2024-02-28 21:08:21', 5),
(86, 5, 0, 'Impedit ceno adulescens bos terga deporto.', '2024-02-28 21:08:21', 5),
(87, 5, 0, 'Occaecati adulatio thermae placeat suffoco.', '2024-02-28 21:08:21', 5),
(88, 5, 0, 'Vilicus tamquam suadeo denuo tolero alius cibo.', '2024-02-28 21:08:21', 5),
(89, 5, 0, 'Necessitatibus tunc numquam terebro.', '2024-02-28 21:08:21', 5),
(90, 5, 0, 'Fugit sulum ipsa.', '2024-02-28 21:08:21', 5),
(91, 5, 0, 'Vigilo cetera vulnus vester crepusculum abundans.', '2024-02-28 21:08:21', 5),
(92, 5, 0, 'Cumque colligo credo benevolentia una accusator caveo.', '2024-02-28 21:08:21', 5),
(93, 5, 0, 'Aurum tenuis subito velum suspendo toties depromo cursim pel depromo.', '2024-02-28 21:08:21', 5),
(94, 5, 0, 'Conqueror vorax sit tonsor claustrum nesciunt.', '2024-02-28 21:08:21', 5),
(95, 5, 0, 'Vado basium defaeco adeo.', '2024-02-28 21:08:21', 5),
(96, 5, 0, 'Balbus aro praesentium.', '2024-02-28 21:08:21', 5),
(97, 5, 0, 'Vox veritatis adiuvo ullus facere vulgivagus benigne.', '2024-02-28 21:08:21', 5),
(98, 5, 0, 'Tenetur quaerat deputo subseco comparo curis vado collum numquam clam.', '2024-02-28 21:08:21', 5),
(99, 5, 0, 'Patruus tubineus versus neque tres tempore culpo caritas.', '2024-02-28 21:08:21', 5),
(100, 5, 0, 'Voluptatibus tribuo unde deinde.', '2024-02-28 21:08:21', 5),
(101, 6, 0, 'Sequi error textus.', '2024-02-28 21:08:21', 6),
(102, 6, 0, 'Degusto tertius corona verecundia.', '2024-02-28 21:08:21', 6),
(103, 6, 0, 'Aspernatur sollicito tredecim tempora verumtamen curso vulpes abduco iusto cilicium.', '2024-02-28 21:08:21', 6),
(104, 6, 0, 'Temporibus theca tot aut tabgo benevolentia toties.', '2024-02-28 21:08:21', 6),
(105, 6, 0, 'Sono ventus antiquus advenio decor ultio assentator sumptus.', '2024-02-28 21:08:21', 6),
(106, 6, 0, 'Pax derelinquo vulgus torqueo charisma.', '2024-02-28 21:08:21', 6),
(107, 6, 0, 'Canonicus sed tumultus solio ater.', '2024-02-28 21:08:21', 6),
(108, 6, 0, 'Auditor velit carbo compono conduco cervus.', '2024-02-28 21:08:21', 6),
(109, 6, 0, 'Nisi triduana tricesimus.', '2024-02-28 21:08:21', 6),
(110, 6, 0, 'Vinco appositus argumentum delinquo damno.', '2024-02-28 21:08:21', 6),
(111, 6, 0, 'Tendo rerum comprehendo.', '2024-02-28 21:08:21', 6),
(112, 6, 0, 'Suffragium thorax abeo sit cernuus corrigo tardus damnatio cometes.', '2024-02-28 21:08:21', 6),
(113, 6, 0, 'Cohibeo tui tumultus.', '2024-02-28 21:08:21', 6),
(114, 6, 0, 'Alias cognatus absum.', '2024-02-28 21:08:21', 6),
(115, 6, 0, 'Dapifer cuius cupressus corroboro.', '2024-02-28 21:08:21', 6),
(116, 6, 0, 'Altus comes cattus tripudio depopulo saepe vindico aestus.', '2024-02-28 21:08:21', 6),
(117, 6, 0, 'Ex sordeo apparatus ver perferendis conspergo vae spiritus.', '2024-02-28 21:08:21', 6),
(118, 6, 0, 'Aegrotatio sortitus venustas.', '2024-02-28 21:08:21', 6),
(119, 6, 0, 'Tego nihil adipisci demergo cerno.', '2024-02-28 21:08:21', 6),
(120, 6, 0, 'Umquam maxime venustas auxilium curto cornu sponte complectus adhaero.', '2024-02-28 21:08:21', 6),
(121, 7, 0, 'Decumbo charisma vicinus.', '2024-02-28 21:08:21', 7),
(122, 7, 0, 'Sum nostrum admiratio timidus derelinquo solus curtus beatae.', '2024-02-28 21:08:21', 7),
(123, 7, 0, 'Veritas aureus thalassinus ultra unde cetera vociferor clamo totus.', '2024-02-28 21:08:21', 7),
(124, 7, 0, 'Odio cervus comptus vulnus tabella aro.', '2024-02-28 21:08:21', 7),
(125, 7, 0, 'Denego admiratio adaugeo.', '2024-02-28 21:08:21', 7),
(126, 7, 0, 'Ab adaugeo pariatur bene adstringo abeo asper ipsa arma.', '2024-02-28 21:08:21', 7),
(127, 7, 0, 'Comprehendo ustulo quibusdam comitatus vociferor amor templum ter.', '2024-02-28 21:08:21', 7),
(128, 7, 0, 'Avaritia utrimque chirographum ut viridis.', '2024-02-28 21:08:21', 7),
(129, 7, 0, 'Blanditiis conqueror curis.', '2024-02-28 21:08:21', 7),
(130, 7, 0, 'Decens canto suscipit demonstro.', '2024-02-28 21:08:21', 7),
(131, 7, 0, 'Tempora vapulus bardus velut corrigo civis nobis.', '2024-02-28 21:08:21', 7),
(132, 7, 0, 'Decor victus cruentus aiunt conitor.', '2024-02-28 21:08:21', 7),
(133, 7, 0, 'Utilis triduana defendo subvenio civis.', '2024-02-28 21:08:21', 7),
(134, 7, 0, 'Civitas trans creator vitium amplitudo cado degenero contego.', '2024-02-28 21:08:21', 7),
(135, 7, 0, 'Abstergo vir canto inflammatio ver.', '2024-02-28 21:08:21', 7),
(136, 7, 0, 'Suscipio demo cursim modi.', '2024-02-28 21:08:21', 7),
(137, 7, 0, 'Bonus tenax distinctio adopto quasi tempora cruentus alveus tepesco minima.', '2024-02-28 21:08:21', 7),
(138, 7, 0, 'Tantillus timidus videlicet delinquo cupiditas versus compono ascit centum.', '2024-02-28 21:08:21', 7),
(139, 7, 0, 'Video deduco capto cibus ut adopto voluptates collum antepono dedecor.', '2024-02-28 21:08:21', 7),
(140, 7, 0, 'Complectus adduco ulterius.', '2024-02-28 21:08:21', 7),
(141, 8, 0, 'Sit ullam arbor consectetur talus.', '2024-02-28 21:08:21', 8),
(142, 8, 0, 'Articulus undique amplexus subnecto commodi.', '2024-02-28 21:08:21', 8),
(143, 8, 0, 'Crur abscido absque solus arca tabernus delicate centum.', '2024-02-28 21:08:21', 8),
(144, 8, 0, 'Culpo sumo venio sonitus adulatio repudiandae peccatus voluptas.', '2024-02-28 21:08:21', 8),
(145, 8, 0, 'Tenus tersus spectaculum terminatio trepide tertius currus cupiditate usitas alter.', '2024-02-28 21:08:21', 8),
(146, 8, 0, 'Sto sunt appello.', '2024-02-28 21:08:21', 8),
(147, 8, 0, 'Admiratio cornu barba utique.', '2024-02-28 21:08:21', 8),
(148, 8, 0, 'Circumvenio decor traho sperno.', '2024-02-28 21:08:21', 8),
(149, 8, 0, 'Sapiente cimentarius quo dedecor talus pel recusandae arbustum.', '2024-02-28 21:08:21', 8),
(150, 8, 0, 'Acceptus arcus tantum uberrime ultio conduco adulescens ocer.', '2024-02-28 21:08:21', 8),
(151, 8, 0, 'Audeo turbo culpa.', '2024-02-28 21:08:21', 8),
(152, 8, 0, 'Tyrannus repellat adeo ulterius rem sui vitiosus.', '2024-02-28 21:08:21', 8),
(153, 8, 0, 'Vitiosus volubilis degenero.', '2024-02-28 21:08:21', 8),
(154, 8, 0, 'Antea amplitudo denuo alveus sonitus cattus ultra terga sophismata admoveo.', '2024-02-28 21:08:21', 8),
(155, 8, 0, 'Adulatio vinum valde aggero animi cogito tondeo terra.', '2024-02-28 21:08:21', 8),
(156, 8, 0, 'Quam illo vel derideo deserunt tabesco desipio crinis.', '2024-02-28 21:08:21', 8),
(157, 8, 0, 'Cumque corrigo cupiditas tribuo.', '2024-02-28 21:08:21', 8),
(158, 8, 0, 'Caterva bellum cetera.', '2024-02-28 21:08:21', 8),
(159, 8, 0, 'Capto velut tardus dignissimos ea atavus ars cohibeo currus condico.', '2024-02-28 21:08:21', 8),
(160, 8, 0, 'Astrum rerum acidus una curvo.', '2024-02-28 21:08:21', 8),
(161, 9, 0, 'Ait conforto confido abeo celer.', '2024-02-28 21:08:21', 9),
(162, 9, 0, 'Solus rem beneficium delinquo comprehendo crux suadeo.', '2024-02-28 21:08:21', 9),
(163, 9, 0, 'Copia magnam articulus.', '2024-02-28 21:08:21', 9),
(164, 9, 0, 'Amor infit demum spargo agnosco.', '2024-02-28 21:08:21', 9),
(165, 9, 0, 'Communis vicinus civis desidero crux vis currus.', '2024-02-28 21:08:21', 9),
(166, 9, 0, 'Desparatus numquam attollo summisse titulus attero patria.', '2024-02-28 21:08:21', 9),
(167, 9, 0, 'Pectus copiose aureus asper condico balbus cena arbitro condico.', '2024-02-28 21:08:21', 9),
(168, 9, 0, 'Abutor cunabula ars averto volva.', '2024-02-28 21:08:21', 9),
(169, 9, 0, 'Minima suus cinis.', '2024-02-28 21:08:21', 9),
(170, 9, 0, 'Delicate advoco et verecundia caste coma aureus sint demum.', '2024-02-28 21:08:21', 9),
(171, 9, 0, 'Occaecati vinco sit virgo odit.', '2024-02-28 21:08:21', 9),
(172, 9, 0, 'Dens addo adopto thorax depulso ait ultio.', '2024-02-28 21:08:21', 9),
(173, 9, 0, 'Contigo vomica pariatur natus nobis sulum arguo.', '2024-02-28 21:08:21', 9),
(174, 9, 0, 'Vita arbitro asper apto admoveo apto concido.', '2024-02-28 21:08:21', 9),
(175, 9, 0, 'Canonicus desino arceo demonstro dens itaque votum antepono subvenio cursim.', '2024-02-28 21:08:21', 9),
(176, 9, 0, 'Calco voro aureus vesica.', '2024-02-28 21:08:21', 9),
(177, 9, 0, 'Abstergo voluptate vestigium canonicus omnis verto caveo thymbra.', '2024-02-28 21:08:21', 9),
(178, 9, 0, 'Cernuus compono universe vorax vigor coma.', '2024-02-28 21:08:21', 9),
(179, 9, 0, 'Adflicto advenio ago acsi amplexus suspendo dolore comedo.', '2024-02-28 21:08:21', 9),
(180, 9, 0, 'Adeptio unus votum surgo.', '2024-02-28 21:08:21', 9),
(181, 10, 0, 'Quas constans non conduco aetas votum sollers sponte via.', '2024-02-28 21:08:21', 10),
(182, 10, 0, 'Spes quisquam utique suffragium sit nulla sopor cupressus.', '2024-02-28 21:08:21', 10),
(183, 10, 0, 'Velociter error conatus.', '2024-02-28 21:08:21', 10),
(184, 10, 0, 'Verus utor delinquo solus.', '2024-02-28 21:08:21', 10),
(185, 10, 0, 'Decretum depromo vicissitudo surculus.', '2024-02-28 21:08:21', 10),
(186, 10, 0, 'Crebro verbera sto conservo temptatio repellat conicio inventore tyrannus.', '2024-02-28 21:08:21', 10),
(187, 10, 0, 'Acsi ea admitto vacuus ab custodia congregatio.', '2024-02-28 21:08:21', 10),
(188, 10, 0, 'Sperno appositus vesco vilicus veniam vigilo sperno argumentum.', '2024-02-28 21:08:21', 10),
(189, 10, 0, 'Fugiat summisse vestigium cubo.', '2024-02-28 21:08:21', 10),
(190, 10, 0, 'Confero canonicus varietas assumenda timor dicta arbitro.', '2024-02-28 21:08:21', 10),
(191, 10, 0, 'Repudiandae confugo candidus.', '2024-02-28 21:08:21', 10),
(192, 10, 0, 'Adaugeo sustineo bos aspernatur repellat cogo tam reprehenderit creber vilicus.', '2024-02-28 21:08:21', 10),
(193, 10, 0, 'Venia creber amicitia circumvenio usus curis comitatus.', '2024-02-28 21:08:21', 10),
(194, 10, 0, 'Civitas cattus super vero.', '2024-02-28 21:08:21', 10),
(195, 10, 0, 'Adsum temporibus tibi curso venio abbas adsidue versus.', '2024-02-28 21:08:21', 10),
(196, 10, 0, 'Caterva averto depono vociferor solitudo voluntarius averto tantum.', '2024-02-28 21:08:21', 10),
(197, 10, 0, 'Enim demoror volo tabernus aut.', '2024-02-28 21:08:21', 10),
(198, 10, 0, 'Tero audio desolo decet vere desparatus.', '2024-02-28 21:08:21', 10),
(199, 10, 0, 'Cattus alienus cetera.', '2024-02-28 21:08:21', 10),
(200, 10, 0, 'Sollicito uredo carus vicinus recusandae architecto.', '2024-02-28 21:08:21', 10),
(201, 11, 0, 'Condico atavus adipiscor celebrer avarus thermae magnam ager nobis.', '2024-02-28 21:08:21', 11),
(202, 11, 0, 'Stabilis amiculum solium officiis depopulo alius.', '2024-02-28 21:08:21', 11),
(203, 11, 0, 'Video vulgo vapulus damno assentator ambitus adsum totus.', '2024-02-28 21:08:21', 11),
(204, 11, 0, 'Torrens venustas calculus tunc vilis conservo deprecator.', '2024-02-28 21:08:21', 11),
(205, 11, 0, 'Baiulus summa aperte crur coepi valens eligendi utpote beneficium.', '2024-02-28 21:08:21', 11),
(206, 11, 0, 'Cenaculum debeo curiositas teres omnis.', '2024-02-28 21:08:21', 11),
(207, 11, 0, 'Dedico adfero tenax antiquus.', '2024-02-28 21:08:21', 11),
(208, 11, 0, 'Cubitum sollicito cursus curatio amita velut adhuc.', '2024-02-28 21:08:21', 11),
(209, 11, 0, 'Undique deprimo admoneo odit despecto armarium.', '2024-02-28 21:08:21', 11),
(210, 11, 0, 'Quasi natus votum cunae sonitus inventore arx bellum.', '2024-02-28 21:08:21', 11),
(211, 11, 0, 'Voluptatum valde abstergo reiciendis enim stillicidium adaugeo pauci voluptates.', '2024-02-28 21:08:21', 11),
(212, 11, 0, 'Vulariter amo deficio aestas sol solvo.', '2024-02-28 21:08:21', 11),
(213, 11, 0, 'Vox tubineus casso.', '2024-02-28 21:08:21', 11),
(214, 11, 0, 'Asper creator cunae.', '2024-02-28 21:08:21', 11),
(215, 11, 0, 'Admitto trucido summa accendo tolero appello sumo bis solvo tenuis.', '2024-02-28 21:08:21', 11),
(216, 11, 0, 'Patruus thesis socius suffragium.', '2024-02-28 21:08:21', 11),
(217, 11, 0, 'Pariatur validus depopulo sono theca cruciamentum fugit tergeo sollers antepono.', '2024-02-28 21:08:21', 11),
(218, 11, 0, 'Collum creptio audeo aegrus impedit admiratio.', '2024-02-28 21:08:21', 11),
(219, 11, 0, 'Demergo utique doloremque tonsor.', '2024-02-28 21:08:21', 11),
(220, 11, 0, 'Voluntarius truculenter volutabrum nemo cena.', '2024-02-28 21:08:21', 11),
(221, 12, 0, 'Territo sulum peior solutio ulciscor quasi cito.', '2024-02-28 21:08:21', 12),
(222, 12, 0, 'Argentum clam vapulus theologus strues tero clarus accommodo tamquam acceptus.', '2024-02-28 21:08:21', 12),
(223, 12, 0, 'Animus cornu vobis ventosus universe tunc.', '2024-02-28 21:08:21', 12),
(224, 12, 0, 'Vilicus accommodo caveo celer speculum itaque dolorum urbanus.', '2024-02-28 21:08:21', 12),
(225, 12, 0, 'Vereor velum vix comparo eligendi.', '2024-02-28 21:08:21', 12),
(226, 12, 0, 'Vestrum autus defessus cresco aiunt terebro sui dens solum vae.', '2024-02-28 21:08:21', 12),
(227, 12, 0, 'Cribro arceo deinde verbum vitae accusantium argumentum.', '2024-02-28 21:08:21', 12),
(228, 12, 0, 'Aro theatrum rerum demitto audeo voluntarius acervus.', '2024-02-28 21:08:21', 12),
(229, 12, 0, 'Amplitudo accusator pectus amplexus tergum cultura atavus debitis vulnus vester.', '2024-02-28 21:08:21', 12),
(230, 12, 0, 'Placeat vesco corona assumenda.', '2024-02-28 21:08:21', 12),
(231, 12, 0, 'Turpis cenaculum balbus cubitum.', '2024-02-28 21:08:21', 12),
(232, 12, 0, 'Tabgo verumtamen suus.', '2024-02-28 21:08:21', 12),
(233, 12, 0, 'Demo denuo arbustum civis.', '2024-02-28 21:08:21', 12),
(234, 12, 0, 'Consequatur pel amor conforto amplexus valeo ascit earum crur.', '2024-02-28 21:08:21', 12),
(235, 12, 0, 'A iste magni tunc.', '2024-02-28 21:08:21', 12),
(236, 12, 0, 'Civis cresco perspiciatis annus degusto pectus cogo succurro maiores nisi.', '2024-02-28 21:08:21', 12),
(237, 12, 0, 'Coaegresco vulticulus vorago conscendo acidus quaerat suasoria spoliatio apto desipio.', '2024-02-28 21:08:21', 12),
(238, 12, 0, 'Civitas eum iure spargo impedit magnam reiciendis aegrus canto.', '2024-02-28 21:08:21', 12),
(239, 12, 0, 'Recusandae crapula aeternus degusto velut vos vigilo deripio vita audeo.', '2024-02-28 21:08:21', 12),
(240, 12, 0, 'Deserunt certe iste.', '2024-02-28 21:08:21', 12),
(241, 13, 0, 'Beatus pecus adsidue sursum circumvenio.', '2024-02-28 21:08:21', 13),
(242, 13, 0, 'Cultura vilicus magnam tandem caterva repellendus quos et coerceo.', '2024-02-28 21:08:21', 13),
(243, 13, 0, 'Vomito deduco avarus tactus texo.', '2024-02-28 21:08:21', 13),
(244, 13, 0, 'Surgo accusantium delibero arx sono.', '2024-02-28 21:08:21', 13),
(245, 13, 0, 'Teneo pecus accusamus.', '2024-02-28 21:08:21', 13),
(246, 13, 0, 'Molestias harum vigor socius vinco tepesco argumentum beneficium iusto.', '2024-02-28 21:08:21', 13),
(247, 13, 0, 'Artificiose argentum vulgaris.', '2024-02-28 21:08:21', 13),
(248, 13, 0, 'Commemoro tamisium accedo colo deserunt vobis minus accusator depereo.', '2024-02-28 21:08:21', 13),
(249, 13, 0, 'Vae iusto ad solutio suscipio autus allatus acies.', '2024-02-28 21:08:21', 13),
(250, 13, 0, 'Basium concedo adstringo ustilo ver celer crux atavus vobis tredecim.', '2024-02-28 21:08:21', 13),
(251, 13, 0, 'Vulnus adhaero virtus.', '2024-02-28 21:08:21', 13),
(252, 13, 0, 'Corrigo amicitia dapifer veniam.', '2024-02-28 21:08:21', 13),
(253, 13, 0, 'Traho talio deserunt tres vindico comptus abduco nostrum.', '2024-02-28 21:08:21', 13),
(254, 13, 0, 'Tenus ustulo adhaero beatus vetus vetus.', '2024-02-28 21:08:21', 13),
(255, 13, 0, 'Acerbitas acervus aptus.', '2024-02-28 21:08:21', 13),
(256, 13, 0, 'Succurro tollo adduco statim nihil corpus.', '2024-02-28 21:08:21', 13),
(257, 13, 0, 'Vivo quaerat aureus auctus quidem decumbo numquam consequuntur ver demo.', '2024-02-28 21:08:21', 13),
(258, 13, 0, 'Alius coniuratio verumtamen succurro abutor.', '2024-02-28 21:08:21', 13),
(259, 13, 0, 'Molestias tracto spoliatio thesis crustulum suffragium terminatio via debilito.', '2024-02-28 21:08:21', 13),
(260, 13, 0, 'Atrocitas uterque clarus territo terror cohaero autem certe.', '2024-02-28 21:08:21', 13),
(261, 14, 0, 'Suasoria bestia villa venia aperiam.', '2024-02-28 21:08:21', 14),
(262, 14, 0, 'Suppono complectus caritas alias decet urbs tabgo subvenio combibo repellat.', '2024-02-28 21:08:21', 14),
(263, 14, 0, 'Tracto ratione omnis adulatio dedecor caput cavus collum abutor.', '2024-02-28 21:08:21', 14),
(264, 14, 0, 'Thesaurus pauper a sed correptius.', '2024-02-28 21:08:21', 14),
(265, 14, 0, 'Degusto repudiandae suppellex teres annus alienus vix sumo crapula verus.', '2024-02-28 21:08:21', 14),
(266, 14, 0, 'Optio eius concedo angustus alo baiulus sublime.', '2024-02-28 21:08:21', 14),
(267, 14, 0, 'Desolo vis nulla.', '2024-02-28 21:08:21', 14),
(268, 14, 0, 'Turpis compono accendo dolore tempore demitto verto praesentium conscendo.', '2024-02-28 21:08:21', 14),
(269, 14, 0, 'Repellendus vir totus aggero maxime vulgaris vulgo adfero volva.', '2024-02-28 21:08:21', 14),
(270, 14, 0, 'Accusator enim varietas praesentium delicate vigor accommodo arto cenaculum natus.', '2024-02-28 21:08:21', 14),
(271, 14, 0, 'Cernuus aegre tabernus occaecati ambitus.', '2024-02-28 21:08:21', 14),
(272, 14, 0, 'Delectatio astrum stips curvo adflicto stipes aufero.', '2024-02-28 21:08:21', 14),
(273, 14, 0, 'Termes trucido bestia.', '2024-02-28 21:08:21', 14),
(274, 14, 0, 'Possimus adhuc quos carpo adsum ullam corrigo.', '2024-02-28 21:08:21', 14),
(275, 14, 0, 'Cena tredecim eos.', '2024-02-28 21:08:21', 14),
(276, 14, 0, 'Celebrer contra cupiditate cuius taceo.', '2024-02-28 21:08:21', 14),
(277, 14, 0, 'Cenaculum comminor velit allatus sapiente.', '2024-02-28 21:08:21', 14),
(278, 14, 0, 'Abstergo viriliter volubilis deserunt accommodo creta verecundia taedium.', '2024-02-28 21:08:21', 14),
(279, 14, 0, 'Accusamus argentum vulgus tredecim candidus atrocitas conservo varietas ventito terror.', '2024-02-28 21:08:21', 14),
(280, 14, 0, 'Alius vulnus vel.', '2024-02-28 21:08:21', 14),
(281, 15, 0, 'Assentator vinitor asporto viridis contigo veritatis tempora pecco aiunt veniam.', '2024-02-28 21:08:21', 15),
(282, 15, 0, 'Vilitas thema demum ex utpote voluptates validus.', '2024-02-28 21:08:21', 15),
(283, 15, 0, 'Angelus caveo aedificium vehemens.', '2024-02-28 21:08:21', 15),
(284, 15, 0, 'Accommodo sol cenaculum vacuus recusandae cursus virtus tumultus xiphias provident.', '2024-02-28 21:08:21', 15),
(285, 15, 0, 'Vicinus vinum cuius officia veniam amoveo nam deripio.', '2024-02-28 21:08:21', 15),
(286, 15, 0, 'Avaritia termes pectus suggero contigo confugo cerno tunc.', '2024-02-28 21:08:21', 15),
(287, 15, 0, 'Corrumpo cognomen cognatus benevolentia totus socius accendo tam vaco approbo.', '2024-02-28 21:08:21', 15),
(288, 15, 0, 'Solvo absque conspergo caecus abduco.', '2024-02-28 21:08:21', 15),
(289, 15, 0, 'Utique atrocitas crur benigne apto subito delibero pauper vilicus repellat.', '2024-02-28 21:08:21', 15),
(290, 15, 0, 'Solio addo bonus id depromo cumque complectus repudiandae delego.', '2024-02-28 21:08:21', 15),
(291, 15, 0, 'Pecco aestas asper adeo quos tredecim.', '2024-02-28 21:08:21', 15),
(292, 15, 0, 'Tracto hic crastinus corona.', '2024-02-28 21:08:21', 15),
(293, 15, 0, 'Textor dapifer currus comminor vinum aegre cultellus asporto peccatus venustas.', '2024-02-28 21:08:21', 15),
(294, 15, 0, 'Curto defero tabernus.', '2024-02-28 21:08:21', 15),
(295, 15, 0, 'Aptus arbor velut carcer.', '2024-02-28 21:08:21', 15),
(296, 15, 0, 'Ventito tactus somniculosus verbera viscus.', '2024-02-28 21:08:21', 15),
(297, 15, 0, 'Spiritus alius deleniti tabgo.', '2024-02-28 21:08:21', 15),
(298, 15, 0, 'A cubicularis suscipit comprehendo celer absum illo celo.', '2024-02-28 21:08:21', 15),
(299, 15, 0, 'Videlicet collum tristis suffragium consequuntur bonus volva iusto placeat corrupti.', '2024-02-28 21:08:21', 15),
(300, 15, 0, 'Creo tribuo utpote earum.', '2024-02-28 21:08:21', 15);

--
-- Triggers `question`
--
DELIMITER $$
CREATE TRIGGER `prevent_question_change_if_healthcheck_version_active` BEFORE UPDATE ON `question` FOR EACH ROW BEGIN
    DECLARE v_healthcheck_status TINYINT;

    SELECT isActive INTO v_healthcheck_status
    FROM `healthcheck_version`
    WHERE `version_id` = OLD.version_id;

    IF v_healthcheck_status = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot update question when healthcheck version is active';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `healthcheck`
--

CREATE TABLE `healthcheck` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `healthcheck`
--

INSERT INTO `healthcheck` (`id`, `title`, `description`, `manager_id`, `createdAt`) VALUES
(1, 'defero urbanus comparo', 'Conicio voluptatibus defetiscor uredo ulterius natus. Asperiores ventus ancilla arceo depono porro. Ater tabernus comminor velociter quaerat. Basium ullus amet beneficium articulus.', 29, '2024-02-28 21:08:21'),
(2, 'clamo paens demum', 'Voluptas tametsi depromo cunctatio id enim concedo somnus. Verus facere dolores volva vir surculus adamo. Vergo uxor vos tollo aegre excepturi.', 17, '2024-02-28 21:08:21'),
(3, 'sordeo amita ater', 'Alias crux auctus. Vere amoveo combibo termes vacuus celer tergeo. Saepe cultellus villa facere. Pariatur dedico tempus depopulo strues.', 35, '2024-02-28 21:08:21'),
(4, 'abeo ex defendo', 'Canonicus ipsum adhaero. Cavus xiphias communis comitatus adduco vindico timidus sollers degero. Demergo depono amplus vos. Usque credo tolero bellum vehemens candidus qui. Desolo torqueo vitiosus defessus celo claro. Adduco tollo coaegresco audeo vulariter ventito totam vivo voluntarius solitudo.', 27, '2024-02-28 21:08:21'),
(5, 'victus cognatus crudelis', 'Decipio vehemens vomica cursus. Demens usitas coadunatio.', 40, '2024-02-28 21:08:21'),
(6, 'alias molestiae adinventitias', 'Tersus ancilla averto vomito nesciunt. Officia audacia tui conatus. Vulpes subvenio appono defessus. Vigor approbo patior inflammatio cognatus deleniti sollicito. Adopto tandem congregatio peccatus. Aveho speciosus sint vester videlicet esse ex defaeco.', 16, '2024-02-28 21:08:21'),
(7, 'absens cibo demulceo', 'Sapiente animus decet. Amita curis aeneus corporis vergo verbum summisse. Super adaugeo aiunt adinventitias confero benigne amiculum deprecator. Suscipio rerum aggredior benevolentia sumptus id decimus sollicito vaco suffoco. Aegre decumbo defleo accusamus celebrer vere. Debeo voluptate tibi.', 11, '2024-02-28 21:08:21'),
(8, 'succedo nihil spiritus', 'Despecto volo calamitas suffragium vomito. Crux conatus adversus absconditus spoliatio canonicus ventus dolore quas certus. Audeo consectetur solus delectatio expedita debitis adnuo natus abscido pecto.', 41, '2024-02-28 21:08:21'),
(9, 'sperno creator delego', 'Terebro artificiose adstringo canonicus compello quae adficio desino volaticus. Conservo reiciendis vere explicabo uxor.', 50, '2024-02-28 21:08:21'),
(10, 'venia suppellex pel', 'Condico vulariter cunae aperio. Tubineus depopulo cohibeo. Adimpleo cultellus ademptio accedo alias. Calcar subnecto minus cubicularis caecus denego cursus ullam sulum.', 25, '2024-02-28 21:08:21'),
(11, 'tero adipiscor pecco', 'Tubineus dolorum depereo. Fuga communis crudelis.', 32, '2024-02-28 21:08:21'),
(12, 'addo pectus corrupti', 'Tamquam a blandior depopulo tribuo. Traho alter certus suggero.', 1, '2024-02-28 21:08:21'),
(13, 'adaugeo aut vulgivagus', 'Crapula audax temporibus admoveo antea. Strenuus spiculum accommodo error bos vinum vero caecus. Administratio antea curo tamquam ullus cogito consequatur.', 8, '2024-02-28 21:08:21'),
(14, 'beatae convoco statim', 'Caelum acervus compello atavus acer delectatio excepturi repudiandae ater. Bibo virgo versus curo sit adulescens tricesimus. Apto consequatur baiulus tum tristis. Trans sortitus tam eos coniecto torqueo usque victus. Voluptatem theatrum audax cohibeo esse atqui comitatus.', 45, '2024-02-28 21:08:21'),
(15, 'autem calamitas tutamen', 'Comparo minima qui harum. Terebro stillicidium defluo ventito aestas amaritudo totam. Utrimque vorago culpo terra aureus. Ait ex ascit cinis. Utilis cariosus thymum vel terreo tepesco.', 45, '2024-02-28 21:08:21');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `healthcheck_version`
--

CREATE TABLE `healthcheck_version` (
  `version_id` int(11) NOT NULL,
  `healthcheck_id` int(11) DEFAULT NULL,
  `version_number` int(11) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `healthcheck_version`
--

INSERT INTO `healthcheck_version` (`version_id`, `healthcheck_id`, `version_number`, `creation_date`, `notes`, `isActive`) VALUES
(1, 1, 1, '2024-02-28 21:08:21', 'Adeo acervus corona surgo valeo curatio. Curso aequus modi audentia decumbo in. Peior xiphias demens crur minima synagoga subnecto tepesco. Annus theologus demoror substantia. Soluta victus claustrum. Bellicus ait suadeo.', 1),
(2, 2, 3, '2024-02-28 21:08:21', 'Voluptatum aut atque cilicium. Suggero quasi arbitro somniculosus. Tantillus circumvenio depono sit adeptio aggero vacuus cupiditate tabella.', 1),
(3, 3, 1, '2024-02-28 21:08:21', 'Centum aro decor ulciscor coniecto comparo consequatur audio. Reiciendis bardus suscipio alioqui iste arbitro cribro vulticulus. Volubilis terga statim arcus. Complectus accommodo tenus maxime denuo. Cursim nulla caries perspiciatis sonitus circumvenio sto cuius.', 0),
(4, 4, 3, '2024-02-28 21:08:21', 'Charisma praesentium conforto. Ocer laboriosam sodalitas decor temptatio vicinus suadeo curto. Totidem pecto natus. Vomer conculco demulceo acies officia absorbeo. Creptio tamisium argumentum nihil vorax. Vesco varietas solus aureus.', 1),
(5, 5, 2, '2024-02-28 21:08:21', 'Commodo virgo tactus clam. Viduo corrumpo stipes quisquam vitiosus.', 0),
(6, 6, 3, '2024-02-28 21:08:21', 'Adimpleo iste est vado. Animadverto deleo conqueror denique. Admitto vomica bellicus calco adulatio tantillus sopor deficio. Chirographum maiores tutis sol venustas ubi villa alter aiunt video. Dedico deleo cum corpus umerus defessus.', 0),
(7, 7, 3, '2024-02-28 21:08:21', 'Urbanus fuga iure. Velociter crustulum utpote civitas appello cena alius assumenda.', 1),
(8, 8, 1, '2024-02-28 21:08:21', 'Synagoga caterva textus victus iure cursus comparo. Ceno thalassinus adsum denique harum. Certe vulariter repudiandae tres velociter cogo tertius tabgo.', 1),
(9, 9, 2, '2024-02-28 21:08:21', 'Copiose tactus aliquid tantum aureus vulgus. Bonus spectaculum fuga titulus. Cubicularis thalassinus labore auxilium adulatio. Arx dolore nisi quasi summisse optio statim. Beneficium dapifer crur.', 0),
(10, 10, 3, '2024-02-28 21:08:21', 'Cattus tredecim adflicto ulciscor aequitas turpis. Debeo baiulus dolores verbum. Aperiam ascisco voluptatum validus causa. Caterva calcar alii. Trepide depopulo vulnus. Audentia depraedor adsidue depono bos sufficio.', 1),
(11, 11, 2, '2024-02-28 21:08:21', 'Sunt vulnero esse ara expedita sopor bestia hic summopere convoco. Ipsa charisma auditor confido adnuo deputo cunctatio labore. Vulgaris comburo cariosus thalassinus universe.', 1),
(12, 12, 2, '2024-02-28 21:08:21', 'Odio tabesco cometes vulnero succurro adulatio uberrime beatae una contego. Administratio degusto virtus. Vestigium repellendus usitas praesentium contigo vesica cognatus sit. Advoco despecto contego. Arguo harum sopor depereo coaegresco tracto amor cohaero. Illum tamquam certus vitium conturbo acquiro videlicet.', 0),
(13, 13, 1, '2024-02-28 21:08:21', 'Amaritudo copia valens volup cognomen theca cursim. Concedo assumenda cernuus capio cogo turba sodalitas corrigo acerbitas. Virtus talio aetas vulgus pecco. Crur caritas venustas asperiores.', 0),
(14, 14, 3, '2024-02-28 21:08:21', 'Adfectus ulterius placeat auditor terebro tonsor impedit xiphias. Aureus necessitatibus dolor vorago damnatio. Aliquam sophismata vigilo valetudo conitor ante. Admiratio defaeco carcer talis villa absorbeo neque in ventus. Tamdiu sordeo taedium fugiat urbs convoco vulgo. Auctor contigo ulciscor sponte tenuis.', 1),
(15, 15, 2, '2024-02-28 21:08:21', 'Aufero ulciscor celebrer provident ab socius vulariter. Tricesimus creo universe vilis attollo conor vulpes terminatio.', 1),
(16, 1, 3, '2024-02-28 21:08:21', 'Nobis summa quibusdam nostrum ventosus adiuvo. Usus demitto caste allatus. Pecco adnuo volva. Vilitas amet ascit beneficium cumque odio volutabrum harum laudantium.', 0),
(17, 2, 2, '2024-02-28 21:08:21', 'Curiositas civis adopto usque. Aeternus conqueror audio supellex tonsor. Suasoria angelus ullam aegre timor defluo utor tres ustulo. Creator adeo arceo dolores pariatur thymum angustus dicta tergiversatio cibo. Attollo civitas aspernatur. Adulescens socius veritatis arma spiculum tamisium conservo thermae quo tollo.', 0),
(18, 3, 2, '2024-02-28 21:08:21', 'Possimus antepono dicta abduco ancilla aestas necessitatibus curvo angustus. Anser varius apparatus cultellus vestigium victus quasi solitudo vinculum.', 0),
(19, 4, 1, '2024-02-28 21:08:21', 'Suasoria crustulum crebro succedo calamitas calamitas creber beatae cognomen harum. Doloremque casso vito defaeco. Comedo crastinus solvo antepono contra eius adfero tardus certe patrocinor. Vapulus tener vester amplitudo advoco tumultus sint centum. Crinis confero taedium candidus bis possimus terga sonitus ubi.', 0),
(20, 5, 3, '2024-02-28 21:08:21', 'Subnecto sollicito earum auxilium abeo vulgaris harum crudelis. Ut tolero adulescens deinde. Ascisco arbor beatus assumenda alter voluptas vulgivagus est. Hic ocer crustulum. Charisma amita autem triumphus. Cubo maiores conor.', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `squad`
--

CREATE TABLE `squad` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `squad`
--

INSERT INTO `squad` (`id`, `name`, `createdAt`) VALUES
(1, 'Modern Team', '2024-02-28 21:08:21'),
(2, 'Intelligent Team', '2024-02-28 21:08:21'),
(3, 'Sleek Team', '2024-02-28 21:08:21'),
(4, 'Practical Team', '2024-02-28 21:08:21'),
(5, 'Recycled Team', '2024-02-28 21:08:21'),
(6, 'Recycled Team', '2024-02-28 21:08:21'),
(7, 'Sleek Team', '2024-02-28 21:08:21'),
(8, 'Elegant Team', '2024-02-28 21:08:21'),
(9, 'Modern Team', '2024-02-28 21:08:21'),
(10, 'Bespoke Team', '2024-02-28 21:08:21'),
(11, 'Recycled Team', '2024-02-28 21:08:21'),
(12, 'Small Team', '2024-02-28 21:08:21'),
(13, 'Rustic Team', '2024-02-28 21:08:21'),
(14, 'Elegant Team', '2024-02-28 21:08:21'),
(15, 'Small Team', '2024-02-28 21:08:21'),
(16, 'Oriental Team', '2024-02-28 21:08:21'),
(17, 'Refined Team', '2024-02-28 21:08:21'),
(18, 'Luxurious Team', '2024-02-28 21:08:21'),
(19, 'Modern Team', '2024-02-28 21:08:21'),
(20, 'Generic Team', '2024-02-28 21:08:21');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `squad_member`
--

CREATE TABLE `squad_member` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `squad_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `squad_member`
--

INSERT INTO `squad_member` (`id`, `user_id`, `squad_id`) VALUES
(1, 37, 18),
(2, 28, 15),
(3, 15, 20),
(4, 40, 6),
(5, 18, 17),
(6, 25, 12),
(7, 24, 11),
(8, 20, 19),
(9, 17, 5),
(10, 39, 17),
(11, 9, 14),
(12, 12, 20),
(13, 29, 11),
(14, 27, 4),
(15, 4, 18),
(16, 2, 7),
(17, 36, 19),
(18, 34, 7),
(19, 42, 4),
(20, 9, 4);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `squad_healthcheck`
--

CREATE TABLE `squad_healthcheck` (
  `id` int(11) NOT NULL,
  `squad_id` int(11) DEFAULT NULL,
  `healthcheck_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `squad_healthcheck`
--

INSERT INTO `squad_healthcheck` (`id`, `squad_id`, `healthcheck_id`) VALUES
(1, 15, 4),
(2, 9, 3),
(3, 20, 13),
(4, 8, 14),
(5, 2, 14),
(6, 12, 13),
(7, 15, 2),
(8, 8, 10),
(9, 12, 1),
(10, 11, 3),
(11, 1, 1),
(12, 8, 2),
(13, 7, 4),
(14, 14, 3),
(15, 8, 13),
(16, 11, 13),
(17, 1, 6),
(18, 19, 11),
(19, 5, 9),
(20, 8, 14);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `passwordHash` varchar(255) DEFAULT NULL,
  `role` enum('Manager','Developer') DEFAULT 'Developer',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`id`, `email`, `passwordHash`, `role`, `createdAt`) VALUES
(1, 'Coleman42@yahoo.com', '22hGx9Y_HGY7Z61', 'Manager', '2024-02-28 21:08:21'),
(2, 'Pierce_Russel@yahoo.com', 'liGM3ZXEqvSubJj', 'Manager', '2024-02-28 21:08:21'),
(3, 'Wilfred.Spencer@yahoo.com', 'GRorYePgVUsZSWb', 'Developer', '2024-02-28 21:08:21'),
(4, 'Timmothy48@yahoo.com', 'K6GFuOolUBpNR5z', 'Manager', '2024-02-28 21:08:21'),
(5, 'Lorine45@gmail.com', '_bRsZGvRa7egdDy', 'Developer', '2024-02-28 21:08:21'),
(6, 'Cora20@gmail.com', 'vxGCU5JLimQM22b', 'Manager', '2024-02-28 21:08:21'),
(7, 'Yasmin.Ratke@yahoo.com', 'CmWIKAUW9TSodDJ', 'Developer', '2024-02-28 21:08:21'),
(8, 'Ara.Aufderhar81@gmail.com', 'OAJbIzo8TXj_ZOo', 'Developer', '2024-02-28 21:08:21'),
(9, 'Perry_Franecki@hotmail.com', 'oWnLaThZGpfdnw4', 'Developer', '2024-02-28 21:08:21'),
(10, 'Seth_Bergstrom@gmail.com', 'jm7B0vzHs4TSP4t', 'Developer', '2024-02-28 21:08:21'),
(11, 'Haylie1@hotmail.com', 'xyxtySHDxqKHdmp', 'Manager', '2024-02-28 21:08:21'),
(12, 'Deven.Dietrich94@gmail.com', 'E0yZpJmZCm7KFW_', 'Manager', '2024-02-28 21:08:21'),
(13, 'Loren_Kassulke@yahoo.com', 'PQnI6VujXcOLOsf', 'Manager', '2024-02-28 21:08:21'),
(14, 'Royce.Huels78@hotmail.com', 'd5trNp6dRkrby5D', 'Manager', '2024-02-28 21:08:21'),
(15, 'Deonte45@hotmail.com', 'tXjGUtQ0wATSo8i', 'Developer', '2024-02-28 21:08:21'),
(16, 'Shakira_Christiansen@hotmail.com', 'FOvNCYRnA9mDd_7', 'Manager', '2024-02-28 21:08:21'),
(17, 'Nico66@yahoo.com', 'J4OsfdTSW9x2raU', 'Developer', '2024-02-28 21:08:21'),
(18, 'Aubree_Mosciski@hotmail.com', 'fVlIJJ1BFVmNt4Y', 'Developer', '2024-02-28 21:08:21'),
(19, 'Pansy62@gmail.com', 'B6MCR82AK6O9GkC', 'Manager', '2024-02-28 21:08:21'),
(20, 'Meggie.Watsica44@hotmail.com', 'FN0yHikTc7n47F3', 'Manager', '2024-02-28 21:08:21'),
(21, 'Andreanne.Ziemann8@yahoo.com', 'usDyGSI5dxke9Mh', 'Developer', '2024-02-28 21:08:21'),
(22, 'Delmer.Reichel63@yahoo.com', 'k78TcJOz7fbEqUi', 'Developer', '2024-02-28 21:08:21'),
(23, 'Lola_Stroman16@gmail.com', 'LJKWcZjXRxlWfIz', 'Developer', '2024-02-28 21:08:21'),
(24, 'Lindsey.Armstrong63@hotmail.com', 'ybR1rfuwCfqdsj4', 'Manager', '2024-02-28 21:08:21'),
(25, 'Herminia.Tromp59@gmail.com', 'R_vVp26ihOruzc7', 'Developer', '2024-02-28 21:08:21'),
(26, 'Scot82@gmail.com', 'E0qIM7mHhid3qnw', 'Developer', '2024-02-28 21:08:21'),
(27, 'Ulises.Lemke@yahoo.com', 'L4EjAw3IvI808hY', 'Developer', '2024-02-28 21:08:21'),
(28, 'Wilfred_Kerluke7@hotmail.com', '37gYAzrRzrO0wT5', 'Manager', '2024-02-28 21:08:21'),
(29, 'Al54@gmail.com', '4zzmWYR7LhcYlHY', 'Developer', '2024-02-28 21:08:21'),
(30, 'Jeanie.Barrows74@yahoo.com', 'tRZ0Gcc6FbwARw7', 'Developer', '2024-02-28 21:08:21'),
(31, 'Milo.Wolf55@gmail.com', '3OmkWZ9m4C7l1Kf', 'Manager', '2024-02-28 21:08:21'),
(32, 'Eula18@yahoo.com', 'R63YV44JYcGIKS6', 'Developer', '2024-02-28 21:08:21'),
(33, 'Camilla_Swift31@hotmail.com', 'pKooW4FAAP8Nmgh', 'Manager', '2024-02-28 21:08:21'),
(34, 'Brisa.Macejkovic21@hotmail.com', 'pSbtrStEj7lyO2v', 'Developer', '2024-02-28 21:08:21'),
(35, 'Robbie.Trantow@gmail.com', 'tBknQ6kVZNKQEPR', 'Developer', '2024-02-28 21:08:21'),
(36, 'Jaiden_Huel3@gmail.com', 'zP4M9Lfh2S3KXr2', 'Manager', '2024-02-28 21:08:21'),
(37, 'Jermey_Hermann-Wolff74@gmail.com', '5fXiHN49ImS0QFF', 'Developer', '2024-02-28 21:08:21'),
(38, 'Melyssa26@gmail.com', 'Xh3eQfCLFu26dGD', 'Manager', '2024-02-28 21:08:21'),
(39, 'Marian.Greenholt@hotmail.com', 'pOwpQr0Gn1tjX5v', 'Manager', '2024-02-28 21:08:21'),
(40, 'Jerrell62@hotmail.com', 'duW9JC7RzqR8n0i', 'Developer', '2024-02-28 21:08:21'),
(41, 'Serena.Lindgren@hotmail.com', 'uml5i_cgy0JabWQ', 'Manager', '2024-02-28 21:08:21'),
(42, 'Chyna_OConner24@gmail.com', 'BtdxS7q8gX5IePc', 'Developer', '2024-02-28 21:08:21'),
(43, 'Fay_Lueilwitz@gmail.com', 'DOHe7a09CNA1cTo', 'Manager', '2024-02-28 21:08:21'),
(44, 'Sylvester_Schaden91@gmail.com', 'fjmb9VCXZZj1VCw', 'Manager', '2024-02-28 21:08:21'),
(45, 'Mandy_Dooley@hotmail.com', '2VaIWyn_axsUIxN', 'Developer', '2024-02-28 21:08:21'),
(46, 'Katheryn64@gmail.com', 'otUY62kTA0mM9Vn', 'Manager', '2024-02-28 21:08:21'),
(47, 'Veda.Douglas15@hotmail.com', 'hyb2S82KZthWhbT', 'Developer', '2024-02-28 21:08:21'),
(48, 'Lucienne15@gmail.com', 'wiQh1EhORnhBUwS', 'Developer', '2024-02-28 21:08:21'),
(49, 'Dale11@gmail.com', 'aPKtrWTBcKhxdbm', 'Manager', '2024-02-28 21:08:21'),
(50, 'Janick_Rippin@hotmail.com', 'Ai3BrrjfGW8FoDk', 'Manager', '2024-02-28 21:08:21');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `version_id` (`version_id`);

--
-- Indexen voor tabel `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `company_squad`
--
ALTER TABLE `company_squad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `squad_id` (`squad_id`);

--
-- Indexen voor tabel `invitation_link`
--
ALTER TABLE `invitation_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `healthcheck_id` (`healthcheck_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `version_id` (`version_id`);

--
-- Indexen voor tabel `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `healthcheck_id` (`healthcheck_id`),
  ADD KEY `version_id` (`version_id`);

--
-- Indexen voor tabel `healthcheck`
--
ALTER TABLE `healthcheck`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexen voor tabel `healthcheck_version`
--
ALTER TABLE `healthcheck_version`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `healthcheck_id` (`healthcheck_id`);

--
-- Indexen voor tabel `squad`
--
ALTER TABLE `squad`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `squad_member`
--
ALTER TABLE `squad_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `squad_id` (`squad_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexen voor tabel `squad_healthcheck`
--
ALTER TABLE `squad_healthcheck`
  ADD PRIMARY KEY (`id`),
  ADD KEY `squad_id` (`squad_id`),
  ADD KEY `healthcheck_id` (`healthcheck_id`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT voor een tabel `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT voor een tabel `company_squad`
--
ALTER TABLE `company_squad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT voor een tabel `invitation_link`
--
ALTER TABLE `invitation_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT voor een tabel `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT voor een tabel `healthcheck`
--
ALTER TABLE `healthcheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT voor een tabel `healthcheck_version`
--
ALTER TABLE `healthcheck_version`
  MODIFY `version_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT voor een tabel `squad`
--
ALTER TABLE `squad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT voor een tabel `squad_member`
--
ALTER TABLE `squad_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

ALTER TABLE question RENAME COLUMN text TO description;
ALTER TABLE question ADD COLUMN title VARCHAR(255);
ALTER TABLE answer ADD COLUMN flagged BOOLEAN DEFAULT FALSE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
