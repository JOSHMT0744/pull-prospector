---
name: pull-find
description: Find and research prospects who already have the project an offer serves, score each person's PULL (Project, Unavoidable, Looking, Lacking) with cited evidence, and gate them as draft, nurture or disqualified. Supports buyer mode and champion mode. Use to discover prospects, qualify a supplied list or CRM view, or research one named person or company.
---

# pull-find — find and score PULL

**Read first:** `references/pull-primer.md`, `references/scoring-rubric.md`,
`references/dossier-template.md`, `references/guardrails.md`, `references/workspace-and-tools.md`.

**Requires** an offer brief in `offers/`. If there isn't one, run pull-offer first.

## 0. Setup
- Detect tools (see `workspace-and-tools.md`). If there's no web search, enter degraded mode.
- Confirm: the offer, the mode (brief default unless overridden), the scan size (default 20–30), and the
  deep-research N (default 5).

## 1. Get candidates

**A. User-supplied list** (CSV, pasted names, CRM view or export): normalise to company + person (+ role
if known). If only companies are given, find the right person per the mode (step 2).

**B. Discovery:** search for **evidence of the project**, not for job titles.
- For each project in the brief, turn its trigger events and "where they show up" into 4–8 searches.
  Use the signal library in `scoring-rubric.md`. Examples: job posts naming the initiative; announced
  migrations; regulatory deadlines affecting a sector; public requests for recommendations.
- Use firmographic hints only to narrow searches.
- Skip accounts matching the brief's disqualifiers.
- Collect candidate accounts until you reach the scan size.

**Both:** merge and de-duplicate against the existing `prospects/` files. Re-score existing prospects
only if they're older than 30 days or the user asks.

## 2. Choose the person (mode)
- **Buyer mode (default):** the person who decides on and pays for this project (the brief's
  `buyer_role`). Also note 1–2 **potential champions** at the account (name + role only, no deep research).
- **Champion mode:** the person who owns or feels the project day to day (`champion_role`) and could
  argue for it internally. Also try to identify the buyer for the path-to-buyer check.
- Use public professional sources only (company site, press, public profiles, talks). If you can't
  identify a person, record the account with `prospect: unknown`; it can't pass the gate until a person
  is named.

## 3. Scan pass (cheap)
For each candidate, score **P and U only**, with one line of evidence each and no deep reading. Drop
P = A. Rank and pick the top N.

## 4. Deep research (top N)
For each prospect:
1. Read the primary sources: job posts, announcements, posts and talks by the person, filings, reviews.
   Record each source with its URL, published date, `person`/`account` level and a one-line paraphrase.
   Don't copy long passages.
2. Score P, U, Looking and Lacking (level + tier + fit) **strictly** per the rubric. When unsure, use `I`
   and write the reasoning.
3. Write the project hypothesis **in the prospect's own terms**.
4. Champion mode: complete `path_to_buyer`. Buyer mode: list `potential_champions`.
5. Apply the gate. Write `gate_reason` in one line.
6. Write or update the dossier in `prospects/` using `dossier-template.md`. Fill in: scorecard, project in
   their words, alternatives and shortfalls, path to buyer or potential champions, discovery questions,
   likely objections, sources. Leave **Drafts** and **Champion kit** for pull-draft.

## 5. Report
- Write or append to `runs/<date>-<offer>.md` (table in `workspace-and-tools.md`).
- In chat: counts by gate; for each `draft`/`nurture` prospect, one line on why; the 2–3 most common
  `dq` reasons (these show where the hypothesis is weak).
- Offer to run pull-draft next.

## Quality bar
- Every `E` has a working URL and a date within the rubric's age limit.
- No personal-life information (see `guardrails.md`).
- If most candidates come back `dq` for the same reason, say so plainly. It may mean the project
  hypothesis is wrong, which is a valuable result, not a failure.
