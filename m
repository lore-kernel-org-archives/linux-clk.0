Return-Path: <dmitry.torokhov@gmail.com>
Return-Path: <dmitry.torokhov@gmail.com>
Date: Sun, 17 Apr 2016 05:45:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kamil Debski <k.debski@samsung.com>, lm-sensors@lm-sensors.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org,
	Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>,
	Jacek Anaszewski <j.anaszewski@samsung.com>,
	linux-leds@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
	Joachim Eastwood <manabian@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
	linux-fbdev@vger.kernel.org,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Ryan Mallon <rmallon@gmail.com>,
	Alexander Shiyan <shc_work@mail.ru>, Milo Kim <milo.kim@ti.com>,
	Doug Anderson <dianders@google.com>,
	Caesar Wang <wxt@rock-chips.com>,
	Stephen Barber <smbarber@chromium.org>
Subject: Re: [PATCH v5 13/24] input: misc: max8997: explicitly apply PWM
 config extracted from pwm_args
Message-ID: <20160417124548.GE33215@dtor-ws>
References: <1460661464-11216-1-git-send-email-boris.brezillon@free-electrons.com>
 <1460661464-11216-14-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1460661464-11216-14-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Apr 14, 2016 at 09:17:33PM +0200, Boris Brezillon wrote:
> Call pwm_apply_args() just after requesting the PWM device so that the
> polarity and period are initialized according to the information provided
> in pwm_args.
> 
> This is an intermediate state, and pwm_apply_args() should be dropped as
> soon as the atomic PWM infrastructure is in place and the driver makes
> use of it.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/input/misc/max8997_haptic.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/input/misc/max8997_haptic.c b/drivers/input/misc/max8997_haptic.c
> index a806ba3..bf17f65 100644
> --- a/drivers/input/misc/max8997_haptic.c
> +++ b/drivers/input/misc/max8997_haptic.c
> @@ -304,6 +304,12 @@ static int max8997_haptic_probe(struct platform_device *pdev)
>  				error);
>  			goto err_free_mem;
>  		}
> +
> +		/*
> +		 * FIXME: pwm_apply_args() should be removed when switching to
> +		 * the atomic PWM API.
> +		 */
> +		pwm_apply_args(chip->pwm);

I do not understand. We did not fetch/modify any args, what are we
applying and why? Especially since we saying we want to remove this
later.

Thanks.

-- 
Dmitry
