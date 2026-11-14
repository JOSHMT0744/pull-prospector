---
name: pull-prospector
description: End-to-end PULL-framework prospecting (Rob Snyder) - define the offer, find buyers or champions who already have the project, score their PULL, and draft outreach plus information packs. Use when someone wants to find ideal customers, build an ICP, research prospects, or write cold outreach, or names PULL / pull-prospector.
---

# pull-prospector (orchestrator)

Runs the full pipeline by calling the stage skills in order. Each stage can also be run on its own.

**Read first:** `references/pull-primer.md`, `references/guardrails.md`, `references/workspace-and-tools.md`.

## Pipeline

```
pull-offer  →  pull-find  →  pull-draft  →  (user sends)  →  pull-learn
 offer brief    dossiers       drafts +                        replies → scores,
                + gate         info packs                      rollups, brief edits
```

## Steps

1. **Tool check.** Detect web search, browser/fetch, CRM and email-draft tools as described in
   `workspace-and-tools.md`. Tell the user in one line what's available. If there's no web access,
   explain degraded mode before going further.
2. **Workspace.** Locate or create `pull-workspace/`. List the existing offers and prospects.
3. **Offer brief.**
   - No brief exists → run **pull-offer**.
   - One or more exist → ask which one to use (or whether to make a new one).
4. **Mode.** Use the brief's `default_mode` (buyer or champion) unless the user overrides it for this run.
   Confirm it in one line.
5. **Find.** Run **pull-find**: discovery, a user-supplied list, or both. Defaults: scan 20–30 candidates,
   deep-research the top 5 (the user can change N).
6. **Draft.** Run **pull-draft** on every dossier gated `draft` or `nurture`.
7. **Summarise.** Write `runs/<date>-<offer>.md` (table format in `workspace-and-tools.md`). In chat, give:
   counts by gate, the top 3 prospects with one line each, and the next step.
8. **Offer CRM sync** (if a CRM is connected) or the CSV export. Offer email drafts if a mail tool exists.
   Ask before writing.
9. **Remind** the user to run **pull-learn** once replies come in. Replies are how the hypothesis gets
   tested.

## Running a single stage

| User says | Run |
|---|---|
| "set up / refine my offer", "who do we sell to" | pull-offer |
| "find prospects", "qualify this list", "research <person/company>" | pull-find (needs an offer brief) |
| "write outreach for <prospect>", "draft messages" | pull-draft (needs a dossier; if missing, run pull-find on that one prospect first) |
| "here are the replies", "how is outreach going", "what's working" | pull-learn |

## Non-negotiables
- Never send messages (see `guardrails.md`).
- Never write a draft for a prospect gated `dq`, even if asked. Explain the reason and offer to research
  further instead.
