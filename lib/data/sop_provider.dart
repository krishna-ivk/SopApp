import 'package:flutter/material.dart';
import '../models/sop_models.dart';
import '../data/sop_data.dart';

class SopProvider extends ChangeNotifier {
  List<ChecklistItem> _checklistItems = [];
  List<RiskEntry> _riskEntries = [];
  String _searchQuery = '';

  List<StakeholderSop> get filteredSops {
    if (_searchQuery.isEmpty) return allSops;
    final q = _searchQuery.toLowerCase();
    return allSops.where((sop) {
      return sop.title.toLowerCase().contains(q) ||
          sop.subtitle.toLowerCase().contains(q) ||
          sop.purpose.toLowerCase().contains(q) ||
          sop.responsibilities.any((r) => r.toLowerCase().contains(q)) ||
          sop.successIndicators.any((s) => s.toLowerCase().contains(q));
    }).toList();
  }

  String get searchQuery => _searchQuery;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  List<ChecklistItem> getChecklistItems(String sopId) {
    if (_checklistItems.isEmpty) {
      _generateChecklistItems();
    }
    return _checklistItems.where((item) => item.sopId == sopId).toList();
  }

  void _generateChecklistItems() {
    final items = <ChecklistItem>[];
    for (final sop in allSops) {
      for (final responsibility in sop.responsibilities) {
        items.add(ChecklistItem(
          id: '${sop.id}_resp_${responsibility.hashCode}',
          sopId: sop.id,
          text: responsibility,
        ));
      }
      for (final evidence in sop.evidenceToMaintain) {
        items.add(ChecklistItem(
          id: '${sop.id}_evd_${evidence.hashCode}',
          sopId: sop.id,
          text: 'Evidence: $evidence',
        ));
      }
    }
    _checklistItems = items;
  }

  void toggleChecklistItem(String itemId) {
    final index = _checklistItems.indexWhere((item) => item.id == itemId);
    if (index != -1) {
      _checklistItems[index] = _checklistItems[index].copyWith(
        isChecked: !_checklistItems[index].isChecked,
      );
      notifyListeners();
    }
  }

  double getChecklistProgress(String sopId) {
    final items = getChecklistItems(sopId);
    if (items.isEmpty) return 0;
    final checked = items.where((item) => item.isChecked).length;
    return checked / items.length;
  }

  List<RiskEntry> get riskEntries => _riskEntries;

  void addRiskEntry(RiskEntry entry) {
    _riskEntries.add(entry);
    notifyListeners();
  }

  void updateRiskEntry(String id, RiskEntry updated) {
    final index = _riskEntries.indexWhere((e) => e.id == id);
    if (index != -1) {
      _riskEntries[index] = updated;
      notifyListeners();
    }
  }

  void deleteRiskEntry(String id) {
    _riskEntries.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  StakeholderSop? getSopById(String id) {
    try {
      return allSops.firstWhere((sop) => sop.id == id);
    } catch (_) {
      return null;
    }
  }
}
