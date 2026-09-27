Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083A6305057;
	Sun, 27 Sep 2026 21:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542842; cv=none; b=XQP2w6ubnW/pwXYefGKMQwR6fRlwZBceQeYfUYypdlMWhdMDBUsIO1B8yZQi5/+Iiyn0bL/SWuLAu0HSzMvajTgmpADEE8YtpxSBxXuT90vrM8yxfRV/KTOm5f8/vPA/yK3fDknpttcfQ2XCCY5zBM2rxbmt/EBgZ8AEcBmclgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542842; c=relaxed/simple;
	bh=CDSm2ISfp5dPXp4SVbvpegxs4b82E9JZ/a21b0FLhVc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ImWpr4F9DOmg1U0CqpjsTKIGhbrJllgbOSVCoXyoqAFNSzZZb4TF2GsPiTs8IpRw6l9uAB42PbcQUoiiXQ0x0qhf+7eCJqOFZTv5wqIOZL0M5xQ5P7hkSSv/OfxAM4QoaePieYRJ/aBbtnG5sMZUMz3Fmy/qSirC9MryQj623ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fcqN94Mz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fcqN94Mz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F36A1F000FF;
	Sun, 27 Sep 2026 21:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790542840;
	bh=B2mLz/gUdjC0fGdcdDan15QQl2zdciRUNW0AaKpUx1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fcqN94Mz46SwALZrQdhS8hI2opGqbqM2XIURVoGaiZdgkZN63qtL4Q5K5pWzmeCHs
	 84tsOHgGGFaXVYTM6uSBIl7Og6oLrBCpyHcNGgWmqJUiPyvDXUccRiqug4t3ZxBYeV
	 NQWa02wIm1swkp0nLJe1kNZabW6Hkp0bMho1edYprZLNkM+wMtE8IoK8PoP0ftpk6q
	 yiXPkWBJ/Oz1dgJG4drMa0gj1wvJbE6Ltu+dXubNB5yujhE0AyeOykL3C2db3hQYsu
	 n1y1gcjNHIQHgtlz31To9sNKjBf8njcpkCIfdThtZTo4miYC5YigSQksYCqCMP+fVh
	 j9+wyeVYOMhUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 08/13] clk: zte: Add zx PLL support infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: linux-clk@vger.kernel.org, olteanv@gmail.com, mfd@lists.linux.dev, lee@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260927-zx29clk-v13-8-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927-zx29clk-v13-8-70d8f673386c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 21:00:39 +0000
Message-Id: <20260927210040.4F36A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: zte: unsafe instant PLL rate changes permitted due to missi=
ng CLK_SET_RATE_GATE
--

commit 81b8ceca645bb1aa1a8c8fd73b9fdfcf93600c0d
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Add zx PLL support infrastructure

This patch adds code to decode and program PLL settings on ZTE's zx297520v3
SoC, parsing bootloader-programmed values to fill the clock tree with
appropriately clocked parent clocks instead of hardcoded fixed rates.

> diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
> index fc76c6524a163..d3687495d06ce 100644
> --- a/drivers/clk/zte/pll-zx.c
> +++ b/drivers/clk/zte/pll-zx.c
[ ... ]
> +static int zx29_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			     unsigned long parent_rate)
> +{
> +	struct zx29_clk_pll *pll =3D to_zx29_clk_pll(hw);
> +	u32 setting;
> +
> +	/*
> +	 * TODO: Implement gradual PLL rate change. PLLs can be changed while t=
hey are running and
> +	 * downstream hardware is generally fine with that. The exception is DR=
AM, which reads
> +	 * incorrect values if changed too fast.
> +	 *
> +	 * Changing the mpll rate is potentially useful for over/underclocking.=
 Gating mpll is
> +	 * unrealistic because too many devices depend on it.
> +	 */
> +	setting =3D zx29_pll_calc_values(pll, parent_rate, rate, rate, rate);
> +	if (!setting)
> +		return -EINVAL;
> +
> +	dev_dbg(pll->dev, "%s: Setting new configuration: 0x%08x\n", clk_hw_get=
_name(hw), setting);
> +
> +	return regmap_update_bits(pll->map, pll->reg, 0x00ffffff, setting);

[Severity: Medium]
Will writing the new divider values instantaneously here cause a clock glit=
ch
for large rate changes?

The TODO notes that gradual rate changes are not yet implemented, which cou=
ld
lead to temporary incorrect clock output or DRAM corruption if a rate change
is requested.

[ ... ]
> +struct clk_hw *zx_clk_register_pll(struct device *dev, struct regmap *re=
gmap,
> +				   const struct zx_pll_desc *desc, struct clk_hw * const *clocks)
> +{
[ ... ]
> +	init.name =3D desc->name;
> +	init.parent_data =3D parents;
> +	init.num_parents =3D desc->num_parents;
> +
> +	/*
> +	 * Disallow live reparent, but allow rate changes. PLLs can handle grad=
ual changes fine, but
> +	 * large ones cause a temporary incorrect output, which can break downs=
tream devices.
> +	 * See zx29_pll_set_rate for considerations on that.
> +	 */
> +	init.flags =3D CLK_SET_PARENT_GATE;

[Severity: Medium]
Since gradual rate changes are not actually implemented yet, does omitting =
the
CLK_SET_RATE_GATE flag misinform the clock framework that it is safe to app=
ly
live rate changes to this PLL?

While gating mpll might be unrealistic as noted earlier, leaving out
CLK_SET_RATE_GATE before gradual stepping is implemented might permit unsafe
live jumps if a rate change is ever requested on an active PLL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-zx29clk-v1=
3-0-70d8f673386c@gmail.com?part=3D8
