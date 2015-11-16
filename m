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
Subject: [PATCH v4 09/24] regulator: pwm: use pwm_get/set_default_xxx() helpers where appropriate
Date: Mon, 16 Nov 2015 09:56:32 +0100
Message-Id: <1447664207-24370-10-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1447664207-24370-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1447664207-24370-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

pwm_set/get_default_xxx() helpers have been introduced to differentiate
the default PWM states (those retrieved through DT, PWM lookup table or
statically assigned by the driver) and the current ones.
Make use of those helpers where appropriate.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/regulator/pwm-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 3aca067b..9ffdbd6 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -56,7 +56,7 @@ static int pwm_regulator_set_voltage_sel(struct regulator_dev *rdev,
 	int dutycycle;
 	int ret;
 
-	pwm_reg_period = pwm_get_period(drvdata->pwm);
+	pwm_reg_period = pwm_get_default_period(drvdata->pwm);
 
 	dutycycle = (pwm_reg_period *
 		    drvdata->duty_cycle_table[selector].dutycycle) / 100;
@@ -131,7 +131,7 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
 {
 	struct pwm_regulator_data *drvdata = rdev_get_drvdata(rdev);
 	unsigned int ramp_delay = rdev->constraints->ramp_delay;
-	unsigned int period = pwm_get_period(drvdata->pwm);
+	unsigned int period = pwm_get_default_period(drvdata->pwm);
 	int duty_cycle;
 	int ret;
 
-- 
2.1.4
