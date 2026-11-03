Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698122;
	b=O08PF2MaeKOAH5gUHNyqeb6V/P+tWPJZOizHuZIAGl8tgbN5auWSJ8pWFIcjuIHld7va
	 BumvPQSM28Royzfr92h4zUvvmZeUMBlyfwrIBIARGqBmK9par5CbQn69uZut4NcQeIHls
	 w5Y78jbcMOliqZ+DjuI0loUThHRWcg7Ur2bFgATnfL75xsBOHgwnA9jXxE7h7praTAv1Y
	 GKqamqDHB+TYUzLgTcAv5yDJraFS5jUcAxb6rh4rvN+0R2bwLwvwFJz39csHujMkenGyX
	 nZF5QWJF/vVqd0E865vs9/+gPEhSIS0IGdvSgssRldFldpq9xr2bSQ2/TOQlw4T1baw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698122;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Moq4UlSyobES9iCmhh9xg66edYz/c69CLXAF/tF9DxQ=;
	b=AwPFwSCX8ZwlSxlsbUmCR+64A/wY0/leAzILCtRnW6Ll2X/8zWrX7tqY7J5ZksyG9uer
	 g/kKaj9CWE5GOY1iD5lXNRCoSnyUj6oDqXIpjfAfpETglBGr9ZHVE4oAKlztssFQTDN/g
	 YjINmd6s7m7pANI0xnjI+O4MmDZgKyExxQff3OMiIBdxxlQ+zOblJ+hZAJn7vuSHu3n08
	 nqAp5LFFzeEIpNQAhfanhlLJGV6l0rrP5+xlisFUB0HDXJjgF33U9TUfYRmVh5Xb1j8pz
	 +5lcNwg7bGCVesKKKV/Muxu3qFAwV/3u+aflUHAVWHGYSgLWW2ohJEoar0PmnF1iQWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NaVsKJMZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602F7606D807;
	Tue,  3 Nov 2026 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NaVsKJMZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD121F000C1;
	Tue,  3 Nov 2026 09:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793698122;
	bh=Moq4UlSyobES9iCmhh9xg66edYz/c69CLXAF/tF9DxQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NaVsKJMZYHgw5XhM83Bt6tYTl7XY/+VCUup/txT1NR6n2SOgwkg4RvOd6HWqWMo+a
	 pZprezmvePP/VB6nv4L4O8qmOfF5RBQOA1IpXniK1NxCFxk0mevE30OqxXGq82dsKM
	 lz//RgbZuVHkWRXREmP/9/e8pNaR4Zb7+V1h9lYvijA8LQ6UdRUdWpu+CwzrH1K1pG
	 7VbhhyCfiaGiWEa3r+cpORP+6Sdd2byDJkGyQUDP/3n/aZtv1xOg4wsgwHiZSKJL4M
	 RylzB79kmWoD4MioG/TmNrNywOdp6Gk7c/Sr158tLJUnJBqayHy31atIZZuQAU6gAe
	 mhhPHjN1UPy+w==
Message-ID: <sashiko-outbox-194955@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/5] pwm: sun8i: export the bypass outputs as clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-h616-pwm-v8-v11-3-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
 <20261103-h616-pwm-v8-v11-3-07abb59575c3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 09:28:41 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] pwm: sun8i: missed rate protection in sun8i_pwm_pair_rate_constr=
ained()
- [Medium] pwm: sun8i: sun8i_pwm_pair_rate_notifier() blocks bypass clk_set=
_rate()
- [Medium] pwm: sun8i: sun8i_pwm_read_waveform() clamps concurrent clk_set_=
rate()
- [Medium] pwm: sun8i: torn rate and constraint snapshot in sun8i_pwm_round=
_waveform_tohw()
--

commit 77adf52feb5fc5043dc604aa0ff2272bf2185bb6
Author: Richard Genoud <richard.genoud@bootlin.com>

pwm: sun8i: export the bypass outputs as clocks

This commit exports each Allwinner H616 PWM channel's hardware bypass path
as a Common Clock Framework clock and arbitrates channel ownership and pair
rate protection between PWM consumers and clock consumers.

> diff --git a/drivers/pwm/pwm-sun8i.c b/drivers/pwm/pwm-sun8i.c
> index bcc2c57443780..56854e6218c9a 100644
> --- a/drivers/pwm/pwm-sun8i.c
> +++ b/drivers/pwm/pwm-sun8i.c

[ ... ]

> @@ -399,12 +519,20 @@ static int sun8i_pwm_read_waveform(struct pwm_chip =
*chip,
>  	struct sun8i_pwm_waveform *wfhw =3D _wfhw;
>  	struct sun8i_pwm_chip *sun8i_chip =3D sun8i_pwm_from_chip(chip);
>  	unsigned int pair =3D SUN8I_PWM_PAIR_IDX(pwm->hwpwm);
> +	struct clk *pair_clk =3D sun8i_chip->pairs[pair].hw->clk;
>  	unsigned long pair_rate;
>  	u32 pccr, pcr, pdzcr, per, ppr;
> +	int ret;
> =20
> -	pair_rate =3D sun8i_pwm_get_pair_rate(sun8i_chip, pwm->hwpwm);
> -	if (pair_rate > U32_MAX)
> -		return -ERANGE;
> +	/*
> +	 * An unrequested channel can be retuned and enabled by a clock
> +	 * consumer. Keep its rate stable until the register snapshot is taken.
> +	 * Use the provider handle, separate from the PWM rate-setting handles.
> +	 */
> +	ret =3D clk_rate_exclusive_get(pair_clk);
> +	if (ret)
> +		return ret;
> +	pair_rate =3D clk_get_rate(pair_clk);
> =20
>  	scoped_guard(spinlock_irqsave, &sun8i_chip->lock) {
>  		pccr =3D sun8i_pwm_readl(sun8i_chip, SUN8I_PWM_PCCR(pair));
> @@ -413,6 +541,10 @@ static int sun8i_pwm_read_waveform(struct pwm_chip *=
chip,
>  		ppr =3D sun8i_pwm_readl(sun8i_chip, SUN8I_PWM_PPR(pwm->hwpwm));
>  		pdzcr =3D sun8i_pwm_readl(sun8i_chip, SUN8I_PWM_PDZCR(pair));
>  	}
> +	clk_rate_exclusive_put(pair_clk);

[Severity: Medium]
Could holding clk_rate_exclusive_get(pair_clk) across sun8i_pwm_read_wavefo=
rm()
cause concurrent clk_set_rate(), clk_set_rate_exclusive(), or clk_round_rat=
e()
calls on a child bypass clock to silently clamp to the existing rate?

In drivers/clk/clk.c, clk_rate_exclusive_get(pair_clk) increments
pair->hw->core->protect_count and releases prepare_lock before returning.
While sun8i_pwm_read_waveform() is between clk_rate_exclusive_get(pair_clk)
and clk_rate_exclusive_put(pair_clk), a clock consumer calling
clk_set_rate(bypass_clk, new_rate) or clk_set_rate_exclusive(bypass_clk,
new_rate) on chan->bypass_hw runs clk_core_set_rate_nolock() ->
clk_core_req_round_rate_nolock().

Because the temporary rate protection was taken directly on the parent
pair_clk handle rather than through bypass_clk, bypass_clk->core->protect_c=
ount
is 0, so clk_core_rate_nuke_protect() does not discount the hold on
pair->hw->core. When clk_core_round_rate_nolock() forwards the request to
pair->hw->core via CLK_SET_RATE_PARENT, clk_core_determine_round_nolock()
sees clk_core_rate_is_protected(pair->hw->core) is true and clamps the
request to the current pair rate, causing clk_core_set_rate_nolock() to
see no rate change and return 0 without updating the hardware clock rate.

[ ... ]

> @@ -510,7 +642,8 @@ sun8i_pwm_pair_rate_constrained(struct sun8i_pwm_chip=
 *sun8i_chip,
>  	unsigned int sibling =3D idx ^ 1;
> =20
>  	guard(spinlock_irqsave)(&sun8i_chip->lock);
> -	return sun8i_chip->channels[sibling].rate_exclusive ||
> +	return sun8i_chip->channels[sibling].mode =3D=3D SUN8I_PWM_MODE_CLK ||
> +	       sun8i_chip->channels[sibling].rate_exclusive ||
>  	       sun8i_pwm_channel_is_enabled_locked(sun8i_chip, sibling);
>  }

[Severity: Medium]
What happens if a consumer of the sibling bypass clock holds rate exclusivi=
ty
via clk_rate_exclusive_get() while the bypass clock is unprepared?

In drivers/net/phy/xpowers/ac300.c, ac300_ephy_ctl_create() locks the bypass
clock rate at probe time with devm_clk_rate_exclusive_get(dev, priv->clk),
while only calling clk_prepare_enable(priv->clk) in ac300_ephy_ctl_power_on=
()
and calling clk_disable_unprepare(priv->clk) in ac300_ephy_ctl_disable().

When the bypass clock is unprepared, sun8i_pwm_bypass_unprepare() resets
chan->mode to SUN8I_PWM_MODE_NONE:

drivers/pwm/pwm-sun8i.c:sun8i_pwm_bypass_unprepare() {
	...
	guard(spinlock_irqsave)(&sun8i_chip->lock);
	if (chan->mode !=3D SUN8I_PWM_MODE_CLK)
		return;

	chan->mode =3D SUN8I_PWM_MODE_NONE;
}

Even though pair->hw->core->protect_count remains non-zero in CCF from the
consumer's clk_rate_exclusive_get(), sun8i_pwm_pair_rate_constrained() sees
mode !=3D SUN8I_PWM_MODE_CLK, rate_exclusive =3D=3D false, and the sibling =
channel
disabled in hardware, so it returns false.

As a result, sun8i_pwm_round_waveform_tohw() treats the pair as unconstrain=
ed
and can pick a candidate waveform with a different pair_rate. Then in
sun8i_pwm_write_waveform() -> sun8i_pwm_prepare_update(),
sun8i_pwm_pair_rate_constrained() also returns false, so
sun8i_pwm_prepare_update() disables the active PWM channel in hardware when
stop is true and calls clk_set_rate(chan->pair_clk, wfhw->pair_rate), which
fails with -EBUSY in CCF because the pair clock is still rate-protected.
In addition, because chan->mode is SUN8I_PWM_MODE_NONE while unprepared,
sun8i_pwm_request() can claim the channel for PWM, causing the clock
consumer's next clk_prepare_enable() to fail with -EBUSY in
sun8i_pwm_bypass_prepare().

[Severity: Medium]
Can sun8i_pwm_round_waveform_tohw() also observe a mismatched pair_rate and
constraint state when racing with a sibling bypass clock consumer?

In sun8i_pwm_round_waveform_tohw(), current_rate is sampled before checking
sun8i_pwm_pair_rate_constrained():

drivers/pwm/pwm-sun8i.c:sun8i_pwm_round_waveform_tohw() {
	...
	current_rate =3D sun8i_pwm_get_pair_rate(sun8i_chip, pwm->hwpwm);
	if (!current_rate || current_rate > U32_MAX)
		return -ERANGE;
	rounding.current_pair_rate =3D current_rate;

	if (sun8i_pwm_pair_rate_constrained(sun8i_chip, pwm->hwpwm)) {
		sun8i_pwm_consider_pair_rate(&rounding, current_rate);
	...
}

When the PWM channel is currently disabled (so chan->rate_exclusive is fals=
e),
sun8i_pwm_round_waveform_tohw() does not hold rate exclusivity on the pair
clock. Because CCF operations on the sibling's bypass clock do not acquire
pwmchip_lock(chip), a concurrent sibling clock consumer can call
clk_set_rate() and clk_prepare_enable() after sun8i_pwm_get_pair_rate()
returns the old rate but before sun8i_pwm_pair_rate_constrained() checks
channels[sibling].mode =3D=3D SUN8I_PWM_MODE_CLK.

Wouldn't sun8i_pwm_round_waveform_tohw() then round exclusively against the
stale pre-retune current_rate instead of the rate at which the sibling just
locked the pair clock?

> @@ -1033,6 +1166,42 @@ static int sun8i_pwm_register_pair_clocks(struct d=
evice *dev,
>  	return 0;
>  }
> =20
> +/* Register the bypass clock for each channel. */
> +static int sun8i_pwm_register_bypass_clocks(struct device *dev,
> +					    struct sun8i_pwm_chip *sun8i_chip)
> +{
> +	for (unsigned int i =3D 0; i < SUN8I_PWM_NPWM; i++) {
> +		struct sun8i_pwm_channel *chan =3D &sun8i_chip->channels[i];
> +		struct clk_hw *parent =3D sun8i_chip->pairs[SUN8I_PWM_PAIR_IDX(i)].hw;
> +		const char *name;
> +		int ret;
> +
> +		name =3D devm_kasprintf(dev, GFP_KERNEL, "%s#pwm-bypass%u",
> +				      dev_name(dev), i);
> +		if (!name)
> +			return -ENOMEM;
> +
> +		chan->chip =3D sun8i_chip;
> +		chan->index =3D i;
> +		/*
> +		 * Protect the shared rate while prepared. Preserve unclaimed
> +		 * firmware outputs through CCF's unused-clock cleanup, as for
> +		 * PWM waveforms; only a consumer may turn them off.
> +		 */
> +		chan->bypass_hw.init =3D
> +			CLK_HW_INIT_HW(name, parent, &sun8i_pwm_bypass_ops,
> +				       CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE |
> +				       CLK_IGNORE_UNUSED);

[Severity: Medium]
If firmware leaves a channel enabled at boot, will clk_set_rate() on that
channel's bypass clock always be rejected with -EBUSY by
sun8i_pwm_pair_rate_notifier()?

When firmware leaves a channel enabled (with SUN8I_PWM_PCCR_GATE and
SUN8I_PWM_ENABLE(i) set), sun8i_pwm_sanitize_disabled_pairs() and
CLK_IGNORE_UNUSED preserve the enabled state in hardware. Because
chan->bypass_hw is registered with CLK_SET_RATE_GATE, clk_prepare() protects
the clock rate in CCF, so any clk_set_rate() call (including from DT
assigned-clock-rates or a consumer before clk_prepare_enable()) must happen
while chan->bypass_hw is still unprepared and its CCF enable_count is 0.

However, the hardware enable bit SUN8I_PWM_ENABLE(i) in SUN8I_PWM_PER is
only cleared later in sun8i_pwm_bypass_enable() or sun8i_pwm_bypass_disable=
().
When clk_set_rate() is called on the unprepared bypass clock, CCF propagates
PRE_RATE_CHANGE to pair->hw while SUN8I_PWM_ENABLE(i) is still set in
SUN8I_PWM_PER:

drivers/pwm/pwm-sun8i.c:sun8i_pwm_pair_rate_notifier() {
	...
	guard(spinlock_irqsave)(&sun8i_chip->lock);
	active =3D sun8i_pwm_readl(sun8i_chip, SUN8I_PWM_PER) &
		 sun8i_pwm_pair_enable_mask(pair->index);

	return active ? NOTIFY_BAD : NOTIFY_OK;
}

Unlike sun8i_pwm_prepare_update() on the PWM path, which clears
SUN8I_PWM_ENABLE(idx) before calling clk_set_rate(), nothing clears
SUN8I_PWM_ENABLE(i) before a bypass clock rate change, so
sun8i_pwm_pair_rate_notifier() sees active is true and aborts the rate chan=
ge
with NOTIFY_BAD (-EBUSY).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-h616-pwm-v=
8-v11-0-07abb59575c3@gmail.com?part=3D3
