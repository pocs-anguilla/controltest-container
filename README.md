# CONTROLTEST container

A Docker container for the CONTROLTEST package by:

S. García, A. Fernández, J. Luengo, F. Herrera, Advanced nonparametric tests for multiple comparisons in the design of experiments in computational intelligence and data mining: Experimental Analysis of Power. Information Sciences 180 (2010) 2044–2064. doi:10.1016/j.ins.2009.12.010. 

See:
- https://sci2s.ugr.es/sicidm

## Usage

### Building the image

```bash
git clone https://github.com/pocs-anguilla/controltest-container
cd controltest-container
docker build -t controltest .
```

### Using the image

```bash
docker run --rm -i -v $PWD:/workspace -t controltest input.csv > output.latex
```

## Notes

- CSV files generated with Pandas need to be modified so that the first cell is not empty, otherwise the Java program crashes.
- Ranks start in 0 instead of 1.
