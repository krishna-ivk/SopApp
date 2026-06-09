import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/sop_provider.dart';
import '../models/sop_models.dart';
import '../theme/app_theme.dart';
import '../widgets/progress_indicator_bar.dart';

class SopDetailScreen extends StatelessWidget {
  final String sopId;

  const SopDetailScreen({super.key, required this.sopId});

  @override
  Widget build(BuildContext context) {
    final sop = context.read<SopProvider>().getSopById(sopId);
    if (sop == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Not Found')),
        body: const Center(child: Text('SOP not found')),
      );
    }
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_mapIcon(sop.icon.name), size: 22),
              const SizedBox(width: 10),
              Flexible(child: Text(sop.title, overflow: TextOverflow.ellipsis)),
            ],
          ),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: const [
              Tab(text: 'Overview'),
              Tab(text: 'Calendar'),
              Tab(text: 'Procedures'),
              Tab(text: 'Governance'),
              Tab(text: 'Checklist'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _OverviewTab(sop: sop),
            _CalendarTab(sop: sop),
            _ProceduresTab(sop: sop),
            _GovernanceTab(sop: sop),
            _ChecklistTab(sopId: sopId),
          ],
        ),
      ),
    );
  }

  IconData _mapIcon(String name) {
    const map = {
      'school': Icons.school,
      'family_restroom': Icons.family_restroom,
      'person': Icons.person,
      'science': Icons.science,
      'admin_panel_settings': Icons.admin_panel_settings,
      'folder_shared': Icons.folder_shared,
      'how_to_reg': Icons.how_to_reg,
      'menu_book': Icons.menu_book,
      'account_balance': Icons.account_balance,
      'verified_user': Icons.verified_user,
      'smart_toy': Icons.smart_toy,
      'computer': Icons.computer,
      'gavel': Icons.gavel,
    };
    return map[name] ?? Icons.description;
  }
}

// ─── Overview Tab ────────────────────────────────────────────────────────────

class _OverviewTab extends StatelessWidget {
  final StakeholderSop sop;
  const _OverviewTab({required this.sop});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Purpose
        _SectionCard(
          title: 'Purpose',
          icon: Icons.lightbulb_outline,
          color: AppTheme.accentAmber,
          child: Text(sop.purpose, style: Theme.of(context).textTheme.bodyMedium),
        ),
        const SizedBox(height: 12),

        // Responsibilities
        _SectionCard(
          title: 'Responsibilities',
          icon: Icons.assignment_outlined,
          color: AppTheme.primaryBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: sop.responsibilities.map((r) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Icon(Icons.circle, size: 6, color: AppTheme.primaryBlue),
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text(r, style: Theme.of(context).textTheme.bodyMedium)),
                ],
              ),
            )).toList(),
          ),
        ),
        const SizedBox(height: 12),

        // Success Indicators
        _SectionCard(
          title: 'Success Indicators',
          icon: Icons.check_circle_outline,
          color: AppTheme.successGreen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: sop.successIndicators.map((s) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(Icons.check, size: 16, color: AppTheme.successGreen),
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text(s, style: Theme.of(context).textTheme.bodyMedium)),
                ],
              ),
            )).toList(),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

// ─── Calendar Tab ────────────────────────────────────────────────────────────

class _CalendarTab extends StatelessWidget {
  final StakeholderSop sop;
  const _CalendarTab({required this.sop});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sop.annualCalendar.length,
      itemBuilder: (context, index) {
        final q = sop.annualCalendar[index];
        final isLeft = index % 2 == 0;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline
            SizedBox(
              width: 40,
              child: Column(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryBlue.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Q${index + 1}',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppTheme.primaryBlue,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  if (index < sop.annualCalendar.length - 1)
                    Container(width: 2, height: 40, color: AppTheme.primaryBlue.withOpacity(0.2)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Card
            Expanded(
              child: Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        q.period,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppTheme.primaryBlue,
                            ),
                      ),
                      const SizedBox(height: 6),
                      Text(q.actions, style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ─── Procedures Tab ──────────────────────────────────────────────────────────

class _ProceduresTab extends StatelessWidget {
  final StakeholderSop sop;
  const _ProceduresTab({required this.sop});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: sop.procedures.map((proc) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 16),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            title: Text(
              proc.name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            children: proc.steps.map((step) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryBlue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${step.number}',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AppTheme.primaryBlue,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(child: Text(step.text, style: Theme.of(context).textTheme.bodyMedium)),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}

// ─── Governance Tab ──────────────────────────────────────────────────────────

class _GovernanceTab extends StatelessWidget {
  final StakeholderSop sop;
  const _GovernanceTab({required this.sop});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionCard(
          title: 'Governance Controls',
          icon: Icons.shield_outlined,
          color: AppTheme.primaryBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: sop.governanceControls.map((c) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Icon(Icons.circle, size: 6, color: AppTheme.primaryBlue),
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text(c, style: Theme.of(context).textTheme.bodyMedium)),
                ],
              ),
            )).toList(),
          ),
        ),
        const SizedBox(height: 12),
        _SectionCard(
          title: 'Evidence to Maintain',
          icon: Icons.folder_outlined,
          color: AppTheme.accentAmber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: sop.evidenceToMaintain.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(Icons.attach_file, size: 16, color: AppTheme.accentAmber),
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text(e, style: Theme.of(context).textTheme.bodyMedium)),
                ],
              ),
            )).toList(),
          ),
        ),
        const SizedBox(height: 12),
        _SectionCard(
          title: 'Escalation Path',
          icon: Icons.swap_vert,
          color: AppTheme.dangerRed,
          child: _EscalationChain(path: sop.escalationPath),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

// ─── Checklist Tab ───────────────────────────────────────────────────────────

class _ChecklistTab extends StatelessWidget {
  final String sopId;
  const _ChecklistTab({required this.sopId});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SopProvider>();
    final items = provider.getChecklistItems(sopId);
    final progress = provider.getChecklistProgress(sopId);
    final checked = items.where((i) => i.isChecked).length;

    return Column(
      children: [
        // Progress header
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$checked / ${items.length} completed', style: Theme.of(context).textTheme.bodySmall),
                  Text('${(progress * 100).toStringAsFixed(0)}%', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700, color: AppTheme.primaryBlue)),
                ],
              ),
              const SizedBox(height: 6),
              ProgressIndicatorBar(value: progress),
            ],
          ),
        ),
        const Divider(height: 1),
        // Items
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return CheckboxListTile(
                value: item.isChecked,
                title: Text(
                  item.text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        decoration: item.isChecked ? TextDecoration.lineThrough : null,
                        color: item.isChecked ? (Theme.of(context).brightness == Brightness.dark ? Colors.white38 : Colors.black38) : null,
                      ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                dense: true,
                onChanged: (_) => provider.toggleChecklistItem(item.id),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ─── Shared widgets ──────────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: color),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}

class _EscalationChain extends StatelessWidget {
  final String path;
  const _EscalationChain({required this.path});

  @override
  Widget build(BuildContext context) {
    final levels = path.split(' -> ').map((s) => s.trim()).toList();
    return Wrap(
      spacing: 4,
      runSpacing: 6,
      children: levels.asMap().entries.map((entry) {
        final isLast = entry.key == levels.length - 1;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Chip(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              label: Text(entry.value),
              labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppTheme.dangerRed,
                    fontWeight: FontWeight.w600,
                  ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
            ),
            if (!isLast)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Icon(Icons.arrow_forward, size: 14, color: AppTheme.dangerRed.withOpacity(0.5)),
              ),
          ],
        );
      }).toList(),
    );
  }
}
