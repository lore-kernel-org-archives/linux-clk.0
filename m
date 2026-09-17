Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E214AA00A;
	Thu, 17 Sep 2026 22:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685517; cv=none; b=gh/+gjtXWkK3vI9G7H14hwgCrZxT5Pfe5B534ZPufPbqGsfuaqZHcgtL4OD+IVNFAQeXv30YqTIGf1mzU5SNW2Sv6PpHIbkJL9GVzcRiiEi4LKVwHqqFNoR02egagY1RQua6ROP/sLC6/2k9Fy2AGns+6kyPj0/fqYo6QJ8akIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685517; c=relaxed/simple;
	bh=sNPcq2hT3Xd1NyT6saBFJAzQ2ZPltsKbzaOc/rTj7Nw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vEcIglDwtGlpU21ye1EnmbcQGIowj/ZV1D6f4o5Zus9WKjwhzOJ6us0F0LgiaOY14an8ZRKctmm4px3PPQZZD59zDB/k4MtU+Tt5wyGq0iWNgc53Jlsx3vOCsvEZMKM4XGo3UsFMRRTUDgNaT8uq4/p6OQAWiC+WZxdzpUcTX2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmQlNGri; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmQlNGri"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2853B1F000FF;
	Thu, 17 Sep 2026 22:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685515;
	bh=o4QNi20SXGPTtwb1JJoB7JlYCuWecUAL1k8e24nhnJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OmQlNGri0fQOfFoTjLUvLmn/GoRysEDJIPVwbXzHlR9LXyxGNs1IvaqUujSVkBFQf
	 lDSNFEXbjY0eb9zahVon+7aefZ1mCan/o5gGtBJEKcYkzrKQDqPBKUBb6cAAtBZ4ZW
	 PyKyMuEL1mQjJSxJazYA90GeYS+PKBeOEhOG7GKBKrJmFWnHmcxeUdbKEp1OM9R+jx
	 GPGplThJEPG4RZW/TNujlw0GxM/iuSdfTU6lpwxN4wMtVMf1h2kNMLZArg+5TPjky/
	 PH6BesyP7+UI3Gy3Y+aOt/2RxN7oky8tnr10x9f2hLxAhZ0z4rm3o6lkQv/u8OQcsE
	 nNCBeNe0k62+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] clk: sunxi-ng: add support for the A523/T527 CPU
 CCU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917223913.1855301-5-andre.przywara@arm.com>
References: <20260917223913.1855301-1-andre.przywara@arm.com>
 <20260917223913.1855301-5-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 22:51:54 +0000
Message-Id: <20260917225155.2853B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] clk: sunxi-ng: probe modifies active CPU PLL dividers without repa=
renting
- [High] clk: sunxi-ng: missing mux notifier for DSU PLL rate changes
- [High] clk: sunxi-ng: UAF on module unload due to unregistered notifiers
- [Medium] kconfig: SUN55I_A523_CPU_CCU inappropriately uses default y
- [Medium] clk: sunxi-ng: modeling non-existent divider for DSU mux
- [Medium] clk: sunxi-ng: probe enables PLLs without polling the lock bit
- [Medium] clk: sunxi-ng: ignored return values from ccu_mux_notifier_regis=
ter()
- [Medium] clk: sunxi-ng: race condition exposing clocks before notifiers a=
re attached
- [Medium] clk: sunxi-ng: missing MODULE_DEVICE_TABLE breaks module autoloa=
ding
--

commit 719a9a0732629f9d936e50d92e8a19aea0aef6c5
Author: Andre Przywara <andre.przywara@arm.com>

clk: sunxi-ng: add support for the A523/T527 CPU CCU

This commit adds support for the Allwinner A523/T527 CPU CCU, managing the=
=20
clock controllers for the CPU clusters and the DSU. It defines the PLLs=20
used to drive the core frequencies and their relations, allowing the kernel=
=20
to adjust the core frequency dynamically.

> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
> index 6af2d020e03e9..c34af60139124 100644
> --- a/drivers/clk/sunxi-ng/Kconfig
> +++ b/drivers/clk/sunxi-ng/Kconfig
> @@ -67,6 +67,11 @@ config SUN55I_A523_R_CCU
>  	default ARCH_SUNXI
>  	depends on ARM64 || COMPILE_TEST
> =20
> +config SUN55I_A523_CPU_CCU
> +	tristate "Support for the Allwinner A523/T527 CPU CCU"
> +	default y
> +	depends on ARM64 || COMPILE_TEST

[Severity: Medium]
Is it intended to use "default y" here?=20

Normally, SoC-specific drivers follow the subsystem convention of=20
"default ARCH_SUNXI". This will unconditionally enable the driver on all=20
ARM64 builds, causing defconfig pollution on arm64 multi-platform builds.

[ ... ]

> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c b/drivers/clk/sun=
xi-ng/ccu-sun55i-a523-cpu.c
> new file mode 100644
> index 0000000000000..e505aefc92370
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c

[ ... ]

> +static SUNXI_CCU_MP_DATA_WITH_MUX(pll_cpu_l_div_clk, "pll-cpu-l-div",
> +				  pll_cpu_l_hws, 0x060,
> +				  0, 0,		/* no M */
> +				  16, 2,	/* P */
> +				  0, 0,		/* no mux */
> +				  CLK_SET_RATE_PARENT);		/* flags */
> +static SUNXI_CCU_MP_DATA_WITH_MUX(pll_cpu_b_div_clk, "pll-cpu-b-div",
> +				  pll_cpu_b_hws, 0x064,
> +				  0, 0,		/* no M */
> +				  16, 2,	/* P */
> +				  0, 0,		/* no mux */
> +				  CLK_SET_RATE_PARENT);		/* flags */
> +static SUNXI_CCU_MP_DATA_WITH_MUX(pll_cpu_dsu_div_clk, "pll-cpu-dsu-div",
> +				  pll_cpu_dsu_hws, 0x06c,
> +				  0, 0,		/* no M */
> +				  16, 2,	/* P */
> +				  0, 0,		/* no mux */
> +				  CLK_SET_RATE_PARENT);		/* flags */

[Severity: Medium]
Is it correct to model a P divider here extracting bits 17:16 for the DSU?

The block comment at the top of the file explicitly states "For PLL1 and PL=
L3
there is an additional shift field... although that applies only to the PLL=
...",
which implies it does not exist for the DSU (PLL2). Manipulating a non-exis=
tent
hardware field could cause issues in frequency calculations.

[ ... ]

> +static int sun55i_a523_cpu_ccu_probe(struct platform_device *pdev)
> +{
> +	const struct sunxi_ccu_desc *desc;
> +	void __iomem *reg;
> +	int i, ret;
> +	u32 val;
> +
> +	desc =3D of_device_get_match_data(&pdev->dev);
> +	if (!desc)
> +		return -EINVAL;
> +
> +	reg =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(reg))
> +		return PTR_ERR(reg);
> +
> +	/*
> +	 * The user manual recommends to keep the PLLs running, and just
> +	 * gate their output if they are not needed, to avoid interference
> +	 * with other PLLs, since they share a power domain.
> +	 * To comply with this, we use this output gate as the CCF enable bit,
> +	 * so we need to enable all PLLs here. Chances are the bootloader has
> +	 * already enabled at least one PLL, so check if it's already running
> +	 * and locked, before touching it.
> +	 * We set the enable, the LDO and the lock bits, and clear dividers.
> +	 */
> +	for (i =3D 0; i < ARRAY_SIZE(pll_regs); i++) {
> +		val =3D readl(reg + pll_regs[i]);
> +		if ((val & GENMASK(31, 28)) !=3D GENMASK(31, 28)) {
> +			val |=3D BIT(31) | BIT(30) | BIT(29) | BIT(26);
> +			val &=3D ~GENMASK(21, 16); /* covering PLL_P and PLL_M0 */

[Severity: High]
Could modifying these dividers cause a hardware crash?=20

If the bootloader leaves the PLL active but misses a control bit (e.g., bit=
 30),
this code instantly clears the P and M0 dividers. Modifying active dividers=
=20
without first reparenting the CPU clock to a bypass might hang the system.=
=20
Also, if the bootloader setup completely matches the lock mask, this block =
is=20
skipped, leaving P and M0 uncleared, but the software CCF model blindly=20
assumes they are 1.

> +			writel(val, reg + pll_regs[i]);
> +		}

[Severity: Medium]
Does this code need to poll the lock bit (BIT(28)) before proceeding?

The code sets BIT(31) to physically enable the PLLs in the CCU but doesn't
wait for the hardware lock to assert. The CCF enable op only toggles the ou=
tput
gate, which could silently pass an unlocked PLL to a CPU core.

> +	}
> +
> +	ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, desc);
> +	if (ret)
> +		return ret;
> +
> +	/* Reparent CPU during CPU PLL rate changes */
> +	ccu_mux_notifier_register(pll_cpu_l_clk.common.hw.clk,
> +				  &sun55i_a523_cpu_l_nb);

[Severity: Medium]
Is there a race condition exposing clocks before the notifiers are attached?

devm_sunxi_ccu_probe() registers the clocks globally, making them accessibl=
e.
Since the reparenting notifiers are attached after this step, a fast consum=
er
could modify the frequency before the reparenting protection is active.

[Severity: Medium]
Is it safe to ignore the return values of ccu_mux_notifier_register()?

If the internal memory allocation fails, a subsequent cpufreq rate change
could attempt to scale the PLL without reparenting, which could lock up
the CPU.

[Severity: High]
Since this module registers static notifiers, could it cause a use-after-fr=
ee
on module unload?

There doesn't appear to be a .remove callback to call
clk_notifier_unregister(). If the module is unloaded, the CCF notifier list
would retain dangling pointers.

> +	ccu_mux_notifier_register(pll_cpu_b_clk.common.hw.clk,
> +				  &sun55i_a523_cpu_b_nb);

[Severity: High]
Should there be a mux notifier registered for the DSU PLL as well?

If a DVFS rate change forces the DSU clock to relock, it could output an
unstable clock. CPU clusters are protected by the dynamic reparenting
notifiers above, but the DSU seems to be missing its corresponding notifier.

> +
> +	return ret;
> +}
> +
> +static const struct of_device_id sun55i_a523_cpu_ccu_ids[] =3D {
> +	{
> +		.compatible =3D "allwinner,sun55i-a523-cpu-ccu",
> +		.data =3D &sun55i_a523_cpu_ccu_desc,
> +	},
> +	{ }
> +};

[Severity: Medium]
Is this missing a MODULE_DEVICE_TABLE(of, sun55i_a523_cpu_ccu_ids) declarat=
ion?

Compiling the driver as a tristate module without exporting the device ID t=
able
prevents the module alias from being emitted, breaking udev autoloading.

> +
> +static struct platform_driver sun55i_a523_cpu_ccu_driver =3D {
> +	.probe	=3D sun55i_a523_cpu_ccu_probe,
> +	.driver	=3D {
> +		.name			=3D "sun55i-a523-cpu-ccu",
> +		.suppress_bind_attrs	=3D true,
> +		.of_match_table		=3D sun55i_a523_cpu_ccu_ids,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917223913.1855=
301-1-andre.przywara@arm.com?part=3D4
