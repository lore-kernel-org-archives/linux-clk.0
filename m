Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7216425DB0D
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 00:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173260; cv=none; b=dubhS4JdhmijlwWgPu8oga5bRsR8r6NfRQNU3kkXB5TP/BqRtTzMyQdldd5a41CE6eGlCR3zRYYU1BKZTcmbQHVoy2Se88UH6VzpVfX5mLb/bCW0EAZX+fzrH9XGUgKQvGy2tZUJxUykzBjmakvXTjMV9TqHH7bfMv1mMvh/g/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173260; c=relaxed/simple;
	bh=zNSpQcnUk5X/pWgYkaTaH/fVSQtpiHrYBpAR6SvM4lo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p8ySLvPymXfwNgFTIFvKmxIQrYjT3l1DDv0hBeQ5ObLU0puk2E24K7Wuz3JuzalfExJrZcIG2YMUEO3whOwvL1rISwsGzNyESZKWX1cyusyVYDTWhNqEZIdFXnDNl9UOWf0U1lcKD71DjlVFYos6Jvv9x+8+XFDLcuVhj83dDJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbjwPt69; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbjwPt69"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF42F1F000FF;
	Sat, 12 Sep 2026 00:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789173259;
	bh=+GzAtPrvQ/p6dkmTCglvpuyYxFFrTfJ+iXqJrAC+eew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VbjwPt69em/FJ+Fx0UMoR/58sPBolEXRPPEL0kKFpPYUBoaggercdVz5mmN8+G1CV
	 ZyFf0Xl7NH25O1UX+J/C9EhEmxw0BuAr1DepKqtOpNI7QjMsTE/xYF79gcV6/TGbez
	 wRAhdoAzJ07Z2KPZC9zLcCkZIMM8wD/oXDth3IaBaZxUZr0wJHsdUZ/ApqRoUg2cRB
	 1GDoVSqPesukX+nOc44veNIZEoCx2orJnOjgkYcN3pILn/2iswN6XGdczPGZW+zNe0
	 ZNxOcEl/dNiwwsDjBHrMDPL8s7XDAQW8jA6+gtE7SwwGB/hPmMXUQBvAVWdoB71Pm0
	 kulOdBNkB8u4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] clk: nuvoton: ma35d1-divider: simplify
 allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260912002326.237419-1-rosenp@gmail.com>
References: <20260912002326.237419-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 00:34:18 +0000
Message-Id: <20260912003418.CF42F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds bitwise shift due to evaluating BIT(mask_bit) with m=
ask_bit =3D 0x1ffff.
- [High] Massive 1MB contiguous memory allocation and O(N) linear search fo=
r a simple linear clock divider.
--

commit c433ecbdd759eecab477bbeefb42c04e4a53b527
Author: Rosen Penev <rosenp@gmail.com>

clk: nuvoton: ma35d1-divider: simplify allocation

This commit simplifies the allocation in the ma35d1-divider driver by repla=
cing
a separate kcalloc for the clock divider table with a flexible array member.

> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvot=
on/clk-ma35d1-divider.c
> index e992e7c303419..6eaca5b35dd8c 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
[ ... ]
> @@ -83,30 +83,25 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *d=
ev, const char *name,
[ ... ]
>  	max_div =3D clk_div_mask(width) + 1;
>  	min_div =3D 1;
> =20
> -	table =3D devm_kcalloc(dev, max_div + 1, sizeof(*table), GFP_KERNEL);
> -	if (!table)
> +	div =3D devm_kzalloc(dev, struct_size(div, table, max_div + 1), GFP_KER=
NEL);

[Severity: High]
This isn't a bug introduced by this patch, but does this allocation request=
 an
excessively large amount of contiguous memory?

In ma35d1_clocks_probe() from drivers/clk/nuvoton/clk-ma35d1.c, this functi=
on
is called with width set to 17:

    hws[ADC_DIV] =3D ma35d1_reg_adc_clkdiv(dev, "adc_div", hws[PCLK0],
                                         &ma35d1_lock, 0,
                                         clk_base + REG_CLK_CLKDIV4,
                                         4, 17, 0x1ffff);

With width =3D 17, max_div becomes 131,072. The struct_size() calculation
requests an array of 131,073 struct clk_div_table elements. At 8 bytes per
element, this results in an order-8 allocation of slightly over 1MB.

Contiguous allocations of this size using devm_kzalloc() with GFP_KERNEL
are highly vulnerable to fragmentation and can frequently fail on long-runn=
ing
systems.

Additionally, passing this massive table to generic clock helpers like
divider_recalc_rate() and divider_determine_rate() causes an O(N) linear
search over all 131,073 entries on every rate query. Could this be optimized
to avoid generating the entire table in memory?

> +	if (!div)
>  		return ERR_PTR(-ENOMEM);
> =20
[ ... ]
> @@ -122,7 +117,6 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *d=
ev, const char *name,
>  	div->mask =3D mask_bit ? BIT(mask_bit) : 0;

[Severity: High]
This is a pre-existing issue, but does evaluating BIT(mask_bit) here cause
an out-of-bounds shift?

When ma35d1_clocks_probe() calls ma35d1_reg_adc_clkdiv(), it passes 0x1ffff
(131071) as the mask_bit parameter. Evaluating BIT(131071) triggers undefin=
ed
behavior in C.=20

On architectures like ARM64, this modulo-shifts into 1UL << 63, which trunc=
ates
to 0 when stored in the u32 mask, or 1UL << 31 on 32-bit systems.

Since this is used to populate the hardware register mask in
ma35d1_clkdiv_set_rate(), does this result in a corrupted clock configurati=
on
mask?

>  	div->lock =3D lock;
>  	div->hw.init =3D &init;
> -	div->table =3D table;
> =20
>  	hw =3D &div->hw;
>  	ret =3D devm_clk_hw_register(dev, hw);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912002326.2374=
19-1-rosenp@gmail.com?part=3D1
