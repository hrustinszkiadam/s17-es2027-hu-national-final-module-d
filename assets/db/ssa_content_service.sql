-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 25, 2026 at 03:26 PM
-- Server version: 11.5.2-MariaDB-ubu2404
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ssa_content_service`
--

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `credits` int(11) NOT NULL DEFAULT 3,
  `order_index` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chapters`
--

INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `credits`, `order_index`) VALUES
(1, 1, 'HTML Structure and Semantics', 'Learn proper HTML document structure and semantic elements', 4, 1),
(2, 1, 'CSS Styling and Layout', 'Master CSS selectors, properties, and layout techniques', 4, 2),
(3, 1, 'JavaScript Basics', 'Variables, functions, and control structures in JavaScript', 5, 3),
(4, 1, 'DOM Manipulation', 'Interact with HTML elements using JavaScript', 4, 4),
(5, 1, 'Responsive Design', 'Create websites that work on all device sizes', 5, 5),
(6, 1, 'Web Forms and Validation', 'Build interactive forms with proper validation', 4, 6),
(7, 2, 'React Hooks Deep Dive', 'useState, useEffect, and custom hooks mastery', 5, 1),
(8, 2, 'Context API and State Management', 'Global state management without Redux', 5, 2),
(9, 2, 'Performance Optimization', 'React.memo, useMemo, and useCallback techniques', 5, 3),
(10, 2, 'Advanced Component Patterns', 'Render props, HOCs, and compound components', 5, 4),
(11, 2, 'Testing React Applications', 'Unit and integration testing with Jest and RTL', 4, 5),
(12, 3, 'Python Syntax and Variables', 'Basic Python syntax, data types, and variables', 3, 1),
(13, 3, 'Control Flow and Functions', 'Loops, conditionals, and function definitions', 4, 2),
(14, 3, 'Data Structures in Python', 'Lists, dictionaries, sets, and tuples', 4, 3),
(15, 3, 'File I/O and Exception Handling', 'Working with files and handling errors gracefully', 4, 4),
(16, 3, 'Object-Oriented Programming', 'Classes, objects, and inheritance in Python', 5, 5),
(17, 4, 'Database Fundamentals', 'RDBMS concepts, normalization, and ER diagrams', 4, 1),
(18, 4, 'Basic SQL Queries', 'SELECT, WHERE, ORDER BY, and basic joins', 4, 2),
(19, 4, 'Advanced SQL Operations', 'Subqueries, window functions, and complex joins', 5, 3),
(20, 4, 'Database Design Patterns', 'Schema design best practices and optimization', 5, 4),
(21, 5, 'Node.js Fundamentals', 'Event loop, modules, and npm package management', 4, 1),
(22, 5, 'Express.js Framework', 'Building web servers and REST APIs with Express', 5, 2),
(23, 5, 'Database Integration', 'Connecting to databases and ORM usage', 4, 3),
(24, 5, 'Authentication and Security', 'JWT tokens, password hashing, and security best practices', 5, 4),
(25, 5, 'API Testing and Documentation', 'Testing APIs and creating comprehensive documentation', 4, 5),
(26, 6, 'Design Thinking Process', 'User research, personas, and problem definition', 4, 1),
(27, 6, 'Visual Design Principles', 'Color theory, typography, and layout composition', 4, 2),
(28, 6, 'Wireframing and Prototyping', 'Creating low and high-fidelity prototypes', 4, 3),
(29, 6, 'Usability Testing', 'User testing methods and feedback implementation', 3, 4),
(30, 6, 'Accessibility in Design', 'Creating inclusive designs for all users', 4, 5),
(31, 7, 'CI/CD Pipeline Setup', 'Continuous integration and deployment workflows', 5, 1),
(32, 7, 'Container Orchestration', 'Kubernetes basics and container management', 5, 2),
(33, 7, 'Infrastructure as Code', 'Terraform and infrastructure automation', 5, 3),
(34, 7, 'Monitoring and Logging', 'Application monitoring and log management', 4, 4),
(35, 8, 'React Native Fundamentals', 'Mobile development with React Native', 5, 1),
(36, 8, 'Navigation and State', 'App navigation and state management patterns', 4, 2),
(37, 8, 'Native Device Features', 'Camera, GPS, and device API integration', 5, 3),
(38, 8, 'App Store Deployment', 'Publishing to iOS and Android app stores', 4, 4),
(39, 9, 'ML Algorithms Overview', 'Supervised, unsupervised, and reinforcement learning', 5, 1),
(40, 9, 'Data Preprocessing', 'Data cleaning, feature engineering, and normalization', 4, 2),
(41, 9, 'Model Training and Evaluation', 'Training ML models and performance metrics', 5, 3),
(42, 9, 'Practical ML Projects', 'Real-world machine learning implementations', 5, 4),
(991, 99, 'Project Setup & First Card', 'Set up Vite + React + TypeScript and Tailwind CSS v4, then build your first centered card using utility classes only.', 4, 1),
(992, 99, 'Color Exploration', 'Explore palettes, contrast, and Tailwind color utilities so your interface feels intentional and readable.', 4, 2),
(993, 99, 'Typography & Spacing', 'Apply typography and spacing scales for clear hierarchy, rhythm, and consistent layouts across the page.', 4, 3),
(994, 99, 'Introducing ShadCN UI', 'Install and compose ShadCN UI primitives—accessible, themable components built on Radix UI and Tailwind.', 4, 4),
(995, 99, 'Badges & Tags', 'Use badges and tags for status, labels, and metadata in compact, reusable patterns.', 4, 5),
(996, 99, 'Card Interactions', 'Add hover, focus, and interactive states to cards so the UI feels responsive and polished.', 4, 6),
(997, 99, 'Responsive Grid Layout', 'Build mobile-first responsive grids and breakpoints so layouts adapt cleanly to every screen size.', 4, 7),
(998, 99, 'Component Props', 'Pass props through React components and connect them to ShadCN UI and Tailwind classes in a type-safe way.', 4, 8),
(999, 99, 'Theme Toggle - Dark Mode', 'Implement a dark and light theme toggle with persistence and consistent design tokens across components.', 4, 9),
(1000, 99, 'Real Data Transformation', 'Map real API or static data into lists and cards with sensible loading states and typed boundaries.', 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `chunks`
--

CREATE TABLE `chunks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content_block_id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(2048) NOT NULL,
  `bold` tinyint(1) NOT NULL DEFAULT 0,
  `italic` tinyint(1) NOT NULL DEFAULT 0,
  `order_index` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chunks`
--

INSERT INTO `chunks` (`id`, `content_block_id`, `text`, `bold`, `italic`, `order_index`) VALUES
(1, 2, 'CSS allows you ', 0, 0, 0),
(2, 2, 'to style', 1, 0, 1),
(950001, 900004, 'In this module you set up a modern ', 0, 0, 0),
(950002, 900004, 'React', 1, 0, 1),
(950003, 900004, ' development environment and build your first UI: a simple ', 0, 0, 2),
(950004, 900004, 'project card', 1, 0, 3),
(950005, 900004, '. By the end you have a _centered_ card on the screen, styled only with ', 0, 0, 4),
(950006, 900004, 'Tailwind CSS', 1, 0, 5),
(950007, 900004, ' utility classes.', 0, 0, 6),
(950008, 900006, 'Tailwind CSS', 1, 0, 0),
(950009, 900006, ' is a _utility-first_ CSS framework: you build modern UIs quickly without writing separate custom CSS files. You add ', 0, 0, 1),
(950010, 900006, 'pre-defined utility classes', 1, 0, 2),
(950011, 900006, ' to HTML instead of defining rules in stylesheets.', 0, 0, 3),
(950012, 900009, 'Styles live in a ', 0, 0, 0),
(950013, 900009, 'CSS file', 1, 0, 1),
(950014, 900009, ' (for example rules for a card: padding, white background, rounded corners). In HTML you use a ', 0, 0, 2),
(950015, 900009, 'named class', 1, 0, 3),
(950016, 900009, ' on a div (for example _card_).', 0, 0, 4),
(950017, 900011, 'You build the same look with ', 0, 0, 0),
(950018, 900011, 'utility classes', 1, 0, 1),
(950019, 900011, ' on the div—padding, background, rounded corners—_directly in the markup_.', 0, 0, 2),
(950020, 900013, 'Faster development — less jumping between HTML and CSS files', 0, 0, 0),
(950021, 900014, 'Consistency — shared spacing, colors, and sizes', 0, 0, 0),
(950022, 900015, 'No invented names — no long class names like card-container-wrapper', 0, 0, 0),
(950023, 900016, 'Smaller CSS — unused styles can be removed in production', 0, 0, 0),
(950024, 900017, 'Responsive design — breakpoint prefixes such as md and lg', 0, 0, 0),
(950025, 900019, 'Utility classes — one job each (for example padding, text size)', 0, 0, 0),
(950026, 900020, 'Composition — many utilities combine into one layout', 0, 0, 0),
(950027, 900021, 'No magic — classes map to normal CSS properties', 0, 0, 0),
(950028, 900022, 'JIT compilation — only the CSS you use is generated', 0, 0, 0),
(950029, 900023, 'In this module you _learn by building_ a real card and seeing how utilities fit together.', 0, 0, 0),
(950030, 900025, 'Setting up a Vite + React + TypeScript project', 0, 0, 0),
(950031, 900026, 'Installing and configuring Tailwind CSS v4 with the Vite plugin', 0, 0, 0),
(950032, 900027, 'Understanding Tailwind’s utility-first workflow', 0, 0, 0),
(950033, 900028, 'Using flexbox to center content', 0, 0, 0),
(950034, 900029, 'Building a card with background and padding, borders and rounded corners, shadow, and typography', 0, 0, 0),
(950035, 900031, 'This module is the ', 0, 0, 0),
(950036, 900031, 'foundation', 1, 0, 1),
(950037, 900031, ' for everything that follows. You get a working ', 0, 0, 2),
(950038, 900031, 'modern React', 1, 0, 3),
(950039, 900031, ' setup with _Vite_ (fast dev server and hot updates), practice ', 0, 0, 4),
(950040, 900031, 'Tailwind', 1, 0, 5),
(950041, 900031, ' so you can ship UI without hand-writing CSS for every piece, and you build ', 0, 0, 6),
(950042, 900031, 'cards', 1, 0, 7),
(950043, 900031, '—a pattern used across real apps.', 0, 0, 8),
(950044, 900033, 'This module implements the first slice of the ', 0, 0, 0),
(950045, 900033, 'MITS Project Dashboard', 1, 0, 1),
(950046, 900033, ' (_see PRD_). Under ', 0, 0, 2),
(950047, 900033, 'Core features → Project cards → Visual components', 1, 0, 3),
(950048, 900033, ', you focus on a ', 0, 0, 4),
(950049, 900033, 'Title', 1, 0, 5),
(950050, 900033, ' (large, bold module name) and ', 0, 0, 6),
(950051, 900033, 'Description', 1, 0, 7),
(950052, 900033, ' (short preview text). You start with those two pieces _centered_ on the screen; later modules add badges, tags, colors, and themes.', 0, 0, 8),
(950053, 900035, 'Before you start, you should have:', 0, 0, 0),
(950054, 900036, 'Node.js (v18 or higher)', 0, 0, 0),
(950055, 900038, 'npm (comes with Node.js)', 0, 0, 0),
(950056, 900039, 'Git', 0, 0, 0),
(950057, 900041, 'A GitHub account', 0, 0, 0),
(950058, 900043, 'A code editor (VS Code recommended)', 0, 0, 0),
(950059, 900044, 'Basic HTML, CSS, and JavaScript', 0, 0, 0),
(950060, 900045, 'Familiarity with React basics (components, JSX)', 0, 0, 0),
(950061, 900047, '⏱️ About ', 0, 0, 0),
(950062, 900047, '30–45 minutes', 1, 0, 1),
(950063, 900047, '.', 0, 0, 2),
(950064, 900049, '1. Task 1: Create a new Vite + React + TypeScript project 2. Task 2: Install and configure Tailwind CSS 3. Task 3: Clean up default files 4. Task 4: Create a simple centered card 5. Task 5: Style the card with Tailwind classes 6. Task 6: Set up Git and GitHub version control', 0, 0, 0),
(950065, 900051, 'You end up with ', 0, 0, 0),
(950066, 900051, 'one card', 1, 0, 1),
(950067, 900051, ' centered on the page: ', 0, 0, 2),
(950068, 900051, 'white', 1, 0, 3),
(950069, 900051, ' background, ', 0, 0, 4),
(950070, 900051, 'rounded', 1, 0, 5),
(950071, 900051, ' corners and a light ', 0, 0, 6),
(950072, 900051, 'border', 1, 0, 7),
(950073, 900051, ', a ', 0, 0, 8),
(950074, 900051, 'shadow', 1, 0, 9),
(950075, 900051, ' for depth, a ', 0, 0, 10),
(950076, 900051, 'bold', 1, 0, 11),
(950077, 900051, ' title and ', 0, 0, 12),
(950078, 900051, 'muted', 1, 0, 13),
(950079, 900051, ' description, on a ', 0, 0, 14),
(950080, 900051, 'gray', 1, 0, 15),
(950081, 900051, ' page background.', 0, 0, 16),
(950082, 900053, '_Let’s get started._', 0, 0, 0),
(950083, 900056, 'In this module you explore ', 0, 0, 0),
(950084, 900056, 'Tailwind CSS', 1, 0, 1),
(950085, 900056, '’s color system by building three card variants: a ', 0, 0, 2),
(950086, 900056, 'light', 1, 0, 3),
(950087, 900056, ' theme card, a ', 0, 0, 4),
(950088, 900056, 'dark', 1, 0, 5),
(950089, 900056, ' theme card, and a ', 0, 0, 6),
(950090, 900056, 'colored accent', 1, 0, 7),
(950091, 900056, ' card. You see how ', 0, 0, 8),
(950092, 900056, 'colors', 1, 0, 9),
(950093, 900056, ', ', 0, 0, 10),
(950094, 900056, 'contrast', 1, 0, 11),
(950095, 900056, ', and ', 0, 0, 12),
(950096, 900056, 'design tokens', 1, 0, 13),
(950097, 900056, ' fit together in real layouts.', 0, 0, 14),
(950098, 900058, 'Tailwind’s color scales (for example 50 through 950)', 0, 0, 0),
(950099, 900059, 'How palette names are organized (gray, slate, blue, and others)', 0, 0, 0),
(950100, 900060, 'Text contrast and readability on different backgrounds', 0, 0, 0),
(950101, 900061, 'How background, text, and border colors relate', 0, 0, 0),
(950102, 900062, 'A responsive layout that shows several cards side by side (and stacks on small screens)', 0, 0, 0),
(950103, 900064, 'Understanding ', 0, 0, 0),
(950104, 900064, 'color systems', 1, 0, 1),
(950105, 900064, ' matters for ', 0, 0, 2),
(950106, 900064, 'consistent', 1, 0, 3),
(950107, 900064, ' UIs, for ', 0, 0, 4),
(950108, 900064, 'light and dark', 1, 0, 5),
(950109, 900064, ' themes, for ', 0, 0, 6),
(950110, 900064, 'accessibility', 1, 0, 7),
(950111, 900064, ' (contrast), and for ', 0, 0, 8),
(950112, 900064, 'confidence', 1, 0, 9),
(950113, 900064, ' when you pick colors instead of guessing hex values. Before you tackle full ', 0, 0, 10),
(950114, 900064, 'theme systems', 1, 0, 11),
(950115, 900064, ' (for example Module 10), you need a solid feel for how ', 0, 0, 12),
(950116, 900064, 'Tailwind', 1, 0, 13),
(950117, 900064, ' colors work.', 0, 0, 14),
(950118, 900066, 'You should have finished ', 0, 0, 0),
(950119, 900066, 'Module 1', 1, 0, 1),
(950120, 900066, ' and have a working project with:', 0, 0, 2),
(950121, 900067, 'Vite + React + TypeScript setup', 0, 0, 0),
(950122, 900068, 'Tailwind CSS v4 configured', 0, 0, 0),
(950123, 900069, 'A single centered card with title and description', 0, 0, 0),
(950124, 900071, 'Three card variations shown ', 0, 0, 0),
(950125, 900071, 'side by side', 1, 0, 1),
(950126, 900071, ' (or stacked on narrow screens):', 0, 0, 2),
(950127, 900072, 'Light card — light background, dark text, light borders', 0, 0, 0),
(950128, 900073, 'Dark card — dark slate-style background, light text, darker borders', 0, 0, 0),
(950129, 900074, 'Colored card — blue-tinted background, blue text, blue borders', 0, 0, 0),
(950130, 900075, 'Each card shows the ', 0, 0, 0),
(950131, 900075, 'same content', 1, 0, 1),
(950132, 900075, ' with a ', 0, 0, 2),
(950133, 900075, 'different color scheme', 1, 0, 3),
(950134, 900075, ' so you can compare how choices change the look.', 0, 0, 4),
(950135, 900077, 'This module supports the ', 0, 0, 0),
(950136, 900077, 'theme system', 1, 0, 1),
(950137, 900077, ' described in the PRD: ', 0, 0, 2),
(950138, 900077, 'Theme system → Color palette', 1, 0, 3),
(950139, 900077, ', including ', 0, 0, 4),
(950140, 900077, 'light', 1, 0, 5),
(950141, 900077, ' theme tones (whites and grays) and ', 0, 0, 6),
(950142, 900077, 'dark', 1, 0, 7),
(950143, 900077, ' theme tones (slate and dark backgrounds). Getting comfortable with these relationships now makes the full ', 0, 0, 8),
(950144, 900077, 'theme toggle', 1, 0, 9),
(950145, 900077, ' (Module 10) easier later.', 0, 0, 10),
(950146, 900079, '⏱️ About ', 0, 0, 0),
(950147, 900079, '30–40 minutes', 1, 0, 1),
(950148, 900079, '.', 0, 0, 2),
(950149, 900081, '1. Task 1: Understand Tailwind’s color scales 2. Task 2: Create the multi-card layout 3. Task 3: Build the light theme card 4. Task 4: Build the dark theme card 5. Task 5: Build the colored accent card 6. Task 6: Experiment with different color combinations', 0, 0, 0),
(950150, 900083, 'You end up with ', 0, 0, 0),
(950151, 900083, 'three', 1, 0, 1),
(950152, 900083, ' cards in a row (responsive), each with a clear ', 0, 0, 2),
(950153, 900083, 'color theme', 1, 0, 3),
(950154, 900083, '. You should be able to explain ', 0, 0, 4),
(950155, 900083, 'why', 1, 0, 5),
(950156, 900083, ' certain text colors sit on certain backgrounds, how ', 0, 0, 6),
(950157, 900083, 'Tailwind', 1, 0, 7),
(950158, 900083, ' scales help decisions, and how this sets up ', 0, 0, 8),
(950159, 900083, 'theme-aware', 1, 0, 9),
(950160, 900083, ' components.', 0, 0, 10),
(950161, 900086, 'This module is ', 0, 0, 0),
(950162, 900086, 'experimental', 1, 0, 1),
(950163, 900086, ': you try combinations, notice what works, and build a feel for ', 0, 0, 2),
(950164, 900086, 'contrast', 1, 0, 3),
(950165, 900086, ' without chasing perfection on the first pass.', 0, 0, 4),
(950166, 900087, 'Try different color combinations', 0, 0, 0),
(950167, 900088, 'See what works and what does not', 0, 0, 0),
(950168, 900089, 'Notice contrast through practice', 0, 0, 0),
(950169, 900090, 'Build intuition for picking colors', 0, 0, 0),
(950170, 900091, 'Let’s start exploring colors.', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `content_blocks`
--

CREATE TABLE `content_blocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chapter_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('h1','h2','h3','h4','paragraph','list_item','image','video','link') NOT NULL,
  `order_index` int(11) NOT NULL DEFAULT 0,
  `text` varchar(2048) DEFAULT NULL,
  `img_alt` varchar(255) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `raw_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_blocks`
--

INSERT INTO `content_blocks` (`id`, `chapter_id`, `type`, `order_index`, `text`, `img_alt`, `url`, `raw_text`) VALUES
(1, 1, 'h1', 0, 'Introduction', NULL, NULL, NULL),
(2, 1, 'paragraph', 1, NULL, NULL, NULL, NULL),
(3, 1, 'image', 2, NULL, 'HTML document structure diagram', 'https://content.example.com/images/html-structure.png', NULL),
(4, 1, 'link', 3, 'MDN HTML Documentation', NULL, 'https://developer.mozilla.org/en-US/docs/Web/HTML', NULL),
(900001, 991, 'h2', 2, 'Overview', NULL, NULL, NULL),
(900002, 991, 'h1', 0, 'Module 1: Project Setup & Your First Card', NULL, NULL, NULL),
(900003, 991, 'image', 1, NULL, 'Modul 1', 'http://localhost:8081/tailwind-css-shadcn-ui-tutorial.webp', NULL),
(900004, 991, 'paragraph', 3, NULL, NULL, NULL, 'In this module you set up a modern React development environment and build your first UI: a simple project card. By the end you have a _centered_ card on the screen, styled only with Tailwind CSS utility classes.'),
(900005, 991, 'h2', 4, 'What is Tailwind CSS?', NULL, NULL, NULL),
(900006, 991, 'paragraph', 5, NULL, NULL, NULL, 'Tailwind CSS is a _utility-first_ CSS framework: you build modern UIs quickly without writing separate custom CSS files. You add pre-defined utility classes to HTML instead of defining rules in stylesheets.'),
(900007, 991, 'h3', 6, 'Traditional CSS vs Tailwind', NULL, NULL, NULL),
(900008, 991, 'h4', 7, 'Traditional approach', NULL, NULL, NULL),
(900009, 991, 'paragraph', 8, NULL, NULL, NULL, 'Styles live in a CSS file (for example rules for a card: padding, white background, rounded corners). In HTML you use a named class on a div (for example _card_).'),
(900010, 991, 'h4', 9, 'Tailwind approach', NULL, NULL, NULL),
(900011, 991, 'paragraph', 10, NULL, NULL, NULL, 'You build the same look with utility classes on the div—padding, background, rounded corners—_directly in the markup_.'),
(900012, 991, 'h3', 11, 'Why Developers Love Tailwind', NULL, NULL, NULL),
(900013, 991, 'list_item', 12, NULL, NULL, NULL, 'Faster development — less jumping between HTML and CSS files'),
(900014, 991, 'list_item', 13, NULL, NULL, NULL, 'Consistency — shared spacing, colors, and sizes'),
(900015, 991, 'list_item', 14, NULL, NULL, NULL, 'No invented names — no long class names like card-container-wrapper'),
(900016, 991, 'list_item', 15, NULL, NULL, NULL, 'Smaller CSS — unused styles can be removed in production'),
(900017, 991, 'list_item', 16, NULL, NULL, NULL, 'Responsive design — breakpoint prefixes such as md and lg'),
(900018, 991, 'h3', 17, 'Key Concepts', NULL, NULL, NULL),
(900019, 991, 'list_item', 18, NULL, NULL, NULL, 'Utility classes — one job each (for example padding, text size)'),
(900020, 991, 'list_item', 19, NULL, NULL, NULL, 'Composition — many utilities combine into one layout'),
(900021, 991, 'list_item', 20, NULL, NULL, NULL, 'No magic — classes map to normal CSS properties'),
(900022, 991, 'list_item', 21, NULL, NULL, NULL, 'JIT compilation — only the CSS you use is generated'),
(900023, 991, 'paragraph', 22, NULL, NULL, NULL, 'In this module you _learn by building_ a real card and seeing how utilities fit together.'),
(900024, 991, 'h2', 23, 'What You\'ll Learn', NULL, NULL, NULL),
(900025, 991, 'list_item', 24, NULL, NULL, NULL, 'Setting up a Vite + React + TypeScript project'),
(900026, 991, 'list_item', 25, NULL, NULL, NULL, 'Installing and configuring Tailwind CSS v4 with the Vite plugin'),
(900027, 991, 'list_item', 26, NULL, NULL, NULL, 'Understanding Tailwind’s utility-first workflow'),
(900028, 991, 'list_item', 27, NULL, NULL, NULL, 'Using flexbox to center content'),
(900029, 991, 'list_item', 28, NULL, NULL, NULL, 'Building a card with background and padding, borders and rounded corners, shadow, and typography'),
(900030, 991, 'h2', 29, 'Why This Matters', NULL, NULL, NULL),
(900031, 991, 'paragraph', 30, NULL, NULL, NULL, 'This module is the foundation for everything that follows. You get a working modern React setup with _Vite_ (fast dev server and hot updates), practice Tailwind so you can ship UI without hand-writing CSS for every piece, and you build cards—a pattern used across real apps.'),
(900032, 991, 'h2', 31, 'PRD Connection', NULL, NULL, NULL),
(900033, 991, 'paragraph', 32, NULL, NULL, NULL, 'This module implements the first slice of the MITS Project Dashboard (_see PRD_). Under Core features → Project cards → Visual components, you focus on a Title (large, bold module name) and Description (short preview text). You start with those two pieces _centered_ on the screen; later modules add badges, tags, colors, and themes.'),
(900034, 991, 'h2', 33, 'Prerequisites', NULL, NULL, NULL),
(900035, 991, 'paragraph', 34, NULL, NULL, NULL, 'Before you start, you should have:'),
(900036, 991, 'list_item', 35, NULL, NULL, NULL, 'Node.js (v18 or higher)'),
(900037, 991, 'link', 36, 'Download here', NULL, 'https://nodejs.org/', NULL),
(900038, 991, 'list_item', 37, NULL, NULL, NULL, 'npm (comes with Node.js)'),
(900039, 991, 'list_item', 38, NULL, NULL, NULL, 'Git'),
(900040, 991, 'link', 39, 'Download here', NULL, 'https://git-scm.com/', NULL),
(900041, 991, 'list_item', 40, NULL, NULL, NULL, 'A GitHub account'),
(900042, 991, 'link', 41, 'Sign up here', NULL, 'https://github.com/', NULL),
(900043, 991, 'list_item', 42, NULL, NULL, NULL, 'A code editor (VS Code recommended)'),
(900044, 991, 'list_item', 43, NULL, NULL, NULL, 'Basic HTML, CSS, and JavaScript'),
(900045, 991, 'list_item', 44, NULL, NULL, NULL, 'Familiarity with React basics (components, JSX)'),
(900046, 991, 'h2', 45, 'Time Estimate', NULL, NULL, NULL),
(900047, 991, 'paragraph', 46, NULL, NULL, NULL, '⏱️ About 30–45 minutes.'),
(900048, 991, 'h2', 47, 'Module Structure', NULL, NULL, NULL),
(900049, 991, 'paragraph', 48, NULL, NULL, NULL, '1. Task 1: Create a new Vite + React + TypeScript project 2. Task 2: Install and configure Tailwind CSS 3. Task 3: Clean up default files 4. Task 4: Create a simple centered card 5. Task 5: Style the card with Tailwind classes 6. Task 6: Set up Git and GitHub version control'),
(900050, 991, 'h2', 49, 'Expected Result', NULL, NULL, NULL),
(900051, 991, 'paragraph', 50, NULL, NULL, NULL, 'You end up with one card centered on the page: white background, rounded corners and a light border, a shadow for depth, a bold title and muted description, on a gray page background.'),
(900052, 991, 'video', 51, 'Expected Result', NULL, 'http://localhost:8081/module-1-solution.mp4', NULL),
(900053, 991, 'paragraph', 52, NULL, NULL, NULL, '_Let’s get started._'),
(900054, 992, 'h1', 0, 'Module 2: Playing with Colors - Light & Dark Cards', NULL, NULL, NULL),
(900055, 992, 'h2', 1, 'Overview', NULL, NULL, NULL),
(900056, 992, 'paragraph', 2, NULL, NULL, NULL, 'In this module you explore Tailwind CSS’s color system by building three card variants: a light theme card, a dark theme card, and a colored accent card. You see how colors, contrast, and design tokens fit together in real layouts.'),
(900057, 992, 'h2', 3, 'What You\'ll Learn', NULL, NULL, NULL),
(900058, 992, 'list_item', 4, NULL, NULL, NULL, 'Tailwind’s color scales (for example 50 through 950)'),
(900059, 992, 'list_item', 5, NULL, NULL, NULL, 'How palette names are organized (gray, slate, blue, and others)'),
(900060, 992, 'list_item', 6, NULL, NULL, NULL, 'Text contrast and readability on different backgrounds'),
(900061, 992, 'list_item', 7, NULL, NULL, NULL, 'How background, text, and border colors relate'),
(900062, 992, 'list_item', 8, NULL, NULL, NULL, 'A responsive layout that shows several cards side by side (and stacks on small screens)'),
(900063, 992, 'h2', 9, 'Why This Matters', NULL, NULL, NULL),
(900064, 992, 'paragraph', 10, NULL, NULL, NULL, 'Understanding color systems matters for consistent UIs, for light and dark themes, for accessibility (contrast), and for confidence when you pick colors instead of guessing hex values. Before you tackle full theme systems (for example Module 10), you need a solid feel for how Tailwind colors work.'),
(900065, 992, 'h2', 11, 'Starting Point', NULL, NULL, NULL),
(900066, 992, 'paragraph', 12, NULL, NULL, NULL, 'You should have finished Module 1 and have a working project with:'),
(900067, 992, 'list_item', 13, NULL, NULL, NULL, 'Vite + React + TypeScript setup'),
(900068, 992, 'list_item', 14, NULL, NULL, NULL, 'Tailwind CSS v4 configured'),
(900069, 992, 'list_item', 15, NULL, NULL, NULL, 'A single centered card with title and description'),
(900070, 992, 'h2', 16, 'What We\'re Building', NULL, NULL, NULL),
(900071, 992, 'paragraph', 17, NULL, NULL, NULL, 'Three card variations shown side by side (or stacked on narrow screens):'),
(900072, 992, 'list_item', 18, NULL, NULL, NULL, 'Light card — light background, dark text, light borders'),
(900073, 992, 'list_item', 19, NULL, NULL, NULL, 'Dark card — dark slate-style background, light text, darker borders'),
(900074, 992, 'list_item', 20, NULL, NULL, NULL, 'Colored card — blue-tinted background, blue text, blue borders'),
(900075, 992, 'paragraph', 21, NULL, NULL, NULL, 'Each card shows the same content with a different color scheme so you can compare how choices change the look.'),
(900076, 992, 'h2', 22, 'PRD Connection', NULL, NULL, NULL),
(900077, 992, 'paragraph', 23, NULL, NULL, NULL, 'This module supports the theme system described in the PRD: Theme system → Color palette, including light theme tones (whites and grays) and dark theme tones (slate and dark backgrounds). Getting comfortable with these relationships now makes the full theme toggle (Module 10) easier later.'),
(900078, 992, 'h2', 24, 'Time Estimate', NULL, NULL, NULL),
(900079, 992, 'paragraph', 25, NULL, NULL, NULL, '⏱️ About 30–40 minutes.'),
(900080, 992, 'h2', 26, 'Module Structure', NULL, NULL, NULL),
(900081, 992, 'paragraph', 27, NULL, NULL, NULL, '1. Task 1: Understand Tailwind’s color scales 2. Task 2: Create the multi-card layout 3. Task 3: Build the light theme card 4. Task 4: Build the dark theme card 5. Task 5: Build the colored accent card 6. Task 6: Experiment with different color combinations'),
(900082, 992, 'h2', 28, 'Expected Result', NULL, NULL, NULL),
(900083, 992, 'paragraph', 29, NULL, NULL, NULL, 'You end up with three cards in a row (responsive), each with a clear color theme. You should be able to explain why certain text colors sit on certain backgrounds, how Tailwind scales help decisions, and how this sets up theme-aware components.'),
(900084, 992, 'image', 30, NULL, 'Expected Result', 'assets/project-description-images/module-2-solution.png', NULL),
(900085, 992, 'h2', 31, 'Learning Approach', NULL, NULL, NULL),
(900086, 992, 'paragraph', 32, NULL, NULL, NULL, 'This module is experimental: you try combinations, notice what works, and build a feel for contrast without chasing perfection on the first pass.'),
(900087, 992, 'list_item', 33, NULL, NULL, NULL, 'Try different color combinations'),
(900088, 992, 'list_item', 34, NULL, NULL, NULL, 'See what works and what does not'),
(900089, 992, 'list_item', 35, NULL, NULL, NULL, 'Notice contrast through practice'),
(900090, 992, 'list_item', 36, NULL, NULL, NULL, 'Build intuition for picking colors'),
(900091, 992, 'paragraph', 37, NULL, NULL, NULL, '*Let’s start exploring colors.*');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `difficulty` enum('beginner','intermediate','advanced') NOT NULL DEFAULT 'beginner',
  `total_chapters` int(11) NOT NULL DEFAULT 0,
  `total_credits` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `description`, `difficulty`, `total_chapters`, `total_credits`, `created_at`, `slug`) VALUES
(1, 'Web Development Fundamentals', 'Learn the basics of HTML, CSS, and JavaScript for modern web development', 'beginner', 6, 26, '2024-12-31 23:00:00.000', 'web-development-fundamentals'),
(2, 'Advanced React Development', 'Master React hooks, context, and advanced patterns for scalable applications', 'advanced', 5, 24, '2024-12-31 23:00:00.000', 'advanced-react-development'),
(3, 'Introduction to Python', 'Start your programming journey with Python basics and practical applications', 'beginner', 5, 20, '2024-12-31 23:00:00.000', 'introduction-to-python'),
(4, 'Database Design & SQL', 'Learn relational database concepts and SQL querying techniques', 'intermediate', 4, 18, '2024-12-31 23:00:00.000', 'database-design-sql'),
(5, 'Node.js Backend Development', 'Build scalable server-side applications with Node.js and Express', 'intermediate', 5, 22, '2024-12-31 23:00:00.000', 'nodejs-backend-development'),
(6, 'UI/UX Design Principles', 'Master the fundamentals of user interface and user experience design', 'beginner', 5, 19, '2024-12-31 23:00:00.000', 'uiux-design-principles'),
(7, 'DevOps and Deployment', 'Learn continuous integration, deployment, and infrastructure management', 'advanced', 4, 19, '2024-12-31 23:00:00.000', 'devops-and-deployment'),
(8, 'Mobile App Development', 'Create cross-platform mobile applications using React Native', 'intermediate', 4, 18, '2024-12-31 23:00:00.000', 'mobile-app-development'),
(9, 'Machine Learning Basics', 'Introduction to ML concepts, algorithms, and practical implementations', 'intermediate', 4, 19, '2024-12-31 23:00:00.000', 'machine-learning-basics'),
(10, 'Cybersecurity Fundamentals', 'Essential security concepts and practices for modern applications', 'intermediate', 0, 0, '2024-12-31 23:00:00.000', 'cybersecurity-fundamentals'),
(11, 'Cloud Computing with AWS', 'Learn Amazon Web Services and cloud architecture patterns', 'advanced', 0, 0, '2024-12-31 23:00:00.000', 'cloud-computing-with-aws'),
(12, 'JavaScript ES6+ Features', 'Modern JavaScript features and best practices for clean code', 'intermediate', 0, 0, '2024-12-31 23:00:00.000', 'javascript-es6-features'),
(13, 'Docker and Containerization', 'Master containerization with Docker and orchestration basics', 'intermediate', 0, 0, '2024-12-31 23:00:00.000', 'docker-and-containerization'),
(14, 'Git Version Control', 'Essential Git commands and workflow strategies for team collaboration', 'beginner', 0, 0, '2024-12-31 23:00:00.000', 'git-version-control'),
(15, 'API Design and Development', 'Best practices for designing and building RESTful APIs', 'intermediate', 0, 0, '2024-12-31 23:00:00.000', 'api-design-and-development'),
(16, 'Frontend Testing Strategies', 'Unit testing, integration testing, and e2e testing for web apps', 'advanced', 0, 0, '2024-12-31 23:00:00.000', 'frontend-testing-strategies'),
(17, 'Agile Project Management', 'Scrum, Kanban, and agile methodologies for software development', 'beginner', 0, 0, '2024-12-31 23:00:00.000', 'agile-project-management'),
(18, 'Data Structures & Algorithms', 'Essential CS concepts for technical interviews and problem solving', 'intermediate', 0, 0, '2024-12-31 23:00:00.000', 'data-structures-algorithms'),
(99, 'Tailwind CSS & ShadCN UI Tutorial', 'Learn utility-first styling with Tailwind CSS v4 and compose accessible, themed components with ShadCN UI in a Vite + React + TypeScript project—from your first card to responsive layouts, dark mode, and real data.', 'beginner', 10, 40, '2026-03-25 15:25:53.752', 'tailwind-css-shadcn-ui-tutorial');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_options`
--

CREATE TABLE `quiz_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `option_id` varchar(32) NOT NULL,
  `text` varchar(512) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0,
  `order_index` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_options`
--

INSERT INTO `quiz_options` (`id`, `question_id`, `option_id`, `text`, `is_correct`, `order_index`) VALUES
(1, 1, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(2, 1, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(3, 1, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(4, 2, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(5, 2, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(6, 2, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(7, 3, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(8, 3, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(9, 3, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(10, 4, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(11, 4, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(12, 4, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(13, 5, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(14, 5, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(15, 5, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(16, 6, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(17, 6, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(18, 6, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(19, 7, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(20, 7, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(21, 7, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(22, 8, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(23, 8, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(24, 8, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(25, 9, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(26, 9, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(27, 9, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(28, 10, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(29, 10, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(30, 10, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(31, 11, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(32, 11, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(33, 11, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(34, 12, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(35, 12, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(36, 12, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(37, 13, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(38, 13, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(39, 13, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(40, 14, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(41, 14, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(42, 14, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(43, 15, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(44, 15, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(45, 15, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(46, 16, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(47, 16, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(48, 16, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(49, 17, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(50, 17, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(51, 17, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(52, 18, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(53, 18, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(54, 18, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(55, 19, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(56, 19, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(57, 19, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(58, 20, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(59, 20, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(60, 20, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(61, 21, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(62, 21, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(63, 21, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(64, 22, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(65, 22, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(66, 22, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(67, 23, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(68, 23, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(69, 23, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(70, 24, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(71, 24, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(72, 24, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(73, 25, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(74, 25, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(75, 25, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(76, 26, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(77, 26, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(78, 26, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(79, 27, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(80, 27, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(81, 27, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(82, 28, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(83, 28, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(84, 28, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(85, 29, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(86, 29, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(87, 29, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(88, 30, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(89, 30, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(90, 30, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(91, 31, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(92, 31, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(93, 31, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(94, 32, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(95, 32, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(96, 32, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(97, 33, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(98, 33, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(99, 33, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(100, 34, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(101, 34, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(102, 34, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(103, 35, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(104, 35, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(105, 35, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(106, 36, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(107, 36, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(108, 36, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(109, 37, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(110, 37, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(111, 37, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(112, 38, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(113, 38, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(114, 38, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(115, 39, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(116, 39, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(117, 39, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(118, 40, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(119, 40, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(120, 40, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(121, 41, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(122, 41, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(123, 41, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(124, 42, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(125, 42, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(126, 42, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(993001, 990001, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(993002, 990001, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(993003, 990001, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(993004, 990002, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(993005, 990002, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(993006, 990002, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(993007, 990003, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(993008, 990003, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(993009, 990003, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(993010, 990004, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(993011, 990004, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(993012, 990004, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(993013, 990005, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(993014, 990005, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(993015, 990005, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(993016, 990006, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(993017, 990006, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(993018, 990006, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(993019, 990007, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(993020, 990007, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(993021, 990007, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(993022, 990008, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(993023, 990008, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(993024, 990008, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(993025, 990009, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(993026, 990009, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(993027, 990009, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2),
(993028, 990010, 'a', 'The module covers skills and concepts listed in the chapter description.', 1, 0),
(993029, 990010, 'b', 'This chapter is optional and has no assessment.', 0, 1),
(993030, 990010, 'c', 'The chapter only repeats content from unrelated courses.', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chapter_id` bigint(20) UNSIGNED NOT NULL,
  `text` text NOT NULL,
  `order_index` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `chapter_id`, `text`, `order_index`) VALUES
(1, 1, 'Which statement best reflects the learning goals of “HTML Structure and Semantics”?', 0),
(2, 2, 'Which statement best reflects the learning goals of “CSS Styling and Layout”?', 0),
(3, 3, 'Which statement best reflects the learning goals of “JavaScript Basics”?', 0),
(4, 4, 'Which statement best reflects the learning goals of “DOM Manipulation”?', 0),
(5, 5, 'Which statement best reflects the learning goals of “Responsive Design”?', 0),
(6, 6, 'Which statement best reflects the learning goals of “Web Forms and Validation”?', 0),
(7, 7, 'Which statement best reflects the learning goals of “React Hooks Deep Dive”?', 0),
(8, 8, 'Which statement best reflects the learning goals of “Context API and State Management”?', 0),
(9, 9, 'Which statement best reflects the learning goals of “Performance Optimization”?', 0),
(10, 10, 'Which statement best reflects the learning goals of “Advanced Component Patterns”?', 0),
(11, 11, 'Which statement best reflects the learning goals of “Testing React Applications”?', 0),
(12, 12, 'Which statement best reflects the learning goals of “Python Syntax and Variables”?', 0),
(13, 13, 'Which statement best reflects the learning goals of “Control Flow and Functions”?', 0),
(14, 14, 'Which statement best reflects the learning goals of “Data Structures in Python”?', 0),
(15, 15, 'Which statement best reflects the learning goals of “File I/O and Exception Handling”?', 0),
(16, 16, 'Which statement best reflects the learning goals of “Object-Oriented Programming”?', 0),
(17, 17, 'Which statement best reflects the learning goals of “Database Fundamentals”?', 0),
(18, 18, 'Which statement best reflects the learning goals of “Basic SQL Queries”?', 0),
(19, 19, 'Which statement best reflects the learning goals of “Advanced SQL Operations”?', 0),
(20, 20, 'Which statement best reflects the learning goals of “Database Design Patterns”?', 0),
(21, 21, 'Which statement best reflects the learning goals of “Node.js Fundamentals”?', 0),
(22, 22, 'Which statement best reflects the learning goals of “Express.js Framework”?', 0),
(23, 23, 'Which statement best reflects the learning goals of “Database Integration”?', 0),
(24, 24, 'Which statement best reflects the learning goals of “Authentication and Security”?', 0),
(25, 25, 'Which statement best reflects the learning goals of “API Testing and Documentation”?', 0),
(26, 26, 'Which statement best reflects the learning goals of “Design Thinking Process”?', 0),
(27, 27, 'Which statement best reflects the learning goals of “Visual Design Principles”?', 0),
(28, 28, 'Which statement best reflects the learning goals of “Wireframing and Prototyping”?', 0),
(29, 29, 'Which statement best reflects the learning goals of “Usability Testing”?', 0),
(30, 30, 'Which statement best reflects the learning goals of “Accessibility in Design”?', 0),
(31, 31, 'Which statement best reflects the learning goals of “CI/CD Pipeline Setup”?', 0),
(32, 32, 'Which statement best reflects the learning goals of “Container Orchestration”?', 0),
(33, 33, 'Which statement best reflects the learning goals of “Infrastructure as Code”?', 0),
(34, 34, 'Which statement best reflects the learning goals of “Monitoring and Logging”?', 0),
(35, 35, 'Which statement best reflects the learning goals of “React Native Fundamentals”?', 0),
(36, 36, 'Which statement best reflects the learning goals of “Navigation and State”?', 0),
(37, 37, 'Which statement best reflects the learning goals of “Native Device Features”?', 0),
(38, 38, 'Which statement best reflects the learning goals of “App Store Deployment”?', 0),
(39, 39, 'Which statement best reflects the learning goals of “ML Algorithms Overview”?', 0),
(40, 40, 'Which statement best reflects the learning goals of “Data Preprocessing”?', 0),
(41, 41, 'Which statement best reflects the learning goals of “Model Training and Evaluation”?', 0),
(42, 42, 'Which statement best reflects the learning goals of “Practical ML Projects”?', 0),
(990001, 991, 'Which statement best reflects the learning goals of \"Project Setup & First Card\"?', 0),
(990002, 992, 'Which statement best reflects the learning goals of \"Color Exploration\"?', 0),
(990003, 993, 'Which statement best reflects the learning goals of \"Typography & Spacing\"?', 0),
(990004, 994, 'Which statement best reflects the learning goals of \"Introducing ShadCN UI\"?', 0),
(990005, 995, 'Which statement best reflects the learning goals of \"Badges & Tags\"?', 0),
(990006, 996, 'Which statement best reflects the learning goals of \"Card Interactions\"?', 0),
(990007, 997, 'Which statement best reflects the learning goals of \"Responsive Grid Layout\"?', 0),
(990008, 998, 'Which statement best reflects the learning goals of \"Component Props\"?', 0),
(990009, 999, 'Which statement best reflects the learning goals of \"Theme Toggle - Dark Mode\"?', 0),
(990010, 1000, 'Which statement best reflects the learning goals of \"Real Data Transformation\"?', 0);

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('37ce0319-640e-4000-abc7-ee50f96d407c', '47fa2d6345196b64dd418d6da0664dec503ff144015bb10990588673895ecc3a', '2026-03-25 15:25:52.395', '20250816132700_init', NULL, NULL, '2026-03-25 15:25:52.377', 1),
('3d4d80c7-5e1b-4365-875c-099bd26e7f40', '1531edaa62a82d8420f32170d031689d6058564fb048e0a7f4d406096feff98a', '2026-03-25 15:25:52.440', '20260323130000_add_chunks', NULL, NULL, '2026-03-25 15:25:52.431', 1),
('bd512ad3-11c9-4b11-9973-bf9b69023b67', 'c1d5149ca2c7a202ca70ff391d5f343b2d9d0cf87627acae2d77f8e04fadeda6', '2026-03-25 15:25:52.407', '20260322100000_add_course_slug', NULL, NULL, '2026-03-25 15:25:52.396', 1),
('c46233c2-7fff-498c-a13b-bee9d3b49327', '110124c859df5b8e89966bb4064df7ae984dcc22ed5406ab4379c55783035940', '2026-03-25 15:25:52.445', '20260324120000_add_list_item_content_block', NULL, NULL, '2026-03-25 15:25:52.440', 1),
('e8acd067-60b2-4705-88c4-b15a682c51cc', '1e5dc0f785ffa01b656379992720dc14f3c44ce756d375d88822d6d3510f0efd', '2026-03-25 15:25:52.376', '20250816120635_init', NULL, NULL, '2026-03-25 15:25:52.315', 1),
('fc6fdbf2-895e-4806-ae5f-562354d6dca7', '56915915f4796d2c5891a807b85c6019bd2024c63e1b9167cd746527ce8ccc11', '2026-03-25 15:25:52.431', '20260323120000_content_blocks_and_quiz', NULL, NULL, '2026-03-25 15:25:52.407', 1),
('ff018779-5d6b-40fb-a406-ff01d4cc9abf', '5510ada5cd32dcfe47c982ada552ee614dbe24c43de88a51b42c4a8a5dac3f99', '2026-03-25 15:25:52.454', '20260325100000_chunks_drop_size_color_list', NULL, NULL, '2026-03-25 15:25:52.446', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapters_course_id_order_index_idx` (`course_id`,`order_index`);

--
-- Indexes for table `chunks`
--
ALTER TABLE `chunks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chunks_content_block_id_order_index_idx` (`content_block_id`,`order_index`);

--
-- Indexes for table `content_blocks`
--
ALTER TABLE `content_blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_blocks_chapter_id_order_index_idx` (`chapter_id`,`order_index`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `courses_slug_key` (`slug`),
  ADD KEY `courses_difficulty_idx` (`difficulty`);

--
-- Indexes for table `quiz_options`
--
ALTER TABLE `quiz_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `quiz_options_question_id_option_id_key` (`question_id`,`option_id`),
  ADD KEY `quiz_options_question_id_order_index_idx` (`question_id`,`order_index`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_questions_chapter_id_order_index_idx` (`chapter_id`,`order_index`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `chunks`
--
ALTER TABLE `chunks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=950171;

--
-- AUTO_INCREMENT for table `content_blocks`
--
ALTER TABLE `content_blocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=900092;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `quiz_options`
--
ALTER TABLE `quiz_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=993031;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=990011;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `chapters_course_id_fkey` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chunks`
--
ALTER TABLE `chunks`
  ADD CONSTRAINT `chunks_content_block_id_fkey` FOREIGN KEY (`content_block_id`) REFERENCES `content_blocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content_blocks`
--
ALTER TABLE `content_blocks`
  ADD CONSTRAINT `content_blocks_chapter_id_fkey` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_options`
--
ALTER TABLE `quiz_options`
  ADD CONSTRAINT `quiz_options_question_id_fkey` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `quiz_questions_chapter_id_fkey` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
