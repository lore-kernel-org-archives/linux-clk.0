Return-Path: <boris.brezillon@free-electrons.com>
Date: Thu, 31 Mar 2016 08:57:35 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
 Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Mark
 Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Kamil
 Debski <k.debski@samsung.com>, lm-sensors@lm-sensors.org, Jean Delvare
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
Subject: Re: [PATCH v5 34/46] clk: pwm: switch to the atomic API
Message-ID: <20160331085735.3574970b@bbrezillon>
In-Reply-To: <20160330220149.GU18567@codeaurora.org>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
	<1459368249-13241-35-git-send-email-boris.brezillon@free-electrons.com>
	<20160330220149.GU18567@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Wed, 30 Mar 2016 15:01:49 -0700
Stephen Boyd <sboyd@codeaurora.org> wrote:

> On 03/30, Boris Brezillon wrote:
> > diff --git a/drivers/clk/clk-pwm.c b/drivers/clk/clk-pwm.c
> > index ebcd738..49ec5b1 100644
> > --- a/drivers/clk/clk-pwm.c
> > +++ b/drivers/clk/clk-pwm.c
> > @@ -28,15 +28,29 @@ static inline struct clk_pwm *to_clk_pwm(struct clk_hw *hw)
> >  static int clk_pwm_prepare(struct clk_hw *hw)
> >  {
> >  	struct clk_pwm *clk_pwm = to_clk_pwm(hw);
> > +	struct pwm_state pstate;
> >  
> > -	return pwm_enable(clk_pwm->pwm);
> > +	pwm_get_state(clk_pwm->pwm, &pstate);
> > +	if (pstate.enabled)
> > +		return 0;
> > +
> > +	pstate.enabled = true;
> > +
> > +	return pwm_apply_state(clk_pwm->pwm, &pstate);
> 
> This doesn't seem atomic anymore if we're checking the state and
> then not calling apply_state if it's already enabled. But I
> assume this doesn't matter because we "own" the pwm here?

Yep. Actually it's not atomic in term of concurrency (maybe the
'atomic' word is not appropriate here). Atomicity is here referring to
the fact that we're now providing all the PWM parameters in the same
request instead of splitting it in pwm_config() + pwm_enable/disable()
calls.

Concurrent accesses still have to be controlled by the PWM user (which
is already the case for this driver, thanks to the locking
infrastructure in the CCF).

> Otherwise I would think this would be unconditional apply state
> and duplicates would be ignored in the pwm framework.
> 

Yep, I'll remove the if (pstate.enabled) branch.

Thanks for your review.

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
