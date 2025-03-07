# 🌬️ **Wind Turbine Sizing Optimization**  

### 📝 MATLAB Code Using Lagrangian Resolution  
This project optimizes wind turbine design using **Lagrangian multipliers**, considering **budget** and **structural** constraints to maximize efficiency.  

---

## 📌 **Optimization Constraints**  

### 💰 **Budget Constraint**  
- The total cost is determined by:  
  - The **cost per square meter** of the rotor (**€/m²**)  
  - The **cost per 1 m/s of wind speed capture** (**€/m/s**)  
  - A **total budget limit**  

### 🏗 **Structural Stability Constraint**  
- limit the **relation** between:  
  - The **rotor surface area**  
  - The **wind speed**  
- Helps maintain **stability and safety**  

---

## 📌 **Implementation Details**  
- **Mathematical Optimization**: Uses **Lagrangian multipliers** to solve the constrained optimization problem  
- **MATLAB-Based**: Script written in **MATLAB** to compute optimal values for wind turbine design  
- **Key Parameters**: Rotor area, wind speed, cost factors, satbility factors
---

## 🚀 **How to Run the Code**  
1. Open **MATLAB** or **VS Code** with the MATLAB extension  
2. Load the script:  
   ```matlab
   wind_turbine_sizing.m
