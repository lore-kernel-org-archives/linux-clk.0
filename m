Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010045.outbound.protection.outlook.com [52.101.84.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDD0233134;
	Sat, 31 Jan 2026 16:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769876233; cv=fail; b=PAujg22aK4FtbBnC1NOO4i27JtyI1saNsxaKCFJvUNza6oWgtMP6wOT8VPzg+loNZEhik3pv5ILje0YsZQQxJ5d0df1r1A/K4rocMZbKJum3AZJHy8+eYBeE3F6A6rwxAMSXRrDhxfu5H7EWJEYrMgmi9ytr1PLdt21Q2ihdm8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769876233; c=relaxed/simple;
	bh=xw3u583G9mZcGgd4eXKgbVbWoC5WDctqbgk/E+sxdlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l8jmOnsZo/Yo1lTDOFTFGOvaAMEvRu9NcKT/8k6MvwppPopo37/ty2J5hexakI0QCftOiZdEqQtRUlNazdjRK4e081Gw2jH6FEQcNN03g3xpyZsw3tOS8DjFR7HlFa8xH6EssPApk46BN2nxBdLrWxw3Li31zaFGmsPcGQ/S6Uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gn/WxH+1; arc=fail smtp.client-ip=52.101.84.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gn/WxH+1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfqKbeRPomhjR0shdVaH72BCLmrrIKY5ves0I72zJXYnnTFPH4gIjZ1pOP95/TSQQLBqNTzVQzS7txWCIohYxAx0mllIKdlbv4HqnchVw2MUUM34ceufdR4S7XdzugLHs7e5hKwKN4JPPOTWJxFMKiedZCw9RHgjWuQ2ew0MNk3GGP09fWG2IH9tqq5FoAfm57N1VbQufRq8PKXW4CawdfQwct97vplxMqoz+DWI3uO3+XMcHZf8n6FcrgOUGd4zSQ+MFHo6VzQMouPE0+W9QXzdXREmucrM6lKZ44urmZfKz7/jjnmROFN1JRTG4PiXk7FimBe20MvFmkVGnn0dHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyLdIySIBGmr3bqBKIpg+LvbK/h6o5Td2cpBQoxKVQw=;
 b=AswXs+njADRfZKBWrPnD6KF/6nh8laoDsjsU1CDlalVo6VEgzdlxHXyvyvXaGpt5dsCL5RjZHwZ+ai5xlCK8Gaz6vFh9awpC+o92szLcjW6KimFiKXXtK7Uwx8izFHh/hzEwQxGF3Y/N4+4cfKy0JVhjunFhAfBlvNAdmj/f1/hxSsItLNx4zEoM5IC5M4IDjl0vyyvVyrvEnr0QfJcofSzANX1WTSBvY/36upWgQJgomWcU0DyRSwBAoV1bcwCBkNxCJEVHiKTVUBkFPAlR3ZiV7h1rmfpcpk07LmYpOLowRsB0SA/bpUcunhGQ41SN2s2emI3/Q28QeT+cPvCSEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyLdIySIBGmr3bqBKIpg+LvbK/h6o5Td2cpBQoxKVQw=;
 b=Gn/WxH+13DYFsOBRrmK2IbXRMfEqzU+tEW0SIQmZcXEP9EwsGq4jZcxkQ62ek4Yz++T97tAVWcHxoFOvVGOvq1wLLjYtKqeCGxggP+UMtb4YGDwim71yfex312VATU63xURZir5eSCRSyEZE0RChxe2oimvlNP8Zwzbk3DbZCXpFHKJwCsIgOw85Fd4H6yq7UahTDaviY+Nq8+NgAg333eEVw9b8lFySevLAchwGGkCcHSjHyrkNEqqpowO9/Yzk3nuox9tL4suwvJnt5D/ZeqAGFWO4kpoOTUEeEm2ui6DoKukyGWAKVf+eNBgCX4Yl434UQ2t3r42qtcdHF0qU+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB12114.eurprd04.prod.outlook.com (2603:10a6:800:315::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 16:17:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.010; Sat, 31 Jan 2026
 16:17:08 +0000
Date: Sat, 31 Jan 2026 11:16:57 -0500
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Akshay Bhat <akshay.bhat@timesys.com>,
	Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: imx: imx6q: Fix device node reference leak
 in pll6_bypassed()
Message-ID: <aX4q+W3Sjx5SRHrC@lizhi-Precision-Tower-5810>
References: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
 <20260131-clk-imx6q-v2-1-70471ddc99e0@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131-clk-imx6q-v2-1-70471ddc99e0@gmail.com>
X-ClientProxiedBy: SJ0PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB12114:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c5c6bd9-47d8-467f-cc30-08de60e42e37
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?922F8f4LGPT1L4Up7VAfE5R/H/wRwNkwjyzVXzicj9W1+QTNEtbpZetbClov?=
 =?us-ascii?Q?/W3CDZ5XMObuJEYVDVDbbyVz6/GR2zfvMBiFIgMODrNCKzOpJab6gajiZ8dW?=
 =?us-ascii?Q?nEpOoMfzc4xFARXCatG2j1yynrv6Rf96LM8TQy6O+ubuWBB3nIMPJsisTa45?=
 =?us-ascii?Q?CmBFOhWiuz+HZfMSVlomHiXdMYCmVioplxgQASlANTWVbUUOOv5QoqSIOJjR?=
 =?us-ascii?Q?znf335MGKipWcCsX7xTuDfpMGdLGIK+jk6yFKre/oHcexoJbh5yeS3mB8xo+?=
 =?us-ascii?Q?gzWXM6AnZetq7bkH6VO0LovIzZt/9Xvzco2qJycs+W7jJPyzcdS06/K09uU1?=
 =?us-ascii?Q?WBVNPbvR8MJoYBO49C63G89z3mlwXHk+rLE1p29mYBw3/uwOTAmnvlMMlSOg?=
 =?us-ascii?Q?8pjTqLAP+4nB/JNUB/ZNaT7Doe2KOzd2T+QcB239jxx9HAStGzJqk8KlCeMR?=
 =?us-ascii?Q?k7WaRdJ3SeMaI61afidUNQ/ZCgGwihlGHhROx38PzXilpzlNH+kWXCDKLAUl?=
 =?us-ascii?Q?LwBvS6aCp2Nm10fHWX8nSvoShUjI1b225nqHM5/dOVmEpx+RGgM4p3M2uy2+?=
 =?us-ascii?Q?9qQAPpIFUV1j2Swt0EQhf0n9HOSuYu6LQO74dvirwK6bnJLIoTo2EnJY6afH?=
 =?us-ascii?Q?Bz0X+Z6Ry3svb1nBIe26siBwnQzKn3ckhlVCuOAM86aoFBa0AdfFnbbOJq4z?=
 =?us-ascii?Q?O8eFnMNitDWjgw4chuheE3udDeMVRZznHeQj0R5swhD6sU5Sb18msv7nx2JH?=
 =?us-ascii?Q?6yx+2mB54rSG7KzVLcMiGidwOqp6Y/CZtJggmRA8DzX4pdjEbQMAx3wq5nko?=
 =?us-ascii?Q?RCWH4O+KPuazD/lHTZGE3zLLBOJeoS4dIr9eW8XAOhDDLo9R4vGXZ75KLxPx?=
 =?us-ascii?Q?swKoReayQTjeHmchM7ncSV3lA2k89wpJE7t6c/1gIVPFHXgskHxAx8KYEhT5?=
 =?us-ascii?Q?c+CV+YnRZSDeqdMsSpGleG1gglbOqnNtDLtc0pJC381JktfRL0ftNgv3Om+c?=
 =?us-ascii?Q?sTjdqe3Wg1NTUP6GgIGlOxRORL+vIl26dCxwjgUO8elPfPNauXPBUdXTv8cc?=
 =?us-ascii?Q?brAxr716d02BrkDrdl1ZY7c3fxQSHjH/vDatatlCbvBU1KF1U4blOHJBj30Z?=
 =?us-ascii?Q?5QNkbP71oRmA/hDTkAHZ/VHtsoAG96Qs0nePGmDkq4cYKQ1AyYsUlheuAqdf?=
 =?us-ascii?Q?yC1Arx4ilcciuzXHu4t3F9jRA3yGBrtpENPs8eEbVuz4WKQAmnluNvF/+ivl?=
 =?us-ascii?Q?XCwjynNtqXX/Y5Q3cBWY0mG1ctncmpVGreBTDcqf2EGPhowm6G1wvMx8g2V3?=
 =?us-ascii?Q?e5N6QhSU4MRzYhqsXWr4LAatgC2yRNJ5WJZjUmbnYuQVcTC//hpM9szy+RJW?=
 =?us-ascii?Q?2bL4tCPCeV+RKyEAKyHv9qtHwgA6tCFvjJQCbm6YzCmGHlcTM+YPRMg5gNqs?=
 =?us-ascii?Q?dbk0J6z8ZWQPaBKTiQdgi1/mknXmOmatRnFC1z84YacepSup2dvQ6HU22fTD?=
 =?us-ascii?Q?fKsNDM8SZ7ILCbK2RmAFv7b9eIFqJNPlz3pK7YVWsoacxRG365FIWMHsFh+G?=
 =?us-ascii?Q?bqXj/Y5J7jYu455iWBiZD3g5Uve8xhGdZtjCkiiGRZO7dVsJEZ6idn5wNeFa?=
 =?us-ascii?Q?BVtzfcc9Xv76QuynolDnw4w=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?90LUuuKXvdWr7OAFlXYR4Tq5c+ncCCu/JuhKz386LJTXvGMFZi2iE11n6+a4?=
 =?us-ascii?Q?0fEdRyMNwaLgcxTQmiK3weRuZQleTOqLzgGIfapBJKmMQXXQQopp+GhTkxLp?=
 =?us-ascii?Q?TRB0bQlUXvCHvpp5dsVfuQQ2PNM282M/1uVT+0fzQkUm0oH1HpdoN00yuAtG?=
 =?us-ascii?Q?WeLC8gVPHSQ12w0G5/Ygi/mw5Yqttdpnx6+AWtV7ETUs5hDPkEwFhlZF5+wy?=
 =?us-ascii?Q?I5LyPyzVZvQ5SXnsYlXz5o0k3A7KpXJekoSUcg6R9bgwi8/q6CU0n7uttuwp?=
 =?us-ascii?Q?XcPPe8YF1CTWkgqUNMTaFGq/bu9eoAGwMRiKsfeKCAdwkZE8K5eOkQyAepWI?=
 =?us-ascii?Q?8kvsQwBTQhUcf2KThpNYZRtudOh08U/taoQjB6tEeCBDCYB1f1M9GuG+9I4K?=
 =?us-ascii?Q?MsKUu7GV6o4jDdIMPQ+F+GKcFmbKNN40TRvCrYWGqKwYn5sK3NHZnlGYSeRS?=
 =?us-ascii?Q?hvsdZIs5pX9acfWAX9TeDns9suvyNkCSAUWosRKdn5qpqhml0F/O/LHKrcCn?=
 =?us-ascii?Q?cBifxYe57fCnFRnBfUcqNp9pYY/PPFBqeBZSiuPmGpXP9qmyXyzAC5VTP3l8?=
 =?us-ascii?Q?oCVnm1wYJVrUxVqc5toeYHiOx+SKPfXunY1ofZoIzXWJ7nyWxxVZ06t3u3cZ?=
 =?us-ascii?Q?PK3106T47IpQxCwr8YGsFrbZfQsLvDwqC3RFzr5BT/zdzBUagv7id2oSK10I?=
 =?us-ascii?Q?uClI3BLf9z9D+tHFAD9nx83dRPK5Z7LTupwASfoLa37UJ4JCTsw/0B6lyHvI?=
 =?us-ascii?Q?iAnwp6nuyJLeJobfHMSh/HjMHqBvRw0RX0UgYV3moE+oUKVdEhXSDfl82NYX?=
 =?us-ascii?Q?9C48KZvo0C7gSDPYwn+j0HsM2S8a0TDRDpunmKQKCdGXnoGUtMuUXHQ+3xzB?=
 =?us-ascii?Q?9N3TuB8MiNXILM8pDSCSkOBR47EQqGSPg4jlG6tjSG8OCpl5nnRD2ugYYSXX?=
 =?us-ascii?Q?U2LxXHrHtC9mpmuGORlwRgByQ+ZwshBZMzmk+K5pD7RyDb6TU52SCGCuz74f?=
 =?us-ascii?Q?wOgVhbDM5MG+/lT6wTHOmzOAm13D4bdRy0G+vBaLE1NXmLjOU0xs4rlDKoJk?=
 =?us-ascii?Q?1uZIismiiiUr3LlmuWGRfOeu5EOVQm9b6lWvnR9RaRyyqJ+DOaAWfxFtYcpo?=
 =?us-ascii?Q?s/zKIbEkPSpZKoS6y5yObWZgCJJma+444wVSce9idsNtxSg8+8rtV6Nvm31f?=
 =?us-ascii?Q?hz5hNLwyOuGgqbdD1+ds9ECmjA0qFM+UqpItdhm4+rNzDe5Lrbx4vtZazhef?=
 =?us-ascii?Q?3cmpi+oPKS9gAUfxYPT5S2um4O+wqlzJKGK6LQT5uCJiB9o5KI0wnrAW7coG?=
 =?us-ascii?Q?bnqBBHYufp59dUnIVt0+OP9uv+Vc4WQG41MoMdOZyd6138sleyq1g3aiDeFN?=
 =?us-ascii?Q?foUBoL80tjwjTieL4q/Vg9+ax3SYwOSo6pZqPCkDkQICJpz0hwPKBd3gbn2m?=
 =?us-ascii?Q?vmPqRXXXAB6NdoW/pKsAnXFlCTMcbGs7g6MDev1vFaAuLGf1FZSW5uOR/JMo?=
 =?us-ascii?Q?bcPHIqmrqkaLRtdP0O6SGJUQ2J8j6pNDi01bygIEKQ/BYa3xsCN6m7uhFJPV?=
 =?us-ascii?Q?/sCwDoGYpj0fw16ApGOm3nEiIzxKsMOXzNMlhCizGR23dH4PXD9mWbNKWa/Z?=
 =?us-ascii?Q?3yQExPynwlSlUrh/425B7EDYA+ZtU4JrymF13POf8tMeSBtM9Q8hnBdbJ0Le?=
 =?us-ascii?Q?SO8M/KBIf3DFJDjtAaB1V2aDfr2QmrVvjpkaZCEMQ2aUEfxt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5c6bd9-47d8-467f-cc30-08de60e42e37
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 16:17:08.0442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/e5UKqNJl4IFN8hsQ3DB2h+bdXGO/ZYhihKvg6Z2aYOagXWnfVLFkORm/EUbIAtIQi3fdZ9Qrd77igalOJvcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12114

On Sat, Jan 31, 2026 at 04:11:34PM +0800, Felix Gu wrote:
> The function pll6_bypassed() calls of_parse_phandle_with_args()
> but never calls of_node_put() to release the reference, causing
> a memory leak.
>
> Fix this by adding proper cleanup calls on all exit paths.
>
> Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/clk/imx/clk-imx6q.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> index bf4c1d9c9928..1d8e8f0891a3 100644
> --- a/drivers/clk/imx/clk-imx6q.c
> +++ b/drivers/clk/imx/clk-imx6q.c
> @@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *node)
>  			return false;
>
>  		if (clkspec.np == node &&
> -		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS)
> +		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS) {
> +			of_node_put(clkspec.np);
>  			break;
> +		}
> +		of_node_put(clkspec.np);
>  	}
>
>  	/* PLL6 bypass is not part of the assigned clock list */
> @@ -249,6 +252,7 @@ static bool pll6_bypassed(struct device_node *node)
>  	ret = of_parse_phandle_with_args(node, "assigned-clock-parents",
>  					 "#clock-cells", index, &clkspec);
>

If ret is err, clkspec will not touched. So clkspec.np keep old value,
of_node_put(clkspec.np) will put twice for previous np.

So need add if (ret) check here. Or use difference variable clkspec with
init 0.

Frank

> +	of_node_put(clkspec.np);
>  	if (clkspec.args[0] != IMX6QDL_CLK_PLL6)
>  		return true;
>
>
> --
> 2.43.0
>
