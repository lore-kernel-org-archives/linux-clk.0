Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013054.outbound.protection.outlook.com [52.101.83.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684C43E0C57
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779182228; cv=fail; b=Sg10IfmZMOVb0eRyskV+9RGdVMwCBtSB5Lt7YQmmpQ6LDmX72E0LdnFkhYaCWEthXBxcvzParybOoav1qaI7uJt+05WsLzLYfA9VRodwywDYOLTr8S5PdBfofJld/s8NT8ZTbQSUylmwiVSVb+20se4lUXmxvVNO5ViocycpNQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779182228; c=relaxed/simple;
	bh=j9ylyrWJorSM9if96OTFkI6gxqHLqmxq/5hPUIOvt0s=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=HyKyQr3lccAY5ixgKTk7wcjwBCBp9KVUsLyp+bs9CG677PypDDUZWfKPUYqrId29N+sg0TiAx+kBJS0RRGawOdSiGAP34Q7tK6dlk21AWkZn5Dq9ojdJvmBaPWOjBJJ+Ef9vtkhh8ZOXwbUCtFuTaNSFC0ihpDec1BJUhIH8Obo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cRADPzuU; arc=fail smtp.client-ip=52.101.83.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cRADPzuU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzgkReqWbPmWSdvqOkVdfX5wvuuSSRycyHUNvUIu6hLzu0WhcJclpCQbDZVQpMzHbNaZl/DDcz/z/F6MqD24ds+2NiPw00tl6zyL3g3tcvFxKmPoVSnKLZCI6Pn0CbfmAqFgEvDeJZ5q/QzOiYrvxamxFoy6aXnhNJGIXRUl28k2G2oFtobdD4HVX3wYIVrH4lSOqw2e0yrzV40gxAZiOb44zd/7xjGA+skUs9IxcbYI2/WPd/ha/z23Nt5Y7uPyl1wwAPx4SU6ZnlsHHSU52DtVC5vNMKTh/xeNI2Mz2jUBafdBT6kW+LPpieI6glP7rgLqcUpS0IEy89ESUr++Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0kkTptQexzAPoXWTkOTOvi7rZoHtCxRdSTU+/xBQzY=;
 b=XEx94bjZnGtj2b7ZnhZO4xOTPl+yekK7VhxCFP7+FKD4iQf0SVD6brVjahknzl/U1369SZOE71/CpLDHVBPK+UA5tDIl42DwEo1QnFFvrv/s0xx6AgEM992FHQ/titnUbVYO6qaAcyPhzqahePguY+HCNOoKnBRtqlk2igijbLoxXW/OBaslVa/OLzGLld1cqevnAH9jWfizNmgZxoLmcqInoKEczwCSXyizKzn/2ylLE0QjTh6qvT2VNucSs/vRiQJrRAXx+HHKcToH6fi8gtvvnqohUQ9KUDg2ungpWihN9vtyoft9+vg6WN2f/FvwdKKYYW+QTtz1Cf/tDev8BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0kkTptQexzAPoXWTkOTOvi7rZoHtCxRdSTU+/xBQzY=;
 b=cRADPzuUdHjjz6txiQ29B9JO3l8V3a0dAwPpfpi1WYLfSgDi4NqjcXhhzq/VDg4gONag9ex8kodk6jJasUy1VBPdI9LGsvEfS8R5IGFbMlEk5n1y8wFe6Y+zUSRlEd9lbcdRK382AiBzkuiHAmf0qPGWm9wb42e/QFOOuVDEUbp2OMkk5AeRjqyCAuRy62zjaj4KxwG5/DkVGeaM9ajeS7+SgZqIt6P67D10yvWZmSIe46uqCiC5SheQlHNiML7uvSwOwwey+pUDQtiLsKtF5XxlkPLFc2GpVOpSYmg/esaKCd4zQYgAFvqJB+HdaPGNVK7VtUptzcfA++6ajwRaBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 by AM8PR04MB7475.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 09:17:03 +0000
Received: from VI1PR04MB6861.eurprd04.prod.outlook.com
 ([fe80::7f96:4bde:2e55:cd5]) by VI1PR04MB6861.eurprd04.prod.outlook.com
 ([fe80::7f96:4bde:2e55:cd5%6]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 09:17:03 +0000
From: Jacky Bai <ping.bai@nxp.com>
Date: Tue, 19 May 2026 17:19:18 +0800
Subject: [PATCH v2] clk: imx: Add audio PLL debugfs for K-divider control
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-imx8m_pll_debugfs-v2-1-20e1d88526b0@nxp.com>
X-B4-Tracking: v=1; b=H4sIABUrDGoC/22NywqDMBBFf0Vm3ZTMkNrHyv8oIo2OOuCLpA0Wy
 b83tdsuz4F77gaenbCHW7aB4yBe5ikBHTKo+8fUsZImMZCmXBtCJeN6GatlGKqG7atrvSKTN7q
 11uZ4hrRbHLey7s17mbgX/5zde78I+LW/2gnpTy2gQsXIxlhCy1ddTOtyrOcRyhjjB1d5NWawA
 AAA
X-Change-ID: 20260421-imx8m_pll_debugfs-246d0fbbb617
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Jacky Bai <ping.bai@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779182399; l=7846;
 i=ping.bai@nxp.com; s=20250804; h=from:subject:message-id;
 bh=j9ylyrWJorSM9if96OTFkI6gxqHLqmxq/5hPUIOvt0s=;
 b=LQUwpsonM7p7+BA5BdQIQzRE+ryNI/rE8JmFhmyPmjnp+6qOIw2m1+JrlwAc1Kcpkm5jgSqLW
 OwpmGKR3KL1AlSeTp+a8xn8s3cQB1kT/V4SqroRKP6vDxpqQfsT3Ub7
X-Developer-Key: i=ping.bai@nxp.com; a=ed25519;
 pk=ckFjCfRynXBjQGmSmzOVI5hggMD9XnnNlwj/jcO/j1U=
X-ClientProxiedBy: MA5PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::8) To AM7PR04MB6853.eurprd04.prod.outlook.com
 (2603:10a6:20b:107::18)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:EE_|AM8PR04MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ec65b1-9a77-4cb6-1238-08deb5876389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|52116014|18002099003|56012099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	sajWqcFY6btsX7EeP5gaeRZ7HRJ+HQNYbbaZO4e0kc0TDiOcbyJtain7Xwu+7yKbX1GzSDy4Phs5OGUCjbqNGzP2i3LBYWAy+djfs4l7LDvAkMPSWvORj8d4kiWR0xQarH9ffA+jxe0hN7WF2ugAZMf6tr2jyjBQ+ZKNfFtKatuvuikJvNgVZPL33/INdIkqxOgU0UnhOASGavIsI8EzZ16itsotbV9SoGu2Hb7SgHQJotvfYQY6ul/ozUe1cXme5WxbUHoL2jkVfflbmIsWfRExK9ae9+GX3OVTBB6pRHJfNBjiCgT6IqumJwSYeauxkNDLI5ItfivHkysXZ1EVNSjO/x8bjPgRji2bK4gAPI76u8Uki0FZmVL32xt/vf2AABoZDSjZlb4/jbTndYgnw0zzz8r1htemKK/LqRZiXH24gUca/K02hUfS0pwh10lHqaKEhteJNKrrKWbydyJMBgfl9BA1bdidGEl3/4OOaYE/uPjMKGkTii0pGZGMA2P4O9NRkPfWWBTlzELm1KicvnX4jNXsSe+Ksvbgc34aBZXo7G3Ty3o7bUn1k3lp2WySGRy3f2vp8IqHzg/a99gvPEJM/rngEroHR2IAKNUNzHQYs0pOKgnBxEFCEdH9sjgoBdpxKk+fJg8s07z1GYvSEZf/uzWxElPXKq/PZkm88DF8/BG+h+wyRWjhsUrQ+tim/HNv/bXorKBmLJ9fZ3GqvfLj0QGAQaKELDuzWnJb38WmR+kQEmdauzAiA2tmRm76
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB6861.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(52116014)(18002099003)(56012099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVpqMXROejdxWmJnRys2KzkxVDBZYlhaNnBBcWYrNVBmNlI3bWZNUms0dTdZ?=
 =?utf-8?B?YWJ1Mk1TYmdmOEIyVU9ZOHpvelVXbGZBQVU0UVpHME1FbDV3NW1kcmppSlN0?=
 =?utf-8?B?dU10Ull5cWh1NGRuMjBGdWF2WGlKTGsxRmsvNjNHdGJSbndEVDcwYS9KeTdy?=
 =?utf-8?B?cHI1TGl4Wk1xNmRpTS9rNkZJV3R3MGRYZUtFeDdqQjcvUGxrSTRPa1ZzTHZU?=
 =?utf-8?B?eEQzRE5Wd1RIRXowcHMvdkFyWjhTdzByS0lQMWpwOFFPOW5pZDYrZEdhOW5B?=
 =?utf-8?B?U0h3NXd6RDFVVTNOY245ck1CemY5MmFIQVdVbGRPWUFrRGRTbDVTZXRRcVNy?=
 =?utf-8?B?WEFEWjI4UGdPSTV5WlRFM2hlUkczZGhJd3E2eDY5NENHWWpCL1lhSHhzdVhH?=
 =?utf-8?B?dFZuRGxQWWM3ZFFnenNkdkJEZGZQZkRuOWZxbkI5dmp3eTFrMU1STEVSbFNB?=
 =?utf-8?B?emU1UTRjTW14QmtOWFIwRnI2SGFnS3BMb1N6dnRLdUs1eGpnaEdkWmxKWUpD?=
 =?utf-8?B?MnYzTGxaTnczRTd3SngrTlVEYlNXRmlXTlpOMUxXT09ISURyb0gvbjVkTVgv?=
 =?utf-8?B?cHBvOXhxcW16L1JOL1IyMkFCeEFNWVhpWWM1QUNRdTJKV2JycDJzaWg1Z01L?=
 =?utf-8?B?ZzlqWm9ENnMwK2RiSkM1N0xVL1Q0dmJ5SVcwdEVsZFN2Nm1jMGcrV241elZO?=
 =?utf-8?B?Ulh2MnZiNmtNc2ptWXZuWVBPM1JtQU84TWllcFErVHU3SmZkU1ZCeXMvcDA2?=
 =?utf-8?B?TVROamEyTFVING1BR3d0TmFIS1NtUkpyOVFNdjU1YTlPUk5NN0JDcmsrejl1?=
 =?utf-8?B?NlhYQlAxU0I4TUl1QWFrcGpVNHdhUzRIVy9lMUZMWlBIVHpac21TZzdiOWpR?=
 =?utf-8?B?aTJyOU44aC9Ia1AyTzZrVk9wdTVkMFMyLzZKRkc3Qi85U2dxbmV3VnVEVG5H?=
 =?utf-8?B?dVU4b291WTNsUGhXOXpEM21TZWl6djdvR1NBdkFuMGtzaGc5dmxUYnk4UDhz?=
 =?utf-8?B?NDI5elNKUE4wejQrVHIraHduWjJOOEhhNkoxekNXWmVZd2JMNWcrb0F3NXFT?=
 =?utf-8?B?TGtEaU5tUXllb1hhYTR5MzJXY0U1bXhKRVlvV2YyK25KYkxIUHJLY28wZlV4?=
 =?utf-8?B?eitRYytaVjU4WVVjNzNIZlc4dkZocFBBUzg5akpJQitjbVVlTk5Vam9xR2lV?=
 =?utf-8?B?eGVaMWIrY2UxTS9SWTZ1cXNqNVozaHNxWGhEaVB3YUgwcUV3OWJxSEphRHE1?=
 =?utf-8?B?ZzdIZHVHNEFxbzFMNkY3bDJQMEhpMVdjWmd4YVoyZHR2NFI5bjFkUWlZKzd0?=
 =?utf-8?B?RzVyVG8zYlNzSTg5ejZINzFOMUJqamVFb2kvWndQb3YvdlZEc0JnQ1N6V3F5?=
 =?utf-8?B?emYrVXJtdkN3YlB2SEI4dE1OVW9sV3BPWGZJRjBBdzF5R3lRZ1lCTlo2TGp4?=
 =?utf-8?B?Z0JSR3A3bFd2Zy9lWVEyTG5wUGFGWDltaFlIdUx1OUlQN2Ryc3NJakpZL0xw?=
 =?utf-8?B?anRTTmdZTnVZeVRzZXAzQVA4TE5yK0NNOVRqTkJsNFFYUHRPNUxnNGNMUVkw?=
 =?utf-8?B?b0o1NVJZMlV5RlhlTUE2M01lbXNhZUltQXNuM0pqU3BJQTVtWXFLdU9qTm5B?=
 =?utf-8?B?QWFEdHhVUHZvRFpMWmozcE5VYU9Sb0ZodloyeFZHSWJJZnB5a01iWlIxWS9P?=
 =?utf-8?B?cUk4elhmaTZFQWNjYXlSS2NIRnRRRlBZMUFVek12RkZSYkYrL0RZS0VMSlhW?=
 =?utf-8?B?ZTUxUzF3Ri9oeHQzcW80bUJxRmhmVnMwMDR3ZVRzVUdsYnJreWVCTmdWSFhl?=
 =?utf-8?B?NWloODM4TGdtWFVBcm1XT0FNc2J1cmZ2WUFnY1pwV2lQNWdKbEtScktlWExJ?=
 =?utf-8?B?S1RvOElxYkxUTUx2SkdPaUdVS1lHcUVoUDJsZlJmaC81bjlMc1BwNnJITFNy?=
 =?utf-8?B?b0tFWVZrU09HUUhhU3QzSDgxdFQxMk41L3g5U1NrQ3hicEJLWTR4NmJrZjha?=
 =?utf-8?B?S1A1SnFiTTkwVkREcDY4NkNqb0hKaTV6WHZ0ampkY0lJVVBUcm93K2tickJn?=
 =?utf-8?B?OWQ1bnpDVTROcUc3SlRIQzVvRXUvRFBtd0tGNnpkOExDNFhGZXpmRTg1YjZo?=
 =?utf-8?B?c0xWZkdDbTdOSVhkcGVEcW9jRnMzeFpPTVZuMlVaU2hDRE5uY25oSmZsMkR1?=
 =?utf-8?B?dDNLM0VqVzZsZ1lSNDVBTWQvNDhMV3JaQXJkTXgwenZIeS91ZlNBamlHaGRZ?=
 =?utf-8?B?RUViejBGS3BPdHBSdWp2d2ZwNDJkME0xbEVyd2dLQ2FjTHJRUittNU9YUjlt?=
 =?utf-8?Q?i9ClA4bUq3SsRbFMWg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ec65b1-9a77-4cb6-1238-08deb5876389
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB6853.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 09:17:03.4114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqBd2pscpbjK3mNqGoamRpiTOdi4GBXjYfyaY2UjMASUzEXiWRMqdKl+OcUKBy6wCNfiurhWz4jJdeTQN2TIUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7475

Add debugfs support for runtime tuning of the audio PLL K divider,
which enables fine-grained frequency adjustments for audio PLL.
This is used for:
  - Audio clock calibration and testing
  - Debugging audio synchronization issues

Two debug interfaces are exported to userspace:
  - delta_k: It is used to adjust the K divider in PLL based on small
    steps
  - pll_parameter: It is used for get PLL's current M-divider,
    P-divider, S-divider & K-divider setting in PLL register

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
Changes in v2:
- remove the examples from commit log.
- refine the comments blocks
- add delta_k read back support
- resolve the comments from Sashiko AI
- add prefix to audio_pll_debug_init API
- Link to v1: https://lore.kernel.org/r/20260512-imx8m_pll_debugfs-v1-1-e1e44b21be90@nxp.com
---
 drivers/clk/imx/clk-imx8mm.c  |   6 +++
 drivers/clk/imx/clk-pll14xx.c | 107 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/imx/clk.h         |   1 +
 3 files changed, 114 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 319af4deec01c188524807d39dff92bbd08f3601..f080a4dcead359f9494b289ebd277ef2dfdf72cd 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -298,6 +298,7 @@ static struct clk_hw **hws;
 
 static int imx8mm_clocks_probe(struct platform_device *pdev)
 {
+	struct clk_hw *audio_pll_hws[2];
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
@@ -610,6 +611,11 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 
 	imx_register_uart_clocks();
 
+	/* Add debug interface for audio PLLs */
+	audio_pll_hws[0] = hws[IMX8MM_AUDIO_PLL1];
+	audio_pll_hws[1] = hws[IMX8MM_AUDIO_PLL2];
+	imx_audio_pll_debug_init(audio_pll_hws, ARRAY_SIZE(audio_pll_hws));
+
 	return 0;
 
 unregister_hws:
diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 39600ee22be3066683b562aa6f2a8b750d19c4cc..b00529cb196a22ad0444b1efdbc3b53d0e11c20b 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -8,11 +8,13 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
+#include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/jiffies.h>
 
 #include "clk.h"
@@ -40,6 +42,8 @@ struct clk_pll14xx {
 	enum imx_pll14xx_type		type;
 	const struct imx_pll14xx_rate_table *rate_table;
 	int rate_count;
+	s16 delta_k;
+	spinlock_t lock;
 };
 
 #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
@@ -361,6 +365,7 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
 	struct imx_pll14xx_rate_table rate;
+	unsigned long flags;
 	u32 gnrl_ctl, div_ctl0;
 	int ret;
 
@@ -374,9 +379,13 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		div_ctl0 |= FIELD_PREP(SDIV_MASK, rate.sdiv);
 		writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
 
+		spin_lock_irqsave(&pll->lock, flags);
+
 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
+		spin_unlock_irqrestore(&pll->lock, flags);
+
 		return 0;
 	}
 
@@ -394,8 +403,12 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		   FIELD_PREP(SDIV_MASK, rate.sdiv);
 	writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
 
+	spin_lock_irqsave(&pll->lock, flags);
+
 	writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base + DIV_CTL1);
 
+	spin_unlock_irqrestore(&pll->lock, flags);
+
 	/*
 	 * According to SPEC, t3 - t2 need to be greater than
 	 * 1us and 1/FREF, respectively.
@@ -508,6 +521,8 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 	if (!pll)
 		return ERR_PTR(-ENOMEM);
 
+	spin_lock_init(&pll->lock);
+
 	init.name = name;
 	init.flags = pll_clk->flags;
 	init.parent_names = &parent_name;
@@ -551,3 +566,95 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 	return hw;
 }
 EXPORT_SYMBOL_GPL(imx_dev_clk_hw_pll14xx);
+
+/*
+ * Debugfs interface for Audio PLL runtime monitoring and control
+ *
+ * This interface allows dynamic adjustment of the Audio PLL
+ * K-divider for precise frequency tuning, particularly useful
+ * for audio applications.
+ *
+ * examples for the usage of the two interfaces:
+ *   1): Get the current PLL setting of dividers
+ *     cat /sys/kernel/debug/audio_pll_monitor/audio_pll1/pll_parameter
+ *
+ *   2): Adjust the K-divider by a small delta_k
+ *     echo 1 > /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k;
+ */
+#ifdef CONFIG_DEBUG_FS
+static int pll_delta_k_get(void *data, u64 *val)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(data);
+	*val = pll->delta_k;
+	return 0;
+}
+
+static int pll_delta_k_set(void *data, u64 val)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(data);
+	unsigned long flags;
+	u32 div_ctl1;
+	s16 kdiv, delta_k;
+
+	delta_k = (s16)clamp_t(long, val, KDIV_MIN, KDIV_MAX);
+	pll->delta_k = delta_k;
+
+	spin_lock_irqsave(&pll->lock, flags);
+
+	div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
+	kdiv = (s16)FIELD_GET(KDIV_MASK, div_ctl1);
+	kdiv = (s16)clamp_t(s32, (s32)kdiv + delta_k, KDIV_MIN, KDIV_MAX);
+	writel_relaxed(FIELD_PREP(KDIV_MASK, kdiv), pll->base + DIV_CTL1);
+
+	spin_unlock_irqrestore(&pll->lock, flags);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE_SIGNED(delta_k_fops, pll_delta_k_get, pll_delta_k_set, "%lld\n");
+
+static int pll_setting_show(struct seq_file *s, void *data)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(s->private);
+	u32 div_ctl0, div_ctl1;
+	u32 mdiv, pdiv, sdiv, kdiv;
+
+	div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
+	div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
+
+	mdiv = FIELD_GET(MDIV_MASK, div_ctl0);
+	pdiv = FIELD_GET(PDIV_MASK, div_ctl0);
+	sdiv = FIELD_GET(SDIV_MASK, div_ctl0);
+	kdiv = FIELD_GET(KDIV_MASK, div_ctl1);
+
+	seq_printf(s, "Mdiv: 0x%x; Pdiv: 0x%x; Sdiv: 0x%x; Kdiv: 0x%x\n",
+		   mdiv, pdiv, sdiv, kdiv);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(pll_setting);
+
+void imx_audio_pll_debug_init(struct clk_hw *hws[], unsigned int num_plls)
+{
+	struct dentry *rootdir, *audio_pll_dir;
+	const char *pll_name;
+	int i;
+
+	rootdir = debugfs_create_dir("audio_pll_monitor", NULL);
+
+	for (i = 0; i < num_plls; i++) {
+		if (!IS_ERR_OR_NULL(hws[i])) {
+			pll_name = clk_hw_get_name(hws[i]);
+			audio_pll_dir = debugfs_create_dir(pll_name, rootdir);
+			debugfs_create_file_unsafe("delta_k", 0600, audio_pll_dir,
+					hws[i], &delta_k_fops);
+			debugfs_create_file("pll_parameter", 0444, audio_pll_dir,
+					hws[i], &pll_setting_fops);
+		}
+	}
+}
+#else /* !CONFIG_DEBUG_FS */
+void imx_audio_pll_debug_init(struct clk_hw *hws[], unsigned int num_plls)
+{
+}
+#endif /* CONFIG_DEBUG_FS */
+EXPORT_SYMBOL_GPL(imx_audio_pll_debug_init);
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3d1b7c1b4bf65e2329831832b43a5..16e0bafa0c9b99cb4eee37a216e0a274d27f11fc 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,4 +487,5 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 			       u32 reg, const char **parent_names,
 			       u8 num_parents, const u32 *mux_table, u32 mask);
 
+void imx_audio_pll_debug_init(struct clk_hw **hws, unsigned int num_plls);
 #endif

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260421-imx8m_pll_debugfs-246d0fbbb617

Best regards,
-- 
Jacky Bai <ping.bai@nxp.com>

