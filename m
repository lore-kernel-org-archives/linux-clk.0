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
Subject: [PATCH v5 22/46] pwm: rockchip: avoid glitches on already running PWMs
Date: Wed, 30 Mar 2016 22:03:45 +0200
Message-Id: <1459368249-13241-23-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

The current logic will disable the PWM clk even if the PWM was left
enabled by the bootloader (because it's controlling a critical device
like a regulator for example).
Keep the PWM clk enabled if the PWM is enabled to avoid any glitches.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/pwm/pwm-rockchip.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-rockchip.c b/drivers/pwm/pwm-rockchip.c
index 6a1087c..5c7e79c 100644
--- a/drivers/pwm/pwm-rockchip.c
+++ b/drivers/pwm/pwm-rockchip.c
@@ -302,6 +302,7 @@ static int rockchip_pwm_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *id;
 	struct rockchip_pwm_chip *pc;
+	struct pwm_state pstate;
 	struct resource *r;
 	int ret;
 
@@ -322,7 +323,7 @@ static int rockchip_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pc->clk))
 		return PTR_ERR(pc->clk);
 
-	ret = clk_prepare(pc->clk);
+	ret = clk_prepare_enable(pc->clk);
 	if (ret)
 		return ret;
 
@@ -345,12 +346,33 @@ static int rockchip_pwm_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
 	}
 
+	/* Keep the PWM clk enabled if the PWM appears to be up and running. */
+	pwm_get_state(pc->chip.pwms, &pstate);
+	if (!pstate.enabled)
+		clk_disable(pc->clk);
+
 	return ret;
 }
 
 static int rockchip_pwm_remove(struct platform_device *pdev)
 {
 	struct rockchip_pwm_chip *pc = platform_get_drvdata(pdev);
+	struct pwm_state pstate;
+
+	/*
+	 * Disable the PWM clk before unpreparing it if the PWM device is still
+	 * running. This should only happen when the last PWM user left it
+	 * enabled, or when nobody requested a PWM that was previously enabled
+	 * by the bootloader.
+	 *
+	 * FIXME: Maybe the core should disable all PWM devices in
+	 * pwmchip_remove(). In this case we'd only have to call
+	 * clk_unprepare() after pwmchip_remove().
+	 *
+	 */
+	pwm_get_state(pc->chip.pwms, &pstate);
+	if (pstate.enabled)
+		clk_disable(pc->clk);
 
 	clk_unprepare(pc->clk);
 
-- 
2.5.0
