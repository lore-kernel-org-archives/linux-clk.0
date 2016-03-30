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
Subject: [PATCH v5 11/46] regulator: pwm: use pwm_get_args() where appropriate
Date: Wed, 30 Mar 2016 22:03:34 +0200
Message-Id: <1459368249-13241-12-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
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
---
 drivers/regulator/pwm-regulator.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 4689d62..9154c47 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -59,16 +59,16 @@ static int pwm_regulator_set_voltage_sel(struct regulator_dev *rdev,
 					 unsigned selector)
 {
 	struct pwm_regulator_data *drvdata = rdev_get_drvdata(rdev);
-	unsigned int pwm_reg_period;
+	struct pwm_args pargs = { };
 	int dutycycle;
 	int ret;
 
-	pwm_reg_period = pwm_get_period(drvdata->pwm);
+	pwm_get_args(drvdata->pwm, &pargs);
 
-	dutycycle = (pwm_reg_period *
+	dutycycle = (pargs.period *
 		    drvdata->duty_cycle_table[selector].dutycycle) / 100;
 
-	ret = pwm_config(drvdata->pwm, dutycycle, pwm_reg_period);
+	ret = pwm_config(drvdata->pwm, dutycycle, pargs.period);
 	if (ret) {
 		dev_err(&rdev->dev, "Failed to configure PWM\n");
 		return ret;
@@ -138,13 +138,15 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
 {
 	struct pwm_regulator_data *drvdata = rdev_get_drvdata(rdev);
 	unsigned int ramp_delay = rdev->constraints->ramp_delay;
-	unsigned int period = pwm_get_period(drvdata->pwm);
+	struct pwm_args pargs = { };
 	int duty_cycle;
 	int ret;
 
+	pwm_get_args(drvdata->pwm, &pargs);
 	duty_cycle = pwm_voltage_to_duty_cycle_percentage(rdev, min_uV);
 
-	ret = pwm_config(drvdata->pwm, (period / 100) * duty_cycle, period);
+	ret = pwm_config(drvdata->pwm, (pargs.period / 100) * duty_cycle,
+			 pargs.period);
 	if (ret) {
 		dev_err(&rdev->dev, "Failed to configure PWM\n");
 		return ret;
-- 
2.5.0
