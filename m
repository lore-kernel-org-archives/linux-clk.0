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
Subject: [PATCH v4 14/24] clk: pwm: use pwm_get/set_default_xxx() helpers where appropriate
Date: Mon, 16 Nov 2015 09:56:37 +0100
Message-Id: <1447664207-24370-15-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1447664207-24370-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1447664207-24370-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

pwm_set/get_default_xxx() helpers have been introduced to differentiate
the default PWM states (those retrieved through DT, PWM lookup table or
statically assigned by the driver) and the current ones.
Make use of those helpers where appropriate.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/clk/clk-pwm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-pwm.c b/drivers/clk/clk-pwm.c
index b6306a2..642a49a 100644
--- a/drivers/clk/clk-pwm.c
+++ b/drivers/clk/clk-pwm.c
@@ -71,23 +71,23 @@ static int clk_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pwm))
 		return PTR_ERR(pwm);
 
-	if (!pwm_get_period((pwm))) {
+	if (!pwm_get_default_period((pwm))) {
 		dev_err(&pdev->dev, "invalid PWM period\n");
 		return -EINVAL;
 	}
 
 	if (of_property_read_u32(node, "clock-frequency", &clk_pwm->fixed_rate))
-		clk_pwm->fixed_rate = NSEC_PER_SEC / pwm_get_period((pwm));
+		clk_pwm->fixed_rate = NSEC_PER_SEC / pwm_get_default_period((pwm));
 
-	if (pwm_get_period((pwm)) != NSEC_PER_SEC / clk_pwm->fixed_rate &&
-	    pwm_get_period((pwm)) != DIV_ROUND_UP(NSEC_PER_SEC, clk_pwm->fixed_rate)) {
+	if (pwm_get_default_period((pwm)) != NSEC_PER_SEC / clk_pwm->fixed_rate &&
+	    pwm_get_default_period((pwm)) != DIV_ROUND_UP(NSEC_PER_SEC, clk_pwm->fixed_rate)) {
 		dev_err(&pdev->dev,
 			"clock-frequency does not match PWM period\n");
 		return -EINVAL;
 	}
 
-	ret = pwm_config(pwm, (pwm_get_period((pwm)) + 1) >> 1,
-			 pwm_get_period((pwm)));
+	ret = pwm_config(pwm, (pwm_get_default_period((pwm)) + 1) >> 1,
+			 pwm_get_default_period((pwm)));
 	if (ret < 0)
 		return ret;
 
-- 
2.1.4
