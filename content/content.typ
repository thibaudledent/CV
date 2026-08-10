// =====================================================================
// CV CONTENT
// Pure data: no styling here. Layout lives in themes/.
// Edit this file for content changes; commits stay clean.
// =====================================================================

#let cv = (
  name: "Thibaud Ledent",
  title: "Freelance Senior Software Engineer · Tech Lead",
  location: "Namur, Belgium",
  email: "thibaudledent@gmail.com",
  links: (
    (label: "linkedin.com/in/thibaudledent", url: "https://www.linkedin.com/in/thibaudledent/"),
    (label: "github.com/thibaudledent", url: "https://github.com/thibaudledent"),
  ),

  profile: [Freelance senior software engineer and tech lead with 10+ years building and operating large-scale transactional platforms: 8 years on high-volume payment systems at Worldline/Ingenico (0 → 7M+ transactions/day) and currently full-stack tech lead on the European Commission's CBAM platform. Hands-on: architecture, delivery, production ownership.],

  experience: (
    (
      client: "European Commission, via Accenture",
      project: "CBAM — Carbon Border Adjustment Mechanism",
      role: "Freelance Tech Lead / Senior Software Engineer",
      location: "Brussels",
      dates: "Oct 2024 – present",
      summary: [EU carbon-pricing-at-the-border platform; definitive regime live since Jan 2026, serving importers across all 27 member states (\~20,000 authorised declarants, 99% of embedded emissions of CBAM goods covered).],
      bullets: (
        [Technical lead within a 15-person Scrum team on a 60+ person programme; hands-on full-stack development of cross-cutting platform services.],
        [Own the synchronization of company data between European Commission information systems and the CBAM platform — secure integration across distributed EC systems.],
        [Design and deliver shared capabilities used across the platform: document management, notifications, Camunda-based task management.],
      ),
      stack: "Java · Spring Boot 4 · Kubernetes · Kafka · Oracle · Redis · Camunda · Angular/TypeScript · AWS",
    ),
  ),

  // Employment umbrella for the ARHS years, with mission sub-blocks
  employment: (
    employer: "ARHS Group (part of Accenture)",
    role: "Consultant, final role Software Engineering Manager",
    location: "Brussels & Luxembourg",
    dates: "2015 – Oct 2024",
    intro: [Consultant since 2015 — started with IT systems for the *Government of Luxembourg* (Java, Oracle, WebSphere), then long-term missions at *Worldline (formerly Ingenico)* — payments:],
    missions: (
      (
        name: "Acquirer Hub — Lead Developer",
        dates: "2016 – 2024",
        summary: [Unified acquiring API consolidating Ingenico's post-acquisition systems into a single platform connecting *50+ acquiring banks worldwide*; scaled from *0 to 7M+ transactions/day* (sync + async flows), 99.9%+ measured availability.],
        bullets: (
          [Led one of the project's three Scrum teams (up to 10 developers), delivering \~one third of the 50+ bank integrations.],
          [Designed the asynchronous transaction flows and resilience mechanisms for zero-transaction-loss operation at scale.],
          [Led the Worldline *Bancontact NEXO* integration (Belgium's dominant card scheme).],
          [Operated the platform in production through the Ingenico → Worldline transformation; on-call rotation member.],
        ),
        stack: "Java · Cassandra · Kafka · S3 · Consul · OpenAPI · ELK · Puppet/Hiera",
      ),
      (
        name: "Tokenization Service — Lead Developer",
        dates: "2022 – 2024 (in parallel)",
        summary: [PCI-DSS tokenization platform shielding the wider organisation from card-data compliance; millions of requests/day.],
        bullets: (
          [Led the re-architecture of the monolithic token store into shards; executed the migration of *2+ billion tokens* hands-on against the live production system.],
        ),
        stack: "Java · Spring Boot 3 · Spring Batch · PostgreSQL · Envoy",
      ),
    ),
  ),

  skills: (
    (group: "Languages", items: "Java (expert) · Python · TypeScript/Angular · Bash · SQL"),
    (group: "Data & messaging", items: "Kafka · Cassandra · PostgreSQL · Oracle · Redis"),
    (group: "Cloud & infra", items: "AWS · Kubernetes · Docker · Puppet · ELK · Grafana"),
    (group: "Practices", items: "REST/OpenAPI design · DevOps/CI-CD · Scrum · PCI DSS · production ownership"),
  ),

  certifications: (
    [AWS Certified Solutions Architect – Associate (2019, not renewed)],
    [Oracle Certified Associate, Java SE 8 (2018)],
    [Professional Scrum Master I (2018)],
  ),

  education: (
    [MSc Management Science, HEC Liège — 2017, distinction],
    [MSc Computer Science & Engineering, University of Liège — 2015, distinction (English)],
  ),

  languages: "French (native) · English (professional) · Dutch (basic)",

  // Sparse-page insurance — rendered only if `show-open-source` is enabled in the theme
  open_source: [Maintain a fork of *j8583* (ISO 8583 Java library), originally built while working on payment platforms; kept up to date — #link("https://github.com/thibaudledent/j8583")[github.com/thibaudledent/j8583].],
)
