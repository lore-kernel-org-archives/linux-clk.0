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
Subject: [PATCH v5 30/46] regulator: pwm: retrieve correct voltage
Date: Wed, 30 Mar 2016 22:03:53 +0200
Message-Id: <1459368249-13241-31-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

The continuous PWM voltage regulator is caching the voltage value in
the ->volt_uV field. While most of the time this value should reflect the
real voltage, sometime it can be sightly different if the PWM device
rounded the set_duty_cycle request.
Moreover, this value is not valid until someone has modified the regulator
output.

Remove the ->volt_uV field and always rely on the PWM state to calculate
the regulator output.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/regulator/pwm-regulator.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 9374796..77f42d8 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -35,9 +35,6 @@ struct pwm_regulator_data {
 	struct regulator_ops ops;
 
 	int state;
-
-	/* Continuous voltage */
-	int volt_uV;
 };
 
 struct pwm_voltages {
@@ -167,11 +164,27 @@ static int pwm_voltage_to_duty_cycle_percentage(struct regulator_dev *rdev, int
 	return ((req_uV * 100) - (min_uV * 100)) / diff;
 }
 
+static int pwm_duty_cycle_percentage_to_voltage(struct regulator_dev *rdev,
+						int dutycycle)
+{
+	int min_uV = rdev->constraints->min_uV;
+	int max_uV = rdev->constraints->max_uV;
+	int diff = max_uV - min_uV;
+
+	return min_uV + ((diff * dutycycle) / 100);
+}
+
 static int pwm_regulator_get_voltage(struct regulator_dev *rdev)
 {
 	struct pwm_regulator_data *drvdata = rdev_get_drvdata(rdev);
+	struct pwm_state pstate;
+	u64 dutycycle;
 
-	return drvdata->volt_uV;
+	pwm_get_state(drvdata->pwm, &pstate);
+	dutycycle = pstate.duty_cycle * 100;
+	do_div(dutycycle, pstate.period);
+
+	return pwm_duty_cycle_percentage_to_voltage(rdev, dutycycle);
 }
 
 static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
@@ -196,8 +209,6 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
 		return ret;
 	}
 
-	drvdata->volt_uV = min_uV;
-
 	/* Delay required by PWM regulator to settle to the new voltage */
 	usleep_range(ramp_delay, ramp_delay + 1000);
 
-- 
2.5.0
