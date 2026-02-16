from setuptools import setup, find_packages

setup(
    name='apiverve_incometaxcalculator',
    version='1.1.14',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Income Tax Calculator is a tool for calculating US federal income tax. It takes your income, filing status, and year to compute your total tax, effective rate, marginal rate, and a full bracket-by-bracket breakdown.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/incometaxcalculator?utm_source=pypi&utm_medium=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
