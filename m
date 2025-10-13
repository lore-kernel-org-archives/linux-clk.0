Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A1629D282;
	Mon, 13 Oct 2025 18:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760380468; cv=fail; b=tzb27kUxIg0eIYMMctadXBjbwCr28h8BN6PASk3HJqR3aShDhFh2m5AfNkL93vBZMH73Q69hravRVwnUAe7v/xzQGmok4pIWXRMbL0dUc2gITJf9bCQ54p0YTWn2q8xxL73JSRlkSyHOoWw9iWFpiV0Bc6d+nzSZvdWFgMtvJek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760380468; c=relaxed/simple;
	bh=Fl4w5yrs8SR941YyiLFWSeg7eXod+mBWRbnGDZ8dmPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gt6Z19eALY2Usd3ml6Zs8aZaXfvD3aDjG4eRJULSuTVetrYvXytvcB70qtm6/FT3carTq+EWbZiAuldvv8ZyCIL3xzkhIwQzwJGzYmpWZXYemCu1B+L47nnYpXdFq+RLQMOqhCGIK9wYj6SVQGvUKOwfU3EZ5LN549gYvOYZaCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M3l6GtmK; arc=fail smtp.client-ip=52.101.66.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M3l6GtmK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ho3d43YxHjFmrcJLiSt6Sjv9v9+n1GtcBfWIRynfzk2hrrgm9zB87MgByzUP55GW5pezk6KkkiVhQTkYPlJrb49b1wimNbRp8lXgvSMcfExH7gFJDmDduO/PhWCiQw5dk0AaV+0E8uLD4JM99yEWJ4j3h6UzQ8aJ5cZbGQgg6o/1UmlpaRw+yWILwt3DtXOJftOwJYsE8DG0JGahfx4iZgAT4vJ0jQQXEGrR9iGAiYeAJT7b3E80seCiXUZ25cfXe4DF8QtMYEB8fhQv43B05q4w9LwDpV2wBS1R5OUV56owKfcDtPgcEZnvTxCoCbFyxxZBklJHF+sjMcSz+KT4/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtPpCPyLzKH5tA4Vg4MFuqFsAbRWtFnQP3zc8NG/C9E=;
 b=Unb0CSpx1PclnK3U5LLgUMGiGXJmy8FECmBEKBVw67dxxxjrM0xLunV39HnjA3SPWE7wbEcYiTINDdEk4zVSdWX+TcM7vG67bK36rCQs19y54aZcrnzg+CPHzBxDTVStYozdCn3C6nzlwcE+0mRTgg0Fp1qLancp06iG5YyIquVrj8GNNLapZ6eZTAiLyRioj2gUyhKWreXsX1o1bQ2Tsn7jPIvCgXGYWwKWDk0kvI9yxvT/rmlPF+OJ/kCnLZBnwVjmlovP0YAWc9CbI1N+YilL0kndmpHTGwRVofZHRbTm2QFQPhJmk4QqOS2hzhJcvRq8fawnTLMsyOBSo5ov6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtPpCPyLzKH5tA4Vg4MFuqFsAbRWtFnQP3zc8NG/C9E=;
 b=M3l6GtmKYwcPoey0copnC8WPVH8SvXfEb14eJcEheyfJci7ifGLpCXP0c+TyeeUqkgjMssxLVsk/4WKxO9gLbJUUE3QrcifMVun7DJsjJQrtkifjaIeTLWkvJZWD/JsT7YVkS2bTn6FadxD7CH20YVRueRe37syf+PovFjlnHYsIa8G9oXUjAsgV8tNMJGcBP3wQ56QsisMeQjuVpYZ/LckyTr13YAgfCSF+9MSXunIQ+/okqGcq/2aan1Uf1nZ6eYSOsWWFFBVYvrKQvevCr2++2oKjYDGfs7xb6f979jHNi/cq2Rvcjbu5cfFaGho3rx6YbZ2mMxCgWuD/S8EYag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DU4PR04MB11755.eurprd04.prod.outlook.com (2603:10a6:10:621::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 18:34:23 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 18:34:23 +0000
Date: Mon, 13 Oct 2025 14:34:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 13/39] drm/imx: dc: fu: Describe remaining register
 offsets
Message-ID: <aO1GJX/2MsA0a2x9@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-14-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-14-marek.vasut@mailbox.org>
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DU4PR04MB11755:EE_
X-MS-Office365-Filtering-Correlation-Id: 564d3438-1fc4-4e01-207b-08de0a872146
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?LNuAjDGEBuBD/XT3ORe/mEeIj64Tnr5pLXGJtBw/7HtrwuL/DfOkUKAPPDNg?=
 =?us-ascii?Q?ml/j0d4fSorbRCBHgXFuYRWVjsM4hycabd+CDxW61aPcwjOcU0RKLHBlTJTH?=
 =?us-ascii?Q?mRV3TaskWrc06i9z58do0vzQefeQe3QQRbsixyjVDKyx2HTk4kLlhvdlr/oS?=
 =?us-ascii?Q?KagC9BwXrTyGwgpHtTqznH+NY9h7pljUwyjCWkGX0vGbVaZwh2kEM3v/4THI?=
 =?us-ascii?Q?wvLjTGkvZZeTCrYicQw/g9gpH/SqEjo5uVEPEzJ2/cPg6XB5XTMlZuiGPnSs?=
 =?us-ascii?Q?75BeOZVmgPCS3smOxHNV4q0HQJSxShq/yJJOOWjqMUvpa9JEPmW98BnOSEzh?=
 =?us-ascii?Q?rmiv7y2TtQWGcCI5QzWBAXhIMgywwh0sJUhEiP0ZYsikjDSJKK0oRiVcyCAD?=
 =?us-ascii?Q?n7/WLmiYQXUwwE8pGPQz/TcFszqeRZrsDj20JD2ZEPLvaEM98R5UGAQMqJoj?=
 =?us-ascii?Q?y/eoY0cQ9bO141IlzpYr1J4sg+B6OblZs6E3qI8vx7VZ0wyQSWBVJV/hae/l?=
 =?us-ascii?Q?syLtlEu0QpTasIwiTyqH/m5arZl1V+5DO/Q4SMKnM+YF9LIVWnIHfYx2WVRi?=
 =?us-ascii?Q?9dAuYK1mQ+acxJ64CdKpngcML+bzqZcR/QhkCiJZOR8hxSyUZLwyJE6G4l7u?=
 =?us-ascii?Q?kc++3quhC77DM5/+FDoZvkKSeo1ptqmwlE8Slh76zzbIjEDbdMQpQI8blW1N?=
 =?us-ascii?Q?/9UqNxlYSpFRcvBvS9VZJbegDG+jhCQPP2Gma+E7Y0H2cnMgUmjDpOC8Nkzc?=
 =?us-ascii?Q?6DyfvTC9+5ZRVtfBvuj6WJvJJYOeOM3NUcwHLyv6S8H6lc+eXw9G5ybh/IRH?=
 =?us-ascii?Q?X42I2k48pv4N2lYjDTgbEkIQWm4pFHKPxsaFDweWESKuxbRK3LXRtXf7va83?=
 =?us-ascii?Q?7z+v3yyTr3ZNfF7BYZjhWnyHa5K4I+OEkOAdxj32NINyBLZZwpsv5cJCnCFU?=
 =?us-ascii?Q?3hxlgUMH3nTmw2F5t+bzCDBGHB9tsF50D4kJU0s2P+IvyBJ20pqkQpNnCRiv?=
 =?us-ascii?Q?f11AxhfpEmxH4i4zImWYOMqUpjI5dXS6FffB0TRBuptBjN0E95pD6WKUfGa5?=
 =?us-ascii?Q?Xw9FQxaKBrhI0FfA5x7K8o+AcnWhTzlOQ1QFdyFG6syU2JnZ0YRalWrCeH/T?=
 =?us-ascii?Q?AzLempVw5y6f28Jm+2aZRD3eyPL0rPlEMXTKrsnPW5aswkz9OdR4PLK4TjgB?=
 =?us-ascii?Q?hR1FFWtnMAyjGGJRv84hFquiLRI9AuTqwE9aqq7kFVcJzZ48TlAumm66n2Nq?=
 =?us-ascii?Q?eBA3uxGVn9ljNHt4QPq9lq21D36BOFyoTXmLXb1B3As2yHsCiW5FTja4ZkI5?=
 =?us-ascii?Q?m+qnIuikkBMlP3An9Cx/qpRGxySktu/aRri9xXBOtaumgCFUuTDt8Q7KBF/v?=
 =?us-ascii?Q?l+ToH9b5nqNQUa6GKXhRFADKCf3cej2qcmm9XGYNXFA3TdEHCT8VjLfuPrxr?=
 =?us-ascii?Q?bQMRHk4cUe5BsUqRRPXbIVB45SDdZljO6MihIxD4jPc1el9O4Muat2dwRBNd?=
 =?us-ascii?Q?2C3PL9dYcT1TbIUrYzzRNF+qm9bg4hm/3StW?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?lWLCSFClvNYNKDvhNh8pkEbAsW5D9rpKgW8YUAcenRTtE/vUXT3nOzuJ4WYI?=
 =?us-ascii?Q?3ZpkawuWz91fafmf0hmwPwYgHsDhEyFTpuZoQLj36GkTj/4iR41yZryPPktT?=
 =?us-ascii?Q?4Zu6qPlOSgNuuTGimRk0UWpl0jnsmt2PJ+kwtI/XsnwNnS04RiQy8mcDxtI5?=
 =?us-ascii?Q?kp9AiiIs9Xq1OZghz+ZULbCFyBa11zLtaeIN4JrQYVXeL7duHTdgkOZr6Mla?=
 =?us-ascii?Q?goD7DYEutygPPU7bY41XabkI6MfQuyluNmQtIWaY9i8lFmVQf+2Ft4CwkyK6?=
 =?us-ascii?Q?ERSb7DJ/Upj5DuJAAGKOqM5aQHe3BdHZU3KYZThqp6NWQ6HwdaN19ozDmWRL?=
 =?us-ascii?Q?RbYvGBC1hfCBJ343cE8PvbX5NdKS8aHXJwvjMpQt2mqFpT+3GReaQhk6d1cR?=
 =?us-ascii?Q?8AjeLczxiw0H6lYfxvCVHFCMNqU1jXCo87y2QF+BYOJWd37NsUbkFqgHGIf4?=
 =?us-ascii?Q?Cdswlw6GejiOwJrErk9L/HWSB9Sz4veSse7K701CdIunIPKoleQ49xiM24Jz?=
 =?us-ascii?Q?m7N5o1N6gKcLOTw3KH62fzKn88mPvBMU6e99VcKMDXpDvDNtKFzfwoIkKu5Y?=
 =?us-ascii?Q?httnYSHmEl03C+UOONNNXo496iFkrsslbpFEjzS4UW2nRHbRNUev3fgucjwp?=
 =?us-ascii?Q?F2/CUI1qhyQrZDP4rmrqsKcmDoN111IPs1AlOwX2jr5qdfudpSBAor+rWYoC?=
 =?us-ascii?Q?fH0uNPJ6ojFR30Ulu03rQ7zQdNIDUbdfVD2xrwfRnTVlkYz74acrwyRhV+ZN?=
 =?us-ascii?Q?zV2Rsi9VsU+Fbaf780vzee3cXEH+MkCHWMNkXXO9x6QiOqlgm2hLJMDGY3rF?=
 =?us-ascii?Q?2/t8YyUPs6wGGg4Gqxd5WbRsnvtg+fTAWZVciuRtUQLwa/APl84E7pL/5gBc?=
 =?us-ascii?Q?GKaV0PXWy3PdE/zPC9/Naal8jT5hLR13Hygh9RzbPiKtRAJPi9LKRmFcSd09?=
 =?us-ascii?Q?GXv2sXihyqj1HPGDmfKoa8VzNbepGNuCA8WXFhDx6YnW9jSvHeXtBCEPaJnM?=
 =?us-ascii?Q?BOWl4HG3hxucCelfa7e6Hf7EKkScqp3IMRHRo/c1kndFGJHIsaesczCgwSuk?=
 =?us-ascii?Q?NtBWGEK4JxihK5K6x39kYC4Y/LsLI+iGT5wzqUEEb622VoEpAK5+CmIzbb4G?=
 =?us-ascii?Q?lbfw/FdVqEdgiYTSNP5FGbpBjdwEjoWe1mRjeY2rFyM0LRDf69YqA2yEOzTx?=
 =?us-ascii?Q?NOtqKERLRsbxc33vxKexz46VY1kBHITMEWGRBlwuRkqTtlLt00hFiGo5AAWC?=
 =?us-ascii?Q?d3uZYgBcsDxq7ver5/7jPeiUSldp9nb6Ysz3Vlad4w3FwzxFjeKosKuKi2lU?=
 =?us-ascii?Q?21VGn9XGdKTYggICfDO+G+SWuSpQrkSCNardILsBSSAe+McxWrCwgVVgF/bB?=
 =?us-ascii?Q?TqjieC0tkqMi9X2bEMsAi8dtrOzys70o1pL9+TXHmfGQaDJeGlXirYDdIw/e?=
 =?us-ascii?Q?Dl1fOlnd1luQEBdNvFNxbFVAyfyeup9KzUzNXrY1ntEuaG8zFEjna/F4tIhI?=
 =?us-ascii?Q?SWqirP/em9HJ+Dxra1k8cTLhMuPCaSUrE6wBtKv3NVoywu89p0NzmYUpLHZn?=
 =?us-ascii?Q?iSE0rMs6COMfo3uTbr2ACYzcFcSJBRmc66rAyI3/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 564d3438-1fc4-4e01-207b-08de0a872146
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 18:34:23.1118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYqlYYghmU67SNWEBWKEKyHc055C831taqCcE2ikEKauF+WJQcIRtnoTDyTNuIUVFaS3cG5kP26dYMF3ULQp4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11755

On Sat, Oct 11, 2025 at 06:51:28PM +0200, Marek Vasut wrote:
> Describe the rest of register offsets in struct dc_fu { } and
> use them throughout the driver. This is a preparatory change
> for i.MX95 addition. No functional change.

Nit: wrap at 75 chars to try to use full line.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  drivers/gpu/drm/imx/dc/dc-fl.c | 12 ++++++++----
>  drivers/gpu/drm/imx/dc/dc-fu.c |  6 +++---
>  drivers/gpu/drm/imx/dc/dc-fu.h |  4 ++++
>  drivers/gpu/drm/imx/dc/dc-fw.c | 10 +++++++---
>  4 files changed, 22 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
> index d4e746f8c4297..8571871c6a683 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fl.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fl.c
> @@ -63,20 +63,20 @@ static void dc_fl_set_fmt(struct dc_fu *fu, enum dc_fu_frac frac,
>
>  	dc_fu_set_src_bpp(fu, frac, format->cpp[0] * 8);
>
> -	regmap_write_bits(fu->reg_cfg, LAYERPROPERTY(frac),
> +	regmap_write_bits(fu->reg_cfg, fu->reg_layerproperty[frac],
>  			  YUVCONVERSIONMODE_MASK,
>  			  YUVCONVERSIONMODE(YUVCONVERSIONMODE_OFF));
>
>  	dc_fu_get_pixel_format_bits(fu, format->format, &bits);
>  	dc_fu_get_pixel_format_shifts(fu, format->format, &shifts);
>
> -	regmap_write(fu->reg_cfg, COLORCOMPONENTBITS(frac), bits);
> -	regmap_write(fu->reg_cfg, COLORCOMPONENTSHIFT(frac), shifts);
> +	regmap_write(fu->reg_cfg, fu->reg_colorcomponentbits[frac], bits);
> +	regmap_write(fu->reg_cfg, fu->reg_colorcomponentshift[frac], shifts);
>  }
>
>  static void dc_fl_set_framedimensions(struct dc_fu *fu, int w, int h)
>  {
> -	regmap_write(fu->reg_cfg, FRAMEDIMENSIONS,
> +	regmap_write(fu->reg_cfg, fu->reg_framedimensions,
>  		     FRAMEWIDTH(w) | FRAMEHEIGHT(h));
>  }
>
> @@ -133,12 +133,16 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
>  		fu->reg_baseaddr[i]		  = BASEADDRESS(i);
>  		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES(i);
>  		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION(i);
> +		fu->reg_colorcomponentbits[i]     = COLORCOMPONENTBITS(i);
> +		fu->reg_colorcomponentshift[i]    = COLORCOMPONENTSHIFT(i);
>  		fu->reg_layeroffset[i]		  = LAYEROFFSET(i);
>  		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET(i);
>  		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS(i);
>  		fu->reg_constantcolor[i]	  = CONSTANTCOLOR(i);
>  		fu->reg_layerproperty[i]	  = LAYERPROPERTY(i);
>  	}
> +	fu->reg_burstbuffermanagement = BURSTBUFFERMANAGEMENT;
> +	fu->reg_framedimensions = FRAMEDIMENSIONS;
>  	snprintf(fu->name, sizeof(fu->name), "FetchLayer%d", id);
>
>  	dc_fl_set_ops(fu);
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
> index f94c591c81589..cc8b0d05891fd 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.c
> @@ -113,13 +113,13 @@ void dc_fu_shdldreq_sticky(struct dc_fu *fu, u8 layer_mask)
>
>  static inline void dc_fu_set_linemode(struct dc_fu *fu, enum dc_linemode mode)
>  {
> -	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT, LINEMODE_MASK,
> +	regmap_write_bits(fu->reg_cfg, fu->reg_burstbuffermanagement, LINEMODE_MASK,
>  			  mode);
>  }
>
>  static inline void dc_fu_set_numbuffers(struct dc_fu *fu, unsigned int num)
>  {
> -	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT,
> +	regmap_write_bits(fu->reg_cfg, fu->reg_burstbuffermanagement,
>  			  SETNUMBUFFERS_MASK, SETNUMBUFFERS(num));
>  }
>
> @@ -132,7 +132,7 @@ static void dc_fu_set_burstlength(struct dc_fu *fu, dma_addr_t baddr)
>  	burst_size = min(burst_size, 128U);
>  	burst_length = burst_size / 8;
>
> -	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT,
> +	regmap_write_bits(fu->reg_cfg, fu->reg_burstbuffermanagement,
>  			  SETBURSTLENGTH_MASK, SETBURSTLENGTH(burst_length));
>  }
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
> index e016e1ea5b4e0..2a330c0abf6a1 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.h
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.h
> @@ -105,11 +105,15 @@ struct dc_fu {
>  	u32 reg_baseaddr[DC_FETCHUNIT_FRAC_NUM];
>  	u32 reg_sourcebufferattributes[DC_FETCHUNIT_FRAC_NUM];
>  	u32 reg_sourcebufferdimension[DC_FETCHUNIT_FRAC_NUM];
> +	u32 reg_colorcomponentbits[DC_FETCHUNIT_FRAC_NUM];
> +	u32 reg_colorcomponentshift[DC_FETCHUNIT_FRAC_NUM];
>  	u32 reg_layeroffset[DC_FETCHUNIT_FRAC_NUM];
>  	u32 reg_clipwindowoffset[DC_FETCHUNIT_FRAC_NUM];
>  	u32 reg_clipwindowdimensions[DC_FETCHUNIT_FRAC_NUM];
>  	u32 reg_constantcolor[DC_FETCHUNIT_FRAC_NUM];
>  	u32 reg_layerproperty[DC_FETCHUNIT_FRAC_NUM];
> +	u32 reg_burstbuffermanagement;
> +	u32 reg_framedimensions;
>  	unsigned int id;
>  	enum dc_link_id link_id;
>  	struct dc_fu_ops ops;
> diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
> index c1131b7b17c2f..dc036121f0d23 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fw.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fw.c
> @@ -91,15 +91,15 @@ static void dc_fw_set_fmt(struct dc_fu *fu, enum dc_fu_frac frac,
>  	regmap_write_bits(fu->reg_cfg, CONTROL, RASTERMODE_MASK,
>  			  RASTERMODE(RASTERMODE_NORMAL));
>
> -	regmap_write_bits(fu->reg_cfg, LAYERPROPERTY(frac),
> +	regmap_write_bits(fu->reg_cfg, fu->reg_layerproperty[frac],
>  			  YUVCONVERSIONMODE_MASK,
>  			  YUVCONVERSIONMODE(YUVCONVERSIONMODE_OFF));
>
>  	dc_fu_get_pixel_format_bits(fu, format->format, &bits);
>  	dc_fu_get_pixel_format_shifts(fu, format->format, &shifts);
>
> -	regmap_write(fu->reg_cfg, COLORCOMPONENTBITS(frac), bits);
> -	regmap_write(fu->reg_cfg, COLORCOMPONENTSHIFT(frac), shifts);
> +	regmap_write(fu->reg_cfg, fu->reg_colorcomponentbits[frac], bits);
> +	regmap_write(fu->reg_cfg, fu->reg_colorcomponentshift[frac], shifts);
>  }
>
>  static void dc_fw_set_framedimensions(struct dc_fu *fu, int w, int h)
> @@ -170,12 +170,16 @@ static int dc_fw_bind(struct device *dev, struct device *master, void *data)
>  		fu->reg_baseaddr[i]		  = BASEADDRESS(i);
>  		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES(i);
>  		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION(i);
> +		fu->reg_colorcomponentbits[i]     = COLORCOMPONENTBITS(i);
> +		fu->reg_colorcomponentshift[i]    = COLORCOMPONENTSHIFT(i);
>  		fu->reg_layeroffset[i]		  = LAYEROFFSET(i);
>  		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET(i);
>  		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS(i);
>  		fu->reg_constantcolor[i]	  = CONSTANTCOLOR(i);
>  		fu->reg_layerproperty[i]	  = LAYERPROPERTY(i);
>  	}
> +	fu->reg_burstbuffermanagement = BURSTBUFFERMANAGEMENT;
> +	fu->reg_framedimensions = FRAMEDIMENSIONS;
>  	snprintf(fu->name, sizeof(fu->name), "FetchWarp%d", id);
>
>  	dc_fw_set_ops(fu);
> --
> 2.51.0
>
