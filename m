Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2075923BD06;
	Tue, 22 Sep 2026 00:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790036211; cv=none; b=t9w8e3JHMqaVsMT6vno5RWSbebzLQ+2MdFADBpORhNG8VnhU71y+qXZNSkUwlX25xrQiL5+Yd0ke8b8Z10MruxxkOnZZ5CiUy5RDrRxVmp9aQxvW8GwgwzeYeiry8xXrEXB2OKeCeBLYC7CdK/iLp1oYzK2Fl8xwi1iGEpGKNvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790036211; c=relaxed/simple;
	bh=BeQqE4VZaXS0MvM6vR6HDa49zYpfup78vXqbWx1F/yU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fVh4ZgGTB+oxfG47p9dKyd/rX0RKkc2a401fAskeo1bOJ9U6t9ZhXgnyghXcLQoObxQZXvurt/nJO8MCPio7yWqp+ItHMgtMcN0gAsB3aPzoTSex8l/03Fngd9iX4x72BagzVjpNivbB78x3JTP51k2iFZfNx7VsCH4Q+2rCJQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkI1di6u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkI1di6u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FBEE1F000FF;
	Tue, 22 Sep 2026 00:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790036209;
	bh=DXSRb0hanI+IsthfMCoktX8o/BnRO9xl61bsf7Sl3+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IkI1di6uLU/KglIH1NFyRSeegDVKshr0+8tJCOddLIKgYYAsDyiLu02y79I6WiWsA
	 wRXyxHdVNDPuM/AGfilQurUVlcJbhtzVR9FZQmLSj8iCmZDO+2QEqPWwyQ07YqH33F
	 MQzW4IjxaC7qbckiaLUbASHz/7uRX049mXTOK8cCpbLEc2rQbl7tDaiaz8edLopg/B
	 MAUxXGEwzZ9YlauNqFoeO3iAVBky87nf0TuZUk7MTel1Hnyu5CwDqO6FAGsxrAd4xk
	 8sPlSAi8DIOJb5lVVZAw+vewTYjo+jpDK2xoVIXhXtpdHuJeDbG3dfBNmr0ZLJgVG9
	 kbFxvCVN3CZAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/5] pwm: sun8i: Add H616 PWM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260921-h616-pwm-v8-v9-2-37bec6201ff5@gmail.com>
References: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
 <20260921-h616-pwm-v8-v9-2-37bec6201ff5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 00:16:48 +0000
Message-Id: <20260922001649.5FBEE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] goto mixing with scoped_guard() cleanup helpers
--

commit d272817b7f4a414d55278ac7371a0119d48346da
Author: Richard Genoud <richard.genoud@bootlin.com>

pwm: sun8i: Add H616 PWM support

Add waveform support for the six-channel Allwinner H616 PWM controller.
Each pair of outputs shares a source mux, gate and power-of-two divider;
each channel has its own prescaler and period/duty registers. Model the
shared pair clocks in CCF and program the channel-local dividers directly.

> diff --git a/drivers/pwm/pwm-sun8i.c b/drivers/pwm/pwm-sun8i.c
> new file mode 100644
> index 0000000000000..7e6c39815c183
> --- /dev/null
> +++ b/drivers/pwm/pwm-sun8i.c
[ ... ]
> +static int sun8i_pwm_request(struct pwm_chip *chip, struct pwm_device *p=
wm)
> +{
> +	struct sun8i_pwm_chip *sun8i_chip =3D sun8i_pwm_from_chip(chip);
> +	struct sun8i_pwm_channel *chan =3D &sun8i_chip->channels[pwm->hwpwm];
> +	unsigned int idx =3D pwm->hwpwm;
> +	struct clk_hw *parent =3D sun8i_chip->pairs[SUN8I_PWM_PAIR_IDX(idx)].hw;
> +	bool was_enabled;
> +	int ret;
> +
> +	scoped_guard(spinlock_irqsave, &sun8i_chip->lock) {
> +		was_enabled =3D
> +			sun8i_pwm_channel_is_enabled_locked(sun8i_chip, idx);
> +	}
> +
> +	chan->pair_clk =3D clk_hw_get_clk(parent, NULL);
> +	if (IS_ERR(chan->pair_clk)) {
> +		ret =3D PTR_ERR(chan->pair_clk);
> +		goto err_clear_clock;
> +	}

[Severity: Low]
This isn't a bug, but does this mix goto-based error handling and scope-bas=
ed
cleanup helpers?

The cleanup subsystem guidelines recommend avoiding mixing goto labels with
cleanup helpers like scoped_guard() in the same function. Could the resourc=
es
that need goto cleanup be converted to use scope-based cleanup, or the
scoped_guard() converted to regular locking?

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
> +
> +	/* Sample the old rate only after excluding other rate changes. */
> +	rate =3D sun8i_pwm_get_pair_rate(sun8i_chip, idx);
> +	if (!rate || rate > U32_MAX) {
> +		ret =3D -ERANGE;
> +		goto put_rate;
> +	}

[Severity: Low]
Is it intentional to mix goto-based cleanup and scope-based cleanup helpers
here?

Similar to sun8i_pwm_request(), this function mixes scoped_guard() with goto
error handling paths, which goes against the cleanup subsystem guidelines.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-h616-pwm-v=
8-v9-0-37bec6201ff5@gmail.com?part=3D2
