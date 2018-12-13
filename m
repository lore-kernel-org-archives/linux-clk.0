Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_MIXED_ES,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F66C67839
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:35:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C077D2080F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:35:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="hLNiZmPQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C077D2080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbeLMJfI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 04:35:08 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:1340 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbeLMJfI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 04:35:08 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c1227c60002>; Thu, 13 Dec 2018 01:35:02 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Dec 2018 01:35:06 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Dec 2018 01:35:06 -0800
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 13 Dec
 2018 09:35:05 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Dec 2018 09:35:05 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c1227c80004>; Thu, 13 Dec 2018 01:35:05 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V2 07/21] clk: tegra: dfll: support PWM regulator control
Date:   Thu, 13 Dec 2018 17:34:24 +0800
Message-ID: <20181213093438.29621-8-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181213093438.29621-1-josephl@nvidia.com>
References: <20181213093438.29621-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544693702; bh=QT9pQ4EeT3w9jn0iqrTBmKM6FlJdw48YpwekoqYBHAU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=hLNiZmPQr6yooiNKxGal6iIyzwqGxbdOUTkZHRaLsFOXt/B5TEV38On1Dd6xG0Xv7
         xs1hStEqwTCUbVILCi3eY5hWHIrt8+zNc/zagiEyBfev/aKPOA1XGZ+RnFmrz69tNe
         JRIwkWy97GF1so1VI5oZyNCgEX4Cx6SA+I90ZH667EA5LzNVrXdOMmmTL0n8CUUPpa
         O8uGYW9iL+6bhwdwkE9yeVy7XdI7b2tYspKadbaTlDFgl5gvyDxTwx9k9UzEi8hFgV
         D/6YHat2xLjOq5uCaEgIBU0G2W3ZEYOthXddHc+3ikgbA1h4DuTeDhi43OwjpfoPPt
         X6eRbeou/R14w==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The DFLL hardware supports two modes (I2C and PWM) for voltage control
when requesting a frequency. In this patch, we introduce PWM mode support.

To support that, we re-organize the LUT for unifying the table for both
cases of I2C and PWM mode. And generate that based on regulator info.
For the PWM-based regulator, we get this info from DT. And do the same as
the case of I2C LUT, which can help to map the PMIC voltage ID and voltages
that the regulator supported.

The other parts are the support code for initializing the DFLL hardware
to support PWM mode. Also, the register debugfs file is slightly
reworked to only show the i2c registers when I2C mode is in use.

Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
*V2:
 - move reg_init_uV to be with the PWM related variables
 - fix the variable type to 'unsigned long' if it needs to catch the
 return value from 'dev_pm_opp_get_voltage'
 - update to use lut_uv table for LUT look up. This makes the generic
 lut_uv table to work with both PWM and I2C mode.
---
 drivers/clk/tegra/clk-dfll.c | 435 +++++++++++++++++++++++++++++------
 1 file changed, 369 insertions(+), 66 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 609e363dabf8..72e02898006c 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1,7 +1,7 @@
 /*
  * clk-dfll.c - Tegra DFLL clock source common code
  *
- * Copyright (C) 2012-2014 NVIDIA Corporation. All rights reserved.
+ * Copyright (C) 2012-2018 NVIDIA Corporation. All rights reserved.
  *
  * Aleksandr Frid <afrid@nvidia.com>
  * Paul Walmsley <pwalmsley@nvidia.com>
@@ -47,6 +47,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -243,6 +244,12 @@ enum dfll_tune_range {
 	DFLL_TUNE_LOW =3D 1,
 };
=20
+
+enum tegra_dfll_pmu_if {
+	TEGRA_DFLL_PMU_I2C =3D 0,
+	TEGRA_DFLL_PMU_PWM =3D 1,
+};
+
 /**
  * struct dfll_rate_req - target DFLL rate request data
  * @rate: target frequency, after the postscaling
@@ -300,10 +307,19 @@ struct tegra_dfll {
 	u32				i2c_reg;
 	u32				i2c_slave_addr;
=20
-	/* i2c_lut array entries are regulator framework selectors */
-	unsigned			i2c_lut[MAX_DFLL_VOLTAGES];
-	int				i2c_lut_size;
-	u8				lut_min, lut_max, lut_safe;
+	/* lut array entries are regulator framework selectors or PWM values*/
+	unsigned			lut[MAX_DFLL_VOLTAGES];
+	unsigned long			lut_uv[MAX_DFLL_VOLTAGES];
+	int				lut_size;
+	u8				lut_bottom, lut_min, lut_max, lut_safe;
+
+	/* PWM interface */
+	enum tegra_dfll_pmu_if		pmu_if;
+	unsigned long			pwm_rate;
+	struct pinctrl			*pwm_pin;
+	struct pinctrl_state		*pwm_enable_state;
+	struct pinctrl_state		*pwm_disable_state;
+	u32				reg_init_uV;
 };
=20
 #define clk_hw_to_dfll(_hw) container_of(_hw, struct tegra_dfll, dfll_clk_=
hw)
@@ -489,6 +505,34 @@ static void dfll_set_mode(struct tegra_dfll *td,
 	dfll_wmb(td);
 }
=20
+/*
+ * DVCO rate control
+ */
+
+static unsigned long get_dvco_rate_below(struct tegra_dfll *td, u8 out_min=
)
+{
+	struct dev_pm_opp *opp;
+	unsigned long rate, prev_rate;
+	unsigned long uv, min_uv;
+
+	min_uv =3D td->lut_uv[out_min];
+	for (rate =3D 0, prev_rate =3D 0; ; rate++) {
+		opp =3D dev_pm_opp_find_freq_ceil(td->soc->dev, &rate);
+		if (IS_ERR(opp))
+			break;
+
+		uv =3D dev_pm_opp_get_voltage(opp);
+		dev_pm_opp_put(opp);
+
+		if (uv && uv > min_uv)
+			return prev_rate;
+
+		prev_rate =3D rate;
+	}
+
+	return prev_rate;
+}
+
 /*
  * DFLL-to-I2C controller interface
  */
@@ -518,6 +562,118 @@ static int dfll_i2c_set_output_enabled(struct tegra_d=
fll *td, bool enable)
 	return 0;
 }
=20
+
+/*
+ * DFLL-to-PWM controller interface
+ */
+
+/**
+ * dfll_pwm_set_output_enabled - enable/disable PWM voltage requests
+ * @td: DFLL instance
+ * @enable: whether to enable or disable the PWM voltage requests
+ *
+ * Set the master enable control for PWM control value updates. If disable=
d,
+ * then the PWM signal is not driven. Also configure the PWM output pad
+ * to the appropriate state.
+ */
+static int dfll_pwm_set_output_enabled(struct tegra_dfll *td, bool enable)
+{
+	int ret;
+	u32 val, div;
+
+	if (enable) {
+		ret =3D pinctrl_select_state(td->pwm_pin, td->pwm_enable_state);
+		if (ret < 0) {
+			dev_err(td->dev, "setting enable state failed\n");
+			return -EINVAL;
+		}
+		val =3D dfll_readl(td, DFLL_OUTPUT_CFG);
+		val &=3D ~DFLL_OUTPUT_CFG_PWM_DIV_MASK;
+		div =3D DIV_ROUND_UP(td->ref_rate, td->pwm_rate);
+		val |=3D (div << DFLL_OUTPUT_CFG_PWM_DIV_SHIFT)
+				& DFLL_OUTPUT_CFG_PWM_DIV_MASK;
+		dfll_writel(td, val, DFLL_OUTPUT_CFG);
+		dfll_wmb(td);
+
+		val |=3D DFLL_OUTPUT_CFG_PWM_ENABLE;
+		dfll_writel(td, val, DFLL_OUTPUT_CFG);
+		dfll_wmb(td);
+	} else {
+		ret =3D pinctrl_select_state(td->pwm_pin, td->pwm_disable_state);
+		if (ret < 0)
+			dev_warn(td->dev, "setting disable state failed\n");
+
+		val =3D dfll_readl(td, DFLL_OUTPUT_CFG);
+		val &=3D ~DFLL_OUTPUT_CFG_PWM_ENABLE;
+		dfll_writel(td, val, DFLL_OUTPUT_CFG);
+		dfll_wmb(td);
+	}
+
+	return 0;
+}
+
+/**
+ * dfll_set_force_output_value - set fixed value for force output
+ * @td: DFLL instance
+ * @out_val: value to force output
+ *
+ * Set the fixed value for force output, DFLL will output this value when
+ * force output is enabled.
+ */
+static u32 dfll_set_force_output_value(struct tegra_dfll *td, u8 out_val)
+{
+	u32 val =3D dfll_readl(td, DFLL_OUTPUT_FORCE);
+
+	val =3D (val & DFLL_OUTPUT_FORCE_ENABLE) | (out_val & OUT_MASK);
+	dfll_writel(td, val, DFLL_OUTPUT_FORCE);
+	dfll_wmb(td);
+
+	return dfll_readl(td, DFLL_OUTPUT_FORCE);
+}
+
+/**
+ * dfll_set_force_output_enabled - enable/disable force output
+ * @td: DFLL instance
+ * @enable: whether to enable or disable the force output
+ *
+ * Set the enable control for fouce output with fixed value.
+ */
+static void dfll_set_force_output_enabled(struct tegra_dfll *td, bool enab=
le)
+{
+	u32 val =3D dfll_readl(td, DFLL_OUTPUT_FORCE);
+
+	if (enable)
+		val |=3D DFLL_OUTPUT_FORCE_ENABLE;
+	else
+		val &=3D ~DFLL_OUTPUT_FORCE_ENABLE;
+
+	dfll_writel(td, val, DFLL_OUTPUT_FORCE);
+	dfll_wmb(td);
+}
+
+/**
+ * dfll_force_output - force output a fixed value
+ * @td: DFLL instance
+ * @out_sel: value to force output
+ *
+ * Set the fixed value for force output, DFLL will output this value.
+ */
+static int dfll_force_output(struct tegra_dfll *td, unsigned int out_sel)
+{
+	u32 val;
+
+	if (out_sel > OUT_MASK)
+		return -EINVAL;
+
+	val =3D dfll_set_force_output_value(td, out_sel);
+	if ((td->mode < DFLL_CLOSED_LOOP) &&
+	    !(val & DFLL_OUTPUT_FORCE_ENABLE)) {
+		dfll_set_force_output_enabled(td, true);
+	}
+
+	return 0;
+}
+
 /**
  * dfll_load_lut - load the voltage lookup table
  * @td: struct tegra_dfll *
@@ -539,7 +695,7 @@ static void dfll_load_i2c_lut(struct tegra_dfll *td)
 			lut_index =3D i;
=20
 		val =3D regulator_list_hardware_vsel(td->vdd_reg,
-						     td->i2c_lut[lut_index]);
+						     td->lut[lut_index]);
 		__raw_writel(val, td->lut_base + i * 4);
 	}
=20
@@ -594,24 +750,41 @@ static void dfll_init_out_if(struct tegra_dfll *td)
 {
 	u32 val;
=20
-	td->lut_min =3D 0;
-	td->lut_max =3D td->i2c_lut_size - 1;
-	td->lut_safe =3D td->lut_min + 1;
+	td->lut_min =3D td->lut_bottom;
+	td->lut_max =3D td->lut_size - 1;
+	td->lut_safe =3D td->lut_min + (td->lut_min < td->lut_max ? 1 : 0);
+
+	/* clear DFLL_OUTPUT_CFG before setting new value */
+	dfll_writel(td, 0, DFLL_OUTPUT_CFG);
+	dfll_wmb(td);
=20
-	dfll_i2c_writel(td, 0, DFLL_OUTPUT_CFG);
 	val =3D (td->lut_safe << DFLL_OUTPUT_CFG_SAFE_SHIFT) |
-		(td->lut_max << DFLL_OUTPUT_CFG_MAX_SHIFT) |
-		(td->lut_min << DFLL_OUTPUT_CFG_MIN_SHIFT);
-	dfll_i2c_writel(td, val, DFLL_OUTPUT_CFG);
-	dfll_i2c_wmb(td);
+	      (td->lut_max << DFLL_OUTPUT_CFG_MAX_SHIFT) |
+	      (td->lut_min << DFLL_OUTPUT_CFG_MIN_SHIFT);
+	dfll_writel(td, val, DFLL_OUTPUT_CFG);
+	dfll_wmb(td);
=20
 	dfll_writel(td, 0, DFLL_OUTPUT_FORCE);
 	dfll_i2c_writel(td, 0, DFLL_INTR_EN);
 	dfll_i2c_writel(td, DFLL_INTR_MAX_MASK | DFLL_INTR_MIN_MASK,
 			DFLL_INTR_STS);
=20
-	dfll_load_i2c_lut(td);
-	dfll_init_i2c_if(td);
+	if (td->pmu_if =3D=3D TEGRA_DFLL_PMU_PWM) {
+		int vinit =3D td->reg_init_uV;
+		int vstep =3D td->soc->alignment.step_uv;
+		int vmin =3D td->lut_uv[0];
+
+		/* set initial voltage */
+		if ((vinit >=3D vmin) && vstep) {
+			unsigned int vsel;
+
+			vsel =3D DIV_ROUND_UP((vinit - vmin), vstep);
+			dfll_force_output(td, vsel);
+		}
+	} else {
+		dfll_load_i2c_lut(td);
+		dfll_init_i2c_if(td);
+	}
 }
=20
 /*
@@ -640,8 +813,8 @@ static int find_lut_index_for_rate(struct tegra_dfll *t=
d, unsigned long rate)
 	uv =3D dev_pm_opp_get_voltage(opp);
 	dev_pm_opp_put(opp);
=20
-	for (i =3D 0; i < td->i2c_lut_size; i++) {
-		if (regulator_list_voltage(td->vdd_reg, td->i2c_lut[i]) =3D=3D uv)
+	for (i =3D td->lut_bottom; i < td->lut_size; i++) {
+		if (td->lut_uv[i] >=3D uv)
 			return i;
 	}
=20
@@ -863,9 +1036,14 @@ static int dfll_lock(struct tegra_dfll *td)
 			return -EINVAL;
 		}
=20
-		dfll_i2c_set_output_enabled(td, true);
+		if (td->pmu_if =3D=3D TEGRA_DFLL_PMU_PWM)
+			dfll_pwm_set_output_enabled(td, true);
+		else
+			dfll_i2c_set_output_enabled(td, true);
+
 		dfll_set_mode(td, DFLL_CLOSED_LOOP);
 		dfll_set_frequency_request(td, req);
+		dfll_set_force_output_enabled(td, false);
 		return 0;
=20
 	default:
@@ -889,7 +1067,10 @@ static int dfll_unlock(struct tegra_dfll *td)
 	case DFLL_CLOSED_LOOP:
 		dfll_set_open_loop_config(td);
 		dfll_set_mode(td, DFLL_OPEN_LOOP);
-		dfll_i2c_set_output_enabled(td, false);
+		if (td->pmu_if =3D=3D TEGRA_DFLL_PMU_PWM)
+			dfll_pwm_set_output_enabled(td, false);
+		else
+			dfll_i2c_set_output_enabled(td, false);
 		return 0;
=20
 	case DFLL_OPEN_LOOP:
@@ -1171,15 +1352,17 @@ static int attr_registers_show(struct seq_file *s, =
void *data)
 		seq_printf(s, "[0x%02x] =3D 0x%08x\n", offs,
 			   dfll_i2c_readl(td, offs));
=20
-	seq_puts(s, "\nINTEGRATED I2C CONTROLLER REGISTERS:\n");
-	offs =3D DFLL_I2C_CLK_DIVISOR;
-	seq_printf(s, "[0x%02x] =3D 0x%08x\n", offs,
-		   __raw_readl(td->i2c_controller_base + offs));
-
-	seq_puts(s, "\nLUT:\n");
-	for (offs =3D 0; offs <  4 * MAX_DFLL_VOLTAGES; offs +=3D 4)
+	if (td->pmu_if =3D=3D TEGRA_DFLL_PMU_I2C) {
+		seq_puts(s, "\nINTEGRATED I2C CONTROLLER REGISTERS:\n");
+		offs =3D DFLL_I2C_CLK_DIVISOR;
 		seq_printf(s, "[0x%02x] =3D 0x%08x\n", offs,
-			   __raw_readl(td->lut_base + offs));
+			   __raw_readl(td->i2c_controller_base + offs));
+
+		seq_puts(s, "\nLUT:\n");
+		for (offs =3D 0; offs <  4 * MAX_DFLL_VOLTAGES; offs +=3D 4)
+			seq_printf(s, "[0x%02x] =3D 0x%08x\n", offs,
+				   __raw_readl(td->lut_base + offs));
+	}
=20
 	return 0;
 }
@@ -1387,9 +1570,61 @@ static int find_vdd_map_entry_min(struct tegra_dfll =
*td, int uV)
 	return -EINVAL;
 }
=20
+/*
+ * dfll_build_pwm_lut - build the PWM regulator lookup table
+ * @td: DFLL instance
+ * @v_max: Vmax from OPP table
+ *
+ * Look-up table in h/w is ignored when PWM is used as DFLL interface to P=
MIC.
+ * In this case closed loop output is controlling duty cycle directly. The=
 s/w
+ * look-up that maps PWM duty cycle to voltage is still built by this func=
tion.
+ */
+static int dfll_build_pwm_lut(struct tegra_dfll *td, unsigned long v_max)
+{
+	int i;
+	unsigned long rate, reg_volt;
+	u8 lut_bottom =3D MAX_DFLL_VOLTAGES;
+	int v_min =3D td->soc->cvb->min_millivolts * 1000;
+
+	for (i =3D 0; i < MAX_DFLL_VOLTAGES; i++) {
+		reg_volt =3D td->lut_uv[i];
+
+		/* since opp voltage is exact mv */
+		reg_volt =3D (reg_volt / 1000) * 1000;
+		if (reg_volt > v_max)
+			break;
+
+		td->lut[i] =3D i;
+		if ((lut_bottom =3D=3D MAX_DFLL_VOLTAGES) && (reg_volt >=3D v_min))
+			lut_bottom =3D i;
+	}
+
+	/* determine voltage boundaries */
+	td->lut_size =3D i;
+	if ((lut_bottom =3D=3D MAX_DFLL_VOLTAGES) ||
+	    (lut_bottom + 1 >=3D td->lut_size)) {
+		dev_err(td->dev, "no voltage above DFLL minimum %d mV\n",
+			td->soc->cvb->min_millivolts);
+		return -EINVAL;
+	}
+	td->lut_bottom =3D lut_bottom;
+
+	/* determine rate boundaries */
+	rate =3D get_dvco_rate_below(td, td->lut_bottom);
+	if (!rate) {
+		dev_err(td->dev, "no opp below DFLL minimum voltage %d mV\n",
+			td->soc->cvb->min_millivolts);
+		return -EINVAL;
+	}
+	td->dvco_rate_min =3D rate;
+
+	return 0;
+}
+
 /**
  * dfll_build_i2c_lut - build the I2C voltage register lookup table
  * @td: DFLL instance
+ * @v_max: Vmax from OPP table
  *
  * The DFLL hardware has 33 bytes of look-up table RAM that must be filled=
 with
  * PMIC voltage register values that span the entire DFLL operating range.
@@ -1397,33 +1632,24 @@ static int find_vdd_map_entry_min(struct tegra_dfll=
 *td, int uV)
  * the soc-specific platform driver (td->soc->opp_dev) and the PMIC
  * register-to-voltage mapping queried from the regulator framework.
  *
- * On success, fills in td->i2c_lut and returns 0, or -err on failure.
+ * On success, fills in td->lut and returns 0, or -err on failure.
  */
-static int dfll_build_i2c_lut(struct tegra_dfll *td)
+static int dfll_build_i2c_lut(struct tegra_dfll *td, unsigned long v_max)
 {
+	unsigned long rate, v, v_opp;
 	int ret =3D -EINVAL;
-	int j, v, v_max, v_opp;
-	int selector;
-	unsigned long rate;
-	struct dev_pm_opp *opp;
-	int lut;
-
-	rate =3D ULONG_MAX;
-	opp =3D dev_pm_opp_find_freq_floor(td->soc->dev, &rate);
-	if (IS_ERR(opp)) {
-		dev_err(td->dev, "couldn't get vmax opp, empty opp table?\n");
-		goto out;
-	}
-	v_max =3D dev_pm_opp_get_voltage(opp);
-	dev_pm_opp_put(opp);
+	int j, selector, lut;
=20
 	v =3D td->soc->cvb->min_millivolts * 1000;
 	lut =3D find_vdd_map_entry_exact(td, v);
 	if (lut < 0)
 		goto out;
-	td->i2c_lut[0] =3D lut;
+	td->lut[0] =3D lut;
+	td->lut_bottom =3D 0;
=20
 	for (j =3D 1, rate =3D 0; ; rate++) {
+		struct dev_pm_opp *opp;
+
 		opp =3D dev_pm_opp_find_freq_ceil(td->soc->dev, &rate);
 		if (IS_ERR(opp))
 			break;
@@ -1435,39 +1661,64 @@ static int dfll_build_i2c_lut(struct tegra_dfll *td=
)
 		dev_pm_opp_put(opp);
=20
 		for (;;) {
-			v +=3D max(1, (v_max - v) / (MAX_DFLL_VOLTAGES - j));
+			v +=3D max(1UL, (v_max - v) / (MAX_DFLL_VOLTAGES - j));
 			if (v >=3D v_opp)
 				break;
=20
 			selector =3D find_vdd_map_entry_min(td, v);
 			if (selector < 0)
 				goto out;
-			if (selector !=3D td->i2c_lut[j - 1])
-				td->i2c_lut[j++] =3D selector;
+			if (selector !=3D td->lut[j - 1])
+				td->lut[j++] =3D selector;
 		}
=20
 		v =3D (j =3D=3D MAX_DFLL_VOLTAGES - 1) ? v_max : v_opp;
 		selector =3D find_vdd_map_entry_exact(td, v);
 		if (selector < 0)
 			goto out;
-		if (selector !=3D td->i2c_lut[j - 1])
-			td->i2c_lut[j++] =3D selector;
+		if (selector !=3D td->lut[j - 1])
+			td->lut[j++] =3D selector;
=20
 		if (v >=3D v_max)
 			break;
 	}
-	td->i2c_lut_size =3D j;
+	td->lut_size =3D j;
=20
 	if (!td->dvco_rate_min)
 		dev_err(td->dev, "no opp above DFLL minimum voltage %d mV\n",
 			td->soc->cvb->min_millivolts);
-	else
+	else {
 		ret =3D 0;
+		for (j =3D 0; j < td->lut_size; j++)
+			td->lut_uv[j] =3D
+				regulator_list_voltage(td->vdd_reg,
+						       td->lut[j]);
+	}
=20
 out:
 	return ret;
 }
=20
+static int dfll_build_lut(struct tegra_dfll *td)
+{
+	unsigned long rate, v_max;
+	struct dev_pm_opp *opp;
+
+	rate =3D ULONG_MAX;
+	opp =3D dev_pm_opp_find_freq_floor(td->soc->dev, &rate);
+	if (IS_ERR(opp)) {
+		dev_err(td->dev, "couldn't get vmax opp, empty opp table?\n");
+		return -EINVAL;
+	}
+	v_max =3D dev_pm_opp_get_voltage(opp);
+	dev_pm_opp_put(opp);
+
+	if (td->pmu_if =3D=3D TEGRA_DFLL_PMU_PWM)
+		return dfll_build_pwm_lut(td, v_max);
+	else
+		return dfll_build_i2c_lut(td, v_max);
+}
+
 /**
  * read_dt_param - helper function for reading required parameters from th=
e DT
  * @td: DFLL instance
@@ -1526,11 +1777,56 @@ static int dfll_fetch_i2c_params(struct tegra_dfll =
*td)
 	}
 	td->i2c_reg =3D vsel_reg;
=20
-	ret =3D dfll_build_i2c_lut(td);
-	if (ret) {
-		dev_err(td->dev, "couldn't build I2C LUT\n");
+	return 0;
+}
+
+static int dfll_fetch_pwm_params(struct tegra_dfll *td)
+{
+	int ret, i;
+	u32 pwm_period;
+
+	if (!td->soc->alignment.step_uv || !td->soc->alignment.offset_uv) {
+		dev_err(td->dev,
+			"Missing step or alignment info for PWM regulator");
+		return -EINVAL;
+	}
+	for (i =3D 0; i < MAX_DFLL_VOLTAGES; i++)
+		td->lut_uv[i] =3D td->soc->alignment.offset_uv +
+				i * td->soc->alignment.step_uv;
+
+	ret =3D read_dt_param(td, "nvidia,pwm-tristate-microvolts",
+			    &td->reg_init_uV);
+	if (!ret) {
+		dev_err(td->dev, "couldn't get initialized voltage\n");
+		return ret;
+	}
+
+	ret =3D read_dt_param(td, "nvidia,pwm-period", &pwm_period);
+	if (!ret) {
+		dev_err(td->dev, "couldn't get PWM period\n");
 		return ret;
 	}
+	td->pwm_rate =3D (NSEC_PER_SEC / pwm_period) * (MAX_DFLL_VOLTAGES - 1);
+
+	td->pwm_pin =3D devm_pinctrl_get(td->dev);
+	if (IS_ERR(td->pwm_pin)) {
+		dev_err(td->dev, "DT: missing pinctrl device\n");
+		return PTR_ERR(td->pwm_pin);
+	}
+
+	td->pwm_enable_state =3D pinctrl_lookup_state(td->pwm_pin,
+						    "dvfs_pwm_enable");
+	if (IS_ERR(td->pwm_enable_state)) {
+		dev_err(td->dev, "DT: missing pwm enabled state\n");
+		return PTR_ERR(td->pwm_enable_state);
+	}
+
+	td->pwm_disable_state =3D pinctrl_lookup_state(td->pwm_pin,
+						     "dvfs_pwm_disable");
+	if (IS_ERR(td->pwm_disable_state)) {
+		dev_err(td->dev, "DT: missing pwm disabled state\n");
+		return PTR_ERR(td->pwm_disable_state);
+	}
=20
 	return 0;
 }
@@ -1597,16 +1893,6 @@ int tegra_dfll_register(struct platform_device *pdev=
,
=20
 	td->soc =3D soc;
=20
-	td->vdd_reg =3D devm_regulator_get(td->dev, "vdd-cpu");
-	if (IS_ERR(td->vdd_reg)) {
-		ret =3D PTR_ERR(td->vdd_reg);
-		if (ret !=3D -EPROBE_DEFER)
-			dev_err(td->dev, "couldn't get vdd_cpu regulator: %d\n",
-				ret);
-
-		return ret;
-	}
-
 	td->dvco_rst =3D devm_reset_control_get(td->dev, "dvco");
 	if (IS_ERR(td->dvco_rst)) {
 		dev_err(td->dev, "couldn't get dvco reset\n");
@@ -1619,10 +1905,27 @@ int tegra_dfll_register(struct platform_device *pde=
v,
 		return ret;
 	}
=20
-	ret =3D dfll_fetch_i2c_params(td);
+	if (of_property_read_bool(td->dev->of_node, "nvidia,pwm-to-pmic")) {
+		td->pmu_if =3D TEGRA_DFLL_PMU_PWM;
+		ret =3D dfll_fetch_pwm_params(td);
+	} else  {
+		td->vdd_reg =3D devm_regulator_get(td->dev, "vdd-cpu");
+		if (IS_ERR(td->vdd_reg)) {
+			dev_err(td->dev, "couldn't get vdd_cpu regulator\n");
+			return PTR_ERR(td->vdd_reg);
+		}
+		td->pmu_if =3D TEGRA_DFLL_PMU_I2C;
+		ret =3D dfll_fetch_i2c_params(td);
+	}
 	if (ret)
 		return ret;
=20
+	ret =3D dfll_build_lut(td);
+	if (ret) {
+		dev_err(td->dev, "couldn't build LUT\n");
+		return ret;
+	}
+
 	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem) {
 		dev_err(td->dev, "no control register resource\n");
--=20
2.19.2

