Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:34795 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752446AbbKPI5R (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 16 Nov 2015 03:57:17 -0500
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	linux-pwm@vger.kernel.org
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kamil Debski <k.debski@samsung.com>, lm-sensors@lm-sensors.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, Bryan Wu <cooloney@gmail.com>,
	Richard Purdie <rpurdie@rpsys.net>,
	Jacek Anaszewski <j.anaszewski@samsung.com>,
	linux-leds@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
	Joachim Eastwood <manabian@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Jingoo Han <jingoohan1@gmail.com>,
	Lee Jones <lee.jones@linaro.org>, linux-fbdev@vger.kernel.org,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Julia Lawall <Julia.Lawall@lip6.fr>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 19/24] pwm: add the PWM initial state retrieval infra
Date: Mon, 16 Nov 2015 09:56:42 +0100
Message-Id: <1447664207-24370-20-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1447664207-24370-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1447664207-24370-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add a ->reset_state() function to the pwm_ops struct to let PWM drivers
initialize the PWM state attached to a PWM device.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/pwm/core.c  | 3 +++
 include/linux/pwm.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 6bbda6c..ce8b373 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -271,6 +271,9 @@ int pwmchip_add_with_polarity(struct pwm_chip *chip,
 		pwm_set_default_polarity(pwm, polarity);
 		mutex_init(&pwm->lock);
 
+		if (chip->ops->reset_state)
+			chip->ops->reset_state(chip, pwm);
+
 		radix_tree_insert(&pwm_tree, pwm->pwm, pwm);
 	}
 
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 292e7da..caa0ffe 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -182,6 +182,9 @@ static inline enum pwm_polarity pwm_get_polarity(const struct pwm_device *pwm)
  * @set_polarity: configure the polarity of this PWM
  * @enable: enable PWM output toggling
  * @disable: disable PWM output toggling
+ * @reset_state: reset the current PWM state (pwm->state) to the actual
+ *		 hardware state. This function is only called once per
+ *		 PWM device when the PWM chip is registered.
  * @dbg_show: optional routine to show contents in debugfs
  * @owner: helps prevent removal of modules exporting active PWMs
  */
@@ -194,6 +197,7 @@ struct pwm_ops {
 			    enum pwm_polarity polarity);
 	int (*enable)(struct pwm_chip *chip, struct pwm_device *pwm);
 	void (*disable)(struct pwm_chip *chip, struct pwm_device *pwm);
+	void (*reset_state)(struct pwm_chip *chip, struct pwm_device *pwm);
 #ifdef CONFIG_DEBUG_FS
 	void (*dbg_show)(struct pwm_chip *chip, struct seq_file *s);
 #endif
-- 
2.1.4

