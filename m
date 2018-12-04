Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E35C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:26:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2EEF020878
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:26:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="jAQyYAVO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EEF020878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbeLDJ0s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 04:26:48 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:4057 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbeLDJ0s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 04:26:48 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0648580000>; Tue, 04 Dec 2018 01:26:48 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 01:26:46 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Dec 2018 01:26:46 -0800
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 09:26:46 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Dec 2018 09:26:46 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c0648540003>; Tue, 04 Dec 2018 01:26:45 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 05/19] clk: tegra: dfll: registration for multiple SoCs
Date:   Tue, 4 Dec 2018 17:25:34 +0800
Message-ID: <20181204092548.3038-6-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204092548.3038-1-josephl@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543915608; bh=3+hDQSHosfLUjNyQx+ccH8i9y/yEj2CwPulL2jsrTsA=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=jAQyYAVOFItt/U2XSPwrT1k4qQtLBDKwk3jKeXxIuLvBazFDtbh87b/fz+PA6MdDp
         mw/oydZdch0VaZFHdpKSz24oUOslDKvtfLv2vcAmHwJSunTWBKT5NDlgsjZCDKecLY
         CFJdS78tOrCBEu6iJUqrgrge7Ttv9naRzGjbWAciQ/onQIWQBVn9fUctmZRPvhKjrn
         /WT9yHm3PRwJIdXGupXTNJAYaFieuWC3qgRRfTjlMM2mkAm+WuJ8bH4v1kmeNylDuv
         YT5yKhAG7m1EQq8/nW+l6TcCuE4UMuJRh3ss3k8prcHboh+YcQpmV2eFW5AJy2z7Nk
         Y/SZ+3JYxedpw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peter De Schrijver <pdeschrijver@nvidia.com>

In a future patch, support for the DFLL in Tegra210 will be introduced.
This requires support for more than 1 set of CVB and CPU max frequency
tables.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 45 ++++++++++++++++------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra=
/clk-tegra124-dfll-fcpu.c
index 269d3595758b..1a2cc113e5c8 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -1,7 +1,7 @@
 /*
  * Tegra124 DFLL FCPU clock source driver
  *
- * Copyright (C) 2012-2014 NVIDIA Corporation.  All rights reserved.
+ * Copyright (C) 2012-2018 NVIDIA Corporation.  All rights reserved.
  *
  * Aleksandr Frid <afrid@nvidia.com>
  * Paul Walmsley <pwalmsley@nvidia.com>
@@ -21,6 +21,7 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <soc/tegra/fuse.h>
=20
@@ -28,8 +29,15 @@
 #include "clk-dfll.h"
 #include "cvb.h"
=20
+struct dfll_fcpu_data {
+	const unsigned long *cpu_max_freq_table;
+	unsigned int cpu_max_freq_table_size;
+	const struct cvb_table *cpu_cvb_tables;
+	unsigned int cpu_cvb_tables_size;
+};
+
 /* Maximum CPU frequency, indexed by CPU speedo id */
-static const unsigned long cpu_max_freq_table[] =3D {
+static const unsigned long tegra124_cpu_max_freq_table[] =3D {
 	[0] =3D 2014500000UL,
 	[1] =3D 2320500000UL,
 	[2] =3D 2116500000UL,
@@ -82,16 +90,36 @@ static const struct cvb_table tegra124_cpu_cvb_tables[]=
 =3D {
 	},
 };
=20
+static const struct dfll_fcpu_data tegra124_dfll_fcpu_data =3D {
+	.cpu_max_freq_table =3D tegra124_cpu_max_freq_table,
+	.cpu_max_freq_table_size =3D ARRAY_SIZE(tegra124_cpu_max_freq_table),
+	.cpu_cvb_tables =3D tegra124_cpu_cvb_tables,
+	.cpu_cvb_tables_size =3D ARRAY_SIZE(tegra124_cpu_cvb_tables)
+};
+
+static const struct of_device_id tegra124_dfll_fcpu_of_match[] =3D {
+	{
+		.compatible =3D "nvidia,tegra124-dfll",
+		.data =3D &tegra124_dfll_fcpu_data,
+	},
+	{ },
+};
+
 static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
 {
 	int process_id, speedo_id, speedo_value, err;
 	struct tegra_dfll_soc_data *soc;
+	const struct dfll_fcpu_data *fcpu_data;
+
+	fcpu_data =3D of_device_get_match_data(&pdev->dev);
+	if (!fcpu_data)
+		return -ENODEV;
=20
 	process_id =3D tegra_sku_info.cpu_process_id;
 	speedo_id =3D tegra_sku_info.cpu_speedo_id;
 	speedo_value =3D tegra_sku_info.cpu_speedo_value;
=20
-	if (speedo_id >=3D ARRAY_SIZE(cpu_max_freq_table)) {
+	if (speedo_id >=3D fcpu_data->cpu_max_freq_table_size) {
 		dev_err(&pdev->dev, "unknown max CPU freq for speedo_id=3D%d\n",
 			speedo_id);
 		return -ENODEV;
@@ -107,10 +135,10 @@ static int tegra124_dfll_fcpu_probe(struct platform_d=
evice *pdev)
 		return -ENODEV;
 	}
=20
-	soc->max_freq =3D cpu_max_freq_table[speedo_id];
+	soc->max_freq =3D fcpu_data->cpu_max_freq_table[speedo_id];
=20
-	soc->cvb =3D tegra_cvb_add_opp_table(soc->dev, tegra124_cpu_cvb_tables,
-					   ARRAY_SIZE(tegra124_cpu_cvb_tables),
+	soc->cvb =3D tegra_cvb_add_opp_table(soc->dev, fcpu_data->cpu_cvb_tables,
+					   fcpu_data->cpu_cvb_tables_size,
 					   process_id, speedo_id, speedo_value,
 					   soc->max_freq);
 	if (IS_ERR(soc->cvb)) {
@@ -142,11 +170,6 @@ static int tegra124_dfll_fcpu_remove(struct platform_d=
evice *pdev)
 	return 0;
 }
=20
-static const struct of_device_id tegra124_dfll_fcpu_of_match[] =3D {
-	{ .compatible =3D "nvidia,tegra124-dfll", },
-	{ },
-};
-
 static const struct dev_pm_ops tegra124_dfll_pm_ops =3D {
 	SET_RUNTIME_PM_OPS(tegra_dfll_runtime_suspend,
 			   tegra_dfll_runtime_resume, NULL)
--=20
2.19.2

