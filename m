Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753675;
	b=n05qHP3G9FJ4AzaV8n0MEep4HkVqncPmQzb/krAIuNsb/0DSZ65kO4jpq9XB8/nS5UYM
	 5wZs2MoS6qXn+ZFxoQI71+pRDx37A989EgZXir2E+eU/4Dm1iXO7RnMAiPtFCLygr84j/
	 WbyQiTB1hjPZZC+sKEPZka/aRvChMnK2XJe5UBXgsfFsKLIGSXNDutmaqVN3ragfJERe9
	 44tOztS8AaDSLt39bfY2yBnMQzawszoYCxcTx/Izd/XXQpokvUPkahkZWI2xhGPRrdlIu
	 TSatAmuKHfn6tFgUQdQFRaj+f2WIhJvqDI3CGBWmcAW8ZTNLjN9aLPRzqnfAs0fcE9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753675;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rECYDe2ipfnRxAeupQxLBOt8FlJwyz9vJwvIRBDXdNA=;
	b=zPPEE4g87GgunkVgsUVOI5419mrIkR9LK4jVx8quKe3PdKU+pn0/+Bxakn9zKMTkJmMM
	 wx2hJOz5n0kLF3jCKMZ7w2XRczcVwCcPzr3JRoWpN1x+dJVDONJH4DMSWxC+2fwoIHMQm
	 T31tVVWDhG7fhFilxPF171kdOhi+vfmHDwTztRFeq8WpE8Pt24seNF/kJtZUZH3eD/2y5
	 mUcwuhBJSpVq7dU0t/TBoCsibgBj0w7of+GXh6JZqlw/2xhDVUnG3hTX4+luBsWihg+Kn
	 v73lMfREUZbba5diD2IsOAwA2Tphlk4JeoyWp3e8g56eVHu5RcvACm8dHiVM+gE8ZaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emulxxuy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C045D606A328;
	Wed,  4 Nov 2026 00:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emulxxuy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284BF1F000C1;
	Wed,  4 Nov 2026 00:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793753674;
	bh=rECYDe2ipfnRxAeupQxLBOt8FlJwyz9vJwvIRBDXdNA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=emulxxuyRkEKQkzhfVDQL3OCglznXmO7xMIQ3V31IaXcFBh9nTo/9wg3PKRozmwpy
	 p0twarU5TyhCvAQWZtKE8h8hXvLl/Bivwvqqktt22/smsaJbbMb3zt9puHc0L/cMrd
	 q0AFOWYV5Q32zADX7Q6u9WiFX4cLIzWCpxKUYj3AkDy46luvKhrk1gTdcZ2jhY6lr6
	 9kOw07e3M78M5wg3Cy/pbCKH0LOsUEB9xQlbvs/2MWaXZhUS8sGbdJuuSDat6xoSDb
	 /XIn7YcB+XA3UTUvURPWL3MWUFrWKixarhIHCR1jQQCYZo8fLMONAS3b2qSyFP2Thq
	 RW/eNpFkfpkGg==
Message-ID: <sashiko-outbox-196325@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104004332.2141282-4-elder@riscstar.com>
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-4-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 00:54:33 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: tc9564: duplicate clock names across chips due to using dev->=
id
- [High] clk: tc9564: uninitialized clk_data->num in tc9564_clk_probe()
--

commit d0d52063b982041aca91451199195cd79995784b
Author: Alex Elder <elder@riscstar.com>

clk: toshiba: introduce a TC9564 SoC clock driver

This commit adds a platform clock driver for the Toshiba TC9564 SoC,
registering its PLL, fixed-factor, and gate clocks via a syscon regmap.

> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
> new file mode 100644
> index 0000000000000..8eeba85919703
> --- /dev/null
> +++ b/drivers/clk/clk-tc9564.c
> @@ -0,0 +1,288 @@

[ ... ]

> +/*
> + * The full name of every clock has a prefix "tc9564" followed by a sing=
le
> + * character ('a', 'b', etc.) that differs for each chip/device number.
> + * Each clock's "name" defines the unique portion of the clock's full na=
me.
> + */
> +#define FULL_NAME_SIZE	24	/* Enough for formatted full name */
> +#define NAME_SIZE	12	/* Unique portion of the clock name */
> +#define FORMAT_FULL_NAME(_full_name, _id, _name)		\
> +	snprintf(_full_name, FULL_NAME_SIZE, "tc9564%c_%.*s",	\
> +		'a' + (_id), NAME_SIZE, _name)

[ ... ]

> +/* Parent is the input oscillator running at 25 MHz; PLL runs at 1250 MH=
z */
> +static struct clk_hw *pll_register(struct device *dev,
> +				   const struct clock_init *init)
> +{
> +	char full_name[FULL_NAME_SIZE];
> +
> +	FORMAT_FULL_NAME(full_name, dev->id, init->name);
> +
> +	return devm_clk_hw_register_fixed_factor_index(dev, full_name, 0, 0,
> +						       init->mult, 1);
> +}
> +
> +/* The PLL is the parent of all fixed clocks */
> +static struct clk_hw *fixed_register(struct device *dev,
> +				     const struct clock_init *init)
> +{
> +	struct tc9564_clock *tc9564_clock =3D dev_get_drvdata(dev);
> +	char full_name[FULL_NAME_SIZE];
> +	struct clk_hw *pll_hw;
> +
> +	FORMAT_FULL_NAME(full_name, dev->id, init->name);

[ ... ]

> +static struct clk_hw *gate_register(struct device *dev,
> +				    const struct clock_init *init)
> +{
> +	struct tc9564_clock *tc9564_clock =3D dev_get_drvdata(dev);
> +	struct clk_init_data clk_init =3D { };
> +	const struct clk_hw *parent_hw;
> +	char full_name[FULL_NAME_SIZE];
> +	struct gate_clock *clock;
> +	int ret;
> +
> +	clock =3D devm_kzalloc_obj(dev, *clock);
> +	if (!clock)
> +		return ERR_PTR(-ENOMEM);
> +
> +	FORMAT_FULL_NAME(full_name, dev->id, init->name);

[Severity: High]
Will passing dev->id to FORMAT_FULL_NAME() in pll_register(),
fixed_register(), and gate_register() cause clock registration to fail with
-EEXIST when more than one TC9564 device is present?

The clock MFD cell is registered as a platform device in
tc9564_config_syscon_probe():

drivers/soc/toshiba/tc9564-syscon.c:tc9564_config_syscon_probe() {
	...
	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
				    tc9564_config_syscon_cells,
				    ARRAY_SIZE(tc9564_config_syscon_cells),
				    NULL, 0, NULL);
}

For platform devices, the platform bus stores the instance ID in pdev->id
(struct platform_device::id), while dev->id (struct device::id) is never set
and remains 0 for every instance. As a result, every TC9564 device formats
its clocks with the "tc9564a_" prefix (such as "tc9564a_PLL"), so probing a
second TC9564 device collides in __clk_core_init() when registering its
clocks in the global clock namespace.

Note that pdev->id cannot be passed directly to 'a' + (_id) either, because
PLATFORM_DEVID_AUTO allocates IDs from the system-wide platform_devid_ida
shared across all auto-numbered platform devices rather than a 0-based
per-chip index.

> +
> +	parent_hw =3D tc9564_clock->clk_data->hws[init->parent];
> +
> +	clk_init.name =3D full_name;
> +	clk_init.ops =3D &gate_clk_ops;
> +	clk_init.parent_hws =3D &parent_hw;
> +	clk_init.num_parents =3D 1;
> +
> +	clock->hw.init =3D &clk_init;
> +	clock->init =3D init;
> +
> +	ret =3D devm_clk_hw_register(dev, &clock->hw);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return &clock->hw;
> +}
> +
> +static int tc9564_clk_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	struct tc9564_clock *tc9564_clock;
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *parent_np;
> +	int ret;
> +
> +	parent_np =3D dev_of_node(dev->parent);
> +	if (!parent_np)
> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
> +
> +	tc9564_clock =3D devm_kzalloc_obj(dev, *tc9564_clock);
> +	if (!tc9564_clock)
> +		return -ENOMEM;
> +
> +	/* Note: MMIO regmap (no error checking needed when used) */
> +	tc9564_clock->regmap =3D device_node_to_regmap(parent_np);
> +	if (IS_ERR(tc9564_clock->regmap))
> +		return dev_err_probe(dev, PTR_ERR(tc9564_clock->regmap),
> +				     "failed to get config regmap\n");
> +
> +	clk_data =3D devm_kzalloc_flex(dev, *tc9564_clock->clk_data, hws,
> +				     CLOCK_COUNT);
> +	if (!clk_data)
> +		return -ENOMEM;
> +	tc9564_clock->clk_data =3D clk_data;
> +
> +	dev_set_drvdata(dev, tc9564_clock);
> +
> +	/* Initialize all the clocks */
> +	for (u32 i =3D 0; i < clk_data->num; i++) {

[Severity: High]
Does clk_data->num remain 0 in tc9564_clk_probe() when building with
compilers that do not support __builtin_counted_by_ref?

devm_kzalloc_flex() populates the __counted_by counter via
__set_flex_counter():

include/linux/compiler_types.h:
#if __has_builtin(__builtin_counted_by_ref) && \
    !defined(CONFIG_CC_HAS_BROKEN_COUNTED_BY_REF)
#define __flex_counter(FAM)	__builtin_counted_by_ref(FAM)
#else
#define __flex_counter(FAM)	((void *)NULL)
#endif

include/linux/overflow.h:
#define __set_flex_counter(FAM, COUNT)				\
({								\
	*_Generic(__flex_counter(FAM),				\
		  void *:  &(size_t){ 0 },			\
		  default: __flex_counter(FAM)) =3D (COUNT);	\
})

On compilers without a working __builtin_counted_by_ref (such as GCC < 15.1
or Clang < 22.1), __set_flex_counter() writes COUNT into a temporary compou=
nd
literal and leaves clk_data->num as 0. Without an explicit
clk_data->num =3D CLOCK_COUNT assignment, the loop in tc9564_clk_probe()
registers zero clocks and of_clk_hw_onecell_get() rejects all clock lookups
with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104004332.2141=
282-1-elder@riscstar.com?part=3D3
