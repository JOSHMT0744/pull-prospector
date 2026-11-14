---
name: pull-learn
description: Feed outreach replies back into PULL dossiers - classify each reply, update scores and status, sync the CRM, and roll results up by project hypothesis, gate tier, mode and message variant to show which ICP segments actually have pull. Suggests offer-brief edits without applying them. Use when replies come in or someone asks what's working.
---

# pull-learn — close the loop

Outreach under PULL is an experiment. This skill turns replies into evidence about the **hypothesis**,
not just about individual leads.

**Read first:** `references/scoring-rubric.md`, `references/dossier-template.md`,
`references/guardrails.md`, `references/workspace-and-tools.md`.

## 1. Collect replies
- Replies can be pasted in, or read from the connected mail tool, **only if the user asks**, limited to
  threads with prospects in `prospects/`.
- Ask the user to confirm, for each prospect contacted: sent (yes/no), which variant, and the send date.
  Record them in `variant_sent` and `status: sent`.

## 2. Classify each reply

| Class | Meaning | Score update |
|---|---|---|
| `confirmed` | Yes, the project is live now | P → E, U → E (source: `reply`) |
| `confirmed-later` | The project is real, but not now | P → E, U → A; gate → nurture |
| `denied` | Not a project for them | P → A; gate → dq ("denied by prospect") |
| `wrong-person` | Points to someone else | Create or update a dossier for the referral (champion → buyer path) |
| `objection` | Engaged but raises a blocker | Record it under Likely objections |
| `no-reply` | Nothing after 10 days (or the user's threshold) | No score change |
| `opt-out` | Asked not to be contacted | status → opt-out; never draft again; CRM tag `pull:opt-out` |

Update `reply_class`, `status`, scores, `gate`, `updated`, and add the reply as a source (paraphrased).

**Champion mode:** also record whether the champion named or introduced the buyer
(`path_to_buyer.buyer_named`), and whether the conversation reached the buyer.

## 3. Sync
Offer a CRM update (notes + tags `pull:confirmed` / `pull:denied` / `pull:no-reply` / `pull:opt-out`) per
`workspace-and-tools.md`, after approval. Otherwise refresh the CSV export.

## 4. Rollup → `runs/<date>-learn.md`
Compute these **from the dossier files** (count them; don't estimate):
- Sent, reply rate, **project-confirmed rate** (`confirmed` ÷ sent), denied rate.
- Split by: **project hypothesis** · gate tier at send time (draft vs nurture) · mode (buyer vs champion) ·
  variant (project-led vs lacking-led) · Lacking tier.
- Champion mode: % of champion conversations that reached the buyer.
- Show sample sizes everywhere. Below 10 sends in a group, write "too few to call".

## 5. Suggest, don't apply
Append dated suggestions to the offer brief's **Suggested edits log**, and summarise them in chat.
Examples: retire a project hypothesis with repeated `denied`; add a trigger event that showed up in
`confirmed` replies; add a new disqualifier; switch the default mode. **Never edit the rest of the brief.**
The user decides.

## In chat
Three lines: what the data says, what it can't say yet (sample size), and the one experiment to run next.
