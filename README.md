# Reproduce Inconsistent Error Message for PowerDNS 4.3

First, start everything.

    docker-compose build
    docker-compose up -d

Install httpie HTTP client for later.

    apt install httpie

Watch the logs until docker-compose startup is ready (maria db takes a while...).

    docker-compose logs -f

Send a request to create a zone with an OPENPGPKEY record containing spaces.

    cat zone-fail | http -vvv POST http://localhost:8081/api/v1/servers/localhost/zones X-API-Key:apikey 

It will show an error message simliar to

    {
        "error": "Record fail.test./OPENPGPKEY 'mG8EXtVIsRMFK4EEACIDAwQSZPNqE4tSxLFJYhX+uabSgMrhOqUizJhk Lx82': Not in expected format (parsed as 'mG8EXtVIsRMFK4EEACIDAwQSZPNqE4tSxLFJYhX+uabSgMrhOqUizJhkLx82')"
    }

Note that the value read back as "parsed as" does not contain spaces, but is otherwise identical. This value works, as can be seen using

    cat zone-ok | http -vvv POST http://localhost:8081/api/v1/servers/localhost/zones X-API-Key:apikey

PowerDNS should either give a different error message or accept OPENPGPKEY records containing spaces.

