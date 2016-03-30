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
Subject: [PATCH v5 32/46] pwm: deprecate pwm_config(), pwm_enable() and pwm_disable()
Date: Wed, 30 Mar 2016 22:03:55 +0200
Message-Id: <1459368249-13241-33-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Prefix those function as deprecated to encourage all existing users to
switch to pwm_apply_state().

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 include/linux/pwm.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 4aad4eb..9bac10f 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -225,8 +225,8 @@ int pwm_apply_state(struct pwm_device *pwm, struct pwm_state *state);
  *
  * Returns: 0 on success or a negative error code on failure.
  */
-static inline int pwm_config(struct pwm_device *pwm, int duty_ns,
-			     int period_ns)
+static inline int __deprecated pwm_config(struct pwm_device *pwm, int duty_ns,
+					  int period_ns)
 {
 	struct pwm_state pstate;
 
@@ -252,8 +252,8 @@ static inline int pwm_config(struct pwm_device *pwm, int duty_ns,
  *
  * Returns: 0 on success or a negative error code on failure.
  */
-static inline int pwm_set_polarity(struct pwm_device *pwm,
-				   enum pwm_polarity polarity)
+static inline int __deprecated pwm_set_polarity(struct pwm_device *pwm,
+						enum pwm_polarity polarity)
 {
 	struct pwm_state pstate;
 
@@ -284,7 +284,7 @@ static inline int pwm_set_polarity(struct pwm_device *pwm,
  *
  * Returns: 0 on success or a negative error code on failure.
  */
-static inline int pwm_enable(struct pwm_device *pwm)
+static inline int __deprecated pwm_enable(struct pwm_device *pwm)
 {
 	struct pwm_state pstate;
 
@@ -303,7 +303,7 @@ static inline int pwm_enable(struct pwm_device *pwm)
  * pwm_disable() - stop a PWM output toggling
  * @pwm: PWM device
  */
-static inline void pwm_disable(struct pwm_device *pwm)
+static inline void __deprecated pwm_disable(struct pwm_device *pwm)
 {
 	struct pwm_state pstate;
 
@@ -360,24 +360,24 @@ static inline int pwm_apply_state(struct pwm_device *pwm,
 	return -ENOTSUPP;
 }
 
-static inline int pwm_config(struct pwm_device *pwm, int duty_ns,
-			     int period_ns)
+static inline int __deprecated pwm_config(struct pwm_device *pwm, int duty_ns,
+					  int period_ns)
 {
 	return -EINVAL;
 }
 
-static inline int pwm_set_polarity(struct pwm_device *pwm,
-				   enum pwm_polarity polarity)
+static inline int __deprecated pwm_set_polarity(struct pwm_device *pwm,
+						enum pwm_polarity polarity)
 {
 	return -ENOTSUPP;
 }
 
-static inline int pwm_enable(struct pwm_device *pwm)
+static inline int __deprecated pwm_enable(struct pwm_device *pwm)
 {
 	return -EINVAL;
 }
 
-static inline void pwm_disable(struct pwm_device *pwm)
+static inline void __deprecated pwm_disable(struct pwm_device *pwm)
 {
 }
 
-- 
2.5.0
