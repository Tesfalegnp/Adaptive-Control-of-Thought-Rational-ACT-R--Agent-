from hyperon import MeTTa
import tkinter as tk
from tkinter import ttk
from PIL import Image, ImageTk
import os
import time
import threading

# Initialize MeTTa once
mt = MeTTa()

# MeTTa rule base code
metta_code = '''
!(register-module! ../ACT-R_Agent)
!(import! &self ACT-R_Agent:knowledge:Knowledge)
!(import! &self ACT-R_Agent:engine:forward_chain)

(= (run $fact)
    (fcc (space) (fromNumber 6) (: R_FACT $fact))
)
'''

# Run base setup code
mt.run(metta_code)

# ---------------- GUI Code ---------------- #

# Typing effect for output
def type_writer(text, widget, delay=30):
    widget.config(text="")  # clear previous text
    def inner_typing():
        display_text = ""
        for char in text:
            display_text += char
            widget.config(text=display_text)
            time.sleep(delay / 1000)
    threading.Thread(target=inner_typing).start()

# Run MeTTa code and show result with typing effect
def run_metta():
    user_input = input_entry.get()
    if not user_input.strip():
        type_writer("Please enter a fact.", result_label)
        return

    try:
        result = mt.run(f'!(run ({user_input}))')
        if result and result[0] != '()':
            raw_output = str(result[0])
            formatted = raw_output.replace("),", "),\n")
            type_writer(f"✅ Result:\n{formatted}", result_label)
        else:
            type_writer(" Sorry, currently there is no such FACT in my AtomSpace.\nPlease try another.",
                        result_label)
    except Exception as e:
        type_writer(f" Error: {str(e)}", result_label)

# Main window
root = tk.Tk()
root.title("Min ACT-R Agent For Cognitive Architecture")
root.geometry("800x500")

# Get the current directory of the script
script_dir = os.path.dirname(os.path.abspath(__file__))
image_path = os.path.join(script_dir, "bc-image.gif")

# Load background image
try:
    bg_image = Image.open(image_path)
    bg_image = bg_image.resize((800, 500), Image.LANCZOS)
    bg_photo = ImageTk.PhotoImage(bg_image)

    bg_label = tk.Label(root, image=bg_photo)
    bg_label.place(x=0, y=0, relwidth=1, relheight=1)
except Exception as e:
    print("Could not load background image:", e)

# Foreground Frame for inputs
frame = tk.Frame(root, bg="#ffffff", bd=2, relief="ridge")
frame.place(relx=0.5, rely=0.5, anchor="center", width=600, height=350)

# Title
title_label = ttk.Label(frame, text="Welcome to ACT-R Tester", font=("Helvetica", 16, "bold"))
title_label.pack(pady=10)

# Entry
input_entry = ttk.Entry(frame, font=("Helvetica", 12), width=50)
input_entry.pack(pady=10)

# Button
run_button = ttk.Button(frame, text="Run Test", command=run_metta)
run_button.pack(pady=10)

# Result label
result_label = ttk.Label(frame, text="", font=("Helvetica", 12), background="#ffffff",
                         wraplength=550, justify="left")
result_label.pack(pady=20)

# Start GUI loop
root.mainloop()
