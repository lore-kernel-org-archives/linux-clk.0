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
Subject: [PATCH v5 37/46] input: misc: max8997: switch to the atomic PWM API
Date: Wed, 30 Mar 2016 22:04:00 +0200
Message-Id: <1459368249-13241-38-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

pwm_config/enable/disable() have been deprecated and should be replaced
by pwm_apply_state().

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/input/misc/max8997_haptic.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/max8997_haptic.c b/drivers/input/misc/max8997_haptic.c
index a806ba3..fcc0eb7 100644
--- a/drivers/input/misc/max8997_haptic.c
+++ b/drivers/input/misc/max8997_haptic.c
@@ -72,8 +72,12 @@ static int max8997_haptic_set_duty_cycle(struct max8997_haptic *chip)
 	int ret = 0;
 
 	if (chip->mode == MAX8997_EXTERNAL_MODE) {
-		unsigned int duty = chip->pwm_period * chip->level / 100;
-		ret = pwm_config(chip->pwm, duty, chip->pwm_period);
+		struct pwm_state pstate;
+
+		pwm_get_state(chip->pwm, &pstate);
+		pstate.period = chip->pwm_period;
+		pstate.duty_cycle = chip->pwm_period * chip->level / 100;
+		ret = pwm_apply_state(chip->pwm, &pstate);
 	} else {
 		int i;
 		u8 duty_index = 0;
@@ -188,7 +192,11 @@ static void max8997_haptic_enable(struct max8997_haptic *chip)
 		}
 		max8997_haptic_configure(chip);
 		if (chip->mode == MAX8997_EXTERNAL_MODE) {
-			error = pwm_enable(chip->pwm);
+			struct pwm_state pstate;
+
+			pwm_get_state(chip->pwm, &pstate);
+			pstate.enabled = true;
+			error = pwm_apply_state(chip->pwm, &pstate);
 			if (error) {
 				dev_err(chip->dev, "Failed to enable PWM\n");
 				regulator_disable(chip->regulator);
@@ -209,8 +217,13 @@ static void max8997_haptic_disable(struct max8997_haptic *chip)
 	if (chip->enabled) {
 		chip->enabled = false;
 		max8997_haptic_configure(chip);
-		if (chip->mode == MAX8997_EXTERNAL_MODE)
-			pwm_disable(chip->pwm);
+		if (chip->mode == MAX8997_EXTERNAL_MODE) {
+			struct pwm_state pstate;
+
+			pwm_get_state(chip->pwm, &pstate);
+			pstate.enabled = false;
+			pwm_apply_state(chip->pwm, &pstate);
+		}
 		regulator_disable(chip->regulator);
 	}
 
-- 
2.5.0
