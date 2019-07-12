--
-- Baza danych: `Figure_Skating_Competition`
--
CREATE DATABASE `Figure_Skating_Competition` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `Figure_Skating_Competition`;

--
-- Baza danych: `Figure_Skating_Competition`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Competition`
--

CREATE TABLE IF NOT EXISTS `Competition` (
  `id_Competition` int(8) NOT NULL,
  `dateOfCompetition` date NOT NULL,
  `typeOfCompetition` enum('Mistrzostwa Europy','Grand Prix','Mistrzostwa Swiata','Olimpiada') COLLATE utf8_unicode_ci NOT NULL,
  `id_Location` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `Competition`
--

INSERT INTO `Competition` (`id_Competition`, `dateOfCompetition`, `typeOfCompetition`, `id_Location`) VALUES
(7543, '0000-00-00', 'Olimpiada', 456),
(7544, '0000-00-00', 'Mistrzostwa Swiata', 789),
(7865, '0000-00-00', 'Mistrzostwa Europy', 679),
(7878, '0000-00-00', 'Grand Prix', 678);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `TypesOfCompetition`
--

CREATE TABLE IF NOT EXISTS `TypesOfCompetition` (
  `typeOfCompetition` enum('Mistrzostwa Europy','Grand Prix','Mistrzostwa Swiata','Olimpiada') COLLATE utf8_unicode_ci NOT NULL,
  `nameOfCompetition` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `TypesOfCompetition`
--

INSERT INTO `TypesOfCompetition` (`typeOfCompetition`, `nameOfCompetition`) VALUES
('Mistrzostwa Europy', 'Rostelecom Cup'),
('Grand Prix', 'NHK Trophy '),
('Mistrzostwa Swiata', 'Zimowe Igrzyska Olimpijskie'),
('Olimpiada', 'Letnie Igrzyska Olimpijskie ');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Competition_Referee`
--

CREATE TABLE IF NOT EXISTS `Competition_Referee` (
  `id_Competition` int(8) NOT NULL,
  `id_Referee` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `Competition_Referee`
--

INSERT INTO `Competition_Referee` (`id_Competition`, `id_Referee`) VALUES
(7543, 7611),
(7543, 8711),
(7544, 3411),
(7544, 7611),
(7865, 2411),
(7865, 8711),
(7878, 6511),
(7878, 9811);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Competition_Team`
--

CREATE TABLE IF NOT EXISTS `Competition_Team` (
  `id_Team` int(8) NOT NULL,
  `id_Competition` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `Competition_Team`
--

INSERT INTO `Competition_Team` (`id_Team`, `id_Competition`) VALUES
(135, 7543),
(136, 7543),
(137, 7544),
(138, 7544),
(140, 7865),
(138, 7878),
(140, 7878);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Contestant`
--

CREATE TABLE IF NOT EXISTS `Contestant` (
  `id_Contestant` int(8) NOT NULL,
  `last_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `Contestant`
--

INSERT INTO `Contestant` (`id_Contestant`, `last_Name`, `name`) VALUES
(12, 'Golo', 'Kuba'),
(13, 'Mikos', 'Kamil'),
(14, 'Adryk', 'Zuzana'),
(15, 'Kowalski', 'Patryk'),
(16, 'Twokot', 'Arkadiusz'),
(17, 'Rekaman', 'Anna'),
(18, 'Huka', 'Fredryk');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Contestant_Team`
--

CREATE TABLE IF NOT EXISTS `Contestant_Team` (
  `id_Contestant` int(8) NOT NULL,
  `id_Team` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `Contestant_Team`
--

INSERT INTO `Contestant_Team` (`id_Contestant`, `id_Team`) VALUES
(12, 135),
(13, 136),
(14, 137),
(15, 138),
(16, 138),
(17, 140),
(18, 140);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Location`
--

CREATE TABLE IF NOT EXISTS `Location` (
  `id_Location` int(8) NOT NULL,
  `city` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `Location`
--

INSERT INTO `Location` (`id_Location`, `city`) VALUES
(456, 'Berlin'),
(679, 'Moskwa'),
(678, 'Warszawa'),
(789, 'Wieden');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Skating_Rink`
--

CREATE TABLE IF NOT EXISTS `Skating_Rink` (
  `city` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `Skating_Rink`
--

INSERT INTO `Skating_Rink` (`city`, `country`, `name`) VALUES
('Berlin', 'Niemcy', 'COS'),
('Moskwa', 'Rosja', 'GUM'),
('Warszawa', 'Polska', 'Erika Hess'),
('Wieden', 'Austria', 'Donaustadt');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Mark`
--

CREATE TABLE IF NOT EXISTS `Mark` (
  `id_Mark` int(8) NOT NULL,
  `score_PC` double(10,2) NOT NULL,
  `score_TE` double(10,2) NOT NULL,
  `id_Score` int(8) NOT NULL,
  `id_Referee` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `Mark`
--

INSERT INTO `Mark` (`id_Mark`, `score_PC`, `score_TE`, `id_Score`, `id_Referee`) VALUES
(456, 102.00, 37.00, 5694, 7611),
(457, 87.00, 45.00, 6694, 8711),
(458, 96.00, 56.00, 5695, 7611),
(459, 78.00, 37.00, 6695, 8711),
(460, 67.00, 45.00, 5696, 3411),
(461, 88.00, 45.00, 6696, 7611),
(462, 67.00, 32.00, 5697, 3411),
(463, 73.00, 30.00, 6697, 7611),
(464, 83.00, 45.00, 5698, 9811),
(465, 74.00, 36.00, 6698, 6511),
(466, 89.00, 50.00, 5699, 9811),
(467, 80.00, 45.00, 6699, 6511),
(468, 109.00, 55.00, 5700, 8711),
(469, 99.00, 66.00, 6700, 2411);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Referee`
--

CREATE TABLE IF NOT EXISTS `Referee` (
  `id_Referee` int(8) NOT NULL,
  `name` int(25) NOT NULL,
  `last_Name` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `Referee`
--

INSERT INTO `Referee` (`id_Referee`, `name`, `last_Name`) VALUES
(2411, 0, 'Jodik'),
(3411, 0, 'Wecko'),
(6511, 0, 'Werko'),
(7611, 0, 'Ragger'),
(8711, 0, 'Amiszko'),
(9611, 0, 'Stowic'),
(9811, 0, 'Tyjko');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Score`
--

CREATE TABLE IF NOT EXISTS `Score` (
  `id_Score` int(8) NOT NULL,
  `score` double(10,2) NOT NULL,
  `typeOfProgramme` enum('krotki','dowolny') COLLATE utf8_unicode_ci NOT NULL,
  `id_Team` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `Score`
--

INSERT INTO `Score` (`id_Score`, `score`, `typeOfProgramme`, `id_Team`) VALUES
(5694, 139.00, 'dowolny', 140),
(5695, 152.00, 'dowolny', 138),
(5696, 112.00, 'dowolny', 137),
(5697, 99.00, 'dowolny', 136),
(5698, 128.00, 'dowolny', 135),
(5699, 139.00, 'dowolny', 135),
(5700, 164.00, 'dowolny', 136),
(6694, 132.00, 'krotki', 140),
(6695, 115.00, 'krotki', 138),
(6696, 133.00, 'krotki', 137),
(6697, 103.00, 'krotki', 136),
(6698, 110.00, 'krotki', 135),
(6699, 125.00, 'krotki', 135),
(6700, 165.00, 'krotki', 136);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Team`
--

CREATE TABLE IF NOT EXISTS `Team` (
  `id_Team` int(8) NOT NULL,
  `category` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `Team`
--

INSERT INTO `Team` (`id_Team`, `category`) VALUES
(135, 'inwidualne'),
(136, 'inwidualne'),
(137, 'inwidualne'),
(138, 'pary'),
(140, 'pary');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `Competition`
--
ALTER TABLE `Competition`
  ADD PRIMARY KEY (`id_Competition`),
  ADD KEY `id_Location` (`id_Location`),
  ADD KEY `typeOfCompetition` (`typeOfCompetition`);

--
-- Indeksy dla tabeli `TypesOfCompetition`
--
ALTER TABLE `TypesOfCompetition`
  ADD PRIMARY KEY (`typeOfCompetition`);

--
-- Indeksy dla tabeli `Competition_Referee`
--
ALTER TABLE `Competition_Referee`
  ADD PRIMARY KEY (`id_Competition`,`id_Referee`),
  ADD KEY `id_Referee` (`id_Referee`);

--
-- Indeksy dla tabeli `Competition_team`
--
ALTER TABLE `Competition_Team`
  ADD PRIMARY KEY (`id_Competition`,`id_Team`),
  ADD KEY `id_Team` (`id_Team`);

--
-- Indeksy dla tabeli `Contestant`
--
ALTER TABLE `Contestant`
  ADD PRIMARY KEY (`id_Contestant`);

--
-- Indeksy dla tabeli `Contestant_Team`
--
ALTER TABLE `Contestant_Team`
  ADD PRIMARY KEY (`id_Contestant`,`id_Team`),
  ADD KEY `id_Team` (`id_Team`);

--
-- Indeksy dla tabeli `Location`
--
ALTER TABLE `Location`
  ADD PRIMARY KEY (`id_Location`),
  ADD KEY `city` (city);

--
-- Indeksy dla tabeli `Skating_Rink`
--
ALTER TABLE `Skating_Rink`
  ADD PRIMARY KEY (`city`);

--
-- Indeksy dla tabeli `Mark`
--
ALTER TABLE `Mark`
  ADD PRIMARY KEY (`id_Mark`),
  ADD KEY `id_Score` (`id_Score`),
  ADD KEY `id_Referee` (`id_Referee`);

--
-- Indeksy dla tabeli `Referee`
--
ALTER TABLE `Referee`
  ADD PRIMARY KEY (`id_Referee`);

--
-- Indeksy dla tabeli `Score`
--
ALTER TABLE `Score`
  ADD PRIMARY KEY (`id_Score`),
  ADD KEY `id_Team` (`id_Team`);

--
-- Indeksy dla tabeli `Team`
--
ALTER TABLE `Team`
  ADD PRIMARY KEY (`id_Team`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `competition`
--
ALTER TABLE `Competition`
ADD   FOREIGN KEY (`id_Location`) REFERENCES `Location` (`id_Location`);
ALTER TABLE `Competition`
 ADD  FOREIGN KEY (`typeOfCompetition`) REFERENCES `TypesOfCompetition` (`typeOfCompetition`);

--
-- Ograniczenia dla tabeli `Competition_Referee`
--
ALTER TABLE `Competition_Referee`
ADD   FOREIGN KEY (`id_Competition`) REFERENCES `Competition` (`id_Competition`);
ALTER TABLE `Competition_Referee`
 ADD  FOREIGN KEY (`id_Referee`) REFERENCES `Referee` (`id_Referee`);

--
-- Ograniczenia dla tabeli `Competition_Team`
--
ALTER TABLE `Competition_Team`
 ADD  FOREIGN KEY (`id_Team`) REFERENCES `Team` (`id_Team`);
  ALTER TABLE `Competition_Team`
 ADD  FOREIGN KEY (`id_Competition`) REFERENCES `Competition` (`id_Competition`);

--
-- Ograniczenia dla tabeli `Contestant_Team`
--
ALTER TABLE `Contestant_Team`
 ADD FOREIGN KEY (`id_Contestant`) REFERENCES `Contestant` (`id_Contestant`);
 ALTER TABLE `Contestant_Team`
ADD   FOREIGN KEY (`id_Team`) REFERENCES `Team` (`id_Team`);

--
-- Ograniczenia dla tabeli `Location`
--
ALTER TABLE `Location`
  ADD  FOREIGN KEY (`city`) REFERENCES `Skating_Rink` (`city`);

--
-- Ograniczenia dla tabeli `Mark`
--
ALTER TABLE `Mark`
 ADD  FOREIGN KEY (`id_Score`) REFERENCES `Score` (`id_Score`);
 ALTER TABLE `Mark`
 ADD  FOREIGN KEY (`id_Referee`) REFERENCES `Referee` (`id_Referee`);

--
-- Ograniczenia dla tabeli `Score`
--
ALTER TABLE `Score`
 ADD  FOREIGN KEY (id_Team) REFERENCES `Team` (`id_Team`);
COMMIT;

