Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399061;
	b=ctSVLnGVvzCRdILc1QyGkdbRSZdSJNnsiGVrL5c6dSDt318zymh6nkrS34a4eCjM9iNa
	 VgZYdMCKmA0vWZU5KK6fNoWZs+PihVQLYoDDTzTo3TXVK9eBs/eZF2UgNMqJ/DsszOqpC
	 YGwY7hHqXGt6oBDlR0G/dJOJFs1lmFWTguZKOsuvwXATBXeENVYRqrTvMJQuqFejcEn2D
	 FMHDhDvSGDpF7d+Zo1jGwfc70J9sjK91YTRfcmnF983JACdgTtiLjClXlFm6fDedaAGQg
	 W6Swg+DenEW2IrDfaJta/TsXemz0vI+qksNsID+eKf9osm0nyFHmd01NCRrxKb5AuyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399061;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P8yu7ALgBn94BFGQ10a/jOsyKGGf2b1WAznGMAxwekU=;
	b=vtUyCPUXmc+1KOL6PhMjQ2SMs6LZXzKPB0+hea4YdhgwLhgMri+RoHl79Efb+Ci/aIYZ
	 txuW4w6uy9U2/yKmF5HzgMduJVW4QPSpdrCH40FxHBnUMPbExwYtMCg79zwE3aODNgjnR
	 LW7Hkq+yFgHQNl9yoEYLMUggmxftMV95T3sIN4jSm0XYO2elv/GE7Vay6a/bOqv7JzWGA
	 +i8bDExjSflpu9m0DOBFvGrsY/2KBtCIUOu6PbqD14CAJ+pHY8YnzuaobyNANdegRL5CP
	 SsFNBzPIPP0mvYTdWE+3ie/d/VifeYy5BIbA4RK5MsU+ULPb5UPMHyHYnexDtjOlDLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="g7ES1l5/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE8B606A31A;
	Mon, 23 Nov 2026 01:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g7ES1l5/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4801F000CA;
	Mon, 23 Nov 2026 01:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795399060;
	bh=P8yu7ALgBn94BFGQ10a/jOsyKGGf2b1WAznGMAxwekU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g7ES1l5/+WuKNvSrLxSLbDOFaO9HLWn10WI6xK1PWMyZVzrSP4u6cTQk+/DR35jgr
	 B3z/BueZ1Yd7w5nX7JxtSlx4YS1kNpK6vWugoSD0eUlkU75I0PtfBbw+Eth/THJuOW
	 /8Q8+QZnfzos7h3IhcJILdzMirZGdGFqcLv4xtGd3M9DasUxDy/jv4OoYhJ554EK9T
	 slxeSwbhOh85/+/2FYfDOFN3zKH+4gxXn5pTMdfXOGLJO4KrOMexgPpjUtOwfZua9s
	 TaamZWJtPm9CRbzlaHdDUY8ybryprtRTA5XW2h37i67pG3Ws/+ug/ulAfWSCFa4uOd
	 wkKozR16vUwxw==
Message-ID: <sashiko-outbox-228538@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] clk: siflower: Add SF19A2890 clock manager
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122-sf19a2890-sysm-v4-2-bbfe1c495e2e@telaak.dev>
References: <20261122-sf19a2890-sysm-v4-0-bbfe1c495e2e@telaak.dev>
 <20261122-sf19a2890-sysm-v4-2-bbfe1c495e2e@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 01:57:39 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] clk: siflower: missing provider update in
  sf19a2890_clk_probe()
- [Low] clk: siflower: Kconfig depends on undefined MACH_SIFLOWER_MIPS
--

commit 9f005e02da5b51c2e50e528140d38bbfbcf12e37
Author: Chuanhong Guo <gch981213@gmail.com>

clk: siflower: Add SF19A2890 clock manager driver

This commit adds a clock manager driver for the Siflower SF19A2890 SoC,
registering the CPU clock and its PLLs early via CLK_OF_DECLARE_DRIVER
and the remaining muxdiv clocks from a platform driver.

> diff --git a/drivers/clk/siflower/Kconfig b/drivers/clk/siflower/Kconfig
> new file mode 100644
> index 0000000000000..ad1b04b4bb9b2
> --- /dev/null
> +++ b/drivers/clk/siflower/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config CLK_SF19A2890
> +	bool "Clock driver for Siflower SF19A2890"
> +	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
> +	default MACH_SIFLOWER_MIPS

[Severity: Low]
Is MACH_SIFLOWER_MIPS defined in the tree?  Without it, CLK_SF19A2890
can only be enabled when COMPILE_TEST is set and defaults to n.

> diff --git a/drivers/clk/siflower/clk-sf19a2890.c b/drivers/clk/siflower/=
clk-sf19a2890.c
> new file mode 100644
> index 0000000000000..4dad8f65eb4b9
> --- /dev/null
> +++ b/drivers/clk/siflower/clk-sf19a2890.c

[ ... ]

> +static void __init sf19a2890_clk_early_init(struct device_node *node)
> +{
> +	struct clk_hw_onecell_data *data;
> +	void __iomem *base;
> +	unsigned int i;
> +	int ret;
> +
> +	data =3D kzalloc_flex(*data, hws, CLK_SF19A2890_NR_CLKS);
> +	if (!data)
> +		return;
> +
> +	data->num =3D CLK_SF19A2890_NR_CLKS;
> +	/* The clocks registered at probe defer until then */
> +	for (i =3D 0; i < data->num; i++)
> +		data->hws[i] =3D ERR_PTR(-EPROBE_DEFER);
> +
> +	base =3D of_iomap(node, 0);
> +	if (!base) {
> +		pr_err("failed to map the registers\n");
> +		goto err_free;
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sf19a2890_early_clks); i++) {
> +		unsigned int id =3D sf19a2890_early_clks[i];
> +		struct clk_hw *hw =3D sf19a2890_hws[id];
> +
> +		hw_to_sf_clk_common(hw)->base =3D base;
> +		ret =3D of_clk_hw_register(node, hw);
> +		if (ret) {
> +			pr_err("failed to register clock %u: %d\n", id, ret);
> +			goto err_unregister;
> +		}
> +		data->hws[id] =3D hw;
> +	}
> +
> +	ret =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data);
> +	if (ret) {
> +		pr_err("failed to add the clock provider: %d\n", ret);
> +		goto err_unregister;
> +	}
> +
> +	sf19a2890_clk_data =3D data;
> +	sf19a2890_clk_base =3D base;
> +	return;
> +
> +err_unregister:
> +	while (i--)
> +		clk_hw_unregister(data->hws[sf19a2890_early_clks[i]]);
> +	iounmap(base);
> +err_free:
> +	kfree(data);
> +}
> +
> +CLK_OF_DECLARE_DRIVER(sf19a2890_clk, "siflower,sf19a2890-clk", sf19a2890=
_clk_early_init);
> +
> +static int sf19a2890_clk_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *data =3D sf19a2890_clk_data;
> +	struct device *dev =3D &pdev->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!data)
> +		return -ENODEV;
> +
> +	for (i =3D 0; i < data->num; i++) {
> +		struct clk_hw *hw =3D sf19a2890_hws[i];
> +
> +		/* Registered early */
> +		if (!IS_ERR(data->hws[i]))
> +			continue;
> +
> +		hw_to_sf_clk_common(hw)->base =3D sf19a2890_clk_base;
> +		ret =3D devm_clk_hw_register(dev, hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register clock %u\n", i);
> +	}
> +
> +	/* Hand out the clocks only once they are all registered */
> +	for (i =3D 0; i < data->num; i++)
> +		data->hws[i] =3D sf19a2890_hws[i];
> +
> +	return 0;
> +}

[Severity: Medium]
Can updating data->hws[] after the devm_clk_hw_register() loop leave
downstream clocks orphaned?

During each devm_clk_hw_register() call, __clk_core_init() runs
clk_core_reparent_orphans_nolock(), which queries the OF provider via
of_clk_hw_onecell_get() while data->hws[i] is still
ERR_PTR(-EPROBE_DEFER).  Because the second loop populates data->hws[i]
without re-running orphan reparenting or of_clk_set_defaults(), any
downstream clock registered earlier that references one of the late
muxdiv clocks by DT phandle stays orphaned with rate 0.

In addition, of_clk_add_hw_provider() in sf19a2890_clk_early_init() runs
of_clk_set_defaults(node, true) while the 17 late slots hold
ERR_PTR(-EPROBE_DEFER), so an assigned-clocks property on the clock
controller node referencing any late clock causes
of_clk_add_hw_provider() to fail with -EPROBE_DEFER and unregister the
early CPU and PLL clocks.

Populating data->hws[i] before each devm_clk_hw_register() (or calling
of_clk_del_provider() and of_clk_add_hw_provider() once all clocks are
populated) would allow orphan reparenting and default clock assignments
to complete.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-sf19a2890-=
sysm-v4-0-bbfe1c495e2e@telaak.dev?part=3D2
