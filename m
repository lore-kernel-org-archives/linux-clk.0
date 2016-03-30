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
Subject: [PATCH v5 17/46] pwm: add the PWM initial state retrieval infra
Date: Wed, 30 Mar 2016 22:03:40 +0200
Message-Id: <1459368249-13241-18-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Add a ->get_state() function to the pwm_ops struct to let PWM drivers
initialize the PWM state attached to a PWM device.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/pwm/core.c  | 3 +++
 include/linux/pwm.h | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index c240b54..a909c64 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -270,6 +270,9 @@ int pwmchip_add_with_polarity(struct pwm_chip *chip,
 		pwm->hwpwm = i;
 		pwm->state.polarity = polarity;
 
+		if (chip->ops->get_state)
+			chip->ops->get_state(chip, pwm, &pwm->state);
+
 		radix_tree_insert(&pwm_tree, pwm->pwm, pwm);
 	}
 
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 55bf463..ceedcf8 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -211,6 +211,9 @@ static inline void pwm_get_args(const struct pwm_device *pwm,
  * @set_polarity: configure the polarity of this PWM
  * @enable: enable PWM output toggling
  * @disable: disable PWM output toggling
+ * @get_state: get the current PWM state. This function is only
+ *	       called once per PWM device when the PWM chip is
+ *	       registered.
  * @dbg_show: optional routine to show contents in debugfs
  * @owner: helps prevent removal of modules exporting active PWMs
  */
@@ -223,6 +226,8 @@ struct pwm_ops {
 			    enum pwm_polarity polarity);
 	int (*enable)(struct pwm_chip *chip, struct pwm_device *pwm);
 	void (*disable)(struct pwm_chip *chip, struct pwm_device *pwm);
+	void (*get_state)(struct pwm_chip *chip, struct pwm_device *pwm,
+			  struct pwm_state *pstate);
 #ifdef CONFIG_DEBUG_FS
 	void (*dbg_show)(struct pwm_chip *chip, struct seq_file *s);
 #endif
-- 
2.5.0
