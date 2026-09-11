Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013055.outbound.protection.outlook.com [40.93.196.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF58F400DF9;
	Fri, 11 Sep 2026 07:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110116; cv=fail; b=oL2hsO9q2blmQY6rbPIamNayjl5xTVGhzrdyd9/5OskiqvSgNp/ugNFgh14hnmTDqwDsaa4GkX7IraSrpeucuMJBXZam74yGjO3idJKnau6wKyH5e7PiGrDYHk1DOR6scJcUcT6FlpHvtXKz0Fu5ZkF3VMR+GczIwsoK3dNxGik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110116; c=relaxed/simple;
	bh=ga5HlQjK1Dyg/c97KFV7VG0GP73m55aXwrEUBxPwOLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V9qRUxUEDOMxxIMwrnkJvr5SjiHCLPkqR0h3yy319rGjAXHWpmM9k3qiz+tfIhOY0fud+Dtyn1ci8e7Zoup7m8qiP6IeUS/NK/o07oadBWqHj/Oz14HqBBbtDws5L7ZmdxKxloVbRaUnizJ/OetHSf71uxoa3Q2q90G1YMAzFZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=WVSMiv9s; arc=fail smtp.client-ip=40.93.196.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="WVSMiv9s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e427DxHn3K8w/l+FOnDlELN3/EV+JeXyj4DK6D+mq8kFs33EYGuCc/D0BiG7mrV+dz4n4OuT9udUrLAAEdwtIHt25twfqXuVOr0Ou6yUeXHO1JmWEZVh8Kvl08L+HvjAlMwPdlEm2LeXC+MII1pKSEV1F2dgrMpHdwJWcF72XuxTkhQDgrp/WWTnwXIrh1UL5OMIjxjirzzA+ReEQA8xFdUTRIbToyrRQENU5eIWvp8/wPylfokbRkUAw8JpcqAcyfngteJlGiztyn/szxi7lvsN7qKhhoSRLsZ+FTK5l/oYREpQZUSNOS4bfZPSw7ciWKovOxgjoclTeNaKTzFw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FN53MG8Y6M+kaNzKEBX9110m5AdgN+ym3fNED2XnnbQ=;
 b=D6+xO2O8REmci7seK3UVyLqi4UrJHmGpm6nPdb7mpLiQcu7agkWKsu2GE1GxmfDiduaN3QxLteaCedL4QJNHeggkquvkm2Zlwbe/ioC8jfGtd9CPC1cgO20HKpp3khwsQYM5HOdrurku218CoHkRft6/V4tan/g+v1gWoWF6+VOhbdaVNuI1SnAp/DzcXIaLZYs4Auqxv5ZK48nM6ZMOZH4xX4sSf0VQ6X/Qs7h+baZvtaJLOuT7d5oktaih7bLbPhGEvVKelhdFmlW0COJS7U7c2a3FEvKApDexRCVYG4uJPDC48YGCxjEG0x8yNdKJodqECnc3/MuSAUzmYl2Waw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FN53MG8Y6M+kaNzKEBX9110m5AdgN+ym3fNED2XnnbQ=;
 b=WVSMiv9s7U6iovSe9J1gkzaZAENAyi00pWXPMEj/W8KGfxRs3Bc1Xg5YUoKXV8AJdMlou00UEZImcaCC0a/rd1x+0a/gO4BeKwaLAcxSeL3FQ002hpqa6SH4NFMXVYjRQB7feKsRfB7CiMbPxoKIRglvkfXGvYQh6XnYKn3l8ifRiPRxYiFTydh2S/nT2tYHJK+07PZkX/g2R4O7N/NV015xpS0tWS2nc6j+a2ZL3MVtbyau0VRn7wOd4X+LKEMyKdbMBuiilMWwdNn6F4mahb9RLstufzv1oRj8YOanIvssNGdK6tnJLe+2UcxP9w/KpSRyxr3cE0Ixh5zxisDJ+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BY5PR03MB5267.namprd03.prod.outlook.com (2603:10b6:a03:225::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 07:01:38 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 07:01:38 +0000
From: adrian.ho.yin.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH 3/3] clk: socfpga: stratix10: convert to CLK_OF_DECLARE()
Date: Fri, 11 Sep 2026 15:01:20 +0800
Message-ID: <9877f4adfc70a1157d3b094287aa2a78c6a54df2.1789096458.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
References: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BY5PR03MB5267:EE_
X-MS-Office365-Filtering-Correlation-Id: 187cb54b-825a-40e9-637b-08df0fd286a2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	5Wqgj77iyWDdVAm2ZFi4TThGjGubfs15gtlbGDvVNpDsXavaL4s9PnFOhBaeUuQt3Sd1MhrrCXeIY5t4VTL6aRZD38Yr1cDsT6MG08LspnYPzSjR3GBSttIlH6AfFfgsC+dNzIu5pvhfev9gp468dbDxLT4aNgmSKihBPjeB5AZmVbwwStMvoHY6HQilkZvByNeNx12LPQewxsHN3GWHmyxT4sTf3CsKBNLC22WFNv6U9wq42ogvMtiYHPjK9giyeHWdpqx4nEBLgRdZD9PwnCJKwja9qrBYBrG/uBSBLpdxNw5RgI+bcVGkEKAWZDEGmM5ic0H8vCr4Md9sZUqlxL3T0Wf5R0vo6VOtsZnHc5hU5GI2C8shwdlecOOIoWNTiN0avOBc3aFqADOPR1/E67jjbyHEASkiTph9YawQkbhHVONvJCK3MAU8THv6XP9Hg/0n2GD3g2K+ODjFhIFMIUK6vEKbxkb6ufU7/pQ8s8+5jUUsDXnBJoBOovChgUN39Z3adMgarIauJCK5NadSTFlhGkj0DYjqMnOrZmaxLOwkaPA6e9Ebas8547As/UeC42o7HHf8ZKcEX5Q/yMrqS7YGUFXLHRNRRU3BW2oCiB50YGSlomKZLxBl5//roN0HxA020vWdp3wUQbLVroKY3AbVJA1YTTVlrcLD6O+lTuw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vXgfJjYBaphAzmoPJA9TIvbXwTOYEUSMEfDuErFIanKxwQXMpr0bhdBq9iSC?=
 =?us-ascii?Q?EnwYl6xTpU1TXRd9HNHeDoi+TCvDRHXZn1av86VRo566EUPa0/Hp6KyztAOy?=
 =?us-ascii?Q?mW2kBi9u9Z5juGdZI4DeB17RtUzmSX1a36hkREFgvnII2ohmcBUa+sPHIraJ?=
 =?us-ascii?Q?tf0gWRdaK45x0cXVbo53VyqtC6JezgylAWjW+pwvGmT+3QGZOIpdFHi8mQ2F?=
 =?us-ascii?Q?wcgKSOX1bZL4vAYaOPcy6hvCru2fOmxUVlm/bdsiU3GR19+SMWmHGrkJpVIn?=
 =?us-ascii?Q?dvZIwTeIy2z1qEMgm65OJZDT1IW8jaMBLH3cQTyDGi9yhj8TRFz714vmZXSE?=
 =?us-ascii?Q?1qyIbufRzlKaP6K4X/zncaEdOhsLn5HHGokVnowGIzeUJtVbwnIthr24P9hM?=
 =?us-ascii?Q?Q1vnhVs4+VRs+R7lITIjyz/q/4p5tSzrjgzchEEgZ6h/ljwwO2kuc5nWapPt?=
 =?us-ascii?Q?d1UYuNHPMdKbegHXsrfTSIza0oww2jYAGTA/zT2Tq6P9JtjRXmOOllxWtbTr?=
 =?us-ascii?Q?JgtTASwM0aLUX7LOrm0sh1omU0s3rZQdcTxT0QMwXZeAK+5QOxVZFrGRuo6Q?=
 =?us-ascii?Q?5OeMH0CuT3NDKFGwb371iEpf9LPqB22T5BbEl9YweATs5Upl0Imts105jg/e?=
 =?us-ascii?Q?nCuIrkVfBplQdptHh9CXkCbhfazE44bLrstCwYDA15Fp9y8v0L3TioF5eCUi?=
 =?us-ascii?Q?IO9vStLEg8C+KesIIjl+gmj8R1Ve9VJAS28C1pVd06PsF+Pg4j9gqK/GcQqI?=
 =?us-ascii?Q?2fA+WUsPktpbksje9EtAhUjod180eKPQv4210WKXRC/wAQ2DRQy+iq1e8Dqp?=
 =?us-ascii?Q?oHsep+MoIXOhWY+v9PsveaRqJb3Dh8iwuBhwWFsQ3qvln9RrtdYGWDt18dj1?=
 =?us-ascii?Q?1+7oIkSjHoGIIZqNZLnx+VpS2lDwK+3lrgroMSkjO0zwT/E/aX21KvpZWlpo?=
 =?us-ascii?Q?t1LxUVytvD2RjyvXnQBOjFW1g4aQltg9W0Knc8BWoKkVpFrgGmJ8o7Fp5y6y?=
 =?us-ascii?Q?QjndgQcAhLyY7/ze18655hXojlYaASFDduX1O1tBSgyh2RXEN6qGUKeoggVZ?=
 =?us-ascii?Q?ru0WeqB2M/+lvN80v8n7afpBEWZUeYqtNmTsTEd/bWd3VT1pTp1/vOq084w9?=
 =?us-ascii?Q?k2n8p1h/9eIENzP9DnjZWI1e8LRKwqpeLnh4adIJhnxxYFofLMWey9dchCDx?=
 =?us-ascii?Q?RHpx28azMQvm6y0a5ZOAMCqpN7C4fKq3694emfAgPgb0EQYZurBHuO70GV1b?=
 =?us-ascii?Q?cOgtSRY2zbCSR6FHLxb4+eBOqneVjny0yzIg7xO2fYNh52JZUKSpMP1rv4ta?=
 =?us-ascii?Q?Io2ecZmfRqFzm4ItVCgZKoyMRzOs3f8GztX5Q3nWBMcNVeV4mRZVowza7eon?=
 =?us-ascii?Q?huShmTfmzZ/hC9+lq2JoxMNnmKYXU/Bth+GCv0TMSeXFOyW6079u7//VRHxV?=
 =?us-ascii?Q?fT1Vo5+41GrD8OFYGHGmTlZO78HFKGt8KPb7kpiPP3gThyNI5gp9Ht2LUM0o?=
 =?us-ascii?Q?S31OQrL38ALuOWqXy3SupcjwQModrB2Qrsg+aTl0TMDK+r9+rWzNhDFqreS2?=
 =?us-ascii?Q?yTeEarVcV7VsHGbi+oizZerkky/f2Z4UI5NKkX8Y77uY7vXTRG8lxDkqiWOF?=
 =?us-ascii?Q?UAReaBZQ61yWRJse/9mbF71n4XcuEbwyDDLsStDt9eqN5CbiheiWkqTKQ5gL?=
 =?us-ascii?Q?Fo6u2QcycsrjGvC8x7dlRHo7LKS8tC8oySB0Je0X9KmAq2NgfDZgBHTw0+Z3?=
 =?us-ascii?Q?NRGVvcRoGiK63pGjd56tTcagwQBf7Mw=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187cb54b-825a-40e9-637b-08df0fd286a2
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 07:01:38.7920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNltWwN5XtJ6Y22ULRPV03ujwAVSeN1srXOjRRNfSMYk8KYrwahg/UjP8dXwj5jyDpTQv0Rh7iCckC/l3okG0Q23zkPrmWnuK87+3WK+yZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5267

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Register Stratix10 clocks at of_clk_init() so they are available before
platform devices probe.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/clk/socfpga/clk-s10.c | 50 +++++++++--------------------------
 1 file changed, 13 insertions(+), 37 deletions(-)

diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
index b4bf4e2d38e1..f97503dcf346 100644
--- a/drivers/clk/socfpga/clk-s10.c
+++ b/drivers/clk/socfpga/clk-s10.c
@@ -4,8 +4,9 @@
  */
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
+#include <linux/io.h>
 #include <linux/of.h>
-#include <linux/platform_device.h>
+#include <linux/of_address.h>
 
 #include <dt-bindings/clock/stratix10-clock.h>
 
@@ -382,25 +383,25 @@ static int s10_clk_register_pll(const struct stratix10_pll_clock *clks,
 	return 0;
 }
 
-static int s10_clkmgr_init(struct platform_device *pdev)
+static void __init s10_clkmgr_init(struct device_node *np)
 {
-	struct device_node *np = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
 	struct stratix10_clock_data *clk_data;
 	void __iomem *base;
 	int i, num_clks;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
+	base = of_iomap(np, 0);
+	if (!base) {
 		pr_err("%s: failed to map clock registers\n", __func__);
-		return PTR_ERR(base);
+		return;
 	}
 
 	num_clks = STRATIX10_NUM_CLKS;
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
-						 num_clks), GFP_KERNEL);
-	if (!clk_data)
-		return -ENOMEM;
+	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, num_clks),
+			   GFP_KERNEL);
+	if (!clk_data) {
+		iounmap(base);
+		return;
+	}
 
 	clk_data->base = base;
 	clk_data->clk_data.num = num_clks;
@@ -421,31 +422,6 @@ static int s10_clkmgr_init(struct platform_device *pdev)
 			      clk_data);
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
-	return 0;
-}
-
-static int s10_clkmgr_probe(struct platform_device *pdev)
-{
-	return	s10_clkmgr_init(pdev);
 }
 
-static const struct of_device_id stratix10_clkmgr_match_table[] = {
-	{ .compatible = "intel,stratix10-clkmgr",
-	  .data = s10_clkmgr_init },
-	{ }
-};
-
-static struct platform_driver stratix10_clkmgr_driver = {
-	.probe		= s10_clkmgr_probe,
-	.driver		= {
-		.name	= "stratix10-clkmgr",
-		.suppress_bind_attrs = true,
-		.of_match_table = stratix10_clkmgr_match_table,
-	},
-};
-
-static int __init s10_clk_init(void)
-{
-	return platform_driver_register(&stratix10_clkmgr_driver);
-}
-core_initcall(s10_clk_init);
+CLK_OF_DECLARE(stratix10_clkmgr, "intel,stratix10-clkmgr", s10_clkmgr_init);
-- 
2.49.GIT

