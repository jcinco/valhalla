// Requirement 1
//
function reverseString(str) {
    if (typeof(str) != "string") 
        console.log("Invalid argument");

    let splitStr = str.split(" ");
    splitStr.reverse();

    let reversedStr = splitStr.join(" ");
    console.log(reversedStr);
}

reverseString("Hello world everyone!");


// Requirement 2
//
function printHighestAndLowest(numArr) {
    if (typeof(numArr) != "array") 
        console.log("Invalid argument");

    let min;
    let max;
    for (let i = 0; i < numArr.length; i++) {
        min = (min == undefined) ? numArr[i] 
            : (min < numArr[i]) ? min : numArr[i];
        max = (max == undefined) ? numArr[i] 
            : (max < numArr[i]) ? numArr[i] : max;
    }
    console.log("Min: " + min +"\nMax: " + max);
}

printHighestAndLowest([1,4,7,9,10,20,90,3, -1]);


// Requirement 3
//
function sortElements(numArr) {
    if (typeof(numArr) != "array") 
        console.log("Invalid arguement");
    
    // opting to use bubble sort over quick sort 
    // for simplicity
    for (let i=0; i < numArr.length; i++) {
        for (let j=0; j < numArr.length; j++) {
            if (numArr[i] < numArr[j]) {
                let greater = numArr[i];
                numArr[i] = numArr[j];
                numArr[j] = greater;
            }
        }
    }

    console.log(numArr);
}

sortElements([1,4,7,9,10,20,90,3, -1]);


// Requirement 4
//
function firstOccurence(str) {
    if (typeof(str) != "string")
        console.log("Invalid arguement");

    for (i = 0; i < str.length; i++) {
        let char = str.charAt(i);
        let nextIndex = i + 1;
        for (j = nextIndex; j < str.length; j++) {
            if (char == str.charAt(j)) {
                console.log(char);
                return;
            }
        }
        char = null;
    }

    console.log('null');
}

firstOccurence('abcdcd');


// Requiement 5
//
function combiYield8(arr) {
    if (typeof(arr) != 'array')     
        console.log("Invalid argument");

    const expected = 8;
    for (i = 0; i < arr.length; i++) {
        for (j = i+1; j < arr.length; j++) {
            let sum = arr[i] + arr[j];
            console.log(sum);
            if (sum == expected) {
                console.log("Yes");
                return;
            }
        }
    }
    console.log("No");
}

combiYield8([7,2,4,6,7]);