const fs = require('fs');

var directory = './data/';

var indicator = "Metadata_Indicator";

var data_c = [];

fs.readdir(directory, (err, files) => {
    if (err) {
        // handle error; e.g., folder didn't exist
        console.log(err)
        return
    }

    let f = files[0];
    let idx = 0;
    while (!(f.toLowerCase().startsWith(indicator.toLowerCase())) && idx < files.length - 1) {
        idx++;
        f = files[idx];
    }

    if (f.toLowerCase().startsWith(indicator.toLowerCase())) {
        path = directory + f
        console.log(indicator + " => " + path)

        // For every indicator File, meaning for every INDICATOR
        fs.readFile(path, 'utf8', (err, data) => {
            if (err) {
                console.log(err)
            }
            if (!err) {

                data_c = []

                // Remove junk before actual data
                data = data.slice(data.indexOf('"INDICATOR_CODE"'))

                console.log("-------------")
                while (true) {
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

            let ic, indn, sn, so;

            // Set up correct indexes
            for (let i = 0; i < 4; i++) {
                if (data[i] == 'INDICATOR_CODE') {
                    ic = i
                } else if (data[i] == 'INDICATOR_NAME') {
                    indn = i
                } else if (data[i] == 'SOURCE_NOTE') {
                    sn = i
                } else if (data[i] == 'SOURCE_ORGANIZATION') {
                    so = i
                }

            }

            // "INDICATOR_CODE","INDICATOR_NAME","SOURCE_NOTE","SOURCE_ORGANIZATION",
            //  data[i + 0],  data[i + 1],  data[i + 2],  data[i + 3],  data[i + 4] , i=5..EOF
            // for (let i = 4; i < data.length; i += 4) {
            for (let i = 4; i < 81; i += 4) {

                let ind_string = '"' + data[i + ic] + '","' + data[i + indn] + '","' + data[i + sn] + '","' + data[i + so] + '",\n';
                // Write to transformed_indicators every indicator you found
                fs.appendFile(directory + '/../transformed/indicators.csv', ind_string, (err) => {
                    if (err) throw (err);
                });
            }
        });
    }
});