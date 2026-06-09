class StakeholderSop {
  final String id;
  final String title;
  final String subtitle;
  final String purpose;
  final List<String> responsibilities;
  final List<CalendarQuarter> annualCalendar;
  final List<SopProcedure> procedures;
  final List<String> governanceControls;
  final List<String> evidenceToMaintain;
  final String escalationPath;
  final List<String> successIndicators;
  final IconDataData icon;
  final String colorHex;

  const StakeholderSop({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.purpose,
    required this.responsibilities,
    required this.annualCalendar,
    required this.procedures,
    required this.governanceControls,
    required this.evidenceToMaintain,
    required this.escalationPath,
    required this.successIndicators,
    required this.icon,
    required this.colorHex,
  });
}

class CalendarQuarter {
  final String period;
  final String actions;

  const CalendarQuarter({required this.period, required this.actions});
}

class SopProcedure {
  final String name;
  final List<ProcedureStep> steps;

  const SopProcedure({required this.name, required this.steps});
}

class ProcedureStep {
  final int number;
  final String text;

  const ProcedureStep({required this.number, required this.text});
}

class IconDataData {
  final String name;
  const IconDataData({required this.name});
}

class ChecklistItem {
  final String id;
  final String sopId;
  final String text;
  final bool isChecked;

  const ChecklistItem({
    required this.id,
    required this.sopId,
    required this.text,
    this.isChecked = false,
  });

  ChecklistItem copyWith({bool? isChecked}) => ChecklistItem(
        id: id,
        sopId: sopId,
        text: text,
        isChecked: isChecked ?? this.isChecked,
      );
}

class RiskEntry {
  final String id;
  String title;
  String category;
  String owner;
  String severity;
  String dueDate;
  String mitigation;
  String status;

  RiskEntry({
    required this.id,
    required this.title,
    required this.category,
    required this.owner,
    required this.severity,
    required this.dueDate,
    required this.mitigation,
    required this.status,
  });
}
