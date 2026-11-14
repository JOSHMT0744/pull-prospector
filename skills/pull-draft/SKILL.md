---
name: pull-draft
description: Write PULL-framework outreach (email and LinkedIn DM, two variants each) and complete the information pack - discovery questions, objections and a champion kit - for prospects gated draft or nurture. Never sends. Optionally syncs to a connected CRM or saves email drafts after approval. Use when writing outreach for researched prospects.
---

# pull-draft — outreach + information pack

**Read first:** `references/pull-primer.md`, `references/scoring-rubric.md`,
`references/dossier-template.md`, `references/guardrails.md`, `references/workspace-and-tools.md`.

**Input:** dossiers in `prospects/` plus their offer brief. If the user names a prospect with no dossier,
run pull-find on that prospect first.

## Gate check
- `draft` → full drafts.
- `nurture` → **one** light check-in per channel that asks about timing ("is this on the roadmap for
  next year?"). No A/B variants.
- `dq` → no drafts, even if asked. Give the reason and say what evidence would change it.

## The message's job
It tests **whether the project exists for this person now**. It isn't meant to sell or book a demo. A
clear "no" is a good outcome.

## Draft rules (all messages)
1. **Under 90 words** (LinkedIn DM: under 60; connection note: under 300 characters).
2. **Open with their project**, in their terms, never with the product or yourself.
3. Cite **exactly one** specific public signal (e.g. "saw you're hiring a ___ to lead ___"). Keep it
   professional, never creepy.
4. Mention the product in **one line at most**. It's optional for the Project-led variant.
5. End with a **yes/no question that tests the project**: "Is ___ on your plate this quarter?"
6. If Looking or Lacking are only `I`, **ask** about them; don't assert them.
7. No invented familiarity, no invented urgency, no claims missing from the offer brief.
8. Plain text. No emojis, no exclamation marks, no buzzwords.
9. Email: a subject line under 6 words naming the project; the sender's sign-off; the opt-out line from
   the brief.

## Variants (draft-gated only)
- **Project-led:** names their project and asks whether it's live.
- **Lacking-led:** names the shortfall of current options (Lacking tier) and asks whether they've hit it.
Write both for email **and** LinkedIn DM. That's 4 drafts.

## Champion mode differences
- Write to the champion's **day-to-day pain of the project**, not budget or ROI.
- The question still tests the project ("is ___ something you're dealing with right now?").
- Add a **Champion kit** section to the dossier:
  - **Forwardable internal pitch:** one paragraph the champion could send their decision maker, written
    in the champion's voice, about the project (not a product brochure).
  - **The decision maker's likely objections**, each with a one-line answer.
  - **The question to ask the champion:** "Who else would need to sign off on something like this?"
  - The path-to-buyer status from the dossier, and what's still unknown.

## Complete the information pack
Make sure the dossier has: discovery questions for a call (5–7, about the project, its urgency,
alternatives tried, and who decides); likely objections with answers; and the drafts. Set
`status: drafted`.

## After drafting
1. Update `runs/<date>-<offer>.md`.
2. In chat: show the top prospect's drafts in full and list the rest by dossier path.
3. Offer, and run only after the user agrees:
   - **CRM sync**, per `workspace-and-tools.md` (show the plan, wait for approval, notes and tags only).
   - **CSV export** if there's no CRM.
   - **Email drafts** saved to the connected mail tool, **as drafts only**. Ask which variant to use per
     prospect, and record it in `variant_sent` when the user confirms they've sent it.
4. Remind the user: when replies arrive, run **pull-learn**.
