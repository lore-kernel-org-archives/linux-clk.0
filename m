Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940727;
	b=NHr0ZFxVLvS0HIVULlMvxqegPA540gQ7SdmKZMJAX4uy6Ytr5Ui1Vj7OM+LWqRHs71ur
	 OyEl7g6mIZpob2FtEIzFPJbrd7LNBoLA5xmZz0Ohxr6aLv6vd/6GnlB5+luFMp06yzl6N
	 XcjZDKLpeCgp37AYfTtEx7l952ruYM3AEl57kDCDwWqistEZrkl2B8ssfIfn4DtALZcS6
	 3kAhipwLCeRmMR8u6wQckge+EUWiV8PIdWvZZZHDf+Fk5lcJRwTuD5V8+JMkNkIxPb8Bv
	 /Vz6E06iynXhve0nflgsONe/99M78V6tOGCHuln0jcsubMXEwc8+OKirpRbqIPZBY9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940727;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=498/SRosxuf74j2B1/ejrSWjqtLlhrtmrvXGiH9fxp0=;
	b=kBMtiZby02FxixiDJ5DyBxvOmNHxW8MyvgctqvVenOdmLms7lO20eMlTm7dal7RK7KLh
	 weXtRSG8tIZv9pZ389ecb4g7KLu8Ia925HrAxj2SGtUUQ5i8MVVGke+yN2TfBQwv+Q4/0
	 /OR0ruMUO+XiqdwhT5vNmrQ3QXWUhR2GrFpJZ4Jh5oPXfX6hmTCD4XEWhYLvgjnfznZMS
	 i9C6BOtpZVbU1CqIA1mGFHQeJn/cVDsM1+2kbvTGPqF0HzXWmBoksNmq1hN2cLGAaz+my
	 4ofzUHuJ66wL5vu6w8E2XSi8E9iBRTsWnV5OWmMRody8P6LG/Q+d2Ksrc2LQcH7R9OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KfqeKhWU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3E0606A31C;
	Tue, 17 Nov 2026 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KfqeKhWU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64DD1F000C4;
	Tue, 17 Nov 2026 18:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940727;
	bh=498/SRosxuf74j2B1/ejrSWjqtLlhrtmrvXGiH9fxp0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KfqeKhWUAI2pO72QRnGnWJoiZc+0BXlXTDrkW1uF7t7t1m/6H0DfRVKq/EQib9VdI
	 4Pim4MV3h166SdKhFfPfPH91kpE/NE34tSH12NzUCAk+b5RMoOd2fYJj2W83myWULC
	 E0pol8TkhLnBf6vWfEjuDteJ/fUK1/E0o+Nc/SepwfM6ngBvgoUJhqfEiHZPDMR6Qy
	 SlKcPi48P91YqvOOQAs5f3DFmkY1Fk7c5puHKZxVMW/rAHVEhdqqtzkxqQQANSrttj
	 i/YIMNOTDlolN5V+uNhkpeWOEwcS6gDnqXkORvCPHOl5vxXrjDLbSx/Bmmkz0NoE9y
	 LM9mjhBhS0qOQ==
Message-ID: <sashiko-outbox-219368@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 5/5] clk: en7523: add support for Airoha AN7583
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117182444.103123-6-ansuelsmth@gmail.com>
References: <20261117182444.103123-1-ansuelsmth@gmail.com>
 <20261117182444.103123-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:38:46 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] clk: en7523: AN7583 MDIO clocks lack rate ops in
  en7581_register_clocks()
--

commit 1cdcca32a0679ec11e0c737e0957ebcf9e9e90ec
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for Airoha AN7583 clock

This commit adds clock and reset controller support for the Airoha AN7583
SoC to the en7523 clock driver.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index f12b69f8d4539..f8eef9fcff472 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
[ ... ]
> @@ -369,6 +378,138 @@ static const struct en_clk_desc en7581_base_clks[] =
=3D {
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
[ ... ]
> @@ -1148,6 +1347,43 @@ static int en7581_clk_hw_init(struct platform_devi=
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

[Severity: Medium]
Does registering AN7583_CLK_MDIO0 and AN7583_CLK_MDIO1 via
en7581_register_clocks() prevent clk_set_rate() from updating their
hardware dividers?

en7581_register_clocks() registers every entry in soc_data->base_clks with
devm_clk_hw_register_fixed_rate(), which uses clk_fixed_rate_ops and
provides no .set_rate, .round_rate, or .determine_rate callbacks.  When the
MDIO controller driver probes, its clk_set_rate() call is a no-op that
returns 0 without programming the 4-bit divider in REG_CRYPTO_CLKSRC2,
leaving the MDIO bus at its 25 MHz boot default instead of 2.5 MHz:

drivers/net/mdio/mdio-airoha.c:airoha_mdio_probe() {
	...
	/* Check if a custom frequency is defined in DT or default to 2.5 MHz */
	if (of_property_read_u32(dev->of_node, "clock-frequency", &freq))
		freq =3D 2500000;

	ret =3D clk_set_rate(priv->clk, freq);
	if (ret)
		return ret;
	...
}

Although adjustable clock rate support was noted on v10 as planned for a
separate series, the in-tree airoha-mdio consumer already relies on
clk_set_rate() at this commit.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117182444.1031=
23-1-ansuelsmth@gmail.com?part=3D5
