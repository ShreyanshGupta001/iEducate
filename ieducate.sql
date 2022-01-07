-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2022 at 02:46 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ieducate`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone`, `date`, `message`) VALUES
(1, 'shreyansh', 'shreyansh@gmail.com', 45654554, '2022-01-07', 'hello there');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `author` varchar(40) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `title` varchar(100) NOT NULL,
  `subtitle` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `img_file` varchar(30) NOT NULL DEFAULT '''post-bg.jpg'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `author`, `slug`, `title`, `subtitle`, `content`, `date`, `img_file`) VALUES
(1, 'Admin', 'man-explore', 'Man Must Explore, and This is Exploration at its Greatest Peak.', 'Problems look mighty small from 150 miles up', '“I’ve never liked safety belts,” he wrote in his memoir, To Rule the Night, “but we couldn’t have done without them on the rover. You could easily get ‘seasick’ if you had any problem with motion.” In fact, Irwin’s seat belt turned out to be too short and before they could set off Scott had to come around to his side of the rover to buckle him in properly. “We didn’t realize,” Irwin explained, “when we made the adjustments on Earth, that at one-sixth-G the suit would balloon more and it would be difficult to compress it enough to fasten the seat belt.”\r\n\r\nThe rover was also slightly different to drive than the training version they had used on Earth. Scott found that he had to concentrate all of his energies simply driving and keeping track of craters—the harsh glare of sunlight made the terrain appear deceptively smooth, literally “washing-out” surface features, as hummocks and furrows appeared out of nowhere, at a split-second’s notice. Its maneuverability was good (“it could turn on a dime,” Scott recalled in his memoir, Two Sides of the Moon), but its wheels kicked up enormous rooster-tails of dust, which were thankfully deflected by its fenders. As the navigator, Irwin tried to plot their course on the map, but had difficulty identifying their route because they were uncertain of precisely where they had set Falcon down. However, the towering bulk of nearby Mount Hadley Delta was clear to see, with St. George Crater—an enormous gouge the size of two dozen football fields—on the lowermost slopes, and all they had to do was drive with it on their port quarter and they knew that eventually they would come upon Hadley Rille.\r\n\r\nCresting the top of a ridge, they were rewarded with their first unearthly glimpse of Hadley Rille and gained a clear awareness of its enormous size. Half an hour after leaving Falcon, they made their first scheduled halt at a place called “Elbow Crater,” right on the rim of the rille at the base of the mountain. From here, Scott took a series of pictures of the far side of Hadley Rille, whose interior wall showed clear evidence of layering in outcrops not far below its rim, and the two men took a few minutes to gather samples. Next, they set off toward the rim of St. George Crater. It had been expected that the area would be littered with large blocks of rock, but upon finding the flank of the mountain remarkably clean, Scott decided to halt short of the rim and sample an isolated boulder. It was more than 3.3 feet (1 meter) across and its “half-in-half-out” nature, part-buried in the soft soil.', '2021-09-24', 'post-bg.jpg'),
(2, 'Admin', 'precious-heartbeat', 'I believe every human has a finite number of heartbeats', 'I believe every human has a finite number of heartbeats. I don\'t intend to waste any of mine.', 'The Heartbeat of Neil Armstrong\r\n“I believe every human has a finite number of heartbeats. I don’t intend to waste any of mine.” — Neil Armstrong\r\nLife is too short to be solely focused on what makes us happy. There have been many whose lives were made happy by the destruction of others.\r\nDoing whatever makes us happy should not be our only driving force. A purpose-driven life is defined by the point where what makes us happy intersects with what brings the most happiness to those around us.\r\nIt is when we focus on making other people happy that we inevitable derive the most joy for ourselves.\r\nThe most selfish decision we can make is to love always because it causes for us the greatest possible outcome.\r\nIt is when we love regardless of how we are treated, that we cherish every heartbeat we are given.\r\nPositivity, like negativity, is infectious; what are you spreading?\r\nAlign your happiness with what brings other people joy, and when you do that, you’re not only making your community a better place, you’re doing what makes you most happy.\r\nWe don’t need to fly to the moon to make a large impact, we just need to lend a helping hand.', '2021-09-18', 'post-bg.jpg'),
(3, 'Admin', 'science-p', 'Science has not yet mastered prophecy', 'We predict too much for the next year and yet far too little for the next ten.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus dolor optio assumenda quis ipsam quibusdam quisquam suscipit qui aspernatur vitae. Quaerat iusto dolor ex assumenda molestias, id dolores nostrum omnis. Esse, inventore quam.', '2021-08-24', 'post-bg.jpg'),
(4, 'Admin', 'failure-option', 'Failure is not an option', 'Many say exploration is part of our destiny, but it’s actually our duty to future generations.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus dolor optio assumenda quis ipsam quibusdam quisquam suscipit qui aspernatur vitae. Quaerat iusto dolor ex assumenda molestias, id dolores nostrum omnis. Esse, inventore quam.', '2021-07-08', 'post-bg.jpg'),
(6, 'Admin', 'qr-code', 'QR codes ', 'innovative ways to use them in small business marketing', 'These 2D matrix barcodes are called QR Codes, or Quick Response Codes. ... For marketers, QR codes allow advertisements, brochures, posters - even clothing or billboards – to direct users to mobile landing pages that contain much more information and interactivity than can be afforded on the printed page.', '2022-01-07', 'post-bg.jpg'),
(7, 'Admin', 'next-gen', 'Preparing for The Next Great Recession', 'A blog based on a sustainable lifestyle with a smaller footprint', 'That said, if you have cash to invest, you may want to consider buying recession-friendly sectors such as consumer staples, utilities and health care. Stocks that have been paying a dividend for many years are also a good choice, since they tend to be long established companies that can withstand a downturn', '2022-01-07', 'post-bg.jpg'),
(8, 'Admin', 'ukele', 'Learning the Ukulele', 'Learning the Ukulele and other less common instruments', 'If scientists in a lab were tasked with creating a musical instrument that’s approachable, easy to hold and unpretentious, they’d probably come up with something like the ukulele. This remarkable instrument is perfect for musical folk and non-musicians alike, and sitting down to learn the ukulele can deliver huge benefits to everyone ranging from small children to the elderly. If you’re interested in picking up the uke for the first time, you’ve come to the right place. We’ve got 10 reasons why everyone should be playing ukulele for you in this article.', '2022-01-07', 'post-bg.jpg'),
(10, 'Admin', 'nature-in-my-mind', 'Nature in my Mind', 'Trying Searching and Wanting', 'I am sitting on my balcony. It is spring and there is a little bit of heat in the sun. The balcony looks out over a road. The road is usually busy… an endless stream of trucks and cars but right now there is no traffic. Everyone is self-isolating. The machine has stopped. It feels strange. Peaceful. I can hear different birds… the wren, the blackbird, the robin. A blue tit is flitting from one branch to the next. Life goes on. I could sit here all day.\r\n\r\n“Don’t try”. Those are the two simple words of advice offered by the poet Charles Bukowski.\r\n\r\nIt jars for most people to receive that advice… especially those of us who want a better world.\r\n\r\nI have been stuck in a cycle of “trying” for a while now and I see a lot of it in the world\r\n\r\nTrying and searching and wanting.\r\n\r\nEverywhere I look people, including me, are rushing to the next moment.\r\n\r\nI know that 99% of people probably won’t resonate with what I’m going to say. They might think that I’m an idiot and that this piece is a cop out.\r\n\r\nNot trying is seen as the “worst”.\r\n\r\nIt means that you are lazy and you don’t care.\r\n\r\nIt means that you settle.\r\n\r\nIt means that you do nothing.\r\n\r\nIt means that you are part of the problem.\r\n\r\nIt means that you are helpless.\r\n\r\nIs that really true?\r\n\r\nI don’t think so.\r\n\r\nDoes the oak tree try?\r\n\r\nNo. It just is.\r\n\r\nDoes the oak tree do nothing?\r\n\r\nNo. It just is.\r\n\r\nWhy is it that we humans are always trying and searching and wanting?\r\n\r\nDon’t rush. Close your eyes and sit with that question for a moment.\r\n\r\nWhy are you always trying and searching and wanting?', '2022-01-07', 'post-bg.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
