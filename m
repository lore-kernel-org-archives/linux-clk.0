Return-Path: <boris.brezillon@free-electrons.com>
Date: Thu, 31 Mar 2016 09:07:09 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Kamil Debski
 <k.debski@samsung.com>, lm-sensors@lm-sensors.org, Jean Delvare
 <jdelvare@suse.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-input@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie
 <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>,
 linux-leds@vger.kernel.org, Maxime Ripard
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
Subject: Re: [PATCH v5 08/46] hwmon: pwm-fan: use pwm_get_args() where
 appropriate
Message-ID: <20160331090709.5c3bdf70@bbrezillon>
In-Reply-To: <20160330225244.GA24044@roeck-us.net>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
	<1459368249-13241-9-git-send-email-boris.brezillon@free-electrons.com>
	<20160330225244.GA24044@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hi Guenter,

On Wed, 30 Mar 2016 15:52:44 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On Wed, Mar 30, 2016 at 10:03:31PM +0200, Boris Brezillon wrote:
> > The PWM framework has clarified the concept of reference PWM config
> > (the platform dependent config retrieved from the DT or the PWM
> > lookup table) and real PWM state.
> > 
> > Use pwm_get_args() when the PWM user wants to retrieve this reference
> > config and not the current state.
> > 
> > This is part of the rework allowing the PWM framework to support
> > hardware readout and expose real PWM state even when the PWM has
> > just been requested (before the user calls pwm_config/enable/disable()).
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/hwmon/pwm-fan.c | 19 +++++++++++++------
> >  1 file changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> > index 3e23003..82c5656 100644
> > --- a/drivers/hwmon/pwm-fan.c
> > +++ b/drivers/hwmon/pwm-fan.c
> > @@ -40,15 +40,18 @@ struct pwm_fan_ctx {
> >  
> >  static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
> >  {
> > +	struct pwm_args pargs = { };
> 
> Hi Boris,
> 
> I guess I am missing some context; sorry for that. Unfortunately,
> I did not easily find an explanation, so please bear with me.
> 
> Two questions: Why do we need a local copy of struct pwm_args instead
> of a pointer to it ? If it can change while being used, isn't it
> inconsistent anyway ?

It cannot change after pwm_get() is called. For the reason behind
prototype: I just followed the Thierry's proposal, but I'm perfectly
fine returning a const struct pwm_args pointer intead of passing
pwm_args as a parameter.

Thierry, what's your opinion?


> 
> Also, assuming the local copy is necessary, why initialize pargs ? 
> After all, pwm_get_args() just overwrites it.

It's a leftover from a previous version where pwm_get_args was
implemented this way:

static inline void pwm_get_args(pwm, args)
{
	if (pwm)
		*args = pwm->args
}

and this implementation was generating a lot of 'uninitialized
variable' warnings.

I just decided to drop the 'if (pwm)' test, because, IMO, this
should be checked way before calling pwm_get_args() is called.

Anyway, apparently I forgot to modify a few patches after this
modification.

Thanks for the review.

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
