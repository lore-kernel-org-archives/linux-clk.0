Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011029.outbound.protection.outlook.com [52.101.70.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B51C302141;
	Tue, 18 Nov 2025 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763451626; cv=fail; b=RB6nhoGjK7Hzopbxkc5BnLRZ0k0g8XZ4qfDBNR04rE9/ly4rK7RbcXwOXbszZHuYy2NkApbDC6X93QbtcauFmaQiGCMR17WMcJEiOfsOsqybgEGnTGnSav7urjd4cAnV74MFp2KQFew/nrmEXlMYAXxGuF3fURVvZ2AKAbJXBHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763451626; c=relaxed/simple;
	bh=QbAFMYR6hji+NZ9KZVpfY5FE8+rhE0Tv1Y4OgvqeWIo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WehHc4kvUhL6Avfw3PY/dmWlSCq5HmxBry4sNKCAqvVRkfzxcuaRDhKPosKotD50mS1bZ+dtbzfIHXD9w5IO6GzAUKJzcQrH5gd5NiJIiWU47L8Xt8RrSO0xKb2RvUiRo0YNd02gaX8HNlZ7meh9yYD5eo5NJeVm4XzmQVV8fAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bNUdNZvs; arc=fail smtp.client-ip=52.101.70.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bNUdNZvs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y46319uM4IUVfLDxey/e26msUUXQi/50pL/eWeC6Ml/37hMgpEj3j+ge9rgd9H6WLOhmEuIrLzisA6KJC/z8zTVRLi7H1duZhgGFcIrfBuO60EJDNF74El2EHOPi79sTW4hC0Wd4Q3x4+W+oZeSt95sUbRB2AN6Cn359mRpC3X8dcX34kF6DjyDTUOBK1WoxErm2zurv5KgaCEorc8EhFLi490KFdVd45vTepPPBjrMvSa8TwS866GazK9yTZRxnyusHPvAgmt9TTm/rYqFhaNX318CHTU9qJHs9Vp1g/CmX+GgEvfN4C9b8VH5vtosXZopxpKr6zhI6NQ7z6tPjIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxmMcw5A7nE2n4INgSJMszK2h130KUHxXn5fDgDHllg=;
 b=nHjqMbksIq/D1P24gXjoiKrUjMcH+Of2rZHtQCK/KYzEij1EcVMDjpNv3s3V0WHsmYSeSo84IZUnLfeHQXj6pBRESvJjdRgF9B1eP8owll9VlLfnkxBPhv3llPGR5ZsV4fwRUE4tx362izUT8eGkkYOkIKYrhVNBhYnGG/Od4rkDkevpsA9yzzDRVTpd4jHhscK6D6+mzCR2Ehd9cO3p20AssP1LXTP+T8SwYs8MgOAxul1eeGl2/tnMKu49iQUVF8drZ+B5sRg8hxyNsdrpvJ+IKnFOVAsVgOtOeU0kljjkEaRuHtmZVckusVZW2ZqJ+ZiRHyPB5vMeEDix/pYUhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxmMcw5A7nE2n4INgSJMszK2h130KUHxXn5fDgDHllg=;
 b=bNUdNZvsHXLxUxwvHANSfa5ZyFQkiULz+Shy3r2s6Il4sdjgFs6SqIDBGe0m/RSJeYeJ+9IC4wNHZvrzLOo8YRAROYn508KivRF09vhBYnNLPOl23aae9iBW3cIMNCnOvZYoygGpVBMoz6si4BTDn3XSGif46tGkeugkTtCoW7LCm84wHu0PngzydL+sOqqMEdzYLrckn9e+gmrpZETtX1S6bmjeCXlU12yvJlwV/2Y6RWKar7WmGImP/qou6U90jfSb20GskSmuKMb0FMc5VleYTERvrcMcTaU02eQJqBMEukl/Ck+JPwkh0bLgehz1ABQ3fzRBiymYhNTmzS8N5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS8PR04MB7976.eurprd04.prod.outlook.com (2603:10a6:20b:2af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 07:40:21 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 07:40:21 +0000
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
Subject: [PATCH 2/4] clk: imx95-blk-ctl: fix hsio_blk_ctl_clk_dev_data reg offset
Date: Tue, 18 Nov 2025 15:40:53 +0800
Message-Id: <20251118074055.2523766-2-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 398e5887-de42-4891-2e70-08de2675ba3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X+PZoSW9YPp1FVJXOTFpkRS/R9CR9kSV6/csp5GzgIkhKxnIklzuAqJS2cnc?=
 =?us-ascii?Q?zP1d765WIMUEWCg+8yMun9Td/5kAbqB3HzA+f2Qr7kAt/+OjLZFuJUiNCbVQ?=
 =?us-ascii?Q?3y/f8Sgg5/Ua3BjUc2DoZUUWKYZwvrloBNcBpJq1bbW6Mc+5mkOmf6HoglsY?=
 =?us-ascii?Q?EneKiadYACS3Rlc6RO/jd4TKpNqXtRsAyfe66UyXGBOkp3CRA9Sc0sH9XbBm?=
 =?us-ascii?Q?dP5nhdxLSo+lMciC6ujsy1f0cDUcCIrEx4CpqfKLqzR5odpen2+IhidLflcS?=
 =?us-ascii?Q?2Wx4wnQbKVCua951UeKpxHBclIhnOjfV8s+hqgWhUw9eObQilQTwP0+ex3sK?=
 =?us-ascii?Q?4SOJsKh+4zD0qz8y5eb4P3ayHi+fojALxXvXmLgk1pR3xiGemiErg/NECcMO?=
 =?us-ascii?Q?IpuSogRqo9vdLolVaP3fc7NRJHQ2l7cOeoZxm+37QRXaBfcWPvhWVE1rQMtp?=
 =?us-ascii?Q?ShX20PtfiSN9lLK8N2vT3Dx/wWFY4JRccJudtfm2krnaYYmtwHdDdibUAIS8?=
 =?us-ascii?Q?/cZMKATTU18I4YljDHYAsXYF7qNHsgKi6p9ci+Q1d+vtfAwXI0RmhEMj5bVa?=
 =?us-ascii?Q?E0NoW/rWy+SnBhMBYtGdHB5+pGxwYt+tfQ4ENOlaq2r+A1tMr4MI9XUrJT8H?=
 =?us-ascii?Q?iggUjaLU0d2cSZo2+ywWWRpOZctQ2Beg4rTWPml8ScNn4Gsk4yhkGw/ESZVo?=
 =?us-ascii?Q?et1NYPnH5282PCO8jhob6Tt4n2cF4rZ/isFbc2xZGHQeSKOPGVa6PFvWBRt8?=
 =?us-ascii?Q?VN+Oba623QKluMke6ji36NxGirpYAKuWks2ZOHPq42bDVYrfQmCJGW9y5oiI?=
 =?us-ascii?Q?Ue5I4jV06YlDZCPsRwNQbQfsJ06VreWmyyjtwu+Thmdq6dUYzytSokhXNVVf?=
 =?us-ascii?Q?m/XB7/uk+mn8J42ysNFXK1w/QUjTh8uhKvzu7tuXXMQmN+G9g1k/7wv7mGqy?=
 =?us-ascii?Q?4lSL1XNjEg+KrMzym3Mwvw87rpTyEDCQFRhMXRA076OfCoo5Tk3+7/XewaLy?=
 =?us-ascii?Q?p6txR11p6LXyQJJasjQocMMGF5I4kCpsH5v8SOfjcTvBqVcR+seLJY5+zrSo?=
 =?us-ascii?Q?kzHlN6fvMj9SoA2CX7rD8AwvADsxk53bKMmJol0Db9i3ozZpuy8bJ9+oEWfv?=
 =?us-ascii?Q?AiYEbMBZmY62fwzpJAz7jLQYBFfC/pdvW0/D/JdV4VYMGBYy48aImICN/gw1?=
 =?us-ascii?Q?iheABWc7FAgffwezr899xS13rlmGQblgBwKiEZL1GstIlkipNKy/ctiCbgw7?=
 =?us-ascii?Q?IyeJVBCPVFvmOCi0TO2B86jWxPXH/ZUvcfiAApFywKs/f9Q2LdThJjaDn1Dh?=
 =?us-ascii?Q?YoMSTUt29FTGHR3iLPppOheW8+qOrwfqaW/yZdLAb2dyOP2U6yOSI1tZ1Ce0?=
 =?us-ascii?Q?QZeQa7iliw7QMsnLEhcK6NlLAp4ygzXCMAhJ5opJEkJIkvwpF4+h9kZbBLDG?=
 =?us-ascii?Q?TbnHA1aK/4WheAconL8WqRg1BAC4YGh4L/Ok8oaUfixLfVu8IYrrBNvB6tDt?=
 =?us-ascii?Q?bY2sMMHm0l5/5d3JdYYGsqautOePj+YkDJFkPsqs5KKBrtC41+rZIdPQPg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bYf1sUk56AVK+ioCGvDCJuv89P3etzWVCud+Z1iNuci2DIhsK9h13kyy2WM6?=
 =?us-ascii?Q?TqFp7XTxn1hO3slNupURNKwxWUYdAd4gGe30r+zqCHFSIVDWUMk5tOg0CRqH?=
 =?us-ascii?Q?hBww5dhsZ6O+EO27qXGQ3wDw4ZzHslwmzbRebvsIt1+Aor9CtPo/q9B9ZEWD?=
 =?us-ascii?Q?obxLiJ7hChm2bTXMpYl7kP0GcBSp8PG6LIeVMTyF1LtThvDJWh/HyukRnCBN?=
 =?us-ascii?Q?yupFTMIxG42/F7Qvli052I9XAEvpn9FeoGEkGHFM4WmLC65V/LsFY/6wYaog?=
 =?us-ascii?Q?WcbU8d2ua205nr/1EXLSYI1IpuqmH+//efvv9rWPxrZabWFlfdm4eWiBbghH?=
 =?us-ascii?Q?r0CYWopXL7Rn2ZcUFtTzM6/aoR0zi9zUQ4xZ6d6iSO3dusPmg1kzpnxe51JD?=
 =?us-ascii?Q?7EeA1v3ScELLGv9nH9z+IQoIotreGxCvKYFK097JVxsKyJlmX+uTdA2o/dvo?=
 =?us-ascii?Q?B7BevIbNRhFXF0DKfEmHik2sXUp7JRpXbDIdMo8CiUMeT/jgb5Dq5jZ/Ivf9?=
 =?us-ascii?Q?uPD68YKaBvVRtL2LKZX6JrkAyKqqqkYd/mEl5URTyJFpdz0zYKc6eArtmMkj?=
 =?us-ascii?Q?u3pN3S2MvJ4MIXXH1GdzEAX/k0oV6XkBa09w4lsVZKzVVXhTg5CBzZJEzIsS?=
 =?us-ascii?Q?b6jGHa2ygQtMwDqkmcMNwxR1WJryo7HFeGLxT8OzqqpuACVKCt5jLD1vixiv?=
 =?us-ascii?Q?T1/OtccQUuMdOm+SnLQEPcXd0GFGPhCG120T1zEPUoIzDxBmlXNdPEiGpZtZ?=
 =?us-ascii?Q?UbiUWo2wTM/dlA2GLy7mT9DG+T2DGFrbDmbvrSnDQTOuJsLFRKC9oV8tqc66?=
 =?us-ascii?Q?byLv2TJuFW+Odf4/9vXLxWvVi3juJept3RjLJ6CEIWWc91EK7hYPlm3WdUtG?=
 =?us-ascii?Q?RyzvuHhdAF353XcQqVRKr2zSSZVJQMLlJIXWHaauqFu1YHKbYd/K13XWwDB/?=
 =?us-ascii?Q?fR2X7iPKUZ2CTnQA4Cc17Qamg2Dqj2UWqFPMhgwtM6WolkpfafGcz061XKTm?=
 =?us-ascii?Q?B9c53tJOY1rwGkpd/RXmtuhhncDp3igG/LoggUU228c5fqnvV+Rr5moJKh5i?=
 =?us-ascii?Q?TvXuZYp3gY/qfUnF7q8I5sGybcWV0aUEFblW5vgT6zQE9qbV5o2LgMI1GmZx?=
 =?us-ascii?Q?NA+OrH9Kp52h3aVnrk6DlPltu75F4h9sWSAHJcyW8+nQ2akgh2EE/Ii5RNrD?=
 =?us-ascii?Q?LO2v4MEKR6I7dMXIzc0FXoXdzu6Ykv+4v3fHbVXFcVFAeVHBz9JPyU8F5djo?=
 =?us-ascii?Q?9/jPGQAbx4IuujqSPdtWxa4OPW+BXLZyeabLVDM8cXT9AJvHQJtPMEFllhKt?=
 =?us-ascii?Q?TPTuHYpKoDyST+UQIGVgIUkupSDFXnBCIZmB8qxhuNoIhryO3UAUlv4Tw2nF?=
 =?us-ascii?Q?W1UuAQcQdDm6pQdM+vVYcfyYkSrCtukan7wYvRl0FImw073gYnZwvRmzgawh?=
 =?us-ascii?Q?rBTAPYKd4uozx7o1lsptrEvT65KJbSxzC+uY0jkIP3/cncHt8AJkVM0X7uFh?=
 =?us-ascii?Q?jwNOPrnf/fRweO4CP1Q57O9ADVxY+XkNWvtTATCycTiijpO2LOUr0oAvrN46?=
 =?us-ascii?Q?uUM1QsIdE7EPxWSGY+Nw7GKsWHQmkBk0L+0Wgzo5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 398e5887-de42-4891-2e70-08de2675ba3b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 07:40:21.5437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVv3bJHBFVC7sHv20AHdHIYGchaNneVPU8KPJFkO7Q5pLWrziTcrQhjE95DkjVx7AeVvB8aiYipStsivosuiIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7976

The first item of hsio_blk_ctl_clk_dev_data is used to control PCIe
reference clock. The reg offset should be 0xc0 in HSIO block control
register map. Correct it so that other hsio block control items can
be added later. This will also rename the name to "hsio_pcie_clk_gate"
for better distinction.

Fixes: cf295252f0d8 ("clk: imx95-blk-ctl: Add one clock gate for HSIO block")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 56bed4471995..3c2019f428c9 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -285,10 +285,10 @@ static const struct imx95_blk_ctl_dev_data netcmix_dev_data = {
 
 static const struct imx95_blk_ctl_clk_dev_data hsio_blk_ctl_clk_dev_data[] = {
 	[0] = {
-		.name = "hsio_blk_ctl_clk",
+		.name = "hsio_pcie_clk_gate",
 		.parent_names = (const char *[]){ "hsio_pll", },
 		.num_parents = 1,
-		.reg = 0,
+		.reg = 0xc0,
 		.bit_idx = 6,
 		.bit_width = 1,
 		.type = CLK_GATE,
-- 
2.34.1

