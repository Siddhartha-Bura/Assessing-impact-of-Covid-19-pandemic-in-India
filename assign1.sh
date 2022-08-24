#!/bin/bash
chmod +x neighbor-districts-script.sh
jupyter-nbconvert --ExecutePreprocessor.timeout='None' --execute --clear-output Q1.ipynb
chmod +x edge-generator.sh
jupyter-nbconvert --ExecutePreprocessor.timeout='None' --execute --clear-output Q2.ipynb
chmod +x case-generator.sh
jupyter-nbconvert --ExecutePreprocessor.timeout='None' --execute --clear-output Q3.ipynb
chmod +x peaks-generator.sh
jupyter-nbconvert --ExecutePreprocessor.timeout='None' --execute --clear-output Q4.ipynb
chmod +x vaccinated-count-generator.sh
jupyter-nbconvert --ExecutePreprocessor.timeout='None' --execute --clear-output Q5.ipynb
chmod +x vaccination-population-ratio-generator.sh
jupyter-nbconvert --ExecutePreprocessor.timeout='None' --execute --clear-output Q6.ipynb
chmod +x vaccine-type-ratio-generator.sh
jupyter-nbconvert --ExecutePreprocessor.timeout='None' --execute --clear-output Q7.ipynb
chmod +x vaccinated-ratio-generator.sh
jupyter-nbconvert --ExecutePreprocessor.timeout='None' --execute --clear-output Q8.ipynb
chmod +x complete-vaccination-generator.sh
jupyter-nbconvert --ExecutePreprocessor.timeout='None' --execute --clear-output Q9.ipynb
