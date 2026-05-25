Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615941F30A4
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 01:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673304; cv=fail; b=L/mYlJVwxl3N0wx1LXiVHP5dbXEqq6kcZwToxWgoiuDcrx/IzmWuZ7Vw21UAuvOcQCAHyrOwSSyy34qPczDWiV4c6Q/70pnD5wP9rTTkA5aITKMoeyET4T/jRW3cbY7J72HlS0QaZLHxucT2iMird06ORQhgR5VEQvOQRMdO7aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673304; c=relaxed/simple;
	bh=Rmx4erXem9Zny2oOsfaz3Jul5kwbTyrMjQ51MhhlW20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LzLpOgTpKJhWlqMZIAGdCf8QiVPeu3zb7bDI1MD6XNwyixV2scgpMNgyFSgxejSyV7H8YrC4HFLFbSo6mafE/c0oaKdzTl3ShrKQPZbxkIkc1D9jZRHJUjhLIdUZTdi8G4G3upYnr/njD9e7O96ihu+zPRyoN66Q7MOWTM4zu6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kvD01dmk; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kvD01dmk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RS43LTlc7JqN+154hhESOFezUAkkez1V06YPk7a2yaYiIwDrXEu1Eaj30dQLdwiSBuNOrh2ys4KNaoDpof+dw0Nv+b7MIVsCLREPwyB9WFS4tkiGs49jAJgZsSM0X3trouqnrO8WbZ4cDWORF0WOIB8VKFN2NhwA5gKtHkDDGjoOt5GbPMwBF06tc+oYYA80c92gUpibzg4rfwEyD8fiIBEVZilSCJX5YJ5PI/F5PNH0tl1SS1gilzhm+b6aXeO3qBNJ87sSQXyQpZBpAJI5957xtGSD0HY7UgJtlFjjLeaMKCcDtUff3p7o0u+H3iyVWcX1Kzc6HVKdyPuEg1cCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmCa4YJqV79TokVIEmUBWUGnFnVuhrXKEls6KmxBbBw=;
 b=UM9wOunBU1bWqrnYFb2D2mUP56BUu7tdg2b1DE2kfda+XV0fXp/q6ynQ284UFBBjSkyglD67r/EAJLE0VRpi3XzpTaQy+1BUNqsAjfGq2Ykz/AlgZ1giKh+eKfQtAm1TztzWeEH8PMvqeXomiAhdLaskEc4QTuTHc8X1QwixLoVzMuxWoFIbnXp3nvMYEBCde48O6o80dvsL4wZNnrv1Jk2Ucyhejwbt/ze1RvSwWTxEVVxKgTRCE1EuKoyPeOJkEdazCTuHoz4IWv46mAyegDyNAz9WVUZ7thnaDsRbOD1zFhhChJB8JRryhj0OfahK9OIyXuKhdxehlClr9+xstA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmCa4YJqV79TokVIEmUBWUGnFnVuhrXKEls6KmxBbBw=;
 b=kvD01dmkDTNkQeckUnMi9rZU9XiQfQxTNYBlp7wxO7resEFDqwYnJxg7kcLOzok53vTejYYxB8nAhpOdd4GE8f7Lmaj9T2ajk1jDFk4mLxOrhelVQEDYB06xgW3+ztyEkGIyZThOEM/B9iHt0udyY5yPSvMAUS0ECJ0K+zTa7s09L8u1qoAaLPtNzBX6hVwtpq4zAK3OEE4GSAho0PXpFmZyJjxjZPHpbrtQEZBZ7O1IdD9Mi/UtYYdth2q91ItYkZhm0aQPRsysyK7PKeC96hzqzqySls0OOhdxEotrCfEYsmHwlU9956VwqP3hzjvXOVtEzJM9jqf5Yx+LCDvYdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by VI0PR04MB10736.eurprd04.prod.outlook.com (2603:10a6:800:25c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 01:41:38 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 01:41:38 +0000
Date: Mon, 25 May 2026 09:44:30 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] clk: imx: Add audio PLL debugfs for K-divider control
Message-ID: <ahOpfhw/UaXoILzE@shlinux89>
References: <20260519-imx8m_pll_debugfs-v2-1-20e1d88526b0@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-imx8m_pll_debugfs-v2-1-20e1d88526b0@nxp.com>
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|VI0PR04MB10736:EE_
X-MS-Office365-Filtering-Correlation-Id: aea3aa09-201b-4134-2c7c-08deb9fec31f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014|22082099003|56012099003|18002099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	krxH6JgnhkfKETIcr/rIY/n/JOfp7whV2Y8ZLJ2lYdw4FwQCNBpiiiGkfNCEPAc3273upwOViCdQhBS7/fEWW+CriKpPuSuu2uyFtQOJx4ZmO2B4vdjntjie9SpGtJ7PfljWwgXJKDc/AFetUYFrMicTgOFsqEUfT2sikdX/oLRTvdVequ9SfiEXOSL7ExHBFTE1cOrQ5hYN8e2ZfzBpeujepXBd4ujUs+UQW3Ex5N6ppOXzt5IgakbFqZ6v8e1uD0nE5aP3Fu28Dyv1IWNzTtxLqc1gieDTTSh0+INKGPz9va0+sQ1VWB17e6+f9h/2hehjHpVI9XMBU90UsBnOgmCjBiHWAG3cIfHKYda/i/PsW3GUpOujM7423/mXhQ+BwVOWvxJK3fyRTcMxCI3WCxgb4C1kI96GZQU6iL3+Ja2TxK4fO2l8Umi9VUtXjlMQIP0QlCcXofO9PmSD+OJIMi8w+ZOTnk7VcGaSPkyNXgczKqPA2ht9vyxVkWFTaAPGMFay+WSd2fEAJSEiwdJF8tSN/i2Di0/RDt4I/OU7urLZyfLDD5ChN9m8BwFBpxUnPCiHbBPw1F6a0OUqJYR5zpyasVpD05l3NYbdtqq7ruHTGObjG2etTPgMJBeDGPJschi+3EmBQ8H/tsYKgwqFD+i5cuKmxSuAEpcGVS/zYcJCxCU57Xg8HcT/Nv9HHAuJE8hM7jT3uQwmsl2+bL2J7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014)(22082099003)(56012099003)(18002099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/rkcif/xrD5CLnURnueRqQOz2BVJtbJ5lXwjVc+Pp/WsgIz3GZVa86/nKuKg?=
 =?us-ascii?Q?i+bQraZIaQbX49AN3Y4l7ozI/A2ekIwAdDntgrQLriGxJ9EHhyQ729jwhl8T?=
 =?us-ascii?Q?oCrMnIPpw5j1hHTKgkaG5fxvf1YhUL38zy0IJC+jTAtBGIgOSBy64k28rUEr?=
 =?us-ascii?Q?wSIoRudQ+8iT2x8BwjHxDUHPgwRnTN0Z9HjtLabBVpJyxAtolQ2lOPPG/MeV?=
 =?us-ascii?Q?RrC40GAoICaLCmYiVX6RYAml2yvMP1Ba1L6cpkDk5bg0t/vejHtmClsDgW20?=
 =?us-ascii?Q?X5hV/xzJur0/qe7P+SxTR8UBLzJXjYXQT4GbyzL5xrg5RzV39eXVIOnip0St?=
 =?us-ascii?Q?OKl4IJBtPwXRBMyuSOoVHfTdIbZq0e9Se22rARp9cj6NBGruzNrL7MWvqORg?=
 =?us-ascii?Q?LWMXash46mRQU5qUdNpJRaaOUkmR1A2VNBIWKRFi71M3s47wbfC03wZg0WDq?=
 =?us-ascii?Q?wLBVDZMYHKCHQ6i91OwnPUHw/+LTgtx+4lQZzFdG6mZ7hRydvRZ92VnAKVC1?=
 =?us-ascii?Q?AKkgknUJOYCxvm8J9fjjc1Yk5KaT7STHSBtKeoCqsgdGQbFyqGVeGAm9sVWf?=
 =?us-ascii?Q?gI6+gpX8+Yu4qCS0WvE5ijkft0Z+mLpig+bcSSV0wCBo+Y/bdpLYhdL1uz4+?=
 =?us-ascii?Q?BoN0xN39e+RYJQNldE837vYJm4wl4VVAiMQ36QXV+34H8umeCI6mSs8B5eO5?=
 =?us-ascii?Q?OKbBoX2J7EauBWjfRkyjDJn3MZVVpm+qb8IVYXU2UIHQR+fhdUKwA0YuN12L?=
 =?us-ascii?Q?+rlvCFuM3qoiWtsXXOjbkdiorDvrReS2xlNpoWgRaQsz07JOYvurcmt3eaK3?=
 =?us-ascii?Q?B7FnoVgjLNtZzO7e9WgTBU5n2Iqe/IC5lKlP3zBMpFEk8YJADuHp+Ov/HHcq?=
 =?us-ascii?Q?VvbHQzSZ0N4aRVS4/p6L84w/MnrNlSz63UPbC+mVqJTySeYEYsrA5PCDwqQl?=
 =?us-ascii?Q?RXXmmv+vH3L+a2v+jzfn5invCmX4dYT2uc4DTsblcLRPhw4OJ/aB2eHt/EsU?=
 =?us-ascii?Q?MTdWgYFitsPghPTfNrtXr1nw2A7MjRDr6stUmd2MLxzqyERnQ/LLLfbLUMR3?=
 =?us-ascii?Q?hhc7TPrhxH8GC6g7PRGTyKcQvOlKoFwPnntF05Biqbttz2jhNNZhl8XqoJ2S?=
 =?us-ascii?Q?7Y3NT0siLGDEac1mFam4oAlj68UeDIPQJldeKYmWJW5Rh+VFEqAsXLOJWngl?=
 =?us-ascii?Q?CEruKGXqhKFQrNfBNs+qkVRTdOfPtsa3/W4N0dF3LrMYeAGLHL+InTuD74jH?=
 =?us-ascii?Q?ootB1/A3lhFP1omH38NX1rlgN/qvM3h2XT7uUVd+ot/ETnNuG1bHdPsRRaw5?=
 =?us-ascii?Q?8FdG6v0+8Qi5aL2w+XyHgJIH3NH7hfAPK+rboatbGK6uJXQuLQfWqcFugiBg?=
 =?us-ascii?Q?/p7EmiQYO+XVUjB5CF+KNb82zca7f2V3RVQM5AW58d659xgViKChYxczeq28?=
 =?us-ascii?Q?NBbKFLh1g9zCB4CYCoLkCYOy6vALIryOMTQJFEAZOxwsDB3YQf9iACzMbkx4?=
 =?us-ascii?Q?OWbG+ncnzdtZyP1/NBzXsnUcwi0bTVkYwaFV0W3qWU3W1bSSsOw/GPU56BAK?=
 =?us-ascii?Q?UODQRdwQvtnywQDHYoyNLuqFagNseBkfk8vXeYbx6iMrp0zdwofE4desKsye?=
 =?us-ascii?Q?Crygf4Qnz1+FAoSk32ezKraDJwjZQQk6VvCia79dn/v7OJrVxCOJ0ZFFmam3?=
 =?us-ascii?Q?MMMxLwp9ZYf5buQ+m76CgIAgqCLOjCW9jCl/sa8xu8VKPsj765mRQz174oN1?=
 =?us-ascii?Q?ylXn+rEw8w=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aea3aa09-201b-4134-2c7c-08deb9fec31f
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 01:41:38.2208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpXwEnjwzBt5LWG4sKvGgaWxnCV9u0ml04TmQiJ1qgivs9uQMz0RhWlL0cCEalZWAnZdO5yWY3IPq+zEpAh8Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10736

On Tue, May 19, 2026 at 05:19:18PM +0800, Jacky Bai wrote:
>Add debugfs support for runtime tuning of the audio PLL K divider,
>which enables fine-grained frequency adjustments for audio PLL.
>This is used for:
>  - Audio clock calibration and testing
>  - Debugging audio synchronization issues
>
>Two debug interfaces are exported to userspace:
>  - delta_k: It is used to adjust the K divider in PLL based on small
>    steps
>  - pll_parameter: It is used for get PLL's current M-divider,
>    P-divider, S-divider & K-divider setting in PLL register
>
>Signed-off-by: Jacky Bai <ping.bai@nxp.com>
>---
>Changes in v2:
>- remove the examples from commit log.
>- refine the comments blocks
>- add delta_k read back support
>- resolve the comments from Sashiko AI
>- add prefix to audio_pll_debug_init API
>- Link to v1: https://lore.kernel.org/r/20260512-imx8m_pll_debugfs-v1-1-e1e44b21be90@nxp.com
>---
> drivers/clk/imx/clk-imx8mm.c  |   6 +++
> drivers/clk/imx/clk-pll14xx.c | 107 ++++++++++++++++++++++++++++++++++++++++++
> drivers/clk/imx/clk.h         |   1 +
> 3 files changed, 114 insertions(+)
>
>diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
>index 319af4deec01c188524807d39dff92bbd08f3601..f080a4dcead359f9494b289ebd277ef2dfdf72cd 100644
>--- a/drivers/clk/imx/clk-imx8mm.c
>+++ b/drivers/clk/imx/clk-imx8mm.c
>@@ -298,6 +298,7 @@ static struct clk_hw **hws;
> 
> static int imx8mm_clocks_probe(struct platform_device *pdev)
> {
>+	struct clk_hw *audio_pll_hws[2];
> 	struct device *dev = &pdev->dev;
> 	struct device_node *np = dev->of_node;
> 	void __iomem *base;
>@@ -610,6 +611,11 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
> 
> 	imx_register_uart_clocks();
> 
>+	/* Add debug interface for audio PLLs */
>+	audio_pll_hws[0] = hws[IMX8MM_AUDIO_PLL1];
>+	audio_pll_hws[1] = hws[IMX8MM_AUDIO_PLL2];
>+	imx_audio_pll_debug_init(audio_pll_hws, ARRAY_SIZE(audio_pll_hws));
>+
> 	return 0;
> 
> unregister_hws:
>diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
>index 39600ee22be3066683b562aa6f2a8b750d19c4cc..b00529cb196a22ad0444b1efdbc3b53d0e11c20b 100644
>--- a/drivers/clk/imx/clk-pll14xx.c
>+++ b/drivers/clk/imx/clk-pll14xx.c
>@@ -8,11 +8,13 @@
> #include <linux/bitfield.h>
> #include <linux/bits.h>
> #include <linux/clk-provider.h>
>+#include <linux/debugfs.h>
> #include <linux/err.h>
> #include <linux/export.h>
> #include <linux/io.h>
> #include <linux/iopoll.h>
> #include <linux/slab.h>
>+#include <linux/spinlock.h>
> #include <linux/jiffies.h>
> 
> #include "clk.h"
>@@ -40,6 +42,8 @@ struct clk_pll14xx {
> 	enum imx_pll14xx_type		type;
> 	const struct imx_pll14xx_rate_table *rate_table;
> 	int rate_count;
>+	s16 delta_k;
>+	spinlock_t lock;
> };
> 
> #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
>@@ -361,6 +365,7 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
> {
> 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
> 	struct imx_pll14xx_rate_table rate;
>+	unsigned long flags;
> 	u32 gnrl_ctl, div_ctl0;
> 	int ret;
> 
>@@ -374,9 +379,13 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
> 		div_ctl0 |= FIELD_PREP(SDIV_MASK, rate.sdiv);
> 		writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
> 
>+		spin_lock_irqsave(&pll->lock, flags);

Should this lock also protect the setting to DIV_CTL0?

>+
> 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
> 			       pll->base + DIV_CTL1);
> 
>+		spin_unlock_irqrestore(&pll->lock, flags);
>+
> 		return 0;
> 	}
> 
>@@ -394,8 +403,12 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
> 		   FIELD_PREP(SDIV_MASK, rate.sdiv);
> 	writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
> 
>+	spin_lock_irqsave(&pll->lock, flags);

Ditto.

>+
> 	writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base + DIV_CTL1);
> 
>+	spin_unlock_irqrestore(&pll->lock, flags);
>+
> 	/*
> 	 * According to SPEC, t3 - t2 need to be greater than
> 	 * 1us and 1/FREF, respectively.
>@@ -508,6 +521,8 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
> 	if (!pll)
> 		return ERR_PTR(-ENOMEM);
> 
>+	spin_lock_init(&pll->lock);
>+
> 	init.name = name;
> 	init.flags = pll_clk->flags;
> 	init.parent_names = &parent_name;
>@@ -551,3 +566,95 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
> 	return hw;
> }
> EXPORT_SYMBOL_GPL(imx_dev_clk_hw_pll14xx);
>+
>+/*
>+ * Debugfs interface for Audio PLL runtime monitoring and control
>+ *
>+ * This interface allows dynamic adjustment of the Audio PLL
>+ * K-divider for precise frequency tuning, particularly useful
>+ * for audio applications.
>+ *
>+ * examples for the usage of the two interfaces:
>+ *   1): Get the current PLL setting of dividers
>+ *     cat /sys/kernel/debug/audio_pll_monitor/audio_pll1/pll_parameter
>+ *
>+ *   2): Adjust the K-divider by a small delta_k
>+ *     echo 1 > /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k;
>+ */
>+#ifdef CONFIG_DEBUG_FS
>+static int pll_delta_k_get(void *data, u64 *val)
>+{
>+	struct clk_pll14xx *pll = to_clk_pll14xx(data);
>+	*val = pll->delta_k;
>+	return 0;
>+}
>+
>+static int pll_delta_k_set(void *data, u64 val)
>+{
>+	struct clk_pll14xx *pll = to_clk_pll14xx(data);
>+	unsigned long flags;
>+	u32 div_ctl1;
>+	s16 kdiv, delta_k;
>+
>+	delta_k = (s16)clamp_t(long, val, KDIV_MIN, KDIV_MAX);
>+	pll->delta_k = delta_k;
>+
>+	spin_lock_irqsave(&pll->lock, flags);
>+
>+	div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
>+	kdiv = (s16)FIELD_GET(KDIV_MASK, div_ctl1);
>+	kdiv = (s16)clamp_t(s32, (s32)kdiv + delta_k, KDIV_MIN, KDIV_MAX);
>+	writel_relaxed(FIELD_PREP(KDIV_MASK, kdiv), pll->base + DIV_CTL1);
>+
>+	spin_unlock_irqrestore(&pll->lock, flags);
>+
>+	return 0;
>+}
>+DEFINE_DEBUGFS_ATTRIBUTE_SIGNED(delta_k_fops, pll_delta_k_get, pll_delta_k_set, "%lld\n");
>+
>+static int pll_setting_show(struct seq_file *s, void *data)
>+{
>+	struct clk_pll14xx *pll = to_clk_pll14xx(s->private);
>+	u32 div_ctl0, div_ctl1;
>+	u32 mdiv, pdiv, sdiv, kdiv;
>+
>+	div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
>+	div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);

sashiko-bot brings a valid concern, you may need to protect the read operation.

[1]https://lore.kernel.org/all/20260519095044.996B7C2BCB3@smtp.kernel.org/


Regards
Peng

>+
>+	mdiv = FIELD_GET(MDIV_MASK, div_ctl0);
>+	pdiv = FIELD_GET(PDIV_MASK, div_ctl0);
>+	sdiv = FIELD_GET(SDIV_MASK, div_ctl0);
>+	kdiv = FIELD_GET(KDIV_MASK, div_ctl1);
>+
>+	seq_printf(s, "Mdiv: 0x%x; Pdiv: 0x%x; Sdiv: 0x%x; Kdiv: 0x%x\n",
>+		   mdiv, pdiv, sdiv, kdiv);
>+
>+	return 0;
>+}
>+DEFINE_SHOW_ATTRIBUTE(pll_setting);
>+
>+void imx_audio_pll_debug_init(struct clk_hw *hws[], unsigned int num_plls)
>+{
>+	struct dentry *rootdir, *audio_pll_dir;
>+	const char *pll_name;
>+	int i;
>+
>+	rootdir = debugfs_create_dir("audio_pll_monitor", NULL);
>+
>+	for (i = 0; i < num_plls; i++) {
>+		if (!IS_ERR_OR_NULL(hws[i])) {
>+			pll_name = clk_hw_get_name(hws[i]);
>+			audio_pll_dir = debugfs_create_dir(pll_name, rootdir);
>+			debugfs_create_file_unsafe("delta_k", 0600, audio_pll_dir,
>+					hws[i], &delta_k_fops);
>+			debugfs_create_file("pll_parameter", 0444, audio_pll_dir,
>+					hws[i], &pll_setting_fops);
>+		}
>+	}
>+}
>+#else /* !CONFIG_DEBUG_FS */
>+void imx_audio_pll_debug_init(struct clk_hw *hws[], unsigned int num_plls)
>+{
>+}
>+#endif /* CONFIG_DEBUG_FS */
>+EXPORT_SYMBOL_GPL(imx_audio_pll_debug_init);
>diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
>index aa5202f284f3d1b7c1b4bf65e2329831832b43a5..16e0bafa0c9b99cb4eee37a216e0a274d27f11fc 100644
>--- a/drivers/clk/imx/clk.h
>+++ b/drivers/clk/imx/clk.h
>@@ -487,4 +487,5 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
> 			       u32 reg, const char **parent_names,
> 			       u8 num_parents, const u32 *mux_table, u32 mask);
> 
>+void imx_audio_pll_debug_init(struct clk_hw **hws, unsigned int num_plls);
> #endif
>
>---
>base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>change-id: 20260421-imx8m_pll_debugfs-246d0fbbb617
>
>Best regards,
>-- 
>Jacky Bai <ping.bai@nxp.com>
>
