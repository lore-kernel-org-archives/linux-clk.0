Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BFC486B83;
	Mon, 12 Oct 2026 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808177; cv=none; b=lVOOBYciMiOxfrxKdDR9AkpQ7xJvXcPQSUJ0kgvykX608jiLF4Rot7U5WmjVI0aJljyn46afEC175cIr5ZH7hLFIfhWGJbudYHPbF/KzM7vLsyqHvHwdZ3tDhhFBS+IxR9R1SSS9SSzTFE3EaHm9H2kJeH7gwmDHZ6KfkM+yePQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808177; c=relaxed/simple;
	bh=fBt20GxftHoMgiwDxG9U6Fmrwohg24c3+qHbWbijCBM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Uab2883KEYmBHK2twiHvhsTOU7uGRTi+UEYjTTcIby/MYD5GXEMPdb/uVCYdXY19f1Mrak+4Q7BNU897YaukKq7QeIxi5LCFGkBTXPro9xk8fVdYIfVWROkHsfrKXhVNFjr2HsevJotd5O8nm+Z+VRmeomuzu150YBvJGT3HHWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=baAiHVed; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="baAiHVed"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584EA1F0089C;
	Mon, 12 Oct 2026 12:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791808176;
	bh=lVO+lXKFZMOGXqVwslObT8Td1UwM0bVdKSaW6hgVP9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=baAiHVedWUUNXQ6zckuaPQzefZCn2zl2eZrOvOmFNawGvIG7vKawjb/ZglKpTAYEA
	 kDfgWKOSM/LPO5zo4fh911tDGPJmknAon7ukUa+qRTD3/n2Qc/Do0fpHcmNGYMie1S
	 t0Ym2GUfRyMdkGS4ev+32a/uMzKPNk6Z/GkqmC0RFEfG+3noQuJaAoLKbDV5IytKdS
	 WlxZfIRq15MPlKfw3ZKf8hYIPMWwMrqC6D78q62RXUr8vZZRjw3nKNU5+YbLaC/Ql/
	 l253b9kD+bBhhXtj9/e2clgoMC3xh/BIkNb6NnmIOC6kRyVQiu5eBPU3J0qiXsGjpB
	 x4sidUiBRWcEQ==
Message-ID: <sashiko-outbox-168098@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/3] clk: en7523: add support for Airoha AN7583 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261012115954.92718-4-ansuelsmth@gmail.com>
References: <20261012115954.92718-1-ansuelsmth@gmail.com>
 <20261012115954.92718-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 12:29:35 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: uaf and leak on probe error path due to unmanaged clock regis=
tration
- [High] clk: en7523: race condition in RMW operations on shared SCU regist=
ers
--

commit 8fb64358a2b708163ffd1fa2a6071fd191ad66a7
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for Airoha AN7583 clock

Add support for Airoha AN7583 clock and reset.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -1088,6 +1287,43 @@ static int en7581_clk_hw_init(struct platform_devi=
ce *pdev,
>  	return en7581_serdes_phy_register(&pdev->dev);
>  }
> =20
> +static int an7583_clk_hw_init(struct platform_device *pdev,
> +			      struct clk_hw_onecell_data *clk_data)
> +{
> +	struct en_clk_priv *priv =3D platform_get_drvdata(pdev);
> +	struct device *dev =3D &pdev->dev;
> +	struct regmap *map;
> +	void __iomem *base;
> +	u32 val;
> +	int ret;
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
> +	priv->base =3D base;
> +
> +	en7581_register_clocks(dev, clk_data, map, base);
> +
> +	val =3D readl(base + REG_RST_CTRL1);
> +	val |=3D REG_PCIE_HB_RST;
> +	writel(val, base + REG_RST_CTRL1);
> +	val &=3D ~REG_PCIE_HB_RST;
> +	writel(val, base + REG_RST_CTRL1);
> +
> +	ret =3D en7581_reset_register(dev, base, an7583_rst_map,
> +				    ARRAY_SIZE(an7583_rst_map),
> +				    en7581_rst_ofs);
> +	if (ret)
> +		return ret;

[Severity: High]
Does this early return path leak the fixed-rate clocks and cause a
use-after-free for the PCIe clock?

an7583_clk_hw_init() calls en7581_register_clocks(), which registers
fixed-rate clocks via clk_hw_register_fixed_rate() and a PCIe clock
via en7523_register_pcie_clk().

Looking at en7523_register_pcie_clk(), it allocates a struct en_clk_gate
using devm_kzalloc(), but registers it using the unmanaged
clk_hw_register().

If en7581_reset_register() fails here and we return early, the probe fails.
The devres framework will automatically free the devm_kzalloc'd
en_clk_gate structure. However, because the clock was not registered
with a managed API (like devm_clk_hw_register()), it remains linked in
the Common Clock Framework.

Can this cause a use-after-free when the framework later accesses this
clock, as well as a memory leak for the fixed-rate clocks?

[ ... ]

> @@ -1241,6 +1477,18 @@ static const struct en_clk_soc_data en7581_data =
=3D {
>  	.hw_init =3D en7581_clk_hw_init,
>  };
> =20
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
Is there a race condition here between the clock and reset operations
on shared SCU registers?

This struct assigns en7581_pci_enable() to the pcie_ops.enable callback.
Meanwhile, an7583_clk_hw_init() registers reset controls using
an7583_rst_map.

A driver invoking a clock operation could trigger en7581_pci_enable(),
while another execution context invoking a reset operation could trigger
en7523_reset_update().

Both of these operations appear to modify the exact same physical registers
(like REG_PCI_CONTROL/REG_NP_SCU_PCIC at 0x88 and
REG_RESET_CONTROL1/REG_RST_CTRL1 at 0x834) using unprotected readl() and
writel() read-modify-write sequences. Since they belong to different
frameworks, there is no shared lock protecting the state.

Could this cause data corruption of the SCU register state, leading to
lost clock enable/disable or reset assert/deassert updates?

> +	.hw_init =3D an7583_clk_hw_init,
> +};
> +
>  static const struct en_clk_soc_data en751221_data =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012115954.9271=
8-1-ansuelsmth@gmail.com?part=3D3
