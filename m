Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED29336895;
	Sun, 11 Oct 2026 19:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745378; cv=none; b=L80SXKkevRBwDNe1bB3PRg+ZcM8mtMfUcUY4F8i1q4ljRWOtne4qmtD9A3KnpvEj8kuq5uItfO/eWc/vEVcSRnhVLb/TNm22AjnRTZghRuGA3Q1CTW7z2JpJCnUgrCIGQPi6p4g3J5YsDaAP4FbKoVtvKf8oTkRUa7gDExAP6rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745378; c=relaxed/simple;
	bh=OXgoxNrQjh+1MJHIWMB94re0ilqewGhJsS/ns+3G7U4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=E0sBe7QDUnQx7FWFVdfupaiw7mvrJyaT+mTl3/ouFtGxuwkmxiMPLmtyQhU9/iChk0IqB/vvXZRe9UbLSrgCnw4Ip7HRhH3rGBeAPjj4R+mbCram8833w63gxYtzOTpkBSDQ9oNazS0HyYw+g69WLPbKYm18FelVSazv70U6ipA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQtKjoap; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQtKjoap"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8671F0089B;
	Sun, 11 Oct 2026 19:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791745377;
	bh=uLoFDQ3HYFizThYfjSsDp5gMWBzHfO9ctjzIFhJpCMU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GQtKjoapkl7l7ze+oy89pG3rmCzXCvfhFXiHfrPu4GShTh9QBYdS08MPhs1iFkXlF
	 roA3WPsh3TcFdtnFvmteXHbKhvkPTLbD4pW8HUsssa6FYbKzWRAmFh7eVT9qM7dar6
	 v4ocmxM1xSMsgbvUxzsgB4SqeoC9jhAKOpCVRwluPPdPWwIEJOkTt+1gVh/ee2RrF3
	 FlH/mmBeGJX7gPZMf4to2FAu5BqTd70RsdU/RDxbQyPIQHKByNLu7cQRg2zDX14CxB
	 goM+NgBEvfXGMnFlSBMYL/MnTV6baLoHPodjQ7G3tOh9uvXox2H+zzmcxuVC5L8tVa
	 Bec9+VavQZqHA==
Message-ID: <sashiko-outbox-167394@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/3] clk: en7523: add support for Airoha AN7583 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261011185238.52229-4-ansuelsmth@gmail.com>
References: <20261011185238.52229-1-ansuelsmth@gmail.com>
 <20261011185238.52229-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 19:02:56 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] clk: en7523: build failure due to undeclared 'priv' in an7583_clk_=
hw_init
- [High] clk: en7523: missing spinlock in reset controller update
- [Low] clk: en7523: undeclared 'priv' variable breaks build in an7583_clk_=
hw_init
--

commit bdbd93bdb15e9361a92abee5427344b8ccd03042
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for Airoha AN7583 clock

Add support for Airoha AN7583 clock and reset. Airoha AN7583 SoC have
the same register address of EN7581 but implement different bits and
additional base clocks.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index ec66a504d4c55..e8c61474c1f98 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
[ ... ]
> @@ -1088,6 +1287,42 @@ static int en7581_clk_hw_init(struct platform_devi=
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
> +	priv->base =3D base;

[Severity: High]
Does this code break the build by using an undeclared identifier?

It appears the pointer priv is never declared, initialized, or fetched
(e.g., via platform_get_drvdata(pdev)) in an7583_clk_hw_init().

[Severity: Low]
Does this function also unintentionally omit the PCIe SCU register
initialization (REG_NP_SCU_SSTR and REG_NP_SCU_PCIC)?

These were initialized in en7581_clk_hw_init(), and it looks like their
omission here stems from the same adaptation that left the priv pointer
undeclared.

[ ... ]
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

[Severity: High]
Can this mapping cause lost reset updates due to concurrent driver access?

By registering these reset lines, different drivers will manage their IP bl=
ock
resets independently. However, the shared reset bank registers appear to be
modified without any locks:

static int en7523_reset_update(...)
{
	...
	val =3D readl(addr);
	if (assert ^ inverted)
		val |=3D BIT(id % RST_NR_PER_BANK);
	else
		val &=3D ~BIT(id % RST_NR_PER_BANK);
	writel(val, addr);
	...
}

If two different drivers assert or deassert resets concurrently mapped to t=
he
same bank, could this unprotected read-modify-write sequence lead to a race
condition where a hardware IP is left incorrectly in reset or unexpectedly
pulled out of reset?

> +	if (ret)
> +		return ret;
> +
> +	return en7581_serdes_phy_register(dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011185238.5222=
9-1-ansuelsmth@gmail.com?part=3D3
