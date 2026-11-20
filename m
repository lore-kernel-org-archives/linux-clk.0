Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218141;
	b=wGXQ1hGSk3mKZVPStL7R8f7EMVgUXhTMTrRzoq8O910rpQ6CEoyQYz7CNnmvEPnWG2fv
	 ZDqHxRx9HO/gU1WWyYd5L1zlURV3g5VIAZ0l8WLHIdT9/dbqfOzdVIsyv9l1kP9CE7Djr
	 GLXmJ4Vx1doZFw4knQrl0+Tlk/0TyDaAqrECUtNqeBOiuwrgk+DDuxYpRP8kCko4lCH6P
	 lCrLi+4nb/HxdCmZHu/4L9/Mvpf6D8IZ7ZGstjunRlTdDF/CVeU63Ddn+HfV4kP5m8QzS
	 zkGy1trFAx/FtOgvrr8kYfVvEISXRjNWERIg0QP4hqLsamGamt4ngGD1gGs9i3qO02Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218141;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=h6Dpra9mjkCIn3zz54nJE173fyJNXIPj9+Lm6wgRqV8=;
	b=X7cmMTXvFfkg1Zl8heIV/DT7KhxZkwuogU0rg9KY0Q94gmySJJEdMoaTYJI3EpNuwVDv
	 h5JMfF2kQGel1+UslHI4yXuNfD0yfZyw8NdDsNTdHMrf4x3z9Xe0o0EpIqJ6SgDmLpf0+
	 Vqv8S3oFtwURhJ12iMKO9UaUSuyDuscXWavL+dMowMuL7eelsYHmvT6vKP/5RU3InW/GO
	 Dx+d25+uuHEn9WX6xo1HDde2JfQ/RaHAUK/ywi877KXa/E7OGwtU1cz83z44XRAEz2CjB
	 +ixquvSZ5zH+wI5Jb+qUlxJ5uqfgQeUO8jirgi0vOLsmPSyyiFUWpasUcQdlckyh+vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hTlzjETh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A40A606A682;
	Fri, 20 Nov 2026 23:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hTlzjETh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732941F000CF;
	Fri, 20 Nov 2026 23:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795218140;
	bh=h6Dpra9mjkCIn3zz54nJE173fyJNXIPj9+Lm6wgRqV8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hTlzjETh+LmA89GGtditn64jv75G5HLoXbeA073NnXRDCp6ANoLjuA6Rr2K+hnncS
	 8VRfKI9PUtyWXt35P0QZmrWxG9UYXmCsXdgNU/3NYPwAzzsucfLq9t9R7I5OOb/TsC
	 A7XiPIzKeFerA0wXSM2tc8udkiG+p6WnPcWmTfVafXknMaV4b82S7z/Op3azfuTYvF
	 Ve3h5s4BSbJpxxNl1V6ytVTO/Jbb9gS0KmwegQuDyEGfsmRFyZz3ik0rerYHHuBWV6
	 wjtff5OQcJEQSC1ZcL1Kz8Ov1qngP4lcNxzfMQNwxLz4hG2U5SUWeesgUeJ4/Wn8PL
	 fFG+gFbNtZzjw==
Message-ID: <sashiko-outbox-226349@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 5/5] clk: en7523: add support for Airoha AN7583
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120233535.164885-6-ansuelsmth@gmail.com>
References: <20261120233535.164885-1-ansuelsmth@gmail.com>
 <20261120233535.164885-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 23:42:20 +0000
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
- [High] clk: en7523: out-of-bounds read in en7581_register_clocks() on
  AN7583
- [Medium] clk: en7523: AN7583 MDIO clocks lack rate ops in
  en7581_register_clocks()
--

commit d321ffe6fe44430a284c1d8c5334df8f429f0678
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for Airoha AN7583 clock

This commit adds clock and reset controller support for the Airoha AN7583
SoC to the en7523 driver, including base clock descriptors, MDIO clocks,
and a reset mapping table.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index a4a75b8063a58..71ed5d3362701 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c

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

[Severity: Medium]
As reported by Brian Masney on v13 [1], does registering AN7583_CLK_MDIO0
and AN7583_CLK_MDIO1 through en7581_register_clocks() prevent consumers
from configuring the MDIO divider?

en7581_register_clocks() registers every entry in soc_data->base_clks via
devm_clk_hw_register_fixed_rate(), which lacks .set_rate, .round_rate, and
.determine_rate callbacks.  When airoha_mdio_probe() calls clk_set_rate()
to divide the 25 MHz default down to 2.5 MHz, clk_set_rate() returns 0
without writing the 4-bit divider in REG_CRYPTO_CLKSRC2, leaving the MDIO
bus running at 25 MHz.

[ ... ]

> @@ -1300,6 +1536,18 @@ static const struct en_clk_soc_data en7581_data =
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
Does setting .num_clocks to ARRAY_SIZE(an7583_base_clks) + 1 cause an
out-of-bounds read past an7583_base_clks[] in en7581_register_clocks()?

Earlier in the series, commit "clk: en7523: generalize register clocks
function" updated en7523_clk_probe() to add 1 to num_clocks when
soc_data->pcie_ops.is_enabled is set, and changed en7581_register_clocks()
to loop up to soc_data->num_clocks over soc_data->base_clks[] before
registering the PCIe clock separately:

drivers/clk/clk-en7523.c:en7581_register_clocks() {
	...
	for (i =3D 0; i < soc_data->num_clocks; i++) {
		const struct en_clk_desc *desc =3D &soc_data->base_clks[i];
	...
}

With + 1 here, the final iteration reads one element past the end of
an7583_base_clks[], dereferencing an invalid descriptor during probe and
double-counting the PCIe clock in clk_data->num.  Like en7581_data,
.num_clocks should be ARRAY_SIZE(an7583_base_clks).

[1] https://lore.kernel.org/r/179513295004.301584.12820965897975670200.b4-r=
eview@b4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120233535.1648=
85-1-ansuelsmth@gmail.com?part=3D5
