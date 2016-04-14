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
Subject: [PATCH v5 03/24] clk: pwm: use pwm_get_args() where appropriate
Date: Thu, 14 Apr 2016 21:17:23 +0200
Message-Id: <1460661464-11216-4-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1460661464-11216-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1460661464-11216-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

The PWM framework has clarified the concept of reference PWM config
(the platform dependent config retrieved from the DT or the PWM
lookup table) and real PWM state.

Use pwm_get_args() when the PWM user wants to retrieve this reference
config and not the current state.

This is part of the rework allowing the PWM framework to support
hardware readout and expose real PWM state even when the PWM has
just been requested (before the user calls pwm_config/enable/disable()).

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-pwm.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-pwm.c b/drivers/clk/clk-pwm.c
index 8830458..1630a1f 100644
--- a/drivers/clk/clk-pwm.c
+++ b/drivers/clk/clk-pwm.c
@@ -59,6 +59,7 @@ static int clk_pwm_probe(struct platform_device *pdev)
 	struct clk_init_data init;
 	struct clk_pwm *clk_pwm;
 	struct pwm_device *pwm;
+	struct pwm_args pargs;
 	const char *clk_name;
 	struct clk *clk;
 	int ret;
@@ -71,22 +72,28 @@ static int clk_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pwm))
 		return PTR_ERR(pwm);
 
-	if (!pwm->period) {
+	pwm_get_args(pwm, &pargs);
+	if (!pargs.period) {
 		dev_err(&pdev->dev, "invalid PWM period\n");
 		return -EINVAL;
 	}
 
 	if (of_property_read_u32(node, "clock-frequency", &clk_pwm->fixed_rate))
-		clk_pwm->fixed_rate = NSEC_PER_SEC / pwm->period;
+		clk_pwm->fixed_rate = NSEC_PER_SEC / pargs.period;
 
-	if (pwm->period != NSEC_PER_SEC / clk_pwm->fixed_rate &&
-	    pwm->period != DIV_ROUND_UP(NSEC_PER_SEC, clk_pwm->fixed_rate)) {
+	if (pargs.period != NSEC_PER_SEC / clk_pwm->fixed_rate &&
+	    pargs.period != DIV_ROUND_UP(NSEC_PER_SEC, clk_pwm->fixed_rate)) {
 		dev_err(&pdev->dev,
 			"clock-frequency does not match PWM period\n");
 		return -EINVAL;
 	}
 
-	ret = pwm_config(pwm, (pwm->period + 1) >> 1, pwm->period);
+	/*
+	 * FIXME: pwm_apply_args() should be removed when switching to the
+	 * atomic PWM API.
+	 */
+	pwm_apply_args(pwm);
+	ret = pwm_config(pwm, (pargs.period + 1) >> 1, pargs.period);
 	if (ret < 0)
 		return ret;
 
-- 
2.5.0
