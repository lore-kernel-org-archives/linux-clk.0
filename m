Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48FB3F4122;
	Sun, 27 Sep 2026 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518070; cv=none; b=oxnTvrYDerJ6uPUB1tZSGPjvj27o+RVXllIadVh5rVBOVK5tTqQYyol16+PZ9f5m6ill1HtjQCBEN1FsW9x4ogbD2o67xB6rTsJmxgFvGCIwnqslC4Lmxahx+345GlOgu9C2OlK0Wayrvpo1YrYGr8QrOtvPj/Cn+Y9T7SQVHc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518070; c=relaxed/simple;
	bh=V4hjIC04v/wO9QQfrPY7cDTcWImoE4uycGi8OkxJIGg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mwMJ6L+oXNrBOr1vwa8FEgjstbi/Qfmm7uSiYzTtTLS++MvxGIL6H5fAeyOxY2cJbnhEwdpL9lo2qWpjPrB5xHRoEsmbT69jCeaO8VQLhdG66qzeZlIzFO+7sCiB8QNFodyTFydMrUNem7Anb2yglTTUJg18Z0qCfHzbD3fFt5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xta/uMRt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xta/uMRt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6AB1F000FF;
	Sun, 27 Sep 2026 14:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790518069;
	bh=+qBz5TtcVmSuhjrHGN4TXGhasroWKfwppifn+/vAC+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xta/uMRt531/hwfZvkhknGhyDUmbzMz4NaG1LeEjSF5X/fqh3MwHBAMeHYLyAqO9e
	 PvOtp/IqWBfWAIen8okIb2irF8A5tsKEbBQgnqEjVaNZwwGKjfKl1Vt1iWXPX4d+5/
	 cSU/bu9gRy+maArmBVJoF6s49scPoN/yIJSKBenWJD6u4ATFosDWH/TaIBs6W09iVH
	 9twR/MWszPbAVWTyWaTnuthdzuSW2RDvTDS8VBWjhpju3+f+Nt61S4lZtYo0v08ej9
	 esvJcU6gpVVyUPxqe6qpzTtfqmyh/pafdjwxHHsTA7Ys2v+tXz4PKamnQDJSYrk9FA
	 AahHaV+U4/+JA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] clk: Add gpio-locked clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260927-feature-clock-guard-v7-2-8dd19568d9a2@bruker.com>
References: <20260927-feature-clock-guard-v7-0-8dd19568d9a2@bruker.com>
 <20260927-feature-clock-guard-v7-2-8dd19568d9a2@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 14:07:48 +0000
Message-Id: <20260927140749.1A6AB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: gpio-locked-clock prepare callback inverts CCF error logic
- [Medium] clk: gpio-locked-clock ignores DT parent count and hardcodes 1
--

commit e6f2116296103d738da7176d4979ce3c21f6786f
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

clk: Add gpio-locked clock driver

This commit adds a gpio-locked clock driver, exposing a clock whose status
is determined by a GPIO signal. Consumers can use the output clock to wait
until the input clock is locked before initializing dependent peripherals.

> diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
> index 9099c57e27156..a264ba21baf26 100644
> --- a/drivers/clk/clk-gpio.c
> +++ b/drivers/clk/clk-gpio.c
[ ... ]
> @@ -138,6 +138,19 @@ static const struct clk_ops clk_gpio_mux_ops =3D {
>  	.determine_rate =3D __clk_mux_determine_rate,
>  };
> =20
> +/* We can't prepare the clock, but the Common Clock Framework calls only
> + * prepare() not is_prepared(), therefore we fallback on the actuall GPI=
O value.
> + */
> +static int clk_gpio_locked_prepare(struct clk_hw *hw)
> +{
> +	return clk_sleeping_gpio_gate_is_prepared(hw);
> +}

[Severity: High]
Does this return value interact correctly with the Common Clock Framework?

The function clk_sleeping_gpio_gate_is_prepared() returns the raw boolean
GPIO status (1 if locked, 0 if unlocked), but the prepare callback typically
expects 0 for success and a negative integer for failure.

Because the framework interprets any non-zero value as an error, a locked
clock returning 1 might cause clock preparation to fail when it should
succeed. Conversely, an unlocked clock returning 0 might be treated as a
success, causing downstream consumers to proceed while the PLL is still
unlocked.

[ ... ]
> @@ -192,6 +210,12 @@ static struct clk_hw *clk_hw_register_gpio_mux(struc=
t device *dev,
>  	return clk_register_gpio(dev, 2, gpiod, &clk_gpio_mux_ops);
>  }
> =20
> +static struct clk_hw *clk_hw_register_gpio_locked(struct device *dev,
> +						  struct gpio_desc *gpiod)
> +{
> +	return clk_register_gpio(dev, 1, gpiod, &clk_gpio_locked_ops);
> +}

[Severity: Medium]
Is it intentional to hardcode 1 parent here instead of using the parsed
num_parents from the device tree?

If the clock is defined in the device tree without a parent (acting as a
root clock), passing 1 causes the framework to expect a parent at index 0.
This could cause parent resolution to fail, leaving the clock permanently
orphaned with a 0 Hz rate, which breaks downstream consumers relying on
rate propagation.

Could we pass the dynamically parsed num_parents from gpio_clk_driver_probe=
()
downward, or validate that it equals 1, similar to how the gpio-mux-clock
explicitly validates its parent count?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-feature-cl=
ock-guard-v7-0-8dd19568d9a2@bruker.com?part=3D2
