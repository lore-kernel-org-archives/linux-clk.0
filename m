Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296840;
	b=JN2tu0HugcO7PPEj69v+LNPxgJxJK/EyDkcJP57z28D6+sSw4LgZGSVmDahK7n0DzQik
	 6jiQ0xq/g/KJEsSZFINnMfXyuUgM7LB5zZTNl9DPCQaIqkY4vOv74HKEtdKkT3D/iQe8/
	 AdQZ0MGXjOiPifREAJsTnAao3Fw3ebGsqIUu8guiyzsAAFI0ohqRfO1CcerIXusP89Nwi
	 LgsPt+nQXtRhBIOZO8SvAj4h8Fnbpx5SKrLkrwzmznsl8e7WAwi67PQdxS7wLYW8dcxPV
	 4+Hp4PUOS0hrgrmBeDp7v/ngvEfMVWQMnhh7vXP9F+MLJIo/tvkLHBmDpRqdsbmSrNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296840;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IFHu/2bEteEfsR5EpbnBVG7ybCCpFRsZWn/fSZnLG0Q=;
	b=T4YY4JXYf1nUDQM4wilO/+muEEXJty4HSULbWn+BtPdPjA2FuaD4aq/O7kRfOBYqhPA5
	 LTMRvU2qrNbv4+Vf0UPHsQ3d5KVZmciHnZeoJbEmizrVkzCIlx3veXvi9MeToZfdTgP4p
	 e+/V5sMW81oGbi/rEf7xPjEMETeop45atJVbIZYe55f4hRlEnkyF3JtZJVn7KnQB9KvJo
	 Hsn+Tljq3Shw4z1e1i+5NfhhjdWSWZyUgfADOwBoRIfewGUx1pwGKKLOWRZAgZJ4kxIeo
	 UkYYGfpMYXCuRaUH/2IYg806G7GHFqszQ80KAPJb5Tn3/tWwjv3utlpVu5aCo3OwwTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QangsuKn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFB4606A320;
	Sat, 21 Nov 2026 21:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QangsuKn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BF31F000CA;
	Sat, 21 Nov 2026 21:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795296839;
	bh=IFHu/2bEteEfsR5EpbnBVG7ybCCpFRsZWn/fSZnLG0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QangsuKnrQsVdRI6hYCdZc/VwQzDqakchyFACUWcBS1RSW56c/0EjC41z9UYfhW6X
	 PxJA3K/pZWgNAvFl2xuf82g1HNXx7lk+yQKmhA2TvlYJUfkVekWs3oAspWYFi+9x7Z
	 BY3ocnIn5RH7smbqrIPTZjrMmKa8oL0+JUdNVA1MP+5WtUAGckGuTBuB6JG7fDkWfy
	 63nRnTqF7rzgaPmw/uDXhadeKLCWhSWFEJmuBeSGxkmHPmhOSHS7g63tCwRWvdtM3S
	 e9GUcK9HLiqQgy5lW4ASerJaf3TxhNZA2xrSmoZETqTFqsQSOosCumKhxOL0pFY6R3
	 dnw4jv6GItjYw==
Message-ID: <sashiko-outbox-227407@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 5/5] clk: en7523: add support for Airoha AN7583
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261121212738.170775-6-ansuelsmth@gmail.com>
References: <20261121212738.170775-1-ansuelsmth@gmail.com>
 <20261121212738.170775-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 21:33:58 +0000
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

commit 5161709c892ed291b31ad266a1982ac038057eb0
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for Airoha AN7583 clock

This commit adds clock and reset controller support for the Airoha AN7583
SoC to the en7523 clock driver.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index a4a75b8063a58..d044841cdc05a 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c

[ ... ]

> @@ -369,6 +378,138 @@ static const struct en_clk_desc en7581_base_clks[] =
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

[ ... ]

> @@ -1144,6 +1343,43 @@ static int en7581_clk_hw_init(struct platform_devi=
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
As reported by Brian Masney on v13 [1], does registering AN7583_CLK_MDIO0
and AN7583_CLK_MDIO1 via en7581_register_clocks() leave their hardware
dividers unprogrammed when clk_set_rate() is called?

en7581_register_clocks() registers every entry in an7583_base_clks with
devm_clk_hw_register_fixed_rate(), which attaches clk_fixed_rate_ops and
provides no .set_rate, .round_rate, or .determine_rate callbacks.  When
airoha_mdio_probe() in drivers/net/mdio/mdio-airoha.c calls
clk_set_rate(priv->clk, freq) to divide the 25 MHz default down to 2.5 MHz,
clk_set_rate() returns 0 without updating the 4-bit divider fields in
REG_CRYPTO_CLKSRC2, leaving the MDIO bus clock at 25 MHz.

Prior discussion on v10 and v13 noted that adjustable clock rate support was
planned for a separate series, while Brian Masney confirmed on v13 that the
missing rate callbacks here are an issue.

[1] https://lore.kernel.org/r/179513295004.301584.12820965897975670200.b4-r=
eview@b4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121212738.1707=
75-1-ansuelsmth@gmail.com?part=3D5
