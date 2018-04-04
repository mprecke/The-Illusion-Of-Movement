import PlaygroundSupport

var references = References()
PlaygroundPage.current.liveView = references
PlaygroundPage.current.needsIndefiniteExecution = true

var referencesString = "'Egyptmotionseries' - Newspaper clipping, 'Hufvudstadsbladet', Helsinki, Finland, published 1972 - Public Domain\n\n'The Kineograph' - by J. B. Linnet, Zeitgenössische Illustration, published 1886 - Public Domain\n\n'Phenakistoscope: A Couple Waltzing' - by E. Muybridge, published 1893 - Public Domain\n\n'The Horse in Motion' - by E. Muybridge, published 1878 - Public Domain\n\n'Plate 626, thoroughbred bay mare 'Annie G.' galloping' - by E. Muybridge, published 1887 - Public Domain\n\n'Modèle de film cinéma Edison' by P. Di Borgo, licenced under CC BY-SA 3.0\n\n'Filmstrip' by B. Everson, licensed under CC BY-SA 2.0\n\n\nSounds used in this book:\n\nBanana Slap Sound - http://soundbible.com/2047-Banana-Slap.html - Public Domain\n\nPunch Or Whack Sound - http://soundbible.com/1952-Punch-Or-Whack.html - Public Domain\n\nSlap Sound - http://soundbible.com/1948-Slap.html - Public Domain\n\nBicycle wheel turning - https://freesound.org/people/13GPanska_Lakota_Jan/sounds/378366/ - Public Domain, CC0 1.0\n\nSRS Foley Horse Galloping - https://freesound.org/people/StephenSaldanha/sounds/165532/ - Public Domain, CC0 1.0\n\nFilm 01 - https://freesound.org/people/bobv2/sounds/400862/ - Public Domain, CC0 1.0"

references.setup(header: "References", footer: "Thank you for your attention.", main: referencesString)
