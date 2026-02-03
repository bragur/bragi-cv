// Bragi's CV - Cover Letter + Experience
// Refined greyscale with warm brown accents

#set page(
  paper: "a4",
  margin: (left: 2.5cm, right: 2.5cm, top: 2cm, bottom: 2cm),
)

#set text(
  font: "Inter",
  size: 9.5pt,
  lang: "en"
)

#set par(
  justify: false,
  leading: 0.7em,
)

// Color palette - greyscale with subtle brown warmth
#let primary = rgb("#2c2c2c")       // Near black for body
#let heading-color = rgb("#3d3632") // Warm dark brown-grey
#let accent = rgb("#5c534a")        // Muted brown
#let muted = rgb("#6b6b6b")         // Medium grey
#let light = rgb("#a8a8a8")         // Light grey
#let subtle = rgb("#d4d4d4")        // Very light grey for lines
#let block-bg = rgb("#f7f6f5")      // Warm off-white
#let warm-orange = rgb("#b5703d")   // Warm brownish orange

// Circle bullet points in muted brown, vertically centered
#set list(marker: box(height: 0.8em, align(horizon, text(fill: accent, size: 0.4em)[●])))

// Styled link function for highlighted links
#let styled-link(url, label) = text(weight: 600, fill: accent)[#underline[#link(url)[#label]]]

// =====================================================
// PAGE 1 - COVER LETTER
// =====================================================

#set page(margin: (left: 2.5cm, right: 2.5cm, top: 2.5cm, bottom: 2.5cm))

#v(1fr)

// Centered container with left-aligned content, indented to match experience content
#pad(left: 32pt, right: 32pt)[
  #block(width: 100%)[
    // Letterhead with left accent bar
    #align(left)[
      #context {
        let content = block[
          #set par(leading: 0.5em)
          #text(weight: 600, size: 11pt)[Bragi Bergþórsson]
          #v(-0.7em)
          #text(size: 9.5pt, weight: 600, fill: warm-orange)[Product Engineer]
          #v(-0.2em)
          #set text(size: 8.5pt, fill: accent)
          bragur\@hey.com
          #let phone = sys.inputs.at("phone", default: "")
          #if phone != "" {
            v(-0.5em)
            phone
            v(-0.6em)
          } else {
            v(-0.6em)
          }
          #link("https://linkedin.com/in/bragur")[linkedin.com/in/bragur]
        ]
        let size = measure(content)
        block[
          #place(left, dx: -24pt, dy: -1pt)[
            #rect(width: 8pt, height: size.height + 2pt, fill: accent)
          ]
          #content
        ]
      }
    ]

    #v(5em)

    // About content
    #align(left)[
      #set text(fill: primary, size: 9.5pt)
      #set par(leading: 0.8em)

      I'm a product engineer who's spent the last decade building digital products with a focus on UI/UX. I work closely with designers throughout development, making sure what we create is both beautiful and actually buildable, and that technical decisions improve rather than compromise the user experience. I'm drawn to teams who value craft and velocity in equal measure, who ship fast but sweat the details that matter.

      #v(0.8em)

      My background in photography and early interest in design shape how I think about product development. I care about the full experience: how things look, how they flow, how they respond to interaction and whether they actually solve the problem. I've spent years deeply involved in user testing and iteration, learning to balance user needs with technical feasibility while maintaining the speed needed to learn and improve.

      #v(0.8em)

      Before switching to tech at 33, I spent years as an opera singer, which taught me discipline, performance under pressure and clear communication. Outside of work I'm a husband and father of three in Vesturbær, Reykjavík, with a dog named Tumi, maker of sourdough and espresso, and someone who probably overthinks your interface design in a good way.
    ]

    #v(3em)

    // References
    #align(left)[
      #text(size: 9pt, weight: 500, fill: heading-color)[References]
      #v(0.5em)
      #set text(size: 8.5pt, fill: muted)
      References available upon request
    ]
  ]
]

#v(1fr)

// =====================================================
// PAGE 2 - RECENT EXPERIENCE (Avo + Skills)
// =====================================================
#pagebreak()
#set page(margin: (left: 2.5cm, right: 2.5cm, top: 3.5cm, bottom: 2cm))

// Section helper - indented to align with content column
#let section(title, content) = {
  v(0.6em)
  pad(left: 32pt)[
    #text(size: 9pt, weight: 500, fill: heading-color)[#title]
  ]
  v(0.3em)
  line(length: 100%, stroke: 0.3pt + subtle)
  v(0.6em)
  content
}

// Timeline components
#let timeline-dot = box(
  width: 8pt,
  height: 8pt,
  fill: accent,
)

#let experience-entry(title, company, dates, location, content) = {
  grid(
    columns: (20pt, 1fr),
    column-gutter: 12pt,
    [
      #align(center + top)[
        #v(0pt)
        #timeline-dot
      ]
    ],
    [
      #text(weight: 600, size: 10.5pt, fill: primary)[#title]
      #h(0pt)
      #text(fill: warm-orange, weight: 600, size: 10.5pt)[×]
      #h(0pt)
      #text(fill: muted, size: 10.5pt)[#company]
      #v(-0.4em)
      #text(size: 8.5pt, fill: accent)[#dates #h(2pt) · #h(2pt) #location]
      #v(0.5em)
      #set text(size: 9.5pt, fill: primary)
      #content
      #v(0.8em)
    ]
  )
}

#experience-entry(
  "Product Engineer",
  "Avo",
  "December 2020 – January 2026",
  "Reykjavík, Iceland",
  [
    Drove end-to-end product development for analytics tools used by companies including Adobe, IKEA, Delivery Hero and Wolt. Operating across the full stack from React and ReScript frontends to Firebase functions and CI/CD, I maintained rapid product velocity while being deliberate about what mattered: performance optimization, UX refinement through user testing and developer experience.

    #v(1em)
    #set text(size: 8.5pt)
    #text(weight: 500, fill: heading-color)[Internal AI Development Infrastructure]
    #v(0.3em)
    - Built and refined AI-accelerated development workflow, evolving from Cursor to Claude Code with custom agents, skills and integrations. By autumn 2025, this approach became my primary development method while maintaining quality standards
    - Created and maintained automation workflows that became core to the team's development velocity, enabling faster iteration cycles without sacrificing code quality
    - Established patterns and practices for AI-assisted development that were adopted across the engineering team

    #v(1em)
    #text(weight: 500, fill: heading-color)[Product Development]
    #v(0.3em)
    - Drove feature development from design through deployment, including a complex Figma-like interface feature (Journeys) that received strong positive user feedback, using AI-accelerated development to maintain velocity on technically demanding work
    - Implemented and refined UI for AI-powered product features including agent workflows, iterating on both prompts and user experience until the interaction felt natural
    - Led performance optimization efforts including compiler improvements and data structure redesigns (moving from linked-list heavy models to ordered maps) that measurably improved load times and user experience
    - Improved CI/CD pipeline performance by switching out bundlers and build tools, reducing deployment friction for the entire team

    #v(1em)
    #text(weight: 500, fill: heading-color)[Team & Culture]
    #v(0.3em)
    - Collaborated closely with designers through regular design reviews and iteration cycles, balancing design vision with technical feasibility and contributing to both design direction and implementation decisions
    - Participated in hiring, focusing on engineers who valued learning and craft over credentials
    - Mentored engineers through code review, pair programming and technical guidance
    - Contributed to building a culture of quality and continuous improvement
  ]
)

#v(2em)

// Skills card
#pad(left: 32pt)[
#box(
  width: 100%,
  fill: block-bg,
  radius: 3pt,
  inset: (x: 16pt, y: 14pt),
)[
  #set text(size: 8.5pt, fill: primary)
  #text(size: 9pt, weight: 500, fill: heading-color)[Skills]
  #v(0.5em)

  #grid(
    columns: (auto, 1fr),
    column-gutter: 14pt,
    row-gutter: 8pt,

    text(weight: 500, fill: heading-color)[Product & AI],
    [Product engineering, design collaboration, UX/UI design thinking, user testing and iteration, AI-accelerated development, developer experience, performance optimization],

    text(weight: 500, fill: heading-color)[Languages & Frameworks],
    [ReScript, JavaScript, React, HTML/CSS, Shell scripting],

    text(weight: 500, fill: heading-color)[Tools & Infrastructure],
    [Git, Firebase, CircleCI, Google Cloud, CI/CD pipelines],

    text(weight: 500, fill: heading-color)[Practices],
    [Code review, mentoring, technical documentation, accessibility, Shape Up methodology],
  )

  #v(0.4em)
  #text(size: 8pt, fill: muted)[#emph[Note: My experience with ReScript's strict type system provides a strong foundation for quickly adapting to TypeScript]]
]]

// =====================================================
// PAGE 3 - EARLIER EXPERIENCE + EDUCATION
// =====================================================
#pagebreak()
#set page(margin: (left: 2.5cm, right: 2.5cm, top: 2.5cm, bottom: 2cm))

#experience-entry(
  "Web Developer",
  "Gangverk",
  "August 2017 – December 2020",
  "Reykjavík, Iceland",
  [
    Gangverk designed and maintained the digital platform for Sotheby's auction house, working on a microservices architecture with Scala/Go backends and TypeScript/ReasonML React frontends.

    #set text(size: 8.5pt)
    - Served as tech lead for the largest user-facing web application built in ReasonML with React
    - Contributed significantly to login and registration flows, work that led to stepping up as tech lead for the bidding team
    - Identified and solved critical performance issues in the high-traffic bidding client from extremely slow load times, leading migration to NextJS and handling the majority of implementation work
    - Frontend-focused role with some backend exploration in Scala
    - Collaborated closely with designers on user experience
    - Worked within AWS/Kubernetes infrastructure managed by dedicated infrastructure team
  ]
)

#v(0.5em)

#experience-entry(
  "Web and Mobile Developer",
  "Advania",
  "2015 – 2017",
  "Reykjavík, Iceland",
  [
    Started the summer after my first year at university. Worked on web and mobile development projects, learning C\# and the Microsoft ecosystem while discovering my preference for JavaScript and frontend development.
  ]
)

#v(0.5em)

#experience-entry(
  "Lyric Tenor",
  "Theater Vorpommern",
  "2011 – 2014",
  "Stralsund, Germany",
  [
    Professional opera singer performing lead roles in productions in Germany. This career taught me discipline, working under pressure, collaboration in high-stakes environments and clear communication. These skills carried directly into software engineering.
  ]
)

#v(2em)

// Education & Other Work card
#pad(left: 32pt)[
#box(
  width: 100%,
  fill: block-bg,
  radius: 3pt,
  inset: (x: 16pt, y: 14pt),
)[
  #set text(size: 8pt, fill: primary)

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 24pt,

    // Education
    [
      #text(size: 9pt, weight: 500, fill: heading-color)[Education]
      #v(0.5em)

      #text(weight: 600)[B.Sc. in Computer Science]
      #h(4pt) #text(fill: muted, size: 7.5pt)[2014–2017]
      #v(-0.2em)
      #text(fill: muted)[Reykjavík University]
      #v(-0.1em)
      #text(size: 7.5pt)[Graduated with honors, Dean's list ×2, avg 9.3]

      #v(0.6em)

      #text(weight: 600)[M.Mus in Vocal Studies]
      #h(4pt) #text(fill: muted, size: 7.5pt)[2004–2007]
      #v(-0.2em)
      #text(fill: muted)[Guildhall School of Music & Drama, London]
      #v(-0.1em)
      #text(size: 7.5pt)[Advanced Certificate in Opera Studies]

      #v(0.6em)

      #text(weight: 600)[Vocal Studies]
      #h(4pt) #text(fill: muted, size: 7.5pt)[2002–2004]
      #v(-0.2em)
      #text(fill: muted)[Reykjavík College of Music]

      #v(0.6em)

      #text(weight: 600)[Matriculation Examination]
      #h(4pt) #text(fill: muted, size: 7.5pt)[1996–2000]
      #v(-0.2em)
      #text(fill: muted)[MH, Physics Department]
    ],

    // Other Work
    [
      #text(size: 9pt, weight: 500, fill: heading-color)[Other Work]
      #v(0.5em)

      #text(weight: 600)[Final Projects Instructor & Examiner]
      #v(-0.2em)
      #text(fill: muted)[Reykjavík University, Spring 2020]

      #v(0.6em)

      #text(weight: 600)[Main Instructor, Mobile App Development]
      #v(-0.2em)
      #text(fill: muted)[Reykjavík University, Autumn 2018]

      #v(0.6em)

      #text(weight: 600)[Morgunblaðið]
      #h(4pt) #text(fill: muted, size: 7.5pt)[2000–2004]
      #v(-0.2em)
      #text(fill: muted)[Advertising Department]
    ]
  )
]]

#v(1fr)
#align(right)[
  #text(size: 8pt, fill: light)[Last revised: Feb, 2026]
]
