Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888475;
	b=pBi1dZ5glG/r4Q7uq8gQtXeTRXqlhc30TFYju8Ajzbrc61u7GInMg3oQlVi2HKdSFqWq
	 N065Aiu1SbBjwelaYuZcTUib3SunlbfyYuFnea9zYINH6uUo4nA7uzcSSisAa+UooKqvF
	 n2g0EuNmKTDL+CPgMEfawUVk+hGOTqhZYA1fdI787t4JZ23ZDWDO66KKD9Z/oC1KvESog
	 RS0LuAch1G/h86cRcyPvr/8wz3FziwIbtOpu+LIIuh4Dsj6k4reFEBQGf9CN89ZfGwc7e
	 wYAZCAPVwSJHo0Tvn4gvFUgvbZ98GgTUW94WljxLQrTcykLfSD8ncsy8HaqrwCcF7yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888475;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JfVj87q9QAGRFiOiR6HFEpZZOsBieI4TjbqtfuilE2I=;
	b=fHztVpFtwztKkcmLBTGgEyDDzkvkmOsDbt91RSj9cCsAFMLTtE8MRkRA2XK2+x8YretZ
	 U8QmFJ5QfT4/NkDxDKpvAYx/DQQLG7hWsR67j5tlel9uuQdQZnT3mC0kfXj/oBbJItirZ
	 L2AuMCjAT4Dl0VkvC1Q3+tzqZZCVxAUpjyLxoalPO/Fzt/jfSJcgepxsqoUyrI60knwQl
	 Y4pIASnvFKTXJAKs8wVZiLyoUE3796s78sLjRNdRPoYBoSVjD+S2/LO0V3iQZgf76HKPD
	 sUni83DxZxkihWR8PxiboUKQm+j/usVF81Hoyvb7rZWJ9DvQtclCUjcQQEaWNgOAnzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVY0XwWu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB428606A328;
	Thu,  5 Nov 2026 14:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVY0XwWu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E231F000C1;
	Thu,  5 Nov 2026 14:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888474;
	bh=JfVj87q9QAGRFiOiR6HFEpZZOsBieI4TjbqtfuilE2I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WVY0XwWu8IjppVOChQVb02VYVXS12U5634fNgQ3rt0TqK17xKiwuF+FvSQMJhnlQ9
	 kPtsX55I0p9LfcnSXOzkEWYMxpAuLyd4znbjUE3HZ90E9w1qnv79eRMIVUaBVaFbzD
	 T09yT6+4ESIFtoOV48qj4tVwA7AOnTS6uuIYeHo2OwuaYjiMFolhNkuVVede+SKJi7
	 yO5uZJIcIe7LM3v5FdSoT30xxG4QPv/ZIzrjU6URkjrSEkdB3LcUJqhNhsjFQcponz
	 59KbX88ZK7OtmUxBaRgkGrJSbx0R0QmzLREz3w8gxO/hrIAZ3uIhK4XLAlP0J/Gt8u
	 Whi/Pb+nHRjNg==
Message-ID: <sashiko-outbox-199231@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/16] dt-bindings: nvmem: microchip-otpc: Add
 required clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Dahl" <ada@thorsis.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105110715.2486432-8-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-8-ada@thorsis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 14:21:13 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: at91: sama7g5: out-of-bounds chws write in sama7g5_pmc_setup()
- [High] clk: at91: uninitialized hw stored in sama7g5_pmc_setup() and sama=
7d65_pmc_setup()
--

commit 5100b946d046b686eef531d6cff261bfa6eb8aee
Author: Alexander Dahl <ada@thorsis.com>

dt-bindings: nvmem: microchip-otpc: Add required clocks

This commit updates the Microchip SAMA7G5 OTPC device tree binding to
require the main RC oscillator and the OTPC peripheral clock, and updates
the binding example to reference SAMA7G5_PMC_MAIN_RC and peripheral clock
67.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c2=
8@microchip.com/T/#u

> diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-ot=
pc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.ya=
ml
> index cc25f2927682e..bef0246a79f16 100644
> --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> @@ -27,14 +27,22 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  clocks:
> +    items:
> +      - description: main rc oscillator
> +      - description: otpc peripheral clock
> +
>  required:
>    - compatible
>    - reg
> +  - clocks
> =20
>  unevaluatedProperties: false
> =20
>  examples:
>    - |
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
>      #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
> =20
>      otpc: efuse@e8c00000 {
> @@ -42,6 +50,7 @@ examples:
>          reg =3D <0xe8c00000 0xec>;
>          #address-cells =3D <1>;
>          #size-cells =3D <1>;
> +        clocks =3D <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_T=
YPE_PERIPHERAL 67>;

[Severity: High]
Does looking up SAMA7G5_PMC_MAIN_RC fail at runtime and overflow
sama7g5_pmc->chws[] during PMC initialization?

In include/dt-bindings/clock/microchip,sama7g5-pmc.h, SAMA7G5_PMC_MCK1 is 13
and SAMA7G5_PMC_MAIN_RC is 14. However, in drivers/clk/at91/sama7g5.c,
sama7g5_pmc_setup() allocates the PMC data with ncore set to
SAMA7G5_PMC_MCK1 + 1 (14) before writing to index SAMA7G5_PMC_MAIN_RC (14):

drivers/clk/at91/sama7g5.c:sama7g5_pmc_setup() {
	...
	sama7g5_pmc =3D pmc_data_allocate(SAMA7G5_PMC_MCK1 + 1,
					nck(sama7g5_systemck),
					nck(sama7g5_periphck),
					nck(sama7g5_gck), 8);
	...
	sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] =3D hw;
}

Because pmc_data_allocate() sets pmc_data->ncore to 14 and points
pmc_data->shws to pmc_data->chws + ncore, writing to
sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] writes one element past the end of
chws[] into shws[0].

Furthermore, when the OTPC consumer requests <&pmc PMC_TYPE_CORE
SAMA7G5_PMC_MAIN_RC>, of_clk_hw_pmc_get() in drivers/clk/at91/pmc.c checks
idx < pmc_data->ncore (14 < 14), which fails and returns ERR_PTR(-EINVAL).

Should sama7g5_pmc_setup() pass SAMA7G5_PMC_MAIN_RC + 1 (or PMC_INDEX_MAX) =
to
pmc_data_allocate() instead?

[Severity: High]
Also in the earlier patch in this series exporting main_rc_osc, could
sama7g5_pmc_setup() and sama7d65_pmc_setup() be storing an uninitialized hw
pointer into chws[] instead of main_rc_hw?

In both drivers/clk/at91/sama7g5.c:sama7g5_pmc_setup() and
drivers/clk/at91/sama7d65.c:sama7d65_pmc_setup(), the local variable hw is
uninitialized when at91_clk_register_main_rc_osc() is called:

	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
	...
	main_rc_hw =3D at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 120000=
00,
						   50000000);
	if (IS_ERR(main_rc_hw))
		goto err_free;
	sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] =3D hw;

and similarly in sama7d65_pmc_setup():

	main_rc_hw =3D at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 120000=
00,
						   50000000);
	if (IS_ERR(main_rc_hw))
		goto err_free;
	sama7d65_pmc->chws[SAMA7D65_PMC_MAIN_RC] =3D hw;

Since hw is only assigned later when registering mainck, this stores an
uninitialized stack pointer into chws[SAMA7G5_PMC_MAIN_RC] and
chws[SAMA7D65_PMC_MAIN_RC]. Should both assignments use main_rc_hw instead
of hw?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105110715.2486=
432-1-ada@thorsis.com?part=3D7
