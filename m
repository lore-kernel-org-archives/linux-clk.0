Return-Path: <boris.brezillon@free-electrons.com>
Date: Tue, 12 Apr 2016 15:06:27 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-pwm@vger.kernel.org, Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Kamil Debski
 <k.debski@samsung.com>, lm-sensors@lm-sensors.org, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, Bryan Wu
 <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski
 <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Maxime Ripard
 <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@googlegroups.com, Joachim Eastwood <manabian@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, Heiko Stuebner
 <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Jingoo Han
 <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-fbdev@vger.kernel.org, Jean-Christophe Plagniol-Villard
 <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, Daniel
 Vetter <daniel.vetter@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Hartley
 Sweeten <hsweeten@visionengravers.com>, Ryan Mallon <rmallon@gmail.com>,
 Alexander Shiyan <shc_work@mail.ru>, Milo Kim <milo.kim@ti.com>
Subject: Re: [PATCH v5 05/46] pwm: introduce the pwm_args concept
Message-ID: <20160412150627.7084665d@bbrezillon>
In-Reply-To: <20160412113912.GK18882@ulmo.ba.sec>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
	<1459368249-13241-6-git-send-email-boris.brezillon@free-electrons.com>
	<20160412113912.GK18882@ulmo.ba.sec>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Tue, 12 Apr 2016 13:39:12 +0200
Thierry Reding <thierry.reding@gmail.com> wrote:

> On Wed, Mar 30, 2016 at 10:03:28PM +0200, Boris Brezillon wrote:
> > Currently the PWM core mixes the current PWM state with the per-platform
> > reference config (specified through the PWM lookup table, DT definition or
> > directly hardcoded in PWM drivers).
> > 
> > Create a pwm_args struct to store this reference config, so that PWM users
> > can differentiate the current config from the reference one.
> > 
> > Patch all places where pwm->args should be initialized. We keep the
> > pwm_set_polarity/period() calls until all PWM users are patched to
> > use pwm_args instead of pwm_get_period/polarity().
> 
> Perhaps a helper would be useful? Something like:
> 
> 	static inline void
> 	pwm_apply_args(struct pwm_device *pwm, const struct pwm_args *args)
> 	{
> 		pwm_set_duty_cycle(pwm, args->duty_cycle);
> 		pwm_set_period(pwm, args->period);
> 	}
> 
> ? That would make it slightly easier to get rid of it again after all
> clients have been converted.
> 
> With the exception of pwm-clps711x all of these args are set at of_xlate
> time (for DT) or from the lookup table in pwm_get() (for non-DT), so it
> might even be possible to move this call to the core, so that removal of
> it will be a one-liner.

Okay, I think I misunderstood your suggestion. I thought you wanted
this helper to set the reference config, but you actually want to apply
a new state based on the PWM reference values.

Except that pwm_args does not contain all the required information to
apply a full config (args->duty_cycle and args->enable do not exist).

This being said, in my v6 I moved the content of
pwm_regulator_adjust_pwm_config() (patch 27) into a generic helper
(pwm_adjust_config()). This helper is doing pretty much what you're
suggesting here (but again, I'm not sure I correctly understood your
suggestion :-/).

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
