const fs = require('fs');
const readline = require('readline');

var directory = './data/';

var api = "API"

var data_c = []

async function processLineByLine(path) {
    const fileStream = fs.createReadStream(path);

    const rl = readline.createInterface({
        input: fileStream,
        crlfDelay: Infinity
    });

    let mydata = '';
    for await (const l of rl) {

        let c = 0,
            maxColumns = 60; // i guess
        let data = [];
        let cid, indid; 
        let yearid=[];

        let line = l;
        let country_ok = false, indicator_ok = false;

        while (true) {
            if (line.indexOf('"') != -1) {
                line = line.slice(line.indexOf('"') + 1);

                if (line.indexOf('"') != -1) {

                    data.push(line.slice(0, line.indexOf('"')));

                    line = line.slice(line.indexOf('"') + 1)

                    // country name and indicator name are skipped
                    if (c == 0 || c == 2) {
                        data.pop();
                    }
                    // country code
                    else if (c == 1) {
                        for (let i = 0; i < countries.rows.length; i++) {
                            if (data[data.length - 1] == countries.rows[i][1]) {
                                country_ok = true;
                                // get the country id from the country table
                                cid = countries.rows[i][0];
                            }
                        }
                        if (!country_ok) {
                            break;
                        } // goto next line
                    }
                    // check indicator code
                    else if (c == 3) {
                        for (let i = 0; i < indicators.rows.length; i++) {
                            if (data[data.length - 1] == indicators.rows[i][1]) {
                                indicator_ok = true;
                                // get the indicator id from the indicator table
                                indid = indicators.rows[i][0];
                            }
                        }
                        if (!indicator_ok) {
                            break;
                        } // goto next line
                    } else {
                        // every api file starts with year 1960
                        let year = 1960 + c - 4;
                        yearid.push(year);
                    }
                    c++;
                } else {
                    break
                }
            } else {
                break
            }
        }

        if( country_ok && indicator_ok ) {

            let data_str = '"' + cid + '","' + indid + '","';// +'",\n';
            for ( let i = 2; i < data.length; i++) {
                mydata += data_str + yearid[i-2] + '","' + data[i]  +'",\n';

            }
        }
    }
    fs.appendFile(directory + '/../transformed/data.csv', mydata, (err) => {
        if (err) throw (err);
    });
}

function process() {

    fs.readdir(directory, (err, files) => {
        if (err) {
            console.log(err)
            return
        }

        files.forEach((f) => {
            // for every api file
            if (f.toLowerCase().startsWith(api.toLowerCase())) {
                path = directory + f
                processLineByLine(path);
            }
        });

        return
    });
}

// script starts here 
var oracledb = require('oracledb');

async function main() {
    // hahha security
    let connection = await oracledb.getConnection({
        user: "pvassil", // [username]
        password: "pvassil", // [password]
        connectString: "localhost:1521/XEPDB1" // [hostname]:[port]/[DB service name]
    });

    let ind_query = `SELECT ID, CODE FROM INDICATOR`;
    let cou_query = `SELECT ID, CODE FROM COUNTRY`;

    // fetch the ids from the database 
    indicators = await connection.execute(ind_query);
    countries = await connection.execute(cou_query);
    process();
}

let indicators, countries;
main();