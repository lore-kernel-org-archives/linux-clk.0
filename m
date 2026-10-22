Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702977;
	b=JGSFibdwY0BirwlME9dgNeW/fkYg3PZZOKleUi8Qm6r5c4hjNcNE15t8zNtC4XZgeOcD
	 tycmm4R+DCkMUZOvrQjzEC/dP9qYQCWgWDmAy8yJ8u3c8shd2ySp/4GMOONEVYXitPo4N
	 x2oF1hhnlBnaoiCGNs43AYnsnW4lf8MjqkH/ypwq7nvuefDHVqxY87SwqOcVNTuKhZdUA
	 s8hfVNjPM/Fns4BFRVbzL3NjNq40gphkyG9+SkzESn8WJHkhOjUlSZ52OKCn95V/egINV
	 lxaCRkiXeVCfFeVtc6A+NvuW67nahnjX8FYO/Gx4gDYzoxyN3wmuVPPE0yYeCA9ODNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702977;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JXEDcGfMB6XU0rii3dvORR97Io02FDaSqnZo2gONcgk=;
	b=E3lARpH9ngnL5ZQQYBixchD6+LWodFQCRbawLK+ul5x3Kvf2HiO/NwcDkYkKu+6bdEyz
	 f14/XWFQ1i5pgPx9QYlAkdCniRGwQBl1tkA/4ndRzrIaSKHuR2njcXfkzn1fNmcUIAliR
	 lMLSePqSe8B1r+uqM+RCXOnwEFf3aoiwO39XiXL8Ft4XMCGYO6O7xkaPAfTK9Ca+2IZsX
	 2KtFCuZ0mGTZMcar8i7nryjGFP7cymgEXKOP7Pn8OUZ2uRDIytVojRETjjhubfg5Xbs8M
	 wLHaEKIiOEFsecfD7AryEG7VnqXaVeGiY3q8iEbszBGOMouOkt/sTTmqCf2Kd4fy2Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eUPmg1xO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA7A606A319
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 21:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eUPmg1xO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4CC1F01825;
	Thu, 22 Oct 2026 21:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792702976;
	bh=JXEDcGfMB6XU0rii3dvORR97Io02FDaSqnZo2gONcgk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=eUPmg1xOjYtNVXjpY32X+pBTvfSgQUQWmo5F1lwOhqUVJEUMu4tVtGnMYfx95UZQg
	 CQiMt6dGBsQhzuDfkEBvILX75iPvJ+V+Onun98ypa770LqPn+ikG7qOXd68B0SyEyj
	 60A2pAZH4ioxRwtPNP8bzcsMuwWPuv7HipMFBLsPFETiHOKrtddAUD9y2K68CQmo0O
	 Q0prMn+b/WJDRc62pWpyuiCcC16tYKPPdJGyvqo9oJEG8FWPG+TeI5Pf/gItt7u/W3
	 eRdssZ8NG4jO6js1iUrbdUb/fj06QXYQpqJTom8VHtfMWzc68D54IQItxH7zV8OINX
	 lQLcRHwvLGCQw==
Message-ID: <sashiko-outbox-182041@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] clk: en7523: convert to full clk_hw implementation
 for en7581
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org
In-Reply-To: <20261022205535.688352-2-ansuelsmth@gmail.com>
References: <20261022205535.688352-1-ansuelsmth@gmail.com>
 <20261022205535.688352-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 21:02:56 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: en7523: negative error returned as unsigned rate in en7581_=
recalc_rate()
--

commit 3b91713eaffa8e4eb9f5cbbb86a0f1a541e129cc
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: convert to full clk_hw implementation for en7581

This commit converts the Airoha EN7581 clock registration in
drivers/clk/clk-en7523.c from fixed-rate clocks to a full clk_hw
implementation with a dedicated .recalc_rate callback in preparation for
adding .set_rate support.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 24fdec2e6198c..2f203c94f87e9 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c

[ ... ]

> @@ -742,46 +748,76 @@ static int en7523_clk_hw_init(struct platform_devic=
e *pdev,
>  				     en7581_rst_ofs);
>  }
> =20
> -static void en7581_register_clocks(struct device *dev, struct clk_hw_one=
cell_data *clk_data,
> -				   struct regmap *map, void __iomem *base)
> +static unsigned long en7581_recalc_rate(struct clk_hw *hw,
> +					unsigned long parent_rate)
>  {
> -	struct clk_hw *hw;
> +	struct en_clk *c =3D container_of(hw, struct en_clk, hw);
> +	const struct en_clk_desc *desc =3D c->desc;
> +	struct regmap *map =3D c->map;
> +	u32 val, reg;
>  	u32 rate;
> +	int err;
> +
> +	err =3D regmap_read(map, desc->base_reg, &val);
> +	if (err) {
> +		pr_err("Failed reading fixed clk rate %s: %d\n",
> +		       desc->name, err);
> +		return err;
> +	}
> +	rate =3D en7523_get_base_rate(desc, val);
> +
> +	reg =3D desc->div_reg ? desc->div_reg : desc->base_reg;
> +	err =3D regmap_read(map, reg, &val);
> +	if (err) {
> +		pr_err("Failed reading fixed clk div %s: %d\n",
> +		       desc->name, err);
> +		return err;
> +	}

[Severity: Medium]
In drivers/clk/clk-en7523.c, when either regmap_read() call on desc->base_r=
eg
or reg fails in en7581_recalc_rate(), returning the negative int err from an
unsigned long .recalc_rate callback converts it into a large positive value
instead of 0.

Per struct clk_ops in include/linux/clk-provider.h, .recalc_rate must retur=
n 0
if the driver cannot figure out a rate for the clock, as callers such as
__clk_core_init() and clk_recalc() in drivers/clk/clk.c store the returned
unsigned long directly into core->rate.

Should both error paths in en7581_recalc_rate() return 0 instead of err?

> +
> +	return rate / en7523_get_div(desc, val);
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022205535.6883=
52-1-ansuelsmth@gmail.com?part=3D1
