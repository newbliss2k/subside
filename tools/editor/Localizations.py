from tkinter import *
from tkinter import ttk as t
import json

def init(root, main_frame):
    # --- Основные элементы ---

    # Фрейм для элементов управления
    control_frame = t.Frame(main_frame)
    control_frame.pack(side=TOP, fill=X)

    # Выпадающие списки для выбора подсловаря A и B
    available_locales = list(root.DATA['localizations'].keys())
    locale_a_var = StringVar(control_frame)
    locale_a_var.set(available_locales[0]) # Устанавливаем значение по умолчанию
    locale_a_combobox = t.Combobox(control_frame, textvariable=locale_a_var, values=available_locales)
    locale_a_combobox.pack(side=LEFT, padx=5)

    locale_b_var = StringVar(control_frame)
    locale_b_var.set(available_locales[1]) # Устанавливаем значение по умолчанию
    locale_b_combobox = t.Combobox(control_frame, textvariable=locale_b_var, values=available_locales)
    locale_b_combobox.pack(side=LEFT, padx=5)

    # Кнопка для создания нового подсловаря
    def create_new_locale():
        def save_new_locale():
            new_locale_name = new_locale_entry.get()
            if new_locale_name:
                root.DATA['localizations'][new_locale_name] = {'name': new_locale_name}
                new_locale_window.destroy()
                update_table() # Обновляем таблицу после добавления нового подсловаря
                locale_a_combobox['values'] = locale_b_combobox['values'] = list(
                    root.DATA['localizations'].keys()
                ) # Обновляем значения в выпадающих списках

        new_locale_window = Toplevel(root)
        new_locale_window.title("Создать новый подсловарь")
        t.Label(new_locale_window, text="Введите название нового подсловаря:").pack(pady=5)
        new_locale_entry = t.Entry(new_locale_window)
        new_locale_entry.pack(pady=5)
        t.Button(new_locale_window, text="Создать", command=save_new_locale).pack(pady=5)

    create_locale_button = t.Button(control_frame, text="Создать новый подсловарь", command=create_new_locale)
    create_locale_button.pack(side=LEFT, padx=5)

    # Кнопка для создания новой строки
    def create_new_string():
        new_string_key = f'new_string{len(root.DATA["localizations"][locale_a_var.get()]) + 1}'
        root.DATA['localizations'][locale_a_var.get()][new_string_key] = ''
        root.DATA['localizations'][locale_b_var.get()][new_string_key] = ''
        update_table() # Обновляем таблицу после добавления новой строки

    create_string_button = t.Button(control_frame, text="Создать новую строку", command=create_new_string)
    create_string_button.pack(side=LEFT, padx=5)

    # --- Таблица ---

    # Фрейм для таблицы
    table_frame = t.Frame(main_frame)
    table_frame.pack(side=TOP, fill=BOTH, expand=True)

    # Создаем таблицу
    columns = ('key', 'value_a', 'value_b')
    tree = t.Treeview(table_frame, columns=columns, show='headings')
    tree.heading('key', text='Ключ')
    tree.heading('value_a', text=locale_a_var.get())
    tree.heading('value_b', text=locale_b_var.get())

    # Вертикальная прокрутка
    vscrollbar = Scrollbar(table_frame, orient=VERTICAL)
    vscrollbar.pack(side=RIGHT, fill=Y)
    tree.config(yscrollcommand=vscrollbar.set)
    vscrollbar.config(command=tree.yview)

    # Устанавливаем таблицу в фрейм
    tree.pack(side=LEFT, fill=BOTH, expand=True)

    def update_table():
        # Очищаем таблицу
        for row in tree.get_children():
            tree.delete(row)

        # Получаем ключи из всех подсловарей
        all_keys = set()
        for locale in root.DATA['localizations'].values():
            all_keys.update(locale.keys())

        # Сортировка ключей по алфавиту
        all_keys = sorted(all_keys)

        # Заполняем таблицу
        for key in all_keys:
            value_a = root.DATA['localizations'][locale_a_var.get()].get(key, "")
            value_b = root.DATA['localizations'][locale_b_var.get()].get(key, "")
            tree.insert('', END, values=(key, value_a, value_b), tags=("row",))

    # --- Редактор строк ---

    # Фрейм для редактора
    editor_frame = t.Frame(main_frame)
    editor_frame.pack(side=BOTTOM, fill=X)

    # Поля ввода в редакторе
    key_entry = t.Entry(editor_frame)
    key_entry.pack(side=LEFT, padx=5)
    value_a_entry = Text(editor_frame, wrap=WORD, height=5)
    value_a_entry.pack(side=LEFT, padx=5)
    value_b_entry = Text(editor_frame, wrap=WORD, height=5)
    value_b_entry.pack(side=LEFT, padx=5)

    # Обработка клика на строку таблицы
    def edit_row(event):
        # Проверяем, что выбрана строка
        if tree.selection():
            selected_item = tree.selection()[0]
            values = tree.item(selected_item, 'values')
            key_entry.delete(0, END)
            key_entry.insert(0, values[0])
            value_a_entry.delete('1.0', END)
            value_a_entry.insert(END, values[1])
            value_b_entry.delete('1.0', END)
            value_b_entry.insert(END, values[2])

    # Обработка изменений в полях ввода
    def update_data(event=None): # Добавлен параметр event для совместимости с bind
        # Проверяем, что выбрана строка
        if tree.selection():
            selected_item = tree.selection()[0]
            key = key_entry.get()
            value_a = value_a_entry.get('1.0', END).strip()
            value_b = value_b_entry.get('1.0', END).strip()

            root.DATA['localizations'][locale_a_var.get()][key] = value_a
            root.DATA['localizations'][locale_b_var.get()][key] = value_b
            tree.item(selected_item, values=(key, value_a, value_b))

    # Используем "<ButtonRelease-1>" вместо "<Button-1>" для открытия строки
    tree.bind("<ButtonRelease-1>", edit_row)
    # Используем bind("<KeyRelease>", ...) для полей ввода, чтобы обновление происходило при каждом нажатии клавиши
    key_entry.bind("<KeyRelease>", update_data)
    value_a_entry.bind("<KeyRelease>", update_data)
    value_b_entry.bind("<KeyRelease>", update_data)

    # --- Обновление таблицы при изменении подсловаря ---

    def update_locale_selection(event):
        update_table()
        tree.heading('value_a', text=locale_a_var.get())
        tree.heading('value_b', text=locale_b_var.get())

    locale_a_combobox.bind("<<ComboboxSelected>>", update_locale_selection)
    locale_b_combobox.bind("<<ComboboxSelected>>", update_locale_selection)

    # --- Кнопка удаления строки ---

    def delete_row():
        if tree.selection():
            selected_item = tree.selection()[0]
            key = tree.item(selected_item, 'values')[0]
            # Удаление из обоих словарей
            del root.DATA['localizations'][locale_a_var.get()][key]
            del root.DATA['localizations'][locale_b_var.get()][key]
            tree.delete(selected_item)

    delete_button = t.Button(control_frame, text="Удалить строку", command=delete_row)
    delete_button.pack(side=LEFT, padx=5)

    # --- Инициализация таблицы ---
    update_table()
