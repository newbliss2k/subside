'''Editor'''

from tkinter import *
from tkinter import ttk as t
from editor import SL, Dock, Section

root = Tk()
root.title("Subside Editor")
root.geometry("1080x720")

root.DATA=SL.SL_load()

root.option_add("*tearOff", 0)

# Dock

Dock.init(root)

# Section Select

main_frame = t.Frame(borderwidth=1, relief=GROOVE, padding=[2, 2])
Section.init(root, main_frame)

root.update_idletasks()
root.update()
root.mainloop()
