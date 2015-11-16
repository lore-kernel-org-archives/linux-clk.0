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
	Julia Lawall <Julia.Lawall@lip6.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 12/24] misc: max77693: use pwm_get/set_default_xxx() helpers where appropriate
Date: Mon, 16 Nov 2015 09:56:35 +0100
Message-Id: <1447664207-24370-13-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1447664207-24370-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1447664207-24370-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

pwm_set/get_default_xxx() helpers have been introduced to differentiate
the default PWM states (those retrieved through DT, PWM lookup table or
statically assigned by the driver) and the current ones.
Make use of those helpers where appropriate.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/input/misc/max77693-haptic.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/max77693-haptic.c b/drivers/input/misc/max77693-haptic.c
index a038fb3..89f5055 100644
--- a/drivers/input/misc/max77693-haptic.c
+++ b/drivers/input/misc/max77693-haptic.c
@@ -70,11 +70,12 @@ struct max77693_haptic {
 
 static int max77693_haptic_set_duty_cycle(struct max77693_haptic *haptic)
 {
-	int delta = (pwm_get_period((haptic->pwm_dev)) + haptic->pwm_duty) / 2;
+	int delta = (pwm_get_default_period((haptic->pwm_dev)) +
+		     haptic->pwm_duty) / 2;
 	int error;
 
 	error = pwm_config(haptic->pwm_dev, delta,
-			   pwm_get_period((haptic->pwm_dev)));
+			   pwm_get_default_period((haptic->pwm_dev)));
 	if (error) {
 		dev_err(haptic->dev, "failed to configure pwm: %d\n", error);
 		return error;
@@ -246,7 +247,8 @@ static int max77693_haptic_play_effect(struct input_dev *dev, void *data,
 	 * The formula to convert magnitude to pwm_duty as follows:
 	 * - pwm_duty = (magnitude * pwm_period) / MAX_MAGNITUDE(0xFFFF)
 	 */
-	period_mag_multi = (u64)pwm_get_period((haptic->pwm_dev)) * haptic->magnitude;
+	period_mag_multi = (u64)pwm_get_default_period((haptic->pwm_dev)) *
+			   haptic->magnitude;
 	haptic->pwm_duty = (unsigned int)(period_mag_multi >>
 						MAX_MAGNITUDE_SHIFT);
 
-- 
2.1.4
