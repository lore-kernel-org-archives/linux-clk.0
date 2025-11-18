Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223773043B0;
	Tue, 18 Nov 2025 07:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763451633; cv=fail; b=aJX0GGivNM8IeHZAh10tDqRtDffZKo7UVv3uqvzMWHzyclKALfDJ2vmWFEuwl67yCX6Iq7kZHNmka8a/sbc6uFqNq8JQ2akbbtsVTcri415YLNHiGCSqrhUp4FwIcFITa11pNaneBBGNjBcYMW5ygZNGeeUkzDtlWbppkW0MOzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763451633; c=relaxed/simple;
	bh=oNstlgAJbkGuAtMe2FO5GXJJIF9N76DWCxHnxW1BwIE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qMchvrdEDJGoIc41AvyUldAsky87xlP9/nX7ymOLHc0dUK+uAdcUGdw88qyG2lZSfAxQy3FKN8WUQxhwqIED9AQWwpxSv87NvHtqSyRQpFZg2bBJFYOHSLlryErXkVqMvTcX/pQEJ3FdT64j+yVkflRh2L1V9yotLZCMUH9aSCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ISVfAuF+; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ISVfAuF+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugpMpTqFa8E0ZchDzmY8nksQmf9DVFVP9ct6o6aGjD6xgNpRHb2aBrndNZ1YXDE0TJYlIwcllRsmv3yyJzD9bgJ+aDGFxq6NOQJ6B296E2JL7y6XWKErK/oWlTAVQX/SLlcR4fDL6TkV0gm9DPvQ9gVou6ka7L5YlzNNK3puzPEUsxQAQrK6QSidcShnQc5hn58XUNMaK9iE8Rmul+ineIe8nHcCUnsI3ceHR/OWqk2QvIvXg93GYaJKwXn4wArixxzhEBfMFiZ8rzy9G12Njkc7w8Ljz9dlNLqHdnD/wdjLoLXByref0yRpB+s6aheiNQw+rijB9GvWdeK2trSD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMhuJcM4c6c+QgNrqTIVVi0F3XwAjVIOAlTTEv+bxLY=;
 b=VK3/nwVk4WPARqcBG2wDuqLzkyx0qOZHw3aky/wM0/Dr7mbqhdNzJPyTeeye4vURh2RTfWvjJ1zPEj92zBcm64A+tMxSAzOMyrqLQ6YeK/LT9R4E7xt+m2yW11b2IB6siySlbmxhbMtTeeMbbVJ2l89N5lgtgjYV9vG0+S139WeNU3ah2If2rsdXX9mu2OIvrPwMWsSOiyQ7v1gd8gE38Z6W45do7UCOIZ6zIt9HtWi/GSgwX3O1x39tg8tolLmk+78oSV4OANeSa6qKraWrjcNruVegmLJJ8T2NNqPO4eqXPfONpH5qwljimgvPxzK94mEHTxGkVxs9PpJNri6HBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMhuJcM4c6c+QgNrqTIVVi0F3XwAjVIOAlTTEv+bxLY=;
 b=ISVfAuF+pme75lUxoBbewtHKTxVW07kcfCvhGC1J5kKOiaAicKqD3JE7/YMkdPEkmxYYdS1HSK7QGVZW8LY5RffDdYuQq9MqHmlC9QYaiLhAe2ZO5rZvZ8u1oETmsccKdAXEu0dszodw/rnix4JvLZlUXDKdLRu6NDndHFa/XOj7jPMNZbDnToADqMXWQtao46b09VNrCu+voeI97Ec3cSgbwAXHC7OD7GAAp8RbZkXgoJM9/rAUFZnclAihz70aGiOJHVfZBUCQD+aKi4pzkfsVJbDoYrc3mBoamEt1EaGBOBUtMoBNglaFUXRiybppgbrjNWYVoebzOtbA4I6Vow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS8PR04MB7976.eurprd04.prod.outlook.com (2603:10a6:20b:2af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 07:40:28 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 07:40:28 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	Frank.Li@nxp.com,
	hongxing.zhu@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/4] clk: imx95-blk-ctl: Add one clock mux for HSIO block
Date: Tue, 18 Nov 2025 15:40:54 +0800
Message-Id: <20251118074055.2523766-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118074055.2523766-1-xu.yang_2@nxp.com>
References: <20251118074055.2523766-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::12) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS8PR04MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ecbafe5-1bba-4ea0-cef7-08de2675be6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+DSPV9JezmhOUaMvpKIU+vLGvy0zHbIab3vp8eSh5fDq4hEBixsR1NZ/yqge?=
 =?us-ascii?Q?CHgQr4bDaKKuX+SNVuIO3y7W7T878GVfbiFh2j9XTkltiMrXvhm85OtvcKuh?=
 =?us-ascii?Q?kSattF4sgxTX1S5plwBCXBaj/9Wr3lTjuX+c2tNVheOgLZAHH4CqkfKAOUNS?=
 =?us-ascii?Q?8vhzVM0syDS8bN3DrLRjVX/BWEhzgDI3cWI6D9UlTrS3gGdlN95zRzHej6+M?=
 =?us-ascii?Q?FyMmB6cd0Mbi9zqTGYV9Ja2uj2hLc/qXibfEpVQ9lRpbqnKPT15GhoH4Humt?=
 =?us-ascii?Q?ozV444+pk9HKnTQ08gTt1IL9nU1O6fOhY3Hre6ErUzzZe5hMRy/ViasQ1dCH?=
 =?us-ascii?Q?sQyH67Mm1tAjz1C5M+Idk4dEJf8pgEUUf8vDvpFYIOTLDYazDAkGtCcmZe1Z?=
 =?us-ascii?Q?xg1t2pW/dol2Cjc+bYhJLUfUdLnRUpVtNpZmbFqnKf5jSo75VZ3MO10Gzam0?=
 =?us-ascii?Q?MbyKmSvRQfz1LtKv9KmuaSMoSTEx4lASl7xWSIjEqQKItjj8NUqj9CRCThva?=
 =?us-ascii?Q?MFcuvCy1OPND+lnXuh19fVr9if5m84T2bYK4KMVINmK/9AljShtV9iLwerBb?=
 =?us-ascii?Q?+YVNM1vflyLGgcYxJhoGP7pikcMRWvnESc2pAenw7CXe7JCj12GBM3NewAmh?=
 =?us-ascii?Q?tDBytN2nrJ/Q5csxjeSHipjgiTZ6m1TG2U4OspYI6RQ62ydzHlMLusY67UAa?=
 =?us-ascii?Q?YwH84faRRYYWQayNIl8oIUjR2Ix0vZEZjT7b0QdnWgW6zbBbFgE+y+S3N09+?=
 =?us-ascii?Q?hsb/UC6G0vv6LRG+NRy+dOp8+NC/bBk95YnXWe1i8Xfwno4CSLzn0D87K2Am?=
 =?us-ascii?Q?x9DvSUdx68JV30h0acR9ryt1k3EZJ3quwlmDoJ8lgqGKXjk3G355sx/QWHJR?=
 =?us-ascii?Q?PBMmDJ8alraWpjhc6PsWWQXN3u/7nOTyriS61Nbpl9DFPS5kK4Bq3Zi0P2PP?=
 =?us-ascii?Q?RmgyDGol1ksEz/AoJT00N9y4iMPlv5uNioz0GrXjJK8F8gPc+sak3BeneiJn?=
 =?us-ascii?Q?+cwri3p+IaeCs3UNYXe7gtSTvcCpmbsiSSdx+r19GtVDOwxzr6MvzkvBcRcp?=
 =?us-ascii?Q?jROcHJ6HzWV1gStiqILoxFx4fpnkhWqsRFMeQWZFGsKOvMNnmHoo9Co9gAbO?=
 =?us-ascii?Q?kcnMR0bgI/a+i1M1o0Na1f9mzaG+9rSgftuQq68LaZB0d91lgGZZZyqxUdJ8?=
 =?us-ascii?Q?oXIX1Kes23+3BSujBZ7tgWLOnv+CtPuQxM1wNYlNz1Y+PNm7mM7yQ2LF9qUv?=
 =?us-ascii?Q?bCN7HqCxahFSXHZLjhpsDF/FO/cIQaJ4G/qmxMCj6HSc5LNzHWU5X6wI01Tk?=
 =?us-ascii?Q?/XM3jFR3eCu10AaujiBGWL2ZPPCV7b0nZA4kPubAUlllEMwkygSsCztSa0uN?=
 =?us-ascii?Q?uthaZjNCSUojmLTuIVN4AaNiuMHvvA/KBmJNn8vUrg6fuxJx45MVv5kHg6dx?=
 =?us-ascii?Q?8uIkT0vTUIKL/S+8pxPbdzZ9JpgCh98FirTmYK8bqeaxVh1q29l7NG9rgGyZ?=
 =?us-ascii?Q?WzJaSDRgGH6jhvzaiEkwypMy/CXXRNoQsJYrb12Su2hJyLKyGwkB9ed5qw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cEI/1h2pMDA89MaY6fDsMZCdNwhLoOxQUrjJVOqj5o5v9MNJ2MWjCGQULstk?=
 =?us-ascii?Q?x5rnpF8myaLoBHbR9pdrgArxSslng7nNDaDUv33QGXFqSChfLWW1qHNaKZRw?=
 =?us-ascii?Q?bnVC25V8BsYVHaeYIhlMf9N/HH5494povouzRmlC7lLDsjDHJOHKNNjNGcNH?=
 =?us-ascii?Q?efaLdGz6wwdU3it/de1ud71njHynu1HUFw3q+3NjE0AWRgNflVxL4uKCyp+9?=
 =?us-ascii?Q?47595C12n704iv2zXIBTc6zqUX4LHbFcNX85ooMS0ytX3ODXsf/BO/PMcnL1?=
 =?us-ascii?Q?xiekvXjGDyIdgaX04FEIWckSJKbJNb3uOw1U2kMAeqk7v3xVZYuP8PVHIc3P?=
 =?us-ascii?Q?o0Ep/iIcNNLRk1fbuH/n+g9QL0PUHOtHvZKg5zstemDqCoETxI70/pxbaNkA?=
 =?us-ascii?Q?NH6DdUqswx4u0vvPOHqFIhCJmt+UDbNY5gz7K5OmZjGJhSJfooHsoXhrF44J?=
 =?us-ascii?Q?/+nX8TonOJTuRObQo7R8BS24w8AewE/K5a621qF8mpH2m6jiK3KW5e0mqgt6?=
 =?us-ascii?Q?Nw3wfhNKY9dRF2mXBXNi6zwYBNKOksGnEvAW9oE19M79mKqoYWDBOPIcpQEN?=
 =?us-ascii?Q?CPktG5ILuWrmsm0g3ehRNVszhLBasfB3GMjxnPqiFgtna9uGbnMaAq9Fx29o?=
 =?us-ascii?Q?dkjvUABFIwnhA3sC77hj21cHJOw/4VFfcNf5j2DKgkCnwwwlgg6eIcPg976f?=
 =?us-ascii?Q?9VUhcdypanSCRYDT/mnysbt+dGd1s+VPhavhxe0UfAA1+02IQrqaUtrVv/1g?=
 =?us-ascii?Q?2XIUpWLLagNnjUCDJ1f/Eg2A52wg2pWndMNU8P/FKQwQZWEEiHcX28BNXOY6?=
 =?us-ascii?Q?qFRN6tf1tgn+1k3pDCFsOdk7zFmW6QBSHwKXO+I5FX1xCD3euG/DagonMwqB?=
 =?us-ascii?Q?UKguj9pFbjs+5g4RirjE5gvL53Wa7tlFe2rMThQnod/Zz2mGnZqzKNx6HrTm?=
 =?us-ascii?Q?ZoMyLHIL9+KhZjJyPfM99QTw/AztVV9f/XN5yiMVtBDPFc1Tn8RNPG9sPVNw?=
 =?us-ascii?Q?GlX20Ruqgf2YkHlGKhpAjuU/rEezK0z0lEUMHoItuD/xqoFRodK813DEkKVB?=
 =?us-ascii?Q?AtqGjU6IKs8iVlBpKLy4tsxku3xqR5WfsxdHWCGIVpIc2bvXVR2fP8bzQvJz?=
 =?us-ascii?Q?Epu5sAZjRRBrjMFG78HnKnDyD6NwR3SMB8zNrtS1rq1Z+T66tVQx3SRIPRE1?=
 =?us-ascii?Q?0qhNDYlr8GeQp4lPOUpqEvWDEdNIaF3TgDRYRP6IgNzExcqxX2dcyvb1ytJI?=
 =?us-ascii?Q?oIUlXMSGK5mpLE06toAVuKKqm1uw+2Yyrzv8H+xaI5ykn3y8/W9undDodWML?=
 =?us-ascii?Q?BrS8V6bsvpmT/sVjkUCiq32/J4PpZrtesT3ntyrYeCXCflTndtsrk76DHHRw?=
 =?us-ascii?Q?gjXA8jZK0/tXgPeNvAeqdlM9u/AK/xJ/9Cy8xG8GfmWQN4WC9ENWguzXNlhI?=
 =?us-ascii?Q?/oHxDVi5N70rFd77Pu7Fc6MEAZMfcQtVTg+HeqeWq2ih148dkfov5R0ni2My?=
 =?us-ascii?Q?Fy7+Fy3rK8LSjFsaGdywXnMDMJc+3T+HVAWCnqFp9Q7s6/qetnvSqsW2g3XW?=
 =?us-ascii?Q?hqFE/Zz4aEXaRBcQ4NCLVlcy4P84GdPD2ehT3KbT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecbafe5-1bba-4ea0-cef7-08de2675be6c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 07:40:28.3954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KywUDG863bUHHds9/baODhWkTlFshgVBCSVeU9aqRpqlDIjbHXvp/CbBHKDWMQVHwYabRffVbmk4wEGsWdND2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7976

The GPR_REG0 register has an USB_PHY_REF_CLK_SEL (bit 6) to select USB 3.0
PHY reference clock.

USB_PHY_REF_CLK_SEL:
bit[6]   - 0b 24 MHz external oscillator
         - 1b 100 MHz high performance PLL

Add a clock multiplexer to support USB3.0 PHY clock selection.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 3c2019f428c9..ca06eee00e52 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -284,7 +284,7 @@ static const struct imx95_blk_ctl_dev_data netcmix_dev_data = {
 };
 
 static const struct imx95_blk_ctl_clk_dev_data hsio_blk_ctl_clk_dev_data[] = {
-	[0] = {
+	[IMX95_CLK_HSIOMIX_PCIE_CLK_GATE] = {
 		.name = "hsio_pcie_clk_gate",
 		.parent_names = (const char *[]){ "hsio_pll", },
 		.num_parents = 1,
@@ -293,11 +293,21 @@ static const struct imx95_blk_ctl_clk_dev_data hsio_blk_ctl_clk_dev_data[] = {
 		.bit_width = 1,
 		.type = CLK_GATE,
 		.flags = CLK_SET_RATE_PARENT,
-	}
+	},
+	[IMX95_CLK_HSIOMIX_USB_PHY_CLK_SEL] = {
+		.name = "usb_phy_ref_clk_sel",
+		.parent_names = (const char *[]){"osc24m", "hsiopll"},
+		.num_parents = 2,
+		.reg = 0,
+		.bit_idx = 6,
+		.bit_width = 1,
+		.type = CLK_MUX,
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
+	},
 };
 
 static const struct imx95_blk_ctl_dev_data hsio_blk_ctl_dev_data = {
-	.num_clks = 1,
+	.num_clks = ARRAY_SIZE(hsio_blk_ctl_clk_dev_data),
 	.clk_dev_data = hsio_blk_ctl_clk_dev_data,
 	.clk_reg_offset = 0,
 };
-- 
2.34.1

