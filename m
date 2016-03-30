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
Subject: [PATCH v5 36/46] input: misc: max77693: switch to the atomic API
Date: Wed, 30 Mar 2016 22:03:59 +0200
Message-Id: <1459368249-13241-37-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

pwm_config/enable/disable() have been deprecated and should be replaced
by pwm_apply_state().

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/input/misc/max77693-haptic.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/max77693-haptic.c b/drivers/input/misc/max77693-haptic.c
index cf6aac0..aef7dc4 100644
--- a/drivers/input/misc/max77693-haptic.c
+++ b/drivers/input/misc/max77693-haptic.c
@@ -70,13 +70,16 @@ struct max77693_haptic {
 
 static int max77693_haptic_set_duty_cycle(struct max77693_haptic *haptic)
 {
+	struct pwm_state pstate;
 	struct pwm_args pargs = { };
-	int delta;
 	int error;
 
 	pwm_get_args(haptic->pwm_dev, &pargs);
-	delta = (pargs.period + haptic->pwm_duty) / 2;
-	error = pwm_config(haptic->pwm_dev, delta, pargs.period);
+	pwm_get_state(haptic->pwm_dev, &pstate);
+
+	pstate.period = pargs.period;
+	pstate.duty_cycle = (pargs.period + haptic->pwm_duty) / 2;
+	error = pwm_apply_state(haptic->pwm_dev, &pstate);
 	if (error) {
 		dev_err(haptic->dev, "failed to configure pwm: %d\n", error);
 		return error;
@@ -161,12 +164,16 @@ static int max77693_haptic_lowsys(struct max77693_haptic *haptic, bool enable)
 
 static void max77693_haptic_enable(struct max77693_haptic *haptic)
 {
+	struct pwm_state pstate;
 	int error;
 
 	if (haptic->enabled)
 		return;
 
-	error = pwm_enable(haptic->pwm_dev);
+	pwm_get_state(haptic->pwm_dev, &pstate);
+	pstate.enabled = true;
+
+	error = pwm_apply_state(haptic->pwm_dev, &pstate);
 	if (error) {
 		dev_err(haptic->dev,
 			"failed to enable haptic pwm device: %d\n", error);
@@ -188,11 +195,13 @@ static void max77693_haptic_enable(struct max77693_haptic *haptic)
 err_enable_config:
 	max77693_haptic_lowsys(haptic, false);
 err_enable_lowsys:
-	pwm_disable(haptic->pwm_dev);
+	pstate.enabled = false;
+	pwm_apply_state(haptic->pwm_dev, &pstate);
 }
 
 static void max77693_haptic_disable(struct max77693_haptic *haptic)
 {
+	struct pwm_state pstate;
 	int error;
 
 	if (!haptic->enabled)
@@ -206,7 +215,9 @@ static void max77693_haptic_disable(struct max77693_haptic *haptic)
 	if (error)
 		goto err_disable_lowsys;
 
-	pwm_disable(haptic->pwm_dev);
+	pwm_get_state(haptic->pwm_dev, &pstate);
+	pstate.enabled = false;
+	pwm_apply_state(haptic->pwm_dev, &pstate);
 	haptic->enabled = false;
 
 	return;
-- 
2.5.0
