const fs = require('fs');

var directory = './data/';

var api = "API"

var data_c = []

fs.readdir(directory, (err, files) => {
    if (err) {
        // handle error; e.g., folder didn't exist
        console.log(err)
        return
    }

    for (let f of files) {

        if (f.toLowerCase().startsWith(api.toLowerCase())) {
            path = directory + f
            console.log(api + " => " + path)

            fs.readFile(path, 'utf8', (err, data) => {
                if (err) {
                    console.log(err)
                }
                if (!err) {

                    data_c = []

                    // Remove junk before actual data, Country Code is a must on every county data file
                    data = data.slice(data.indexOf('"1960"'))

                    console.log("-------------")
                    while (true) {
                        if (data.indexOf('"') != -1) {
                            data = data.slice(data.indexOf('"') + 1)
                            if (data.indexOf('"') != -1) {
                                data_c.push(data.slice(0, data.indexOf('"')))
                                data = data.slice(data.indexOf('"') + 1)

                                let x = parseInt(data_c[data_c.length - 1]);

                                if (!(Number.isInteger(x))) {
                                    return
                                } else {
                                    let pentade = parseInt(x/5) * 5;
                                    let decade = parseInt(x/10) * 10;
                                    let twentade = parseInt(x/20) * 20;
                                    
                                    let years_string = '"' + x + '","' + pentade + '","' + decade + '","' + twentade + '",\n';

                                    fs.appendFile(directory+'/../transformed/years.csv', years_string, (err) => {
                                        if(err)throw(err);
                                    });
                                }
                            } else {
                                break
                            }
                        } else {
                            break
                        }
                    }
                }
            });
        }
        break
    }
});