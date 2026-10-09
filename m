Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD803559C9;
	Fri,  9 Oct 2026 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530122; cv=none; b=g1K+FDdShz/v1hgzASV8Ej0K3NxlPC4ah9u/So9GIFrhoAkJIMw09kqH/ESVFPr+kkTIPcyayCweWujsFqeBztwmArqJwhQuat8gJNeLJxIlRPf1Utt91F1KdPzRyQvnuA3BLARFPLpdTGXBsTdvdWdcr++xbtX2aoeIS2KVZac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530122; c=relaxed/simple;
	bh=AmKyi1hyMFnINkmMB1DwHjQ2GJTDaFZzhrMibXeB3Zk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FiQQ1Hu3q2myC3QpOW6+3avOTnKa2vYg79kpSgDAt7sx15HrCZUR1/PMiZMtyFuD/Be9XcI6wFtvkIHaozoeO7BlGnov0VYJmwRin4kKai2O1RpoDCVRWf7NTKkCZVlDVrtEG2EEjKAz+IjrMeMTHiPZKpOryAmilyiYaqZElFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONebPO/c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONebPO/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28F01F000FF;
	Fri,  9 Oct 2026 07:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791530121;
	bh=6rZG5uEV3Afnge/6hmmiReEg45xb/AVM5DFIOvLBUjM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ONebPO/cXmPmbGQYsFla1iycxmvvyFriKHug04/mxjbJBoMCXRiur3SgHextdHJ61
	 nZPjt78UzqaO2BT2axlsFxoPnVsdBAg/ChukkQTFNFcRkUITP8HrBPo8DYZYSph+vz
	 uaDrmv1JdR0RPGlf83zcyB2ggTEo3vC7WQx6s05rdq3rPsGp+YCPZumMS+X58FFKfL
	 zsGbRm6rkih1bfm6mzJ/GUtOxdPJe++i+kurYzlQLkp/u+wQiqkEduRQfitl4LMlUm
	 277E2G7CjD1ecHdeEz2gRaYqMjxrCsE7wpK9+xXKxKo8XEVdD96Zbx/i6jvCpqxS/w
	 D4WXwpC194+Yw==
Message-ID: <sashiko-outbox-164987@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] clk: en7523: add support for Airoha AN7583 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20261009070725.13196-4-ansuelsmth@gmail.com>
References: <20261009070725.13196-1-ansuelsmth@gmail.com>
 <20261009070725.13196-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:15:20 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: en7523: NULL pointer dereference in PHY ops due to missing pr=
iv->base initialization
--

commit 37bd1589683423a3a7795bb6de626bc15702ea39
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for Airoha AN7583 clock
   =20
Add support for Airoha AN7583 clock and reset.
   =20
Airoha AN7583 SoC have the same register address of EN7581 but implement
different bits and additional base clocks. Also reset are different with
the introduction of 2 dedicated MDIO line and drop of some reset lines.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index ec66a504d4c55..d3a273b46c8f0 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c

[ ... ]

> @@ -1088,6 +1287,40 @@ static int en7581_clk_hw_init(struct platform_devi=
ce *pdev,
>  	return en7581_serdes_phy_register(&pdev->dev);
>  }
> =20
> +static int an7583_clk_hw_init(struct platform_device *pdev,
> +			      struct clk_hw_onecell_data *clk_data)
> +{
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
> +	en7581_register_clocks(dev, clk_data, map, base);

[Severity: High]
Are we missing a step to retrieve the driver data and assign priv->base =3D=
 base
here, similar to what is done in en7581_clk_hw_init()?

Without this initialization, when the PHY is later configured,
en7581_serdes_phy_set_mode() will attempt to access the mapped resource:

drivers/clk/clk-en7523.c:en7581_serdes_phy_set_mode() {
    ...
	spin_lock_irqsave(&priv->lock, flags);
	val =3D readl(priv->base + reg);
	val &=3D ~mask;
    ...
}

Because priv was zero-allocated during probe, priv->base will be NULL here,
which could lead to a NULL pointer dereference when readl is called.

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
> +
> +	return en7581_serdes_phy_register(dev);
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009070725.1319=
6-1-ansuelsmth@gmail.com?part=3D3
