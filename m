Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F280F3A16B9;
	Wed, 19 Aug 2026 22:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178465; cv=none; b=N5oubgV7Tx9JRNlHRNGO6KQ4Ld3f7PrR67Q1canX3uPP2OhBMRiy1/lmKF+W+rTxR2mlDL+yt1QpoyKWSCJKQNrYS1c3dHG4ntsntvRNjqpguBs/EyXNSvXcaiovmTz7XBE3xQPcj+AH5KI916K7TTsd1oHX9/9wlbZXfZxkWyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178465; c=relaxed/simple;
	bh=QvNlOnHLe+C8JBHaYmy7OBUcOud+adztlKOKKUhGxjY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qNYM/0C5uPB9xzFGk0YhuPhY9oyBWup/qVz+ktv5we7zXAqe8J2F3YKNHqg3MEiu3QpZ7BYZ5ulbmym5KiNzXqlRDrB2NkSoY8/TI8qcRB7j+4RvIJkw/XvYRMw3GDKd8+O+0ifGPdHdgmU/ANsx6iqY5chnV0FsPsQqmBB0MxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bo9F0Z3d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bo9F0Z3d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5044F1F000E9;
	Wed, 19 Aug 2026 22:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787178463;
	bh=6LSxOce5rlzeDTnS43QfXFd6cR1LR/cvC0JeApVYOI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bo9F0Z3drz+aaFctqSYa7BoMTpmgRefqRGl5dw0udbGGv7tNtmyROOhOoACus3wJy
	 GW0ME1VYDFXUCT2wWuJzjOLn4w6eHfsbZy4J3ORe2yFsYj+/O5qmIzrRHgJQcTTbzD
	 X9l2+yuABZZkr23I0ROA1qzBAe9JnhTVxLuZO0qn7Bbwz50gc7nmi4LFzosZMllA8y
	 t0XRAmP7ti2lF7HYhNZJfBYoxLVNIzfi0WyQb1bsywYQ9T96Qv/kDugjbohZWIcWw3
	 EvGyc+Az4z9vH25CDXkjlNh5oJkz7KJFp/jhzlMr8MfUFUZI6SSbBfyMqx9W/bsGW9
	 hAaF7443wwjGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] clk: en7523: add support for Airoha AN7583 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819221458.30040-4-ansuelsmth@gmail.com>
References: <20260819221458.30040-1-ansuelsmth@gmail.com>
 <20260819221458.30040-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 22:27:42 +0000
Message-Id: <20260819222743.5044F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Critical] The macro `REG_PCIE_HB_RST` is used but never defined, causing=
 a build failure.
- [High] Requesting PCIC resets on AN7583 causes an out-of-bounds read on t=
he `en7581_rst_ofs` array, leading to undefined hardware behavior or memory=
 corruption.

Pre-existing issues:
- [High] Probe error paths cause a use-after-free by mixing `devm_kzalloc` =
with non-devres `clk_hw_register()` for the PCIe clock.
- [High] Read-modify-write operations on shared registers in the reset and =
clock controllers lack spinlocks, causing data races and lost writes.
- [High] The clock `.disable` callback calls `usleep_range()`, which sleeps=
 while holding an IRQ-disabled spinlock.
--

--- Patch [3]: [PATCH v6 3/3] clk: en7523: add support for Airoha AN7583 cl=
ock ---
commit e4983d60cb386b35f51bc20a5f0912039bf92780
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for Airoha AN7583 clock

Add support for Airoha AN7583 clock and reset.

Airoha AN7583 SoC have the same register address of EN7581 but implement
different bits and additional base clocks. Also reset are different with
the introduction of 2 dedicated MDIO line and drop of some reset lines.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 087ff4568124f..493812c683f53 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -505,6 +646,64 @@ static const u16 en751221_rst_map[] =3D {
>  	[EN751221_USB_PHY_P1_RST]	=3D 3 * RST_NR_PER_BANK + 7,
>  };
> =20
> +static const u16 an7583_rst_map[] =3D {
> +	/* RST_CTRL2 */
> +	[AN7583_XPON_PHY_RST]		=3D 0,
> +	[AN7583_GPON_OLT_RST]		=3D 1,
[ ... ]
> +	/* RST_PCIC */
> +	[AN7583_PCIC_PERSTOUT0_RST]	=3D 2 * RST_NR_PER_BANK + 29,
> +	[AN7583_PCIC_PERSTOUT1_RST]	=3D 2 * RST_NR_PER_BANK + 26,
> +};

[Severity: High]
Does this out-of-bounds array access corrupt memory when requesting PCIC re=
sets?

The an7583_rst_map defines these PCIC resets in bank index 2.=20

When en7581_reset_register() is called later in this patch, it is passed
the en7581_rst_ofs array:

	static const u16 en7581_rst_ofs[] =3D {
		REG_RST_CTRL2,
		REG_RST_CTRL1,
	};

Since en7581_rst_ofs only has 2 elements, when en7523_reset_update()
dynamically calculates the bank index via id / RST_NR_PER_BANK, it evaluates
to 2. Accessing bank_ofs[2] will read out of bounds.

[ ... ]
> +static int an7583_clk_hw_init(struct platform_device *pdev,
> +			      struct clk_hw_onecell_data *clk_data)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct regmap *map;
> +	void __iomem *base;
> +	u32 val;
> +
> +	map =3D syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu"=
);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	en7581_register_clocks(dev, clk_data, map, base);

[Severity: High]
This isn't a bug introduced by this patch, but does the probe error path le=
ave
us with a use-after-free for the PCIe clock?

In en7523_register_pcie_clk() which is called by en7581_register_clocks(),
the clk_hw structure is allocated via devm_kzalloc(), but registered with t=
he
non-devres clk_hw_register():

	cg =3D devm_kzalloc(dev, sizeof(*cg), GFP_KERNEL);
	...
	if (clk_hw_register(dev, &cg->hw))

If a subsequent initialization step fails in en7523_clk_probe() (like hw_in=
it=20
returning an error), the driver core automatically frees the memory via dev=
res,
but the clock framework retains dangling pointers to the freed clk_hw.

> +
> +	val =3D readl(base + REG_RST_CTRL1);
> +	val |=3D REG_PCIE_HB_RST;

[Severity: Critical]
Will this break the build due to an undefined macro?

The REG_PCIE_HB_RST macro is not defined anywhere. The existing code seems
to use REG_RESET_CONTROL_PCIEHB for this bit instead.

[Severity: High]
This is a pre-existing issue, but could this unlocked read-modify-write race
with the reset framework?

en7523_pci_prepare() modifies REG_RESET_CONTROL1 (0x834) without any locks:

	val =3D readl(np_base + REG_RESET_CONTROL1);
	mask =3D REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
	       REG_RESET_CONTROL_PCIEHB;
	writel(val & ~mask, np_base + REG_RESET_CONTROL1);

Concurrently, en7523_reset_update() performs an unlocked read-modify-write
on the same register (REG_RST_CTRL1 is also 0x834):

	val =3D readl(addr);
	if (assert)
		val |=3D BIT(id % RST_NR_PER_BANK);
	...
	writel(val, addr);

Since .prepare() runs in process context and resets can be triggered by
other probing devices concurrently, this seems likely to cause lost writes.

> +	writel(val, base + REG_RST_CTRL1);
> +	val &=3D ~REG_PCIE_HB_RST;
> +	writel(val, base + REG_RST_CTRL1);
> +
> +	return en7581_reset_register(dev, base, an7583_rst_map,
> +				     ARRAY_SIZE(an7583_rst_map),
> +				     en7581_rst_ofs);
> +}
[ ... ]
> +static const struct en_clk_soc_data an7583_data =3D {
> +	.base_clks =3D an7583_base_clks,
> +	/* We increment num_clocks by 1 to account for additional PCIe clock */
> +	.num_clocks =3D ARRAY_SIZE(an7583_base_clks) + 1,
> +	.pcie_ops =3D {
> +		.is_enabled =3D en7581_pci_is_enabled,
> +		.enable =3D en7581_pci_enable,
> +		.disable =3D en7581_pci_disable,
> +	},

[Severity: High]
This isn't a bug introduced by this patch, but does mapping en7581_pci_disa=
ble
to the .disable callback result in sleeping while in an atomic context?

The core clock framework invokes .disable callbacks with the enable_lock
spinlock held and hardware interrupts disabled.

However, en7581_pci_disable() explicitly yields and sleeps:

	writel(val & ~mask, np_base + REG_PCI_CONTROL);
	usleep_range(1000, 2000);

Could this cause a scheduling while atomic panic when the PCIe clock is
disabled?

> +	.hw_init =3D an7583_clk_hw_init,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819221458.3004=
0-1-ansuelsmth@gmail.com?part=3D3
