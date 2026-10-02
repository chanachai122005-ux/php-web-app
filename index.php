<?php
include 'db.php';

// จัดการการบันทึกข้อมูลเมื่อผู้ใช้กดปุ่มส่งฟอร์ม
$message = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $conn->real_escape_string($_POST['name']);
    $email = $conn->real_escape_string($_POST['email']);
    
    // สร้างตารางอัตโนมัติถ้ายังไม่มี
    $conn->query("CREATE TABLE IF NOT EXISTS users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )");

    $sql = "INSERT INTO users (name, email) VALUES ('$name', '$email')";
    if ($conn->query(TURE) === TRUE || $conn->query($sql) === TRUE) {
        $message = "บันทึกข้อมูลสำเร็จ!";
    } else {
        $message = "Error: " . $sql . "<br>" . $conn->error;
    }
}

// ดึงข้อมูลขึ้นมาแสดง
$result = $conn->query("SHOW TABLES LIKE 'users'");
$users = [];
if ($result->num_rows > 0) {
    $users = $conn->query("SELECT * FROM users ORDER BY id DESC");
}
?>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>PHP MySQL Web App</title>
    <style>
        body { font-family: sans-serif; background: #f4f7f6; margin: 0; padding: 20px; }
        .container { max-width: 600px; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); margin: auto; }
        input, button { width: 100%; padding: 10px; margin: 8px 0; box-sizing: border-box; }
        button { background: #4CAF50; color: white; border: none; cursor: pointer; border-radius: 4px; }
        button:hover { background: #45a049; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .alert { color: green; font-weight: bold; }
    </style>
</head>
<body>
<div class="container">
    <h2>ระบบบันทึกข้อมูลอย่างง่าย (PHP + MySQL)</h2>
    <?php if(!empty($message)) echo "<p class='alert'>$message</p>"; ?>
    
    <form method="POST">
        <label>ชื่อ-นามสกุล:</label>
        <input type="text" name="name" required>
        
        <label>อีเมล:</label>
        <input type="email" name="email" required>
        
        <button type="submit">บันทึกข้อมูล</button>
    </form>

    <h3>รายชื่อในระบบ</h3>
    <table>
        <tr>
            <th>ID</th>
            <th>ชื่อ</th>
            <th>อีเมล</th>
            <th>เวลา</th>
        </tr>
        <?php if (!empty($users) && $users->num_rows > 0): ?>
            <?php while($row = $users->fetch_assoc()): ?>
            <tr>
                <td><?php echo $row['id']; ?></td>
                <td><?php echo htmlspecialchars($row['name']); ?></td>
                <td><?php echo htmlspecialchars($row['email']); ?></td>
                <td><?php echo $row['created_at']; ?></td>
            </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr><td colspan="4" style="text-align:center;">ยังไม่มีข้อมูล</td></tr>
        <?php endif; ?>
    </table>
</div>
</body>
</html>
