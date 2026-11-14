---
name: pull-offer
description: Interview a founder or seller to build a PULL-framework offer brief - the projects their product serves, why current alternatives fall short, proof, and who buys versus who champions. Use when starting PULL prospecting, defining or refining an ICP, or when pull-prospector needs an offer brief.
---

# pull-offer — build the offer brief

The offer brief is the seller's own PULL hypothesis. Everything downstream is scored against it, so a
vague brief produces vague prospects. Your job is to **push back** until it's specific.

**Read first:** `references/pull-primer.md`.

## Interview

Ask in small rounds (2–4 questions at a time). Give a suggested answer where you can, inferred from what
they've said or their website. Challenge any answer that fails the test in the right-hand column.

| # | Ask | Push back if… |
|---|---|---|
| 1 | What does the product do, in one sentence a buyer would use? | It's feature or jargon language. |
| 2 | Which **projects** is it for? List 1–3. Phrase each as "We need to ___ by ___." | It's a pain ("reporting is slow") instead of a project ("rebuild board reporting before the Series A"). |
| 3 | For each project: what makes it **unavoidable** right now? | They can't name a deadline, mandate or consequence. |
| 4 | What do buyers use or consider today? Include in-house builds, spreadsheets, hiring someone, and doing nothing. | They say "no competitors". |
| 5 | Why do those alternatives **fall short**? Which tier: inconvenient, inadequate, or can't? | They can't name a critical reason, or everything is "inconvenient". |
| 6 | Name a real customer or prospect who had this project. What triggered it? | No name at all. Then mark the hypothesis **unproven** and continue. |
| 7 | Who **decides and pays** (the buyer)? Who **uses it and feels the pain** (the potential champion)? Same person? | It's only a job title with no reasoning. |
| 8 | Default mode: reach the **buyer** directly, or start with a **champion**? | — |
| 9 | Where do people with this project show up publicly (job posts, regulators, communities, events)? | — |
| 10 | Sender details for drafts: name, role, sign-off, opt-out line. | — |

If the user wants to skip the interview, accept their written brief, but list the gaps against this
table and mark weak sections `unproven`.

## Output: `offers/<offer-name>.md`

```markdown
---
offer: <offer-name>
product_one_liner: "..."
default_mode: buyer            # buyer | champion
buyer_role: "..."              # who decides/pays
champion_role: "..."           # who uses/feels it
sender: { name: , role: , company: , signoff: , opt_out_line: "Not relevant? Just say and I won't follow up." }
status: hypothesis             # hypothesis | partly-proven | proven
created: <date>
updated: <date>
---

## Projects we serve
### Project 1: "We need to ___ by ___"
- Why it's unavoidable: …
- Typical trigger events: …
- Where these people show up publicly: …
- Proof: <named example or "unproven">

## Alternatives and where they fall short
| Alternative | Falls short because | Tier (L1/L2/L3) |

## Firmographic hints (where to look, not who to target)
## Disqualifiers (signals that mean no fit)
## Suggested edits log   (pull-learn appends here; never auto-applied)
```

Finish by reading the brief back as **3 testable hypotheses** ("<role> at <kind of company> currently
has Project X because of trigger Y"). Ask the user to confirm them before any prospecting starts.
