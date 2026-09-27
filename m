Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A90829D288;
	Sun, 27 Sep 2026 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521793; cv=none; b=XTZKTo9DGSlalWdICtxcaOnuZ6fuzZJTg++DufoC2l4IQMx4OxdC8WAudgbwRPprjpjRPgBhuLNeMe1zmXA1PrO1bZjcgyL8h29lGV3mjmB6AseNJfBYIsjPk0vh6nGfGQJI5iyqyCUL8JrwrpMHpeVj4F5ZADKeSQX0urgbgZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521793; c=relaxed/simple;
	bh=cBCyhrfY516t+1GuQeVB0Teoz8Foc2RUfasrs/B/rJU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QtMhAmcF5zOs7+bG26jXX/fKUWmrxClkgVF7THIQg4dhR9VDwvi6hMB53qjOisatZOoHXHNZEBlgi6+dE5aZhJzSN1h6tbUPOmUGigh8EJAc0lLu5nBeLNtb5/HeaD4HtyQDxNtnFDo8OQcIQspIUBizm932yGdyfx3g26fGU4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsnZScAX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsnZScAX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1771F000FF;
	Sun, 27 Sep 2026 15:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790521792;
	bh=QOUciLH1fsxiSS39Sd2Y4bJyTz6PHL+5Mo5Y/Q/hr2U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jsnZScAX0Jzrt4S+Bo12pf2xPE8FxKa55klmhCqrc4DPmaR+BVabD+edO6GJ5CCtG
	 lqP0xfhYeOh067EF+/4tb2GD2703QOpJqcIEhuUOMfxzYv6z5a/NnhbQXjiR52bpmM
	 V11vm+J8XYOUTeUFsQC7CgNEaB0YPU9oVWFhZve51BKrwApR7qxBTLZq49cJ2h1ksK
	 uTJhDgHNbo64WsG5RsTovS+hoUApZrc8/wJoLp7Zo8u94UhVmw3jxqZ2HXVdD7l2hD
	 YVYaz/6vKkQ3q0la1hb0MEo8yyfvBKWUYXMzLh5r258F/AyvavH2JaXzJ7juiviXIX
	 mlAHjkq5x6ZPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] clk: Add gpio-locked clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260927-feature-clock-guard-v8-2-630938e302a1@bruker.com>
References: <20260927-feature-clock-guard-v8-0-630938e302a1@bruker.com>
 <20260927-feature-clock-guard-v8-2-630938e302a1@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 15:09:51 +0000
Message-Id: <20260927150952.1D1771F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] clk: gpio: negative error code from GPIO read evaluated as success
- [Medium] clk: gpio: clk_prepare callback violates CCF abstraction by fail=
ing to block
- [Medium] clk: gpio: gpio-locked-clock ignores DT num_parents, forcing orp=
han state
--

commit 8ac8202cfc07fde8ca8b25fa51d26b883f03b432
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

clk: Add gpio-locked clock driver

This commit adds a gpio-locked clock driver where the clock's valid status
is determined by a GPIO signal. It allows consumers to wait on the clock
lock before initializing dependent peripherals.

> diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
> index 9099c57e27156..db68b8bc44c5a 100644
> --- a/drivers/clk/clk-gpio.c
> +++ b/drivers/clk/clk-gpio.c
> @@ -138,6 +138,25 @@ static const struct clk_ops clk_gpio_mux_ops =3D {

[ ... ]

> +/* We can't prepare the clock, but the Common Clock Framework calls only
> + * prepare() not is_prepared(), therefore we fallback on the actuall GPI=
O value.
> + * The function clk_sleeping_gpio_gate_is_prepared() returns the raw boo=
lean
> + * GPIO status (1 if locked, 0 if unlocked), but the prepare callback
> + * clk_core_prepare() expects 0 for success and non-zero integer for fai=
lure.
> + */
> +static int clk_gpio_locked_prepare(struct clk_hw *hw)
> +{
> +	if (clk_sleeping_gpio_gate_is_prepared(hw))
> +		return 0;

[Severity: High]
Will this evaluate a negative error code as a success?

The underlying function clk_sleeping_gpio_gate_is_prepared() calls
gpiod_get_value_cansleep():

static int clk_sleeping_gpio_gate_is_prepared(struct clk_hw *hw)
{
        struct clk_gpio *clk =3D to_clk_gpio(hw);
        return gpiod_get_value_cansleep(clk->gpiod);
}

If gpiod_get_value_cansleep() returns a negative error code (such as -EIO)
due to a hardware read failure, the if condition here will evaluate it as
true.

This would return 0 (success) to the Common Clock Framework, incorrectly
masking the hardware error and falsely signaling that the PLL/clock lock
was successfully acquired.

> +
> +	return -EBUSY;

[Severity: Medium]
Does returning -EBUSY here violate the Common Clock Framework abstraction?

The clk_prepare callback is permitted to sleep and is generally expected
to block until the hardware is ready. By returning an error immediately
instead of blocking until the clock is locked, standard device drivers
calling clk_prepare_enable() might permanently fail their probe sequence.

Will this force consumers to implement non-standard polling logic to
handle the -EBUSY return value?

> +}
> +
> +static const struct clk_ops clk_gpio_locked_ops =3D {

[ ... ]

> @@ -192,6 +216,12 @@ static struct clk_hw *clk_hw_register_gpio_mux(struc=
t device *dev,
>  	return clk_register_gpio(dev, 2, gpiod, &clk_gpio_mux_ops);
>  }
> =20
> +static struct clk_hw *clk_hw_register_gpio_locked(struct device *dev,
> +						  struct gpio_desc *gpiod)
> +{
> +	return clk_register_gpio(dev, 1, gpiod, &clk_gpio_locked_ops);

[Severity: Medium]
Is it intentional to hardcode the number of parents to 1 here?

In the gpio_clk_driver_probe() function, the true parent count is parsed
from the device tree:

num_parents =3D of_clk_get_parent_count(node);

If the clock is configured in the device tree as an independent root clock
(for example, an FPGA PLL with no parent clock, meaning num_parents is 0),
hardcoding it to 1 here will cause CCF to attempt to resolve a parent at
index 0.

Could this cause clk_core_get() to fail internal lookups, leading the clock
to silently fall back to an orphan state?

> +}
> +
>  static int gpio_clk_driver_probe(struct platform_device *pdev)
>  {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-feature-cl=
ock-guard-v8-0-630938e302a1@bruker.com?part=3D2
