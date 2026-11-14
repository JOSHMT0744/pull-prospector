# pull-prospector

A Claude plugin that finds people who **already have the project your product solves**, scores their
demand with cited evidence, and drafts outreach that **tests** demand instead of pushing it.

It's built entirely on the **PULL framework** by **Rob Snyder** (*The Physics of Startups*, Harvard
Innovation Labs). All credit for the framework is his; this tool is an independent implementation, and
its reference files describe PULL in our own words.
→ [The PULL framework](https://thephysicsofstartups.substack.com/p/the-pull-framework) ·
[Rob on Lenny's Newsletter](https://www.lennysnewsletter.com/p/an-86-minute-guide-to-finding-pmf)

## PULL in one line
A buyer pulls when they have a **P**roject on their to-do list, it's **U**navoidable now, they're
**L**ooking at options, and those options are **L**acking. You can't create that; you can only find it.

## What it does

| Skill | What it does |
|---|---|
| `pull-offer` | Interviews you and pushes back until you have a sharp **offer brief**: the projects you serve, why alternatives fall short, and who buys vs who champions. |
| `pull-find` | Discovers prospects through **evidence of the project** (job posts, deadlines, announcements), or qualifies your own list. Scores P/U/L/L as Evidenced / Inferred / Absent with sources, and gates each prospect as `draft`, `nurture` or `dq`. |
| `pull-draft` | Writes short email and LinkedIn messages (Project-led and Lacking-led variants) whose job is to ask *"is this on your plate?"*, plus an **information pack**: discovery questions, objections and a champion kit. |
| `pull-learn` | Classifies replies, updates scores, and rolls results up by project hypothesis, mode and variant, so you learn which ICP actually has pull. Suggests offer-brief edits; never applies them. |
| `pull-prospector` | The orchestrator: runs the whole pipeline. |

**Buyer mode** (default) targets the decision maker. **Champion mode** starts with an end user who
could advocate internally, adds a path-to-buyer check, and adds a forwardable internal pitch.

## What it will never do
- **Send anything.** It writes drafts only. You review and send.
- Draft for a prospect without evidence of a live, unavoidable project.
- Research personal-life information, or scrape sites against their terms.
- Overwrite or delete CRM data. It adds notes and tags, only after you approve.

## Install

**Claude Code / Claude desktop (plugin):**
```
/plugin marketplace add JOSHMT0744/pull-prospector
/plugin install pull-prospector@pull-prospector
```

**claude.ai (skills):** download the zips from the latest release (or run `scripts/build-zips.sh`) and
upload each one under Settings → Capabilities → Skills.

## Works best with
- **Web search + a browser/fetch tool** (required for Evidenced scores; without them the tool runs in a
  degraded mode and produces research to-dos instead of drafts).
- **Any connected CRM** (HubSpot, Salesforce, Zoho, Pipedrive, Attio…) for notes and tags. Without
  one, you get a CSV export.
- **A mail connector** (optional) to save drafts.

## Quick start
> "Use pull-prospector. Our product is ___."

It will interview you for the offer brief, confirm three testable hypotheses, find and score prospects,
then hand you dossiers and drafts in `pull-workspace/`. When replies come in: *"run pull-learn on these
replies"*.

## Testing
There are no automated evals by design. Quality is judged in the market:
- **Live metrics** from `pull-learn`: reply rate and **project-confirmed rate**, split by gate tier,
  mode and variant.
- **Release smoke test:** see [`RELEASE-CHECKLIST.md`](RELEASE-CHECKLIST.md).
- **Report a bad call:** open an issue using the template, attaching the dossier.

## Data protection (UK / EU)
B2B cold outreach to individuals in the UK/EU is covered by UK GDPR / EU GDPR and PECR. You're the
controller of the data you collect with this tool. Typically you'll rely on legitimate interest: keep a
short legitimate-interest assessment, include an opt-out in every message (the offer brief sets one), honour
objections immediately (`pull-learn` marks `opt-out` prospects as never-contact), and delete dossiers
you no longer need. This isn't legal advice.

## Contributing
Edit reference files in `shared/` only, then run `scripts/sync-shared.sh`, which copies them into each
skill's `references/` folder. Bump the version in `.claude-plugin/plugin.json`, update `CHANGELOG.md`,
and run the release checklist.

## Licence
MIT. The PULL framework itself is Rob Snyder's.
