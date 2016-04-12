Return-Path: <boris.brezillon@free-electrons.com>
Date: Tue, 12 Apr 2016 13:32:55 +0200
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
Subject: Re: [PATCH v5 04/46] pwm: get rid of pwm->lock
Message-ID: <20160412133255.73cea027@bbrezillon>
In-Reply-To: <20160412112246.GJ18882@ulmo.ba.sec>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
	<1459368249-13241-5-git-send-email-boris.brezillon@free-electrons.com>
	<20160412112246.GJ18882@ulmo.ba.sec>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hi Thierry,

On Tue, 12 Apr 2016 13:22:46 +0200
Thierry Reding <thierry.reding@gmail.com> wrote:

> On Wed, Mar 30, 2016 at 10:03:27PM +0200, Boris Brezillon wrote:
> > PWM devices are not protected against concurrent accesses. The lock in
> > pwm_device might let PWM users think it is, but it's actually only
> > protecting the enabled state.
> > 
> > Removing this lock should be fine as long as all PWM users are aware that
> > accesses to the PWM device have to be serialized, which seems to be the
> > case for all of them except the sysfs interface.
> > Patch the sysfs code by adding a lock to the pwm_export struct and making
> > sure it's taken for all accesses to the exported PWM device.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/pwm/core.c  | 19 ++++--------------
> >  drivers/pwm/sysfs.c | 57 ++++++++++++++++++++++++++++++++++++++++++-----------
> >  include/linux/pwm.h |  2 --
> >  3 files changed, 50 insertions(+), 28 deletions(-)
> 
> This is a little overzealous. Only accesses that can cause races need to
> be protected by the lock. All of the *_show() callbacks don't modify the
> PWM device in any way, so there is no need to protect them against
> concurrent accesses.

This is probably true for this set of changes, but what will happen
when we'll switch to the atomic API? There's no guarantee that
pwm->state = *newstate is done atomically, and you may see a partially
updated state when calling pwm_get_state() while another thread is
calling pwm_apply_state().

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
