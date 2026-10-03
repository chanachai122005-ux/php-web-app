<?php
require 'db.php';
$rows = [];
if ($pdo) {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $stmt = $pdo->prepare("INSERT INTO users (name,email,phone) VALUES (?,?,?)");
        $stmt->execute([$_POST['name'], $_POST['email'], $_POST['phone']]);
        header("Location: " . $_SERVER['REQUEST_URI']);
        exit;
    }
    $rows = $pdo->query("SELECT * FROM users ORDER BY id DESC")->fetchAll(PDO::FETCH_ASSOC);
}
?>
<!DOCTYPE html>
<html lang="th">
<head><meta charset="UTF-8"><title>Apache Web Server</title></head>
<body style="font-family:Arial;max-width:900px;margin:40px auto">
<h1>Apache Web Server</h1>
<p>Server: <b>Apache</b></p>
<p>Database Status: <b><?= htmlspecialchars($status) ?></b></p>
<form method="post">
  <p>ชื่อ<br><input name="name" required style="width:100%"></p>
  <p>Email<br><input name="email" type="email" required style="width:100%"></p>
  <p>เบอร์โทร<br><input name="phone" required style="width:100%"></p>
  <button type="submit">บันทึกข้อมูล</button>
</form>
<h2>ข้อมูลผู้ใช้</h2>
<table border="1" cellpadding="8" cellspacing="0" width="100%">
<tr><th>ID</th><th>ชื่อ</th><th>Email</th><th>เบอร์โทร</th></tr>
<?php foreach ($rows as $r): ?>
<tr><td><?= $r['id'] ?></td><td><?= htmlspecialchars($r['name']) ?></td>
<td><?= htmlspecialchars($r['email']) ?></td><td><?= htmlspecialchars($r['phone']) ?></td></tr>
<?php endforeach; ?>
</table>
</body></html>
