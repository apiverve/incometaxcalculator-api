from setuptools import setup, find_packages

setup(
    name='apiverve_incometaxcalculator',
    version='1.2.6',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Income Tax Calculator computes US federal income tax and take-home pay from gross income and filing status. It outputs total tax owed, effective and marginal rates, standard deductions, and net monthly income, can add Social Security and Medicare (FICA) for true take-home pay, and with state=NY adds that state's income tax on the same income.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/incometaxcalculator?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
