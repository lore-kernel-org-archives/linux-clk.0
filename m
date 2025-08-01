Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010056.outbound.protection.outlook.com [52.101.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E134F1DDC15
	for <linux-clk@vger.kernel.org>; Fri,  1 Aug 2025 07:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754032781; cv=fail; b=XrSGX94Y7KO5mi6jf8zZTJjofEDd+QZxeSCTY6o2cMKyfBh1xH/sWdmBUXkbisAkv1IL7sDGNgi3akVRzY2Sn8UIZ8JLg7dBC84Q527Y5r/GRa6YgQ/XnDBmzALHvCOzvzLTXd0Qzn9GcOvy4yHvvYoqPqTnqXRDHYfVkwRkmfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754032781; c=relaxed/simple;
	bh=JNFhxF8pdDWubKSKqubj6tlDvErPz44oLRIvLqugdX0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=IVUazh4rzXnVxsagrPHdbXeVhblJvzOgTgnkZFHBzLfD732aF004Z2rdn+EIWp8+8AYkz27tumGD09sSUoysAr1MFh8/mawq4JF7d5owWddnuKcVhB09R0XrLhjrMNx0AD4cdEIZoOPQM1aLysACwAAJCgre9UY8ubSFDoJUh24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bqZdqNt8; arc=fail smtp.client-ip=52.101.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bqZdqNt8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ur+OqXhjj9PDmZ6HKAQUmXur9yY8ow5wPNYIMDRystxEYgwhWbg8lDsdVi7UkYfa2/BhNY5ndjVfukNJYnYJJ9RwIBchHx49+2sSomPTOPtQC6tP4Iq8N4CRpgSg9qhW4j470K7r8jdYylg4qsN10hUgbWb6vXQHr88TijWOoTV3b3GJjEaq9U3FBfz7Q73I2CWbo40QAYr3cUga0tz4gnIcO90OBgjT2fpJRKLRLcG2GnJAeAXKQDp3NQvi6rKLl1lsCHsUiB36rg3md9wO3gKsZPUs4eDxQR+S2rbmG6CVZqvBYRLXc25Ol50xYYXyH0g2ga/9amfMIviEfYxcWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=be7Lez6OXsAmIqiG4KCCedfTCwSUx2zoP84XPqDyJWA=;
 b=pqcQ87g1tefQlVMuCRlW4UwrxdWu/9DH8e1LNawcu7ypw7WtJrY9oHt63RI/hh78mwWaJLEK5AyB2sCc48cbnvPRBzRjpTZVQECDtcZj6FnCUBPhBoaAAnVe/80tSaUoMRFSnlUsatGjPsciYuM/EQeeaOldodYvQymXZvRUOgQjNGlnwpln1jVZHQxvuuv1uY0FbmTjrcYVhpmzg7ymxQr8LQaYjC5oV8Fd39apsl002g4Yw5YrDJcm38VLaZkrCAouXYLE7VYrrI6em1URJv5+aaocRGQUWXumD8fTl2ETs30Xwj+3mBgwS6GyrqbaAOi0TbhYD+eAfHyBc5KyHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be7Lez6OXsAmIqiG4KCCedfTCwSUx2zoP84XPqDyJWA=;
 b=bqZdqNt8w71LHx3PWxLp/NDn6507Zgmx7uJpKuHhhv/K2b9UOMPUjZSoK6VKoPHv0kEwExUbJMNVj7d74OmZF2WLYEmoP16LyXVfv4HdyuaMNVnUQHidocJd6wl7J4lUm+cB4mExXv5TjSkuUSJzG+4KTJZ4hi1SJiBYtIIZnZ3/vy4Zt4I/zbDsETMKzy7DIJF74FhB98qIW4nI6HD92uEJ/QBauWzI1BsX9I616l+PCaF88X/lsiARDi/Uugfo9chZGcuSoVMb/k3YIXSmDd30Sdu3Nm62UgvERLlhKxN+8Ye2Pb6e79Nd4v2J6E4/uMCU0g/jo42GoSZC7kchRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AM0PR04MB7089.eurprd04.prod.outlook.com (2603:10a6:208:1a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 07:19:33 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%5]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 07:19:33 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-clk@vger.kernel.org
Subject: [PATCH v2] clk: imx: Add some delay before deassert the reset
Date: Fri,  1 Aug 2025 15:21:53 +0800
Message-Id: <20250801072153.1974428-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0191.apcprd04.prod.outlook.com
 (2603:1096:4:14::29) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|AM0PR04MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: f6bfe530-8fb5-45bd-8ac3-08ddd0cbc345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TzCnEvlfgjulFhoAQDkzqX3Pw/vGrVHBTLy3ULFH7qMpj6EZR9Xq/MfPbKYz?=
 =?us-ascii?Q?u3xTrqKiy9J894v5zfvjVRiaC5ECXV35qismvWdH7G2gCjwwcKTp7AtkYkkk?=
 =?us-ascii?Q?tuqdGERMD/3+MV2WfAtvVeKIxo9946WE5SQhP7wGlbx8FmDYdgcyXgaNlm7y?=
 =?us-ascii?Q?xfKoPcwfl7XMicRBs3WTFE4cGWs+mGSaZIjGIoAUrAEd35fYzwdj+A+1+mWd?=
 =?us-ascii?Q?Y3v9PHSLj77nisu/Eflr0+I296Mo0oKhkK4F4JhZExGFhj197TmWHbJJLDVg?=
 =?us-ascii?Q?U45t0U/707A3nltdh0laRkAvbEKKgfiLC6DxMiSGJ4/70Stc5W4jE/XlKvoY?=
 =?us-ascii?Q?WRS5xYQcBBJvOPNg4rQktYY8cCg6FjaOZKNQvZ2qjtlTQgjqn5OPzn7jOly7?=
 =?us-ascii?Q?jUzuQdzK5li7/wqeQ9RX05yJHM5445cNT6HwcSBTjSA7pKGM/r1av3Ud+URE?=
 =?us-ascii?Q?rzGSPpT2sfCWe6Vti4+b4ibdW00tBynhBHiNGjlI5YIUM1W+RnMAI+c6+gbc?=
 =?us-ascii?Q?vlPuz+AGbikT3cpB98XkaA/wTg+kQv8mednPFAvBCH7wFhcmcY+lM+rvlQdj?=
 =?us-ascii?Q?gn+PB03sWk4PcymxF8zQO5hStJbMBqt4CqGQAzdAZm54iJbRTngMRa0khV+5?=
 =?us-ascii?Q?OlzFJ+VBy05OvNiBals8nwZz/ozMpr13/2yRdIPDjw2apwcI+1AQnyAIWIXM?=
 =?us-ascii?Q?F4P1xzou+/o1gXJmAz7SfqSeurkcT9VcJ0kR+zDbN2Uzk8QcG14dWtAIJhVa?=
 =?us-ascii?Q?KC9v//fc8rz+DiNYmH2KKw9hTLDhMZb+O7OA2X9rNao9wuiGP2DcMD1Qyebp?=
 =?us-ascii?Q?hIy4d25O7z3AVvU7U1km5BjPwp8foJFG12rG5ZBEWjTqWWw0GpN7xg3T+w92?=
 =?us-ascii?Q?LW69od6ieF5JNnSaOnM09AcVpwKD7lkFCGG4S/f7BIX5EftpZvbJL0CJOxRG?=
 =?us-ascii?Q?I8MdVlyYAXXIqVHRNUlDJojbzAP+yIArC7wEPpVTaWBpYWUJ0WUTbscXoAmj?=
 =?us-ascii?Q?cbuzuI/63ubl5APNlWI4uwU+7Rz6c4XE7fxIKL16vSNdGlrp+FKfDxPGfEsG?=
 =?us-ascii?Q?oKrCcOqSJwgG15OVOsmF9G+qFDxdOuRobPgBGSqffOrBsnZd83n2eg6T+kd9?=
 =?us-ascii?Q?DemqJWNgPxHl/jZorbFl6D3kGDbe+pFDlWIbR1It39fZfFwU/vXN2f9dq3xq?=
 =?us-ascii?Q?PyHPbC3GAkHMs9+6EfruSGAQk+yISiM4ifbjilammP7HoaAYkF+hW+H+XF7S?=
 =?us-ascii?Q?N0hUg0wAOYxfizU6KsG2P4VD9cGBv57J+MIGrQb3m3/d58T/o7Io27+DsXNe?=
 =?us-ascii?Q?To42IE0vR+X7CcDX0/XGBrxedWUK0KJPt9ePjRT1POTDsDGWecGVp8l7St40?=
 =?us-ascii?Q?Iw3BwqIyYGCqZxuF7D+X9nFgUQxBFMipujHTEf8GA8xtZOrtFALQTFHHo7+g?=
 =?us-ascii?Q?tHKB2qM0BOmHeUMy7VyWXW4H7PBY+2Ca9GlWWU4fGDomHQ00UReWMA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HwMd1fqjKxcr4VFYnjUZ/XkzVw87bu39C9q5wqbcA49tmyfm+VaXyVL9E6Ug?=
 =?us-ascii?Q?Ug9orKaSyCfN3E/G4A8RGexXUEnndIF1BkN1zCb5nQVF10lvW0PfpSestAcw?=
 =?us-ascii?Q?J8WJhuMiLHFA2RSO9JqrjEFNyT/XwgXgYMHl34OqAJuws/H/nPrI7qvXNCGP?=
 =?us-ascii?Q?zACpw2F99z+KVGDJ/jzrsUOxmBFXNsOUXubGIwtMcc2CInZEu8edlpfiE1aX?=
 =?us-ascii?Q?Na2k2s9ieAFbKaV3pNJnjIgXYcAg98OJ8lci+wIpHyYwGy21xoziNev/eoUo?=
 =?us-ascii?Q?OyM3k/nBJHFCiBCGij/gNu5ajE9Uwwl2H3bZDaxzmO0Ko07UyLY6jiAiaJYo?=
 =?us-ascii?Q?zoL35OA5+d7lpwn0FxZUqOxmRoMXaFu7z6vXGaXs9rjuNnPm4e3cVClSxFSe?=
 =?us-ascii?Q?1uXLh7Pd/mH1dT8llb9Bq+MmytHeUhBlQ+lqmvq7+s31rAfj/kGNxareay0O?=
 =?us-ascii?Q?VC0ZCVo9sjf9nU7VeUtI0dC3JzdwYFBAgMN+Ltb9Msio1X/1Cmi5B4knDUP0?=
 =?us-ascii?Q?1PTzoj98Uo9bfi2d2NrZAmyqlDiqM9Ex8fZQsYriqSYpHxmkmbSV0UxRHelQ?=
 =?us-ascii?Q?iLauEJqD7aMA8TJqZUKAxTWbCLtJ3pHwvtxrLM0tfbTL5Pe5LLouHyMBP0ZJ?=
 =?us-ascii?Q?GsQMvWhGr2+N9Rto+RlzYpxSbqhuBoPYa7rTLVlDXSUpfbO3TjQbhcUjjYkK?=
 =?us-ascii?Q?9YYJJxZrQCqnhl/OKMUl8+1ee6TxzO6IEBvALOO7Ye1uWUKHAFfzscLwVyYy?=
 =?us-ascii?Q?sC7NXEToV4he6+wt22fAXlXTRLeJ5dF0LyFOLLEsYTdCbB8afsrXoFbPCr67?=
 =?us-ascii?Q?hoZRlmCa4G+wdig9GjpGZ61o5Wf75WXmBImt/mS/Q/uRPcDHbrX5ZwLBBqUK?=
 =?us-ascii?Q?7op9rGdRrDRGgjIRRhWkzqjzcPWpFhaRJzB9Z6p13+DmXviAvpY2T3adt8Nx?=
 =?us-ascii?Q?5EjQ0p+Pr875MJ96l0pT5JSQPxutFeHRcDe33XNdo9sjogIyAkHrv2vYcqhW?=
 =?us-ascii?Q?si3MfBYFHEi4Dce8vil2ZFoGta9tlrRoUAgqFI9GLtRW8oNunPlK7pBb/V/w?=
 =?us-ascii?Q?2DNcDyTaOA6yuJlT85TPnXbNGrihflODcFkxMG8sXfJpcNw2mYpoLrz4kuZ8?=
 =?us-ascii?Q?pqFDi0QiC0qh8ylmH4UJGYIgL9Hz2hNqSKiQ8sthC0zFlaC2IyKC57ruZ/fA?=
 =?us-ascii?Q?j2lxNvTZAQ332p89VIJyGlNvI3BzvjXXhRx49BTqwsL/iVNpgShiDpxrN2Cb?=
 =?us-ascii?Q?lh3GQC+1kQpuFjYc4ImDwzueMzNUMErutliqWM1+wZZ82rgjnabGBFECAULt?=
 =?us-ascii?Q?KDwI8TRJSPsv0ltsB8GfN26NfnSyx0RK03qC4oz2246uXGct1lBSnsBP7Oay?=
 =?us-ascii?Q?vDHLVOQl0szZQcRtbkT8F+m51Hi//bzDVRU6MbQgS7xeoXjEQEMi/qXMZgH1?=
 =?us-ascii?Q?/fJufVZIZqg1ML/AlAbA3E3PJMpbVZ3YeqnuS10MJaOtHbz4kjLhA5UNHvLx?=
 =?us-ascii?Q?i6Nm+XZnIjMLPEb196Uv8w9elfMH9slsvTqmz/6w28Xuh1EbGNhYZyLugz2R?=
 =?us-ascii?Q?zx2juxPQwG1uo7pvArY4wz2H+7TqTMKrmz7rZ+aS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bfe530-8fb5-45bd-8ac3-08ddd0cbc345
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 07:19:33.2031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3seb63U+vi62sbyYmmgjPt09SJYxv5C7IPiKG61CoJakGC4zf5murjF4laXoEVNbxv+YC9VoTXX6EmigKka3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7089

Some of the PCCs on i.MX8ULP have a sw_rst bit to control the peripheral
reset through SW method. For peripherals like GPU that need sync reset,
some delay is necessary befere & after release the reset to make sure the
HW is reset into a known status. So add some delay before & after release
reset.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 - v2 changes:
  - refine the commit log at 75 char
  - add a readl after write to make sure the write has been done in
    target register
---
 drivers/clk/imx/clk-composite-7ulp.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-composite-7ulp.c b/drivers/clk/imx/clk-composite-7ulp.c
index 8ed2e0ad2769..37d2fc197be6 100644
--- a/drivers/clk/imx/clk-composite-7ulp.c
+++ b/drivers/clk/imx/clk-composite-7ulp.c
@@ -7,6 +7,7 @@
 
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/slab.h>
@@ -36,6 +37,9 @@ static int pcc_gate_enable(struct clk_hw *hw)
 	if (ret)
 		return ret;
 
+	/* Make sure the IP's clock is ready before release reset */
+	udelay(1);
+
 	spin_lock_irqsave(gate->lock, flags);
 	/*
 	 * release the sw reset for peripherals associated with
@@ -47,6 +51,15 @@ static int pcc_gate_enable(struct clk_hw *hw)
 
 	spin_unlock_irqrestore(gate->lock, flags);
 
+	/*
+	 * Read back the register to make sure the previous write has been
+	 * done in the target HW register. For IP like GPU, after deassert
+	 * the reset, need to wait for a while to make sure the sync reset
+	 * is done
+	 */
+	readl(gate->reg);
+	udelay(1);
+
 	return 0;
 }
 
-- 
2.34.1

