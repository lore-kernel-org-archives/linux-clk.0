Return-Path: <linux@roeck-us.net>
Subject: Re: [PATCH v4 04/24] hwmon: pwm-fan: use pwm_get_xxx() helpers where
 appropriate
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org
References: <1447664207-24370-1-git-send-email-boris.brezillon@free-electrons.com>
 <1447664207-24370-5-git-send-email-boris.brezillon@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kamil Debski <k.debski@samsung.com>, lm-sensors@lm-sensors.org,
 Jean Delvare <jdelvare@suse.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>,
 Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Joachim Eastwood <manabian@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-fbdev@vger.kernel.org,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5649FD5B.3000208@roeck-us.net>
Date: Mon, 16 Nov 2015 07:59:23 -0800
MIME-Version: 1.0
In-Reply-To: <1447664207-24370-5-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 11/16/2015 12:56 AM, Boris Brezillon wrote:
> Use pwm_get_xxx() helpers instead of directly accessing the pwm->xxx field.
> Doing that will ease adaptation of the PWM framework to support atomic
> update.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Patch generated with the following coccinelle script:
>
> --->8---
> virtual patch
>
> @@
> struct pwm_device *p;
> expression e;
> @@
> (
> -(p)->polarity = e;
> +pwm_set_polarity((p), e);
> |
> -(p)->polarity
> +pwm_get_polarity((p))

s/((p))/(p)/

> |
> -(p)->period = e;
> +pwm_set_period((p), e);
> |
> -(p)->period
> +pwm_get_period((p))

s/((p))/(p)/

> |
> -(p)->duty_cycle = e;
> +pwm_set_duty_cycle((p), e);

The (p) seems unnecessary here.

> |
> -(p)->duty_cycle
> +pwm_get_duty_cycle((p))

s/((p))/(p)/

> )
> --->8---
> ---
>   drivers/hwmon/pwm-fan.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 3e23003..105b964 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -47,8 +47,8 @@ static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
>   	if (ctx->pwm_value == pwm)
>   		goto exit_set_pwm_err;
>
> -	duty = DIV_ROUND_UP(pwm * (ctx->pwm->period - 1), MAX_PWM);
> -	ret = pwm_config(ctx->pwm, duty, ctx->pwm->period);
> +	duty = DIV_ROUND_UP(pwm * (pwm_get_period((ctx->pwm)) - 1), MAX_PWM);
> +	ret = pwm_config(ctx->pwm, duty, pwm_get_period((ctx->pwm)));

Please drop all the unnecessary ( ).

Thanks,
Guenter

>   	if (ret)
>   		goto exit_set_pwm_err;
>
> @@ -234,10 +234,10 @@ static int pwm_fan_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, ctx);
>
>   	/* Set duty cycle to maximum allowed */
> -	duty_cycle = ctx->pwm->period - 1;
> +	duty_cycle = pwm_get_period((ctx->pwm)) - 1;
>   	ctx->pwm_value = MAX_PWM;
>
> -	ret = pwm_config(ctx->pwm, duty_cycle, ctx->pwm->period);
> +	ret = pwm_config(ctx->pwm, duty_cycle, pwm_get_period((ctx->pwm)));
>   	if (ret) {
>   		dev_err(&pdev->dev, "Failed to configure PWM\n");
>   		return ret;
> @@ -309,8 +309,9 @@ static int pwm_fan_resume(struct device *dev)
>   	if (ctx->pwm_value == 0)
>   		return 0;
>
> -	duty = DIV_ROUND_UP(ctx->pwm_value * (ctx->pwm->period - 1), MAX_PWM);
> -	ret = pwm_config(ctx->pwm, duty, ctx->pwm->period);
> +	duty = DIV_ROUND_UP(ctx->pwm_value * (pwm_get_period((ctx->pwm)) - 1),
> +			    MAX_PWM);
> +	ret = pwm_config(ctx->pwm, duty, pwm_get_period((ctx->pwm)));
>   	if (ret)
>   		return ret;
>   	return pwm_enable(ctx->pwm);
>
