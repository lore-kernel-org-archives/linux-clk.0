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
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Ryan Mallon <rmallon@gmail.com>,
	Alexander Shiyan <shc_work@mail.ru>,
	Milo Kim <milo.kim@ti.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v5 42/46] backlight: lp8788: switch to the atomic PWM API
Date: Wed, 30 Mar 2016 22:04:05 +0200
Message-Id: <1459368249-13241-43-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

pwm_config/enable/disable() have been deprecated and should be replaced
by pwm_apply_state().

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/video/backlight/lp8788_bl.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/video/backlight/lp8788_bl.c b/drivers/video/backlight/lp8788_bl.c
index 5d583d7..521c730 100644
--- a/drivers/video/backlight/lp8788_bl.c
+++ b/drivers/video/backlight/lp8788_bl.c
@@ -124,16 +124,13 @@ static int lp8788_backlight_configure(struct lp8788_bl *bl)
 
 static void lp8788_pwm_ctrl(struct lp8788_bl *bl, int br, int max_br)
 {
-	unsigned int period;
-	unsigned int duty;
 	struct device *dev;
+	struct pwm_state pstate;
 	struct pwm_device *pwm;
 
 	if (!bl->pdata)
 		return;
 
-	period = bl->pdata->period_ns;
-	duty = br * period / max_br;
 	dev = bl->lp->dev;
 
 	/* request PWM device with the consumer name */
@@ -147,11 +144,15 @@ static void lp8788_pwm_ctrl(struct lp8788_bl *bl, int br, int max_br)
 		bl->pwm = pwm;
 	}
 
-	pwm_config(bl->pwm, duty, period);
-	if (duty)
-		pwm_enable(bl->pwm);
+	pwm_get_state(bl->pwm, &pstate);
+	pstate.period = bl->pdata->period_ns;
+	pstate.duty_cycle = br * pstate.period / max_br;
+	if (pstate.duty_cycle)
+		pstate.enabled = true;
 	else
-		pwm_disable(bl->pwm);
+		pstate.enabled = false;
+
+	pwm_apply_state(bl->pwm, &pstate);
 }
 
 static int lp8788_bl_update_status(struct backlight_device *bl_dev)
-- 
2.5.0
