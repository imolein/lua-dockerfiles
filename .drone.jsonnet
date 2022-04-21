local steps(ver, os) =
    [
        {
            name: "lua",
            image: "plugins/docker",
            settings: {
                repo: "imolein/lua",
                dry_run: false,
                username : {
                    from_secret: "docker_username"
                },
                password: {
                    from_secret: "docker_token"
                },
                dockerfile: "lua/%s/Dockerfile.%s" % [ver, os],
                tags: ( if os == "alpine" then [
                    "%s-%s" % [ver, os],
                    ver
                ] else [
                    "%s-%s" % [ver, os]
                ])
            }
        }
    ] + ( if os == "alpine" then [
            {
                name: "luarocks",
                image: "plugins/docker",
                settings: {
                    repo: "imolein/luarocks",
                    dry_run: false,
                    username : {
                        from_secret: "docker_username"
                    },
                    password: {
                        from_secret: "docker_token"
                    },
                    tags: [
                        "%s-%s" % [ver, os],
                        ver
                    ],
                    dockerfile: "luarocks/%s/Dockerfile" % ver,
                },
                depends_on: ["lua"]
            }
        ] else [] );

local lua_pipeline(ver, os) =
    {
        kind: "pipeline",
        type: "docker",
        name: "lua%s/%s" % [ver, os],
        trigger: {
            ref: ["refs/heads/master"],
            event: ["push"]
        },
        steps: steps(ver, os)
    };

local cron_pipeline(ver, os) =
    {
        kind: "pipeline",
        type: "docker",
        name: "cron/lua%s/%s" % [ver, os],
        trigger: {
            ref: ["refs/heads/master"],
            event: ["cron"],
            cron: ["monthly_build"]
        },
        steps: steps(ver, os)
    };

local matrix_build = [
    [ "5.1", "alpine" ],
    [ "5.1", "ubuntu" ],
    [ "5.2", "alpine" ],
    [ "5.2", "ubuntu" ],
    [ "5.3", "alpine" ],
    [ "5.3", "ubuntu" ],
    [ "5.4", "alpine" ],
    [ "5.4", "ubuntu" ]
];

[ lua_pipeline(v[0], v[1]) for v in matrix_build ]
+ [ cron_pipeline(v[0], v[1]) for v in matrix_build ]
