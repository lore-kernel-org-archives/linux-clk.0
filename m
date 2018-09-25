Return-Path: <SRS0=aw6K=MH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A677C43382
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 17:00:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD649206B5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="X25DwGm9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD649206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbeIYXIW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Sep 2018 19:08:22 -0400
Received: from mail-eopbgr70075.outbound.protection.outlook.com ([40.107.7.75]:45688
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726322AbeIYXIW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Sep 2018 19:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLlgjzQjTeWyQfIyeDD6ETMaEjkBoNBbh7JiLt25ehc=;
 b=X25DwGm958EN4BS5kEHSvZKx0MS9hu9A6cW8D84JRnj9PTn/GNBH/vpH/sSxTiIIH5MgbMJxClVDP2+ZevRDrb/8hZb8NuRts4mOqK7gk7h19b5feySIVbGsXnO0d5/T6MRDwJMRqVArSnZBVOeZd8uwP9mMpcDC/mpFSqAwS+E=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 AM0PR04MB4211.eurprd04.prod.outlook.com (2603:10a6:208:66::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.22; Tue, 25 Sep 2018 16:59:31 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V2 09/11] clk: imx: add common imx_clk_hw_fixed functions
Date:   Wed, 26 Sep 2018 00:43:55 +0800
Message-Id: <1537893837-31172-10-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537893837-31172-1-git-send-email-aisheng.dong@nxp.com>
References: <1537893837-31172-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK0PR03CA0033.apcprd03.prod.outlook.com
 (2603:1096:203:2f::21) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f84abb6b-f603-4f4f-95a3-08d623084502
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4211;
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;3:ESlG9z4trS3t8vV0tC+tebiw983zXOdKX5gy60azZyPOJbefyTQOt4bLubJ22Asj37ht6FarApPNBEKTdzWB0dJ/Q5cHYUANs63jPiRImNmeZmH9HlwVlW5haoLFw8RDPy/QSZaPj2K7wxCk4piLicIXIAA1pnFy4imQnTtA583fXCBF4B0i10oNzYOtbSHKNc+QNDtyIrNPaklOzrpA8BU5Z4no1M7vUdcGdRFrwt0f9OpnpUHhQY2buqVAXnDM;25:ATt26k3ubQNyHz3JqqZJqIRRNkqv3s3SXMQKZBO2ZdfmEp7hX+O1sw9kyuVDcmP1jPhPMORWv6l9+UaZOP4QdqayvEgLQE22/KNTAoYj+PFThjbcAx75VWaGh16W7mcwe4ko5814wMRhNs7rURhs5hLyb3FWp3aORTXPixbLjH0KXQ6cwlySGgoHYXRELsV89tNsRKhkicZnirk4eXc4w0pYC+9AWacK3ybEAWJ/ybn+zzh1YJojvk6ne2VttWjRdDPRUTU3Any00uOBq2Ljel05UNcbpF+lzGFYmsGC5+6vG9tQs+nNIYvHpJB5xkfR4TvLd93PbaLmYdYxZyNDyA==;31:YYjT2RD4d0b7ye8jS8cJ6ged5RH92u8p/nd2/TLe424SIHZdk7ToD7aL2Nx8rG0i89oC+JVJUF9AkM9ldrsnwxG19+qpusQd6o9ckbSWtjwlJpaw/8d/gg90KyDzHfkMFApd8Lebc8qpuEpsHPIhTNEwB40auPIMbClra1DvG1C2mUM8l6+mss9SA3dSkkCYS2eGABl2XSkkaVD0eiadMEwJv6TCASe+FY0bTpkgGcQ=
X-MS-TrafficTypeDiagnostic: AM0PR04MB4211:
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;20:kjJompaWoGogQkBFXpKooQrB5q6VxB9xxFQi7TdHPiBOUkq7H+XgBPDavrC8grpDBShy8x/ZIQCeX3p3kSwbo1sx7Fs0MhnEOx4/l0p4EOenOnyS8znYcOb16ZP5TC5sPhEsDsBLcuKF9IjlMjA7o+u1q0YKoPTR82dqrhJQ7/ETJ/LYXj8dH2Ex9pt5mN69m1YtCgynufMxEt79zGGLTG51aTkEcGra7O/qwFax0dGNdjRt0sH3uAeB7I1eH9TYzxFXnl+Y9vgPdDwYkoh9pWrbU+gSMMkIC4Fnu/sDwfzW59mKAxWl4IO7wujPSX1FqizpJni+drLZmrE1ExZ3zGhS12IGcmPPX3pUr0bdzyNmDKA7otUxvzTRMoyzhsCvS5XJ1eJAYYbUyIn1rSq5GN73VLcX5jrfCY19If5/GHMp3nSssUG+7itPuTA8Mj9Fa91z1N1ZotUAex6xyxN1JHi5zA4KWSMA6912whFWtjeQA0jgG5DEbi0BtxSnR0pZ;4:wlAdup0o8eRWTOPTqspA86pBPZ2GXQjRvoUf6k7sFp33h3lU/gw3p8yqBq6JVrq5AxAU1xWc9aN9ifwEVulB3BjiVF4ZTc5NGTUQLkFATEQrq7uxGrS5n0WzlHmKGs9vI8dyO3igLF497cImhgOPeyMGgwM0aZ7UuyThAddpScnHT/pms07L+TzNp1bACzHGsUkoJdMLJOc22L4eiWgy9pwOW/Guz6C2xrYBF0ErpYQ8TS5TbgAKK77VCqnXFxMM8VnvNRBxh1bGvbQ5bm+MR31LbVR0igiWlC4TokZH0su3Jl+5BGUu9PagRS/5t3M9
X-Microsoft-Antispam-PRVS: <AM0PR04MB4211CA72038B1D0770A8C95580160@AM0PR04MB4211.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(149066)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051);SRVR:AM0PR04MB4211;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4211;
X-Forefront-PRVS: 08062C429B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(199004)(189003)(478600001)(6486002)(11346002)(446003)(53936002)(6512007)(68736007)(2906002)(48376002)(6116002)(316002)(3846002)(34290500001)(14444005)(106356001)(186003)(16526019)(2361001)(2351001)(26005)(305945005)(7736002)(486006)(36756003)(66066001)(4326008)(47776003)(25786009)(105586002)(6916009)(6666003)(50226002)(97736004)(81156014)(8676002)(16586007)(5660300001)(956004)(52116002)(386003)(86362001)(2616005)(476003)(76176011)(51416003)(6506007)(8936002)(50466002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4211;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM0PR04MB4211;23:3tjFIYlaYPNmOof1BlcoFEz48DWcW2BtQmsOPow1K?=
 =?us-ascii?Q?9PL23JGT8C4vpFQFC3Ik0YblfUKIkLlEenyaaiMd97mY/CDgCVhosJNpnbiw?=
 =?us-ascii?Q?WdKhDZzDi1CKJkokcIqBSsEW/3lVl6rf4PXF1tBEWDuZkdaWH20YwDc5B2TC?=
 =?us-ascii?Q?y5S54ONFYup0fFVXZvmaANeweAJ/P4c3oMyNdyc7S6lz2Ge5ZvA8zptFLnx0?=
 =?us-ascii?Q?YgzaP0SRlKp3u+KJFS5lysnWv3z/+aufnAkSYYw1rZT0TeAh3cV9YZyzNh97?=
 =?us-ascii?Q?izUw75mfGyCodh81GDZHIrR3FKPi+iVK7XMrshJvxYIhb4ewtjBhw3GvX0D0?=
 =?us-ascii?Q?tU5tzZMGqyTiS2Npnv1NVBDzzMClnzG0dtGGMp4lpIUbbhovMeTF+yKZ6QMW?=
 =?us-ascii?Q?p/554hQXE9GtfYn6WYWJbV0bAT4ngLquLcMQojfPVllm4AuXkfdXlPwddD3s?=
 =?us-ascii?Q?bd/tlDKa4CBL97vCRK7aDqDzCvyXVZZ+3Xb3/kaHVKWl5SVcd2klOMB45DDF?=
 =?us-ascii?Q?vawaHvsKJ6ytJAiyCewVuW7P5YbgKllDFuwM2Q6Y7qRILMBU+NIZN2rvAHxY?=
 =?us-ascii?Q?++Sc0MPSXWzCjAxzHs+VgEFeZhlrreIdXcTqnSGej76Xtdh3PpQfWJkEUMQ2?=
 =?us-ascii?Q?E4eayomj9j3D+OEUIl4iTs8k+gask0abl1E/B3LEKKZmlMeL1fvt7FxYGXez?=
 =?us-ascii?Q?5SOnyKmFBscPr66MZslWoxrByXfm5i5gkj3YVjfrQZn252BNFMMr0XdxJUKh?=
 =?us-ascii?Q?YHE/85gaC18uVubaXsM/lxH3y4QwqYrYt4cDYu3SBxbMfzuM8q/7D30WG2SF?=
 =?us-ascii?Q?Jlv+GaE0Gbz+cIPh3nrhw5R57zzLNqi6Xitd03TdgCMz+xUt2/BrWZv8ri19?=
 =?us-ascii?Q?iC0ME+u89NVkgooUNxYJ0A299WyJIMS9lYYqP5HEzKGL+S2+Fdk4nNrk5PXf?=
 =?us-ascii?Q?xj0XOEFuwhlpIOMJtjdagdhPA6I27hHIvef8IF4qHGvy88Sh/ESqDb0CVIdi?=
 =?us-ascii?Q?aeorgMZ1vtyZWaIeaWXwwdsfxOs8BIUsB4jbznxG73rLBlQ9evT+9VvoersS?=
 =?us-ascii?Q?3j1U4tM8yd4nu2fNRzkGxjunaqHnASXW0HCV4D+vT5ZPGSv0Au5xZ1FyU0M/?=
 =?us-ascii?Q?KGqgb9VyOn5ctI4c4j4l5LpndC+jCTFIlpUsMVOXK3/Zt4JW1+ks8KE0IUHc?=
 =?us-ascii?Q?bI16STKOVhHj7V1s4cQpjlrBkQZDgbkpjbllvyClCh11vxK6k6rk+jlKf3iV?=
 =?us-ascii?Q?OY9tFQI2GSemBmKlc0=3D?=
X-Microsoft-Antispam-Message-Info: 2wCi4RQzRLakzvXyOEmcWk46eM1MmAzry4PsTVoYGl0h6tDPkH4baFs7bKFHdnfdyQsUCLShByPOhcD/OcFyLLeWXvvJbWmx+rBGgp76ZoB9eyH8jOvPC/8qZLsQoQsrSOnhvSHwGOVm5TUEVGzac+FpxTbo3/lw87M0G+rihX04R9g0C8UIpxfVwdyGFa64iRZ+ZwBLbFG98F9Trc5u7es1U/lJCVNWxTmOVw8DT0qF1f7ouU3Qf9L/NrdqWDCoV6VkHXjZkvrIRP1b6zurngL9ZJ49nr+e8AhEW6iX5/eo2leCqwfrnf46ZABIMwT2YKMnrnGnTXesByRbGB/h1yn1/enesvU/0y644f+2R9o=
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;6:q27s2/J1w0auJjhJAA+Qn6Hz9dQJdkvCxDcYxPsiVuTPOtkIogKcFyNs+0UZqi56xTXyQ7b51uIaryksFFKS4OQ3ZJLJ96wMk507QEi54NWAW8RZ4NKSiKjDM6dM2He8r2Ykh20J/c2JYaZYSiM8UGGUvoVdHiRU6tz1IOausKZuZz7faVpaoAih6Lu6lKJN8RPKDnNvpLQbcOFz5SBfVuaQtOoQSXOGFh7f/yGbVLdDxLei+sDof7meG3OULjlKq5obVUAyzeUTLitdSPUEPusWs9lJiAdjE9PoVj55AD8yJ6lo6LL6jY9qpn1KrS1DKcqk3GykqqhHEnTWxEGhyY8kC7PWC8grm6aIOpQQTlpXF7QbLjBNQRbeG1/NGXavdWFuJ2nPQhtbspTEA7KUdXgzOwMX6Nvrr2tM7ii1XY9GCLD+7gI4B5QB3xMr6I4/OLfRGcvUvGrSTSfDLKeSTg==;5:9xkQQ4nu1lPKW9WaKYqcWHra///HGABXVGH8CmJF/vz1wtux/P63NhpuXEmraANurQN9edxWhLrtknVuA3/96brC2GprQ2lbySq66hVnsy8iUgPRS2dkRiMIc5sJUGbaLH/WjO46FkDcggDtdVm00ngXoWk4bgIm1xIZiYM6we4=;7:I6/C+qvWKVspDaRLBVbaSe8cVseWd4eJ2k4l5PWpjd8Hcdg1QLQyMKOegS6BIEI/IPidPuIDCFm/mgTOBSNIMPUNe5vbEcFrbX9t2M7A7LQ6DuWmMUni4Xnxx1a3WkoGGNS5gn2T48V5a6ovxQi4yQtMlg3qUggsBE1y8es5YptRlxFwvdRiB7M6khPWq8h0dbrtkXirYP1pU4OAbBSsIbMN0hWrySz1KY8SCn9JRiCzKNSl+N7uu0Lsu+Tzs09m
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 16:59:31.4793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f84abb6b-f603-4f4f-95a3-08d623084502
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4211
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180925164355.B5gDcovyFY50cQkJuf9aM9NFUl7ViejtEx3a6m9iM7U@z>

This may be used by both mmio and scu clks. So let's put it
into a common file.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-common.h  | 16 ++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h |  2 ++
 2 files changed, 18 insertions(+)
 create mode 100644 drivers/clk/imx/clk-common.h

diff --git a/drivers/clk/imx/clk-common.h b/drivers/clk/imx/clk-common.h
new file mode 100644
index 0000000..e3634a5
--- /dev/null
+++ b/drivers/clk/imx/clk-common.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2018 NXP
+ */
+
+#ifndef __IMX_CLK_COMMON_H
+#define __IMX_CLK_COMMON_H
+
+#include <linux/clk-provider.h>
+
+static inline struct clk_hw *imx_clk_hw_fixed(const char *name, int rate)
+{
+	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
+}
+
+#endif /* __IMX_CLK_COMMON_H */
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index 828700d..60c476b 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -11,6 +11,8 @@
 #include <linux/spinlock.h>
 #include <soc/imx/scu/sci.h>
 
+#include "../clk-common.h"
+
 extern spinlock_t imx_ccm_lock;
 extern struct sc_ipc *ccm_ipc_handle;
 
-- 
2.7.4

