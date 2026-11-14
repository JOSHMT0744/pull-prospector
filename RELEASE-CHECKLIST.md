# Release checklist (~10 minutes)

Run before tagging any release. This is a smoke test for breakage, not a quality score.

Use a scratch workspace and an offer brief you know well.

- [ ] **Known-good prospect:** someone with a clearly public, recent project + deadline.
      → `pull-find` gates them `draft`, with Evidenced P and U, and working, dated source URLs.
- [ ] **Known-bad prospect:** a relevant-looking company with no sign of the project.
      → gated `dq` with a sensible one-line reason. `pull-draft` refuses to draft for them.
- [ ] **Draft rules:** the good prospect's drafts are under 90 words (DM under 60), open with their project,
      cite one signal, mention the product in one line at most, end with a yes/no question that tests the
      project, and include the opt-out line. There are 4 variants.
- [ ] **Champion mode:** rerun the good prospect in champion mode → path-to-buyer check present, plus a
      champion kit (forwardable pitch, objections, sign-off question).
- [ ] **CRM / CSV:** the CRM write shows a plan and waits for approval (or the CSV export writes correctly
      when no CRM is connected). Nothing is overwritten.
- [ ] **Nothing sent:** no message was sent at any point.
- [ ] `scripts/sync-shared.sh` run; `references/` folders match `shared/`.
- [ ] Version bumped in `.claude-plugin/plugin.json`; `CHANGELOG.md` updated; zips rebuilt.
