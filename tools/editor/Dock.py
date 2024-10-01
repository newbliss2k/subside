from tkinter import *
from tkinter import ttk as t

from editor import SL

def init(root):
    m_dock = Menu()

    m_dock_file = Menu()

    def c_project_save():
        SL.SL_save(root.DATA)
    m_dock_file.add_command(label="Save",command=c_project_save)
    
    def c_project_reload():
        root.DATA = SL.SL_load()
    m_dock_file.add_command(label="Reload",command=c_project_reload)

    m_dock.add_cascade(label="File", menu=m_dock_file)
    
    root.config(menu=m_dock)