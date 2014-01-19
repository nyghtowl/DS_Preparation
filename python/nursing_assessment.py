'''
Python Beds Assessment

Challenge to assess nursing home bed data and answer 5 questions

The count of how many censuses were reported
The earliest census date
The latest census date
The ten census dates with the highest number of available beds for that nursing home
The ten census dates with the lowest number of available beds for that nursing home

Assuming - Available Residential Beds encapsulates the Pediatric bed number

Using JSON file run analysis on bed census

Ways to improve 
    - don't use globals
    - zip together the labels and data points in dict for easier searching
'''
import sys
import os.path
import json
import operator
import datetime


DATA_COLUMN_VALUES = {
    'AVAILABLE_BEDS': 24,
    'FACILITY_NAME': 9,
    'CENSUS_DATE': 20,
}


def load_data(load_file):

    with open(load_file, 'r') as f:
        data = json.loads(f.read())

    return data 


def find_facility(facility_name, rows):
    col_name = 'FACILITY_NAME'

    for row in rows:
        if row[DATA_COLUMN_VALUES[col_name]] == facility_name:
            yield row

def subset_data(facility_name, data):

    subset = {}
    subset['meta'] = data['meta']
    subset['data'] = []

    for row in find_facility(facility_name, data['data']):
        subset['data'].append(row)

    # Avoid recreating sub file if it exists
    if not(os.path.isfile(facility_name + '.json')):
        with open(facility_name + '.json', 'w') as sub_file:
            sub_file.write(json.dumps(subset))

    return subset

def convert_date(date):
    d = datetime.datetime.strptime(date, '%Y-%m-%dT%H:%M:%S')
    return d.strftime('%m-%d-%Y')

def results(facility, sub_data):
    data = sub_data['data']
    num_census = len(data)
    col_name_1 = 'CENSUS_DATE'
    col_name_2 = 'AVAILABLE_BEDS'
    bed_dates = [(row[DATA_COLUMN_VALUES[col_name_1]], int(row[DATA_COLUMN_VALUES[col_name_2]])) for row in data]
    date_order = sorted(bed_dates, key=operator.itemgetter(0))
    available_beds = sorted(bed_dates, key=operator.itemgetter(1))

    print("%s reported %d censuses." % (facility, num_census))

    print("Earliest census was taken in %s." % convert_date(date_order[0][0]))
    print("Most recent census was taken in %s." % convert_date(date_order[-1][0]))


    print("The ten census dates with the highest number of available beds for that nursing home in order are:\n")
    for i in range(1,11):
        print(" %s\n" % convert_date(available_beds[-i][0]))

    print("The ten census dates with the lowest number of available beds for that nursing home in order are:\n")
    for i in range(10): 
        print(" %s\n" % convert_date(available_beds[i][0]))


if __name__ == '__main__':

    if len(sys.argv) < 2:
        file_name = 'sub_file.json'
        facility = "St. Peter's Nursing And Rehabilitation Center" 
    elif len(sys.argv) < 3:
        file_name = sys.argv[1]
        facility = "St. Peter's Nursing And Rehabilitation Center" 
    else:
        file_name = sys.argv[1]
        facility = sys.argv[2]

    #prevent multiple loading of data to improve performance
    if file_name.startswith('beds'): 
        data = load_data(file_name)
        sub_data = subset_data(facility, data)
    else:
        sub_data = load_data(file_name)

    results(facility, sub_data)

