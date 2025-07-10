# Users
The idea is to import `user/name/user.nix` for each user on the system.
Alternatively, there is a `user/name/default.nix` that imports the user and the
packages that are normally used by that user (managed by home-manager).
