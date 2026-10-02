Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012053.outbound.protection.outlook.com [40.107.209.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BD64756DE;
	Fri,  2 Oct 2026 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936594; cv=fail; b=kEyKE2XPU+D3ld81IXDN3EHZb4mdwCN2bbvsuuiJ/2eUEbH6xIaMkka6ta3TN+HlBDXq00U7K0S8mzMF8624BqSqAefXnREuCTwRNmlGNnMJXPjHajiC/67FgrjyyT5+KR5cgL/wX+S/GC24f41xBlUMRK7xa6vPoN5KImDCQf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936594; c=relaxed/simple;
	bh=CXz5MM3PfXQLt9xIKVbqlozyqL29+QXUIak5ntyw5FA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=odwgM+gaBGqgaLqtLs4N8F7ky5kszPO7eW9hspXGMW8SAhVTE0OWYjLtWY4sYTVKoN6fHUzPiF7RGKbSMp6KQH7BtOvIXwB8vwmpbU176x5vYzwMiMH4yVJ7VVL9qt6n9vfOWfDrYOmGNTUcBoeDGFBcniJFPAtARfzffrvN5Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=QjTLj7dk; arc=fail smtp.client-ip=40.107.209.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="QjTLj7dk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLyUPHevcuJogZET78ygdSefH5Koa0QBG8O6JWF17K/pug2l+Zlrr1tk9vd5b06GNG2OGu4LVV+WPT5YwVoRvbMoImVAQIwjp9aekqd+kemKnGIkFErtzW1f3iQquXDCQrGB/bcDmSVEmaoVdOaiRS5p21PLG5O1hVgLsIefyn59507MNDoSlZf6s+AD6dZyhuNfDivIAEWs+YAvQlxvo7OQ7j36nOZ4FmBmcFLJy0zf3w/+20wQinGm9BcQP/vHsK3rWQmn0WDE0tUwo4Ywk36Jo7XgSOTuXPVs6q8sWxrj4/E1sLJ3X0TkV/neyxdmEr/twfojOeH7jM55rZZezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9qgxhFWk0+HGDEGgptdf0wMBqJL5jTdXlbWzXiqruM=;
 b=JrfbZaQN1l1PY4fR99v4E4LnASS2HhwDmnT4ysq4SNUYd274hueArB32SyRTkUwoylexQOuFtaJNCaL/RJks/snHQpljJ2+SIhwCn+FcphDgADGPdE4aoT6/R+qFrbbFlQR/uLx+K8Wkx3ecXMITuad70x3ZfGD9eOi2iXDL293PRQya4HLTtcLIaYzo9OAIjfIIKU+Vn7trd7QyU+2F9jw+DKYx09ypsvgh6rgnWvXEAREgPq81iB4aSiWcvclUKos5RNJlvUSJAR4Sv/c06msWiwEOn7WG+pHebSuyPZP3698rb/UGi4LOLuUACOTpG5S/b8ZMPtMtW4N7YyOpSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9qgxhFWk0+HGDEGgptdf0wMBqJL5jTdXlbWzXiqruM=;
 b=QjTLj7dkeoVJZlgs6SC0uOc+QuHgx67vVzpuyw4uPd96oDxopxDtA1aXEdt7JfCcg4xqgu6wbo5zsPOux9qkCplQCdoGdr6Xwrx426cQ44c2JtBZQqfsD2PB3Mhg8sVXGp5E9+/YIvzwEQe2uu8PDftzMB9hVbhngQF80hv9cD74LqMginWLD1WrUTUoIU5jDJXZ9nhlpq4l7MkRHR0fNwa0ALYbQJj2AqKdY+jQ6Ubcrp1U5W7qzmMP9AogbQ5o+CZ0pbIc6MX4aFah8brNoFXFXNgbCWgKDurB/fLPKtrUsMMy8tosVN/40VtlWD2y3r5AgUY9lvSfzM0Riu3iPg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MW4PR03MB6588.namprd03.prod.outlook.com (2603:10b6:303:12b::22)
 by SA1PR03MB7053.namprd03.prod.outlook.com (2603:10b6:806:326::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 10:23:08 +0000
Received: from MW4PR03MB6588.namprd03.prod.outlook.com
 ([fe80::dbfe:2474:d98e:ddf7]) by MW4PR03MB6588.namprd03.prod.outlook.com
 ([fe80::dbfe:2474:d98e:ddf7%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 10:23:08 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2 0/3] clk: socfpga: register the SP timer clocks early
Date: Fri,  2 Oct 2026 18:22:53 +0800
Message-ID: <cover.1790935401.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To MW4PR03MB6588.namprd03.prod.outlook.com
 (2603:10b6:303:12b::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6588:EE_|SA1PR03MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: e669ccb4-a5ad-4f8b-90c8-08df206f271b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|55112099003|260925021311599003|260925022911599003|260925021911599003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	FW6DHhybLJVvUU770LgbdhtW+RtcK3NSWDPm+JVfBFTYTFlPZe7REQk5o/gzZTBA72tj/Iog1H5B/wMXZZq2ESd7WdYF8gWXG0nUr86k4udnSYkF1N4ps37pNFlonpfQaR+4itb+RZa3DOd3fEHwQ3BVS20Z3lEUFNODfeJ3R2P/xklpO8v73vvwpAzt+JTg9VdxlLf4HTA5gO/23p5Xfzo4F+dwaVw+WOxNy8iNfC23ajQQ/RcY6a41i41oUPugZkcpuzMCYKSywRoJgNv4DLWQ6FfcAldLqrSLJllkKRyKC43u7b4PM2oR0TcSPFuSNvAyF17hHaG3Ms9rWsiZsWeNiI0vfXaPPDKnfNqxkl5xPVIABDPEVWAKBfuEwaJROxHQ8n7pqr7VgfHT/ZtkHkgoXwPwD5RmOfA5fma4y9xxI/IJEMBrAMjtMB5FDw8Ql0RF2ZWJEHYBaPanm1HqDQcC6+gxVVwjDlpxCPkL/nldQxFR0npQfxed1fetL6X9xU7a1/OTm+IJfftamDisH+PC4DxyIgVbZgUXfAjpCGPa00OJ9IPYyB688cGGBBmsbBwkRZE1ZtSFXzwwWZ+v9qhhWkxFaeVQaeamtZfCvNA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6588.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(55112099003)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i5DBIhpCpiE7oPlD+N+onSoVvvYusezJUxKn7jC9YhKDEbCRIbyd5kvlSyI4?=
 =?us-ascii?Q?8hs0sm+CQiSozqNhPe+lsrb85yFDC5Myg47SNRXywim6ltvS1cGCnGz7boHF?=
 =?us-ascii?Q?yqE4c0pqovbbCeSkBdnSznGXpFble3P/14/liJUwttvvXRegL96MDRHqIQ9d?=
 =?us-ascii?Q?THOYczqj5nK3hdvn2GJBHHbai2jC1j4TUfwv3edLlqmcM/pJlN8jmHCVLGv7?=
 =?us-ascii?Q?0q5OKXksEs6/liGIJHeGPbv5PpzJcXQ5v+m9YMZ3cPbnUEDsG3eRPGlQMtUg?=
 =?us-ascii?Q?n87ZMLjdBkBs/Et18Gjym+9/QVgHAc5hYcjHslvIoBcsRobGJXEBZV9BIdnx?=
 =?us-ascii?Q?/YTDPeJ+BP3aKs2r9FwJ5Mm/QsMkxGceQ2eUF45oaKv9lOAwqbHP+WoyWSys?=
 =?us-ascii?Q?zJWYcSbYllMjRx7aGRCM8bHidwKALj7tDLXSsJPzm8agiLlTQmkQQe1SvxxZ?=
 =?us-ascii?Q?VOXkidvfYGyF/aITvMhgwU/OHMyzlBeCfyiF0kNBmfUk1+graYAeYFi2Boo9?=
 =?us-ascii?Q?B9HBM9BiUMtzuJXre7U9oA4kyve/4gm4ymufyNxrRMgxAxXZtFj6bU6UQIV7?=
 =?us-ascii?Q?mT+q31vVHPLkYl1WTT3D5e8i80rSKPwqNG97toRLrcR+Z3moj9awPFVLdhZ0?=
 =?us-ascii?Q?MXO5rLZ4Ds6aY7fIeUTKw5FJTzo3lQrlDYFy1RXPtKao2OlXEOi3k8HYdqK4?=
 =?us-ascii?Q?jzcsJhLrw8gT3Z07+ojhr0bEDlZzjqo61yjTnvIDpsA9rUNhSiiHSXOgURwV?=
 =?us-ascii?Q?yN/7npPi0EhMaZ+UdvIJ8zTHQ6tWpBfl57yEwxyBud5513gz7lYhMIyehXUH?=
 =?us-ascii?Q?Vzxn34cXZtXsnaDVxDIvcofzJhI39r2VaAkn7DAYOvxmZF2v/x/VxIEo8X/M?=
 =?us-ascii?Q?4+Yi2eybZhaJDQl6CG+Q6vQJBWwRYDwBD+jjmUOd6GetfHh0GvUfZCe1LZhq?=
 =?us-ascii?Q?/bfjAI693B9PcZSLnj2P4zj0ntEXHp+S1zPdMtD1vM84f1PZrLcStotx2Oj1?=
 =?us-ascii?Q?SLFicUnre7JBoZ0x8irM2CFxa4L3/5CvN9oj5YlXvXSh4Sp2dZoVVjbLZ1kF?=
 =?us-ascii?Q?Uv07BuD589vh/UZc4BN2G2i9iWwt4jPtxYw4rPyywOGtSvc38F/Ve2Wp+U9B?=
 =?us-ascii?Q?X/7MYENb07nunU3lYG2UjGabxpErcpkei9i41INtMwb7H2TGET7d0Ai4Hf0U?=
 =?us-ascii?Q?HArL96EFMb6HAHgB1SKJWCXIkAvShsq7Kt++oN2TtdmEE68x157m6sUBCX6p?=
 =?us-ascii?Q?4IL/flBbEA0j9gsJnRNZJqbM+i/TKeATTd0AFF11YJJmrGXMdUzMWTed+mjM?=
 =?us-ascii?Q?mdUutzk1xdYEhcgTZVbh5OCM5xtXtnKd0rqZcboRhJOjA0n/NC1Zb9hDoyFV?=
 =?us-ascii?Q?Uyqb0ONC2VPyzzZZ7zoRgKBEEU55abI3fL7BNl1/8Cc8WVkQsGNO+becHUJU?=
 =?us-ascii?Q?cSwomwb2CfWEljkKA6WkwkBXezP2DGEi9UvWuCBl9K2FrYgv2ydGuZwwD7BQ?=
 =?us-ascii?Q?z9cVcUsb4GzRIMzmb5ctmrtw4O1NwO+XQXnGl1OGUr9ut1usqfCuKkZSY6wH?=
 =?us-ascii?Q?5V/ZRb9v+VisRbsmHNPjPxp+sMofmCAWTX3Nk+HuA1K6jPsWeau8s9NM+EXl?=
 =?us-ascii?Q?TWad9echDAi+sUBA7n49jS7TP6QVW8XJDhGIHPx9w6Dt9iPeJgGJNHDttEG4?=
 =?us-ascii?Q?74xxSxhVYp3i7HzgD6v+N/zjZy5P4tytSVdsAn25RFV6FTiwrtIwWQCAiRjN?=
 =?us-ascii?Q?GsEWsNSwPwGByq4oSLGTwofk/EdrQhs=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e669ccb4-a5ad-4f8b-90c8-08df206f271b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6588.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:23:08.1819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z92Bxoi8WrgDxAukEh10y6srVTggNtBFG2yTz2tq18jLe41El4bjFzJ2Dv3OHa7Gs8XSpZ3TBSnk67zEcR9mObEIllXs3R7YpskKWWwlU60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7053

The DW APB timers on Stratix10, Agilex (including eASIC N5X) and Agilex5
are probed through TIMER_OF_DECLARE() from time_init(), but their clock,
l4_sp_clk, comes from a clock manager that is a platform driver
registered at core_initcall(). The timer's clk_get() returns
-EPROBE_DEFER, which timer_probe() does not report, and the timer is
never registered because TIMER_OF_DECLARE() callbacks are not retried.

Rather than moving the whole clock manager to CLK_OF_DECLARE() as v1 did,
this version keeps the platform driver and, following
clk-mt8173-infracfg.c, uses CLK_OF_DECLARE_DRIVER() to register only
l4_sp_clk and the clocks its rate depends on from of_clk_init():

  Agilex/N5X: boot_clk, main_pll, periph_pll, main_pll_c1, peri_pll_c1,
              noc_free_clk, l4_sp_clk
  Agilex5:    boot_clk, main_pll, periph_pll, main_pll_c3, peri_pll_c1,
              noc_free_clk, l4_sp_clk
  Stratix10:  boot_clk, main_pll, periph_pll, main_noc_base_clk,
              peri_noc_base_clk, noc_free_clk, l4_sp_clk

All other clock IDs return -EPROBE_DEFER until the platform driver probes,
registers the remaining clocks into the same provider and turns any
unused IDs into -ENOENT. If the early registration fails, probe falls
back to registering everything as before.

Boot-tested on Agilex7 (FM61), Stratix10 L-tile and Agilex5 (065B Premium
devkit), comparing each board with and without this series:

  - with the series, timer1 is registered as a clocksource within 0.5 ms
    of boot and timer0 as the broadcast clockevent device; without it,
    neither is registered and bc_hrtimer is used for broadcast instead
  - the clock manager still binds as a platform device, no devices are
    left deferred, and clocks registered at probe (EMAC, SD/MMC, USB,
    DMA, watchdog) have their expected rates and consumers

eASIC N5X is compile-tested only.

Changes in v2:
- Keep the clock managers as platform drivers instead of converting
  them to CLK_OF_DECLARE() (Brian)
- Register only l4_sp_clk and its parents early, using
  CLK_OF_DECLARE_DRIVER() as in clk-mt8173-infracfg.c, instead of the
  whole controller (Jerome)
- Return the result of of_clk_add_hw_provider() from probe
- Update subjects and commit messages to match the new approach

v1: https://lore.kernel.org/all/cover.1789096458.git.adrian.ho.yin.ng@altera.com/

Adrian Ng Ho Yin (3):
  clk: socfpga: agilex: register the SP timer clocks early
  clk: socfpga: agilex5: register the SP timer clocks early
  clk: socfpga: stratix10: register the SP timer clocks early

 drivers/clk/socfpga/clk-agilex.c  | 222 +++++++++++++++++++++++-------
 drivers/clk/socfpga/clk-agilex5.c | 138 +++++++++++++++----
 drivers/clk/socfpga/clk-s10.c     | 133 ++++++++++++++----
 3 files changed, 385 insertions(+), 108 deletions(-)


base-commit: 1e7f56205813a2c48cdb3e9a4b0a24f49fd9a548
-- 
2.49.GIT

