import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/sop_provider.dart';
import '../models/sop_models.dart';
import '../theme/app_theme.dart';

class RiskRegisterScreen extends StatefulWidget {
  const RiskRegisterScreen({super.key});

  @override
  State<RiskRegisterScreen> createState() => _RiskRegisterScreenState();
}

class _RiskRegisterScreenState extends State<RiskRegisterScreen> {
  @override
  void initState() {
    super.initState();
    // Seed some initial risk entries if empty
    final provider = context.read<SopProvider>();
    if (provider.riskEntries.isEmpty) {
      provider.addRiskEntry(RiskEntry(
        id: 'risk-1',
        title: 'Board exam data mismatch',
        category: 'Compliance',
        owner: 'Admin / Exam Cell',
        severity: 'Critical',
        dueDate: '2025-10-15',
        mitigation: 'Monthly data verification with parent acknowledgement',
        status: 'Open',
      ));
      provider.addRiskEntry(RiskEntry(
        id: 'risk-2',
        title: 'Practical file completion delay',
        category: 'Academic',
        owner: 'Teacher',
        severity: 'High',
        dueDate: '2025-12-01',
        mitigation: 'Weekly tracking and parent notification',
        status: 'Watching',
      ));
      provider.addRiskEntry(RiskEntry(
        id: 'risk-3',
        title: 'Consent form collection incomplete',
        category: 'Governance',
        owner: 'Consent Coordinator',
        severity: 'Medium',
        dueDate: '2025-08-30',
        mitigation: 'Automated reminders and follow-up calls',
        status: 'Open',
      ));
      provider.addRiskEntry(RiskEntry(
        id: 'risk-4',
        title: 'IT system downtime during exam season',
        category: 'Technology',
        owner: 'IT Admin',
        severity: 'High',
        dueDate: '2025-11-01',
        mitigation: 'Backup systems and offline readiness plan',
        status: 'Escalated',
      ));
      provider.addRiskEntry(RiskEntry(
        id: 'risk-5',
        title: 'Teacher shortage for specialized subjects',
        category: 'Operations',
        owner: 'Principal',
        severity: 'Low',
        dueDate: '2025-09-15',
        mitigation: 'Cross-training and guest faculty arrangement',
        status: 'Closed',
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SopProvider>();
    final risks = provider.riskEntries;

    final openCount = risks.where((r) => r.status == 'Open').length;
    final watchingCount = risks.where((r) => r.status == 'Watching').length;
    final escalatedCount = risks.where((r) => r.status == 'Escalated').length;
    final closedCount = risks.where((r) => r.status == 'Closed').length;

    return Scaffold(
      appBar: AppBar(title: const Text('Risk Register')),
      body: Column(
        children: [
          // Summary cards
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _SummaryChip(label: 'Total', value: '${risks.length}', color: AppTheme.primaryBlue),
                const SizedBox(width: 6),
                _SummaryChip(label: 'Open', value: '$openCount', color: AppTheme.dangerRed),
                const SizedBox(width: 6),
                _SummaryChip(label: 'Watching', value: '$watchingCount', color: AppTheme.accentAmber),
                const SizedBox(width: 6),
                _SummaryChip(label: 'Escalated', value: '$escalatedCount', color: AppTheme.warningOrange),
                const SizedBox(width: 6),
                _SummaryChip(label: 'Closed', value: '$closedCount', color: AppTheme.successGreen),
              ],
            ),
          ),
          const Divider(height: 1),

          // Risk list
          Expanded(
            child: risks.isEmpty
                ? const Center(child: Text('No risk entries'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    itemCount: risks.length,
                    itemBuilder: (context, index) {
                      final risk = risks[index];
                      return _RiskCard(
                        risk: risk,
                        onEdit: () => _showEditDialog(context, risk),
                        onDelete: () => _confirmDelete(context, risk),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context),
        tooltip: 'Add Risk',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    _showRiskFormDialog(context, null);
  }

  void _showEditDialog(BuildContext context, RiskEntry risk) {
    _showRiskFormDialog(context, risk);
  }

  void _showRiskFormDialog(BuildContext context, RiskEntry? existing) {
    final isEdit = existing != null;
    final titleCtl = TextEditingController(text: existing?.title ?? '');
    final categoryCtl = TextEditingController(text: existing?.category ?? '');
    final ownerCtl = TextEditingController(text: existing?.owner ?? '');
    final dueDateCtl = TextEditingController(text: existing?.dueDate ?? '');
    final mitigationCtl = TextEditingController(text: existing?.mitigation ?? '');
    String severity = existing?.severity ?? 'Medium';
    String status = existing?.status ?? 'Open';

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setDialogState) {
            return AlertDialog(
              title: Text(isEdit ? 'Edit Risk' : 'Add Risk'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleCtl,
                      decoration: const InputDecoration(labelText: 'Title', isDense: true),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: categoryCtl,
                      decoration: const InputDecoration(labelText: 'Category', isDense: true),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: ownerCtl,
                      decoration: const InputDecoration(labelText: 'Owner', isDense: true),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: severity,
                      decoration: const InputDecoration(labelText: 'Severity', isDense: true),
                      items: ['Low', 'Medium', 'High', 'Critical']
                          .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                          .toList(),
                      onChanged: (v) => setDialogState(() => severity = v!),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: dueDateCtl,
                      decoration: const InputDecoration(labelText: 'Due Date', isDense: true, hintText: 'YYYY-MM-DD'),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: status,
                      decoration: const InputDecoration(labelText: 'Status', isDense: true),
                      items: ['Open', 'Watching', 'Escalated', 'Closed']
                          .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                          .toList(),
                      onChanged: (v) => setDialogState(() => status = v!),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: mitigationCtl,
                      decoration: const InputDecoration(labelText: 'Mitigation', isDense: true),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () {
                    final provider = context.read<SopProvider>();
                    if (isEdit) {
                      provider.updateRiskEntry(existing.id, RiskEntry(
                        id: existing.id,
                        title: titleCtl.text,
                        category: categoryCtl.text,
                        owner: ownerCtl.text,
                        severity: severity,
                        dueDate: dueDateCtl.text,
                        mitigation: mitigationCtl.text,
                        status: status,
                      ));
                    } else {
                      provider.addRiskEntry(RiskEntry(
                        id: 'risk-${DateTime.now().millisecondsSinceEpoch}',
                        title: titleCtl.text,
                        category: categoryCtl.text,
                        owner: ownerCtl.text,
                        severity: severity,
                        dueDate: dueDateCtl.text,
                        mitigation: mitigationCtl.text,
                        status: status,
                      ));
                    }
                    Navigator.of(ctx).pop();
                  },
                  child: Text(isEdit ? 'Update' : 'Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _confirmDelete(BuildContext context, RiskEntry risk) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Risk?'),
        content: Text('Are you sure you want to delete "${risk.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              context.read<SopProvider>().deleteRiskEntry(risk.id);
              Navigator.of(ctx).pop();
            },
            style: FilledButton.styleFrom(backgroundColor: AppTheme.dangerRed),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

// ─── Sub-widgets ─────────────────────────────────────────────────────────────

class _SummaryChip extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _SummaryChip({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: color)),
            Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color)),
          ],
        ),
      ),
    );
  }
}

class _RiskCard extends StatelessWidget {
  final RiskEntry risk;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _RiskCard({required this.risk, required this.onEdit, required this.onDelete});

  Color _severityColor(String severity) {
    switch (severity) {
      case 'Low':
        return AppTheme.successGreen;
      case 'Medium':
        return AppTheme.accentAmber;
      case 'High':
        return AppTheme.warningOrange;
      case 'Critical':
        return AppTheme.dangerRed;
      default:
        return Colors.grey;
    }
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Open':
        return AppTheme.dangerRed;
      case 'Watching':
        return AppTheme.accentAmber;
      case 'Escalated':
        return AppTheme.warningOrange;
      case 'Closed':
        return AppTheme.successGreen;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sevColor = _severityColor(risk.severity);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      child: InkWell(
        onTap: onEdit,
        onLongPress: onDelete,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      risk.title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: sevColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      risk.severity,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: sevColor,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.category_outlined, size: 14, color: isDark ? Colors.white54 : Colors.black45),
                  const SizedBox(width: 4),
                  Text(risk.category, style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(width: 12),
                  Icon(Icons.person_outline, size: 14, color: isDark ? Colors.white54 : Colors.black45),
                  const SizedBox(width: 4),
                  Text(risk.owner, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined, size: 14, color: isDark ? Colors.white54 : Colors.black45),
                  const SizedBox(width: 4),
                  Text(risk.dueDate, style: Theme.of(context).textTheme.bodySmall),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    decoration: BoxDecoration(
                      color: _statusColor(risk.status).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      risk.status,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: _statusColor(risk.status),
                          ),
                    ),
                  ),
                ],
              ),
              if (risk.mitigation.isNotEmpty) ...[
                const SizedBox(height: 6),
                Text(
                  risk.mitigation,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDark ? Colors.white54 : Colors.black54,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
