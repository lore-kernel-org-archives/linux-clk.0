Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Wed, 13 Apr 2016 09:26:13 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
	linux-pwm@vger.kernel.org, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kamil Debski <k.debski@samsung.com>, lm-sensors@lm-sensors.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, Bryan Wu <cooloney@gmail.com>,
	Richard Purdie <rpurdie@rpsys.net>,
	Jacek Anaszewski <j.anaszewski@samsung.com>,
	linux-leds@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
	Joachim Eastwood <manabian@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
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
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Ryan Mallon <rmallon@gmail.com>,
	Alexander Shiyan <shc_work@mail.ru>, Milo Kim <milo.kim@ti.com>
Subject: Re: [PATCH v5 03/46] backlight: lm3630a_bl: stop messing with the
 pwm->period field
Message-ID: <20160413082613.GM8094@x1>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-4-git-send-email-boris.brezillon@free-electrons.com>
 <20160412110809.GI18882@ulmo.ba.sec>
 <20160412141613.GI8094@x1>
 <20160412142608.GB25006@ulmo.ba.sec>
 <20160413082511.GL8094@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20160413082511.GL8094@x1>
List-ID: <linux-clk.vger.kernel.org>

On Wed, 13 Apr 2016, Lee Jones wrote:

> On Tue, 12 Apr 2016, Thierry Reding wrote:
> 
> > On Tue, Apr 12, 2016 at 03:16:13PM +0100, Lee Jones wrote:
> > > On Tue, 12 Apr 2016, Thierry Reding wrote:
> > > 
> > > > On Wed, Mar 30, 2016 at 10:03:26PM +0200, Boris Brezillon wrote:
> > > > > pwm->period field is not supposed to be changed by PWM users. The only
> > > > > ones authorized to change it are the PWM core and PWM drivers.
> > > > > 
> > > > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > > > > ---
> > > > >  drivers/video/backlight/lm3630a_bl.c | 3 +--
> > > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > 
> > > > Applied, thanks.
> > > 
> > > Applied?
> > 
> > You didn't specifically Ack this one, but I presumed that since the
> > change is essentially the same as for pwm-backlight, and this is another
> > prerequisite for the remainder of the series it should go in through the
> > PWM tree as well.
> 
> If you're taking Backlight patches through a !Backlight tree, you're
> going to have to send out a pull-request.  There are no conflicts
> currently, so I won't use it right away, but I need it in my arsenal
> if they do occur.

... also, don't forget to change the subject line to make the
rest of the patches in Backlight.  The subject description needs to
start with an uppercase char.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
