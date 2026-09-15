Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010063.outbound.protection.outlook.com [52.101.228.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3152534C140;
	Tue, 15 Sep 2026 02:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439304; cv=fail; b=kb0yi4JUUmcnwCGPT7lSCyT0YEQMz8pbPpujExyaX1YzWw/fDL2x1gHYHtKJTy7js9Ui9F7Slj3fZIA2AbHVfx5UEEedG192XfJ5+2zh4FJYPUHcqnXqPvwP/hV18JuIYvUX9SMshysEe5ZPL1MPrZGWpnFzJrq8hiUpXgZke6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439304; c=relaxed/simple;
	bh=EKCeXJS3JnUsGqdY5BuaIDWIIULE95JMgGV8lcguekg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VgqfMUQIYBMptYjaWjX7OQs2BAK4cN2PswVSlt92p0msOVQOoAL5Rc/5oMqsHuUiwLGuW4yjAepcEIEdaBm9eCxijnmQHBQZMtLIvtyZVR178u1yDLpovUY5aSMc65cjcGNgwExUcvN1D7fvofXqBnw/Y6pN/1BG7N405mSoIDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=h1FyE/zW; arc=fail smtp.client-ip=52.101.228.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="h1FyE/zW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nubbg7uh/zIeCCbJms0hYCNHk+Xr/+91UhNnp5rnsWeRvCsLMdH5bFXF/duCASPCJAB2PMp2k1UsIsc7YOOGtvVB9iKfsi2MX+jduU4NOvFFgVAHNfIyCz8sT2rtqPuMNUQSscdKX2lOYRzv3ylJwiKVbXGLqaGZ4Mw3FRt47wcBXT60miSYN03Gr/oCfG2/sjyvW70Ju6pYpJWT5Qz/5ZkcrZA31G+nj8nptLH7N+owgRbtX7OfMZiaIKPjldXARNBFsg+eWP2GtaNb1682CNte1wuuhzSN7Vc5owC4C1yJ1BRsimKzoDSGYPjo+83XIxac6nfuvxsLMTY5vmsp6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uDFz5adfGfwr4FXwqlzhSi22R+f05VRXxQmgrfN5aY=;
 b=V5X6ODqu45kkoBbWcrUdG/SYL3Zp4RrOSBIlMmJ6OoHHi15rbXjfIyEY3YXz7gaPvTD7beITMY8lpO6uatBp4RQ8CprM4+5wJu8Zsk7JR/tOTiZ8ESAjLLvQPDdk8d4MB1+MKFyI/5ibZeYIeJclql/uDpPCfhUFyHoPsV2mI9tcBLpLg3G2zT7CaAfxUdmNKs/25hA+Is+ZfGguAq6VNlqj2kJDGWZns6BobsHQkMJDHvV/MboCCut4JEm5U36Y02qnE5fzDZ3UkZkjnajnqkC/pNZl2NK/G1B9b3Sgx2fc+V0f6N+OFP8rCE11kfoWwLu5bIxwlDE6RUDrkjfZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uDFz5adfGfwr4FXwqlzhSi22R+f05VRXxQmgrfN5aY=;
 b=h1FyE/zWLMb+kHizVO3Y63WfAy6ws3MxI0PNUbn+etEaahBh4L5GxyIklsozj6t1IfnAnysOHvbq/67g8PNh9Tx3V3IyxFMyGdrkhCuRxAplHTZ+brdzSzuO7ipmGE8YPbCJEJJSQnUHouPRyb2w2tdjd4blsekLxEcfMSDmcpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYWPR01MB8431.jpnprd01.prod.outlook.com
 (2603:1096:400:174::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 02:28:18 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 02:28:18 +0000
Message-ID: <87bj9zs0xp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] clk: renesas: tidyup DEF_GEN4_Z()
To: Brian Masney <bmasney+clk@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Anh Nguyen <anh.nguyen.pv@renesas.com>
In-Reply-To: <87cxufs0yi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxufs0yi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Sep 2026 02:28:18 +0000
X-ClientProxiedBy: TY4P301CA0004.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::13) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYWPR01MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d71243-cc23-4587-9fdc-08df12d10100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|52116014|38350700014|3023799007|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7Swzh03sxnu83GkQdO7MaWMXPlAR98qeSMTLbf5bK0FmI6ZTM5PkoUoRQWX0DNO4EjOdf7uk+/Q+a7o9h+mwkpLTWG+VqqwzpF5gICoDzxf5iiKUSdHJ9RJTj4uwaopIPyXnS5YY8FoKO/jttQ/u8nAH+kjolJRFpoB9zXyiy4/hV/OwzGg4YpBySADeGzq5d7ZJ0hlm+m0XUHSnQLKRgxUIjzl/oh/sdKKUSaBZdEdKeA9+cP0gj1EHVIiPcK0+DQq0yCrg36BuWEHsy2RBayS9G9iP3R1x1X2GMcjbCWyE+CTtXjr5EGndUriPQD1EvA6qQNm4BYcnuC80QFLH4U6CXZb1hdRJLFGlrZukbRMPQZLtO5i03M7QTGr+G2lpnL14Y3EqaKNx29ccuNR4cls+HPYJXy8UnPpWZIAlEKv4HRKX49BbboZVhrVE3/WKF4WTKXouPrVzIRRvvTp7D/g8WQc+z5gEpcx7CBVACcEvLWxEvnlMyeVn3ez+Ev538JwBLBUe4hZrghFwRDt/zu7rz3v4r5Jg2QzegyrV5YuFzzTio8TbH84nh0+tA59ocYick3hD7Y6z4t/1ppHk5nsikIIu4pZd2fT3ZyLzQam9QT72HJccikAxp9Z4Cqa/PTGZVjdSHRqdQonLn1G1pCrBNUUrXKDE4LkiZszxoflexcZD41v8KlvNPIB/wec2QFe5kQjUHmcFdP3SLghJzhI6BZh54AYKu9MZSP9alkc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(52116014)(38350700014)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jPOQjU4pMEwHmIdhnI42DXJwFF3t6Vy2ufnypYf8VCKYkKISl5yS0rgcvCnt?=
 =?us-ascii?Q?ZqSEvVI2Oxx3oWVrE8TA1ByINuzCK3dKeCsy03Xy7Sgms05T9I5hx8Eu7GAC?=
 =?us-ascii?Q?o9/7jz3b70NAjjftWcD0AXL13gFbAaLd+60gE37TKpYYqDIj7OePnmqswy/l?=
 =?us-ascii?Q?PFLvPJ7vUMyJoLKz+G9S87nz4vcZqYyZ+7lKxZmlU67dv5ZGXGETmf3uoZvT?=
 =?us-ascii?Q?VSG2dkgxmFZh1ItVCJOO3DEpHX73d4lLixM4kaZnu9qrTAcrDwVxve17TN0D?=
 =?us-ascii?Q?6wne964XStuRPPfolxa+dr4SMi3GmFJxv7U57Hzu031FghPJvgQVQU2lo/LI?=
 =?us-ascii?Q?9szfJI8QWocrzAMgbtzAgfbx5C7+mDKK7Oi9JZJ5IrhlwefAiC9KExTwnPZQ?=
 =?us-ascii?Q?JO/7SIqAacnEhpO6mhuy20/S2X0Weh5LnH8GuR3f6Ai1q9KlaTkBpio0KVm1?=
 =?us-ascii?Q?mSXCdGJAe83xNRinQnd40u/CgJOvPAcCgnuvEBcd419IO2oyGPVj/5dawZx3?=
 =?us-ascii?Q?U0DUGe0Tyb/NE4ACj+ACfL1m6b04i5hzP6kjvMSHZibUeD+duoRqU+DXmNvz?=
 =?us-ascii?Q?QN0WegUBKxXC6ehezVs096SGBagvPGaZQi6MXwAm/juxnIAAKk3XVkUM0zHO?=
 =?us-ascii?Q?CSTv+Wk775gJklv1AjM3kC0cAXuJtN0rXo4kaH0Tqe76eUcAlLowfDUMi664?=
 =?us-ascii?Q?ggNhfoNFOmXaBwZzvROvZdqsC35JxaKWSjGLTBvRIslhPai6NgzX1w8Spd+l?=
 =?us-ascii?Q?N4hXeAJ9IS+p8M2C4Q8BEWNjtrcAW1+hkt4pBA3JlbawWIrxHOR6nVsQEOeq?=
 =?us-ascii?Q?H3s3ucpWC9lDw0DzRf1sAXluEqgtfnAzGRq+WvfYXYrA0nEDpvPdpVxwgfnr?=
 =?us-ascii?Q?131J8AMbCxAaInL/xTI9wzi0WLAgNqUvrQlR+h40VhbKncCIA17nKgYXEVZQ?=
 =?us-ascii?Q?G3FteUy69Bf/XOHoPaQHFXAkQgH5sCW/TJMfxt2lvtR8XlQ9ee4PTrDg9jSL?=
 =?us-ascii?Q?gPpSzIdhoQNwgP7EkiDmK/Z4QHwwQUu/IhHzwOANNDljlB6rrPSceJtR9N7a?=
 =?us-ascii?Q?e3+tF/0QhN637OBztMokcj4OlkBBcldYUuLiiV9zWo0iYZapHyNc4HmkOMsd?=
 =?us-ascii?Q?4V/3g4yLapGov6liLE+mJz0gXuNBMZpyy/6ZngaUDwo/GHW03ZHCZNxK4cpZ?=
 =?us-ascii?Q?BjtEfegMyVRmQOggJxx+eVnA7IVeKMij9OIYFRip2u3qYSwCFdDE0VtjNgoL?=
 =?us-ascii?Q?AdBPNXoz0YtjKy9el8I8TdRAIl6FHtFnuRd75A8QWwd0344cyIplkuNM22Ck?=
 =?us-ascii?Q?q1jKzTB1ZZaP8jY/Ncj0WJhc0kq5HO/k5V9NDT08U1YHGmWSm+gssgo5Q2UG?=
 =?us-ascii?Q?AUSipvwZcLfjRaj95ylpmx2D0a1hGANsivRxeBMS+IoMYiv8MxfosydIbVaf?=
 =?us-ascii?Q?zJkILkFPxazdMKNTJ4s2CK8oMS2uISus1O5C1R3wx6IrhnAupvc8EV1ewX8k?=
 =?us-ascii?Q?S+fc5tC7jZQitn97D5Y7YpF7SeubOBULqcjqJAtAj1fK94tXWJE/pkn8NUyQ?=
 =?us-ascii?Q?nI/lP3fnwash0HxCHjK9+vjlAc74OkujXfOtPCYsMh5mu1+fCaMh0qBDwruo?=
 =?us-ascii?Q?GRYodwbmX3/Aaek9mg7RRoDmVH/MleEFJbAGjQCINah5Ayn++bpn91IwGbWr?=
 =?us-ascii?Q?y6FkaGp5dJssQc9FTaSXxKEes21H+oE5hbBGHkXnzXw3ZtEGccPkYtwYEIZA?=
 =?us-ascii?Q?Z/AAAWGoI5sYQDdow4DuiYYwsE1g61aoCt2nKaU3aaTu46pPbHm3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d71243-cc23-4587-9fdc-08df12d10100
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 02:28:18.5149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftMsBSgcF3yBDCmZc3rbg7WmQpg5FBjGYNJehJM/TezIHcsJC9//XqvNKIhVA3wLk/T98Drncu5+0yxQ0lju2SUqvo5D604J8nmZ5MMyJtFgysi46mre5IuAnVa4RrXy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8431

Current DEF_GEN4_Z() is using .offset to get "reg" and "pos", but the
offset positions and calculations differ from intuition (the register
is located in the order B -> C0 -> C1, but it is using C0 -> C1 -> B).
Tidyup them.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c |  6 +++---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c |  4 ++--
 drivers/clk/renesas/r8a779g0-cpg-mssr.c |  2 +-
 drivers/clk/renesas/r8a779h0-cpg-mssr.c |  8 ++++----
 drivers/clk/renesas/rcar-gen4-cpg.c     | 25 +++++++++++--------------
 drivers/clk/renesas/rcar-gen4-cpg.h     | 13 +++++++++++--
 6 files changed, 32 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index d67dff05d9f4a..c0caecd15c2a4 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -99,9 +99,9 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_BASE(".rpcsrc",		CLK_RPCSRC,	CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
 
 	/* Core Clock Outputs */
-	DEF_GEN4_Z("z0",	R8A779A0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL20,	2, 0),
-	DEF_GEN4_Z("z1",	R8A779A0_CLK_Z1,	CLK_TYPE_GEN4_Z,	CLK_PLL21,	2, 8),
-	DEF_GEN4_Z("zg",	R8A779A0_CLK_ZG,	CLK_TYPE_GEN4_Z,	CLK_PLL4,	2, 88),
+	DEF_GEN4_Z("z0",	R8A779A0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL20,	2, CPG_FRQCRC0, 0),
+	DEF_GEN4_Z("z1",	R8A779A0_CLK_Z1,	CLK_TYPE_GEN4_Z,	CLK_PLL21,	2, CPG_FRQCRC0, 8),
+	DEF_GEN4_Z("zg",	R8A779A0_CLK_ZG,	CLK_TYPE_GEN4_Z,	CLK_PLL4,	2, CPG_FRQCRB,  24),
 	DEF_FIXED("zx",		R8A779A0_CLK_ZX,	CLK_PLL20_DIV2,	2, 1),
 	DEF_FIXED("s1d1",	R8A779A0_CLK_S1D1,	CLK_S1,		1, 1),
 	DEF_FIXED("s1d2",	R8A779A0_CLK_S1D2,	CLK_S1,		2, 1),
diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index f33342314b2ef..77e70f7ecc634 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -79,8 +79,8 @@ static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
 	DEF_BASE(".rpcsrc",	CLK_RPCSRC,	CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
 
 	/* Core Clock Outputs */
-	DEF_GEN4_Z("z0",	R8A779F0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	2, 0),
-	DEF_GEN4_Z("z1",	R8A779F0_CLK_Z1,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	2, 8),
+	DEF_GEN4_Z("z0",	R8A779F0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	2, CPG_FRQCRC0, 0),
+	DEF_GEN4_Z("z1",	R8A779F0_CLK_Z1,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	2, CPG_FRQCRC0, 8),
 	DEF_FIXED("s0d2",	R8A779F0_CLK_S0D2,	CLK_S0,		2, 1),
 	DEF_FIXED("s0d3",	R8A779F0_CLK_S0D3,	CLK_S0,		3, 1),
 	DEF_FIXED("s0d4",	R8A779F0_CLK_S0D4,	CLK_S0,		4, 1),
diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 54ba76ff5ab0f..45e65636f8d11 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -96,7 +96,7 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 	DEF_FIXED(".vc",	CLK_VC,		CLK_PLL5_DIV2,	3, 1),
 
 	/* Core Clock Outputs */
-	DEF_GEN4_Z("z0",	R8A779G0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	2, 0),
+	DEF_GEN4_Z("z0",	R8A779G0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	2, CPG_FRQCRC0, 0),
 	DEF_FIXED("s0d2",	R8A779G0_CLK_S0D2,	CLK_S0,		2, 1),
 	DEF_FIXED("s0d3",	R8A779G0_CLK_S0D3,	CLK_S0,		3, 1),
 	DEF_FIXED("s0d4",	R8A779G0_CLK_S0D4,	CLK_S0,		4, 1),
diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index ffea06d77d5ea..7f3ac5a2ddc2f 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -99,10 +99,10 @@ static const struct cpg_core_clk r8a779h0_core_clks[] __initconst = {
 	DEF_RATE(".oco",	CLK_OCO,	32768),
 
 	/* Core Clock Outputs */
-	DEF_GEN4_Z("zc0",	R8A779H0_CLK_ZC0,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, 0),
-	DEF_GEN4_Z("zc1",	R8A779H0_CLK_ZC1,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, 8),
-	DEF_GEN4_Z("zc2",	R8A779H0_CLK_ZC2,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, 32),
-	DEF_GEN4_Z("zc3",	R8A779H0_CLK_ZC3,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, 40),
+	DEF_GEN4_Z("zc0",	R8A779H0_CLK_ZC0,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, CPG_FRQCRC0, 0),
+	DEF_GEN4_Z("zc1",	R8A779H0_CLK_ZC1,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, CPG_FRQCRC0, 8),
+	DEF_GEN4_Z("zc2",	R8A779H0_CLK_ZC2,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, CPG_FRQCRC1, 0),
+	DEF_GEN4_Z("zc3",	R8A779H0_CLK_ZC3,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, CPG_FRQCRC1, 8),
 	DEF_FIXED("s0d2",	R8A779H0_CLK_S0D2,	CLK_S0,		2, 1),
 	DEF_FIXED("s0d3",	R8A779H0_CLK_S0D3,	CLK_S0,		3, 1),
 	DEF_FIXED("s0d4",	R8A779H0_CLK_S0D4,	CLK_S0,		4, 1),
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 96922789e02ad..c3beb31f96b30 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -259,10 +259,7 @@ static struct clk * __init cpg_pll_clk_register(const char *name,
 /*
  * Z0, Z1 and ZG Clock
  */
-#define CPG_FRQCRB			0x00000804
 #define CPG_FRQCRB_KICK			BIT(31)
-#define CPG_FRQCRC0			0x00000808
-#define CPG_FRQCRC1			0x000008e0
 
 struct cpg_z_clk {
 	struct clk_hw hw;
@@ -384,17 +381,17 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
-	if (offset < 32) {
-		zclk->reg = reg + CPG_FRQCRC0;
-	} else if (offset < 64) {
-		zclk->reg = reg + CPG_FRQCRC1;
-		offset -= 32;
-	} else if (offset < 96) {
-		zclk->reg = reg + CPG_FRQCRB;
-		offset -= 64;
-	} else {
-		return ERR_PTR(-EINVAL);
-	}
+	/*
+	 * offset 0xAAABB
+	 * AAA : reg
+	 * BB  : pos
+	 *
+	 * see
+	 *	DEF_GEN4_Z()
+	 */
+	zclk->reg = reg + (offset >> FRQCR_offset);
+	offset = offset & 0x1F; /* 0 - 31 */
+
 	zclk->kick_reg = reg + CPG_FRQCRB;
 	zclk->hw.init = &init;
 	zclk->mask = GENMASK(offset + 4, offset);
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
index 6c8280b37c37b..cfc150750dc4d 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.h
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -58,8 +58,14 @@ enum rcar_gen4_clk_types {
 #define DEF_GEN4_PLL_V9_24(_name, _idx, _id, _parent)	\
 	DEF_BASE(_name, _id, CLK_TYPE_GEN4_PLL_V9_24, _parent, .offset = _idx)
 
-#define DEF_GEN4_Z(_name, _id, _type, _parent, _div, _offset)	\
-	DEF_BASE(_name, _id, _type, _parent, .div = _div, .offset = _offset)
+/*
+ * offset 0xAAABB
+ * AAA : reg
+ * BB  : pos
+ */
+#define FRQCR_offset	8
+#define DEF_GEN4_Z(_name, _id, _type, _parent, _div, reg, pos)	\
+	DEF_BASE(_name, _id, _type, _parent, .div = _div, .offset = (reg << FRQCR_offset) + pos)
 
 struct rcar_gen4_cpg_pll_config {
 	u8 extal_div;
@@ -70,6 +76,9 @@ struct rcar_gen4_cpg_pll_config {
 	u8 osc_prediv;
 };
 
+#define CPG_FRQCRB	0x804	/* Frequency Control Register B */
+#define CPG_FRQCRC0	0x808	/* Frequency Control Register C0 */
+#define CPG_FRQCRC1	0x8e0	/* Frequency Control Register C1 */
 #define CPG_SD0CKCR	0x870	/* SD-IF0 Clock Frequency Control Register */
 #define CPG_CANFDCKCR	0x878	/* CAN-FD Clock Frequency Control Register */
 #define CPG_MSOCKCR	0x87c	/* MSIOF Clock Frequency Control Register */
-- 
2.53.0

