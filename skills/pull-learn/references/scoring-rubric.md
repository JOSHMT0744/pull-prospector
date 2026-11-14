# PULL scoring rubric and gate

Every prospect is scored against **one offer brief** (`offers/<name>.md`). Score the person, using
evidence from both the person and their account (company). Label each piece of evidence with its level:
`person` or `account`.

## Evidence levels (P, U, Looking)

| Level | Code | Rule |
|---|---|---|
| **Evidenced** | `E` | A citable public source shows it directly. Record the URL, the publication date and a one-line paraphrase. For P, the source must be under 12 months old; for U, under 6 months. |
| **Inferred** | `I` | You're reasoning from indirect signals. Write the reasoning in one sentence. |
| **Absent** | `A` | There's no signal, or a signal that contradicts it. |

Never upgrade a level because the story is plausible. If it's unclear, mark it `I`.
A prospect's own reply (via `pull-learn`) counts as Evidenced, with source `reply`.

## Lacking: level + tier

Lacking gets an evidence level (E/I/A) **and** a tier:

| Tier | Name | Meaning |
|---|---|---|
| `L1` | Inconvenient | Alternatives work but are slow, costly or annoying. |
| `L2` | Inadequate | Alternatives fail a requirement the buyer considers critical. |
| `L3` | Can't | Alternatives structurally cannot do it. This is the strongest demand. |

**Fit check:** compare the Lacking reason with the offer brief's "why alternatives fall short".
If the prospect's shortfall is something the product does **not** fix, set `fit: no`.

## Signal library

| Letter | Look for |
|---|---|
| **P** | Job posts that name the initiative; announced programmes or migrations; public roadmaps; tenders/RFPs; conference talks or posts by the person saying "we're about to…"; a new hire whose stated mandate is the project. |
| **U** | Regulatory or compliance deadlines; funding rounds with a stated use; a new leader with a mandate for their first 90 days; an incident or outage; growth breaking a process; a contract renewal or end-of-life date; a public customer commitment. |
| **Looking** | Publicly asking for recommendations; job posts to "evaluate / select / implement"; review-site or community activity; vendor-event attendance; RFPs; published comparisons. |
| **Lacking** | Complaints about current tools; visible workarounds (spreadsheets, extra headcount to compensate); switching away from a competitor; gaps between their stated needs and what the alternatives offer. |

## The gate

Applied to the **buyer** in buyer mode, and to the **champion** in champion mode.

| Result | Rule | Output |
|---|---|---|
| `draft` | P = E **and** U = E **and** fit ≠ no | Full information pack + drafts |
| `nurture` | P = E **and** U = I **and** fit ≠ no | Information pack + a light check-in draft that asks about timing |
| `dq` | Anything else | One-line reason. No draft. |

Inside `draft` and `nurture`: if Looking or Lacking are only `I`, the draft **asks** about them rather than
asserting them.

**Ranking** within a run: gate (`draft` > `nurture` > `dq`), then Lacking tier (L3 > L2 > L1), then Looking
(E > I > A).

## Champion mode: path-to-buyer check (flag, never blocks)

| Field | Values |
|---|---|
| `buyer_named` | yes / no (plus name and role if yes) |
| `project_matters_to_buyer` | E / I / A — is there evidence the decision maker cares about this project? |

Show this check prominently in the information pack. It doesn't block a draft, because champion
conversations are often how you find out who the buyer is.

## Scan pass (cheap, used by `pull-find`)

Score only P and U, with one line of evidence each and no deep reading. Candidates with P = A are dropped.
Rank, then deep-research the top N (default 5).
