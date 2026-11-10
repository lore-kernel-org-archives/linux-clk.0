Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794271912;
	b=zk3eS+ZJ1eNkxCTATP9d5KgUSKAJiZ5ay8K2OxF4TJwPPgwBkeSKRh213L2vUnNXdw8S
	 V2IhErGsrjNyFWvzRNTs2au1rZhbZouvToz94L+Gkfrj3EngDOV0XEx2CJGU5G5eLqgdu
	 fJs327B8KpUcYKL39c9ZkmVL6ZxnRC25UnXl7E5Z71vWo872Ug5EAe/7w3t2JbhfU5Dce
	 mwdZ+bng3QWnWVaZEV8SghEaUozhN3d19p6sbWVHNfTrHdy0Ggg+EWNyVLDg3z5kpmGEn
	 0y6U821ASOno+dVjVw/JbxuhfjdlPeEUiLurdMwnQxhzl4TGsxjwu4TMwzf1mIQrAqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271912;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/ZZGxslTPXnp2BqN/n2KIlTkyJk1Sa8ub/8ujXBLIjs=;
	b=kOlmXAFTIiWiLNrL4PG2xWSuVeVxODZnnko/VYDbBPAK03loTroWc+qli5Tm0SmDujvd
	 Yuul5eVVs7Lb3JKWBeYMmkITfqjMfxWznssEIPFDxL0Ga6XgXoj3tv3YeTSRCUnZKYIib
	 I1I6JVW100vN1T3Cl8cX7S7OSQFwRtmkB8g2dbfP5f1o9DmDll1iTBNP1FEsQ8DPY0nPm
	 gtiPyppKkrTDsS7Hz7S3RJao4yd1iRbjxqWqo6DVAB8kBw9UCxg2brbiA8J4rpt/1Jo1z
	 BUrKl+5QlpSCSObr7RSEs328HqVpVxmjIqKf9lkc4eoe9dcCOvJDD60mbwsxkToThsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TlgirT6v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A954606A325;
	Tue, 10 Nov 2026 00:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TlgirT6v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD65C1F008A1;
	Tue, 10 Nov 2026 00:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794271912;
	bh=/ZZGxslTPXnp2BqN/n2KIlTkyJk1Sa8ub/8ujXBLIjs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TlgirT6vLgXSXwCTnqzaDI8BwTe3uQRNXgRxXrLs8Mk7h+nzDroboJHoxqa3/qavJ
	 v305J/NCDLX1H4rsClHO5xSaDQrz/uxUBqJZb0LfuasWWxWV+s4Zeki1qjsdVVmIpX
	 wCWpWYO8+l1bF5JUDUsKZgTkYFApyyltj0m7WbGgf7j527vjeihun3moxyYkuOMaTV
	 s6s32+a+9QND9LRL9jWoYUcHgTCkleMbSEGyBDIcszR66NFU+KTmsTK0r1siCkZULy
	 8fvEsd8eg0svD4bi8qywRFwe7QtNvsnTN4dwKkbavCDc1EBflXKkrL6tEMrVcMWrtm
	 ALPIg2TnO10UQ==
Message-ID: <sashiko-outbox-205906@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 5/5] clk: en7523: add support for Airoha AN7583
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110000753.508-6-ansuelsmth@gmail.com>
References: <20261110000753.508-1-ansuelsmth@gmail.com>
 <20261110000753.508-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 00:51:49 +0000
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
- [Medium] clk: en7523: AN7583 MDIO clocks lack rate ops in
  en7581_register_clocks()
- [Medium] clk: en7523: mismatched clk_ops callbacks in
  an7583_data.pcie_ops
--

commit 80220805154b9c38bb07ac1b3edf5679520c435d
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for Airoha AN7583 clock

This commit adds clock and reset controller support for the Airoha AN7583
SoC to the en7523 clock driver.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 7d302498c3d51..7523ec7e0d8aa 100644
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

[Severity: Medium]
Can AN7583_CLK_MDIO0 and AN7583_CLK_MDIO1 change their rate when registered
through en7581_register_clocks()?

en7581_register_clocks() registers every entry in base_clks with
devm_clk_hw_register_fixed_rate(), whose clk_fixed_rate_ops lacks
.determine_rate and .set_rate callbacks.  When airoha_mdio_probe() in
drivers/net/mdio/mdio-airoha.c calls clk_set_rate() to divide the 25 MHz
default clock down to 2.5 MHz, clk_set_rate() returns 0 without updating
the 4-bit divider in REG_CRYPTO_CLKSRC2, leaving the MDIO bus at 25 MHz.
Earlier series discussion noted that adjustable clock rate support is
planned for a separate series, but the in-tree airoha-mdio consumer already
relies on clk_set_rate().

[ ... ]

> @@ -1329,6 +1565,18 @@ static const struct en_clk_soc_data en7581_data =
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
> +		.prepare =3D en7581_pci_enable,
> +		.unprepare =3D en7581_pci_disable,
> +	},
> +	.hw_init =3D an7583_clk_hw_init,
> +};

[Severity: Medium]
Should pcie_ops pair .prepare and .unprepare with .is_prepared rather than
.is_enabled?

Because en7581_pci_enable() and en7581_pci_disable() are wired to .prepare
and .unprepare while .is_prepared, .disable, and .pci_unprepare are NULL,
clk_unprepare_unused_subtree() sees prepare_count =3D=3D 0 with no .is_prep=
ared
callback and skips .unprepare, while clk_disable_unused_subtree() sees
.is_enabled return true with no .disable callback.  If the PCIe clock is
enabled in REG_PCI_CONTROL at boot and no consumer claims EN7523_CLK_PCIE,
clk_disable_unused() never gates it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110000753.508-=
1-ansuelsmth@gmail.com?part=3D5
