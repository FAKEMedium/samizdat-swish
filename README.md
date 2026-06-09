# Samizdat-Plugin-Swish

Swish payments — an **operator** payment module for [Samizdat](https://fakenews.com).
Used by Samizdat-Plugin-Invoice (helper-guarded) to take payment on invoices.
Extracted from the monorepo with history.

## Layout

    lib/Samizdat/Plugin/Swish.pm        routes + the `swish` helper
    lib/Samizdat/Controller/Swish.pm    request handlers (incl. webhook/callback)
    lib/Samizdat/Model/Swish.pm         payment API client
    lib/Samizdat/resources/templates/swish/    views
    lib/Samizdat/resources/settings/swish/     JSON-Schema config (operator; writeOnly secrets)
    lib/Samizdat/resources/locale/swish/       translations
    lib/Samizdat/resources/migrations/pg/   the `swish` schema (fresh-snapshot migration)

## Dependencies

- **Samizdat** (core) — Cache, settings resolver, the migration loader. Not on CPAN; PERL5LIB or install.
- Mojolicious, Hash::Merge.

## Install

    perl Makefile.PL && make && make test    # core on PERL5LIB
    make install

Enable via `extraplugins: [Swish]` and configure `manager.swish` (API keys/secrets;
certs are deployment secrets, never shipped here).
