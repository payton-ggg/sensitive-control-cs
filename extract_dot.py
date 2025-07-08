import cv2
import numpy as np
import matplotlib.pyplot as plt

# Загрузи изображение
img = cv2.imread("image.png")
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Найти красные точки (можно настроить порог)
lower_red = np.array([0, 0, 180])
upper_red = np.array([100, 100, 255])
mask = cv2.inRange(img, lower_red, upper_red)

# Найти контуры
contours, _ = cv2.findContours(mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

coords = []
for cnt in contours:
    for p in cnt:
        x, y = p[0]
        coords.append((x, y))

# Сортировать по Y чтобы упорядочить по "времени"
coords = sorted(coords, key=lambda c: c[1])

# Центрировать и нормализовать
coords_np = np.array(coords)
coords_np = coords_np - np.mean(coords_np, axis=0)

# Отмасштабировать (например, до ~[-4,4])
scale = 8 / (np.max(coords_np[:, 0]) - np.min(coords_np[:, 0]))
coords_np *= scale

# Построить массив для AHK
for i, (x, y) in enumerate(coords_np):
    print(f"sprayPattern[{i}] := [{x:.2f}, {y:.2f}]")
