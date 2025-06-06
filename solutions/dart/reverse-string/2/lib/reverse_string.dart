String reverse(String input) =>
    input.split('').fold([], (rev, char) => rev..insert(0, char)).join('');
