const fs = require('fs');

var directory = './data/';

var country = "Metadata_Country"

var data_c = []

fs.readdir(directory, (err, files) => {
    if (err) {
        // handle error; e.g., folder didn't exist
        console.log(err)
        return
    }

    files.forEach((f) => {

        if (f.toLowerCase().startsWith(country.toLowerCase())) {
            path = directory + f
            console.log(country + " => " + path)

            // For every Country File, meaning for every country
            fs.readFile(path, 'utf8', (err, data) => {
                if (err) {
                    console.log(err)
                }

                // Get the data into the data[] array
                if (!err) {

                    data_c = []

                    // Remove junk before actual data, Country Code is a must on every county data file
                    data = data.slice(data.indexOf('"Country Code"'))

                    console.log("-------------")
                    while(true){    
                        if (data.indexOf('"') != -1) {
                            data = data.slice(data.indexOf('"') + 1)

                            if (data.indexOf('"') != -1) {
                                data_c.push(data.slice(0, data.indexOf('"')))
                                data = data.slice(data.indexOf('"') + 1)
                            } else {
                                break
                            }
                        } else {
                            break
                        }
                    }
                }

                data = data_c

                let cc, cn, rg, sn, ig;
                
                // Set up correct indexes
                for (let i = 0; i < 5; i++) {
                    if (data[i] == 'Country Code') {
                        cc = i
                    } else if (data[i] == 'TableName') {
                        cn = i
                    } else if (data[i] == 'Region') {
                        rg = i
                    } else if (data[i] == 'SpecialNotes') {
                        sn = i
                    } else if (data[i] == 'IncomeGroup') {
                        ig = i
                    }

                }

                // "Country Code","Region","IncomeGroup","TableName","SpecialNotes",
                //  data[i + 0],  data[i + 1],  data[i + 2],  data[i + 3],  data[i + 4] , i=5..EOF
                for (let i = 5; i < data.length; i += 5) {

                    let country_string = '"' + data[i + cc] + '","' + data[i + rg] + '","' + data[i + ig] + '","' + data[i + cn] + '","' + data[i + sn] + '",\n';

                    // Write to transformed_countries every country you found
                    fs.appendFile(directory+'/../transformed/countries.csv', country_string, (err) => {
                        if(err)throw(err);
                    });
                }   
            });
        }
    });
});
