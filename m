Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8C63DFC62;
	Tue, 18 Aug 2026 10:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049968; cv=none; b=LJ3ZFks/lfbOZE7SFV0qvGz70oYbWrDCkQkxWd+jaBrduzg4NiFlDDa4QhWbkfsO6GJIgOwnSN9ZZ5RxxGhpebQMk3pBH7W8uFWKEj1afQm+HxsVbaLzAm5A0ierD66D+mnpFycrYpFi1XiOaMGXyWm7Q2vZHe0q5YEAdh8Jw4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049968; c=relaxed/simple;
	bh=oey+3F/Cpb3O0UZR6Kb4anKINlVKHyJl6QDFUUMQdgc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cgg4vtr8b5LWyJ0Rs4dbzLkkVcvyoBUwj4zsMw5gXsflLxIo+rKLRr8eSIi/5AcNg4Jcs18jsRfefgjkoCj8+hBM1ncnqf/GdY4fvlG5DJLXk7Gv75TYA57LPTtTNEYvuEJPzsHyrjejSv0SqbabXUn8EU6pQaP5TW6Z2rOJPeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8qoCZN+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8qoCZN+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5AD1F000E9;
	Tue, 18 Aug 2026 10:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049966;
	bh=TWuRSPa+VpEGmcqPFhc3WyhoQkbtgPe2oVc1W0BHU54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H8qoCZN+uus68ffs3SxltIIJE3KZmpqG4T8M1fZ0QR4lO6CmZzNKwAKfUygpLjUAc
	 AHn99HTkU6nUWgsRge8KbM/qm79TKA39oN8/8X5UNkQDdltZ6Vu5upf9oWXRHUYI6b
	 Xv/fvNLiFyOaUaAvTaAb9AxtnwTIUlWweO7/Da+qxWDO/l6pxcfgd26x32u0jm8hhv
	 ZcMmPDasMYaB4vNdFZTFz7Rw/iZR4/4F535zQkkeMf8jF/t8Ac0Izj1St1FwzVYMtS
	 FK3RN60wupm2+ghCV6/1KtKvwCLc9i+08qE0cfC3ofMnKFOR6cD5x+Z41McFMV4lEq
	 dsnKZVCfDt7nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/12] clk: ambarella: add CV75 CCU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260818-cv75-v5-v5-7-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-7-7bbb12f0360f@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:46:06 +0000
Message-Id: <20260818104606.8A5AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Casting away `const` to modify a `const`-qualified array member via=
 `memcpy` invokes undefined behavior.
--

--- Patch [7]: [PATCH v5 07/12] clk: ambarella: add CV75 CCU driver ---
commit 477493a502606783178c884c88d17f74d16fc602
Author: Long Zhao <longzhao@ambarella.com>

clk: ambarella: add CV75 CCU driver

Add the Ambarella CV75 clock driver covering the core PLL and the UART0
/ AHB / APB clocks needed for early console bring-up.

> diff --git a/drivers/clk/ambarella/ccu-cv75.c b/drivers/clk/ambarella/ccu=
-cv75.c
> index 0000000000000..d682da3cf28d3
> --- /dev/null
> +++ b/drivers/clk/ambarella/ccu-cv75.c

[ ... ]

> +static struct clk_hw *amb_cv75_register_clk(struct device *dev,
> +					    struct amb_ccu *ccu,
> +					    const struct amb_cv75_clk_desc *desc,
> +					    struct clk_hw *osc,
> +					    struct clk_hw *dummy)
> +{
> +	struct amb_pll_desc pll_desc;
> +	struct clk_hw *parent;
> +
> +	switch (desc->type) {

[ ... ]

> +	case AMB_CV75_CLK_PLL:
> +		parent =3D amb_cv75_get_parent(ccu, osc, dummy, desc->parent);
> +		if (IS_ERR(parent))
> +			return parent;
> +
> +		pll_desc.name =3D desc->name;
> +		pll_desc.parent =3D parent;
> +		memcpy((void *)pll_desc.reg_offset, desc->pll.reg_offset,
> +		       sizeof(pll_desc.reg_offset));

[Severity: Low]
Is it safe to cast away the const qualifier here?=20

The reg_offset array in struct amb_pll_desc is defined as const u32. Modify=
ing
a const-qualified object through a non-const pointer like this results in
undefined behavior under C language rules.

Could this be refactored so that the struct initialization doesn't require
casting away const?

> +		pll_desc.soc_data =3D desc->pll.soc_data;
> +		pll_desc.frac_mode =3D false;
> +
> +		return amb_pll_register(dev, ccu->map, &pll_desc);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-cv75-v5-v5=
-0-7bbb12f0360f@ambarella.com?part=3D7
