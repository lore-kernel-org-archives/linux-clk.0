Return-Path: <k.kozlowski.k@gmail.com>
Return-Path: <k.kozlowski.k@gmail.com>
Sender: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Subject: Re: [PATCH v4 05/24] misc: max77693-haptic: use pwm_get_xxx() helpers
 where appropriate
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org
References: <1447664207-24370-1-git-send-email-boris.brezillon@free-electrons.com>
 <1447664207-24370-6-git-send-email-boris.brezillon@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kamil Debski <k.debski@samsung.com>, lm-sensors@lm-sensors.org,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
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
 linux-kernel@vger.kernel.org, k.kozlowski.k@gmail.com
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-ID: <5649D5D0.6080204@samsung.com>
Date: Mon, 16 Nov 2015 22:10:40 +0900
MIME-Version: 1.0
In-Reply-To: <1447664207-24370-6-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=iso-8859-2
List-ID: <linux-clk.vger.kernel.org>

W dniu 16.11.2015 o 17:56, Boris Brezillon pisze:
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
> |
> -(p)->period = e;
> +pwm_set_period((p), e);
> |
> -(p)->period
> +pwm_get_period((p))
> |
> -(p)->duty_cycle = e;
> +pwm_set_duty_cycle((p), e);
> |
> -(p)->duty_cycle
> +pwm_get_duty_cycle((p))
> )
> --->8---
> ---
>  drivers/input/misc/max77693-haptic.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/misc/max77693-haptic.c b/drivers/input/misc/max77693-haptic.c
> index 6d96bff..a038fb3 100644
> --- a/drivers/input/misc/max77693-haptic.c
> +++ b/drivers/input/misc/max77693-haptic.c
> @@ -70,10 +70,11 @@ struct max77693_haptic {
>  
>  static int max77693_haptic_set_duty_cycle(struct max77693_haptic *haptic)
>  {
> -	int delta = (haptic->pwm_dev->period + haptic->pwm_duty) / 2;
> +	int delta = (pwm_get_period((haptic->pwm_dev)) + haptic->pwm_duty) / 2;

Double parentheses over argument are not needed so just:
pwm_get_period(haptic->pwm_dev) + ...

Beside that patch looks good, so with removing parentheses here and below:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

>  	int error;
>  
> -	error = pwm_config(haptic->pwm_dev, delta, haptic->pwm_dev->period);
> +	error = pwm_config(haptic->pwm_dev, delta,
> +			   pwm_get_period((haptic->pwm_dev)));
>  	if (error) {
>  		dev_err(haptic->dev, "failed to configure pwm: %d\n", error);
>  		return error;
> @@ -245,7 +246,7 @@ static int max77693_haptic_play_effect(struct input_dev *dev, void *data,
>  	 * The formula to convert magnitude to pwm_duty as follows:
>  	 * - pwm_duty = (magnitude * pwm_period) / MAX_MAGNITUDE(0xFFFF)
>  	 */
> -	period_mag_multi = (u64)haptic->pwm_dev->period * haptic->magnitude;
> +	period_mag_multi = (u64)pwm_get_period((haptic->pwm_dev)) * haptic->magnitude;
>  	haptic->pwm_duty = (unsigned int)(period_mag_multi >>
>  						MAX_MAGNITUDE_SHIFT);
>  
> 
