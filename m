Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888944;
	b=15X2XmPX0n5mUzYfLe+da3tGsblE5cQAoFU8GjgbqTyIPi+4b9EetllLTtCifR4JAyol
	 PsJJj0McJVHPkNmSlgXVXX6yPJ9iAg1idksANWRrjh6n6K70fTk/vfTgxABiSqAyFy/uo
	 UzQ4BppHcCb7Ez88PxPiTSD/jFNPUaXllDRv38MEKVredIC0QeEboMr5DTPbC7xt+MlHV
	 hX12YMQL3yu+ginpyqM/KfZ6IrRObkxYHvYtGRpCL/EzlGe0thjq2zeTqELAJP6a8tGvt
	 b9CPnfp6WGu9rM2fQer0HsAFE9kPQtZetio6cyvprFXR9C+0b7ECH8imCqwD/G3R17g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888944;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GnqfOkxGGqfm4NELNr/v+G+Yq4Jnr7VeV22BqG+KrSY=;
	b=xLUQc6u0Nfx4xJIqID9hwsR0mz1nVrHCmFbf1giZ+RlpXhYlPEWLwBo0+yw8KmHdthgO
	 TLwyZWrG55/HNLLrqfE6H7rBussDXguN1i6xjraIZ+3NsXKy3V3T7rklmKervFWgu66Dv
	 KduQFRKdYvt3xRGGnmo1RVWjGhGaPgKAD79QYKIJnis0KQF4lSef3BzlbR5NPhvahpqKe
	 IO/6qeXUaFqfYZFMVc2El6x84htItDkhoPqAsRIFiwJ8/YzeevGqVI3NoxswNMZdDJ3ow
	 U9UuCqxH1uV4DW4zfVydwTxhaOloC1rkBJnJQNp/Uytb8FQu88dlW6LpqdD6F3lKwlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YXxSw1t6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07867606A32F;
	Thu,  5 Nov 2026 14:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YXxSw1t6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B40F1F00A1C;
	Thu,  5 Nov 2026 14:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888943;
	bh=GnqfOkxGGqfm4NELNr/v+G+Yq4Jnr7VeV22BqG+KrSY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YXxSw1t6CmqmV81JUhb9AaP0/s4hBQikh+sGXxHgry8CQES9tZbQh5PoiM1vRtQFE
	 L7LgN2WlzJaXKJIOextQijYHwiNh1kFc7+Pqzwmu+ogGqJJciFh3iAq5hMPCLuB9FA
	 0DEetuweHp4vQ3xJWeYTG4+PX1L8yhOi7EQSUSsoY0mEqzNxX8PokkblEr3uFK2bo6
	 yul8UAJqSeySp9paH+EzQcf42DntMXBL3fdmbGu4EPVG7V4j/0/e0mCy3+/r5I3Sca
	 bkfEuDEIZQXAUKz2Jy+HpSL+jRiaP/s1jDUAeIGk4PorvAi0Fiui7GMcZPv7cfKh1B
	 Icf6X68UZrxfw==
Message-ID: <sashiko-outbox-199242@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/16] clk: at91: Add peripheral clock id for OTPC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Dahl" <ada@thorsis.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105110715.2486432-7-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-7-ada@thorsis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 14:29:02 +0000
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
- [High] clk: at91: uninitialized hw assigned to chws in sama7d65/sama7g5_p=
mc_setup()
- [High] clk: at91: out-of-bounds chws write and lookup failure in sama7g5_=
pmc_setup()
--

commit 056fbff3f28231ae65a50d25dfabd2b4de1811af
Author: Alexander Dahl <ada@thorsis.com>

clk: at91: Add peripheral clock id for OTPC

This series splits up the AT91 PMC clock binding indices per SoC, exports t=
he
main RC oscillator clock to Device Tree, and adds the OTPC peripheral clock
IDs for sam9x60, sam9x7, sama7d65, and sama7g5.

> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index ba8ff413fa2c6..1f3c724739133 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c

[ ... ]

> @@ -1138,6 +1139,7 @@ static void __init sama7d65_pmc_setup(struct device=
_node *np)
>  						   50000000);
>  	if (IS_ERR(main_rc_hw))
>  		goto err_free;
> +	sama7d65_pmc->chws[SAMA7D65_PMC_MAIN_RC] =3D hw;

[Severity: High]
Does this store an uninitialized pointer into
sama7d65_pmc->chws[SAMA7D65_PMC_MAIN_RC]?

In sama7d65_pmc_setup(), hw is declared without initialization and
at91_clk_register_main_rc_osc() stores its return value in main_rc_hw:

	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
	...
	main_rc_hw =3D at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 120000=
00,
						   50000000);
	if (IS_ERR(main_rc_hw))
		goto err_free;
	sama7d65_pmc->chws[SAMA7D65_PMC_MAIN_RC] =3D hw;

Should this assign main_rc_hw instead of hw?

> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index 1340c2b006192..3e0cfd2613851 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c

[ ... ]

> @@ -997,7 +998,7 @@ static void __init sama7g5_pmc_setup(struct device_no=
de *np)
>  	if (IS_ERR(regmap))
>  		return;
> =20
> -	sama7g5_pmc =3D pmc_data_allocate(PMC_MCK1 + 1,
> +	sama7g5_pmc =3D pmc_data_allocate(SAMA7G5_PMC_MCK1 + 1,
>  					nck(sama7g5_systemck),
>  					nck(sama7g5_periphck),
>  					nck(sama7g5_gck), 8);
> @@ -1014,6 +1015,7 @@ static void __init sama7g5_pmc_setup(struct device_=
node *np)
>  						   50000000);
>  	if (IS_ERR(main_rc_hw))
>  		goto err_free;
> +	sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] =3D hw;

[Severity: High]
In sama7g5_pmc_setup(), hw is also uninitialized at this point because
at91_clk_register_main_rc_osc() assigns its result to main_rc_hw. Should th=
is
assign main_rc_hw here as well?

[Severity: High]
Additionally, can writing to sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] overflow
sama7g5_pmc->chws[] and cause lookups of SAMA7G5_PMC_MAIN_RC to fail?

In include/dt-bindings/clock/microchip,sama7g5-pmc.h:

	#define SAMA7G5_PMC_MCK1	13
	#define SAMA7G5_PMC_MAIN_RC	14

sama7g5_pmc_setup() calls pmc_data_allocate(SAMA7G5_PMC_MCK1 + 1, ...), whi=
ch
sets sama7g5_pmc->ncore to 14 and places sama7g5_pmc->shws at
sama7g5_pmc->chws + 14. Indexing sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] wri=
tes
to index 14, past the 14-element chws slice into shws[0]. Furthermore, when
of_clk_hw_pmc_get() resolves a PMC_TYPE_CORE clock with idx =3D=3D
SAMA7G5_PMC_MAIN_RC, the check idx < pmc_data->ncore (14 < 14) will be false
and return ERR_PTR(-EINVAL).

Should pmc_data_allocate() be called with SAMA7G5_PMC_MAIN_RC + 1 as ncore?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105110715.2486=
432-1-ada@thorsis.com?part=3D6
