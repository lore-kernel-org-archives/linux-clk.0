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
Subject: [PATCH v4 06/24] pwm: introduce default period and polarity concepts
Date: Mon, 16 Nov 2015 09:56:29 +0100
Message-Id: <1447664207-24370-7-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1447664207-24370-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1447664207-24370-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

When requested by a user, the PWM is assigned a default period and polarity
extracted from the DT, the platform data or statically set by the driver.
Those default values are currently stored in the period and polarity
fields of the pwm_device struct, but they will be stored somewhere else
once we have introduced the architecture allowing for hardware state
retrieval.

The pwm_set_default_polarity and pwm_set_default_period should only be
used by PWM drivers or the PWM core infrastructure to specify the
default period and polarity values.

PWM users might call the pwm_get_default_period to query the default
period value. There is currently no helper to query the default
polarity, but it might be added later on if there is a need for it.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 include/linux/pwm.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index cfc3ed4..8ba57fc 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -118,11 +118,22 @@ static inline void pwm_set_period(struct pwm_device *pwm, unsigned int period)
 		pwm->period = period;
 }
 
+static inline void pwm_set_default_period(struct pwm_device *pwm,
+					  unsigned int period)
+{
+	pwm_set_period(pwm, period);
+}
+
 static inline unsigned int pwm_get_period(const struct pwm_device *pwm)
 {
 	return pwm ? pwm->period : 0;
 }
 
+static inline unsigned int pwm_get_default_period(const struct pwm_device *pwm)
+{
+	return pwm_get_period(pwm);
+}
+
 static inline void pwm_set_duty_cycle(struct pwm_device *pwm, unsigned int duty)
 {
 	if (pwm)
@@ -139,6 +150,12 @@ static inline unsigned int pwm_get_duty_cycle(const struct pwm_device *pwm)
  */
 int pwm_set_polarity(struct pwm_device *pwm, enum pwm_polarity polarity);
 
+static inline void pwm_set_default_polarity(struct pwm_device *pwm,
+					    enum pwm_polarity polarity)
+{
+	pwm_set_polarity(pwm, polarity);
+}
+
 static inline enum pwm_polarity pwm_get_polarity(const struct pwm_device *pwm)
 {
 	return pwm ? pwm->polarity : PWM_POLARITY_NORMAL;
-- 
2.1.4
