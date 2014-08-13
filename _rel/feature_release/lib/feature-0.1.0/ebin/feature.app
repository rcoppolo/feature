{application, feature, [
	{description, "Feature switch server!"},
	{vsn, "0.1.0"},
	{modules, ['feature_app', 'feature_handler', 'feature_sup']},
	{registered, []},
	{applications, [
		kernel,
		stdlib,
		cowboy
	]},
	{mod, {feature_app, []}},
	{env, []}
]}.
