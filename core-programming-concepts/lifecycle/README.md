# Жизненный цикл приложения iOS

## Основные состояния приложения

Приложение проходит через несколько состояний:

1. **Not Running** – приложение ещё не запущено или завершило работу.
2. **Inactive** – приложение запущено, но не получает события (например, звонок).
3. **Active** – активно, передаёт события, видимо пользователю.
4. **Background** – скрыто, но может выполнять задачи.
5. **Suspended** – «заморожено» системой, исполняется только в памяти.

---

## Жизненный цикл – шаги и методы

### 1. `application(_:didFinishLaunchingWithOptions:)`

Срабатывает при старте, настроит основные сервисы, UI, аналитику.

---

### 2. `applicationDidBecomeActive(_:)`

Приложение стало активным — идеальный момент для возобновления задач, таймеров, обновлений.

---

### 3. `applicationWillResignActive(_:)`

Приложение теряет фокус (например, звонок, СМС) — нужно приостановить анимации, игры.

---

### 4. `applicationDidEnterBackground(_:)`

Переход в фон — здесь сохраняем данные, освобождаем ресурсы и запускаем фоновые задачи.

---

### 5. `applicationWillEnterForeground(_:)`

Возврат из фона — можно отменить изменения, подготовиться к активации.

---

### 6. `applicationWillTerminate(_:)`

Перед закрытием приложения — нужно выполнить финальный сейв, удалить наблюдателей, сохранить контекст.

---

## Как состояния меняются

```
Not Running →
    application(_:didFinishLaunchingWithOptions:) →
Inactive →
    applicationDidBecomeActive(_:) →
Active →
    applicationWillResignActive(_:) →
Inactive →
    applicationDidEnterBackground(_:) →
Background →
    (возможно Suspended) →
    applicationWillEnterForeground(_:) →
Inactive →
    applicationDidBecomeActive(_:) →
Active
```

И при завершении — `applicationWillTerminate(_:)`.

---

## Best practices

- Сохраняйте данные в `DidEnterBackground`.
- Освобождайте ресурсы при выходе в фон.
- Приостановка анимации и задач в `WillResignActive`.
- Используйте `preventSuspend` для фонового выполнения.
- Не перегружайте `didFinishLaunching` — задержки при старте критичны.

# Жизненный цикл UIViewController в iOS

Важно понимать [жизненный цикл приложения](#) и жизненный цикл ViewController перед началом разработки iOS‑приложений.  

## Порядок вызова методов

При создании `UIViewController` происходят следующие этапы:

1. `init()`  
2. `loadView()`  
3. `viewDidLoad()`  
4. `viewWillAppear()`  
5. `viewIsAppearing()`  
6. `viewWillLayoutSubviews()`  
7. `viewDidLayoutSubviews()`  
8. `viewDidAppear()`  
9. `viewWillTransition()`  
10. `viewWillDisappear()`  
11. `viewDidDisappear()`  
12. `deinit()`

Давайте подробнее рассмотрим каждый шаг 👇

---

## `init()`

Это **назначенный инициализатор** для `UIViewController`.  
Вы вызываете его при создании экземпляра, обычно переопределяя для своей кастомной логики.  
Обязательно вызывайте `super.init(nibName:bundle:)` внутри вашего `init()`.

---

## `loadView()`

Метод отвечает за создание или загрузку иерархии view контроллера.  
Переопределяйте его, если хотите строить UI **программно**, без storyboard или nib-файлов.  
Если не переопределять, система автоматически загрузит view из storyboard/nib.  
**Никогда** не вызывайте этот метод напрямую — он автоматически вызывается, когда `.view == nil`.

---

## `viewDidLoad()`

Вызывается после загрузки view в память.  
Отличное место для дополнительной инициализации UI‑элементов, настройки данных.  
Для дополнительной настройки используйте этот метод — view уже создан и Outlets подключены.

---

## `viewWillAppear()`

Вызывается **перед тем**, как с view начнёт отображаться на экране.  
Подходит для обновления UI, данных, начала анимаций перед показом.

---

## `viewIsAppearing()`

Новый метод, представленный на **WWDC 2023** (iOS 13+).  
Вызывается после `viewWillAppear()` и **перед** `viewWillLayoutSubviews()`, когда layout уже настроен.  
Полезен для тонкой настройки UI или пролистывания `UICollectionView` перед появлением.

---

## `viewWillLayoutSubviews()`

Срабатывает перед тем, как система начинает раскладывать сабвьюхи (`layoutSubviews`).  
Подходит для обновления frame‑ов субвьюх, если не пользуетесь Auto Layout.

---

## `viewDidLayoutSubviews()`

Вызывается после размещения view и применения constraints.  
Используйте для финальной подгонки элементов UI.

---

## `viewDidAppear()`

Вызывается после появления view на экране.  
Идеально подходит для запуска анимаций, таймеров, фоновых задач и пр.

---

## `viewWillTransition()`

Вызывается при сценариях перехода — например, при изменении ориентации экрана.

---

## `viewWillDisappear()`

Срабатывает, когда view собирается исчезнуть.  
Используется для остановки анимаций, сохранения состояния, отмены запросов и пр.

---

## `viewDidDisappear()`

Вызывается после того, как view полностью исчезла.  
Хорошее место для освобождения ресурсов, отмены наблюдений, подписок и пр.

---

## `deinit()`

Вызывается при удалении экземпляра контроллера из памяти.  
Подходит для окончательной уборки — удаления наблюдателей, таймеров и пр.

---

## Итог

Резюмируем последовательность вызовов:

```
init → loadView → viewDidLoad → viewWillAppear → viewIsAppearing → viewWillLayoutSubviews → viewDidLayoutSubviews → viewDidAppear → viewWillTransition → viewWillDisappear → viewDidDisappear → deinit
```