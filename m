Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA5B3D9023;
	Tue, 15 Sep 2026 09:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465072; cv=none; b=eB6GoZLwy518pbnz4h0Qet3rG8V1zn0pvrF2leeHsooiPfHfPxSGyAOEt2T9cUaKSTB7PjJRSTNgIDJcmAHnPR1XWoCcxjzfbIQ6RXleE0kBqFeb7e5MIU4OCXjbnsb23CbiT3DvgEqFiUyZiK0EjLIqLvyLik4UgcfNkBu/VDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465072; c=relaxed/simple;
	bh=KxtYDS1rzAL1OrF/gf1cElUrS3rfZ+ILwkY7g3zIPes=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jEEpdubUXKOi8vPhw3m02/ZBxlBr61jNs8pT7m410sBQ+roCkCjMt3aN48e8SfI7sDkWTtp9xYphboboXzkvOFH0+/Yf/EiUfetiDvLRjU2/P3aXvgbHDw2AIhSJ4+u5ha9WwulGF0H+IVndbf/n8G9BPM5HW8hH811e8YFrxgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feiYqd5m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feiYqd5m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB921F000FF;
	Tue, 15 Sep 2026 09:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789465070;
	bh=i9pzR5ki/kFQ9NQZCgxcwSAceaUTBAR18ZJipUFJt8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=feiYqd5mwiRJKu97jwmEwzuOdP9/Qv80Om+k/sTh03PXKkxRGTaE1s3BmfvHMLXfX
	 e6N74dly/gIj/96oV2ppjLjWr7izRQL3Qt6NeLjtFvYn6GhhKD68ujxadGL9SE4l2g
	 KWdL8YTTIaA5qd8SwckNuc1qcqrTvyWk7g76lCYbKylcC5bSQJHv9lTLnyflLNSW83
	 o0CMb4e62yvZAOwjsOaofecaYoUE1BV+7lgFefD/mE4JXl/qEQijUf661dC4++xPrd
	 GYCZKE8gMRERECBVvQdxKqErcJYTt2WAvD/w2doseFmuGWmjxlU79vPD/I7tVH1kMe
	 SNvjarzg/iGpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] clk: Add gpio-locked fixed clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260915-feature-clock-guard-v5-2-42ab5dc3a6aa@bruker.com>
References: <20260915-feature-clock-guard-v5-0-42ab5dc3a6aa@bruker.com>
 <20260915-feature-clock-guard-v5-2-42ab5dc3a6aa@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 09:37:49 +0000
Message-Id: <20260915093750.2EB921F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] clk: gpio-locked-fixed-clock breaks topology by passing global nam=
e to fw_name
- [High] clk: inverted boolean returns in .is_enabled corrupt clock state
- [High] clk: sleeping gpiod_get_value called from atomic .enable callback
- [Medium] clk: parent clock unconditionally enabled defeating PM, no lock =
polling
--

commit 5585fb0b2689bcfcfc380b86553df6e0d756293f
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Subject: clk: Add gpio-locked fixed clock driver

This commit adds a gpio-locked clock driver, which exposes a clock whose
status is determined by a GPIO signal. It is intended for FPGA-assisted
clocking designs, allowing consumers to wait until the input clock is
locked before initializing dependent peripherals.

> diff --git a/drivers/clk/clk-gpio-locked.c b/drivers/clk/clk-gpio-locked.c
> new file mode 100644
> index 0000000000000..b648f8763922e
> --- /dev/null
> +++ b/drivers/clk/clk-gpio-locked.c

[ ... ]

> +static int gpio_locked_clk_is_enabled(struct clk_hw *hw)
> +{
> +	struct gpio_locked_clk_priv *priv =3D to_gpio_locked_clk_priv(hw);
> +
> +	int data =3D gpiod_get_value(priv->gpios);

[Severity: High]
Could this trigger a sleeping-while-atomic panic if the GPIO is on a slow
bus?

The core clock framework executes the .is_enabled and .enable callbacks
with the enable_lock spinlock held (interrupts disabled).=20

Since the probe function doesn't check gpiod_cansleep(), accessing a
potentially sleepable GPIO here could result in a crash.

Would it be better to either use .prepare and .is_prepared instead, which
execute under a mutex, or explicitly reject sleepable GPIOs during probe?

> +
> +	if (data < 0) {
> +		dev_err(priv->dev, "Failed to get data gpio val: %d\n",
> +				data);
> +		return data;
> +	} else if (!data) {
> +		dev_warn(priv->dev, "GPIO is not ready");
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Does this logic invert the clock state for the common clock framework?

The framework expects .is_enabled to return a boolean-equivalent value
(non-zero for enabled, 0 for disabled).=20

Returning -EBUSY evaluates to true (enabled), and 0 evaluates to false
(disabled).=20

Could this break clock state tracking and bypass protection mechanisms like
clk_disable_unused by telling the framework the clock is enabled when it
is actually locked, and disabled when it is ready?

> +/* We can't enable the clock, but the Common Clock Framework calls only
> + * enable() not is_enabled()
> + */
> +static int gpio_locked_clk_enable(struct clk_hw *hw)
> +{
> +	return gpio_locked_clk_is_enabled(hw);
> +}

[Severity: Medium]
Does this instantly fail instead of waiting for the lock as the commit
message suggests?

The commit message indicates consumers can wait until the input clock is
locked. However, because this immediately returns -EBUSY if the GPIO is low
rather than polling or blocking, consumers cannot natively wait for the
lock.

Could we implement a polling loop with a timeout inside a .prepare callback
instead?

[ ... ]

> +static int gpio_locked_clk_parse_outputs(struct gpio_locked_clk_priv *pr=
iv)
> +{
> +	struct device *dev =3D priv->dev;
> +	struct device_node *np =3D dev->of_node;
> +	int ret;
> +
> +	of_property_read_string_index(np, "clock-output-names", 0,
> +		&priv->output_clock_name);
> +
> +	if (!priv->output_clock_name)
> +		priv->output_clock_name =3D dev_name(priv->dev);
> +
> +	priv->output_hw_clk.init =3D
> +		CLK_HW_INIT_FW_NAME(priv->output_clock_name,
> +				    __clk_get_name(priv->input_clk),
> +				    &gpio_locked_clk_ops, 0);

[Severity: High]
Does using the global clock name with CLK_HW_INIT_FW_NAME break the
parent-child topology?

The CLK_HW_INIT_FW_NAME macro assigns the provided string to the .fw_name
field, which the clock framework uses to look up the parent via
of_parse_clkspec() against the local device tree's clock-names property.

Since __clk_get_name() returns a globally unique provider name instead of a
local device tree name, the lookup will fail and register this clock as an
orphan.=20

Since the driver already has the input clock pointer, would it work better
to use CLK_HW_INIT_HW and pass __clk_get_hw(priv->input_clk) instead?

[ ... ]

> +static int gpio_locked_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct gpio_locked_clk_priv *priv;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev =3D dev;
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->input_clk =3D devm_clk_get_enabled(priv->dev, NULL);

[Severity: Medium]
Does acquiring an irreversible enable reference here at probe time defeat
dynamic power management?

By permanently enabling the parent clock at probe time, it seems the=20
framework loses the ability to disable the parent clock when the
gpio-locked clock is unused.

Would it be better to use devm_clk_get() instead, relying on the consumers
to trigger the enable path when needed?

> +	if (IS_ERR(priv->input_clk))
> +		return dev_err_probe(priv->dev, PTR_ERR(priv->input_clk),
> +				"Failed to get locked fixed clock, not yet ready\n");
> +
> +	priv->gpios =3D devm_gpiod_get(priv->dev, "locked", GPIOD_ASIS);

[Severity: High]
Should this check if the GPIO is safe to use in atomic context?

If the driver intends to use this GPIO inside the atomic .enable callback,
should it verify gpiod_cansleep() is false here to avoid potential panics
when reading the value later?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-feature-cl=
ock-guard-v5-0-42ab5dc3a6aa@bruker.com?part=3D2
