Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200172;
	b=Hvu8BZTJ1oPfrPuAHnzjeEx3TK0N9EqK/Jh7B1QjSpiCAGAatEf9OaUc88j/Ru79Y4IQ
	 vvpYp2kSLz6bS9lkCmV/z5Nlzy/pD44FC7FUFNomflpfnQMRvFku+654VviHE7oumrAAF
	 ubiwWiAdYnsyCCQ3bFs/WOBjlgDLKckyU/RL6ODJMmL5/iJBFUD+DGwcLB/hlDUcM2VS7
	 HpenYMkVgU9IbKjZYQjNgtrwO52Unale61KVRuWpW8wJx7zB7lKf9oJv9pEG0rE8Subvk
	 abqMFDxtaMCUllTelmCERD5rWbtf8V7+HDr36NhALKYCFq5RnP7pp96LiTlK4bQmJ6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200172;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mFDnlXERLO8MOLInvCOfVu1idYsFuRqzUzAZ3rE9BGk=;
	b=5k0iEg4jGKmJRq2xf2tmOSJOn5wtu6wFoPSoiiJEdnLbcNQFTYnf0KKzW4mUpsD10T7s
	 4mr2gHs3VYva8yMiZDCC/rEKXB1yb7vUq756FbTcMhW5y7pO9NHAWRcYZIFlEIEhL91P2
	 trlwfGqbN6Ca7H93Y2zRnqTHD/gXGrU1mT9Fs2+I/0YCmAL1ua3eSVeS5gX9k9fDgl0Mc
	 xq3n4C+IRWr8uO3TPkRivZQtTuY07tTRVwUbFKyg09KIYupgVwWSUwoACUzGlo6WuB74u
	 87z8YRp8yhcrl3CWFpbCoIEow5R5QM2bnwUkuXnYw5I/8WQCUdcl+yw+hwSikXclbxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EftHLRZj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBE460A261D;
	Fri, 20 Nov 2026 18:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EftHLRZj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4CF71F000CA;
	Fri, 20 Nov 2026 18:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795200172;
	bh=mFDnlXERLO8MOLInvCOfVu1idYsFuRqzUzAZ3rE9BGk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EftHLRZjR1mmFo6Tm0DYJhdgFgxLbii5dsZuKEMAPpBa4VBuM5p1LKh9ew9W7wCrz
	 BM6XhPrQLmMEurwsRInMFsbr5SAmPrhG+75bpJvGLcjQjozSruNo3mS53cf9QY5JSn
	 J8y4/O2zrf06PEtoB3TEVxlwE2BV7HQjE2h+sbS/YFklX22NrFA16Klz2AIAB2lrsE
	 4MZYK1Nr9ZK6v73IQlKnT0Zd64seoQGIIXoFAeTF/srknY1aDtEdQLYsk1K9FyEu8Q
	 yQ9Vx/g//T06dvklSiO33pJJz1g4yp2GWPI9UmenfMKo5GMFG4WwUoBmNECCYOad6J
	 RMqoQUEG4bHlw==
Message-ID: <sashiko-outbox-225862@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] clk: toshiba: introduce a TC9564 clock/reset
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120183212.1264522-3-elder@riscstar.com>
References: <20261120183212.1264522-1-elder@riscstar.com>
 <20261120183212.1264522-3-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 18:42:51 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] clk: tc9564: unlocked register read-modify-write in
  reset_manage()
- [Medium] clk: tc9564: missing select RESET_CONTROLLER in
  COMMON_CLK_TC9564
- [Low] clk: tc9564: stale v1 and dt-binding text in commit message
- [Low] clk: tc9564: duplicate clk_gate implementation in
  gate_register()
--

commit c8a057c6e9911108f130ae1447d0fae1c9ba8eff
Author: Alex Elder <elder@kernel.org>

clk: toshiba: introduce a TC9564 clock/reset driver

This commit adds a platform driver for the clock and reset controllers on
the Toshiba TC9564 SoC.

> Define a new platform driver that manages clocks implemented by the
> Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
> and disabled, but currently only the clocks that are (or will soon
> be) used are defined to be controllable.
>=20
> Two registers manage the state of the clocks.  The registers are
> accessed via a regmap supplied by a system controller.  Access to
> the memory region is provided via a BAR on a PCIe endpoint function
> embedded in the TC9564 SoC.
>=20
> Define the binding for the clock and reset controller that present in
> the Toshiba TC9564 SoC.

[Severity: Low]
These first three paragraphs appear to be leftover text from v1 and the
devicetree binding patch: the driver now maps the platform MMIO resource
directly via devm_platform_ioremap_resource() instead of using a syscon
regmap, and the description restarts in the fourth paragraph.

> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 6bfa2c8fffe1b..b27807ee93863 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -185,6 +185,14 @@ config COMMON_CLK_CDCE706
>  	help
>  	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
> =20
> +config COMMON_CLK_TC9564
> +	tristate "Toshiba TC9564 clock and reset support"
> +	depends on TC9564_PCI || COMPILE_TEST
> +	default TC9564_PCI
> +	help
> +	  This enables support for the clock and reset controllers embedded
> +	  in the Toshiba TC9564 SoC.

[Severity: Medium]
Should COMMON_CLK_TC9564 select RESET_CONTROLLER?  Because TC9564 is a
PCIe endpoint device, this driver can be enabled on host architectures
that do not select ARCH_HAS_RESET_CONTROLLER.  When
CONFIG_RESET_CONTROLLER is disabled, devm_reset_controller_register()
compiles to a no-op stub returning 0, silently omitting the reset
controller functionality and causing non-optional reset consumers to fail
with -ENOTSUPP.

> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
> new file mode 100644
> index 0000000000000..65ed524bf2ee7
> --- /dev/null
> +++ b/drivers/clk/clk-tc9564.c

[ ... ]

> +static const struct reset_init reset_init[] =3D {
> +	[RESET_I2C] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.mask =3D BIT(12),
> +	},
> +	[RESET_PCIE] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.mask =3D BIT(9),
> +	},
> +	[RESET_MSIGEN] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.mask =3D BIT(18),
> +	},
> +
> +	[RESET_MAC0_MAC] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.mask =3D BIT(7),
> +	},
> +	[RESET_MAC0_PMA] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.mask =3D BIT(30),
> +	},
> +	[RESET_MAC0_XPCS] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.mask =3D BIT(31),
> +	},
> +
> +	[RESET_MAC1_MAC] =3D {
> +		.offset =3D RESET1_OFFSET,
> +		.mask =3D BIT(7),
> +	},
> +	[RESET_MAC1_PMA] =3D {
> +		.offset =3D RESET1_OFFSET,
> +		.mask =3D BIT(30),
> +	},
> +	[RESET_MAC1_XPCS] =3D {
> +		.offset =3D RESET1_OFFSET,
> +		.mask =3D BIT(31),
> +	},
> +};
> +#define RESET_COUNT	ARRAY_SIZE(reset_init)

[ ... ]

> +static const struct gate_clock *hw_to_gate_clock(struct clk_hw *hw)
> +{
> +	return container_of_const(hw, struct gate_clock, hw);
> +}
> +
> +static int gate_clk_manage(struct clk_hw *hw, bool enable)
> +{
> +	struct tc9564_clock *tc9564_clock =3D dev_get_drvdata(clk_hw_get_dev(hw=
));
> +	const struct gate_clock *clock =3D hw_to_gate_clock(hw);
> +	u32 mask =3D clock->init->mask;
> +	void __iomem *ioaddr;
> +	u32 val;
> +
> +	ioaddr =3D tc9564_clock->ioaddr + clock->init->offset;
> +
> +	val =3D readl(ioaddr);
> +	if (enable)
> +		val |=3D mask;
> +	else
> +		val &=3D ~mask;
> +	writel(val, ioaddr);
> +
> +	return 0;
> +}
> +
> +static int gate_clk_enable(struct clk_hw *hw)
> +{
> +	return gate_clk_manage(hw, true);
> +}
> +
> +static void gate_clk_disable(struct clk_hw *hw)
> +{
> +	(void)gate_clk_manage(hw, false);
> +}
> +
> +static int gate_clk_is_enabled(struct clk_hw *hw)
> +{
> +	struct tc9564_clock *tc9564_clock =3D dev_get_drvdata(clk_hw_get_dev(hw=
));
> +	const struct gate_clock *clock =3D hw_to_gate_clock(hw);
> +	void __iomem *ioaddr;
> +
> +	ioaddr =3D tc9564_clock->ioaddr + clock->init->offset;
> +
> +	return readl(ioaddr) & clock->init->mask ? 1 : 0;
> +}
> +
> +static const struct clk_ops gate_clk_ops =3D {
> +	.enable =3D gate_clk_enable,
> +	.disable =3D gate_clk_disable,
> +	.is_enabled =3D gate_clk_is_enabled,
> +};
> +
> +static struct clk_hw *gate_register(struct device *dev, const char *name,
> +				    const struct clock_init *init)
> +{
> +	struct tc9564_clock *tc9564_clock =3D dev_get_drvdata(dev);
> +	struct clk_init_data clk_init =3D { };
> +	const struct clk_hw *parent_hw;
> +	struct gate_clock *clock;
> +	int ret;
> +
> +	clock =3D devm_kzalloc_obj(dev, *clock);
> +	if (!clock)
> +		return ERR_PTR(-ENOMEM);
> +
> +	parent_hw =3D tc9564_clock->clk_data->hws[init->parent];
> +
> +	clk_init.name =3D name;
> +	clk_init.ops =3D &gate_clk_ops;
> +	clk_init.parent_hws =3D &parent_hw;
> +	clk_init.num_parents =3D 1;
> +	if (init->type =3D=3D CRITICAL_GATE)
> +		clk_init.flags =3D CLK_IS_CRITICAL;
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

[Severity: Low]
This isn't a bug, but now that the driver accesses MMIO registers directly
rather than through regmap, gate_register() and gate_clk_ops duplicate the
standard single-bit MMIO gate implementation.  Using
devm_clk_hw_register_gate_parent_hw() (as pll_register() and
fixed_register() do with the fixed-factor helpers) would allow dropping
struct gate_clock and the custom gate callbacks.

> +
> +/* Warn on requests to assert or deassert critical resets */
> +static bool reset_is_critical(unsigned long id)
> +{
> +	return WARN_ON(id =3D=3D RESET_I2C) || WARN_ON(id =3D=3D RESET_PCIE);
> +}
> +
> +static int reset_manage(struct reset_controller_dev *rcdev,
> +			unsigned long id, bool assert)
> +{
> +	struct tc9564_clock *tc9564_clock =3D dev_get_drvdata(rcdev->dev);
> +	const struct reset_init *reset =3D &reset_init[id];
> +	u32 mask =3D reset->mask;
> +	void __iomem *ioaddr;
> +	u32 val;
> +
> +	if (reset_is_critical(id))
> +		return 0;		/* Just ignore the request */
> +
> +	ioaddr =3D tc9564_clock->ioaddr + reset->offset;
> +
> +	val =3D readl(ioaddr);
> +	if (assert)
> +		val |=3D mask;
> +	else
> +		val &=3D ~mask;
> +	writel(val, ioaddr);
> +
> +	return 0;
> +}

[Severity: Medium]
Can concurrent reset operations on lines sharing RESET0_OFFSET or
RESET1_OFFSET race in reset_manage()?

Unlike the clock framework (which holds enable_lock across enable and
disable callbacks), the reset controller core only acquires a
per-reset-control SRCU read lock in reset_control_assert() and
reset_control_deassert().  Two consumers asserting or deasserting
different resets in the same register (such as RESET_MSIGEN and
RESET_MAC0_MAC in RESET0_OFFSET) can perform concurrent read-modify-write
sequences and overwrite each other's bit changes.  A spinlock in struct
tc9564_clock around the readl()/writel() sequence in reset_manage() would
prevent this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120183212.1264=
522-1-elder@riscstar.com?part=3D2
