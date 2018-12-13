Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_MIXED_ES,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4CFC65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:35:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07C572080F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:35:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="oU5nJnbE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07C572080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727743AbeLMJfF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 04:35:05 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:1334 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbeLMJfF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 04:35:05 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c1227c40000>; Thu, 13 Dec 2018 01:35:00 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 13 Dec 2018 01:35:03 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 13 Dec 2018 01:35:03 -0800
Received: from HQMAIL103.nvidia.com (172.20.187.11) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 13 Dec
 2018 09:35:03 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Dec 2018 09:35:03 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c1227c60007>; Thu, 13 Dec 2018 01:35:03 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V2 06/21] clk: tegra: dfll: CVB calculation alignment with the regulator
Date:   Thu, 13 Dec 2018 17:34:23 +0800
Message-ID: <20181213093438.29621-7-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181213093438.29621-1-josephl@nvidia.com>
References: <20181213093438.29621-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544693700; bh=A7eZHpzbkdeFQzHc8m1XfMC/HkcgQPOQGIwmQXlPx/k=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=oU5nJnbErz2mvWiYTZQJOOIoTuqwvGhQ4uYr/qpT37M8zjBgZHpGW0OaTiiNJIwbM
         iZas4Y+N8KsCohiChggRc8/YGtcA6muPoZjHdrlKDIIOX4ySYQ9kwJ/25De7ZzKE0j
         QKK1aPlYmQhyxw4a0laskClJrWrzTVlDJmQEnID+WIIYwdMvFDk4BNQdVq2EJgCFf5
         sBsLRTVKPY2bqbAfGVly6LHWoqGI7xL8FpuFchJMf97eEpJqhB5tAm7eOeOOxgxcsu
         ZN5gqTOZbdjQdY9T7Jy5zsprvOHXPQlJXALwwqWkNNPTvmJT0ELjy54qI8xZtEWkNs
         xOmc2i5yMSQCw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The CVB table contains calibration data for the CPU DFLL based on
process characterization. The regulator step and offset parameters depend
on the regulator supplying vdd-cpu, not on the specific Tegra SKU.

When using a PWM controlled regulator, the voltage step and offset are
determined by the regulator type in use. This is specified in DT. When
using an I2C controlled regulator, we can retrieve them from CPU regulator
Then pass this information to the CVB table calculation function.

Based on the work done of "Peter De Schrijver <pdeschrijver@nvidia.com>"
and "Alex Frid <afrid@nvidia.com>".

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
*V2:
 - use the updated DT binding string for parsing
 - update the mechanism for geting regulator data from DT (PWM mode) or
 regulator (I2C mode)
---
 drivers/clk/tegra/clk-dfll.h               |  6 ++-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 57 ++++++++++++++++++++--
 drivers/clk/tegra/cvb.c                    | 12 +++--
 drivers/clk/tegra/cvb.h                    |  6 +--
 4 files changed, 67 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.h b/drivers/clk/tegra/clk-dfll.h
index 83352c8078f2..ecc43cb9b6f1 100644
--- a/drivers/clk/tegra/clk-dfll.h
+++ b/drivers/clk/tegra/clk-dfll.h
@@ -1,6 +1,6 @@
 /*
  * clk-dfll.h - prototypes and macros for the Tegra DFLL clocksource drive=
r
- * Copyright (C) 2013 NVIDIA Corporation.  All rights reserved.
+ * Copyright (C) 2013-2018 NVIDIA Corporation.  All rights reserved.
  *
  * Aleksandr Frid <afrid@nvidia.com>
  * Paul Walmsley <pwalmsley@nvidia.com>
@@ -22,11 +22,14 @@
 #include <linux/reset.h>
 #include <linux/types.h>
=20
+#include "cvb.h"
+
 /**
  * struct tegra_dfll_soc_data - SoC-specific hooks/integration for the DFL=
L driver
  * @dev: struct device * that holds the OPP table for the DFLL
  * @max_freq: maximum frequency supported on this SoC
  * @cvb: CPU frequency table for this SoC
+ * @alignment: parameters of the regulator step and offset
  * @init_clock_trimmers: callback to initialize clock trimmers
  * @set_clock_trimmers_high: callback to tune clock trimmers for high volt=
age
  * @set_clock_trimmers_low: callback to tune clock trimmers for low voltag=
e
@@ -35,6 +38,7 @@ struct tegra_dfll_soc_data {
 	struct device *dev;
 	unsigned long max_freq;
 	const struct cvb_table *cvb;
+	struct rail_alignment alignment;
=20
 	void (*init_clock_trimmers)(void);
 	void (*set_clock_trimmers_high)(void);
diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra=
/clk-tegra124-dfll-fcpu.c
index 1a2cc113e5c8..189b5e20ee4e 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -23,6 +23,7 @@
 #include <linux/init.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <soc/tegra/fuse.h>
=20
 #include "clk.h"
@@ -50,9 +51,6 @@ static const struct cvb_table tegra124_cpu_cvb_tables[] =
=3D {
 		.process_id =3D -1,
 		.min_millivolts =3D 900,
 		.max_millivolts =3D 1260,
-		.alignment =3D {
-			.step_uv =3D 10000, /* 10mV */
-		},
 		.speedo_scale =3D 100,
 		.voltage_scale =3D 1000,
 		.entries =3D {
@@ -105,11 +103,45 @@ static const struct of_device_id tegra124_dfll_fcpu_o=
f_match[] =3D {
 	{ },
 };
=20
+static void get_alignment_from_dt(struct device *dev,
+				  struct rail_alignment *align)
+{
+	align->step_uv =3D 0;
+	align->offset_uv =3D 0;
+
+	if (of_property_read_u32(dev->of_node,
+				 "nvidia,pwm-voltage-step-microvolts",
+				 &align->step_uv))
+		align->step_uv =3D 0;
+
+	if (of_property_read_u32(dev->of_node,
+				 "nvidia,pwm-min-microvolts",
+				 &align->offset_uv))
+		align->offset_uv =3D 0;
+}
+
+static int get_alignment_from_regulator(struct device *dev,
+					 struct rail_alignment *align)
+{
+	struct regulator *reg =3D devm_regulator_get(dev, "vdd-cpu");
+
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	align->offset_uv =3D regulator_list_voltage(reg, 0);
+	align->step_uv =3D regulator_get_linear_step(reg);
+
+	devm_regulator_put(reg);
+
+	return 0;
+}
+
 static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
 {
 	int process_id, speedo_id, speedo_value, err;
 	struct tegra_dfll_soc_data *soc;
 	const struct dfll_fcpu_data *fcpu_data;
+	struct rail_alignment align;
=20
 	fcpu_data =3D of_device_get_match_data(&pdev->dev);
 	if (!fcpu_data)
@@ -135,12 +167,27 @@ static int tegra124_dfll_fcpu_probe(struct platform_d=
evice *pdev)
 		return -ENODEV;
 	}
=20
+	if (of_property_read_bool(pdev->dev.of_node, "nvidia,pwm-to-pmic")) {
+		get_alignment_from_dt(&pdev->dev, &align);
+	} else {
+		err =3D get_alignment_from_regulator(&pdev->dev, &align);
+		if (err =3D=3D -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+	}
+
+	if (!align.step_uv) {
+		dev_err(&pdev->dev, "missing step uv\n");
+		return -EINVAL;
+	}
+
 	soc->max_freq =3D fcpu_data->cpu_max_freq_table[speedo_id];
=20
 	soc->cvb =3D tegra_cvb_add_opp_table(soc->dev, fcpu_data->cpu_cvb_tables,
 					   fcpu_data->cpu_cvb_tables_size,
-					   process_id, speedo_id, speedo_value,
-					   soc->max_freq);
+					   &align, process_id, speedo_id,
+					   speedo_value, soc->max_freq);
+	soc->alignment =3D align;
+
 	if (IS_ERR(soc->cvb)) {
 		dev_err(&pdev->dev, "couldn't add OPP table: %ld\n",
 			PTR_ERR(soc->cvb));
diff --git a/drivers/clk/tegra/cvb.c b/drivers/clk/tegra/cvb.c
index da9e8e7b5ce5..81dcb97a9e0a 100644
--- a/drivers/clk/tegra/cvb.c
+++ b/drivers/clk/tegra/cvb.c
@@ -1,7 +1,7 @@
 /*
  * Utility functions for parsing Tegra CVB voltage tables
  *
- * Copyright (C) 2012-2014 NVIDIA Corporation.  All rights reserved.
+ * Copyright (C) 2012-2018 NVIDIA Corporation.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -62,9 +62,9 @@ static int round_voltage(int mv, const struct rail_alignm=
ent *align, int up)
 }
=20
 static int build_opp_table(struct device *dev, const struct cvb_table *tab=
le,
+			   struct rail_alignment *align,
 			   int speedo_value, unsigned long max_freq)
 {
-	const struct rail_alignment *align =3D &table->alignment;
 	int i, ret, dfll_mv, min_mv, max_mv;
=20
 	min_mv =3D round_voltage(table->min_millivolts, align, UP);
@@ -109,8 +109,9 @@ static int build_opp_table(struct device *dev, const st=
ruct cvb_table *table,
  */
 const struct cvb_table *
 tegra_cvb_add_opp_table(struct device *dev, const struct cvb_table *tables=
,
-			size_t count, int process_id, int speedo_id,
-			int speedo_value, unsigned long max_freq)
+			size_t count, struct rail_alignment *align,
+			int process_id, int speedo_id, int speedo_value,
+			unsigned long max_freq)
 {
 	size_t i;
 	int ret;
@@ -124,7 +125,8 @@ tegra_cvb_add_opp_table(struct device *dev, const struc=
t cvb_table *tables,
 		if (table->process_id !=3D -1 && table->process_id !=3D process_id)
 			continue;
=20
-		ret =3D build_opp_table(dev, table, speedo_value, max_freq);
+		ret =3D build_opp_table(dev, table, align, speedo_value,
+				      max_freq);
 		return ret ? ERR_PTR(ret) : table;
 	}
=20
diff --git a/drivers/clk/tegra/cvb.h b/drivers/clk/tegra/cvb.h
index c1f077993b2a..bcf15a089b93 100644
--- a/drivers/clk/tegra/cvb.h
+++ b/drivers/clk/tegra/cvb.h
@@ -49,7 +49,6 @@ struct cvb_table {
=20
 	int min_millivolts;
 	int max_millivolts;
-	struct rail_alignment alignment;
=20
 	int speedo_scale;
 	int voltage_scale;
@@ -59,8 +58,9 @@ struct cvb_table {
=20
 const struct cvb_table *
 tegra_cvb_add_opp_table(struct device *dev, const struct cvb_table *cvb_ta=
bles,
-			size_t count, int process_id, int speedo_id,
-			int speedo_value, unsigned long max_freq);
+			size_t count, struct rail_alignment *align,
+			int process_id, int speedo_id, int speedo_value,
+			unsigned long max_freq);
 void tegra_cvb_remove_opp_table(struct device *dev,
 				const struct cvb_table *table,
 				unsigned long max_freq);
--=20
2.19.2

