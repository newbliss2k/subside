from tkinter import *
from tkinter import ttk as t

from editor import Localizations, Main

def init(root, main_frame):

    root.section = "main"

    selection_frame = t.Frame(borderwidth=1, relief=GROOVE, padding=[2, 2])

    def Button_section(text,name="main"):
        def command():
            root.section = name
            for widget in main_frame.winfo_children():
                widget.destroy()  # Удаляем все виджеты из main_frame

            if name == "main":
                Main.init(root, main_frame) 
            elif name == "locals":
                Localizations.init(root, main_frame)
            # ...добавить другие условия для других модулей...

            main_frame.pack(side=RIGHT, fill=BOTH, padx=2, pady=2) # Обновление pack после смены содержимого

        return t.Button(selection_frame, text=text, width=40, padding=10, command=command)

    
    s_main=Button_section("Главная","main")
    s_main.pack()

    s_actors=Button_section("Герои")
    s_actors.pack()

    s_classes=Button_section("Классы")
    s_classes.pack()

    s_skills=Button_section("Умения")
    s_skills.pack()

    s_items=Button_section("Вещи")
    s_items.pack()

    s_weapons=Button_section("Оружия")
    s_weapons.pack()

    s_armors=Button_section("Броня")
    s_armors.pack()

    s_enemies=Button_section("Враги")
    s_enemies.pack()

    s_troops=Button_section("Группы")
    s_troops.pack()

    s_locals=Button_section("Локализации","locals")
    s_locals.pack()


    # Вызов init для начального состояния
    Main.init(root, main_frame) 

    selection_frame.pack(side=LEFT, padx=2, pady=2)
    main_frame.pack(side=RIGHT, fill=BOTH, padx=2, pady=2)