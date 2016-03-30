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
Subject: [PATCH v5 35/46] hwmon: pwm-fan: switch to the atomic API
Date: Wed, 30 Mar 2016 22:03:58 +0200
Message-Id: <1459368249-13241-36-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

pwm_config/enable/disable() have been deprecated and should be replaced
by pwm_apply_state().

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/hwmon/pwm-fan.c | 81 ++++++++++++++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 82c5656..da4e4ab 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -40,8 +40,8 @@ struct pwm_fan_ctx {
 
 static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
 {
+	struct pwm_state pstate;
 	struct pwm_args pargs = { };
-	unsigned long duty;
 	int ret = 0;
 
 	pwm_get_args(ctx->pwm, &pargs);
@@ -50,19 +50,17 @@ static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
 	if (ctx->pwm_value == pwm)
 		goto exit_set_pwm_err;
 
-	duty = DIV_ROUND_UP(pwm * (pargs.period - 1), MAX_PWM);
-	ret = pwm_config(ctx->pwm, duty, pargs.period);
-	if (ret)
-		goto exit_set_pwm_err;
-
+	pwm_get_state(ctx->pwm, &pstate);
+	pstate.period = pargs.period;
+	pstate.duty_cycle = DIV_ROUND_UP(pwm * (pargs.period - 1), MAX_PWM);
 	if (pwm == 0)
-		pwm_disable(ctx->pwm);
+		pstate.enabled = false;
+	else
+		pstate.enabled = true;
 
-	if (ctx->pwm_value == 0) {
-		ret = pwm_enable(ctx->pwm);
-		if (ret)
-			goto exit_set_pwm_err;
-	}
+	ret = pwm_apply_state(ctx->pwm, &pstate);
+	if (ret)
+		goto exit_set_pwm_err;
 
 	ctx->pwm_value = pwm;
 exit_set_pwm_err:
@@ -217,10 +215,10 @@ static int pwm_fan_of_get_cooling_data(struct device *dev,
 static int pwm_fan_probe(struct platform_device *pdev)
 {
 	struct thermal_cooling_device *cdev;
+	struct pwm_state pstate;
 	struct pwm_args pargs = { };
 	struct pwm_fan_ctx *ctx;
 	struct device *hwmon;
-	int duty_cycle;
 	int ret;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
@@ -239,27 +237,25 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	/* Set duty cycle to maximum allowed */
 	pwm_get_args(ctx->pwm, &pargs);
-	duty_cycle = pargs.period - 1;
+	pwm_get_state(ctx->pwm, &pstate);
+
+	pstate.period = pargs.period;
+	pstate.duty_cycle = pargs.period - 1;
+	pstate.enabled = true;
 	ctx->pwm_value = MAX_PWM;
 
-	ret = pwm_config(ctx->pwm, duty_cycle, pargs.period);
+	ret = pwm_apply_state(ctx->pwm, &pstate);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to configure PWM\n");
 		return ret;
 	}
 
-	/* Enbale PWM output */
-	ret = pwm_enable(ctx->pwm);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to enable PWM\n");
-		return ret;
-	}
-
 	hwmon = devm_hwmon_device_register_with_groups(&pdev->dev, "pwmfan",
 						       ctx, pwm_fan_groups);
 	if (IS_ERR(hwmon)) {
 		dev_err(&pdev->dev, "Failed to register hwmon device\n");
-		pwm_disable(ctx->pwm);
+		pstate.enabled = false;
+		pwm_apply_state(ctx->pwm, &pstate);
 		return PTR_ERR(hwmon);
 	}
 
@@ -275,7 +271,8 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		if (IS_ERR(cdev)) {
 			dev_err(&pdev->dev,
 				"Failed to register pwm-fan as cooling device");
-			pwm_disable(ctx->pwm);
+			pstate.enabled = false;
+			pwm_apply_state(ctx->pwm, &pstate);
 			return PTR_ERR(cdev);
 		}
 		ctx->cdev = cdev;
@@ -290,8 +287,14 @@ static int pwm_fan_remove(struct platform_device *pdev)
 	struct pwm_fan_ctx *ctx = platform_get_drvdata(pdev);
 
 	thermal_cooling_device_unregister(ctx->cdev);
-	if (ctx->pwm_value)
-		pwm_disable(ctx->pwm);
+	if (ctx->pwm_value) {
+		struct pwm_state pstate;
+
+		pwm_get_state(ctx->pwm, &pstate);
+		pstate.enabled = false;
+		pwm_apply_state(ctx->pwm, &pstate);
+	}
+
 	return 0;
 }
 
@@ -300,27 +303,35 @@ static int pwm_fan_suspend(struct device *dev)
 {
 	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
 
-	if (ctx->pwm_value)
-		pwm_disable(ctx->pwm);
+	if (ctx->pwm_value) {
+		struct pwm_state pstate;
+
+		pwm_get_state(ctx->pwm, &pstate);
+		pstate.enabled = false;
+		pwm_apply_state(ctx->pwm, &pstate);
+	}
+
 	return 0;
 }
 
 static int pwm_fan_resume(struct device *dev)
 {
 	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
+	struct pwm_state pstate;
 	struct pwm_args pargs = { };
-	unsigned long duty;
-	int ret;
 
 	if (ctx->pwm_value == 0)
 		return 0;
 
 	pwm_get_args(ctx->pwm, &pargs);
-	duty = DIV_ROUND_UP(ctx->pwm_value * (pargs.period - 1), MAX_PWM);
-	ret = pwm_config(ctx->pwm, duty, pargs.period);
-	if (ret)
-		return ret;
-	return pwm_enable(ctx->pwm);
+	pwm_get_state(ctx->pwm, &pstate);
+
+	pstate.period = pargs.period;
+	pstate.duty_cycle = DIV_ROUND_UP(ctx->pwm_value * (pargs.period - 1),
+					 MAX_PWM);
+	pstate.enabled = true;
+
+	return pwm_apply_state(ctx->pwm, &pstate);
 }
 #endif
 
-- 
2.5.0
