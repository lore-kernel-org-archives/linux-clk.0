Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881522;
	b=pZQsd34lbVL9O55vNsoOibHtEHnGzkIbaPuq8m40XTZ53sgsgDsoavJIWaqS4A5cy03G
	 MHSl0cXCRijxcH7LXnjXET/QRVborGUgAVPDnzAcWBpMt8tMaiWJWrYwHD3JsJE0JGrjo
	 UP/jUow/YZTCa7cgqWW2dts1FBUFhOc0dMvFFdhZ3iCJ3V8Msx3PW36fBxZOw1J3vvY9O
	 PcVuUzIW1MPIEmMqx/imtHjrW5EWQuk0cdDqkXkpqN74GFQEUVA2ox/fXmcNftnBEfJVL
	 EoC0KbrKZl/ov7ZofQ/tGiTOvllYRXrsApoc4m70sUiL1WWGd49YlNsCFT7vo6h67ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881522;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=24/F/ppruR6SBq0REtPbYpcEaxB60R1FOSfzxkLO4sw=;
	b=DPZhE+1Y3y+rGXZ0Z/yIIgurS+Zi2vGt2k3tHBgd4V2nQULyMRZoiprvjEW7cTTcxPgM
	 gq7FDqXy8BPJOAmYuSYT5f+1xXLD92ZPOurYOHgjAI2He+BqVmHZr2QgyTUeFsvWy4Xvk
	 wEMfiZYRRdE2rmmoKFSIxwYn6wGeQVC6Bwh4wHU/RTgbnE7UBBXkHCWqao3VkfohvlSxM
	 n/nD3UJPihWnsTQuv+P1MUMYJlpJ6R9KAzdYsJTOt2UsLrjl7GRS6PPa8dd8g2rt9tcN0
	 GhL6/x12HwTq5DG/L1xTVVan99mv72L0odo7l5peK+6ib17tsCwTOeCmmOoP/2OHhyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CFjhPmKA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A03606D80A;
	Thu,  5 Nov 2026 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CFjhPmKA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3FC1F00A02;
	Thu,  5 Nov 2026 12:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881521;
	bh=24/F/ppruR6SBq0REtPbYpcEaxB60R1FOSfzxkLO4sw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CFjhPmKA1oSfBDtqCrm0xyf14WZcIqvQHGgHZZpCcm80eVSRmBvS+tjgC1CFwycht
	 Aau900pQabKtM4QAKsTV3mawPJTAvbEqL+GKNeDvUCTI2a0T68S1VJRSg/jEsIovwC
	 1QAzxr6RTHoSuLu86pe30Unt7L/uhC4jvJGKW0ht5gRGpmsRv9pJxX3sxxzyNOUhLw
	 olpCemQ7zZAWiP8e72an3aPkBZ8qbKdBtzTnNpkg8QPpHtM4DFFGj2Z0SySuv54rNI
	 K8q7CTQNsjRuZWHlQX/PUIqcOpM7qNY4zK8p9SR9klry/OTWWaDTObLBEHuiTfir9x
	 y/BHZ1D32HLeg==
Message-ID: <sashiko-outbox-199026@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 5/5] clk: en7523: add support for Airoha AN7583
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105121059.11201-6-ansuelsmth@gmail.com>
References: <20261105121059.11201-1-ansuelsmth@gmail.com>
 <20261105121059.11201-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 12:25:20 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] clk: en7523: sleeping in atomic context in en7581_pci_disable()
- [High] clk: en7523: separate spinlocks fail to serialize shared SCU regis=
ters
- [High] clk: en7523: AN7583 MDIO clocks registered as fixed-rate clocks
--

commit 0c38944a68dcbbf6c296bc45b4d9669bdee653fb
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for Airoha AN7583 clock

This commit adds clock and reset controller support for the Airoha AN7583
SoC, including its base clock descriptors, MDIO clocks, and reset line
mappings.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 979dd9c20a4f2..c1cc6fbc3c019 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
[ ... ]
> @@ -372,6 +381,138 @@ static const struct en_clk_desc en7581_base_clks[] =
=3D {
>  	}
>  };
> =20
> +static const struct en_clk_desc an7583_base_clks[] =3D {
[ ... ]
> +	}, {
> +		.id =3D AN7583_CLK_MDIO0,
> +		.name =3D "mdio0",
> +
> +		.base_reg =3D REG_CRYPTO_CLKSRC2,
> +
> +		.base_value =3D 25000000,
> +
> +		.div_bits =3D 4,
> +		.div_shift =3D 15,
> +		.div_step =3D 1,
> +		.div_offset =3D 1,
> +	}, {
> +		.id =3D AN7583_CLK_MDIO1,
> +		.name =3D "mdio1",
> +
> +		.base_reg =3D REG_CRYPTO_CLKSRC2,
> +
> +		.base_value =3D 25000000,
> +
> +		.div_bits =3D 4,
> +		.div_shift =3D 19,
> +		.div_step =3D 1,
> +		.div_offset =3D 1,
> +	}
> +};

[Severity: High]
Can AN7583_CLK_MDIO0 and AN7583_CLK_MDIO1 work as intended when registered
via en7581_register_clocks()?

In drivers/clk/clk-en7523.c, an7583_clk_hw_init() calls
en7581_register_clocks(), which reads the initial hardware register value
at probe time and registers every clock in soc_data->base_clks with
devm_clk_hw_register_fixed_rate():

    hw =3D devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);

However, in drivers/net/mdio/mdio-airoha.c, airoha_mdio_probe() calls
clk_set_rate(priv->clk, freq) to divide the 25 MHz default MDIO clock down
to 2.5 MHz. Since clk_fixed_rate_ops does not implement .set_rate,
.round_rate, or .determine_rate, clk_set_rate() will return 0 without
programming the 4-bit divider in REG_CRYPTO_CLKSRC2, leaving the MDIO bus
clock running at its 25 MHz boot default. Should the MDIO clocks implement
clockops that support setting the divider rate?

>  static const u16 en7581_rst_ofs[] =3D {
[ ... ]
> @@ -1152,6 +1351,43 @@ static int en7581_clk_hw_init(struct platform_devi=
ce *pdev,
>  	return en7581_serdes_phy_register(&pdev->dev);
>  }
> =20
> +static int an7583_clk_hw_init(struct platform_device *pdev,
> +			      struct clk_hw_onecell_data *clk_data)
> +{
[ ... ]
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
As reported by Sashiko on v6 [1], do cg->lock and rst_data->lock fail to
serialize concurrent read-modify-write accesses to the shared SCU registers?

In drivers/clk/clk-en7523.c, an7583_clk_hw_init() registers the PCIe clock
via en7581_register_clocks() -> en7523_register_pcie_clk() (which allocates
struct en_clk_gate with its own cg->lock) and registers the reset controller
via en7581_reset_register() (which allocates struct en_rst_data with a
separate rst_data->lock) over the same MMIO base.

In an7583_rst_map, AN7583_PCIC_PERSTOUT0_RST and AN7583_PCIC_PERSTOUT1_RST
map to bank 2 of en7581_rst_ofs, which is REG_NP_SCU_PCIC (offset 0x88).
Asserting or deasserting these resets in en7523_reset_update() performs a
readl()/writel() read-modify-write on base + 0x88 under rst_data->lock:

    spin_lock_irqsave(&rst_data->lock, flags);
    val =3D readl(addr);
    if (assert ^ inverted)
            val |=3D BIT(id % RST_NR_PER_BANK);
    else
            val &=3D ~BIT(id % RST_NR_PER_BANK);
    writel(val, addr);
    spin_unlock_irqrestore(&rst_data->lock, flags);

At the same time, en7581_pci_enable() and en7581_pci_disable() perform a
readl()/writel() read-modify-write on the same physical register
REG_PCI_CONTROL (offset 0x88) under cg->lock:

    spin_lock_irqsave(&cg->lock, flags);
    val =3D readl(np_base + REG_PCI_CONTROL);
    writel(val | mask, np_base + REG_PCI_CONTROL);
    spin_unlock_irqrestore(&cg->lock, flags);

Similarly, on EN7523 and EN751221, en7523_pci_prepare() modifies
REG_RESET_CONTROL1 (offset 0x834) and REG_PCI_CONTROL (offset 0x88) under
cg->lock, while en7523_reset_update() modifies REG_RST_CTRL1 (offset 0x834)
under rst_data->lock. In addition, in en7523_pci_prepare(), after releasing
cg->lock and sleeping in usleep_range(1000, 2000), the code re-acquires
cg->lock and writes back the cached val without re-reading REG_PCI_CONTROL:

    spin_lock_irqsave(&cg->lock, flags);
    val |=3D REG_PCI_CONTROL_REFCLK_EN1;
    writel(val, np_base + REG_PCI_CONTROL);
    spin_unlock_irqrestore(&cg->lock, flags);

Because cg->lock and rst_data->lock are separate spinlock_t instances, can
concurrent clock and reset operations race and overwrite each other's bit
updates in 0x88 and 0x834?

[ ... ]
> @@ -1305,6 +1541,18 @@ static const struct en_clk_soc_data en7581_data =
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
> +	.hw_init =3D an7583_clk_hw_init,
> +};

[Severity: High]
As reported by Sashiko on v6 [1], does wiring en7581_pci_disable() to
.disable in an7583_data cause sleeping in atomic context when the PCIe
clock is disabled?

When a consumer calls clk_disable() or clk_disable_unprepare() on
EN7523_CLK_PCIE, the Common Clock Framework holds enable_lock via
spin_lock_irqsave() in clk_core_disable_lock() and calls
core->ops->disable(core->hw).

In drivers/clk/clk-en7523.c, en7581_pci_disable() calls usleep_range()
while enable_lock is held with interrupts disabled:

    spin_lock_irqsave(&cg->lock, flags);
    val =3D readl(np_base + REG_PCI_CONTROL);
    writel(val & ~mask, np_base + REG_PCI_CONTROL);
    spin_unlock_irqrestore(&cg->lock, flags);

    usleep_range(1000, 2000);

Should this sleep be moved to an .unprepare callback (which runs under the
sleepable prepare_lock mutex, as in en7523_data and en751221_data), or use
a non-sleeping delay such as udelay()?

[1] https://lore.kernel.org/r/20260819222743.5044F1F000E9@smtp.kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105121059.1120=
1-1-ansuelsmth@gmail.com?part=3D5
