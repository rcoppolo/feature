{application, feature, [
	{description, ""},
	{vsn, "0.1.0"},
	{modules, ['feature_app', 'feature_sup']},
	{registered, []},
	{applications, [
		kernel,
		stdlib
	]},
	{mod, {feature_app, []}},
	{env, []}
]}.
