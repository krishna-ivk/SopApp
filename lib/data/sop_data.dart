import '../models/sop_models.dart';

final List<StakeholderSop> allSops = [
  // SOP 1 - Student
  StakeholderSop(
    id: 'sop-1',
    title: 'Student',
    subtitle: 'SOP 1',
    purpose:
        'Guides every student through the CBSE academic year in a calm, structured and evidence-driven manner.',
    responsibilities: [
      'Follow school calendar and academic schedule.',
      'Complete classwork, homework, and projects on time.',
      'Check pending tasks daily and act on reminders.',
      'Prepare for tests, unit exams, pre-boards, and board exams.',
      'Participate in enrichment and co-curricular activities.',
      'Report illness, absence, or conflict immediately through parent or class teacher.',
      'Maintain exam discipline and follow all board exam protocols.',
    ],
    annualCalendar: [
      CalendarQuarter(
        period: 'April – June',
        actions:
            'Understand syllabus, join bridge support if assigned, start portfolio and practical record.',
      ),
      CalendarQuarter(
        period: 'July – September',
        actions:
            'First revision cycle, participate in activities, confirm board registration details.',
      ),
      CalendarQuarter(
        period: 'October – December',
        actions:
            'Submit projects and practicals, consolidate syllabus, begin pre-board preparation.',
      ),
      CalendarQuarter(
        period: 'January – February',
        actions:
            'Attend practical assessments, verify admit card details, follow exam ethics.',
      ),
      CalendarQuarter(
        period: 'February – April',
        actions: 'Attend board exams per CBSE date sheet.',
      ),
      CalendarQuarter(
        period: 'May – June',
        actions:
            'Review results, update learning passport, plan next academic year.',
      ),
    ],
    procedures: [
      SopProcedure(
        name: 'Daily Procedure',
        steps: [
          ProcedureStep(number: 26, text: 'Check timetable and pending task list.'),
          ProcedureStep(number: 27, text: 'Attend all scheduled classes.'),
          ProcedureStep(number: 28, text: 'Complete assigned practice and homework.'),
          ProcedureStep(number: 29, text: 'Review teacher feedback and remediate errors.'),
          ProcedureStep(number: 30, text: 'Inform class teacher or parent if blocked.'),
        ],
      ),
      SopProcedure(
        name: 'Practical / Project / Internal Assessment Procedure',
        steps: [
          ProcedureStep(number: 31, text: 'Check practical date and batch allocation.'),
          ProcedureStep(number: 32, text: 'Complete practical files and project documentation.'),
          ProcedureStep(number: 33, text: 'Carry required materials, ID, and apron if needed.'),
          ProcedureStep(number: 34, text: 'Follow examiner instructions and safety rules.'),
          ProcedureStep(number: 35, text: 'Inform school immediately if absent or ill.'),
          ProcedureStep(number: 36, text: 'Do not pressure examiners for marks.'),
        ],
      ),
      SopProcedure(
        name: 'Board Exam Readiness Procedure',
        steps: [
          ProcedureStep(number: 37, text: 'Create and follow a revision plan.'),
          ProcedureStep(number: 38, text: 'Practice official CBSE sample papers under timed conditions.'),
          ProcedureStep(number: 39, text: 'Review mistakes and seek remediation.'),
          ProcedureStep(number: 40, text: 'Prepare admit card, valid ID, and permitted materials.'),
          ProcedureStep(number: 41, text: 'Avoid prohibited material, devices, or behaviour.'),
          ProcedureStep(number: 42, text: 'Report any issue through parent or school, not on social media.'),
        ],
      ),
    ],
    governanceControls: [
      'Acknowledge critical instructions from school and CBSE.',
      'Use official channels for communication and escalation.',
      'Escalate data mismatches before the correction deadline.',
      'Do not include confidential exam material in portfolio or public posts.',
    ],
    evidenceToMaintain: [
      'Assignment completion status.',
      'Practical record and project status.',
      'Sample paper attempt records.',
      'Remediation completion proof.',
      'Activity and enrichment certificates.',
      'Attendance and leave notes.',
      'Parent acknowledgements.',
    ],
    escalationPath: 'Student -> Parent -> Class Teacher -> Admin / Exam Cell -> Principal',
    successIndicators: [
      'No critical task overdue.',
      'Practical files ready before assessment window.',
      'Sample papers attempted and reviewed.',
      'No unresolved data mismatch.',
      'Stress or learning difficulty identified early.',
    ],
    icon: IconDataData(name: 'school'),
    colorHex: '#1565C0',
  ),

  // SOP 2 - Parent
  StakeholderSop(
    id: 'sop-2',
    title: 'Parent',
    subtitle: 'SOP 2',
    purpose:
        'How parents participate in student academic, emotional, compliance and exam-readiness journey without pressure.',
    responsibilities: [
      'Verify student details for accuracy and completeness.',
      'Acknowledge schedules, circulars, and consent requests.',
      'Support attendance, routine, and sleep discipline.',
      'Attend PTMs and parent orientation sessions.',
      'Give or manage consent for activities and data use.',
      'Avoid pressuring the child for marks or ranks.',
      'Report issues, concerns, or conflicts early through official channels.',
    ],
    annualCalendar: [
      CalendarQuarter(
        period: 'April – June',
        actions:
            'Attend orientation, verify student profile and consent forms.',
      ),
      CalendarQuarter(
        period: 'July – September',
        actions:
            'Review academic progress, confirm registration data accuracy, attend PTM.',
      ),
      CalendarQuarter(
        period: 'October – December',
        actions:
            'Track practical and project completion, support revision at home.',
      ),
      CalendarQuarter(
        period: 'January – February',
        actions:
            'Confirm practical dates, monitor health and stress, check admit card.',
      ),
      CalendarQuarter(
        period: 'February – April',
        actions:
            'Support exam logistics, avoid rumours and panic.',
      ),
      CalendarQuarter(
        period: 'May – June',
        actions:
            'Review results calmly, preserve documents for future use.',
      ),
    ],
    procedures: [
      SopProcedure(
        name: 'Weekly Parent Procedure',
        steps: [
          ProcedureStep(number: 43, text: 'Check pending actions in school app or communication.'),
          ProcedureStep(number: 44, text: 'Ask what the child learned, not only marks scored.'),
          ProcedureStep(number: 45, text: 'Review assignments and teacher feedback.'),
          ProcedureStep(number: 46, text: 'Ensure sleep, nutrition, and device discipline.'),
          ProcedureStep(number: 47, text: 'Raise concerns through class teacher or official channel.'),
        ],
      ),
      SopProcedure(
        name: 'Practical / Internal Assessment Support',
        steps: [
          ProcedureStep(number: 48, text: 'Check practical schedule and batch from school communication.'),
          ProcedureStep(number: 49, text: 'Ensure practical file and project completion.'),
          ProcedureStep(number: 50, text: 'Arrange travel and logistics for exam day.'),
          ProcedureStep(number: 51, text: 'Inform school of illness and submit medical proof if needed.'),
          ProcedureStep(number: 52, text: 'Understand marks confidentiality and avoid pressuring examiners.'),
          ProcedureStep(number: 53, text: 'Preserve practical assessment records.'),
        ],
      ),
      SopProcedure(
        name: 'Board Exam Support',
        steps: [
          ProcedureStep(number: 54, text: 'Check admit card details and escalate mismatch immediately.'),
          ProcedureStep(number: 55, text: 'Confirm exam centre, travel plan, and timing.'),
          ProcedureStep(number: 56, text: 'Keep admit card, ID, and permitted materials ready.'),
          ProcedureStep(number: 57, text: 'Avoid paper leak panic; rely only on official communication.'),
          ProcedureStep(number: 58, text: 'Contact school for any issue, not social media or rumours.'),
        ],
      ),
    ],
    governanceControls: [
      'Acknowledgement required for data verification, consent, and exam communication.',
      'Use official escalation path; avoid informal complaints.',
      'Consent can be granted, limited, or withdrawn with notice.',
      'Feedback and concerns should be logged and tracked.',
    ],
    evidenceToMaintain: [
      'Data verification acknowledgement.',
      'Consent records and withdrawal notices.',
      'Medical certificates and leave records.',
      'Fee receipts.',
      'Activity approvals.',
      'PTM notes and circulars.',
      'Admit card copy.',
      'Result documents.',
    ],
    escalationPath: 'Parent -> Class Teacher -> Admin / Exam Cell -> Principal',
    successIndicators: [
      'All acknowledgements submitted before deadlines.',
      'Student reaches exams on time with correct documents.',
      'Calm and documented communication maintained.',
      'Emotional stress identified early and addressed.',
      'Supports learning without replacing the teacher.',
    ],
    icon: IconDataData(name: 'family_restroom'),
    colorHex: '#2E7D32',
  ),

  // SOP 3 - Teacher
  StakeholderSop(
    id: 'sop-3',
    title: 'Teacher',
    subtitle: 'SOP 3',
    purpose:
        'How subject and class teachers convert curriculum into learning, evidence, intervention and readiness.',
    responsibilities: [
      'Prepare annual teaching plans aligned to CBSE curriculum.',
      'Teach using competency-based education (CBE) approaches.',
      'Conduct fair and transparent assessments.',
      'Identify weak learners and design remediation.',
      'Prepare students for sample papers and practicals.',
      'Maintain evidence of teaching, assessment, and communication.',
      'Report misconduct, safety issues, or policy violations.',
    ],
    annualCalendar: [
      CalendarQuarter(
        period: 'March – April',
        actions:
            'Read new CBSE curriculum, prepare annual teaching plan.',
      ),
      CalendarQuarter(
        period: 'May – June',
        actions:
            'Begin foundational units, identify learning gaps, start remediation.',
      ),
      CalendarQuarter(
        period: 'July – September',
        actions:
            'Conduct unit tests, integrate sample paper practice, continue remediation.',
      ),
      CalendarQuarter(
        period: 'October – December',
        actions:
            'Complete syllabus, conduct revision and pre-boards, review practical files.',
      ),
      CalendarQuarter(
        period: 'January – February',
        actions:
            'Support practical assessments, conduct final revision.',
      ),
      CalendarQuarter(
        period: 'February – April',
        actions:
            'Provide exam support, perform evaluation duty if assigned.',
      ),
    ],
    procedures: [
      SopProcedure(
        name: 'Lesson-Level Procedure',
        steps: [
          ProcedureStep(number: 59, text: 'State learning outcome at the start of the lesson.'),
          ProcedureStep(number: 60, text: 'Teach concept using CBE methods and examples.'),
          ProcedureStep(number: 61, text: 'Assign practice and check understanding.'),
          ProcedureStep(number: 62, text: 'Identify misconceptions and address them.'),
          ProcedureStep(number: 63, text: 'Remediate weak learners before moving ahead.'),
        ],
      ),
      SopProcedure(
        name: 'Assessment Procedure',
        steps: [
          ProcedureStep(number: 64, text: 'Define assessment scope, marks, and rubric.'),
          ProcedureStep(number: 65, text: 'Inform students well in advance.'),
          ProcedureStep(number: 66, text: 'Evaluate fairly and consistently.'),
          ProcedureStep(number: 67, text: 'Provide specific, actionable feedback.'),
          ProcedureStep(number: 68, text: 'Identify students needing support and plan intervention.'),
        ],
      ),
      SopProcedure(
        name: 'Sample Paper Procedure',
        steps: [
          ProcedureStep(number: 69, text: 'Read official CBSE sample paper thoroughly.'),
          ProcedureStep(number: 70, text: 'Map question types to curriculum units.'),
          ProcedureStep(number: 71, text: 'Conduct timed practice in class or as assignment.'),
          ProcedureStep(number: 72, text: 'Review errors and re-teach weak areas.'),
          ProcedureStep(number: 73, text: 'Use sample paper insights for learning design, not rote drilling.'),
        ],
      ),
      SopProcedure(
        name: 'Parent Communication Procedure',
        steps: [
          ProcedureStep(number: 74, text: 'Explain learning progress, pending tasks, and support needed.'),
          ProcedureStep(number: 75, text: 'Avoid comparison, blame, or leak of confidential data.'),
          ProcedureStep(number: 76, text: 'Document sensitive communication and share with coordinator if needed.'),
        ],
      ),
    ],
    governanceControls: [
      'Accountable for evidence-backed progress of every student.',
      'High-risk student cases must be visible in weekly review.',
      'Maker-checker process for internal assessment marks.',
      'AI-generated summaries must be reviewed before use.',
    ],
    evidenceToMaintain: [
      'Annual teaching plan.',
      'Lesson completion log.',
      'Assessment records and rubrics.',
      'Remediation records.',
      'Parent communication notes.',
      'Practical and project file status.',
      'At-risk student list.',
      'Sample paper analysis.',
    ],
    escalationPath: 'Teacher -> Class Teacher / Coordinator -> Admin / Exam Cell -> Principal',
    successIndicators: [
      'Syllabus completed with adequate revision time.',
      'Weak learners identified early and supported.',
      'Specific, documented parent communication.',
      'Practical records ready before assessment window.',
      'Sample papers used to support understanding, not rote memorisation.',
    ],
    icon: IconDataData(name: 'person'),
    colorHex: '#6A1B9A',
  ),

  // SOP 4 - Specialized Teacher / Lab Teacher
  StakeholderSop(
    id: 'sop-4',
    title: 'Specialized Teacher / Lab Teacher',
    subtitle: 'SOP 4',
    purpose:
        'Operating role for hands-on learning, project quality, safety and assessment evidence.',
    responsibilities: [
      'Maintain lab, equipment, and consumables inventory.',
      'Conduct demonstrations and guided practicals.',
      'Verify practical records and project quality.',
      'Prepare batch plans and schedules for assessments.',
      'Capture evidence and maintain incident logs.',
      'Coordinate with subject teacher and admin for readiness.',
    ],
    annualCalendar: [
      CalendarQuarter(
        period: 'April – June',
        actions:
            'Inspect lab inventory, map practicals to syllabus, conduct safety orientation.',
      ),
      CalendarQuarter(
        period: 'July – September',
        actions:
            'Conduct guided practicals, support science competitions and activities.',
      ),
      CalendarQuarter(
        period: 'October – December',
        actions:
            'Complete practical syllabus, verify student files, conduct mock practicals.',
      ),
      CalendarQuarter(
        period: 'January – February',
        actions:
            'Support assessment operations and evidence capture.',
      ),
      CalendarQuarter(
        period: 'March – June',
        actions:
            'Archive evidence, repair and replenish equipment, prepare improvement plan.',
      ),
    ],
    procedures: [
      SopProcedure(
        name: 'Lab Readiness Procedure',
        steps: [
          ProcedureStep(number: 77, text: 'Verify lab cleanliness, equipment, consumables, and safety gear.'),
          ProcedureStep(number: 78, text: 'Raise shortage report to admin and principal.'),
          ProcedureStep(number: 79, text: 'Display safety rules and emergency contacts.'),
        ],
      ),
      SopProcedure(
        name: 'Student Practical Readiness',
        steps: [
          ProcedureStep(number: 80, text: 'Check practical file completion for every student.'),
          ProcedureStep(number: 81, text: 'Ensure student understands procedure and safety discipline.'),
          ProcedureStep(number: 82, text: 'Verify safety gear and material readiness.'),
          ProcedureStep(number: 83, text: 'Track missing learners and inform class teacher.'),
        ],
      ),
      SopProcedure(
        name: 'Assessment Day Procedure',
        steps: [
          ProcedureStep(number: 84, text: 'Open lab early and verify environment.'),
          ProcedureStep(number: 85, text: 'Confirm batch list and required materials.'),
          ProcedureStep(number: 86, text: 'Follow CBSE exam protocol and examiner instructions.'),
          ProcedureStep(number: 87, text: 'Capture evidence of assessment where permitted.'),
          ProcedureStep(number: 88, text: 'Secure lab and equipment after assessment.'),
        ],
      ),
    ],
    governanceControls: [
      'Lab readiness must be confirmed before every assessment.',
      'Incident logs required for safety and consumable issues.',
      'Specialized teacher coordinates with subject teacher for marks and records.',
      'Equipment shortage must be escalated before the assessment season.',
    ],
    evidenceToMaintain: [
      'Lab readiness checklist.',
      'Inventory records.',
      'Batch plans and schedules.',
      'Practical attendance.',
      'Incident logs.',
      'Evidence photos where permitted.',
      'Student record verification.',
      'Equipment maintenance log.',
    ],
    escalationPath: 'Specialized Teacher -> Subject Teacher -> Admin / Exam Cell -> Principal',
    successIndicators: [
      'Lab always ready before assessment.',
      'No student does practical without file completion.',
      'All incidents logged and addressed.',
      'Equipment shortages raised in time.',
      'Evidence captured for every practical session.',
    ],
    icon: IconDataData(name: 'science'),
    colorHex: '#00838F',
  ),

  // SOP 5 - Principal / Head of School
  StakeholderSop(
    id: 'sop-5',
    title: 'Principal / Head of School',
    subtitle: 'SOP 5',
    purpose:
        'Principal as accountable authority for CBSE compliance, academic readiness, exam conduct, student welfare, parent engagement, staff deployment, evidence and school quality.',
    responsibilities: [
      'Monitor CBSE circulars and ensure timely action.',
      'Oversee board exam and practical readiness.',
      'Ensure student attendance, welfare, and parent engagement.',
      'Lead SQAAF self-assessment and quality improvement.',
      'Chair governance reviews and assign accountability.',
      'Protect fairness, confidentiality, and ethics in all operations.',
    ],
    annualCalendar: [
      CalendarQuarter(
        period: 'January – February',
        actions:
            'Monitor practicals, marks upload, admit cards, and exam readiness.',
      ),
      CalendarQuarter(
        period: 'February – April',
        actions:
            'Oversee board exam operations, rumour control, and special provisions.',
      ),
      CalendarQuarter(
        period: 'March – April',
        actions:
            'Review curriculum, integrate calendars, initiate SQAAF.',
      ),
      CalendarQuarter(
        period: 'May – June',
        actions:
            'Review results, approve improvement plan, plan next year.',
      ),
      CalendarQuarter(
        period: 'July – September',
        actions:
            'Review LOC and registration, attendance, sample papers, enrichment.',
      ),
      CalendarQuarter(
        period: 'October – December',
        actions:
            'Ensure syllabus closure, pre-boards, practical prep, SQAAF finalization.',
      ),
    ],
    procedures: [
      SopProcedure(
        name: 'Weekly Principal Review',
        steps: [
          ProcedureStep(number: 90, text: 'Review academic completion, board-class risk, attendance, practical readiness, parent escalations, circulars, safety, and IT status.'),
          ProcedureStep(number: 91, text: 'Assign owners and deadlines for every open item.'),
        ],
      ),
      SopProcedure(
        name: 'CBSE Circular Handling',
        steps: [
          ProcedureStep(number: 92, text: 'Classify circular by urgency and domain.'),
          ProcedureStep(number: 93, text: 'Assign owner and deadline.'),
          ProcedureStep(number: 94, text: 'Identify affected classes and students.'),
          ProcedureStep(number: 95, text: 'Approve communication to stakeholders.'),
          ProcedureStep(number: 96, text: 'Track closure and archive with evidence.'),
        ],
      ),
      SopProcedure(
        name: 'Board Exam Governance',
        steps: [
          ProcedureStep(number: 97, text: 'Communicate date sheet and instructions to all stakeholders.'),
          ProcedureStep(number: 98, text: 'Control admit card distribution with verification.'),
          ProcedureStep(number: 99, text: 'Ensure exam ethics and special provisions are in place.'),
          ProcedureStep(number: 100, text: 'Check centre readiness and logistics.'),
          ProcedureStep(number: 101, text: 'Maintain rumour control and crisis communication.'),
        ],
      ),
      SopProcedure(
        name: 'SQAAF Procedure',
        steps: [
          ProcedureStep(number: 102, text: 'Assign domain owners for each SQAAF area.'),
          ProcedureStep(number: 103, text: 'Collect evidence from all departments.'),
          ProcedureStep(number: 104, text: 'Review self-assessment for accuracy.'),
          ProcedureStep(number: 105, text: 'Approve submission before deadline.'),
          ProcedureStep(number: 106, text: 'Download report and convert findings to next-year objectives.'),
        ],
      ),
    ],
    governanceControls: [
      'Principal chairs and delegates but remains accountable.',
      'No CBSE submission without maker-checker-approver.',
      'All major risks recorded in risk register.',
      'Ensure confidential data accessed only by authorized roles.',
    ],
    evidenceToMaintain: [
      'Annual operating calendar.',
      'Circular action register.',
      'Exam readiness certificate.',
      'Practical compliance file.',
      'LOC sign-off.',
      'Parent engagement report.',
      'SQAAF report.',
      'Training records.',
      'Incident log.',
    ],
    escalationPath:
        'Principal -> Management / Governance Council (when policy, legal, safety, resource, or reputation risk exceeds school authority)',
    successIndicators: [
      'No CBSE deadline missed.',
      'No unresolved data or subject mismatch.',
      'Practical marks uploaded correctly and on time.',
      'SQAAF completed before deadline.',
      'Calm and orderly exam operations.',
    ],
    icon: IconDataData(name: 'admin_panel_settings'),
    colorHex: '#C62828',
  ),

  // SOP 6 - Admin / Exam Cell
  StakeholderSop(
    id: 'sop-6',
    title: 'Admin / Exam Cell',
    subtitle: 'SOP 6',
    purpose:
        'Procedural backbone for CBSE data, documents, deadlines, portal actions, marks, admit cards, and archives.',
    responsibilities: [
      'Maintain accurate student master data.',
      'Manage registration, LOC, and subject verification.',
      'Coordinate exam fee workflow.',
      'Manage admit card distribution.',
      'Support practical and internal assessment marks upload.',
      'Maintain portal, circular, and evidence archive.',
    ],
    annualCalendar: [
      CalendarQuarter(
        period: 'April – June',
        actions:
            'Update student records, document deficiency list.',
      ),
      CalendarQuarter(
        period: 'July – September',
        actions:
            'Prepare registration and LOC data, issue verification forms, reconcile subjects.',
      ),
      CalendarQuarter(
        period: 'October – December',
        actions:
            'Close corrections, prepare practical lists, archive documents.',
      ),
      CalendarQuarter(
        period: 'January – February',
        actions:
            'Support marks upload, manage admit card workflow, run helpdesk.',
      ),
      CalendarQuarter(
        period: 'February – April',
        actions:
            'Support board exam operations, manage post-exam circulars.',
      ),
      CalendarQuarter(
        period: 'May – June',
        actions:
            'Prepare result documents, supplementary data, annual archive.',
      ),
    ],
    procedures: [
      SopProcedure(
        name: 'Student Data Verification',
        steps: [
          ProcedureStep(number: 107, text: 'Validate name, DOB, parent names, gender, subjects, photo, and signature.'),
          ProcedureStep(number: 108, text: 'Send verification form to parent and student.'),
          ProcedureStep(number: 109, text: 'Correct errors and obtain principal sign-off.'),
          ProcedureStep(number: 110, text: 'Archive verified data with acknowledgement.'),
        ],
      ),
      SopProcedure(
        name: 'LOC / Registration Procedure',
        steps: [
          ProcedureStep(number: 111, text: 'Read CBSE instructions for the academic year.'),
          ProcedureStep(number: 112, text: 'Create eligibility list and verify subjects.'),
          ProcedureStep(number: 113, text: 'Enter and upload data to CBSE portal.'),
          ProcedureStep(number: 114, text: 'Reconcile with school records.'),
          ProcedureStep(number: 115, text: 'Obtain principal approval.'),
          ProcedureStep(number: 116, text: 'Submit before deadline and archive confirmation.'),
        ],
      ),
      SopProcedure(
        name: 'Practical / Internal Assessment Upload',
        steps: [
          ProcedureStep(number: 117, text: 'Confirm practical dates and student lists.'),
          ProcedureStep(number: 118, text: 'Verify max marks and subject mapping.'),
          ProcedureStep(number: 119, text: 'Upload carefully to CBSE portal.'),
          ProcedureStep(number: 120, text: 'No correction permitted after final upload; verify before locking.'),
          ProcedureStep(number: 121, text: 'Archive upload confirmation.'),
        ],
      ),
      SopProcedure(
        name: 'Admit Card Procedure',
        steps: [
          ProcedureStep(number: 122, text: 'Download admit cards when portal opens.'),
          ProcedureStep(number: 123, text: 'Verify details against master data.'),
          ProcedureStep(number: 124, text: 'Escalate mismatch immediately.'),
          ProcedureStep(number: 125, text: 'Get principal authorization for distribution.'),
          ProcedureStep(number: 126, text: 'Issue to student with acknowledgement.'),
        ],
      ),
    ],
    governanceControls: [
      'Maker-checker-approver for all critical submissions.',
      'Portal actions recorded with timestamp, user, and evidence.',
      'Data corrections after lock require principal review.',
      'No informal alteration requests entertained.',
    ],
    evidenceToMaintain: [
      'Circular register.',
      'Student master data.',
      'Parent acknowledgements.',
      'LOC final copy.',
      'Correction logs.',
      'Fee and payment records.',
      'Admit card issue register.',
      'Marks upload confirmations.',
    ],
    escalationPath: 'Admin Executive -> Exam Cell In-charge -> Vice Principal / Coordinator -> Principal',
    successIndicators: [
      'All records verified before submission.',
      'Admit cards issued with acknowledgement.',
      'Practical upload error-free.',
      'Every action has evidence.',
      'Parents informed before deadlines.',
    ],
    icon: IconDataData(name: 'folder_shared'),
    colorHex: '#EF6C00',
  ),

  // SOP 7 - Admissions
  StakeholderSop(
    id: 'sop-7',
    title: 'Admissions',
    subtitle: 'SOP 7',
    purpose:
        'First compliance and learning-readiness checkpoint, not only enquiry or fee process.',
    responsibilities: [
      'Verify eligibility per CBSE norms.',
      'Collect and verify all required documents.',
      'Map subjects accurately.',
      'Arrange bridge support for gaps.',
      'Ensure data accuracy for registration.',
      'Coordinate with admin and exam cell.',
    ],
    annualCalendar: [
      CalendarQuarter(
        period: 'Ongoing',
        actions:
            'Admissions cycle with peak periods before academic year and mid-year transfers.',
      ),
    ],
    procedures: [
      SopProcedure(
        name: 'Enquiry Handling',
        steps: [
          ProcedureStep(number: 127, text: 'Record enquiry with contact details and grade sought.'),
          ProcedureStep(number: 128, text: 'Share eligibility criteria and document checklist.'),
          ProcedureStep(number: 129, text: 'Schedule visit or virtual orientation.'),
        ],
      ),
      SopProcedure(
        name: 'Document Verification',
        steps: [
          ProcedureStep(number: 130, text: 'Collect original and copies of all required documents.'),
          ProcedureStep(number: 131, text: 'Verify age, previous school records, and address proof.'),
          ProcedureStep(number: 132, text: 'Flag deficiencies and request completion.'),
        ],
      ),
      SopProcedure(
        name: 'Eligibility Confirmation',
        steps: [
          ProcedureStep(number: 133, text: 'Check age and eligibility per CBSE norms.'),
          ProcedureStep(number: 134, text: 'Confirm no pending compliance issue.'),
          ProcedureStep(number: 135, text: 'Record eligibility decision with reason if declined.'),
        ],
      ),
      SopProcedure(
        name: 'Subject Mapping',
        steps: [
          ProcedureStep(number: 136, text: 'Map subjects based on student profile and curriculum.'),
          ProcedureStep(number: 137, text: 'Get curriculum lead approval for subject combination.'),
          ProcedureStep(number: 138, text: 'Record final subject allocation.'),
        ],
      ),
      SopProcedure(
        name: 'Bridge / Support Assignment',
        steps: [
          ProcedureStep(number: 139, text: 'Assess learning gaps during admission interaction.'),
          ProcedureStep(number: 140, text: 'Assign bridge classes or remedial support.'),
          ProcedureStep(number: 141, text: 'Inform class teacher and parent.'),
        ],
      ),
      SopProcedure(
        name: 'Parent Orientation',
        steps: [
          ProcedureStep(number: 142, text: 'Conduct orientation on school policies, calendar, and expectations.'),
          ProcedureStep(number: 143, text: 'Collect consent forms and acknowledgements.'),
          ProcedureStep(number: 144, text: 'Share contact points for queries.'),
        ],
      ),
      SopProcedure(
        name: 'Data Handover to Admin',
        steps: [
          ProcedureStep(number: 145, text: 'Compile verified student data packet.'),
          ProcedureStep(number: 146, text: 'Hand over to admin with acknowledgement.'),
          ProcedureStep(number: 147, text: 'Follow up for portal registration within timeline.'),
        ],
      ),
    ],
    governanceControls: [
      'No admission without complete document verification.',
      'Age and eligibility must meet CBSE norms.',
      'Subject mapping approved by curriculum lead.',
      'Data handover to admin with acknowledgement.',
    ],
    evidenceToMaintain: [
      'Enquiry register.',
      'Verified document copies.',
      'Eligibility confirmation.',
      'Subject mapping sheet.',
      'Bridge assignment record.',
      'Parent acknowledgement.',
    ],
    escalationPath: 'Admissions Coordinator -> Admin Head -> Principal',
    successIndicators: [
      'No ineligible admission processed.',
      'All documents verified and archived.',
      'Data handed over accurately and on time.',
      'Bridge support assigned where needed.',
    ],
    icon: IconDataData(name: 'how_to_reg'),
    colorHex: '#AD1457',
  ),

  // SOP 8 - Curriculum
  StakeholderSop(
    id: 'sop-8',
    title: 'Curriculum',
    subtitle: 'SOP 8',
    purpose:
        'Ensure curriculum mapping, CBE integration, sample paper alignment and academic quality.',
    responsibilities: [
      'Map CBSE curriculum to school academic plan.',
      'Integrate competency-based education (CBE).',
      'Align sample papers with teaching plan.',
      'Coordinate with teachers for implementation.',
      'Review syllabus completion and quality.',
      'Support remediation design based on gap analysis.',
    ],
    annualCalendar: [
      CalendarQuarter(
        period: 'March – April',
        actions:
            'Read new CBSE curriculum, update mapping document.',
      ),
      CalendarQuarter(
        period: 'May – June',
        actions:
            'Design baseline assessment and CBE activity plan.',
      ),
      CalendarQuarter(
        period: 'July – September',
        actions:
            'Review unit test alignment, check CBE integration.',
      ),
      CalendarQuarter(
        period: 'October – December',
        actions:
            'Review syllabus completion, design pre-board structure.',
      ),
      CalendarQuarter(
        period: 'January – February',
        actions:
            'Final revision alignment and gap closure.',
      ),
      CalendarQuarter(
        period: 'March – June',
        actions:
            'Annual curriculum review and next-year planning.',
      ),
    ],
    procedures: [
      SopProcedure(
        name: 'Curriculum Mapping',
        steps: [
          ProcedureStep(number: 148, text: 'Read official CBSE curriculum and syllabus.'),
          ProcedureStep(number: 149, text: 'Map to school academic plan and term structure.'),
          ProcedureStep(number: 150, text: 'Identify changes, additions, or deletions.'),
          ProcedureStep(number: 151, text: 'Communicate mapping to all subject teachers.'),
        ],
      ),
      SopProcedure(
        name: 'CBE Integration',
        steps: [
          ProcedureStep(number: 152, text: 'Review competency mapping for each subject.'),
          ProcedureStep(number: 153, text: 'Design CBE activities and assessments.'),
          ProcedureStep(number: 154, text: 'Align assessments to competency outcomes.'),
          ProcedureStep(number: 155, text: 'Monitor implementation and collect feedback.'),
        ],
      ),
      SopProcedure(
        name: 'Sample Paper Alignment',
        steps: [
          ProcedureStep(number: 156, text: 'Analyze official CBSE sample papers.'),
          ProcedureStep(number: 157, text: 'Map question types and weightage to units.'),
          ProcedureStep(number: 158, text: 'Guide teachers to integrate into lesson plans.'),
          ProcedureStep(number: 159, text: 'Track student performance on sample paper practice.'),
        ],
      ),
      SopProcedure(
        name: 'Remediation Design',
        steps: [
          ProcedureStep(number: 160, text: 'Identify gap patterns from assessments.'),
          ProcedureStep(number: 161, text: 'Design targeted support activities.'),
          ProcedureStep(number: 162, text: 'Coordinate with teachers for delivery.'),
          ProcedureStep(number: 163, text: 'Review effectiveness and adjust.'),
        ],
      ),
    ],
    governanceControls: [
      'Curriculum changes approved by principal.',
      'CBE integration is mandatory, not optional.',
      'Sample paper analysis documented and shared.',
      'Remediation tracked with evidence.',
    ],
    evidenceToMaintain: [
      'Curriculum mapping document.',
      'CBE activity records.',
      'Sample paper analysis.',
      'Syllabus completion reports.',
      'Remediation design documents.',
    ],
    escalationPath: 'Curriculum Lead -> Academic Head -> Principal',
    successIndicators: [
      'Curriculum mapped before academic year starts.',
      'CBE integrated across all subjects.',
      'Sample papers analyzed and used for teaching.',
      'Remediation designed based on evidence.',
    ],
    icon: IconDataData(name: 'menu_book'),
    colorHex: '#283593',
  ),

  // SOP 9 - Finance
  StakeholderSop(
    id: 'sop-9',
    title: 'Finance',
    subtitle: 'SOP 9',
    purpose:
        'Manage fee workflows, exam fee reconciliation, procurement and emergency funding.',
    responsibilities: [
      'Collect fees on schedule and issue receipts.',
      'Reconcile exam fees with CBSE portal.',
      'Manage procurement for labs and exams.',
      'Maintain financial evidence and audit trail.',
      'Support emergency funding requests.',
    ],
    annualCalendar: [
      CalendarQuarter(
        period: 'April – June',
        actions:
            'Annual fee collection, exam fee planning and budgeting.',
      ),
      CalendarQuarter(
        period: 'July – September',
        actions:
            'Registration and LOC fee collection and reconciliation.',
      ),
      CalendarQuarter(
        period: 'October – December',
        actions:
            'Practical assessment procurement, fee follow-up.',
      ),
      CalendarQuarter(
        period: 'January – February',
        actions:
            'Exam fee final reconciliation, emergency procurement.',
      ),
      CalendarQuarter(
        period: 'March – June',
        actions:
            'Annual financial review, next-year budget preparation.',
      ),
    ],
    procedures: [
      SopProcedure(
        name: 'Fee Collection',
        steps: [
          ProcedureStep(number: 164, text: 'Issue fee schedule to parents.'),
          ProcedureStep(number: 165, text: 'Collect fees through approved channels.'),
          ProcedureStep(number: 166, text: 'Issue receipt for every transaction.'),
          ProcedureStep(number: 167, text: 'Follow up on defaults with documented reminders.'),
        ],
      ),
      SopProcedure(
        name: 'Exam Fee Reconciliation',
        steps: [
          ProcedureStep(number: 168, text: 'Collect exam fees from eligible students.'),
          ProcedureStep(number: 169, text: 'Reconcile with CBSE portal records.'),
          ProcedureStep(number: 170, text: 'Report discrepancies to principal and exam cell.'),
          ProcedureStep(number: 171, text: 'Archive reconciliation report and confirmation.'),
        ],
      ),
      SopProcedure(
        name: 'Procurement',
        steps: [
          ProcedureStep(number: 172, text: 'Receive procurement request with justification.'),
          ProcedureStep(number: 173, text: 'Verify budget availability.'),
          ProcedureStep(number: 174, text: 'Obtain authorization.'),
          ProcedureStep(number: 175, text: 'Procure and verify delivery.'),
          ProcedureStep(number: 176, text: 'Archive records.'),
        ],
      ),
    ],
    governanceControls: [
      'Exam fee reconciliation is maker-checker controlled.',
      'Procurement requires authorization and budget check.',
      'Financial evidence archived for audit.',
      'No informal payment adjustments.',
    ],
    evidenceToMaintain: [
      'Fee receipts.',
      'Exam fee reconciliation reports.',
      'Procurement records.',
      'Budget documents.',
      'Financial audit trail.',
    ],
    escalationPath: 'Finance Executive -> Finance Head -> Principal',
    successIndicators: [
      'All exam fees reconciled before deadline.',
      'No procurement delay affecting exams.',
      'Financial evidence complete.',
      'Audit-ready records maintained.',
    ],
    icon: IconDataData(name: 'account_balance'),
    colorHex: '#33691E',
  ),

  // SOP 10 - Consent
  StakeholderSop(
    id: 'sop-10',
    title: 'Consent',
    subtitle: 'SOP 10',
    purpose:
        'Manage consent for activities, photos, digital portfolio, counselling, AI summaries and privacy.',
    responsibilities: [
      'Collect and manage consent forms.',
      'Track consent status for every student.',
      'Ensure consent before any data usage.',
      'Support consent withdrawal process.',
      'Maintain consent evidence securely.',
    ],
    annualCalendar: [
      CalendarQuarter(
        period: 'April – June',
        actions:
            'Annual consent collection for all students.',
      ),
      CalendarQuarter(
        period: 'Ongoing',
        actions:
            'Activity-specific consent, new student consent, consent renewal and withdrawal.',
      ),
    ],
    procedures: [
      SopProcedure(
        name: 'Annual Consent',
        steps: [
          ProcedureStep(number: 177, text: 'Design consent forms covering activities, photos, digital portfolio, counselling, and AI summaries.'),
          ProcedureStep(number: 178, text: 'Distribute to parents with clear instructions.'),
          ProcedureStep(number: 179, text: 'Collect signed forms.'),
          ProcedureStep(number: 180, text: 'Track status and follow up on missing responses.'),
        ],
      ),
      SopProcedure(
        name: 'Activity Consent',
        steps: [
          ProcedureStep(number: 181, text: 'Identify consent requirement for each activity.'),
          ProcedureStep(number: 182, text: 'Issue form to relevant parents.'),
          ProcedureStep(number: 183, text: 'Collect before activity begins.'),
          ProcedureStep(number: 184, text: 'Verify and archive.'),
        ],
      ),
      SopProcedure(
        name: 'Consent Withdrawal',
        steps: [
          ProcedureStep(number: 185, text: 'Receive withdrawal request from parent.'),
          ProcedureStep(number: 186, text: 'Confirm scope of withdrawal.'),
          ProcedureStep(number: 187, text: 'Stop relevant data usage immediately.'),
          ProcedureStep(number: 188, text: 'Archive withdrawal record.'),
        ],
      ),
    ],
    governanceControls: [
      'No data usage without consent where policy requires.',
      'Consent withdrawal processed promptly.',
      'Consent evidence maintained securely.',
      'Privacy incidents escalated immediately.',
    ],
    evidenceToMaintain: [
      'Consent forms.',
      'Consent status tracker.',
      'Withdrawal records.',
      'Activity consent records.',
      'Privacy incident log.',
    ],
    escalationPath: 'Consent Coordinator -> Admin Head -> Principal',
    successIndicators: [
      '100% consent collection before deadline.',
      'No data usage without valid consent.',
      'Consent withdrawal processed promptly.',
      'Privacy incidents logged and resolved.',
    ],
    icon: IconDataData(name: 'verified_user'),
    colorHex: '#4E342E',
  ),

  // SOP 11 - AI Safety / AI Assistant
  StakeholderSop(
    id: 'sop-11',
    title: 'AI Safety / AI Assistant',
    subtitle: 'SOP 11',
    purpose:
        'Ensure AI is used safely, ethically and under human review for school operations.',
    responsibilities: [
      'Review AI-generated content for accuracy, privacy, and tone.',
      'Ensure human approval before AI communication reaches stakeholders.',
      'Maintain AI usage logs.',
      'Guard against AI bias and errors.',
      'Support AI-assisted features under governance.',
    ],
    annualCalendar: [
      CalendarQuarter(
        period: 'Ongoing',
        actions:
            'Continuous AI content review and monitoring.',
      ),
      CalendarQuarter(
        period: 'Quarterly',
        actions:
            'AI governance audit and guardrail review.',
      ),
    ],
    procedures: [
      SopProcedure(
        name: 'AI Content Review',
        steps: [
          ProcedureStep(number: 189, text: 'Review AI output for factual accuracy.'),
          ProcedureStep(number: 190, text: 'Check privacy compliance and data sensitivity.'),
          ProcedureStep(number: 191, text: 'Verify tone and appropriateness for school context.'),
          ProcedureStep(number: 192, text: 'Get human approval before distribution.'),
          ProcedureStep(number: 193, text: 'Log review and approver identity.'),
        ],
      ),
      SopProcedure(
        name: 'AI Usage Logging',
        steps: [
          ProcedureStep(number: 194, text: 'Log every AI usage with purpose and user.'),
          ProcedureStep(number: 195, text: 'Capture input and output summary.'),
          ProcedureStep(number: 196, text: 'Record approver name and timestamp.'),
          ProcedureStep(number: 197, text: 'Archive logs for audit.'),
        ],
      ),
      SopProcedure(
        name: 'AI Incident Handling',
        steps: [
          ProcedureStep(number: 198, text: 'Detect AI error, bias, or inappropriate output.'),
          ProcedureStep(number: 199, text: 'Contain by stopping distribution.'),
          ProcedureStep(number: 200, text: 'Report to AI safety lead and governance committee.'),
          ProcedureStep(number: 201, text: 'Review root cause and update guardrails.'),
        ],
      ),
    ],
    governanceControls: [
      'No AI communication reaches stakeholders without human review.',
      'AI usage logged and auditable.',
      'AI incidents reported to governance committee.',
      'AI does not replace human authority for marks, admissions, or confidential decisions.',
    ],
    evidenceToMaintain: [
      'AI review logs.',
      'Human approval records.',
      'AI usage logs.',
      'Incident reports.',
      'Guardrail update records.',
    ],
    escalationPath: 'AI Safety Lead -> Principal -> Governance Council',
    successIndicators: [
      'No unapproved AI communication sent.',
      'All AI usage logged.',
      'Incidents resolved quickly.',
      'Human authority maintained for all critical decisions.',
    ],
    icon: IconDataData(name: 'smart_toy'),
    colorHex: '#37474F',
  ),

  // SOP 12 - IT Admin
  StakeholderSop(
    id: 'sop-12',
    title: 'IT Admin',
    subtitle: 'SOP 12',
    purpose:
        'Manage school IT infrastructure, portal access, data backup, digital evidence and system readiness.',
    responsibilities: [
      'Maintain CBSE portal access for authorized users.',
      'Manage user accounts and permissions.',
      'Ensure data backup and recovery readiness.',
      'Support exam operations IT needs.',
      'Maintain network and system security.',
      'Coordinate with CBSE for technical issues.',
    ],
    annualCalendar: [
      CalendarQuarter(
        period: 'April – June',
        actions:
            'System setup, account provisioning for new academic year.',
      ),
      CalendarQuarter(
        period: 'July – September',
        actions:
            'Portal access for registration, backup verification.',
      ),
      CalendarQuarter(
        period: 'October – December',
        actions:
            'Exam season IT readiness, security audit.',
      ),
      CalendarQuarter(
        period: 'January – February',
        actions:
            'Practical assessment IT support, backup.',
      ),
      CalendarQuarter(
        period: 'February – April',
        actions:
            'Board exam IT operations support.',
      ),
      CalendarQuarter(
        period: 'May – June',
        actions:
            'Annual IT review, upgrade planning.',
      ),
    ],
    procedures: [
      SopProcedure(
        name: 'Portal Access Management',
        steps: [
          ProcedureStep(number: 202, text: 'Provision accounts for authorized roles.'),
          ProcedureStep(number: 203, text: 'Manage permissions per approval matrix.'),
          ProcedureStep(number: 204, text: 'Monitor access and detect anomalies.'),
          ProcedureStep(number: 205, text: 'Log all access changes.'),
        ],
      ),
      SopProcedure(
        name: 'Backup Procedure',
        steps: [
          ProcedureStep(number: 206, text: 'Schedule automated backups for all critical data.'),
          ProcedureStep(number: 207, text: 'Verify backup completion daily.'),
          ProcedureStep(number: 208, text: 'Test restore quarterly.'),
          ProcedureStep(number: 209, text: 'Log and archive backup records.'),
        ],
      ),
      SopProcedure(
        name: 'Exam IT Readiness',
        steps: [
          ProcedureStep(number: 210, text: 'Verify systems, network, and hardware.'),
          ProcedureStep(number: 211, text: 'Test CBSE portal access and speed.'),
          ProcedureStep(number: 212, text: 'Prepare backup plans and alternate connectivity.'),
          ProcedureStep(number: 213, text: 'Coordinate with exam cell for upload windows.'),
        ],
      ),
    ],
    governanceControls: [
      'Portal access restricted to authorized roles only.',
      'Backups tested regularly with evidence.',
      'Access logs maintained and reviewed.',
      'Security incidents escalated immediately.',
      'Data access per approved matrix.',
    ],
    evidenceToMaintain: [
      'Access logs.',
      'Backup logs.',
      'Restore test records.',
      'Security audit reports.',
      'Incident logs.',
      'System readiness checklist.',
    ],
    escalationPath: 'IT Admin -> Principal -> External IT Support',
    successIndicators: [
      'Zero portal access failures during critical periods.',
      'Backups verified and restore tested.',
      'Security incidents resolved quickly.',
      'Exam IT operations smooth and uninterrupted.',
    ],
    icon: IconDataData(name: 'computer'),
    colorHex: '#1A237E',
  ),

  // SOP 13 - Management / School Board Governance
  StakeholderSop(
    id: 'sop-13',
    title: 'Management / School Board Governance',
    subtitle: 'SOP 13',
    purpose:
        'Define how school governance supports, reviews and steers without informal interference in operations.',
    responsibilities: [
      'Approve annual operating calendar and compliance priorities.',
      'Review governance dashboard and risk register.',
      'Support resources without informal interference.',
      'Review risk register and incident trends.',
      'Approve major policies.',
      'Ensure school quality improvement driven by evidence.',
    ],
    annualCalendar: [
      CalendarQuarter(
        period: 'Quarterly',
        actions:
            'Governance review meetings, dashboard review, risk and compliance status.',
      ),
      CalendarQuarter(
        period: 'Annual',
        actions:
            'Operating plan approval, annual closure, and next-year planning.',
      ),
    ],
    procedures: [
      SopProcedure(
        name: 'Annual Calendar Approval',
        steps: [
          ProcedureStep(number: 214, text: 'Review principal\'s proposed annual operating calendar.'),
          ProcedureStep(number: 215, text: 'Approve with modifications if needed.'),
          ProcedureStep(number: 216, text: 'Communicate approved calendar to all stakeholders.'),
        ],
      ),
      SopProcedure(
        name: 'Governance Review',
        steps: [
          ProcedureStep(number: 217, text: 'Review governance dashboard.'),
          ProcedureStep(number: 218, text: 'Review risk register and compliance status.'),
          ProcedureStep(number: 219, text: 'Review incident trends and corrective actions.'),
          ProcedureStep(number: 220, text: 'Approve corrective actions and resource allocation.'),
        ],
      ),
      SopProcedure(
        name: 'Policy Approval',
        steps: [
          ProcedureStep(number: 221, text: 'Review policy proposal from principal or committee.'),
          ProcedureStep(number: 222, text: 'Consult stakeholders as needed.'),
          ProcedureStep(number: 223, text: 'Approve or request revision.'),
          ProcedureStep(number: 224, text: 'Communicate and archive approved policy.'),
        ],
      ),
      SopProcedure(
        name: 'Resource Support',
        steps: [
          ProcedureStep(number: 225, text: 'Receive resource request from principal.'),
          ProcedureStep(number: 226, text: 'Evaluate need and alignment with school plan.'),
          ProcedureStep(number: 227, text: 'Approve or escalate to board if beyond authority.'),
          ProcedureStep(number: 228, text: 'Track deployment and outcomes.'),
        ],
      ),
    ],
    governanceControls: [
      'Management supports without informal interference in marks, admissions, or confidential data.',
      'Governance decisions documented and archived.',
      'No bypassing of principal in operational matters.',
      'Annual improvement driven by evidence and SQAAF.',
    ],
    evidenceToMaintain: [
      'Governance meeting minutes.',
      'Decision logs.',
      'Approved policies.',
      'Resource allocation records.',
      'Annual operating report.',
    ],
    escalationPath: 'Management -> Board (for legal, reputation, or existential risks)',
    successIndicators: [
      'Governance meetings held on cadence.',
      'Decisions documented and communicated.',
      'Resources provided without operational interference.',
      'Annual improvement evidence-based.',
    ],
    icon: IconDataData(name: 'gavel'),
    colorHex: '#880E4F',
  ),
];
