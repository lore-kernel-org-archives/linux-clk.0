Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696936;
	b=Y93+cxGh8jp8BoCRWGxNE04K1nWYvB/xXFvBhOqfwJkrf9BZgNGG776Q5Zh4r7PDjheV
	 bkfUisS0YFUDMaBsZv7NfMeBQW2y5nZrM3mx5C46A7sYSgfOLkzJQTWccKUzN/1oj3+ql
	 ytW5GRN5cvy5SfmHusvKbO24vSMfDi8yLOAQzxn3187qSaE7XoicJpgwxcxOlQLkxxk18
	 fV14fmCkA9o0tROGtAMTbTq3Ji2EFy7Fo17LQRfZtHYm2fIgdfE7WKZikcH2f3DDk14xF
	 t8JvwDyTCLJwK1A8yWxrmt3lY5PHqvUcK/QPK7xGqM/hk/7o1s8ouc+NKF8u2btTBzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696936;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DqB3qjEvUuksu29T5tdkHfuaiZVHqgekZLMCgqODMas=;
	b=JBZxcXSxg1suEDJ4iwoctySm24Jt7j0eFrPSNt7zxcSgRGLx+psHk+TLVyROFuJh6tuA
	 eGOi05H5HyFIskcJ/xqdEprIWqLKVZUrPFC+iyvDW+9fVsOVLyx8iMoY0If10VAok8q/q
	 XXqAjaQcqP3hmNqametn2wFLi3bz2XV7d3if7Tq0HgjEOGSqoxPY5WhV5/pemlXUBVZ2m
	 pZATEeGwKqDDVAoR4hvM5nHZPoU8N3FwWsT8VpiXHheFFomPHUspkAt67BUailmDUAQcC
	 GwiX8utfDX/OQH5NdIAM/8t8EqCVgDUeeT4fMKr4lhvSZD3F0l3D839jZUyznTq2PcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fO0pasry;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8AD606A326;
	Tue,  3 Nov 2026 09:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fO0pasry
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486D21F000C1;
	Tue,  3 Nov 2026 09:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793696935;
	bh=DqB3qjEvUuksu29T5tdkHfuaiZVHqgekZLMCgqODMas=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fO0pasryvMlMdMMhBd86EmnJ3hpxmS1Z0cWniaSGcVglKvGrn519eiM52T2vMj67n
	 cEOiyrLaXKBHYLOKGGN425h1MBf8RU4L+O5JYcDLYK6Wye/C590DIdFr1M/rCkxCeZ
	 3cG0vmfw5bjMXhyE11UVgUPqEAM9fdGvgZ86qpSr2LMHkXMMLJpA6KKdb6y0CuJEDb
	 EaLZCBkzM0cEy+tFLnCRAur8lnkKKsKYe3yUpUE/Wdn99okdBu4qboBIt3pmXIJnLA
	 P9+0XTjulZCYr/o2jR0bi2Qnv0RJXjDrzQmcWI/iUjz/gCS9Co1ltjPX6CzDA2UGPI
	 TTEVp+PB4Y5CA==
Message-ID: <sashiko-outbox-194932@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/5] pwm: sun8i: Add H616 PWM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-h616-pwm-v8-v11-2-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
 <20261103-h616-pwm-v8-v11-2-07abb59575c3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 09:08:54 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] pwm: sun8i: rate_exclusive leak in sun8i_pwm_prepare_update() on=
 error
- [Medium] pwm: sun8i: false -EOPNOTSUPP in sun8i_pwm_clear_idle_deadzone()
- [Medium] pwm: sun8i: race in sun8i_pwm_put_rate() clearing rate_exclusive=
 early
--

commit 2ea581bca416bf89c24368c5ae4769a990d47584
Author: Richard Genoud <richard.genoud@bootlin.com>

pwm: sun8i: Add H616 PWM support

This commit adds waveform support for the six-channel Allwinner H616 PWM
controller, modeling shared pair clocks in CCF and programming channel-local
dividers and period/duty registers directly.

> diff --git a/drivers/pwm/pwm-sun8i.c b/drivers/pwm/pwm-sun8i.c
> new file mode 100644
> index 0000000000000..bcc2c57443780
> --- /dev/null
> +++ b/drivers/pwm/pwm-sun8i.c

[ ... ]

> +static void sun8i_pwm_put_rate(struct sun8i_pwm_chip *sun8i_chip,
> +			       unsigned int idx)
> +{
> +	struct sun8i_pwm_channel *chan =3D &sun8i_chip->channels[idx];
> +	bool exclusive;
> +
> +	scoped_guard(spinlock_irqsave, &sun8i_chip->lock) {
> +		exclusive =3D chan->rate_exclusive;
> +		chan->rate_exclusive =3D false;
> +	}
> +	/* CCF takes the prepare mutex and may call back into this driver. */
> +	if (exclusive)
> +		clk_rate_exclusive_put(chan->pair_clk);
> +}

[ ... ]

> +static void sun8i_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct sun8i_pwm_chip *sun8i_chip =3D sun8i_pwm_from_chip(chip);
> +	struct sun8i_pwm_channel *chan =3D &sun8i_chip->channels[pwm->hwpwm];
> +
> +	scoped_guard(spinlock_irqsave, &sun8i_chip->lock) {
> +		sun8i_pwm_set_enabled_locked(sun8i_chip, pwm->hwpwm, false);
> +		sun8i_pwm_set_bypass_locked(sun8i_chip, pwm->hwpwm, false);
> +	}
> +
> +	sun8i_pwm_put_rate(sun8i_chip, pwm->hwpwm);
> +	clk_disable_unprepare(chan->pair_clk);
> +	clk_put(chan->pair_clk);
> +	chan->pair_clk =3D NULL;
> +}

[Severity: Medium]
Can clearing chan->rate_exclusive before clk_rate_exclusive_put() in
drivers/pwm/pwm-sun8i.c:sun8i_pwm_put_rate() race with a concurrent
waveform update on the sibling channel?

In the PWM core, __pwm_put() calls ops->free() (sun8i_pwm_free()) under
pwm_lock without holding pwmchip_lock(chip), while waveform callbacks
(sun8i_pwm_round_waveform_tohw() and sun8i_pwm_write_waveform()) run under
pwmchip_lock(chip) without pwm_lock.

When an enabled channel is freed on one CPU while its sibling channel is
being updated on another CPU:

CPU0                                     CPU1
sun8i_pwm_free(idx)
  sun8i_pwm_set_enabled_locked(idx, false)
  sun8i_pwm_put_rate(idx)
    chan->rate_exclusive =3D false
                                         sun8i_pwm_round_waveform_tohw(idx =
^ 1)
                                           sun8i_pwm_pair_rate_constrained()
                                             -> returns false
                                         sun8i_pwm_write_waveform(idx ^ 1)
                                           sun8i_pwm_prepare_update()
                                             sun8i_pwm_set_enabled_locked(f=
alse)
                                             clk_set_rate(pair_clk, new_rat=
e)
                                               -> fails with -EBUSY
    clk_rate_exclusive_put(chan->pair_clk)

Because both SUN8I_PWM_ENABLE(idx) and chan->rate_exclusive are already
cleared before clk_rate_exclusive_put() drops CCF rate protection,
sun8i_pwm_pair_rate_constrained() on the sibling channel sees the pair as
unconstrained and attempts to change pair_rate, causing clk_set_rate() to
fail with -EBUSY while the freeing channel's protect_count is still held.

[ ... ]

> +static bool
> +sun8i_pwm_pair_rate_constrained(struct sun8i_pwm_chip *sun8i_chip,
> +				unsigned int idx)
> +{
> +	unsigned int sibling =3D idx ^ 1;
> +
> +	guard(spinlock_irqsave)(&sun8i_chip->lock);
> +	return sun8i_chip->channels[sibling].rate_exclusive ||
> +	       sun8i_pwm_channel_is_enabled_locked(sun8i_chip, sibling);
> +}
> +
> +static int sun8i_pwm_clear_idle_deadzone(struct sun8i_pwm_chip *sun8i_ch=
ip,
> +					 unsigned int idx)
> +{
> +	unsigned int pair =3D SUN8I_PWM_PAIR_IDX(idx);
> +	u32 pdzcr, per;
> +
> +	guard(spinlock_irqsave)(&sun8i_chip->lock);
> +	pdzcr =3D sun8i_pwm_readl(sun8i_chip, SUN8I_PWM_PDZCR(pair));
> +	if (!(pdzcr & SUN8I_PWM_PDZCR_ENABLE))
> +		return 0;
> +
> +	per =3D sun8i_pwm_readl(sun8i_chip, SUN8I_PWM_PER);
> +	if (per & sun8i_pwm_pair_enable_mask(pair))
> +		return -EOPNOTSUPP;
> +
> +	pdzcr &=3D ~SUN8I_PWM_PDZCR_ENABLE;
> +	sun8i_pwm_writel(sun8i_chip, pdzcr, SUN8I_PWM_PDZCR(pair));
> +
> +	return 0;
> +}

[Severity: Medium]
In drivers/pwm/pwm-sun8i.c:sun8i_pwm_clear_idle_deadzone(), can checking
only SUN8I_PWM_PER return a false -EOPNOTSUPP when a channel in the pair is
enabled in bypass mode?

In sun8i_pwm_read_waveform(), SUN8I_PWM_PDZCR_ENABLE is ignored when
wfhw->bypass_en is true:

	if (wfhw->enabled && !wfhw->bypass_en &&
	    ((pdzcr & SUN8I_PWM_PDZCR_ENABLE) || (pcr & SUN8I_PWM_PCR_MODE)))
		return -EOPNOTSUPP;

Similarly, sun8i_pwm_write_waveform() skips sun8i_pwm_clear_idle_deadzone()
when wfhw->bypass_en is true and sets SUN8I_PWM_ENABLE(pwm->hwpwm) in
SUN8I_PWM_PER.

If a pair has a dormant SUN8I_PWM_PDZCR_ENABLE bit set and a channel in that
pair is enabled in bypass mode (either by firmware or a prior
sun8i_pwm_write_waveform() call), a subsequent call to
sun8i_pwm_write_waveform() with !wfhw->bypass_en calls
sun8i_pwm_clear_idle_deadzone() before sun8i_pwm_prepare_update() stops the
channel. Because sun8i_pwm_clear_idle_deadzone() checks per &
sun8i_pwm_pair_enable_mask(pair) without checking whether the enabled
channel is in bypass mode (or is the channel being reconfigured out of
bypass mode), won't it reject the update with -EOPNOTSUPP instead of
clearing the dormant dead-zone bit?

[ ... ]

> +static int sun8i_pwm_prepare_update(struct pwm_chip *chip, unsigned int =
idx,
> +				    const struct sun8i_pwm_waveform *wfhw,
> +				  struct sun8i_pwm_waveform *old)
> +{
> +	struct sun8i_pwm_chip *sun8i_chip =3D sun8i_pwm_from_chip(chip);
> +	struct sun8i_pwm_channel *chan =3D &sun8i_chip->channels[idx];
> +	unsigned long rate, bus_rate;
> +	bool had_exclusive, stop;
> +	u32 pccr;
> +	int ret, restore_ret;
> +
> +	scoped_guard(spinlock_irqsave, &sun8i_chip->lock)
> +		had_exclusive =3D chan->rate_exclusive;
> +
> +	if (!had_exclusive) {
> +		ret =3D clk_rate_exclusive_get(chan->pair_clk);
> +		if (ret)
> +			return ret;
> +		scoped_guard(spinlock_irqsave, &sun8i_chip->lock)
> +			chan->rate_exclusive =3D true;
> +	}

[ ... ]

> +	/* Live PPR updates require unchanged configuration and a faster PCLK. =
*/
> +	bus_rate =3D clk_get_rate(sun8i_chip->bus_clk);
> +	stop =3D old->enabled &&
> +		(old->bypass_en !=3D wfhw->bypass_en || rate !=3D wfhw->pair_rate ||
> +		 (!wfhw->bypass_en &&
> +		  (((old->pcr ^ wfhw->pcr) &
> +		    (SUN8I_PWM_PCR_WAVEFORM_MASK | SUN8I_PWM_PCR_MODE)) ||
> +		   bus_rate <=3D DIV_ROUND_UP_ULL(wfhw->pair_rate,
> +			FIELD_GET(SUN8I_PWM_PCR_PRESCAL_K_MASK, wfhw->pcr) + 1))));
> +	if (stop) {
> +		scoped_guard(spinlock_irqsave, &sun8i_chip->lock)
> +			sun8i_pwm_set_enabled_locked(sun8i_chip, idx, false);
> +	}
> +
> +	if (rate =3D=3D wfhw->pair_rate)
> +		return 0;
> +
> +	ret =3D clk_set_rate(chan->pair_clk, wfhw->pair_rate);
> +	if (!ret && sun8i_pwm_get_pair_rate(sun8i_chip, idx) =3D=3D wfhw->pair_=
rate)
> +		return 0;
> +	if (!ret)
> +		ret =3D -EINVAL;
> +
> +	if (sun8i_pwm_get_pair_rate(sun8i_chip, idx) !=3D rate) {
> +		restore_ret =3D clk_set_rate(chan->pair_clk, rate);
> +		if (restore_ret || sun8i_pwm_get_pair_rate(sun8i_chip, idx) !=3D rate)=
 {
> +			dev_err(pwmchip_parent(chip),
> +				"pwm#%u: failed to restore pair clock rate %lu\n",
> +				idx, rate);
> +			goto put_rate;
> +		}
> +	}
> +	if (stop) {
> +		scoped_guard(spinlock_irqsave, &sun8i_chip->lock)
> +			sun8i_pwm_set_enabled_locked(sun8i_chip, idx, true);
> +	}
> +put_rate:
> +	if (!had_exclusive)
> +		sun8i_pwm_put_rate(sun8i_chip, idx);
> +
> +	return ret;
> +}

[Severity: Medium]
Does drivers/pwm/pwm-sun8i.c:sun8i_pwm_prepare_update() leak
chan->rate_exclusive (and leave SUN8I_PWM_PCCR_BYPASS_BIT(idx) set) when
restoring the pair clock rate fails on an already-enabled channel?

When updating an active channel (old->enabled is true, so had_exclusive is
true) that requires changing pair_rate, stop is true and the channel is
disabled in SUN8I_PWM_PER via sun8i_pwm_set_enabled_locked(sun8i_chip, idx,
false).

If clk_set_rate(chan->pair_clk, wfhw->pair_rate) fails (or rounds to a
different rate) and the rollback clk_set_rate(chan->pair_clk, rate) also
fails to restore the original rate, the error path jumps to put_rate without
re-enabling the channel in hardware.

At put_rate, sun8i_pwm_put_rate() is only called when !had_exclusive. Since
had_exclusive is true, chan->rate_exclusive remains true and
clk_rate_exclusive_put(chan->pair_clk) is not called even though the channel
is now disabled in hardware (and if old->bypass_en was true, its bypass bit
in SUN8I_PWM_PCCR is also left set), preventing the sibling channel from
changing the shared pair clock rate.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-h616-pwm-v=
8-v11-0-07abb59575c3@gmail.com?part=3D2
