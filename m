Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012029.outbound.protection.outlook.com [52.101.66.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A813164CD;
	Wed, 28 Jan 2026 05:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769579803; cv=fail; b=DPL9FF0AoSEvcFh/mGJRayO91TJ65jbUSbbvkFaMgrAzOkSrGD1x/EL3ncI+4g2g/ysK8YD6TS8vWZdHxS4bCiv6BuiUCGkyHiIfn0/wdcfvFn+aTiKo3ecZrv36/FKaloWiWTG8dZcy3fsxb67UGE/Z61SzQc2CSDaf44vNeZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769579803; c=relaxed/simple;
	bh=//EEG6Zh25zuPfrhvaMho7XmyQpfu5WAsIOGyF3tIVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WfE8zCNfMOiykbTa9fzj5XmRSdl52CHtHnY3Pd0ITLj/Y2osde6GZwktAePBYp7HLr4OYBUimgCRWDKuiYLeVY7OsfhxgUN53vA2hvFN30dB8K1ZsnHdK/uuoZgWQC7ZTz2bCAL+siZ8wWyx8x20GiWW5t6o0EO4QUaoJ+qmRmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=njBoGCwc; arc=fail smtp.client-ip=52.101.66.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="njBoGCwc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGrAZKiGpOzqrrJRAJUXD3xS7anNiKjrHbF/aCRo0l6i3JouaqkWRPtjT6OKxzajw8Ncv5MoVHzbPDP9wnybSiFwHtZ37+4T8G3mz25fTLEunVcy9xYH0v+MOMJ/e/1Xyc0ELpBZW5tUz7HfLLgyiaVGngbtUECtlFUFPvW+qwzH4HX4r0M51pRkJLuu8Z9Zpr6YTI+WJy0fcXNwVe8+954h+s3mHJAtDsVcWhYubMDMmpCAipvAuCqta+t4lKDie7/RJ/IvaLtEhS/LgAFBDFwgTZs/mafrSTbir3rqgCe7rYabi7OUzsVi78TbxJ3dVtTpp/6WXD3/ZPOzNPTy7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//EEG6Zh25zuPfrhvaMho7XmyQpfu5WAsIOGyF3tIVo=;
 b=jDA0WYnaX31cAM8zsv3S1JK1oGCA+NIdv2wXN7RWEZDi+WuAUDzrNekK8skoat5vTaqSR/5r1W1n2O3agWxdtXBBnVyO5V3rpwTnESx1tQP5FuhuaWhqlNli0UI4N/AjGoMUQMQXkX7Am1x81L9kMGv5+epUsxUfPuVDw6Fwbj3wO3qDy/OzjUMHB3UvE5aOJxJuOK9nqMqOGYJ4n5kUpOqkXUDdQheS8SxqSluxm5FMgbn17ANZwJrFfRbHiUqhhnVG/IQkGzjldyIGU2sQxp1FIcNcQzZK6ZllwwX873+3AlgTnvFRqAJNoskAkMX4NELfkJ3DJAU0K55udG6Ldw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//EEG6Zh25zuPfrhvaMho7XmyQpfu5WAsIOGyF3tIVo=;
 b=njBoGCwczVrXPFBxv2xK8titfITxLow709qheCG+6WMAXCOklopdgjYivOJ++2+BrGrXtTs/GiQTCdVF3kfmANkKkiN6WBzMs2VX0tafnY63KZUjcOFi1YWcT7rV8Ra39BuItRCu5rKFLeeD7RGY3fM2j0/NyLj5G5DFv/x6HzAgxnmHb9hndu/YKpuLR7VFQCrVPlMpkRACYGxk1xYEz7f1caZtKR2NKSNPSS+PiL/N4TEF489EnyuqreXjRC2EDH2ffkOrBRwvfmLPPQgMLXuuHIaXsG9F05AmJjmYO7+ddGCjnz5VzvbeGkbNJBFf49mIrnu1KT9AI5cUNROMJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8450.eurprd04.prod.outlook.com (2603:10a6:20b:346::5)
 by AM9PR04MB8603.eurprd04.prod.outlook.com (2603:10a6:20b:43a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Wed, 28 Jan
 2026 05:56:37 +0000
Received: from AS8PR04MB8450.eurprd04.prod.outlook.com
 ([fe80::d3ed:eac:1f17:e9bd]) by AS8PR04MB8450.eurprd04.prod.outlook.com
 ([fe80::d3ed:eac:1f17:e9bd%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 05:56:37 +0000
Date: Wed, 28 Jan 2026 13:56:25 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Anson Huang <anson.huang@nxp.com>, Bai Ping <ping.bai@nxp.com>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@puri.sm
Subject: Re: [PATCH] clk: imx8mq: Correct the CSI PHY sels
Message-ID: <aXmlCbEUsqZEDYNP@shlinux89>
References: <20260128-imx8mq-csi-clk-v1-1-ac028ed26e8c@puri.sm>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-imx8mq-csi-clk-v1-1-ac028ed26e8c@puri.sm>
X-ClientProxiedBy: SG2PR06CA0187.apcprd06.prod.outlook.com (2603:1096:4:1::19)
 To AS8PR04MB8450.eurprd04.prod.outlook.com (2603:10a6:20b:346::5)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8450:EE_|AM9PR04MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5adf0c-3d98-40cd-9a46-08de5e31ffd0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aaygdrcnzd5PMhIAw5c+G1Z94YyDkBKYbHbi77AJ9gvzNRPQW8XjxHNShrwZ?=
 =?us-ascii?Q?5sIGXdWWZZExf5pYBMJWrQ/zij9dhVifarGaw6ttrMneNBdDumdpWGlaBCHf?=
 =?us-ascii?Q?nEkw3BBh4m1iMu9+as6pTASr/bcpy97LA0e/mxNMzUA2yr+IxGlh/FDj84bU?=
 =?us-ascii?Q?Hu3be/DaaBwJ9fZH8cQMiO2QxPwy/fZnmNSEuz5E3RoNdl6aWVpRLetpSqq2?=
 =?us-ascii?Q?xaVjr5xOYNXmHqi67idBsaCQwQPnRNtwR2XRFoZKsl3yU0hgwMGvQFYxhJzv?=
 =?us-ascii?Q?v3u8AoEjDtqWGwPSNugqsljHasg3I7ZtY+vgLuh9ZHtzdYaR7F+AUZ8AjYnS?=
 =?us-ascii?Q?lpC9oD8xBCfPipEuEzt+2zGIbpOK7yzOswVMh/FuJoTsJ1uN4GNt6LTOk7/5?=
 =?us-ascii?Q?65wnX9OanIdn7+EFMwGwhHkMeLeWkKTbov1svmDrcwISQp8H9h5afSbglDXY?=
 =?us-ascii?Q?jUzlRD+YWTCC32KPOsCCCSDaWVbusmo/u7XDHtMpvVIARlifvzVMAyUCvYUp?=
 =?us-ascii?Q?2qqbnZqRxfT6b64LCVqaJ/GQWbKuCLMcGMe6eoUI4Uj1f1Sl9HFPOTTJjbu7?=
 =?us-ascii?Q?YiNmOCVwNPgawGKa+D/q0jVKjbpVd/OFzws+iDosFNwullzjkaPXhAYKukji?=
 =?us-ascii?Q?8NI0wA8o11DsoZaeq3Wv4YJXmBm7nX1cJMkXl9npYQT1xGFX+veqE7he15LJ?=
 =?us-ascii?Q?5TOafFxldC/ILdu6PDV2hrK63RfCaV90Q1pbtVfHOs8X5IQg0yB5UZPp6/a2?=
 =?us-ascii?Q?NxTBNp230wDJQFJyiczP9IDd/FNHTUQ8E65nKhjlqlfEs3zG+lrdCwgsHbXE?=
 =?us-ascii?Q?sOyzfi4MKOn8ijExJl4Gdr5GBS1RDZBW2xiXFqPT9+kArDr8tuaK91Lf/j3b?=
 =?us-ascii?Q?fZVqxlo48GOVs2/7QyNkrpQRViqm6MaFPhKdXAAtPi5xTEfKE8LPny1NYzML?=
 =?us-ascii?Q?q64JcKk/IFLvfKfM+3aEHadoYEHsy9OPC9bbyXupkQgM3qMg1PpedV32rFLL?=
 =?us-ascii?Q?NT/LSmzVInT7E0Qja/o2+4JJ3rWKG/8sg9pLc/BUvYvSpbllPBsfjtv/v9Wp?=
 =?us-ascii?Q?ehFRyVsboTitptzqEOQjNr7ayqbim76wRPiic9WGjVr0JRRhAyrrJmGaXWUf?=
 =?us-ascii?Q?Ml+Y+st6Aq1wCtl+Ww4AjR0fF+oRbUgHeBWuWvNhJaTjyazO8RQXu0kQCqVr?=
 =?us-ascii?Q?MoeBapZ7WiTOQOQFHNR5O7cSJz2uzQdaYSxNbgYhmUKNKbfmzYwxxO9EkOLb?=
 =?us-ascii?Q?km7psHuKnDP8n91xBIIElJislZzFWfef6IzLD2A1+kya5hxmgE+h4m7hMX9m?=
 =?us-ascii?Q?gVO1Tv1OUSOd16qqEmgi80iq0zq1MiS0eDetIY8nv+X+Lh/7Yjb6abO3w4Nw?=
 =?us-ascii?Q?zEIkjrgt3UrunCax6dn0PsXwumB78AX0vnbIDVBIbIZhQDVCcDLsA+7hYyfh?=
 =?us-ascii?Q?woX2sHGsqohSI0A7moHTo133eXa/ENW5IZ1mK9i7yq8Ph1gfcVn3b4ZIj+ct?=
 =?us-ascii?Q?DnEQhqL9FsayfZkKV5pAo/UG/P/R+lfm+IqJSRVA0EC26x+c1+462VotukZg?=
 =?us-ascii?Q?VAr2hqPxAxtlyosOwcLiOE7aoyVw7rq77S7sIlOVUZnJaLNu2BCEgdDKEOrX?=
 =?us-ascii?Q?O+dCRb6e7zIPD9J498KcMw4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8450.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VIZaLX37epYAtvZ2t+Bu7Eovisks33DKUGqEuKVAZukyH/jLe1UNz9TG0Uqo?=
 =?us-ascii?Q?PRsSRnGj27Fnf5Msjv14MfrbZ6sDLuodrhVvnZUb1NnfEmQ4d32RftRxWCeL?=
 =?us-ascii?Q?mI2yFmPEzaDgHVDPO9AquDHIsFma+gCw6fs5ifB7O60g6MDkXELdDdYd6SUP?=
 =?us-ascii?Q?MX8fvMOXPHBKz5FUB7ltJNcLp8XlA7yeXBRoEHSBzvchCyp20Aukqcg3mkiF?=
 =?us-ascii?Q?3vXuJQWeACrmjnIwzmJk9MJTSQkTLp4iwpbjbeutiIF35hBG4jOulgHuy4o0?=
 =?us-ascii?Q?j75vJ7vWrfwkcJ/2N/a/8L2GaQ66jze/X882AzeHSBHPjUavgjotnBjveu6s?=
 =?us-ascii?Q?o+mCResWXAXmMa7EzBITFndJWgPQhNEAOEq+mBiehb9bLU8vQ5lvyakiVx61?=
 =?us-ascii?Q?b4TZQAKIFFXGZrFfKf49tzBDIB4GoLIOjA0iVHpEIWzPUIAFgMuI/Z84SFES?=
 =?us-ascii?Q?e+w0bcqAEvyQw/R951E2g60nvUUM84dQy+Q4P6MicKq9iYTsaHUthvqEudDz?=
 =?us-ascii?Q?36Z/qq0RoDP8Ho7sNF+tOuELTC12l0SeNBARGcvrMAxbXc6Z0i9WcaZDwtTw?=
 =?us-ascii?Q?TrR/lQnZ5QenJWSsfpbd4YPrpMr/AsmowEavnhYbTMGxFa0O5be/8xvw6GYj?=
 =?us-ascii?Q?Z1PhagFYR3QsCqwBpmW96k41JkA0OyVLWjiYvNFDh0bWLnvFCARyNdERv5R8?=
 =?us-ascii?Q?8lVklH/A1epyhN2fJQvLjC9FXq6RO+FRhAM6f+dgvVKrthSEl6jQthFPxokp?=
 =?us-ascii?Q?cW+rpipogqbLDlmQWTYDbGRi2uTSFOC8/KnE5F+YJHOLRKicrRgomqMabqRz?=
 =?us-ascii?Q?SXnZMTcmE1D5xKvX6FKMy5pKEWFxWocWFJVRpb3dAjfkt2gcNTgRLd9eHQE1?=
 =?us-ascii?Q?1/tsXAEIw0jmF0FjRH8VGQki0mx9hFhvgM01vDiO5nkNzeEk3FzNxOkw7tVp?=
 =?us-ascii?Q?vl2dfKlexaGkBRxFyCwzCZ0YpdmehFNutyZse5VhVE9mwTivRLbzrgXUkI6F?=
 =?us-ascii?Q?L5lFszsyON3/II7IVhYYuFrMANg5LhDblGPxZDU3qadOn80bvEWQHQaPPdb2?=
 =?us-ascii?Q?qNDrLdc/RJQsIu1mD472XSp4a/5Dh2UMvJj+0toDkmlbXeOuYGEGIlS+tngC?=
 =?us-ascii?Q?2kE2Ihvhjlu97cBQWYCLpfo6LMHrmBfcY2hOKlq50XcsSB3f4r+vit9LwCXg?=
 =?us-ascii?Q?EApbJNwNjAGrdj1oLGSacpAxbOJYKQyVO9TBsgS2WTQa5Lz8mVznRitMnRsj?=
 =?us-ascii?Q?06aidZ3EApDAaglJ9pAINTldd12XFGCpvuHjxz4f5tu+LQwU4UNo/3CYcBfS?=
 =?us-ascii?Q?duQMcLSl9e4V6IPcwOREjsooreFR7u2+Xa0XDcKWqk065m6ozC1YUEZwu2TT?=
 =?us-ascii?Q?ULN7F41RrbkaiWt5U7QH+Q2v7yIzqeglYwaxWdaKvUjoHX7lpaQ6yyNLzUiK?=
 =?us-ascii?Q?fLeelRQOUDCe+m4sgHdIaKANsI9y9SZ4MaJZ5Nr5zDEk1YSkF4Rf8mXe5X+g?=
 =?us-ascii?Q?ffMDW39eaw0eBIgdwmTdnxoFVRndL9ZxARQ05OMvlGAjaokN7cKra6zbv/Fm?=
 =?us-ascii?Q?90fF8bVnqLLbZJ3u8qIFbqJ6JOqvX/jcfSOap6SNPlVe84pqLgkyMPRecdy/?=
 =?us-ascii?Q?UXiRmUC9Cd9DHG2WM4Dr802/j7MYO4kEKEvpv/dMoQM9qSITlFE2PkEVcmx6?=
 =?us-ascii?Q?PUvFJC1f5UYUxbhEvI+08v49xp6bq3SGDTRMi0TiEqrhPbbyhttYL07clxHQ?=
 =?us-ascii?Q?W6+ZpwAz2Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5adf0c-3d98-40cd-9a46-08de5e31ffd0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 05:56:37.7035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hreh5Xo8KJ2IAT5E8DT6Ts2oT4bRYv3Fln/LK3xx38cDnk9pc18ivywvAseKJbXCX7woKgKn3vRP4eBwTcNIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8603

On Wed, Jan 28, 2026 at 12:47:21AM +0100, Sebastian Krzyszkowiak wrote:
>According to i.MX 8M Quad Reference Manual (Section 5.1.2 Table 5-1)
>MIPI_CSI1_PHY_REF_CLK_ROOT and MIPI_CSI2_PHY_REF_CLK_ROOT have
>SYSTEM_PLL2_DIV3 available as their second source, which corresponds
>to sys2_pll_333m rather than sys2_pll_125m.
>
>Fixes: b80522040cd3 ("clk: imx: Add clock driver for i.MX8MQ CCM")
>Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

Thanks for the fix.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
