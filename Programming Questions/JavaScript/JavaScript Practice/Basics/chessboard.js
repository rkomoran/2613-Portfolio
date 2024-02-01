function chessboard(n) {
    let printer = "";
    for (let i = 0; i < n; i ++) {
        for (let j = 0; j < n; j++) {
            if ((j + i) % 2 === 0) {
                printer += " ";
            }
            else {
                printer += "#";
            }
        }
        printer += "\n";
    }
    return printer;
}

console.log(chessboard(8));