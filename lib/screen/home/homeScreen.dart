import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<String> tabs = [
    "New Tasks",
    "In Progress",
    "Completed",
    "Canceled",
  ];

  final Map<int, List<String>> taskData = {
    0: ["Setup Backend", "Create API", "Design UI"],
    1: ["Auth Module", "OTP Flow"],
    2: ["Login Screen"],
    3: ["Old Feature"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      /// AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1D37),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          tabs[_currentIndex],
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Color(0xFF0A1D37)),
              ),
            ),
          ),
        ],
      ),

      /// Body
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF2ECC71), Color(0xFF0A1D37)],
          ),
        ),
        child: _buildTaskList(),
      ),

      /// Bottom Navigation
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0A1D37),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          onTap: (index) {
            setState(() => _currentIndex = index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.add_task), label: "New"),
            BottomNavigationBarItem(
              icon: Icon(Icons.timelapse),
              label: "Progress",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle),
              label: "Completed",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cancel),
              label: "Canceled",
            ),
          ],
        ),
      ),
    );
  }

  /// Reorderable Task List
  Widget _buildTaskList() {
    final tasks = taskData[_currentIndex]!;

    if (tasks.isEmpty) {
      return const Center(
        child: Text(
          "No tasks available",
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    return ReorderableListView.builder(
      padding: const EdgeInsets.only(bottom: 90, top: 12),
      itemCount: tasks.length,
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (newIndex > oldIndex) newIndex--;
          final item = tasks.removeAt(oldIndex);
          tasks.insert(newIndex, item);
        });
      },
      itemBuilder: (context, index) {
        return _taskCard(tasks[index]);
      },
    );
  }

  /// Task Card (Dark / Glass Style)
  Widget _taskCard(String title) {
    return Container(
      key: ValueKey(title),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xFF0A1D37).withOpacity(0.85),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        leading: const Icon(Icons.drag_handle, color: Colors.white70),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: _statusChip(),
      ),
    );
  }

  /// Status Chip
  Widget _statusChip() {
    switch (_currentIndex) {
      case 0:
        return _chip("NEW", const Color(0xFF2ECC71));
      case 1:
        return _chip("PROGRESS", Colors.orange);
      case 2:
        return _chip("DONE", Colors.green);
      case 3:
        return _chip("CANCEL", Colors.red);
      default:
        return const SizedBox();
    }
  }

  Widget _chip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
