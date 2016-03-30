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
Subject: [PATCH v5 20/46] pwm: add information about polarity, duty cycle and period to debugfs
Date: Wed, 30 Mar 2016 22:03:43 +0200
Message-Id: <1459368249-13241-21-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

From: Heiko Stübner <heiko@sntech.de>

The pwm-states make it possible to also output the polarity, duty cycle
and period information in the debugfs pwm summary-outout.
This makes it easier to gather overview information about pwms without
needing to walk through the sysfs attributes of every pwm.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/pwm/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index c2b1569..9a83840 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -894,6 +894,11 @@ static void pwm_dbg_show(struct pwm_chip *chip, struct seq_file *s)
 		if (pstate.enabled)
 			seq_puts(s, " enabled");
 
+		seq_printf(s, " period:%uns", pstate.period);
+		seq_printf(s, " duty:%uns", pstate.duty_cycle);
+		seq_printf(s, " polarity:%s",
+			   pstate.polarity ? "inverse" : "normal");
+
 		seq_puts(s, "\n");
 	}
 }
-- 
2.5.0
