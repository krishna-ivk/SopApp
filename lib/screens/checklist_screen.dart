import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/sop_provider.dart';
import '../data/sop_data.dart';
import '../models/sop_models.dart';
import '../theme/app_theme.dart';
import '../widgets/progress_indicator_bar.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  String? _selectedSopFilter;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SopProvider>();
    final allItems = <ChecklistItem>[];
    for (final sop in allSops) {
      allItems.addAll(provider.getChecklistItems(sop.id));
    }

    final filteredItems = _selectedSopFilter == null
        ? allItems
        : allItems.where((i) => i.sopId == _selectedSopFilter).toList();

    final total = filteredItems.length;
    final completed = filteredItems.where((i) => i.isChecked).length;
    final progress = total == 0 ? 0.0 : completed / total;

    return Scaffold(
      appBar: AppBar(title: const Text('Checklist Tracker')),
      body: Column(
        children: [
          // Progress summary
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _selectedSopFilter == null ? 'Overall Progress' : 'Filtered Progress',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _StatChip(label: 'Total', value: '$total', color: AppTheme.primaryBlue),
                        const SizedBox(width: 8),
                        _StatChip(label: 'Done', value: '$completed', color: AppTheme.successGreen),
                        const SizedBox(width: 8),
                        _StatChip(label: 'Pending', value: '${total - completed}', color: AppTheme.accentAmber),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ProgressIndicatorBar(value: progress, height: 10),
                    const SizedBox(height: 4),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${(progress * 100).toStringAsFixed(0)}%',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppTheme.primaryBlue,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // SOP filter chips
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: FilterChip(
                    label: const Text('All'),
                    selected: _selectedSopFilter == null,
                    onSelected: (_) => setState(() => _selectedSopFilter = null),
                  ),
                ),
                ...allSops.map((sop) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: FilterChip(
                      label: Text(sop.title),
                      selected: _selectedSopFilter == sop.id,
                      onSelected: (_) => setState(() => _selectedSopFilter = sop.id),
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Divider(height: 1),

          // Checklist items
          Expanded(
            child: _FilteredChecklistList(items: filteredItems),
          ),
        ],
      ),
    );
  }
}

class _FilteredChecklistList extends StatelessWidget {
  final List<ChecklistItem> items;

  const _FilteredChecklistList({required this.items});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<SopProvider>();

    if (items.isEmpty) {
      return const Center(child: Text('No checklist items'));
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final sop = allSops.where((s) => s.id == item.sopId).firstOrNull;
        return CheckboxListTile(
          value: item.isChecked,
          title: Text(
            item.text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  decoration: item.isChecked ? TextDecoration.lineThrough : null,
                  color: item.isChecked ? (Theme.of(context).brightness == Brightness.dark ? Colors.white38 : Colors.black38) : null,
                ),
          ),
          subtitle: sop != null
              ? Text(sop.title, style: Theme.of(context).textTheme.labelSmall)
              : null,
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
          onChanged: (_) => provider.toggleChecklistItem(item.id),
        );
      },
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatChip({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700, color: color)),
          const SizedBox(width: 4),
          Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color)),
        ],
      ),
    );
  }
}
