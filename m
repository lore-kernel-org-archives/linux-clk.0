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
Subject: [PATCH v5 24/46] pwm: sti: add support for initial state retrieval
Date: Wed, 30 Mar 2016 22:03:47 +0200
Message-Id: <1459368249-13241-25-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Implement ->get_state() to provide support for initial state retrieval.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/pwm/pwm-sti.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/pwm/pwm-sti.c b/drivers/pwm/pwm-sti.c
index 92abbd5..0fbca94 100644
--- a/drivers/pwm/pwm-sti.c
+++ b/drivers/pwm/pwm-sti.c
@@ -238,6 +238,46 @@ static void sti_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 	mutex_unlock(&pc->sti_pwm_lock);
 }
 
+static void sti_pwm_get_state(struct pwm_chip *chip,
+			      struct pwm_device *pwm,
+			      struct pwm_state *pstate)
+{
+	struct sti_pwm_chip *pc = to_sti_pwmchip(chip);
+	unsigned int regval, prescaler;
+	u64 timens;
+	int ret;
+
+	/* The clock has to be enabled to access PWM registers */
+	ret = clk_enable(pc->clk);
+	if (ret) {
+		dev_err(chip->dev, "Failed to enable PWM clk");
+		return;
+	}
+
+	regmap_field_read(pc->prescale_high, &regval);
+	prescaler = regval << 4;
+	regmap_field_read(pc->prescale_low, &regval);
+	prescaler |= regval;
+
+	timens = (u64)(prescaler + 1) * NSEC_PER_SEC *
+		 (pc->cdata->max_pwm_cnt + 1);
+	do_div(timens, pc->clk_rate);
+
+	pstate->period = timens;
+
+	regmap_read(pc->regmap, STI_DS_REG(pwm->hwpwm), &regval);
+	timens = (u64)(regval + 1) * pstate->period;
+	do_div(timens, pc->cdata->max_pwm_cnt + 1);
+	pstate->duty_cycle = timens;
+
+	regmap_field_read(pc->pwm_en, &regval);
+	pstate->enabled = regval;
+
+	pstate->polarity = PWM_POLARITY_NORMAL;
+
+	clk_disable(pc->clk);
+}
+
 static void sti_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
 {
 	struct sti_pwm_chip *pc = to_sti_pwmchip(chip);
@@ -249,6 +289,7 @@ static const struct pwm_ops sti_pwm_ops = {
 	.config = sti_pwm_config,
 	.enable = sti_pwm_enable,
 	.disable = sti_pwm_disable,
+	.get_state = sti_pwm_get_state,
 	.free = sti_pwm_free,
 	.owner = THIS_MODULE,
 };
-- 
2.5.0
