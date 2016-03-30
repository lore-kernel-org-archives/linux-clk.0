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
Subject: [PATCH v5 34/46] clk: pwm: switch to the atomic API
Date: Wed, 30 Mar 2016 22:03:57 +0200
Message-Id: <1459368249-13241-35-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

pwm_config/enable/disable() have been deprecated and should be replaced
by pwm_apply_state().

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/clk/clk-pwm.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-pwm.c b/drivers/clk/clk-pwm.c
index ebcd738..49ec5b1 100644
--- a/drivers/clk/clk-pwm.c
+++ b/drivers/clk/clk-pwm.c
@@ -28,15 +28,29 @@ static inline struct clk_pwm *to_clk_pwm(struct clk_hw *hw)
 static int clk_pwm_prepare(struct clk_hw *hw)
 {
 	struct clk_pwm *clk_pwm = to_clk_pwm(hw);
+	struct pwm_state pstate;
 
-	return pwm_enable(clk_pwm->pwm);
+	pwm_get_state(clk_pwm->pwm, &pstate);
+	if (pstate.enabled)
+		return 0;
+
+	pstate.enabled = true;
+
+	return pwm_apply_state(clk_pwm->pwm, &pstate);
 }
 
 static void clk_pwm_unprepare(struct clk_hw *hw)
 {
 	struct clk_pwm *clk_pwm = to_clk_pwm(hw);
+	struct pwm_state pstate;
+
+	pwm_get_state(clk_pwm->pwm, &pstate);
+	if (!pstate.enabled)
+		return;
 
-	pwm_disable(clk_pwm->pwm);
+	pstate.enabled = false;
+
+	pwm_apply_state(clk_pwm->pwm, &pstate);
 }
 
 static unsigned long clk_pwm_recalc_rate(struct clk_hw *hw,
@@ -56,6 +70,7 @@ static const struct clk_ops clk_pwm_ops = {
 static int clk_pwm_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
+	struct pwm_state pstate;
 	struct pwm_args pargs = { };
 	struct clk_init_data init;
 	struct clk_pwm *clk_pwm;
@@ -88,7 +103,12 @@ static int clk_pwm_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	ret = pwm_config(pwm, (pargs.period + 1) >> 1, pargs.period);
+	pwm_get_state(pwm, &pstate);
+	pstate.period = pargs.period;
+	pstate.polarity = pargs.polarity;
+	pstate.duty_cycle = (pargs.period + 1) >> 1;
+
+	ret = pwm_apply_state(pwm, &pstate);
 	if (ret < 0)
 		return ret;
 
-- 
2.5.0
