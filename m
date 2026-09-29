Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738B439936D
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 07:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666958; cv=none; b=GyV9FOy0YVECXVBUnejBkGw+q1HxWGByzvig4Qy4nfizprXcze55mhUDVB1Kgqo9pO0HZ3QyPot1bEG7ZsLJrd+egFzEkHMfhKOKuPeWkoobKXOe1wJEdCttpnirH1JKghcAp1CMLMAw/NgeDwrjQKJ6cq6RLbj9ASvaU/LVf14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666958; c=relaxed/simple;
	bh=cqq86IKVYiOrT3Y+dLk8XzZsxe22ycoFbxy6JNozDl8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mSGNAEYzUYt6KFPoeJKIa3LdbWTwQo1OzAuaz6U9GOFR+BGOIheilk2KbFji8PfkJGyjSAK61oaHXNqktiAYYJMn74KBIyOZ4spCeGYddFXc3A6ZG3duWbPqQ4VYg6FqyD8TyBhXajloIHjtghDd/a3tnEo8svzJSTwhRLVfyOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CABhEc+5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CABhEc+5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46231F000FF;
	Tue, 29 Sep 2026 07:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790666957;
	bh=mV9BB8fOJygy9cVcgSRSQ4Vpg+LqzBv0Lbk8YIzXx0k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CABhEc+5ApIAbeK7xtDodQBvWaQeJxvsGFS9OLq2N5DR5hqygMZ2gBqBZMIQc66n4
	 elLcn0ruj2HGEYcAAufvwx3lYDOd4XZq4n1uVi+whoTpIjtN3FTBztCK7CaHId0PB4
	 WLDAkze1k7blM+9sClUeZwS+G3ysRDZubLPDEtde9PTtzsHiiZ7KwJOdHmsw2cmGYs
	 oeZMOU45Sm0cvTCgMWgOmmshq8/FTE1S/SfytLL9fdfuLPzikClHn86kEkqpskz1e+
	 MfBIfsR8KvM/KaQg8ftXUeZ9b4IdeQNmZmO/su9QmwLMpmS3fKM5esndp076rO+lDF
	 broil/GBVPMeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] clk: nuvoton: ma35d1-divider: use direct formula
 instead of divider table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260929072106.175202-2-a0987203069@gmail.com>
References: <20260929072106.175202-1-a0987203069@gmail.com>
 <20260929072106.175202-2-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 07:29:16 +0000
Message-Id: <20260929072916.E46231F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: nuvoton: rate mismatch and missing bounds check in determine_=
rate
- [High] clk: nuvoton: divide by zero due to integer overflow in rate multi=
plication
--

commit 434b92fcdb326fe48e43db4fafe0804d04aee387
Author: Joey Lu <a0987203069@gmail.com>

    clk: nuvoton: ma35d1-divider: use direct formula instead of divider tab=
le

This patch replaces the table-based clock divider with a direct formula in =
the
Nuvoton MA35D1 ADC clock divider driver. It drops the mask bit mechanism and
computes the divisor explicitly in the recalc, determine, and set rate
callbacks.

> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvot=
on/clk-ma35d1-divider.c
> index e992e7c303419..03fcf87caae18 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
[ ... ]
> @@ -29,44 +27,60 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_ad=
c_clk_div(struct clk_hw *_h
[ ... ]
>  static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
>  					struct clk_rate_request *req)
>  {
>  	struct ma35d1_adc_clk_div *dclk =3D to_ma35d1_adc_clk_div(hw);
> +	unsigned int val;
> +
> +	if (!req->rate)
> +		return -EINVAL;
> =20
> -	return divider_determine_rate(hw, req, dclk->table, dclk->width,
> -				      CLK_DIVIDER_ROUND_CLOSEST);
> +	val =3D DIV_ROUND_UP(req->best_parent_rate, 2 * req->rate);

[Severity: High]
Does this code divide by zero due to integer overflow in rate multiplicatio=
n?

If a caller or untrusted user (via debugfs) requests a rate such that
2 * req->rate overflows a 32-bit or 64-bit unsigned integer (for example,
rate =3D 1UL << (BITS_PER_LONG - 1)), the denominator 2 * req->rate wraps t=
o 0.

This would cause DIV_ROUND_UP(req->best_parent_rate, 0) to evaluate to a
division by zero panic.

[Severity: High]
Can this create a rate mismatch between ma35d1_clkdiv_determine_rate() and
ma35d1_clkdiv_set_rate()?

This calculates the divider using a strict ceiling instead of closest match,
and also fails to check rate boundaries against req->min_rate and
req->max_rate.

> +	if (val =3D=3D 0)
> +		val =3D 1;
> +	if (val > (unsigned int)clk_div_mask(dclk->width) + 1)
> +		val =3D clk_div_mask(dclk->width) + 1;
> +
> +	req->rate =3D DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2 * val=
);

It then promises a closest-rounded integer rate to the clock framework here.
When ma35d1_clkdiv_set_rate() is called later, the recomputation will yield=
 a
different divisor.

> +
> +	return 0;
>  }
> =20
>  static int ma35d1_clkdiv_set_rate(struct clk_hw *hw, unsigned long rate,=
 unsigned long parent_rate)
>  {
> -	int value;
> -	unsigned long flags =3D 0;
> -	u32 data;
>  	struct ma35d1_adc_clk_div *dclk =3D to_ma35d1_adc_clk_div(hw);
> +	unsigned long flags;
> +	unsigned int val;
> +	u32 data;
> +
> +	if (!rate)
> +		return -EINVAL;
> =20
> -	value =3D divider_get_val(rate, parent_rate, dclk->table,
> -				dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
> +	val =3D DIV_ROUND_UP(parent_rate, 2 * rate);

[Severity: High]
Could this identical integer overflow cause division by zero here as well?

Also, because the rate was rounded in ma35d1_clkdiv_determine_rate(),
recalculating the divider using DIV_ROUND_UP(parent_rate, 2 * rate) can yie=
ld
a completely different divisor.

For example, with parent_rate=3D1000 and an original val=3D6,
ma35d1_clkdiv_determine_rate() promises rate=3D83.

Then ma35d1_clkdiv_set_rate() calculates DIV_ROUND_UP(1000, 166) =3D 7, app=
lying
a divider of 7 instead of 6 (which results in an actual rate of 71 instead =
of
83).

> +	if (val =3D=3D 0)
> +		val =3D 1;
> +	if (val > (unsigned int)clk_div_mask(dclk->width) + 1)
> +		val =3D clk_div_mask(dclk->width) + 1;
> =20
>  	spin_lock_irqsave(dclk->lock, flags);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929072106.1752=
02-1-a0987203069@gmail.com?part=3D1
