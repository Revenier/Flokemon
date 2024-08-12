-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2023 at 02:48 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flokemon`
--

-- --------------------------------------------------------

--
-- Table structure for table `msaccount`
--

CREATE TABLE `msaccount` (
  `email` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  `userpass` varchar(16) NOT NULL,
  `accountstatus` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `token` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `msaccount`
--

INSERT INTO `msaccount` (`email`, `username`, `userpass`, `accountstatus`, `name`, `token`) VALUES
('abraham@gmail.com', 'abraham001', 'pass1', 1, 'abrahamh1234', 'FqsrsGR035'),
('billyc6@gmail.com', 'billyc6', 'pass12ord', 0, 'billyc6', '3KwB3YFOpx'),
('bobigans3@gmail.com', 'bobigans3', '4321gansangat', 1, 'bobigans3', 'nEkEidlZwK'),
('bobigans@gmail.com', 'bobigans', '321gansangat', 0, 'bobigans', 'M1UNbEhtIs'),
('kevin@gmail.com', 'halokevin', 'kevin123', 1, 'halokevin', 'NHDiEvaCxl'),
('krisjo@gmail.com', 'krisjogun1', 'mysecretpass', 1, 'krisjogun1', 'vLyp8uf19b'),
('nickson@gmail.com', 'nickson1', 'securepass123', 1, 'nickson1', 'vk66HE3bg6'),
('william092@binus.ac.id', 'william', 'william092', 0, 'william', '5op6qncF8P');

-- --------------------------------------------------------

--
-- Table structure for table `mspokemon`
--

CREATE TABLE `mspokemon` (
  `id` int(11) NOT NULL,
  `name` varchar(12) NOT NULL,
  `type1` varchar(8) NOT NULL,
  `type2` varchar(8) DEFAULT NULL,
  `height` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `description` varchar(219) NOT NULL,
  `Price` int(11) DEFAULT NULL,
  `imagelink` varchar(255) GENERATED ALWAYS AS (concat('https://assets.pokemon.com/assets/cms2/img/pokedex/full/',right(1000 + `id`,3),'.png')) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mspokemon`
--

INSERT INTO `mspokemon` (`id`, `name`, `type1`, `type2`, `height`, `weight`, `description`, `Price`) VALUES
(1, 'bulbasaur', 'grass', 'poison', 7, 69, 'A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.', 8),
(2, 'ivysaur', 'grass', 'poison', 10, 130, 'When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.', 4),
(3, 'venusaur', 'grass', 'poison', 20, 1000, 'The plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight.', 8),
(4, 'charmander', 'fire', 'none', 6, 85, 'Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.', 3),
(5, 'charmeleon', 'fire', 'none', 11, 190, 'When it swings its burning tail, it elevates the temperature to unbearably high levels.', 3),
(6, 'charizard', 'fire', 'flying', 17, 905, 'Spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally.', 5),
(7, 'squirtle', 'water', 'none', 5, 90, 'After birth, its back swells and hardens into a shell. Powerfully sprays foam from its mouth.', 10),
(8, 'wartortle', 'water', 'none', 10, 225, 'Often hides in water to stalk unwary prey. For swimming fast, it moves its ears to maintain balance.', 3),
(9, 'blastoise', 'water', 'none', 16, 855, 'A brutal POKéMON with pressurized water jets on its shell. They are used for high speed tackles.', 3),
(10, 'caterpie', 'bug', 'none', 3, 29, 'Its short feet are tipped with suction pads that enable it to tirelessly climb slopes and walls.', 7),
(11, 'metapod', 'bug', 'none', 7, 99, 'This POKéMON is vulnerable to attack while its shell is soft, exposing its weak and tender body.', 5),
(12, 'butterfree', 'bug', 'flying', 11, 320, 'In battle, it flaps its wings at high speed to release highly toxic dust into the air.', 9),
(13, 'weedle', 'bug', 'poison', 3, 32, 'Often found in forests, eating leaves. It has a sharp venomous stinger on its head.', 3),
(14, 'kakuna', 'bug', 'poison', 6, 100, 'Almost incapable of moving, this POKéMON can only harden its shell to protect itself from predators.', 10),
(15, 'beedrill', 'bug', 'poison', 10, 295, 'It has three poisonous stingers on its forelegs and its tail. They are used to jab its enemy repeatedly.', 6),
(16, 'pidgey', 'normal', 'flying', 3, 18, 'A common sight in forests and woods. It flaps its wings at ground level to kick up blinding sand.', 4),
(17, 'pidgeotto', 'normal', 'flying', 11, 300, 'Very protective of its sprawling territorial area, this POKéMON will fiercely peck at any intruder.', 10),
(18, 'pidgeot', 'normal', 'flying', 15, 395, 'When hunting, it skims the surface of water at high speed to pick off unwary prey such as MAGIKARP.', 9),
(19, 'rattata', 'normal', 'none', 3, 35, 'Bites anything when it attacks. Small and very quick, it is a common sight in many places.', 3),
(20, 'raticate', 'normal', 'none', 7, 185, 'It uses its whis­ kers to maintain its balance. It apparently slows down if they are cut off.', 5),
(21, 'spearow', 'normal', 'flying', 3, 20, 'It flaps its small wings busily to fly. Using its beak, it searches in grass for prey.', 10),
(22, 'fearow', 'normal', 'flying', 12, 380, 'With its huge and magnificent wings, it can keep aloft without ever having to land for rest.', 6),
(23, 'ekans', 'poison', 'none', 20, 69, 'Moves silently and stealthily. Eats the eggs of birds, such as PIDGEY and SPEAROW, whole.', 8),
(24, 'arbok', 'poison', 'none', 35, 650, 'It is rumored that the ferocious warning markings on its belly differ from area to area.', 9),
(25, 'pikachu', 'electric', 'none', 4, 60, 'When several of these POKéMON gather, their electricity could build and cause lightning storms.', 5);

-- --------------------------------------------------------

--
-- Table structure for table `mstransaction`
--

CREATE TABLE `mstransaction` (
  `useremail` varchar(255) NOT NULL,
  `pokemonID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `transactionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mstransaction`
--

INSERT INTO `mstransaction` (`useremail`, `pokemonID`, `Quantity`, `transactionID`) VALUES
('abraham@gmail.com', 3, 2, 1),
('krisjo@gmail.com', 23, 1, 2),
('kevin@gmail.com', 19, 1, 3),
('nickson@gmail.com', 11, 2, 4),
('kevin@gmail.com', 6, 2, 6),
('nickson@gmail.com', 1, 1, 7),
('krisjo@gmail.com', 14, 1, 8),
('krisjo@gmail.com', 18, 1, 9),
('abraham@gmail.com', 21, 2, 10),
('abraham@gmail.com', 11, 1, 11),
('abraham@gmail.com', 23, 1, 15),
('abraham@gmail.com', 19, 1, 16),
('abraham@gmail.com', 13, 1, 17),
('abraham@gmail.com', 24, 1, 18),
('abraham@gmail.com', 20, 1, 19),
('abraham@gmail.com', 22, 2, 20),
('abraham@gmail.com', 15, 1, 21);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `msaccount`
--
ALTER TABLE `msaccount`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `mspokemon`
--
ALTER TABLE `mspokemon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mstransaction`
--
ALTER TABLE `mstransaction`
  ADD PRIMARY KEY (`transactionID`),
  ADD KEY `pokemonID` (`pokemonID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mstransaction`
--
ALTER TABLE `mstransaction`
  MODIFY `transactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mstransaction`
--
ALTER TABLE `mstransaction`
  ADD CONSTRAINT `fk_pokemon_id` FOREIGN KEY (`pokemonID`) REFERENCES `mspokemon` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
