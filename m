Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A45726ADC;
	Mon,  2 Feb 2026 01:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769997275; cv=fail; b=oDuOT9t8E9HifiG2GbIl6FmN/vplBpu9RS6bYC3tJmZpwba9OVizIg0h74xo5r3pBQz/P1+6FyQbbobU2sp3YoMUCwK8IrcFezAeY7DHmvsOG3HULpP3SsCoAeieQyPoWuNMyemNrOf8/YsNmVvSo2eP/GmX0ja38MsJAqg0oh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769997275; c=relaxed/simple;
	bh=rdIAL7bj4IKHd0kabTO+TDh93xeciFMJ8IvyxSsi5YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MMZgPk+k2NEpH3FRwbQxC6Y/w1NXDj7ipnttU+hIxBVxFAdhVNzGTHHRJisHSiQDQpr9uKiLsZ08vVJU5nW5AIFrtZALSkeqVoLRFs2R8tkff3P6qHMEyG0O/4ZT9Aw6nvGqRk5eVlNp08jyfSTwe6iIojUzhl8jX2sxBju82LQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p58dtMxx; arc=fail smtp.client-ip=52.101.65.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p58dtMxx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbnXsTggojRxklvJI6iBrhGHVnOUIKKiggbGDFaK12aYkDgyPWDU9NmqY73AY8dsBVa2RQDBfZItfDvOQs5yn1yrMfYCgnCtBK2vjyp2NkdwYsKNo7AMwOGitgM73qkfsPN+F2t8NQg5ZLhg6oc0DlRqlUkPvcL8KGHq46KSRrHqQTpOME18EdflE8pfW+Y6GoWtHaqHITPU1t54Sy2fjSUBke3S4oa8teOzC+NCRkzGTEEVKW9Ir8dZwkONSlrVX3ZUrlKdrodHh/vZ5aGTQEVgHlkoJII+oLZfik2Y0uA9PFTZAIMhYJN9JHp4QeN202xbkvsLWpiYcASJ8NrCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kucq8Qu1xJ05a/ByoaqjC4uaNi1fpEW8h/kk1s+U7jw=;
 b=hTZNQAB40Zp/qg3FhGVYAt+v/oPlOgL0a7unxBYM7QvfXcLLwDNwOkBjklZnyT/LBzq2cHthtbyXq3FgxBBGTYRBpqFRSeKg0fMH1pDnjr/zcgEqzEdzspDLjMY2BC+USzWcZpmTGwd+pUR0W9MTD+4McAuzkdcSwnAPO4QWyhj66HqEqdh7P5y3p0YNk7044ldBRkQ22YOW4CyAWuDDOohb9tTFonr6KapnwHpWNEHXdXIDTQrvlvl7YYhL1n2lLJ6LKAdx/tSfc0rANYW4pREgyI9FeINWsgTS0FTKIXmkyYN3TItqGSLS+SC6eal1N+ByIh33/lCmlmgisjGN3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kucq8Qu1xJ05a/ByoaqjC4uaNi1fpEW8h/kk1s+U7jw=;
 b=p58dtMxxuhNvwtUGaKWQ79OVw0MR32Ifmd2C250q0CHPBtWR9LqUEIsF3hcki8r8ej0pexwjXWiqxB1llSmgJrso/cVvJ4MRv/pccQd4WKX1BYvlyu8CBWplIqD8e8VPHE8TH+dGhBRVkdRnl+vPjYs1xjhSP3T/6KOSavoo3WaWyR4ZqbBr17Yi5E0zgsbC4qHZlrSbrXx1e8vs0PnurMNhIvte28gOaYaYoUmDJphuRmRNQ3mrZiwgDju85wWXcjPwrSFwXYYv2IBqO48DAfMcfOKmCr5HDs+WOaXnhDbTJlfJUa7Qud+dJbeVCH9ofKsknjzKcZcyJwp13m8/Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10663.eurprd04.prod.outlook.com (2603:10a6:800:260::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 01:54:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Mon, 2 Feb 2026
 01:54:30 +0000
Date: Mon, 2 Feb 2026 09:56:03 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/4] clk: vf610: Add clocks to support MTIP L2 switch
Message-ID: <aYAEM8pcuumly+hc@shlinux89>
References: <20260129095442.1646748-1-lukma@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129095442.1646748-1-lukma@nabladev.com>
X-ClientProxiedBy: SI2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:4:186::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10663:EE_
X-MS-Office365-Filtering-Correlation-Id: 614cc1e5-fcc1-4e63-009d-08de61fe0122
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u/dLMmdMNI+OUdilbN8dqqTEs4lX+3b0A18m/FNV/QNlOdaF83a+byDTXnEo?=
 =?us-ascii?Q?hDnHqbcx1ILUjmJJ6SvR/7ozI67GdfU60zKhJoNOyuFkb+qn0bZRg+e2Eu44?=
 =?us-ascii?Q?R1vVwFM+yZH9GODd1WiEToiCTAS2FiRpB2avLbJCeRfGK1+2GKZrak0xmQV7?=
 =?us-ascii?Q?cz9skFLafuL+xH8++dJv75bkv7f0C0nPJsdVtrXGgh9SWLk02E3pyO2OWYPC?=
 =?us-ascii?Q?8Bm6ser4znw/YBtQjJPKQvcTahpqnE68jFDiIFxWbkB75ww8ooOMoRkWTPHI?=
 =?us-ascii?Q?ujOc3FEHrxvsuIq3zwwCHr1pj9Ny1TDtl8hToIHMcs3wRMoiMUTYcVVZ+Yd4?=
 =?us-ascii?Q?2uryF6G5rQwgw5yzzh8AYC3hbxdD82YoF8eowRK/zfNuJFNuFvOxkI6oELrq?=
 =?us-ascii?Q?3mJnQ0fz5PFRgeO8ix6fitbOBov55mHVwBL4zs1P+3bO5na9r8N7wtPpGtko?=
 =?us-ascii?Q?dllVTArkueNxaX/ej7kFZlEh85DbQBxrakv5EOSNUVGpRZKjzoDgoReMkN71?=
 =?us-ascii?Q?Ac3oK0TkAc+oN7qUWqXOeU+0L9rPA/hnq/2YvyQQ+lGgWiVsLeu74dzxaCmr?=
 =?us-ascii?Q?9QCs4QfxQNGXo+lTqcILOxbUCXwFvh/Wp1mSkksxI9CN7aRvxr0FWgDb2SJV?=
 =?us-ascii?Q?mvgjlpJzhQYRKmkquMvPNPwqcJukvFotmQnYD48+vv5DbaDEjlptdNOgipFL?=
 =?us-ascii?Q?NBX8awxB9Syy6IHiilNNwUxAWl7UvdSGwRyoIzIyYFiEyfGf93uodE5ygfAn?=
 =?us-ascii?Q?GvGowUtn7d+WLhltxnzWVrTk9pgvsJoHKivKKb3HFSZNvNETaeTlJoO94tTM?=
 =?us-ascii?Q?LaddY+Wc+v19KnL9SDl+tgr0JQ/8/q2pDMQIkpg4WEk6oJXodVODIJg71hd5?=
 =?us-ascii?Q?o+yCzaePe0KZv+Lcal0pA/g3gx79ilbxht7429uhEnGILYLFRB025aOjOxmu?=
 =?us-ascii?Q?dm6Amg333kMgMDmYHvYfTp1nqXNMc4v+RDuMHF5vHqWQrybaY2hfyfd/ZFry?=
 =?us-ascii?Q?n8OViV2dHwTb1NmH6q9EQfubgosuQMK+0Bw+UarQekbh2wJ4IKHk4ESdnzeK?=
 =?us-ascii?Q?lj/yfQd5fLFwLY88sTd5Z74WelM7kz0MuzCmgMWiHV4Hh/9W1JxA+hoDHWI4?=
 =?us-ascii?Q?++GfTm850U9v8Ik3cvJ9yuN05M7ySfrR8sHb4fIhlY+Imc0bf6ycOcAGFmdG?=
 =?us-ascii?Q?p8qlafathrp9hSHaSlVUgUlXQp8aWitIZKx9hdVYAIGaDBT6DR9Wtt15/IJX?=
 =?us-ascii?Q?kDRwvVMue4RM9gbDzlaJum4uj7p3OK/dcCKzXIxuzcuFaAX16s85YaVHNYQd?=
 =?us-ascii?Q?aiMrj9a8d2FCMmEoXDyZgQg6U0XALCqxnrSFAwhvzm88U3FRUINVMSR1FMwu?=
 =?us-ascii?Q?BWCuXGv8ps9vHZsyZwE2Ii7gLAtHZwjQAywtb6uhM2ryIFuz0Yb4H5/1TPQx?=
 =?us-ascii?Q?E3qpKGLwjpcOkMosBe/OTu+WJ5GAxTRtcQaVAJZyy1iUw0RcWzMGLDY5ylLM?=
 =?us-ascii?Q?ZV19kX58CDEss0G/DYkTzcYdz03iGvNR6jeOlyjyRhEfk7ZA8FS6NSqVmjzh?=
 =?us-ascii?Q?X4TF25eeAF98xqAZC/o1MNXzcLBgMl/TWjCGCM79/T69ElCuUb3TKH6e0RD+?=
 =?us-ascii?Q?p85grzFP1BouoBJfkmzQMgs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aiLinMLZQJsP99hwCbaFSYxYR2fReGPZI6SDS3VlxCoVt8q8wXg0UhwtBdvd?=
 =?us-ascii?Q?HlTRMjQHWUT3xH660ZF/+dgaYcIpZxcolskjqNIWaLZInHdSJ4HjE7hcZpgY?=
 =?us-ascii?Q?qsCrV6HxeuR/3IVQUQ9OZctJmlEHCfcTsXlOdnRo9+fgRmeFbKEZwR9WYzfQ?=
 =?us-ascii?Q?Ahobvm8vsi8yltrxoxM2J7w/IhYHSlEy1J/c+8PUTSErxUik6rvVpDNV5sQ5?=
 =?us-ascii?Q?c4y2DHtOsykU3tcrRyFGVelUDLYPK4CPHgU/cStwRzfpmUkR5F3n8gFZiSJV?=
 =?us-ascii?Q?roXDpRocaXfJ5S8nIUnDSSpK/A5Sck2xzB5LCOEUn2VIsCAZYLuRMuzbZefZ?=
 =?us-ascii?Q?n+5GjAAE98uU1KG+7ZNsod+iXX1GdXoi8KILPdxSTS91OoN1leaEgxkaugyc?=
 =?us-ascii?Q?pgDoc1u+oHmClrjROj3BiTy0fNFJSd58GdJtCWCm8QbYvWqIAmMcNYHVdvmo?=
 =?us-ascii?Q?uZ4NJhBYloPr59eNR0t+rKXkdmQj9Uuxu3BvPjoWFavvTfgZ/f2TDZiRVvXR?=
 =?us-ascii?Q?ag+g8dhhJ9MqMB/O32q44Lcici5LR2WoISLdHdo+irZACSCVzEUTmPDRsYhj?=
 =?us-ascii?Q?g55J9J8cV5DDpViDp2pEo4iuIODPm9B275O74yiZQ/KJ2aRW0/hMxDIg/Fu9?=
 =?us-ascii?Q?FL8cZcohM8kWFUFoPtWwO9WK9H1ZqnjIQ4nlF7tyBeSRQA5wCoVWpmUqykIK?=
 =?us-ascii?Q?vjAhq+SB9HiMslTAYsTx7XbOT4mWJ7UO2UrYtJIKQWytcLY1eoCvk6ybyoDO?=
 =?us-ascii?Q?1owrJtJsv8tMxwAeQpCwDBPvSm53MlBa/dhq7qQe56gCOq991JJhqj6HVWTc?=
 =?us-ascii?Q?pG2Sv9/Jrzu9wSeq42VYw4s58fVp0DI2jujOxuQlW4EgBHIExgbJtEhekCsx?=
 =?us-ascii?Q?1RpBsVRTREKcLvLrfpG1lgCzSnjyElmOpdvHuG7DNfTBIFV+QZMjVOKAoTNn?=
 =?us-ascii?Q?C2BE2CboCUqD5v00U+uv1T7jDyQhgbGQgo+brK2m2OQpnJPdA7mKiSeKkTc+?=
 =?us-ascii?Q?ER83FgF5Q4QJKBNy6zqk/KqOgKZTdh7xxcNHq3gO9VmWhRupV/gB12f0Jczw?=
 =?us-ascii?Q?MaEafGonow4ITpi3hdSQGDbCmGC+SyJRxdCPS7wjpT7eRfZPHHXahxSfFaEg?=
 =?us-ascii?Q?uZphPCwpcceVMNv1hU903/8qLImgDN3hnynHQRtUFR9N44pReOVBsT2uoiZv?=
 =?us-ascii?Q?8fXjBtpebk48rZUViKmBzRYsCDWFnx3byOOcnkuCj8guXVeNzu0124PcJlGi?=
 =?us-ascii?Q?0HpwwqZwGcQ3vbXaH5E5Bog3XHajuh5aWjvTTKzXiTw0m+WxjahK+WlfZ2EG?=
 =?us-ascii?Q?y190+ikoHjGQOwvE5cumlleuqqbQq0d6OwT27nQ56c5/CWkdppjXjyE2brPV?=
 =?us-ascii?Q?sUBmOynjJ3LwXg8qc7Cpf9GHGvBPrMP1PGQFGezwoENU+S96nlobou3RYyl2?=
 =?us-ascii?Q?OsNoNvtAz8QIEMdtvB/j+Zwh5doFTEvnUdk500Tj1atiePWwblhzOUeoy67l?=
 =?us-ascii?Q?U56idAnU3Byec3EAMEWdV6Zx0wUlRek6YRQJbmxBxssKORZkwPnLys4umxjH?=
 =?us-ascii?Q?LR8Exoaog8ZpddcjVEn4GQMYz2a1tmtd9rZwgrwro4rNJb2aEw1xvP8W5b5J?=
 =?us-ascii?Q?vjt14Lb1sGo3kbGMXKljdJ40lGDG5sFryPDWAomqrw6lF72s98I3it2+Tyy8?=
 =?us-ascii?Q?YxPBH8G2oVfF6HHBqRvAGD1MERqsNHPDpuuI3Ae+JbkfF887y4lNb/5dQkmh?=
 =?us-ascii?Q?P8KQtJrBhg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 614cc1e5-fcc1-4e63-009d-08de61fe0122
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 01:54:30.6036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyOO6UD33q52QQBOGBUPP+cmnQWwOs7Njy+7ITM3IQW9BgmO8EtyWyDG9jG+Zr2EIIHV+fa/UekUgoyul4T5ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10663

On Thu, Jan 29, 2026 at 10:54:38AM +0100, Lukasz Majewski wrote:
>This patch series:
>- cleans up clocks' setup on vf610 by moving VF610_CLK_END define
>  to driver code
>- introduces support for several clocks required by MTIP switch IP block
>
>Lukasz Majewski (4):
>  clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
>  dt-bindings: clock: vf610: Drop VF610_CLK_END define
>  dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
>  clk: vf610: Add support for the Ethernet switch clocks

Reviewed-by: Peng Fan <peng.fan@nxp.com>
