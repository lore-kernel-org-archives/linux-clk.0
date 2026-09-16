Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B99136A374;
	Wed, 16 Sep 2026 01:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789523653; cv=fail; b=XjtSR3ZPgvmcqKgd8u6gEAt9VVwXAs3B/LTFU56XZh196QreNVqqe35EPxqY/SEHl2wgFQyJUjei6djh0ml2jx3e7zcJZ6wcAc5GaGO9desiZ8jPQoRlSVY+HFYECvfVs96Iyc1KR40SHS6YjrJNBDYhS140TDzaAoA5emmYD64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789523653; c=relaxed/simple;
	bh=LukevdI65mFXHvkrcobSBn4ngPTvxIQ+zUj+ab16vNc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uKHGWAY7j5MB3W+DbKGKIL5aLlgpiF/vrE4hCvMkvHQ/59+WkVBP3CU03cx4bVel16IMsk1vnaA9Hjso/0nCbqPFSwi58cbEqgEkbgMhKO3wMjUB10tAAOwfxUjnRjS7ocgyiX70ORmS992B15mbnRluVHGpU6QXGfNzZHMxuvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jwkxAOs3; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jwkxAOs3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sY4IjYJA5g/Ks9aA4ftQ9lYg2iTAHsfAbxE04nzpewOnpt4me4GJe+evR0Ja+KcPIONtsC4QgenjzQVziBz/DkkJxosl1nMMowsI62+f32BRSgeQfhxtx7GPdG6biT9dqaNiRAl1NwOc8GwATToX44w8tJ/B/UC82W0MDWX/9B0r83d6CZ8r2f2smV4x9U/ca66sy+cMYtR2Aeabvtq1DHPGEj540UpGFsoq8c5JU1FbPuDyK5Los2G8KzwVOfuicsGhV5PGMfIfdWM23roRWluyQlVnSx8zYv3ddYg5XMjCZ2szSflFvU3h/xA0jjvayuDqbGjA7ZZ3jyfFyO4rZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eANb61OrXIZT9St7kUNkGAuxtAi4dBEsZsCsbL5OXE=;
 b=TqzqlUQrmPfpKzRdoYRoNwdCOaGPVR9r6p95FGMr33mvIJH9w/KdvzYI4TeS4icWtuaRh3MpQmheVDmsXiGgVdkP0+qsyJnO63JgwvzvUk17OygmGA5ANPgzEfuYFRl1srw/ctdbb6GW68DWfHypSvKmWgfy7gdG3DaNywipM4Y6cpaeMluvtire5b4MF+Sa0SPjHhBpBej1xWQ5VHFpqnCeeCB3XAHVF2j2VjRRDGPiqWKFzUHYibAjWwR8dGULBJJZZeXtvz1iOqpmu5/WPwxzi4RSBGyz1Mncc1cPl3jJhBLApJFqmpjXFcNiExfcDuEAkYiRglKwUGAJQen5Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eANb61OrXIZT9St7kUNkGAuxtAi4dBEsZsCsbL5OXE=;
 b=jwkxAOs3jZY/fmVSVywpfA8hqYSDZPq1Vf8Ir5Jv9KXROAwjEUGMRfeJdgQ6c7BBhtncvcVGVGZp6vuOA0PdREVfirI87wmrvI8rGeKkXzhC9iumOyh3Fvjvnd2GDtBuz/YJqzufLqCer7Aw4dU+cPHMLZIfiYnC1lLJiOld8YY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OS7PR01MB13701.jpnprd01.prod.outlook.com
 (2603:1096:604:359::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 01:53:53 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 01:53:52 +0000
Message-ID: <87a4pivu4v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/2] clk: renesas: tidyup DEF_GEN4_Z()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Brian Masney <bmasney+clk@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Anh Nguyen <anh.nguyen.pv@renesas.com>
In-Reply-To: <87bj9yvu5a.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj9yvu5a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 16 Sep 2026 01:53:52 +0000
X-ClientProxiedBy: TYWPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::11) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OS7PR01MB13701:EE_
X-MS-Office365-Filtering-Correlation-Id: a2753c31-10bf-4773-a689-08df13955c35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|1800799024|376014|38350700014|11063799006|56012099006|5023799004|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	fbpugvwUNik1n+Js00IIVLwUfyu1mKaWbL7DHAqT5aTWeeq2uiPFRJf5ns7CWdBvVoLGWlhOMGnzegpnGTcUC9m7wgf+lnZvrBrrkNk+p66keVJawEF5hGVxwVysRms/2BSrXwUCDQzx07GMJoCwGbWYxTUC0ZJ0DnQqW1gVuyLJey6bKqP3HTBg9E3s8Kp6WAT5Okxz6C1xYV0YEYe74O8ossCoDtFRgz6+xQzgh2B7Ux4pE3laML3VZ7I4wrQ49d92CmSfV8xcbpgGCgmmVrrFas1q184+FxRa2QMxY/hbWIjWjQqkoFkJ3iOWOGdMU7Sud+9r8DA39sCIDSg8875Q3zdE+3x0+fMYGdxMU1NcBw/GTPDAkGbYfSvCm0DpYULlCnK7Uj6R+EJuj5MnyR5+JV3chn7ro8RjyCBhlQaA4jW8glxlTOxXtZwNh5GYp7txXDUnETCpG3ZejnzwZAUBVxlczQ4VBhPzZLpDGr/r414geO9cw2MCoQkQzjyhFgGAW6YK2RzfaIR0L/pbr+aH9Ptb9r1NJDIl6BlZlVYTz16HY+OJcmmEZrYI6BpCvFBYFW5MsTb3nhJ3vorAD0G+yK2lqDgmIXc2eWFbqY+TkUVFi8gqoWFsLRpX6aXNymjoHsJ7BwyxWOwGjb0QEWyBrJ28ontjNQI8wBsrE8fxpsvsu95ZqdgAgS5csRu3A74b+rdogWJzS27dLSVdy8j0x54WKQXnNs0Zz1Hf8H4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(1800799024)(376014)(38350700014)(11063799006)(56012099006)(5023799004)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/sKor1RT7UeJ7rTmQIbXRzcLGFJ1z2XdIxuhtAty/nLfvPMKzQN2F0dkgdO1?=
 =?us-ascii?Q?nS6Nu2FOzVIEXIes2dHu/qBdnQ2JXwNnPl+7jWNV2j7iHrLFtlPcA/YjA92v?=
 =?us-ascii?Q?i+OJDthPJBZPiKZOE9sqYhmzJiNoEI41uZsAjYeMGCJjyJvkbqTCsa/6+YoW?=
 =?us-ascii?Q?FtaUAmgZkLaT5i3IP2aAHoB+FrnaLtA5cBNQJiy+dMiAoesx77HLeo2CdB9x?=
 =?us-ascii?Q?B98skPhWQv03OsTE30OmQ9V/3eZqyS2ymUWgg4FKz+OL+7o+EDmMeF455Wg6?=
 =?us-ascii?Q?c2TwKKote4pidJyhMXkKE/MRoVvqu1JqG19SbR6zLnm6Gd+bVUDKVEdS8gOQ?=
 =?us-ascii?Q?lSkkn+k3aGK/RKd6Tv2NVs7xzcc4nkNGwg27cB4vKY/ldI9xzDBbpJBy8nn0?=
 =?us-ascii?Q?dx1sdgBHY5wSXnF/F5nBdSYNIze18P24BQyP/1lwgN0QfocAIRs4SOdLDLwv?=
 =?us-ascii?Q?qBtwiy0/QMAOS6vTRH0s5BKD2E6OkBDYbpuRn2L6tVeVuzY/TlLeHZmYs1/c?=
 =?us-ascii?Q?aeWFjrYbZov34j2dCKXWxtZ09IsL2HaMhmZbwpW5KP4BhSgSzI1KZitIssu+?=
 =?us-ascii?Q?5JAF2lhBMZHr9wkqG4crqXn+01Hvr31JstX88+GxRXDlrJ6Alii/qYOmRKRr?=
 =?us-ascii?Q?K8WjtIGBAJyL6CTsRla5kO+gss8QglyupQX1TXswhU4G+nChx7dt7VbUE275?=
 =?us-ascii?Q?UvbUC2inyHnfyT6Q82MUns7NYNxTxSSHi2NfLhfZ6gO4xkZuymc5kcnsmgHw?=
 =?us-ascii?Q?Gyyzx93Tws1vcP8Rm29UXUaGquzalhczft6O37v0thw8JODK9hL496jCsxzH?=
 =?us-ascii?Q?GNKuKLEjmeXhENMn9Ddvi3rUTZp5DK/o4K/c9eo5RO+sPM1mjTBBk7ZoGUMm?=
 =?us-ascii?Q?Mro8MYJo6SgjwQvVnczwCdtypdAl7//2iiErTx7THdZtfMWyW4FFxnSORoPs?=
 =?us-ascii?Q?agjrvzwtaBu/VWMAphiC+hVTv5b9GuIkv18/UhB76zzChu0DEM6Vyqj3fxf/?=
 =?us-ascii?Q?BJhF7SaOEkS5tp9Ural1JybJTIkS3xUqV7Lfdm71cOiqgDClWJV5Ho3KnGfg?=
 =?us-ascii?Q?cTHMdtKeLaQw6ntRGhh700p/ktwJ5c25s0bPOtORE7pXk161PHFJZ3L/paNP?=
 =?us-ascii?Q?l6CJq8XdxfN9FnHHzYENO7cry3l2gFflJzCwnvoRgG0yF1BHgGBYkwztPxtS?=
 =?us-ascii?Q?ECOBK+JNwfcBZ3Q5t4fshWugqjUvnQ3qQZDfH1wnk2DVIbkUp9APZTuEGYXJ?=
 =?us-ascii?Q?1C3LkMNEmVAGkqVYquc5WWR/o3kSrh+mMg+3XFqfo64ipuaaW/Q3IO0w1uRo?=
 =?us-ascii?Q?hoGQOzCrN9rheQ3d/zy7HYA5BqyOc4nfpc5r69sE9mlUCUpRYc1DS6JXuA69?=
 =?us-ascii?Q?szTLy3WgT7ai7UhjUvLNg7I1cGxG80fGUYYqlcT8msfTGyzeV4A3jypJ7Tx2?=
 =?us-ascii?Q?bzGihh8w4tj0Np3pf9J+MldWi/Qft1GKlHGu5hdr1RbdrMXoCjV17QzeQHGN?=
 =?us-ascii?Q?3RCM9AWc0Wr/7YtQVFuJZqV3mExmOmia3bbvNi9sVkzOnCYPKHRIWnFP1qst?=
 =?us-ascii?Q?vl1HG2GHG5hk+KTsoZzDMkHWAmv6hD8YYhIwwsXc8toeauQqBsk2OX2yq7wY?=
 =?us-ascii?Q?30Dx8NgIIwW5kB521h84acrTbYTOPD6p/nmUrPoQ+VsQZPgLQZ3gxZN5ECMg?=
 =?us-ascii?Q?EdzzCt8rmOC2zSYYxJ44Y1FYjQypNAPKxJRXe3ItWLVIy07XfXUUXKU7uTx8?=
 =?us-ascii?Q?ILDPdjD5379ql76G/5l0tOJPqnws1Qdsu7jmzD//2SNbDWdGOBhG?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2753c31-10bf-4773-a689-08df13955c35
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 01:53:52.9306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfDkB2KpI6aL28y77ccPsPcpoS0gD9nHogYp47F96bRQ4im1+qpZCm0DgJUSod2t/mii5ToRDUzd/ZJdtk0hfF/RjUG214kCu+SvFp78KL2+qlnrX/R7saDF3CO3rPcj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13701

Current DEF_GEN4_Z() is using .offset to get "reg" and "pos", but the
offset positions and calculations differ from intuition (the register
is located in the order B -> C0 -> C1, but it is using C0 -> C1 -> B).
Tidyup them.

And let's include CLK_TYPE_GEN4_Z in DEF_GEN4_Z(), it is duplicated.

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
index d67dff05d9f4a..a18a51dab64fa 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -99,9 +99,9 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_BASE(".rpcsrc",		CLK_RPCSRC,	CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
 
 	/* Core Clock Outputs */
-	DEF_GEN4_Z("z0",	R8A779A0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL20,	2, 0),
-	DEF_GEN4_Z("z1",	R8A779A0_CLK_Z1,	CLK_TYPE_GEN4_Z,	CLK_PLL21,	2, 8),
-	DEF_GEN4_Z("zg",	R8A779A0_CLK_ZG,	CLK_TYPE_GEN4_Z,	CLK_PLL4,	2, 88),
+	DEF_GEN4_Z("z0",	R8A779A0_CLK_Z0,	CLK_PLL20,	2, CPG_FRQCRC0, 0),
+	DEF_GEN4_Z("z1",	R8A779A0_CLK_Z1,	CLK_PLL21,	2, CPG_FRQCRC0, 8),
+	DEF_GEN4_Z("zg",	R8A779A0_CLK_ZG,	CLK_PLL4,	2, CPG_FRQCRB,  24),
 	DEF_FIXED("zx",		R8A779A0_CLK_ZX,	CLK_PLL20_DIV2,	2, 1),
 	DEF_FIXED("s1d1",	R8A779A0_CLK_S1D1,	CLK_S1,		1, 1),
 	DEF_FIXED("s1d2",	R8A779A0_CLK_S1D2,	CLK_S1,		2, 1),
diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index f33342314b2ef..1264c3fc50aad 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -79,8 +79,8 @@ static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
 	DEF_BASE(".rpcsrc",	CLK_RPCSRC,	CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
 
 	/* Core Clock Outputs */
-	DEF_GEN4_Z("z0",	R8A779F0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	2, 0),
-	DEF_GEN4_Z("z1",	R8A779F0_CLK_Z1,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	2, 8),
+	DEF_GEN4_Z("z0",	R8A779F0_CLK_Z0,	CLK_PLL2,	2, CPG_FRQCRC0, 0),
+	DEF_GEN4_Z("z1",	R8A779F0_CLK_Z1,	CLK_PLL2,	2, CPG_FRQCRC0, 8),
 	DEF_FIXED("s0d2",	R8A779F0_CLK_S0D2,	CLK_S0,		2, 1),
 	DEF_FIXED("s0d3",	R8A779F0_CLK_S0D3,	CLK_S0,		3, 1),
 	DEF_FIXED("s0d4",	R8A779F0_CLK_S0D4,	CLK_S0,		4, 1),
diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 54ba76ff5ab0f..eaa5f930e06fd 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -96,7 +96,7 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 	DEF_FIXED(".vc",	CLK_VC,		CLK_PLL5_DIV2,	3, 1),
 
 	/* Core Clock Outputs */
-	DEF_GEN4_Z("z0",	R8A779G0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	2, 0),
+	DEF_GEN4_Z("z0",	R8A779G0_CLK_Z0,	CLK_PLL2,	2, CPG_FRQCRC0, 0),
 	DEF_FIXED("s0d2",	R8A779G0_CLK_S0D2,	CLK_S0,		2, 1),
 	DEF_FIXED("s0d3",	R8A779G0_CLK_S0D3,	CLK_S0,		3, 1),
 	DEF_FIXED("s0d4",	R8A779G0_CLK_S0D4,	CLK_S0,		4, 1),
diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index ffea06d77d5ea..cde59cd352957 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -99,10 +99,10 @@ static const struct cpg_core_clk r8a779h0_core_clks[] __initconst = {
 	DEF_RATE(".oco",	CLK_OCO,	32768),
 
 	/* Core Clock Outputs */
-	DEF_GEN4_Z("zc0",	R8A779H0_CLK_ZC0,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, 0),
-	DEF_GEN4_Z("zc1",	R8A779H0_CLK_ZC1,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, 8),
-	DEF_GEN4_Z("zc2",	R8A779H0_CLK_ZC2,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, 32),
-	DEF_GEN4_Z("zc3",	R8A779H0_CLK_ZC3,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	4, 40),
+	DEF_GEN4_Z("zc0",	R8A779H0_CLK_ZC0,	CLK_PLL2,	4, CPG_FRQCRC0, 0),
+	DEF_GEN4_Z("zc1",	R8A779H0_CLK_ZC1,	CLK_PLL2,	4, CPG_FRQCRC0, 8),
+	DEF_GEN4_Z("zc2",	R8A779H0_CLK_ZC2,	CLK_PLL2,	4, CPG_FRQCRC1, 0),
+	DEF_GEN4_Z("zc3",	R8A779H0_CLK_ZC3,	CLK_PLL2,	4, CPG_FRQCRC1, 8),
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
index 6c8280b37c37b..9b7e81e0e03cd 100644
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
+#define DEF_GEN4_Z(_name, _id, _parent, _div, reg, pos)	\
+	DEF_BASE(_name, _id, CLK_TYPE_GEN4_Z, _parent, .div = _div, .offset = ((reg) << FRQCR_offset) | (pos))
 
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

