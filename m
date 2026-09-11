Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B867741D635;
	Fri, 11 Sep 2026 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110104; cv=fail; b=bhew/FtImT1K2EUlfxhjOmxZU4kkBEglARVjYw5UU5WP3EfUIVwKiBTl9u7b7yZ2K4r+prv/7FvAvtTqio8Ns09J+a6C9f3N+FR6+O4mzdmvUo6yninpZaxBGTMwl7ohtWKrQc8SGuSFlNRNWnv56M+gzZUmmSl8ssaQ8BHYAy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110104; c=relaxed/simple;
	bh=2/e0w1yT63hCFh6pfpTy84/UyR1nYtsjeetrJS60UXA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CfEZ6sQAfoGnXf7snyCEP41OFfR2U5rOAW+/0ATbwl3LzJTPXZElP7EERTpPKf9khb9Be4kWIhrBTBBAClytA+TRDBLRdQIZlJijhCa9iOki8ZIfbhJh6ie9Pt6enAei51QKQsDSknz6saLbVVt4u2VreTOOI1zb1+njv1XK82o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=QiBs6GGv; arc=fail smtp.client-ip=52.101.52.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="QiBs6GGv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgrHgXPCVDm4td/nNYXmebO3t/rXnn8SXiKJNIGy0gLAmh5L5OldvGQyihX2QMeyOVnPGPCdO02M9CLjJvI+wVSaV13iZNjCr3MrZJuUxOc1TCxPrHvaJwMiFEX19CjXZrX6CijA8TETShi/dnRckOrnoqzwjVTTEI6725GMDQCio0G465PhJL1tAQSFq/pVjmUheihcIYBYcKUwwXBPVu2WwyFiqcGkB7mpinlZSUSbhi5RMmV7iHdqRTvT6hxg/VVsa/4EcHkrP87Ixt+tN+Z8dXjy4w3SgdX7fbxmL6gTunk7DSJSVpgvPuYi8AbggnrUQFhYp8AxpH74C9ojdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKCzCyyJRceO67gmsbpaGW5h7M1rgn8FhA1taRh6Z4Y=;
 b=eVHBMVxHE1ryqHOhpscImyw9EMKB08fIbP85ryatBU8Iw5H9luxA2b28RNwZx3YSbK++V0wSqPKCdhx1VqumJmrpnCyWzx2QPlldCTqVX0l5xpPHowJzcque7+tjJyhKY4fTBpSAYti1umYrBmuLr7BSfWfHDHgLneZBw2j7QUKaG+0MlkXDnHcRbQ1hRy5+nUILBQ3IxmFvm94ig+YXfpjXL4ZXvBlb2npc0B8T4+UcWBYSQP+osgd1Bom4jx7YVhAJihfybrLfmNzeDfdS818HWP4h0XOhyk8hBlhFHValEDcibOjsc2hgIvPW2HFohIqaY0m86/5W6rOU/Qb2aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKCzCyyJRceO67gmsbpaGW5h7M1rgn8FhA1taRh6Z4Y=;
 b=QiBs6GGvPnr8Mi9Z46cHZpB0YCD9cYRK6YWC91FHe373bQecfPecBXb1O18/d6qvwhwF5cF4NpAVMiFO9QRkkkfdhellqnVVrO5Eus6nXOR8yvc8zVmBk9k9VmX0d+yfD8jAK2Bessshilgp2EBRxa5+ynnu2IkySkh9JxHK5Pe2iLnlo71/AD6Ht6RXZRJCwI55BNXlqb7TWljxT4H2C+v0aJKin7s51F9TFiivizjq22V4NFD0dUXCiTZg4of6o22zlG0yOnMEClTB/VsJXt5tz0oUMkduxQ40tVysJ61d6QAy9DQMfYcrZW78WVwWfzP2sA183fEn1ej2OhNBwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH8PR03MB989185.namprd03.prod.outlook.com (2603:10b6:510:3b2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 07:01:32 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 07:01:32 +0000
From: adrian.ho.yin.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH 0/3] clk: socfpga: convert clock managers to CLK_OF_DECLARE()
Date: Fri, 11 Sep 2026 15:01:17 +0800
Message-ID: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.43.7
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
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH8PR03MB989185:EE_
X-MS-Office365-Filtering-Correlation-Id: b0a766d1-8ba7-4626-1ada-08df0fd282cc
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|56012099006|10067099003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	94mg1OXu5Vxf/o56dlT22CJ8CcnghTM4LBWm8244bkZrzeVOel1Plj7jQdCAgZSvU6ej/F/n15tzzNInDadO+WxIM43foJe/QLMMHrNZCuQezHYXPr3ElUV4EmfJlk6UOBE+iG/mHtMdBiSPJOH5C8qYKKuohgDkegiMZkAe/agGnIwlNnvg9RIiiJylnI13pdgOI0/3hoVN0WXhg+PvkCd43IrKkk5sP7ha499c1lJNoYC89vvPUnHffncZHCGMLlylvPzInp+BWZ/9CMBZwsJFzNMdGpxaepwCzHQ3TzX1K+egsAzj4PRV6AtO9wTle2yt1e1wD5df0d3L2RC4f4HAFThydvqlHyWx0H0RUxI8oa2kvmpbSDs/e2NkgrUoo8OcU9B32HL0FTKC/Nb9LfqjiAkL2bYcdQHZ7jPr5D69LYFKkcSRiNwlYP3qodmER6VNYyfolI+FyIKeVqJItK+0/jK/zSUSsosCj/hQWSMMV4pkVp7Gtiy+XZ3tbjiwcNWIqLsA9ibEkHTP23aaDBP3uG/FZ7WgxoOEV2SChwTKI3At5k4321dtrazxL5TAi75dYRmsRXkCw9DgCA7dkSdarG9+UtNkalNjQawLCnEfoRSkhEwj/yLMm8fG6gr9jX9Glq96/SblUvaSGQbtIvsPPJbcSPLd0Ft3g3iIRGs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(56012099006)(10067099003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gTxwnId/f+yZ53gqn+fogrl3/NnKuYSK+KwhCB88f9QRD/ZWG1+pj8I4MlYa?=
 =?us-ascii?Q?p0XKG7PPh7vq7YlvxpOsZVWu2IP5INOzmSNAwWsfQ6kA6AREJ242CqRYGVhK?=
 =?us-ascii?Q?R0riOetSg3TrppeO8wdankcXFUb9Afo407zNn3C5ZHBo+dggRC57xwF3QiZp?=
 =?us-ascii?Q?XjnSk6kVFLriO3qXFNd34XOalxfqSWDqTj20r7f34XtdmjdGRuW/aVV8mAHh?=
 =?us-ascii?Q?LqBVHTioNIJo+ZDTXPIrcdWA9nUa/MtITobyXLQ67r6uv56kZUeo+eATgXiL?=
 =?us-ascii?Q?zahw+PKCGNMU9eE/YBZME7wXLL/qvJ2xkRd6dx1okiNvapi1gElyHTZ/ALWx?=
 =?us-ascii?Q?X1TUnh+9q3vJQQzhQasqbmRaaUkWhaNDaTFNKeH44i61jrEFynRYyGhF38OU?=
 =?us-ascii?Q?1ZLCPAjb5s4hkUDvz3249HC+m9miyKHtkBzLPUND1/BQ7J36729rBa20RD/e?=
 =?us-ascii?Q?HgHSrJHu+0MQkfUMug3fh+zAQ4W8bbPydho7jTQBojQJVR36NRuIHefjbHiU?=
 =?us-ascii?Q?OBKhgUMSxYgulUXjA1t8bYb0bwIvXecAi6dU/QtAfRNoUlPXZs5p1O0t1KgD?=
 =?us-ascii?Q?isQjA4s9fEtJL/9jOY/74A8+YuwiXAi+Sf+FqjI3EbcoMawJ0sCAiCpNpYfQ?=
 =?us-ascii?Q?tuDBIEVfJtdbcuABa+HozpvF5eliQA37KtkGA1FVuwqRotbOjcivOGpnOyJ+?=
 =?us-ascii?Q?P04mgl/OLbyoPYOAOl2x4Y1q+EX1M5ouI0FFbKe+famyEuovcnU5DOPCTo57?=
 =?us-ascii?Q?ClHAd7t4C7InX/hgonmf/8/NZ7QJHESbyjF+AwnzSXITBu0pR5QIFox6AyPQ?=
 =?us-ascii?Q?dNJTlGd5WTBL99A80sW3CBZanHWZf9p5Qd1Jt2gQ6bpAuvE/sUAsPkZ29dH7?=
 =?us-ascii?Q?J49gjuWUDcBa58mVemEJYKA4ITTAuPoamgk1mvmo7RmYvAjdmvmRIg9X03gw?=
 =?us-ascii?Q?8wq54KmoNivv84mGum5Y3MeeImvhX+dc7qH43PLLZR+VG0K20SyRuqhhG49V?=
 =?us-ascii?Q?YpO0By22NAcdtAcB2swU8rDIFJmTbWsDInrrmskdaXPcGveqvOgdBcPvMTqo?=
 =?us-ascii?Q?++QlSCdIx9JcWxdF9hSOLcs1gdc5OUz6fvD4QyvxkzideR/ZJZMpLn2CNvYE?=
 =?us-ascii?Q?Hoa4yf206sClRREboRv68FdXVwLpHkCXxs1BOvXDiUvj95n38AbJrswInPvo?=
 =?us-ascii?Q?2YB9ZvLpk3WdicrGIBOJWa+qgz5GrduEfKwPTUoOXLh8CZBtE+9qpG42GqjL?=
 =?us-ascii?Q?EZwuLb1Oe1ESFVvl/gJPVXQlTGqsNasaVfDns/m8y/E59gmxxJSjXIGlxBN+?=
 =?us-ascii?Q?x5Tkzs8iolLVPmVfeDFBXLKcSwACTWJQC0M+cG33GqI8Nkc/2BkM4fi1i+br?=
 =?us-ascii?Q?4ujptMPUoWLdcUCaBdQP2fpC0hjveEEM5teg0OuMTMlGT7+Z1U+VPKKCLpBX?=
 =?us-ascii?Q?Pp9ueEQ8E6+KF/d+ykRnNFuNjHYFEs6F0DAeXT2868hTBkaPCWGUxoOlc2Tx?=
 =?us-ascii?Q?Q6hDGZrPGHKgLvs8uwq7iDe6AZIp2HZnlHNlTNHgfUKwjLU3tDA72z2ZQf1W?=
 =?us-ascii?Q?BhuNEZT+0rcP7n9OQmj4yabPLRMAn5lQH+1sWrsgRVEC3KlK4CLyTymNwEmX?=
 =?us-ascii?Q?cu1AjOiO8puuI8KzgDw76V1rVgeRJsP2Th/ufSq6QoaAKKNpV3acP1iETNNl?=
 =?us-ascii?Q?HIy6FCwawcDlMzqzoKAboj2yMMf3YY8Q2M/On+j/kFatgBaPAfxI0JrioIyS?=
 =?us-ascii?Q?PpX9Z2PXAhTs5N6gAhkiVqGP2nH7G0w=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a766d1-8ba7-4626-1ada-08df0fd282cc
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 07:01:32.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olHlIjy1dbCW7+v+5C7bqYaz7OZs0Fld9Bij4vzq9WdPe9nx6pennxIvYmtUSFisf7LV8ZafGlVKyg62rS5j2+X5BtKdgarCnlB7VtQDcvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989185

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

The SoCFPGA Stratix10, Agilex, and Agilex5 clock managers are currently
registered as platform drivers via core_initcall(). That is too late for
early OF clock consumers: TIMER_OF_DECLARE callbacks run from time_init()
before those drivers probe, and the DW APB timer cannot defer, so
clk_get() fails and the timer is never brought up.

As discussed on the list [1], convert these drivers to CLK_OF_DECLARE()
so the providers are registered from of_clk_init() and clocks are
available before platform devices probe.

This series applies the same conversion to Agilex (including eASIC N5X),
Agilex5, and Stratix10.

Boot-tested on Agilex7 (agilex7dksiagf014eb): dw_apb_timer registers as
clocksource early, with no clk_get() failures.

[1] https://lore.kernel.org/all/20260903175356.BF1461F000E9@smtp.kernel.org/

Adrian Ng Ho Yin (3):
  clk: socfpga: agilex: convert to CLK_OF_DECLARE()
  clk: socfpga: agilex5: convert to CLK_OF_DECLARE()
  clk: socfpga: stratix10: convert to CLK_OF_DECLARE()

 drivers/clk/socfpga/clk-agilex.c  | 83 +++++++++++--------------------
 drivers/clk/socfpga/clk-agilex5.c | 56 +++++---------------
 drivers/clk/socfpga/clk-s10.c     | 50 +++++--------------
 3 files changed, 56 insertions(+), 133 deletions(-)

-- 
2.49.GIT
