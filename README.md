![Image](https://roboticsbiz.com/wp-content/uploads/2023/09/brain.jpg)
#  ACT-R Inspired Cognitive Agent in MeTTa

This project implements a symbolic cognitive agent inspired by [ACT-R](https://act-r.psy.cmu.edu/) (Adaptive Control of Thought - Rational) using the [MeTTa](https://wiki.opencog.org/w/MeTTa) language from the Hyperon framework.

It models goal-driven behavior, rule-based reasoning, and memory modules to simulate human-like decision-making. The project is designed to explore symbolic AI for AGI-related research and can be extended with learning, memory, and communication.

---

## 🚀 Project Features

✅ Forward chaining inference  
✅ Rule-based reasoning system (production rules)  
✅ Declarative memory facts  
✅ Goal buffer and working memory (simulated)  
✅ Simulated environment state (water, plants, barn, etc.)  
✅ Multi-step cognitive chains (e.g., water → grow → harvest)  
✅ Backward chaining for goal reasoning  
✅ Experimental learning and chunking  
✅ Extendable to AGI projects like OpenCog Hyperon  

---

## 📁 Folder Structure

```

actr-agent-metta/
│
├── README.md                # Project documentation
├── LICENSE                  # MIT license
├── agent.metta              # Main MeTTa file with rules and inference
├── environment.metta        # Simulated environment facts and states
├── buffers.metta            # Goal buffer, perception buffers, etc.
├── utils.metta              # Conflict resolution, learning, visualization
├── tests/
│   ├── test\_forward.metta   # Forward chaining test cases
│   └── test\_backward.metta  # Backward chaining and goal reasoning
└── docs/
└── architecture.png     # Visual overview of rule system

```

---

## 🧠 Cognitive Architecture Overview

```

\[Environment] → \[Perception] → \[Buffers]
↓
\[Production Rules System]
↓
\[Action Execution]

````

- **Environment** stores factual knowledge (e.g., `soil is dry`)
- **Buffers** simulate ACT-R’s working memory (goal, declarative, visual)
- **Rules** represent conditional actions (IF-THEN logic)
- **Conflict Resolution** selects best rule when multiple match
- **Forward + Backward chaining** powers inference

---

## 🛠️ Getting Started

### 🔧 Requirements

- [Hyperon CLI](https://wiki.opencog.org/w/MeTTa#Installation)
- MeTTa runtime installed locally
- Linux/macOS/Windows (with MeTTa support)
    ```bash
    pip install hyperon==0.2.4
    ```

### 🧪 Running the MeTTa

```bash
metta --version
````
 - Expected output ` 0.2.4`

then run test cases:

```bash
metta tests/test_case.metta
```

---

## 🧪 Examples

###  Watering Plants Scenario

```metta
(: fact1 (soil is dry))
(: fact2 (plants need water))
(: action (start watering))
(: result (plants are growing))
```

###  Reasoning Chain Output

```
→ R3: (plants need water)
→ R4: (start watering)
→ R5: (plants are growing)
→ R6: (ready to harvest)
```



##  Test Cases

Tests are written as MeTTa scripts and can be run manually via CLI.

Example:

```bash
metta tests/test_case.metta
```

Includes test of:

* Rule chaining
* Goal satisfaction
* Environment updates

---

## 📚 References

* [ACT-R Cognitive Architecture](https://act-r.psy.cmu.edu/)
* [OpenCog MeTTa Language](https://wiki.opencog.org/w/MeTTa)
* [Hyperon](https://wiki.opencog.org/w/Hyperon)
* [OpenCog AGI Vision](https://opencog.org)

---

## 🤝 Contributing

Feel free to fork, modify, and open a pull request. All contributions are welcome, especially around:

* Visualization
* Learning mechanisms
* AGI-inspired extensions

---

## 📄 License

This project is licensed under the MIT License. See `LICENSE` for details.

---

## ✨ Acknowledgments

Thanks to [OpenCog](https://opencog.org), the [Hyperon](https://wiki.opencog.org/w/Hyperon) team, and cognitive modeling research communities for inspiration.
