import 'dart:io';

class Lis {
  int a;
  String name;
  Lis(this.a, this.name);

  void save() {
    File f = File("path.txt");
    f.writeAsStringSync("[$a] $name\n", mode: FileMode.append);
  }

  void show() {
    File r = File("path.txt");
    String l = r.readAsStringSync();
    print("$l");
  }
}

class M {
  List<Lis> f = [];

  void add(String t) {
    int o = f.length;
    f.add(Lis(o, t));
    f.last.save();
    print("Task added: $t");
  }

  void view() {
    if (f.isEmpty) {
      print("No tasks to show.");
      return;
    }
    for (int i = 0; i < f.length; i++) {
      print("[${f[i].a}] ${f[i].name}");
    }
  }

  void remove(String? s) {
    if (s == null || s.isEmpty) {
      print("Invalid input.");
      return;
    }
    f.removeWhere((f) => f.name == s);
    print("Removed: $s");
  }
}

void main() {
  M e = M();

  while (true) {
    print("\nTO-DO-LIST..");
    print("1}- View tasks.");
    print("2}- Add task.");
    print("3}- Remove task.");
    print("4}- Show saved file.");
    print("5}- EXIT--.");

    stdout.write("Enter your choice: ");
    int? n;
    try {
      n = int.parse(stdin.readLineSync()!);
    } catch (_) {
      print("Invalid number.");
      continue;
    }

    switch (n) {
      case 1:
        e.view();
        break;
      case 2:
        stdout.write("Enter the task to add: ");
        String t = stdin.readLineSync()!;
        e.add(t);
        break;
      case 3:
        stdout.write("Enter the task to remove: ");
        String? t = stdin.readLineSync();
        e.remove(t);
        break;
      case 4:
        Lis(0, "").show();
        break;
      case 5:
        print("Exiting...");
        return;
      default:
        print("Invalid choice.");
    }
  }
}
