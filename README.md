# district-councillors-data-analysis
This is an analysis repository for Hong Kong District Councillors Data

## Objective

To explore analysis and visualisation approaches for Hong Kong District Councillors data.  

## Data

There hkdc dataset from the [hkdatasets](https://github.com/Hong-Kong-Districts-Info/hkdatasets) package.

## Analysis

The analysis is implemented in R. 

## Repo Structure

```
|   .gitattributes 
|   .gitignore 
|   .Rhistory 
|   collision-data-analysis.Rproj
|   README.md
|   
+---data
|       19codee.xls
|       Accident 2014-2019.xlsx
|       Casualty 2014-2019.xlsx
|       Vehicle 2014-2019.xlsx
|       
+---output
|       number-of-vehicles-by-dc.svg
|       
\---script
    |   main analysis script template.R
    |   read in data.R
    |   
    \---individual-analysis
            collision-number-of-vehicles-by-dc.R
            initital exploration.R
            leaflet exploration.R
            
```

