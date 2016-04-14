Return-Path: <manabian@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1460661464-11216-3-git-send-email-boris.brezillon@free-electrons.com>
References: <1460661464-11216-1-git-send-email-boris.brezillon@free-electrons.com>
	<1460661464-11216-3-git-send-email-boris.brezillon@free-electrons.com>
Date: Thu, 14 Apr 2016 21:24:47 +0200
Message-ID: <CAGhQ9VyyWgcCZ3UoT7u8+YRdMouUuOO_7sE+-bM+JGSYhsNTrQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/24] pwm: use pwm_get/set_xxx() helpers where appropriate
From: Joachim  Eastwood <manabian@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
	Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Kamil Debski <k.debski@samsung.com>, lm-sensors@lm-sensors.org,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
	Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>,
	Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@googlegroups.com,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, Jingoo Han <jingoohan1@gmail.com>,
	Lee Jones <lee.jones@linaro.org>, linux-fbdev@vger.kernel.org,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Hartley Sweeten <hsweeten@visionengravers.com>, Ryan Mallon <rmallon@gmail.com>,
	Alexander Shiyan <shc_work@mail.ru>, Milo Kim <milo.kim@ti.com>, Doug Anderson <dianders@google.com>,
	Caesar Wang <wxt@rock-chips.com>, Stephen Barber <smbarber@chromium.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 14 April 2016 at 21:17, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Use pwm_get/set_xxx() helpers instead of directly accessing the pwm->xxx
> field. Doing that will ease adaptation of the PWM framework to support
> atomic update.
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
> +pwm_set_polarity(p, e);
> |
> -(p)->polarity
> +pwm_get_polarity(p)
> |
> -(p)->period = e;
> +pwm_set_period(p, e);
> |
> -(p)->period
> +pwm_get_period(p)
> |
> -(p)->duty_cycle = e;
> +pwm_set_duty_cycle(p, e);
> |
> -(p)->duty_cycle
> +pwm_get_duty_cycle(p)
> )
> --->8---
> ---
>  drivers/pwm/pwm-crc.c          | 2 +-
>  drivers/pwm/pwm-lpc18xx-sct.c  | 2 +-

> diff --git a/drivers/pwm/pwm-lpc18xx-sct.c b/drivers/pwm/pwm-lpc18xx-sct.c
> index 9861fed..19dc64c 100644
> --- a/drivers/pwm/pwm-lpc18xx-sct.c
> +++ b/drivers/pwm/pwm-lpc18xx-sct.c
> @@ -249,7 +249,7 @@ static int lpc18xx_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
>                            LPC18XX_PWM_EVSTATEMSK(lpc18xx_data->duty_event),
>                            LPC18XX_PWM_EVSTATEMSK_ALL);
>
> -       if (pwm->polarity == PWM_POLARITY_NORMAL) {
> +       if (pwm_get_polarity(pwm) == PWM_POLARITY_NORMAL) {
>                 set_event = lpc18xx_pwm->period_event;
>                 clear_event = lpc18xx_data->duty_event;
>                 res_action = LPC18XX_PWM_RES_SET;

For the lpc18xx-sct part:
Acked-by: Joachim Eastwood <manabian@gmail.com>


regards,
Joachim Eastwood
