// Bragi's CV - Cover Letter + Experience
// Refined greyscale with warm brown accents

#set document(title: "Bragi Bergþórsson - CV", author: "Bragi Bergþórsson")

#set page(paper: "a4")

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

// =====================================================
// PAGE 1 - COVER LETTER
// =====================================================

#set page(margin: (left: 2.5cm, right: 2.5cm, top: 2.5cm, bottom: 2.5cm))

#v(1fr)

// Centered container with left-aligned content, indented to match experience content
#pad(left: 32pt, right: 32pt)[
  #block(width: 100%)[
    // Letterhead with left accent bar
    #context {
      let letterhead = block[
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
      let size = measure(letterhead)
      block[
        #place(left, dx: -24pt, dy: -1pt)[
          #rect(width: 8pt, height: size.height + 2pt, fill: accent)
        ]
        #letterhead
      ]
    }

    #v(5em)

    // About content
    #set text(fill: primary, size: 9.5pt)
    #set par(leading: 0.8em)

    I'm a product engineer, and I've spent the last decade building digital products with a focus on UI/UX. I like working closely with designers while we build, so that what ships looks good, is actually buildable, and the technical calls make the experience better rather than worse. I'm happiest on teams that care about craft but still move fast.

    #v(0.8em)

    My background in photography and a long interest in design shape how I approach product work. I care about the whole thing, not just how something looks but how it feels to use and whether it actually solves the problem. I've spent years close to user testing and iteration, learning where to trade off what users want against what's feasible without slowing down so much that we stop learning.

    #v(0.8em)

    Before switching to tech at 33, I spent years as an opera singer, which taught me discipline, performance under pressure and clear communication. Outside of work I'm a husband and father of three in Vesturbær, Reykjavík, with a dog named Tumi, maker of sourdough and espresso, and someone who probably overthinks your interface design in a good way.

    #v(3em)

    // References
    #text(size: 9pt, weight: 500, fill: heading-color)[References]
    #v(0.5em)
    #set text(size: 8.5pt, fill: muted)
    #let ref1 = sys.inputs.at("ref1", default: "")
    #let ref2 = sys.inputs.at("ref2", default: "")
    #let ref3 = sys.inputs.at("ref3", default: "")
    #if ref1 != "" {
      ref1
      linebreak()
      ref2
      linebreak()
      ref3
    } else {
      [References available upon request]
    }
  ]
]

#v(1fr)

// =====================================================
// PAGE 2 - RECENT EXPERIENCE (dala.care + Leviosa + Avo)
// =====================================================
#pagebreak()
#set page(margin: (left: 2.5cm, right: 2.5cm, top: 3.5cm, bottom: 2cm))

// Timeline components
#let timeline-square = box(
  width: 8pt,
  height: 8pt,
  fill: accent,
)

#let experience-entry(title, company, dates, location, body) = {
  grid(
    columns: (20pt, 1fr),
    column-gutter: 12pt,
    [
      #align(center + top)[
        #timeline-square
      ]
    ],
    [
      #text(weight: 600, size: 10.5pt, fill: primary)[#title]
      #text(fill: warm-orange, weight: 600, size: 10.5pt)[×]
      #text(fill: muted, size: 10.5pt)[#company]
      #v(-0.4em)
      #text(size: 8.5pt, fill: accent)[#dates #h(2pt) · #h(2pt) #location]
      #v(0.5em)
      #set text(size: 9.5pt, fill: primary)
      #body
      #v(0.8em)
    ]
  )
}

#experience-entry(
  "Product Engineer",
  "dala.care",
  "August 2026 – Present",
  "Reykjavík, Iceland",
  [
    Product engineer at dala.care, a home care platform that reduces the complex day-to-day of home care — scheduling, care plans, and communication — to two apps that need almost no training: one for caregivers in the field, one for the office running operations at scale. At its centre is the Care Graph, mapping a care recipient to their family, caregivers, and other providers so everyone works from the same real-time picture.

    #v(1em)
    #set text(size: 8.5pt)
    - Ship production features in a regulated care domain through AI-native, agentic workflows, end-to-end across the caregiver app, the office administration app, and the services behind them
    - Orchestrate custom agents and skills across parallel worktrees, directing and reviewing the output instead of writing the code by hand
    - Work closely with design on flows that have to hold up both for a caregiver on a phone mid-visit and for coordinators managing visits at scale
  ]
)

#v(1em)

#experience-entry(
  "Product Engineer",
  "Leviosa",
  "March 2026 – July 2026",
  "Reykjavík, Iceland",
  [
    Full-stack developer at Leviosa, a practice-management platform built for healthcare providers that brings scheduling, clinical documentation, and patient flow into one place to cut administrative burden and give clinicians more time with patients. I shipped production features in a regulated healthcare domain, increasingly through AI-driven, agentic workflows.

    #v(1em)
    #set text(size: 8.5pt)
    - Built an AI-native workflow on my own agent tooling: self-orchestrating agents that carried a task from spec and planning through implementation, code review, and QA, with deterministic seed data and Playwright coverage of the real flows
    - Delivered features end-to-end across the stack: responsive frontend flows with autosave and draft recovery, real-time status and review views, and backend services with audit events, service-to-service auth, and AWS/ECS deployment
    - Worked full-stack across a React/TypeScript frontend with Node and Rust/GraphQL services, PostgreSQL, and Terraform-managed AWS
  ]
)

#v(1em)

#experience-entry(
  "Product Engineer",
  "Avo",
  "December 2020 – January 2026",
  "Reykjavík, Iceland",
  [
    Shipped features for analytics tools used by companies including Adobe, IKEA, Delivery Hero, and Wolt. I worked across the stack, from React and ReScript frontends to Firebase functions and CI/CD, with a focus on performance, UX refinement through user testing, and developer experience. Later I brought AI-accelerated development to the team, moving from Cursor to Claude Code with custom agents and skills, and it became how I did most of my work.

    #v(1em)
    #set text(size: 8.5pt)
    - Built Journeys, a complex Figma-like canvas interface that drew strong user feedback, leaning on AI-accelerated development for the harder parts
    - Built and refined the UI for AI-powered features, including agent workflows, tuning both the prompts and the interaction design
    - Led performance work: compiler improvements, data-structure redesigns (from linked-list-heavy models to ordered maps), and faster CI/CD through new bundlers, which cut load times and deployment friction
    - Worked with designers in regular reviews, keeping the work faithful to the design and buildable
    - Helped hire and mentor engineers, looking for people who cared about craft and learning over credentials
  ]
)

// =====================================================
// PAGE 3 - EARLIER EXPERIENCE + SKILLS + EDUCATION
// =====================================================
#pagebreak()
#set page(margin: (left: 2.5cm, right: 2.5cm, top: 2.5cm, bottom: 2cm))

#experience-entry(
  "Web Developer",
  "Gangverk",
  "August 2017 – December 2020",
  "Reykjavík, Iceland",
  [
    Gangverk built and ran the digital platform for Sotheby's auction house, a microservices setup with Scala/Go backends and TypeScript/ReasonML React frontends. I joined on the mobile app, moved to the registration team, and became tech lead for the bidding team.

    #set text(size: 8.5pt)
    - Was tech lead for the largest user-facing app, built in ReasonML and React
    - Diagnosed and fixed critical performance issues in the high-traffic bidding client, leading its migration to Next.js and doing most of the implementation
  ]
)

#v(0.35em)

#experience-entry(
  "Web and Mobile Developer",
  "Advania",
  "2015 – 2017",
  "Reykjavík, Iceland",
  [
    Started the summer after my first year at university, working on web and mobile projects in C\# and the Microsoft stack, where I found my preference for JavaScript and frontend. I learned React Native and shipped several customer apps, which led directly to Gangverk.
  ]
)

#v(0.35em)

#experience-entry(
  "Lyric Tenor",
  "Theater Vorpommern",
  "2011 – 2014",
  "Stralsund, Germany",
  [
    Professional opera singer performing lead roles in Germany. The work taught me discipline, performance under pressure, and clear communication, all of which carry into engineering.
  ]
)

#v(0.9em)

// Skills card
#pad(left: 32pt)[
#box(
  width: 100%,
  fill: block-bg,
  radius: 3pt,
  inset: (x: 16pt, y: 12pt),
)[
  #set text(size: 8.5pt, fill: primary)
  #text(size: 9pt, weight: 500, fill: heading-color)[Skills]
  #v(0.5em)

  #grid(
    columns: (auto, 1fr),
    column-gutter: 14pt,
    row-gutter: 6pt,

    text(weight: 500, fill: heading-color)[AI-Native Development],
    [Agentic workflows, multi-agent orchestration, Claude Code (custom agents, skills, hooks), building AI development tooling, prompt and context engineering, evals and QA harnesses],

    text(weight: 500, fill: heading-color)[Product & Design],
    [Product engineering, design collaboration, UX/UI thinking, user testing and iteration, accessibility, performance optimization],

    text(weight: 500, fill: heading-color)[Languages & Frameworks],
    [TypeScript, ReScript, JavaScript, React, Rust, GraphQL, HTML/CSS, Shell],

    text(weight: 500, fill: heading-color)[Tools & Infrastructure],
    [Git, AWS, Terraform, PostgreSQL, Firebase, CI/CD, Playwright],
  )
]]

#v(0.9em)

// Education & Other Work card
#pad(left: 32pt)[
#box(
  width: 100%,
  fill: block-bg,
  radius: 3pt,
  inset: (x: 16pt, y: 11pt),
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

      #v(0.4em)

      #text(weight: 600)[M.Mus in Vocal Studies]
      #h(4pt) #text(fill: muted, size: 7.5pt)[2004–2007]
      #v(-0.2em)
      #text(fill: muted)[Guildhall School of Music & Drama, London]
      #v(-0.1em)
      #text(size: 7.5pt)[Advanced Certificate in Opera Studies]

      #v(0.4em)

      #text(weight: 600)[Vocal Studies]
      #h(4pt) #text(fill: muted, size: 7.5pt)[2002–2004]
      #v(-0.2em)
      #text(fill: muted)[Reykjavík College of Music]

      #v(0.4em)

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

      #v(0.4em)

      #text(weight: 600)[Main Instructor, Mobile App Development]
      #v(-0.2em)
      #text(fill: muted)[Reykjavík University, Autumn 2018]

      #v(0.4em)

      #text(weight: 600)[Morgunblaðið]
      #h(4pt) #text(fill: muted, size: 7.5pt)[2000–2004]
      #v(-0.2em)
      #text(fill: muted)[Advertising Department]
    ]
  )
]]

#v(1fr)
#align(right)[
  #text(size: 8pt, fill: light)[Last revised: #datetime.today().display("[month repr:short], [year]")]
]
