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
Subject: [PATCH v5 38/46] input: misc: pwm-beeper: switch to the atomic PWM API
Date: Wed, 30 Mar 2016 22:04:01 +0200
Message-Id: <1459368249-13241-39-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

pwm_config/enable/disable() have been deprecated and should be replaced
by pwm_apply_state().

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/input/misc/pwm-beeper.c | 46 +++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/input/misc/pwm-beeper.c b/drivers/input/misc/pwm-beeper.c
index f2261ab..36c9897 100644
--- a/drivers/input/misc/pwm-beeper.c
+++ b/drivers/input/misc/pwm-beeper.c
@@ -34,7 +34,7 @@ static int pwm_beeper_event(struct input_dev *input,
 {
 	int ret = 0;
 	struct pwm_beeper *beeper = input_get_drvdata(input);
-	unsigned long period;
+	struct pwm_state pstate;
 
 	if (type != EV_SND || value < 0)
 		return -EINVAL;
@@ -49,19 +49,22 @@ static int pwm_beeper_event(struct input_dev *input,
 		return -EINVAL;
 	}
 
+	pwm_get_state(beeper->pwm, &pstate);
+
 	if (value == 0) {
-		pwm_disable(beeper->pwm);
+		pstate.enabled = false;
 	} else {
-		period = HZ_TO_NANOSECONDS(value);
-		ret = pwm_config(beeper->pwm, period / 2, period);
-		if (ret)
-			return ret;
-		ret = pwm_enable(beeper->pwm);
-		if (ret)
-			return ret;
-		beeper->period = period;
+		pstate.enabled = false;
+		pstate.period = HZ_TO_NANOSECONDS(value);
+		pstate.duty_cycle = pstate.period / 2;
 	}
 
+	ret = pwm_apply_state(beeper->pwm, &pstate);
+	if (ret)
+		return ret;
+
+	beeper->period = value ? pstate.period : 0;
+
 	return 0;
 }
 
@@ -132,10 +135,13 @@ err_free:
 static int pwm_beeper_remove(struct platform_device *pdev)
 {
 	struct pwm_beeper *beeper = platform_get_drvdata(pdev);
+	struct pwm_state pstate;
 
 	input_unregister_device(beeper->input);
 
-	pwm_disable(beeper->pwm);
+	pwm_get_state(beeper->pwm, &pstate);
+	pstate.enabled = false;
+	pwm_apply_state(beeper->pwm, &pstate);
 	pwm_free(beeper->pwm);
 
 	kfree(beeper);
@@ -147,8 +153,13 @@ static int __maybe_unused pwm_beeper_suspend(struct device *dev)
 {
 	struct pwm_beeper *beeper = dev_get_drvdata(dev);
 
-	if (beeper->period)
-		pwm_disable(beeper->pwm);
+	if (beeper->period) {
+		struct pwm_state pstate;
+
+		pwm_get_state(beeper->pwm, &pstate);
+		pstate.enabled = false;
+		pwm_apply_state(beeper->pwm, &pstate);
+	}
 
 	return 0;
 }
@@ -158,8 +169,13 @@ static int __maybe_unused pwm_beeper_resume(struct device *dev)
 	struct pwm_beeper *beeper = dev_get_drvdata(dev);
 
 	if (beeper->period) {
-		pwm_config(beeper->pwm, beeper->period / 2, beeper->period);
-		pwm_enable(beeper->pwm);
+		struct pwm_state pstate;
+
+		pwm_get_state(beeper->pwm, &pstate);
+		pstate.period = beeper->period;
+		pstate.duty_cycle = beeper->period / 2;
+		pstate.enabled = true;
+		pwm_apply_state(beeper->pwm, &pstate);
 	}
 
 	return 0;
-- 
2.5.0
