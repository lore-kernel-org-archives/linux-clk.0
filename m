Return-Path: <robdclark@gmail.com>
Return-Path: <robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Archit Taneja <architt@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	viresh.kumar@linaro.org,
	Rob Clark <robdclark@gmail.com>
Subject: [RFC 3/3] drm/bridge: adv7511: deal with bootloader lighting up display
Date: Tue, 11 Jul 2017 14:20:08 -0400
Message-Id: <20170711182008.28298-4-robdclark@gmail.com>
In-Reply-To: <20170711182008.28298-1-robdclark@gmail.com>
References: <20170711182008.28298-1-robdclark@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

We need to do some things a bit differently if the bridge chip is
already powered up when the driver loads (ie. bootloader has already
enabled display).  In particular we don't want to do anything that
would kill the display.
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 57 +++++++++++++++++++---------
 drivers/gpu/drm/bridge/adv7511/adv7533.c     |  3 ++
 2 files changed, 42 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index f75ab6278113..15e725fa8616 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -107,6 +107,7 @@ static bool adv7511_register_volatile(struct device *dev, unsigned int reg)
 	case ADV7511_REG_BSTATUS(1):
 	case ADV7511_REG_CHIP_ID_HIGH:
 	case ADV7511_REG_CHIP_ID_LOW:
+	case ADV7511_REG_POWER:
 		return true;
 	}
 
@@ -584,6 +585,8 @@ static int adv7511_get_modes(struct adv7511 *adv7511,
 			     edid_i2c_addr);
 	}
 
+	adv7511->current_edid_segment = -1;
+
 	edid = drm_do_get_edid(connector, adv7511_get_edid_block, adv7511);
 
 	if (!adv7511->powered)
@@ -627,7 +630,8 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
 	 * has to be reinitialized. */
 	if (status == connector_status_connected && hpd && adv7511->powered) {
 		regcache_mark_dirty(adv7511->regmap);
-		adv7511_power_on(adv7511);
+		if (!adv7511->powered)
+			adv7511_power_on(adv7511);
 		adv7511_get_modes(adv7511, connector);
 		if (adv7511->status == connector_status_connected)
 			status = connector_status_disconnected;
@@ -1044,33 +1048,47 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 		return ret;
 	}
 
+	adv7511->regmap = devm_regmap_init_i2c(i2c, &adv7511_regmap_config);
+	if (IS_ERR(adv7511->regmap)) {
+		ret = PTR_ERR(adv7511->regmap);
+		goto uninit_regulators;
+	}
+
+	ret = regmap_read(adv7511->regmap, ADV7511_REG_CHIP_REVISION, &val);
+	if (ret)
+		goto uninit_regulators;
+	dev_dbg(dev, "Rev. %d\n", val);
+
+	ret = regmap_read(adv7511->regmap, ADV7511_REG_POWER, &val);
+	if (ret)
+		goto uninit_regulators;
+	dev_dbg(dev, "Power: %x\n", val);
+
+	if ((val & ADV7511_POWER_POWER_DOWN) == 0) {
+		dev_dbg(dev, "powered on at probe!\n");
+		regcache_sync(adv7511->regmap);
+		adv7511->powered = true;
+	}
+
 	/*
 	 * The power down GPIO is optional. If present, toggle it from active to
 	 * inactive to wake up the encoder.
 	 */
-	adv7511->gpio_pd = devm_gpiod_get_optional(dev, "pd", GPIOD_OUT_HIGH);
+	adv7511->gpio_pd = devm_gpiod_get_optional(dev, "pd",
+			adv7511->powered ? GPIOD_ASIS : GPIOD_OUT_HIGH);
 	if (IS_ERR(adv7511->gpio_pd)) {
 		ret = PTR_ERR(adv7511->gpio_pd);
 		goto uninit_regulators;
 	}
 
-	if (adv7511->gpio_pd) {
+	if (adv7511->gpio_pd && !adv7511->powered) {
 		mdelay(5);
 		gpiod_set_value_cansleep(adv7511->gpio_pd, 0);
 	}
 
-	adv7511->regmap = devm_regmap_init_i2c(i2c, &adv7511_regmap_config);
-	if (IS_ERR(adv7511->regmap)) {
-		ret = PTR_ERR(adv7511->regmap);
-		goto uninit_regulators;
-	}
-
-	ret = regmap_read(adv7511->regmap, ADV7511_REG_CHIP_REVISION, &val);
-	if (ret)
-		goto uninit_regulators;
-	dev_dbg(dev, "Rev. %d\n", val);
-
-	if (adv7511->type == ADV7511)
+	if (adv7511->powered)
+		adv7511_hpd(adv7511);  /* clear pending irq's */
+	else if (adv7511->type == ADV7511)
 		ret = regmap_register_patch(adv7511->regmap,
 					    adv7511_fixed_registers,
 					    ARRAY_SIZE(adv7511_fixed_registers));
@@ -1085,7 +1103,8 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	regmap_write(adv7511->regmap, ADV7511_REG_CEC_I2C_ADDR,
 		     main_i2c_addr - 2);
 
-	adv7511_packet_disable(adv7511, 0xffff);
+	if (!adv7511->powered)
+		adv7511_packet_disable(adv7511, 0xffff);
 
 	adv7511->i2c_edid = i2c_new_dummy(i2c->adapter, edid_i2c_addr >> 1);
 	if (!adv7511->i2c_edid) {
@@ -1116,7 +1135,8 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL,
 		     ADV7511_CEC_CTRL_POWER_DOWN);
 
-	adv7511_power_off(adv7511);
+	if (!adv7511->powered)
+		adv7511_power_off(adv7511);
 
 	i2c_set_clientdata(i2c, adv7511);
 
@@ -1132,7 +1152,8 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 		goto err_unregister_cec;
 	}
 
-	adv7511_audio_init(dev, adv7511);
+	if (!adv7511->powered)
+		adv7511_audio_init(dev, adv7511);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index ac804f81e2f6..43dc53821acb 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -166,6 +166,9 @@ int adv7533_init_cec(struct adv7511 *adv)
 		goto err;
 	}
 
+	if (adv->powered)
+		return 0;
+
 	ret = regmap_register_patch(adv->regmap_cec,
 				    adv7533_cec_fixed_registers,
 				    ARRAY_SIZE(adv7533_cec_fixed_registers));
-- 
2.13.0
