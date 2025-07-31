let twoFer = input => {
  let name =
    switch (input) {
    | Some(name) => name
    | None => "you"
    };

  "One for " ++ name ++ ", one for me.";
};
