Return-Path: <boris.brezillon@free-electrons.com>
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	linux-pwm@vger.kernel.org
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kamil Debski <k.debski@samsung.com>,
	lm-sensors@lm-sensors.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	Bryan Wu <cooloney@gmail.com>,
	Richard Purdie <rpurdie@rpsys.net>,
	Jacek Anaszewski <j.anaszewski@samsung.com>,
	linux-leds@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@googlegroups.com,
	Joachim Eastwood <manabian@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Jingoo Han <jingoohan1@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	linux-fbdev@vger.kernel.org,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Ryan Mallon <rmallon@gmail.com>,
	Alexander Shiyan <shc_work@mail.ru>,
	Milo Kim <milo.kim@ti.com>,
	Doug Anderson <dianders@google.com>,
	Caesar Wang <wxt@rock-chips.com>,
	Stephen Barber <smbarber@chromium.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v5 17/24] pwm: keep PWM state in sync with hardware state
Date: Thu, 14 Apr 2016 21:17:37 +0200
Message-Id: <1460661464-11216-18-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1460661464-11216-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1460661464-11216-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Before the introduction of pwm_args, the core was resetting the PWM period
and polarity states to the reference values (those provided through the
DT, a PWM lookup table or hardcoded in the driver).

Now that all PWM users are correctly using pwm_args to configure their
PWM device, we can safely remove the pwm_apply_args() call in
pwm_device_request().

We can also get rid of the pwm_set_period() call done in
pwm_apply_args(), because PWM users are now directly using pargs->period
instead of pwm_get_period(). By doing that we avoid messing with the
current PWM period.

The only remaining bit in pwm_apply_args() is the initial polarity
setting, and it should go away when all PWM users have been patched to
use the atomic API (with this API the polarity will be set along with
other PWM arguments when configuring the PWM).

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/pwm/core.c  | 8 --------
 include/linux/pwm.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index ac89529..26c3cf5 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -128,14 +128,6 @@ static int pwm_device_request(struct pwm_device *pwm, const char *label)
 	set_bit(PWMF_REQUESTED, &pwm->flags);
 	pwm->label = label;
 
-	/*
-	 * FIXME: this should be removed as soon as all PWM users are
-	 * properly making use of pwm_args to initialize the PWM device.
-	 * If we don't get rid of it, then PWM state and hardware can be
-	 * desynchronized.
-	 */
-	pwm_apply_args(pwm);
-
 	return 0;
 }
 
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index c8859b7..2f500a5 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -170,7 +170,6 @@ static inline void pwm_get_args(const struct pwm_device *pwm,
 
 static inline void pwm_apply_args(struct pwm_device *pwm)
 {
-	pwm_set_period(pwm, pwm->args.period);
 	pwm_set_polarity(pwm, pwm->args.polarity);
 }
 
-- 
2.5.0
