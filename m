Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888561;
	b=Nu8hsy4ixaJV85SGEva8Qe+XfNRCz+iz+JCfQ/2nVP0q5nVgLaIANKvwWYr/DOlTzZli
	 7UdiadNBu59SHsnGXJiP9glrxjSP/PlytGJNyvYmAavabm3ErYYMX0JOw4rnjotkl9c3M
	 4NI2Khj2MvWHfPyDhZfJ8HKcDNuzvl8YnDJs1LH2jtlvEHFPMz5JuPXktGeV1SL9PjNuz
	 ItSUmtTLgQwogUf12VcJIKRnMlS+6RdvphS4U0Zil81mha/G8JMVAe8rbItsF5BGmUvhf
	 wSDHa9S8KYwiw9Il2toWcly9rHgrOpuAArwcnoH11gpwc773T1DoTKxO1rhbUsvTkig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888561;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5IVJZzCrUnwzS2uL1hX4fgGGmPK7uxeelkLsfCcWaPw=;
	b=o6ANg9e9yJPvUM5qOSdgMy//GDdSiyaNVL1JCyaibS6Nnm39SsUwdj/UnJXEvpLHy1gB
	 W7vPrcg1siWJM5jwR+l+UagmQvh65yq6M8ooCs25ddU1F84DQWZUcm3lZC7TJQBx7rClu
	 zIfgL+F2kaeWQKPciPDDoxMQKUR5ZuKpiQW+CUcrJGFL1tEiXDtW9AlY0HMRpYLDnKo3Q
	 FcINitL3DRecgMSfyw53NUcG1hs1QdqbWmSIOMx1MBGQ2KKkUIUKQ9tLIf927zuUtUPRM
	 J9Z8HSbk6WnEonE4m31Sky/48STn20KzmdwAlqrbesC/pHRdMLn5z/UVTueeLtWc05w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bGtq5m/k";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBC6606A31B;
	Thu,  5 Nov 2026 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bGtq5m/k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605C81F000C1;
	Thu,  5 Nov 2026 14:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888560;
	bh=5IVJZzCrUnwzS2uL1hX4fgGGmPK7uxeelkLsfCcWaPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bGtq5m/kLmn2wPBL3BhtrSgCigwZ+6v8rWztHlButHHT3pTMHD6mmGbXiRcz6vBKO
	 N0aUInX7wkytT+zKqyrkDvNseq88WNG2espipNlCE440gtIUrXeFr6UxF/VQ/MOwhd
	 igU5N5pRdEzmPvZMx5/jVxbQiBPzsgsyVi9w7VqO3oLBObM0nb/qxo7x5grY9LE0uT
	 kFyXx3OJGoR5P0FjinnQIy0fR+ZGhunqEZFXHN4q0KK6nXlZsfKJVoaphYtHeZeFR5
	 q/FOmHmf5X/m4QXnYztYfLmY37yX8uWIwcrFYjetPUY/MQxgBRljKLyxRFKIZxDwSI
	 6xMXgf16h7YCg==
Message-ID: <sashiko-outbox-199236@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/16] clk: at91: Allow enabling main_rc_osc through
 DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Dahl" <ada@thorsis.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105110715.2486432-6-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-6-ada@thorsis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 14:22:40 +0000
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
- [High] clk: at91: uninitialized hw stored in sama7d65 and sama7g5 pmc_set=
up()
- [High] clk: at91: out-of-bounds chws write in sama7g5_pmc_setup() for MAI=
N_RC
--

commit e5d4dc667c53860fc5c8c99266b722d5024ab4e6
Author: Alexander Dahl <ada@thorsis.com>

clk: at91: Allow enabling main_rc_osc through DT

This commit exports the main_rc_osc clock in the PMC core clock array on
SAM9X60, SAM9X7, SAMA7D65, and SAMA7G5 so that consumers such as the OTPC
controller can reference and enable it via Device Tree.

[ ... ]

> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index 0b5356467fa52..ef54d2fa6cf40 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1138,6 +1138,7 @@ static void __init sama7d65_pmc_setup(struct device=
_node *np)
>  						   50000000);
>  	if (IS_ERR(main_rc_hw))
>  		goto err_free;
> +	sama7d65_pmc->chws[SAMA7D65_PMC_MAIN_RC] =3D hw;

[Severity: High]
Should this assign main_rc_hw instead of hw?

In sama7d65_pmc_setup(), at91_clk_register_main_rc_osc() stores the
registered clock pointer in main_rc_hw, while the local variable hw is still
uninitialized at this point:

drivers/clk/at91/sama7d65.c:sama7d65_pmc_setup() {
	...
	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
	...
	main_rc_hw =3D at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 120000=
00,
						   50000000);
	if (IS_ERR(main_rc_hw))
		goto err_free;
	sama7d65_pmc->chws[SAMA7D65_PMC_MAIN_RC] =3D hw;
}

> =20
>  	bypass =3D of_property_read_bool(np, "atmel,osc-bypass");
> =20
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index 99b4c1d9bdcca..9a6f0f30b2b7e 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -1014,6 +1014,7 @@ static void __init sama7g5_pmc_setup(struct device_=
node *np)
>  						   50000000);
>  	if (IS_ERR(main_rc_hw))
>  		goto err_free;
> +	sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] =3D hw;

[Severity: High]
Doesn't this also assign the uninitialized hw variable instead of main_rc_h=
w,
and write past the end of sama7g5_pmc->chws[]?

In include/dt-bindings/clock/microchip,sama7g5-pmc.h, SAMA7G5_PMC_MCK1 is 13
and SAMA7G5_PMC_MAIN_RC is 14:

#define SAMA7G5_PMC_MCK1	13
#define SAMA7G5_PMC_MAIN_RC	14

However, sama7g5_pmc_setup() allocates sama7g5_pmc with ncore set to
SAMA7G5_PMC_MCK1 + 1 (14):

drivers/clk/at91/sama7g5.c:sama7g5_pmc_setup() {
	...
	sama7g5_pmc =3D pmc_data_allocate(SAMA7G5_PMC_MCK1 + 1,
					nck(sama7g5_systemck),
					nck(sama7g5_periphck),
					nck(sama7g5_gck), 8);
}

Because chws only has 14 entries (indices 0..13), indexing
sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] writes to index 14 (aliasing
sama7g5_pmc->shws[0]), and of_clk_hw_pmc_get() will reject lookups for
SAMA7G5_PMC_MAIN_RC:

drivers/clk/at91/pmc.c:of_clk_hw_pmc_get() {
	...
	case PMC_TYPE_CORE:
		if (idx < pmc_data->ncore)
			return pmc_data->chws[idx];
		break;
}

Should pmc_data_allocate() in sama7g5_pmc_setup() be updated to pass
SAMA7G5_PMC_MAIN_RC + 1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105110715.2486=
432-1-ada@thorsis.com?part=3D5
