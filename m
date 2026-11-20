Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190865;
	b=nGmbhQ3qbXpkoW+JX9pCAQln6k0Z2APSYid7u5zQgauLponrQv893IJsNns87aa0sHn1
	 dYRg+4h2xFMYOffQOKPleRrgCBhFe1K3RLif27M+6B5FwvgHjoZ7z9FDXuZLYecjMNHgO
	 oNWRAEHZ4fUk/wExxsbBBtUiHyq1Hb7C/dNwDCh/6XxOK1rmOxpHQqBLfHqUI5o/mRv63
	 pYXDO9og6C4eqpXCuRzIGLC77xhaLlQv1XHPJT6//p0KshOGNfjWDJWZytM7NlCehi8/P
	 uEK9TzkEdK7CoJEIdZgM30rvhtzVIxv/CQbDhELsQKqJ7h6VzQg9YNSWEznWqt1aaDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=URbbUiOzW46NXHtRQkNnLv7ePmh0j//RYSRN206kpCk=;
	b=De0p1+lHiAlCtszdtv5WOU7JFYiBmJ6xo/LJRtYGCvvTeXh4v05MZN2HglOTt72pEFnp
	 IqUjcJLaYgf7jM4UcXtZrinbBDrSi3NTg7JgavtHngSQTpLx/HZ2Kxu6kahYrR6/OG8Gl
	 wpFRs/40OtoPukYd9vVsimUYxjjAl6ZQnxbVvDIn3vXRAF04TwDwexlFqO/WwG82sBz9x
	 3gihm+1OS3unzGuPs6n8H9NG+NLg5W+SccE/MEb+yre7hSPKzwqGWhCkx3JfhzHAZ2Kfw
	 HCdfmta1zDgwhKvP5egveSMSotfFA5hwby5fUf+r6c32hgOFQpoIFaR6HvPRpHXEyUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RDGj63qr;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F13606A334
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 16:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5F13606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RDGj63qr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so11614445e9.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 08:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795190863; x=1795795663; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=URbbUiOzW46NXHtRQkNnLv7ePmh0j//RYSRN206kpCk=;
        b=RDGj63qrufcSY1ctYS3Gui+Owgul2KOUYKWH7vDkCQTMw5SRkFCemwPz9Lgm59/DaT
         dHzpIulElJrMzrjgFOz8OwSdmRlhT4VYccMSUYhvjW4K8BDqydJsbeFybUcK5RauBDqb
         LqIQZOkS6pvNb7Aa1pA5k3Lisk+pnIlGsBpuIGSL4MPaRpATvgNVVGpN+F6WGGZqvQx2
         k8aQqwRgi0aUfy6p+V9vZXz4Lf0vEaRTKnMAZJB4YDtZYeWQSN4cvM/Pg9QrBG/wzoCe
         AKsyBv+VP7hswG7V3OrY/IMKeaMYag6a2+XxFfK+jTUNijdXirz/aHX0ssezJdkq01YP
         G8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190863; x=1795795663;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=URbbUiOzW46NXHtRQkNnLv7ePmh0j//RYSRN206kpCk=;
        b=TBuhy3rfvtmMRINCi++wdM8ax84xsr7WGcQtBtyVMB4VvnO95e/J/WwU57e2r4JdqD
         wKg/vr+in4ZOIWyNg64zBHAqTDcpmZEJqC77rTm+AfClfS73UBDnLumbI6qhjPwPDsG3
         8eZCopG8BfVUMRRoQ0CayUHgNnkaixBBY+lkll/0d5JvOIPk7PUM6UAU/YpeUhk8x9So
         t9fOH2zoTZMnxMb/pSabBNgQyI+tyZIqDZ3DQALGfsMvsTORjyjtbgJwHpeOltHCvRkR
         4GdAHPEJwXABjm3coI73y8bM3vg8yOBXnWUig9H9KBL53vaNeBPic/VtD/osU3GQ63xl
         1PpA==
X-Forwarded-Encrypted: i=1; AL+hErGv/YFMJZwhoq5j9+TWEqjhKKAotdEXk0TzoBhk0a9If0RDDwCm4Hx7y9NlQRE/O3xrp2LMZTapyGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qTAVcAEzIO2+N7o/+Cri7n9eXZ9Ey2y2Z+1S2Qy+BaVQwoebG
	e1lbn57Z2qZaU4PD37zNaKMRArr/dfYApBG500S1ek6PYOSqZup4XvGvNOifUQYfzJE=
X-Gm-Gg: AYBFou39a3XJ88tWAPWDnb6AYKRSiZfJoMGHoQtf8XS2rJVSfejphuWO1bC1e9wIiwy
	CthK9W36CXDWyv0uEBbcdl+hO3ukYhecs2CnPpdFBBDaJCjapMnjC0IfXtTrLff4HjzZhdExc74
	D4FrQUEsIT7kIBMQUp2K5TQX+2Cq77yxgE4Ou9DySLSTfBjGgr5j7jSDudvMsxQzIeXv4eN87kp
	zi58qmO3x2qb4U1y6uGL6G/4BfTlNdPJ2i5xZSZpFQpwSLYCIWVrl53SnibRpZY+ctraa64WEkh
	Nzm7f2IZa/L8GeL3bIr3w/uJx1BHnH4AGIyV2GhY/U6S59928bfA0qs6Arvqprzp6wWPXvM6xkY
	h/l6zNK5FhhjaqJcOh7tEKBdsJvBL+Lh7MsRIl/toMMi8zatHZgZrDgg+O0/z7o+QASbg0/48/v
	pWqJWPQydwKIVL4+GbYW0+YTGwQGJLSVFrp1kAD/8Yv0qaaJWynRlxRjbSjrhvbLo5VvIeXUVaJ
	GKTvQADoioCoA0+xxmP3+gJjJUjPFPvJUz4UpfZeG4zX/6PZS3wCVXIuHl5GlelGCKRa78qAEnW
	YiWund4z7yVMGr1pUnj+/v/gNRiy+iMK7Rx53noFfSpeoRBQBDO6wEfiazlsYjVZiy9Brg==
X-Received: by 2002:a05:600c:4e4c:b0:4b6:5dac:b61e with SMTP id 5b1f17b1804b1-4bb88938d2dmr75465455e9.32.1795190862878;
        Fri, 20 Nov 2026 08:07:42 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm6077920f8f.22.2026.11.20.08.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:07:42 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 2/2] clk: Add gpio-enabled clock driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261015-feature-clock-guard-v9-2-c1c05a498d9a@bruker.com>
References: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
 <20261015-feature-clock-guard-v9-2-c1c05a498d9a@bruker.com>
Date: Fri, 20 Nov 2026 17:07:29 +0100
Message-Id: <179519084929.3795820.7180605641448271689.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8196; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=lkMlsQIdwsR3Pxz3J+eUVncTefvwVl9Lr2Y3TivqXRk=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMBe5FAv2PTm668+eXs5v0hVnHfQsfb7LLS/dSFxNIF
 Pn3ukygo5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOJX8fwP+KT4qO61vdRzr9a
 ub4VSfe7dNo3vlR1OMjJO7tT1e9pLyPDV2nTmWFTlNNPf/q86I55P9+dwBn/P0ru5+ALlt295K8
 zFwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> A gpio-enabled clock exposes a clock, which status is determined by a
> GPIO signal. The common use-case is a FPGA-assisted clocking design
> where peripheral clocks are generated by FPGA PLLs that are outside
> CPU control, with clock-valid/PLL-lock status exposed through GPIO signals.
> Consumers can use the output clock to wait until the input clock is enabled
> and only then initialize dependent peripherals.

Same feedback here. The is a generic driver, you should therefore describe
the generic problem and how you are solving it

> 
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---

It is fine to describe you specific use-case here.


>  drivers/clk/clk-gpio.c | 161 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 161 insertions(+)
>
> diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
> index 918b2c6444ee..bda40fe87c8b 100644
> --- a/drivers/clk/clk-gpio.c
> +++ b/drivers/clk/clk-gpio.c
> @@ -15,6 +15,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/err.h>
>  #include <linux/device.h>
> +#include <linux/iopoll.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
> @@ -241,6 +242,166 @@ static struct platform_driver gpio_clk_driver = {
>  };
>  builtin_platform_driver(gpio_clk_driver);
>  
> +/**
> + * DOC: Clock which status is determined by a GPIO signal

DOC ?

> + * Traits of this clock:

Traits ? this is not rust code ...

> + * prepare - clk_prepare (is_prepared) checks for a sleeping gpio
> + * enable - clk_enable (is_enabled) checks for a non-sleeping gpio
> + */
> +
> +/**
> + * struct clk_gpio_enabled - gpio enabled clock
> + *
> + * @hw:		handle between common and hardware-specific interfaces
> + * @gpiod:	gpio descriptor
> + * @timeout_us:	timeout that is used to get a GPIO value
> + *
> + * Clock, which status is determined by a GPIO signal.
> + *
> + * Implements .enable, .is_enabled or .prepare, .is_prepared
> + */
> +struct clk_gpio_enabled {
> +	struct clk_hw hw;
> +	struct gpio_desc *gpiod;
> +	u32 timeout_us;
> +};
> +
> +#define to_clk_gpio_enabled(_hw) container_of(_hw, struct clk_gpio_enabled, hw)
> +#define GPIO_ENABLED_TIMEOUT_MIN 10
> +#define GPIO_ENABLED_TIMEOUT_MAX 1000
> +#define GPIO_ENABLED_TIMEOUT_DEFAULT 10
> +
> +static int clk_gpio_enabled_sleeping_is_prepared(struct clk_hw *hw)
> +{
> +	struct clk_gpio_enabled *clk = to_clk_gpio_enabled(hw);
> +
> +	return gpiod_get_value_cansleep(clk->gpiod) > 0;
> +}
> +
> +/* We can't prepare the clock, but the Common Clock Framework calls only
> + * prepare() not is_prepared(), therefore we fallback on the actual GPIO value.
> + * The function clk_gpio_enabled_sleeping_is_prepared() returns the raw boolean
> + * GPIO status (1 if enabled, 0 if not enabled), but the prepare callback
> + * clk_core_prepare() expects 0 for success and non-zero integer for failure.
> + */

This comment has been carried since v5, where the reasoning was already
answered: returning an error from .prepare()/.enable() when the clock isn't
running is simply how a provider reports failure, not a workaround for the
framework. The claim is also wrong: the framework does call .is_prepared()
(clk_unprepare_unused_subtree(), clk_hw_is_prepared()). The rest describes return
conventions. Something like this would be enough:

	/* The clock cannot be turned on, only waited for. */

Also, multi-line comments style is wrong.

> +static int clk_gpio_enabled_sleeping_prepare(struct clk_hw *hw)
> +{
> +	struct clk_gpio_enabled *clk = to_clk_gpio_enabled(hw);
> +	int value = 0;
> +
> +	readx_poll_timeout(gpiod_get_value_cansleep, clk->gpiod, value,
> +			value != 0, 10, clk->timeout_us);
                        ^ alignement ?

errors get flattened here: a negative value (e.g. -EIO from an I2C expander)
satisfies "value != 0", ends the poll, and is reported as -EBUSY. A timeout
is also reported as -EBUSY rather than the -ETIMEDOUT that readx_poll_timeout()
already returns.

> +	if (value == 1)
> +		return 0;
> +
> +	return -EBUSY;
> +}
> +
> +static const struct clk_ops clk_gpio_enabled_sleeping_ops = {
> +	.prepare =	clk_gpio_enabled_sleeping_prepare,
> +	.is_prepared =	clk_gpio_enabled_sleeping_is_prepared,
> +};
> +
> +static int clk_gpio_enabled_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_gpio_enabled *clk = to_clk_gpio_enabled(hw);
> +
> +	return gpiod_get_value(clk->gpiod) > 0;
> +}
> +
> +/* We can't enable the clock, but the Common Clock Framework calls only
> + * enable() not is_enabled(), therefore we fallback on the actual GPIO value.
> + * The function clk_gpio_enabled_is_enabled() returns the raw boolean
> + * GPIO status (1 if enabled, 0 if not enabled), but the enable callback
> + * clk_core_enable() expects 0 for success and non-zero integer for failure.
> + */

Seems like a repeat

> +static int clk_gpio_enabled_enable(struct clk_hw *hw)
> +{
> +	struct clk_gpio_enabled *clk = to_clk_gpio_enabled(hw);
> +	int value = 0;
> +
> +	readx_poll_timeout_atomic(gpiod_get_value, clk->gpiod, value,
> +			value != 0, 10, clk->timeout_us);

Same error handling as in the prepare variant above.

Also looking at it more closely, the binding allow 1ms max. It is lot of
time holding a spinlock without IRQ. If you don't stricly need this variant
please drop it for now.

> +
> +	/* If the reading timed out or return an error,
> +	 * it means the clock is not ready
> +	 */
> +	if (value == 1)
> +		return 0;
> +
> +	return -EBUSY;
> +}
> +
> +static const struct clk_ops clk_gpio_enabled_ops = {
> +	.enable =	clk_gpio_enabled_enable,
> +	.is_enabled =	clk_gpio_enabled_is_enabled,
> +};
> +
> +static int gpio_enabled_clk_driver_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct clk_gpio_enabled *clk;
> +	const char *clk_name;
> +	const struct clk_ops *ops;
> +	const struct clk_parent_data gpio_parent_data[] = {
> +		{ .index = 0 },
> +	};
> +	u32 timeout_us = GPIO_ENABLED_TIMEOUT_DEFAULT;
> +	int ret = 0;
> +
> +	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +	if (!clk)
> +		return -ENOMEM;
> +
> +	clk->gpiod = devm_gpiod_get(dev, "enabled", GPIOD_IN);
> +	if (IS_ERR(clk->gpiod))
> +		return dev_err_probe(dev, PTR_ERR(clk->gpiod),
> +				     "Can't get enabled GPIO property\n");
> +
> +	ret = device_property_read_string(dev, "clock-output-names", &clk_name);
> +	if (ret)
> +		clk_name = fwnode_get_name(dev->fwnode);

Just make it a required property

> +
> +	device_property_read_u32(dev, "poll-timeout-us", &timeout_us);
> +	if (timeout_us < GPIO_ENABLED_TIMEOUT_MIN ||
> +	    timeout_us > GPIO_ENABLED_TIMEOUT_MAX)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "poll-timeout-us is out of range [%u, %u]\n",
> +				     GPIO_ENABLED_TIMEOUT_MIN,
> +				     GPIO_ENABLED_TIMEOUT_MAX);
> +	clk->timeout_us = timeout_us;
> +
> +	if (gpiod_cansleep(clk->gpiod))
> +		ops = &clk_gpio_enabled_sleeping_ops;
> +	else
> +		ops = &clk_gpio_enabled_ops;

As I noted above, I prefer if you dropped the enabled variant that run with
irq off, unless you scrictly need it. Return -ENOTSUPP if the gpio can't sleep.

> +
> +	clk->hw.init = CLK_HW_INIT_PARENTS_DATA
> +		(clk_name, gpio_parent_data, ops, 0);

CLK_SET_RATE_PARENT please.

> +
> +	/* register the clock */
> +	ret = devm_clk_hw_register(dev, &clk->hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to register clock\n");
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &clk->hw);
> +}
> +
> +static const struct of_device_id gpio_enabled_clk_match_table[] = {
> +	{ .compatible = "gpio-enabled-clock" },
> +	{ }
> +};
> +
> +static struct platform_driver gpio_enabled_clk_driver = {
> +	.probe		= gpio_enabled_clk_driver_probe,
> +	.driver		= {
> +		.name	= "gpio-enabled-clk",
> +		.of_match_table = gpio_enabled_clk_match_table,
> +	},
> +};
> +builtin_platform_driver(gpio_enabled_clk_driver);

module_platform_driver

-- 
Jerome

