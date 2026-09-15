Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011061.outbound.protection.outlook.com [40.107.74.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7202F21C173;
	Tue, 15 Sep 2026 02:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439311; cv=fail; b=c2qR+ZFlJ36tBK5YlCl/WMrCTQdxmxac5Pm0d09WtZ4C6//54KujGXHSVoVKGrpJnJ2KE41mW12bGOUG7HlUdMWP0Ob6tHtNCGVen5x/TyJH620X8au32wh14QvaiyoLC2yc/UVgcEHN2PD/c6NrFMBmWt+kpJuBiJXcVfJGW+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439311; c=relaxed/simple;
	bh=+bYRGk765uW6HNaGctntddwFttSqRRJrqKzNkyp49sw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BVG9sO1vPPNSOVFLwB1RGbaDpLXL9fhh7DDHBnLJPTMRRswP8pI4WbR3Ioi351Lnx7LYRjBA9xndar+ZfN6Tcb0ZLEvD+uonk+rZF6sJNa3fGHSwR7Kt6lgabMR+1a9ArlEB1PKChIsCSGHxybyIx7Wmbs+U1C31aWJ2DFpEH5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RTExI5Z2; arc=fail smtp.client-ip=40.107.74.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RTExI5Z2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/5Ehb0wO/Fz81SrU383UPXwYUsQK7IF/XAYptz/3zAH2IPtKAVydaALRZTgaQ4lVvQQdZOtl9nwxdu5WEGN7UqcSIhY6exJ9wTiS01e7QFS7sHh+0rPmDHCu8+oEF6Hb0jfMjJhA1swWsecri4bzqoz/tmoOOVspLiUypArtpcRITWw6kh2I8YGNGAmKTVQoMcVPCwMgk6jhAGrpx0VUZHVm682ObKDl+PsfJm7M9p3aAWN4kSFH0gG+Qdf4I799Qbg2ndQEk4e7cPk2pQSU+mEAsYLXQDvcJ5N92y6TZy6A6PZd0U5xLFWko6rf6gxd0CWKn1uH0N2NK5VhtvxPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWJ6vxXAqqT5x2PfEzjiRkL6pjmFHJ+lllqPrMOccTc=;
 b=PoDwIR5/QBV6J6rKuNohpj4XGpA3yN7NJ1IgPgj1c02EcQ6n+t1SDofEox58ORGml9Wxl9xvTId4m4z6NJJrVA9B11ShGGxd9hEoDKxbz0R+1oAofUXCxBHFNBUHrf+EBEcv0JI857k1NCoZ+eJgOGMgkYK2+3nd4gQEHWP6h9+ZyAepo0MLy2x0Z4h891cztSLsypCMJ6f94nevnpPAKXger/Z7eNYwF7DkVFuofnxtNVA7Kz8HDmRBuf2FKIYTFBmcZ2wplJrAo5j+qM98bM9MgeZkiXemlf5mxpHFzfwCdfChKsOlhE2OWkp+Qe+tUWNdW5dCPGii1JbnEJFIiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWJ6vxXAqqT5x2PfEzjiRkL6pjmFHJ+lllqPrMOccTc=;
 b=RTExI5Z2WL78n2etFdR3cE6PnZcGo1T4unFCB9NA2x1o1rFjuBrMXe0AEgvtYrz4VtHR9xTsW2FyRIxB+93iwzXaRLthcoykawXoQZ8DXC2jOmxUXpZaUU+f+jB3UERG7n/KwtUR4rslYrFBydpuP6zsEq4KLeXzWg+ZMo3xKgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYWPR01MB8431.jpnprd01.prod.outlook.com
 (2603:1096:400:174::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 02:28:26 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 02:28:26 +0000
Message-ID: <87a4pjs0xh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] clk: renesas: r8a779g0: Add ZG clocks
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
Date: Tue, 15 Sep 2026 02:28:26 +0000
X-ClientProxiedBy: TYCPR01CA0145.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::18) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYWPR01MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 919be678-a261-451b-9af7-08df12d105e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|52116014|38350700014|3023799007|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EtzInFWoaa9sDUC8kyVcK9Y75yY+4FrralDWGgmUY1ryyk3hXnbJXePpIKTTwpl50dcF75cAqRh2BMx58zCGLLmzQN5sgNJnEX1oozA9I594QvN1qjXocZOIu7qLCc8rFxDydpjCiFedycc9sRS7/uJmo8I01f3wzUTkhSL2+MH6Lrxl8rh3Ug2MzRfhsaw2q2zAHt8LG9mCeq4GHxwoZRPPvk8/gmZVmojmnuN3vs7//SkaXEk0tmzMFoKNeCm4wqLhsXFZ8qGbVv5Xt+Np2/Ctj0U1mn9Kik1vRAUmk2hefg/wbSlTAfp1lOskHdcBW7+JQ/wYNml0dWW+ryQKcUL5VXhKnETPS7kU/pv0SDaxZXnxJxOxwdKnJ3ffYLTMgDb3Ps+l0OUhWE4FLJ7A4v13OpKZp8vXmekq6CA5XiphgEV8PBxKXaMrlWXi+qT5O7YdnCs9uOiY4f4YVQ9LTRBdVA8yTGm+DYpUfJ0Cuq7m8GUx9onWzRTV1yUkhQTT+0VkYs7pSQECwjklUqXmCEFn1gJ011YjzXQZni2LDEkR0GhxHod6nBBZbhjHsqn1qdskYpTOUSidaQLxusTJrpogsq5i59j+HAvmqkPPhPEM8LTVW6yMmHKijyXp2uHr38K+jWDDzr/ZRwaScsNeefXueIqcaYnvMVqgwdRAc2QD33qLmGgiEVphaM7Uk8/K1mA82Vzw9PaJqT7tUaN6xjKpF7lxAT9MsTlmVtw7r3k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(52116014)(38350700014)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F8H02IiK+4bcd5pgDOCseR4wFxgNZXxHK2qQCDb7PY6msstRKTe76KbFrivI?=
 =?us-ascii?Q?FlEB2mokfaLLzrZxfS/t76abhaGfSG2uMxsfUd//ylZV0/k24G3n2kYGxT0P?=
 =?us-ascii?Q?+jU49J9JA/sKDAMC42xJVZDjf3ZCATHNVduylo0RbEOkgzuEGbJRZvdwktXK?=
 =?us-ascii?Q?Unvs4d8DQbyb8qc+KTO4JDKIGEXSDsOVRSJSrbSEz86aP5BNMDo+LWu7MEw+?=
 =?us-ascii?Q?5xbZIgp2FGKHMgFecsqioWIiIdSSJf7uelE4KVLuDIWERkvskqx1ZdpTgv9G?=
 =?us-ascii?Q?UyeIFlb/t6X+bjNknBqdQYKIut1U1x9/KtRGeHcf7WHySitWCxqnVjKaaTIx?=
 =?us-ascii?Q?WkZQ02vPdV6cjusV8yZ8bAV3zA/h3uaXIioul12r/04dCwtzCIpFLW41XUM7?=
 =?us-ascii?Q?uiVqKxfmGWGRasGJIkJqcyT797LWqYTwKg94cyH6f9MZ2cezeGedM07cYOzM?=
 =?us-ascii?Q?iSHV+rmjdA+kPodK11XVxirzfhmdKnreyOOkxacwPzdwHXKRFiqqjkKEXcne?=
 =?us-ascii?Q?WO+Ehf+qDhxavb1CuCLMevHvw8NUkOPP/7a/zaXv+a+MmUaJ13Ax7ynYF7qq?=
 =?us-ascii?Q?MQLHgNKXc8fh8suN3E5Eub9uTe9P0gHfrVe1h9hZ9vK6TeyB0M6ygelZFtFW?=
 =?us-ascii?Q?Z+QDwMMTiXTm1FRjcO1dmiOyJflQJnOJEJ6F3pKeZbwsv3o8le6RnpU52JWA?=
 =?us-ascii?Q?keqOnR+qEHqiAItrAezCoskNMQShdWLJDUEBl4KJ25LmtQGDgGBNBnRGENWv?=
 =?us-ascii?Q?RijpAkwHA08GGF/0VhAf7nrg5xGSOwjDvRXyUGsj/ZZPiE69CJUNX0E7a42f?=
 =?us-ascii?Q?XwMx+r9COjyCrhcIgHRj/TL5KB5c9d4z47n3/4dsR923Y6lY/W2WKKUN8+De?=
 =?us-ascii?Q?PUNkgc2Cro1s00lUaQSyYEWsP+CfjkZyeN9BprM3akD3QM1GsFnZKinNmEdt?=
 =?us-ascii?Q?TjpUyFL0LOp+s5kMHNQ4NovPlpQgZX3Y4Qgo2fQxTvkAaLR5pQtWu9Pk1WHQ?=
 =?us-ascii?Q?LWNs//FL5zB++xOqzCT2/2TU4uJVuWHijyjuGWa6a7D+1KGqdTwrgoe3omM5?=
 =?us-ascii?Q?6lcdjT6P6nf5fxvtmDWz32cHO+1hC0d+unB0N2uTCd7DpO7WWO1DDnquUOVT?=
 =?us-ascii?Q?52NeEUQUXKo15fTwcnOEwGhbZVyQz5q4ug0kklKC4MAprSMI2EKHfU5H5KV5?=
 =?us-ascii?Q?SGHk9kvXlj62dfVaS0FKcMCvU8En+cx3BP0YiIfi3jptJNzaS44amzQ+G24y?=
 =?us-ascii?Q?tCdZRdQco2tNa1WN/iE7doexcC8/4+41XEolUz69Gz7jK6ijemzTVb/9rbJv?=
 =?us-ascii?Q?jJfAX5xFwi3Tqxfto9fN0YAAbAnbFuhcktzHnFgPvWgqwglHtyg+Usune/XD?=
 =?us-ascii?Q?5emjMOezJy4egdfP+InMBEv+pfkt4Bo9oRuiISlfx/de75II7ZmlcJFcEKch?=
 =?us-ascii?Q?X5AcKP1uKdBV2bMxEUpCuIUBWRKjH7QXd58HdK+GCqP0kBKrhb9Wm+LFdasW?=
 =?us-ascii?Q?gh7hZ7sLkyGuBtzXrsA86YVfcQeSJtTL8+kk5rZf236xbs2qkq2BdR4Et7As?=
 =?us-ascii?Q?qN/ukgVQLB3FbJSPmj9a5mHmOl313w+7gFgsg933SVJgXIiqqvFppwf3ulhe?=
 =?us-ascii?Q?Ha/EbxW4q/7HDGSvJfQGEFMmYnO8kMplccBuGKl7cyCVXJw6MNFetAIrG+mL?=
 =?us-ascii?Q?vuejI+99NQJy+OWaR1G0n+uh1l2XVPlRnFMQbE2u9aepGq3Toz9WCbTankfl?=
 =?us-ascii?Q?kvYfOKK50Uf2zJ+kpgTGtorMdnLaYl0+g1o7akSIarSFDcvHlXWX?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 919be678-a261-451b-9af7-08df12d105e5
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 02:28:26.7446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIWdCr1RfyMnDIS3/zAJZRu8uM1edWqVrHBdDG2ko5sJFBblllUv/YKTgCcqaYg5uGlmEh3XqhKy1tZwlg6Wx9G/CqnFSzCJ4o38ojfLnIJX6xm3o+dLO2QI6U4lVFEw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8431

Add ZG related clocks for GSX

Signed-off-by: Anh Nguyen <anh.nguyen.pv@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 45e65636f8d11..bc24bf7e1f689 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -97,6 +97,7 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 
 	/* Core Clock Outputs */
 	DEF_GEN4_Z("z0",	R8A779G0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	2, CPG_FRQCRC0, 0),
+	DEF_GEN4_Z("zg",	R8A779G0_CLK_ZG,	CLK_TYPE_GEN4_Z,	CLK_PLL4,	2, CPG_FRQCRB, 24),
 	DEF_FIXED("s0d2",	R8A779G0_CLK_S0D2,	CLK_S0,		2, 1),
 	DEF_FIXED("s0d3",	R8A779G0_CLK_S0D3,	CLK_S0,		3, 1),
 	DEF_FIXED("s0d4",	R8A779G0_CLK_S0D4,	CLK_S0,		4, 1),
@@ -163,6 +164,7 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
+	DEF_MOD("rgx",		  0,	R8A779G0_CLK_ZG),
 	DEF_MOD("isp0",		 16,	R8A779G0_CLK_S0D2_VIO),
 	DEF_MOD("isp1",		 17,	R8A779G0_CLK_S0D2_VIO),
 	DEF_MOD("avb0",		211,	R8A779G0_CLK_S0D4_HSC),
-- 
2.53.0

