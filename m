Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013042.outbound.protection.outlook.com [40.107.159.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253BF14AD20
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580711; cv=fail; b=fqI3mrn6fGyDG59kTEnW0BnkT1UhOhWZL2dzrBs4DxbMBXULznSRx8DabyVGxjoZhIjAiuUazHQxrqqv639lpmNirt783mL+3zE2laacNG7n20JplSO9o69GPTsUf6a4Cvu9LPMnSYNE2gW8cGHlxEJ6SqYjn7eXZooguD4IIcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580711; c=relaxed/simple;
	bh=H117jA4BR2PNtY1apAO8cdoHP5078QwsIe+Xyq8epvk=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=Vyeo5UvYtOMrNUGGZ05Pj9m62u8ncz9EqyZVBtXvNeWQjasmVaJqaQ+DzmqWIhyShbIroIpPybCc6Mwm1hGPFNoD+t51pwObrlhMPNgeLCEl2ZPJ+FgP+bDCPvEtDG2wQmH0y5UbSSGU4eE7RZ1m/ecN30mm61O3AzXBto1dQpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IGCoAXfx; arc=fail smtp.client-ip=40.107.159.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IGCoAXfx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqSXOg++D7OQtty37Y5kxO1q31mHeSdXhtdH7PZ9N8zPZ86qhCqzmbLcvbxcxE3L/tLCfO9uH2jK1UX4XkpAL7WcQNdFXBjuawPd6R+3ut5WEO2CQ57DzxjePNdjQzpMeOOluO40yqfcBs87cDc6JZe2NHjSxS8NTrW1FeU3dD+robN0Qa8uOp2XpvfkUdamg7zu9lBJuzxyrdzU5E0uqcxh7EFtbmSh3StAT7rD5Hn2I7oJyqDQZtJwb+DeBwflNKyVWH6yNQI9BfLelIRKXezHWwt6A/2Du3GOWD4ksPWxjq8i15IbUibtcWzbWRdonF/q6oWU6RdkDH7845kTJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsvQekXfh/W0vjz6GOIP9c+J4h6DC14iT5/4dprLMAk=;
 b=CxOcR3ZjsUpo9GpvL2hkvsTeo5V5L9XZFsZkF6lV8Wlw0bxjGSTlvj99c/bTd4FzZ8qLtgz2jX9zQTiAVHPsFe6wnSPiIuW2JMNWlhWZU202qOWNfgjOjmylifJddOttLwb69saxWDDMyvg96WsdeN9MxStFsCwSdXvI1ZnngIFvQ+45HJw/BwWpb4sBoa1ougmBY6X2v5Y5mDi08lmOYEVbs6ZGFUPoTc42ri1ZYQEYRbOEpicZmlq0XyGY7mvyDkALg07QoEKADPHUL2k7fWy+MOoJ6tYfzm8d5baGtJFNF4osplvxrIL0kw0UH7n8j2oa+bhlQRS5bFKivYEAWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsvQekXfh/W0vjz6GOIP9c+J4h6DC14iT5/4dprLMAk=;
 b=IGCoAXfxxLwHWmEFdperzBjWuarQaY/wuTkTibx7ia9UhlSm4NQ7L32JXjxUrOtpWYW5IZptJc+JmER8Hz+LSXO8zgdzAfT0LjBP1SQarAjGPFsZkkp+baZYHXJ9txaEbM2VJDb46td3YHNkLr6FygmwTHG2OoGBVuMUBv4mdogG1TdbunN357pWm+nECTAfU/ODLmVKtjrNRgnQ/xBOHVA5eaGcIjBMZF8ahdcK6jpR/2M+rSehyZI9ECqKTdGljbNu63JAhj0MbNp6XoDGR9cETxIPZa8ObDmmLvICHuQ4kIn3xu4CFtUmtOik2SfbS3LKZ+sviCVFq21qaBipNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 by AM0PR04MB12076.eurprd04.prod.outlook.com (2603:10a6:20b:743::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 13:45:05 +0000
Received: from VI1PR04MB6861.eurprd04.prod.outlook.com
 ([fe80::7f96:4bde:2e55:cd5]) by VI1PR04MB6861.eurprd04.prod.outlook.com
 ([fe80::7f96:4bde:2e55:cd5%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 13:45:05 +0000
From: Jacky Bai <ping.bai@nxp.com>
Date: Thu, 04 Jun 2026 21:48:01 +0800
Subject: [PATCH v3] clk: imx: Add audio PLL debugfs for K-divider control
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
X-B4-Tracking: v=1; b=H4sIABCCIWoC/22Nyw6CMBBFf4V0bU1nLBVc+R/GEEsHaMIrrTYYw
 r9bcMOC5bnJOXdmnpwlz27JzBwF6+3QR7icElY2r74mbk1khgKVkAjcdlPWFWPbFob0p648R6m
 MqLTWCq4seqOjyk5b8/GM3Fj/Htx3uwiwrv9aCnhQC8CBE5CUGkFTLu79NJ7LoWNrK+Dez498j
 D4KApNlKSq985dl+QEyAMjD8AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780580893; l=9064;
 i=ping.bai@nxp.com; s=20250804; h=from:subject:message-id;
 bh=H117jA4BR2PNtY1apAO8cdoHP5078QwsIe+Xyq8epvk=;
 b=JMNVln7LDDmZz/t5FxxPHdf2e7EGoOUb4p4LjRoq5DO9V7AqTPVRs00U7YXRgivDjFFqR6i1y
 Xdn1UVSqo+1AtFrTSgOsFljhE4b4t/BE500LptRvwN5yxMTIM+U81NY
X-Developer-Key: i=ping.bai@nxp.com; a=ed25519;
 pk=ckFjCfRynXBjQGmSmzOVI5hggMD9XnnNlwj/jcO/j1U=
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To VI1PR04MB6861.eurprd04.prod.outlook.com
 (2603:10a6:803:13c::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:EE_|AM0PR04MB12076:EE_
X-MS-Office365-Filtering-Correlation-Id: 65fe207e-ba73-46f1-ae06-08dec23f7c09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|7416014|376014|38350700014|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ja2kkwXImbngepsAiv8v9vbebBAFpETN2xZmgyIpDMBPA6tkOAW5H+xb2oF4lTuR5e8F0A9+hHppkh4265NYmJUD0BXJ37++2KxuY26LpVZMVjBAlyVWbxSwvt/eXkYg20SJk8XUgYLEDLe3eX+7SzHN5HNWvzRMA+pKgrwtZP20JUOVeQEdGUBg1eB35FgmsB5buiqY6TTzg8dWU4vJMBMS/0SjfueD/f7N3iSK/r2Y/glgTdpSyKhEtxXbVsmxpZBzcro8QdGhqmlDqt2OWLaGe8a/4Yhk8Xd7YMWKRFeoL7+cp7Ad0+KjQsoabOqamrjixIxkVLG5oe+ofUk7ZZ9p/vwVl9qjuxIxb6xZYCGrIjQafHJcfMuDCCXWS+uzi/4PzVaohdyGx8+OaWkDLI+tMzQHZE+wVXXQ7RL4PYk+V1wLYclaf3I1UJFJHDbli+liZ+JKd75UQU3WzWBoc7srnmBJM/Fzl+6ON1JdGsEe8k+XHxLqtgZSvvnxxMmxIW67/JjuFoie675Va5JcNeIjsYPpvvVGhaQLk2qQ2N1Xa8tvjhNwOGuUd3Y4g1ZkVbEYFblk7iurhbiDldSJ29DZJRoTA0w45bzcX+048lTN0tOro6jBMJ8DqT6PjZXclSX12180smN3HNOf4v27s48VDUvyADfrZbpAwLAk3iKz0qjsb3gEZdTGkTsPfo0Z3osWakOtxHyuHS96pIe4wpJmeewP2i3+ZCKzXF/dirtkbiTDUTDB3mFw9Y8R5A6i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB6861.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(7416014)(376014)(38350700014)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3NleDJNcmtzZUpvTGVkQ1UrZ3R6Q1YxUjZpM3FGaFh2N0EzcnRVN1c4TjBU?=
 =?utf-8?B?akxONUdsaHk0eGJDVWo3M05EL25EaTFRZFk5S2ZSWFJSa1NxUHRvMVlIZW1B?=
 =?utf-8?B?UnZMci9XQU4xQVplNFA2dEJDTXNISHhiV0JySDlNNjRySDJiQ1hsYUdsQzkx?=
 =?utf-8?B?d1Jqank5Z2tNd1RBemIzZGxNSXpwci9VUjFRSmVkYnNYMU1TOTA5SE9RSkFz?=
 =?utf-8?B?c0JMSzV4eGEzbnE2TFpMNzArTkM4RWtyQjBudHNLSnIwMTVtWXNvWmFLTU1J?=
 =?utf-8?B?ckdZQUMwcUl6K1hYaVhtaHFDdVhxWEZrZE1YUEZCbnRxOXJvRFBVUFIraE96?=
 =?utf-8?B?NjFuaVNpSStCcmpScDNTYTc4RkJQQTZJb3VNNDB6S0FHUlZPaXhtQzZaNStB?=
 =?utf-8?B?SzU0dE5ZN3FRdDFvN1I5WFBaNER6V0lRNnZTcHpwdXMxODAySEhlZFFiY3Rt?=
 =?utf-8?B?Nytld1dJN1RCOUltTDlPdTh3SnBWSzArNkFxSUxZNGg5TkloSTl2eW5LNWpv?=
 =?utf-8?B?VGN0STdDQWxaRlFQTmRqanN3RnFXVE8wOEljVHVGUjJnbTJGUUk2aFdoMDRZ?=
 =?utf-8?B?VndTcEN5a3NIbXpSS1Fza2RKZXhOSjZWRWx2dDl0Q0lta2lSUFVLNkI1a1Jq?=
 =?utf-8?B?VVJTeWVVOExUTUpCdHVyUEFRNEw1SER6dEV0WklQaUhsTkxtZlpNUEl2dXpV?=
 =?utf-8?B?WThSM0tJZ2pHTTJLRU9iaDRtN2RabHppcmFFMzlTbnV4OEN6c3Erc1Raa0NV?=
 =?utf-8?B?SmE0eDlKc1ZyWHlvMitENElCMXZMSGdkM2ZsTC9UNlNVdGQxbW1jUUd3TmJN?=
 =?utf-8?B?VG5DRkdmZnNoRjIwanNNZi82RkRHMm1INncwZTh2WlNKeitoSVN3U3BjMmww?=
 =?utf-8?B?ZDJuWDdlOGw1QTA0RFNWcTgrQVBrRXRCcGxVd1BkdFR0REw3V1JTY3Bxc2R3?=
 =?utf-8?B?V0R6Yi9zTUZsR3cvcDJ5TXZEc3ZUeHdZZDBQY3NmWVFHYzhZVDd0RldTTjJJ?=
 =?utf-8?B?azNqWFFrUWIraHZIRktHbzZsbnZVdEJSakdWbmFkZ05qOTZWTkpGblZRNlVx?=
 =?utf-8?B?NlhLSFJWRk1OdmJOdXlRQ2M5eW52VXh1TDc3N05hVVpMdHRjTzBNS3lGYmhZ?=
 =?utf-8?B?aHZPRGErWXJFV1dBVHJTZFI1cXBmZmR4MzkvejRDdXRVUzF2aUpHQzJHNUdK?=
 =?utf-8?B?MHNUUXRVWE5wSXFxd3J4L2pMbHMrZW1zdUpBU1ZKcUlMT1VvYXd1bkRQS2ZE?=
 =?utf-8?B?L0pLUmhnRkJVTWd6SGlPdUdONVhXZ3FSR3R1RjB2Z0I2RVRxT2pxSHh0RUNV?=
 =?utf-8?B?emt1dE9WYTBlR05TaERieG9DQnMrbjQ3ZlRKTmlxUVF4MGsxVENuMjFDVWky?=
 =?utf-8?B?THFaaGlkVWloVjRUblFnY3A0WWRMVUsxYUlpTXd4cEdFZzBudzhZSm5MK3pm?=
 =?utf-8?B?TFR1ZWx4OWl4bCs3WTgzSE1RUUpsU2M2RHd6d0lta2dWSC93RzJvT254MFN0?=
 =?utf-8?B?OTJSS28ydEdvMHdzZFlaRmdCV3gySWpEbmE5V280ekZLcUtrcTBScEFTekd5?=
 =?utf-8?B?MjUxZERMdnBBNGphQy82RGRYcVAzL0M0cXhManE1bFZxQ3VXeVk0WEdheDZI?=
 =?utf-8?B?eU83eXErR1lHc2F6VnYxaXgvTVM1VVMzZGJFY2Z2ank4UUVlc1lXTmRPT25R?=
 =?utf-8?B?b0N5U09USEI4UmczUVhZK0ozY1UwMHJHdG45N0c5ZjRPMGN6SlV3UERiNFQ3?=
 =?utf-8?B?cU5XZDgraXNTaXovenJWV2loSGRyUjUrdDEzNkhrR3RpQXkwdUZsRkd0TjV3?=
 =?utf-8?B?MTBaSi9sRy9Pd29qWVh2NTc0SWhVendqYlFlbkFJL3p3YStWcXBxS010b1Fz?=
 =?utf-8?B?NWFDRzZ5N01MVkpxQVdoSmwwZm5Ma1VaV2hwb2hvaXRkT3hEY0xqYlNKbGZ6?=
 =?utf-8?B?c3NwM2U1cGRBRjFqWEJhMlNZaFhFWlZoU09YTHRQZHBnUjF2RUZydHRPelBh?=
 =?utf-8?B?Wko4eVFNZ28yMGtuUFlMUzJ5ZGZnRWpTNXpNUWJ3bThHWTd6WW1zeUh1Z0hC?=
 =?utf-8?B?eGNXb2NZRlFvVXFHSS9KTlZUUjBJRzVmOFBCVGdhYSt0OXpLQitjME90S1JW?=
 =?utf-8?B?RjhJMndvOHBYSzJIWnpoT3VRa0Q2Q1pJUzhPQUd1UUJtSXJMRm1rOGhvRUIw?=
 =?utf-8?B?S01aMytUckNMWjFaTFdtd1FWemtUR09WeTZGTVRKMis2WXFJSWNBYUFRWmc2?=
 =?utf-8?B?UEswR1JIMDZSclBjc1B4OUR0UzFuUWJMdXdGR1NQWXZ1R1JzODZ0VGdIZnRV?=
 =?utf-8?Q?wzuBqyLCBxEVNPB/5z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65fe207e-ba73-46f1-ae06-08dec23f7c09
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB6861.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 13:45:05.4451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfhvDlKArOW2XrnOrrLYcTGORZrahPEhRctWdHOxjNs5CXrN0RRLElRe5/6ScEnGyyzxx/SnC9XWdXdt62AxSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12076

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
Changes in v3:
- update the spinlock scope based on the Sashiko AI and Peng's comment
- Link to v2: https://lore.kernel.org/r/20260519-imx8m_pll_debugfs-v2-1-20e1d88526b0@nxp.com

Changes in v2:
- remove the examples from commit log.
- refine the comments blocks
- add delta_k read back support
- resolve the comments from Sashiko AI
- add prefix to audio_pll_debug_init API
- Link to v1: https://lore.kernel.org/r/20260512-imx8m_pll_debugfs-v1-1-e1e44b21be90@nxp.com
---
 drivers/clk/imx/clk-imx8mm.c  |   6 +++
 drivers/clk/imx/clk-pll14xx.c | 119 +++++++++++++++++++++++++++++++++++++++++-
 drivers/clk/imx/clk.h         |   1 +
 3 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 319af4deec01c188524807d39dff92bbd08f3601..89d442415a0108ec9b8af85946403b2612ec4fc7 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -300,6 +300,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
+	struct clk_hw *audio_pll_hws[2];
 	void __iomem *base;
 	int ret;
 
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
index 39600ee22be3066683b562aa6f2a8b750d19c4cc..b6f1cc9f570059b7a1e3d1f9655fa40477c75bb7 100644
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
@@ -134,6 +138,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
 	u32 pll_div_ctl0, pll_div_ctl1;
 	int mdiv, pdiv, sdiv, kdiv;
 	long fout, rate_min, rate_max, dist, best = LONG_MAX;
+	unsigned long flags;
 	const struct imx_pll14xx_rate_table *tt;
 
 	/*
@@ -161,11 +166,16 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
 		return;
 	}
 
+	spin_lock_irqsave(&pll->lock, flags);
+
 	pll_div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
+	pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
+
+	spin_unlock_irqrestore(&pll->lock, flags);
+
 	mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
 	pdiv = FIELD_GET(PDIV_MASK, pll_div_ctl0);
 	sdiv = FIELD_GET(SDIV_MASK, pll_div_ctl0);
-	pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
 
 	/* Then see if we can get the desired rate by only adjusting kdiv (glitch free) */
 	rate_min = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, KDIV_MIN, prate);
@@ -361,11 +371,14 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
 	struct imx_pll14xx_rate_table rate;
+	unsigned long flags;
 	u32 gnrl_ctl, div_ctl0;
 	int ret;
 
 	imx_pll14xx_calc_settings(pll, drate, prate, &rate);
 
+	spin_lock_irqsave(&pll->lock, flags);
+
 	div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
 
 	if (!clk_pll14xx_mp_change(&rate, div_ctl0)) {
@@ -377,6 +390,8 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
+		spin_unlock_irqrestore(&pll->lock, flags);
+
 		return 0;
 	}
 
@@ -396,6 +411,8 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base + DIV_CTL1);
 
+	spin_unlock_irqrestore(&pll->lock, flags);
+
 	/*
 	 * According to SPEC, t3 - t2 need to be greater than
 	 * 1us and 1/FREF, respectively.
@@ -508,6 +525,8 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 	if (!pll)
 		return ERR_PTR(-ENOMEM);
 
+	spin_lock_init(&pll->lock);
+
 	init.name = name;
 	init.flags = pll_clk->flags;
 	init.parent_names = &parent_name;
@@ -551,3 +570,101 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
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
+	delta_k = (s16)clamp_t(s64, val, KDIV_MIN, KDIV_MAX);
+
+	spin_lock_irqsave(&pll->lock, flags);
+
+	pll->delta_k = delta_k;
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
+	unsigned long flags;
+	u32 div_ctl0, div_ctl1;
+	u32 mdiv, pdiv, sdiv, kdiv;
+
+	spin_lock_irqsave(&pll->lock, flags);
+
+	div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
+	div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
+
+	spin_unlock_irqrestore(&pll->lock, flags);
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
+						   hws[i], &delta_k_fops);
+			debugfs_create_file("pll_parameter", 0444, audio_pll_dir,
+					    hws[i], &pll_setting_fops);
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
index aa5202f284f3d1b7c1b4bf65e2329831832b43a5..40bb41e353f93bf54a6c1b2b6c458f8a65d5845e 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,4 +487,5 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 			       u32 reg, const char **parent_names,
 			       u8 num_parents, const u32 *mux_table, u32 mask);
 
+void imx_audio_pll_debug_init(struct clk_hw *hws[], unsigned int num_plls);
 #endif

---
base-commit: a225caacc36546a09586e3ece36c0313146e7da9
change-id: 20260421-imx8m_pll_debugfs-246d0fbbb617

Best regards,
-- 
Jacky Bai <ping.bai@nxp.com>

