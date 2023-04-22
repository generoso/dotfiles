# pass

## Setup

### Generate key (if not done yet)

```
gpg --full-generate-key
```

The key will be generated in the folder `$HOME/.gnupg`.

### Init db

Use the key id as argument of the db initialization.

```
pass init C**************E
```

### Add a password

```
pass add 1a/locker
```

### Show passwords

```
pass 
```

```
Password Store
└── 1a
    └── locker

```

## Use in .gitconfig for credentials

```
[credential "https://repo.url.com"]
  username = myuser
  helper = "!f() { test \"$1\" = get && echo \"password=$(pass mypassname)\"; }; f"
```

See: https://git-scm.com/docs/gitcredentials

