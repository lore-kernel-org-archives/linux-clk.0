Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FE532B12F;
	Thu, 16 Jul 2026 20:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784234233; cv=fail; b=tqNokglhpPxG0VkyG9s8EXXvyiYmQBE/rE7V4VZsxdATf1R62/uhU21pS6zCg3T/6EjxfvrPXbm3sqgEhUPnZLtCj8JUh0iK8A8s2GiU/BdU3QY2bD46rdWpUbvPiDVn7N4wJ70qlezDhxDg/q2RNUs4lMMDoLJUFSMs07KHXrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784234233; c=relaxed/simple;
	bh=8WNlxaRiAF1PcZf3ksh68MuJyk3AVcZ2GNFBVKuJJEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cWGqXWguvex3zTd7xRopD/aD6lOrq3wVbh1ao0CaMZhXLqTCyLLB78om48MZ9hbkUlYimlF9kpxN05IFR08bxQkFTl0ijKGqr7Dt8vmMlsVd3tzEZrA2/RacZW6ovReOqp+omAzcRHsnCdVgohgzxgv/Qg86FkpoTEJrN/aQzfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IUSG7Sqf; arc=fail smtp.client-ip=52.101.66.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IUSG7Sqf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgWSYrlX0KmmpQtR3UlNOpIIVo42Fma52ZT8LnlkuqkSGov8VwbHhRrPGp7cD0YxDdpXNDFdKGC4LuoHQbTn4IQFOMpdKrPYtUV7jPS0j30VD2ICah5OtuxLPmTcGZNWNL626pdyyMcqOhrkeT3PWSPxS+pDv3schRPRPygD03fO+51jiVgFXqDreAdCI3TK7cK4Rs4/d8bMuhyzAfEn8QdAi0vxLCzBM5Tws0Cw6N88wdzsxwEi2KDTwFJmRY6Kz2RCdN6vkjFdhJnOxk9X9hw0kPbfNUXdEuVfjFvweNPz9vZWFL9VhCNslO8ftXFe6MbysX71hTLr6X7xKixv2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gx0T0l88rMkPg3z0h6eEXzSiOuYCjM3f6HGfmTL8eE=;
 b=hoicb+QUOHWZ7U9Lerp6ubrZRACCDcM7frwAhOFBxuXlp/jRmP1doyMQzFvhdeQxXp2k1X9S256BXNXtfTXTuqiBbcpq7lHoKTHpL8zghviyoHQF6qhckuHU6xO30mHpViqIgJHyhE1bBxTZtKN0pvn4g+S6PnssSX2AA5y824LIIJfgmpFFyYlnDT4qjAaFfdvBzaldH1+nq6kIdU04rZ70iGbZ1nAEAU69goUnWsYpaOyJ7AAS+oepSq1maBerne8RlIVO3ZWWYCiERf3tKg+YKg9w6qAzclFEZ69YCURyAYJR1iEwYgO18/MJ1llLTtvrYm9f0k0JfXCiVjheXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gx0T0l88rMkPg3z0h6eEXzSiOuYCjM3f6HGfmTL8eE=;
 b=IUSG7Sqfee2gpORvXSrqGunVIU9BoZdfiwDIKXfKPbrKjNKSGlb19oyhboqG4iRwW35x9+fzL4sZ2ovK8U2AtGOL3KV9VD6nJLKuJzs7REjB/83FyOlcXk5jUY9Bu5oYC1mAhi9VF3UD804c3LEKc/GlONyeb8Sb5DeVSKkzhDOdr9B+gnigWN1dEOYjDtSJDx4OvQERWq3mtRm0JjtyfbWOAycuH2u6JnetJWlj+XQultGYMrogGiLoTvJKozkU+uzYXa5Q2Q0ZyzJPcPUmFPZuuA+TeV6dBwjjozCt4qVsL0c3oAbzOVzDnruyfo8ZnZ03Hk8HYRXR6OyzBrcwAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8265.eurprd04.prod.outlook.com (2603:10a6:10:24f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 20:37:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 20:37:06 +0000
Date: Thu, 16 Jul 2026 15:36:56 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v12 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Message-ID: <allA6Mbe-XwhAA9V@SMW015318>
References: <20260716-csi_formatter-v12-0-2601d17fc4af@oss.nxp.com>
 <20260716-csi_formatter-v12-3-2601d17fc4af@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-csi_formatter-v12-3-2601d17fc4af@oss.nxp.com>
X-ClientProxiedBy: PH7P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 881dc89e-6570-4d05-caee-08dee37a001f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|23010399003|6133799003|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
 lrmjKAJt/zVNk52P0UkeL453Pr5X24j6JvJNPV3q+BBYfXWqepyVjoIVW6Mph06zIWt9GTWNYJScHk/vlGqBZQzCDm6F/heNvn8jGTIHo3xestW59r32lxYExPYiTERUqPq+oT8TqG3YNaRyD2Zsydopa8RBSYVF5O+t6ElKjp5KcSIIezrEZBRj9yzjUwSM69PBQb3uomXl8O51Y8NIP2v+cul6rsZQuMs3OFv7HsvnJkOvjLHDUTOLJkG6zxCpLlOxJR8taiR7dCp7Df4+n78d/kRMIv8IpVn4XkOTWhTfOlFj2tYZpSX86o63sMFZvjHQMhZXi5UuGSVkkIYI1AW8xvK1qlbGKajjFrAAXZIRVRM1qkRz/4vFEgqJSUJebq1TcFEbvzIgE4TZDVtGPjOMRJTulDO8/OwBLI9Sh2hYNNF1GkxOzX9Q1Yz6v4UeqCR146qCqdRT4F+5nkuCoRS8U+aTZ5CdFpJ0+P/itfGPfkSVc0Nk74pNH+SmjcnWO8v4uM/P06Vsrj6oyyxOGHEVsIwqpgKJmOfFvZbGn+ZMcufaMD2nPow3LF5frsSXZFWAW4dMWgSw5ZM3+lruH90uh0DOiaKlLAgAYThnyVocGELyHWrpmMWT4Q9ARRiBS2vxlNrK7Nag/obb0Y45g8zxFhlh3VXFcDl3Zp1UkEU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?lJ8TKueygQWNW2g+btKOdxQvNhp0pCHd1QkPEHHVTYfSALtAQrslgNc2xRAL?=
 =?us-ascii?Q?iO/nBB4imamVizxf0FsxBkNk0O2iJIjqX/Qx8B8H7YI77TZa75rGPA47RkhG?=
 =?us-ascii?Q?r3McT/Wu7y4zN2UldIrz/DQsSapAb5K6TfHyQThKerLRnvBs9FAZnY3cbOCQ?=
 =?us-ascii?Q?NWcSfHyDGlc4PetWcAbBRZsWtIWBOmUKpFfugXlqBff833ZTFz35B+jO670a?=
 =?us-ascii?Q?zpEu9DKYdGw5sVuNyuAABQo9SfoiiWtaKgQSrBaEk/uW2GfVvlFqxvtZ9Vz4?=
 =?us-ascii?Q?ol1gcrRLxt9tCT1Ie2Uj6xZWW9BqJk9xipEf5ufz1Nd8W+YlW9KNB/wm8I1m?=
 =?us-ascii?Q?nM+KIGHguSlxvkfxJrvPrzWYT1ksbXUCqCRXU5BNPrlzhg/pIGPPZE3cPNn4?=
 =?us-ascii?Q?3m27EEt/ky0mTj+/DYlHpABzEQ55O7I9HecOFgkQ2CXuTg1beO8Wkbl2sKwg?=
 =?us-ascii?Q?MEGJCaZuee1cCbzCngkCT00b0WDZYlAZoaQ1E0y3IZ5/raN/D9XTDe1TjRmO?=
 =?us-ascii?Q?YnuHiCjvDIBOPHJTlzmBK4eTmgm3bTGdrDtXHSeM0N73GrPezkDDpRCZbhII?=
 =?us-ascii?Q?KfuMHZ38e7XKBbV8St4eb/pLnTBSI12gwQZnJ4H4kZawZBFKaLGIgugrh6ws?=
 =?us-ascii?Q?9j1ZvyHN3SJLwJ+XhA81nkdpkbIGAC6blppYAgCvtTi7mWBfXZexzPMC1G0B?=
 =?us-ascii?Q?h0Ik8HReus9fiw/q6L84MupRZsplnaLHxvpVtI8J5iY36VooX55zbrdbrj+v?=
 =?us-ascii?Q?k9xpDi3uEPw9Tk0WiAtps8VCXjz7hKGG/sOh0Vt3EsRuKx8ILLdxz8B3xJpQ?=
 =?us-ascii?Q?Why7JuCrFOrfqHJMbyR6oz7lmv3bjvpjcHttNB0J148udZ4tAj6AK2jsqy1w?=
 =?us-ascii?Q?PmzaqStRPIdw6gs0IuZUWtvSAtsZ8yYrW055X9mZgsFq3M5UxsnGz2uQsFCP?=
 =?us-ascii?Q?Om030Y3gTjZ6Alc7AbwG81vmQya/8j+Sy1dafKoiPuetCXgOSdPjcvB1lo7h?=
 =?us-ascii?Q?V/eNHtyPXgZ8jHg3dMhpOBEHzitT6MaZtf/nfhFGDDqwvzBAgxnDFDvMoypV?=
 =?us-ascii?Q?XwDmSlA7IlsCDN1yDk896ed5w4YNV2iYFYmZNmnDaaFyfqa3LlA2tP/fScyQ?=
 =?us-ascii?Q?TUkuVCMCplLT8K0iHS3L6QXGPJmG0ub3r9LMR5tc+IlxNXY6i9yXZ9lKra42?=
 =?us-ascii?Q?vEhtDILvMm7F6rv8TElF+SYo6zpOrTfPUKUtKX/XCOL+LiuqjbvbNvxU2MGt?=
 =?us-ascii?Q?rzWKGSfYSRk4xapVSYHJQL0JvubyItqetF9kfHCxe4dNx6u+vPiq77NIYkqb?=
 =?us-ascii?Q?oBBPkxS1Gqxh/MlezXOgcn6SRpat3XpnISyOmQrPfJtjDp00hTCNDKXGh5d2?=
 =?us-ascii?Q?cGINVAdtPLMs9jwqO5kE21qkgEqpm6RJqPCd/4uwy1QS3HX3OBe+HR/crCW5?=
 =?us-ascii?Q?gmFLD/q2seXp2FrzomZX1hdhr1VqDKiUIre3EIS2jNI0gR4Mb4OfcpeDvfLp?=
 =?us-ascii?Q?dYeQQ7PDHFPWMynN/o0zkKT7CZzlkdVrCIS6V6WHEbixjLdpfjnKosy5jCZK?=
 =?us-ascii?Q?Fvbor1XBDZ2f4miJThIERZhJYivzZ6drCoarOkrjUnkctupg/9f5LWGhQ6u9?=
 =?us-ascii?Q?IH+4bZK44+fikSyOOX3NJ8Bgmry72bTLvAB9318yg4qLttvuRqPoN9QgRAdB?=
 =?us-ascii?Q?i1oFv+3Zst9GM8tEaqz27tKwZ+IybA2eBzNpNhhfmO6/318dZD3QwiVCNimg?=
 =?us-ascii?Q?2qje/WHfgjlSRDjNkNlVU/sRV6DfvluGGsH7idwCxH1SAyRU3DAc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 881dc89e-6570-4d05-caee-08dee37a001f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 20:37:06.4017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOxOwPkRaN1JIR35rYY0aT8Q89Cdqn3lLrBNXFSWwkjsF+FYLvmhX5+dfBES/1gjY3tHEJaK2/UXWZTahAn/vKbcxM+raTPSlH8DvgTyuvbTh2OQviixYE8JGznRNOCS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8265

On Thu, Jul 16, 2026 at 03:13:51PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The CSI pixel formatter is a module found on i.MX95 used to reformat
> packet info, pixel and non-pixel data from CSI-2 host controller to
> match Pixel Link(PL) definition.
>
> Add data formatting support.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---

Add qcom Loic Poulain <loic.poulain@oss.qualcomm.com> and
Bryan O'Donoghue" <bod@kernel.org>, who will help cross review nxp patch
according to nice summit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v12:
> - Fix stream ID handling: iterate routing table instead of assuming
>   stream ID equals loop index (0-7)
> - Remove stream_to_vc[] array: derive VC from routing table and frame
>   descriptor on each start/stop operation
> - Remove V4L2_SUBDEV_FL_HAS_EVENTS flag since driver does not generate events
> - Support stream IDs 0-63 by using BIT_ULL() for stream masks
> - Add get_frame_desc call in stop_stream with proper error handling
> - Add csi_formatter_read() helper function for register reads
> - Use read-modify-write for CSI_VC_PIXEL_DATA_TYPE register to support
>   multiplexed streams sharing the same virtual channel
> - Use route->sink_pad instead of hardcoded CSI_FORMATTER_PAD_SINK
> - Write back coerced format in set_fmt before propagating to source stream
> - Drop Frank's Reviewed-by tag due to significant changes, requesting re-review
>
> Changes in v10:
> - Use u8 for vc in csi_formatter_get_vc() and drop vc < 0 check
> - Add MFD_SYSCON dependency to Kconfig
> - Fix stream/VC mapping potential mismatch in start/stop_stream functions
>
> Changes in v8:
> - Remove fmt field and look up format from subdev state instead
> - Unify function and structure naming to use csi_formatter_ prefix
> - Remove misleading alignment comment from set_fmt function
> - Optimize get_frame_desc to call once per start_stream
> - Replace V4L2_FRAME_DESC_ENTRY_MAX with CSI_FORMATTER_VC_NUM in loops
> - Remove redundant debug message in enable_streams
> - Use MEDIA_PAD_FL_MUST_CONNECT flag instead of manual link check
> - Fix typo: Formater -> Formatter in Kconfig help text
> - Improve grammar in data type index mapping comment
>
> Changes in v7:
> - Update references from imx9 to imx95 for consistency with dt-bindings
> - Enable PM runtime before async registration
>
> Changes in v6:
> - Remove unused header includes
> - Unify macro naming: VCx/VCX -> VC and parameter x -> vc
> - Remove unused format field from csi_formatter struct
> - Use compact initialization for formats array
> - Make find_csi_format() return NULL instead of default format
> - Use unsigned int for array index in find_csi_format()
> - Add err_ prefix to error handling labels
> - Add v4l2_subdev_cleanup() and reorder cleanup sequence
> - Update enable_streams debug output format
> - Rename VC_MAX to VC_NUM and fix boundary check
> - Update CSI formatter Kconfig description
> - Use v4l2_subdev_get_frame_desc_passthrough() helper
> - Fix error paths in async registration and probe
> - Add mutex to protect enabled_streams
> - Switch to devm_pm_runtime_enable()
> - Remove redundant num_routes check in set_routing
> - Optimize get_index_by_dt() and add warning for unsupported type
> - csi_formatter_start/stop_stream: Process all streams in mask
> ---
>  MAINTAINERS                                      |   8 +
>  drivers/media/platform/nxp/Kconfig               |  15 +
>  drivers/media/platform/nxp/Makefile              |   1 +
>  drivers/media/platform/nxp/imx95-csi-formatter.c | 808 +++++++++++++++++++++++
>  4 files changed, 832 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efbf808063e5..05009228b162 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19275,6 +19275,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
>  F:	drivers/media/platform/nxp/imx-jpeg
>
> +NXP i.MX 95 CSI PIXEL FORMATTER V4L2 DRIVER
> +M:	Guoniu Zhou <guoniu.zhou@nxp.com>
> +L:	imx@lists.linux.dev
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> +F:	drivers/media/platform/nxp/imx95-csi-formatter.c
> +
>  NXP i.MX CLOCK DRIVERS
>  M:	Abel Vesa <abelvesa@kernel.org>
>  R:	Peng Fan <peng.fan@nxp.com>
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> index 40e3436669e2..8f49908b0022 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -28,6 +28,21 @@ config VIDEO_IMX8MQ_MIPI_CSI2
>  	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8MQ
>  	  SoC.
>
> +config VIDEO_IMX95_CSI_FORMATTER
> +	tristate "NXP i.MX95 CSI Pixel Formatter driver"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on MFD_SYSCON
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This driver provides support for the CSI Pixel Formatter found on
> +	  i.MX95 series SoCs. This module unpacks the pixels received from the
> +	  CSI-2 interface and reformats them to meet pixel link requirements.
> +
> +	  Say Y here to enable CSI Pixel Formatter module for i.MX95 SoC.
> +
>  config VIDEO_IMX_MIPI_CSIS
>  	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
> index 4d90eb713652..6410115d870e 100644
> --- a/drivers/media/platform/nxp/Makefile
> +++ b/drivers/media/platform/nxp/Makefile
> @@ -6,6 +6,7 @@ obj-y += imx8-isi/
>
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
> +obj-$(CONFIG_VIDEO_IMX95_CSI_FORMATTER) += imx95-csi-formatter.o
>  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
>  obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
>  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
> diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/media/platform/nxp/imx95-csi-formatter.c
> new file mode 100644
> index 000000000000..cea60327c972
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
> @@ -0,0 +1,808 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +/* CSI Pixel Formatter registers map */
> +
> +#define CSI_VC_INTERLACED_LINE_CNT(vc)		(0x00 + (vc) * 0x04)
> +#define INTERLACED_ODD_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(13, 0), (x))
> +#define INTERLACED_EVEN_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(29, 16), (x))
> +
> +#define CSI_VC_INTERLACED_CTRL			0x20
> +
> +#define CSI_VC_INTERLACED_ERR			0x24
> +#define CSI_VC_ERR_MASK				GENMASK(7, 0)
> +#define CSI_VC_ERR(vc)				BIT((vc))
> +
> +#define CSI_VC_YUV420_FIRST_LINE_EVEN		0x28
> +#define YUV420_FIRST_LINE_EVEN(vc)		BIT((vc))
> +
> +#define CSI_RAW32_CTRL				0x30
> +#define CSI_VC_RAW32_MODE(vc)			BIT((vc))
> +#define CSI_VC_RAW32_SWAP_MODE(vc)		BIT((vc) + 8)
> +
> +#define CSI_STREAM_FENCING_CTRL			0x34
> +#define CSI_VC_STREAM_FENCING(vc)		BIT((vc))
> +#define CSI_VC_STREAM_FENCING_RST(vc)		BIT((vc) + 8)
> +
> +#define CSI_STREAM_FENCING_STS			0x38
> +#define CSI_STREAM_FENCING_STS_MASK		GENMASK(7, 0)
> +
> +#define CSI_VC_NON_PIXEL_DATA_TYPE(vc)		(0x40 + (vc) * 0x04)
> +
> +#define CSI_VC_PIXEL_DATA_CTRL(vc)		(0x60 + (vc) * 0x04)
> +#define NEW_VC(vc)				FIELD_PREP(GENMASK(3, 1), vc)
> +#define REROUTE_VC_ENABLE			BIT(0)
> +
> +#define CSI_VC_ROUTE_PIXEL_DATA_TYPE(vc)	(0x80 + (vc) * 0x04)
> +
> +#define CSI_VC_NON_PIXEL_DATA_CTRL(vc)		(0xa0 + (vc) * 0x04)
> +
> +#define CSI_VC_PIXEL_DATA_TYPE(vc)		(0xc0 + (vc) * 0x04)
> +
> +#define CSI_VC_PIXEL_DATA_TYPE_ERR(vc)		(0xe0 + (vc) * 0x04)
> +
> +#define CSI_FORMATTER_PAD_SINK			0
> +#define CSI_FORMATTER_PAD_SOURCE		1
> +#define CSI_FORMATTER_PAD_NUM			2
> +
> +#define CSI_FORMATTER_VC_NUM			8 /* Number of virtual channels */
> +
> +struct csi_formatter_pix_format {
> +	u32 code;
> +	u32 data_type;
> +};
> +
> +struct csi_formatter {
> +	struct device *dev;
> +	struct regmap *regs;
> +	struct clk *clk;
> +
> +	struct v4l2_subdev sd;
> +	struct v4l2_subdev *csi_sd;
> +	struct v4l2_async_notifier notifier;
> +	struct media_pad pads[CSI_FORMATTER_PAD_NUM];
> +
> +	u32 remote_pad;
> +	u32 reg_offset;
> +
> +	/* Protects enabled_streams */
> +	struct mutex lock;
> +	u64 enabled_streams;
> +};
> +
> +struct csi_formatter_dt_index {
> +	u8 dtype;
> +	u8 index;
> +};
> +
> +/*
> + * The index corresponds to the bit index in the register that enables
> + * the data type of pixel data transported by the Formatter.
> + */
> +static const struct csi_formatter_dt_index formatter_dt_to_index_map[] = {
> +	{ .dtype = MIPI_CSI2_DT_YUV420_8B,        .index = 0 },
> +	{ .dtype = MIPI_CSI2_DT_YUV420_8B_LEGACY, .index = 2 },
> +	{ .dtype = MIPI_CSI2_DT_YUV422_8B,        .index = 6 },
> +	{ .dtype = MIPI_CSI2_DT_RGB444,		  .index = 8 },
> +	{ .dtype = MIPI_CSI2_DT_RGB555,           .index = 9 },
> +	{ .dtype = MIPI_CSI2_DT_RGB565,           .index = 10 },
> +	{ .dtype = MIPI_CSI2_DT_RGB666,           .index = 11 },
> +	{ .dtype = MIPI_CSI2_DT_RGB888,           .index = 12 },
> +	{ .dtype = MIPI_CSI2_DT_RAW6,             .index = 16 },
> +	{ .dtype = MIPI_CSI2_DT_RAW7,             .index = 17 },
> +	{ .dtype = MIPI_CSI2_DT_RAW8,             .index = 18 },
> +	{ .dtype = MIPI_CSI2_DT_RAW10,            .index = 19 },
> +	{ .dtype = MIPI_CSI2_DT_RAW12,            .index = 20 },
> +	{ .dtype = MIPI_CSI2_DT_RAW14,            .index = 21 },
> +	{ .dtype = MIPI_CSI2_DT_RAW16,            .index = 22 },
> +};
> +
> +static const struct csi_formatter_pix_format formats[] = {
> +	/* YUV formats */
> +	{ MEDIA_BUS_FMT_UYVY8_1X16,	MIPI_CSI2_DT_YUV422_8B },
> +	/* RGB formats */
> +	{ MEDIA_BUS_FMT_RGB565_1X16,	MIPI_CSI2_DT_RGB565 },
> +	{ MEDIA_BUS_FMT_RGB888_1X24,	MIPI_CSI2_DT_RGB888 },
> +	/* RAW (Bayer and greyscale) formats */
> +	{ MEDIA_BUS_FMT_SBGGR8_1X8,	MIPI_CSI2_DT_RAW8 },
> +	{ MEDIA_BUS_FMT_SGBRG8_1X8,	MIPI_CSI2_DT_RAW8 },
> +	{ MEDIA_BUS_FMT_SGRBG8_1X8,	MIPI_CSI2_DT_RAW8 },
> +	{ MEDIA_BUS_FMT_SRGGB8_1X8,	MIPI_CSI2_DT_RAW8 },
> +	{ MEDIA_BUS_FMT_Y8_1X8,		MIPI_CSI2_DT_RAW8 },
> +	{ MEDIA_BUS_FMT_SBGGR10_1X10,	MIPI_CSI2_DT_RAW10 },
> +	{ MEDIA_BUS_FMT_SGBRG10_1X10,	MIPI_CSI2_DT_RAW10 },
> +	{ MEDIA_BUS_FMT_SGRBG10_1X10,	MIPI_CSI2_DT_RAW10 },
> +	{ MEDIA_BUS_FMT_SRGGB10_1X10,	MIPI_CSI2_DT_RAW10 },
> +	{ MEDIA_BUS_FMT_Y10_1X10,	MIPI_CSI2_DT_RAW10 },
> +	{ MEDIA_BUS_FMT_SBGGR12_1X12,	MIPI_CSI2_DT_RAW12 },
> +	{ MEDIA_BUS_FMT_SGBRG12_1X12,	MIPI_CSI2_DT_RAW12 },
> +	{ MEDIA_BUS_FMT_SGRBG12_1X12,	MIPI_CSI2_DT_RAW12 },
> +	{ MEDIA_BUS_FMT_SRGGB12_1X12,	MIPI_CSI2_DT_RAW12 },
> +	{ MEDIA_BUS_FMT_Y12_1X12,	MIPI_CSI2_DT_RAW12 },
> +	{ MEDIA_BUS_FMT_SBGGR14_1X14,	MIPI_CSI2_DT_RAW14 },
> +	{ MEDIA_BUS_FMT_SGBRG14_1X14,	MIPI_CSI2_DT_RAW14 },
> +	{ MEDIA_BUS_FMT_SGRBG14_1X14,	MIPI_CSI2_DT_RAW14 },
> +	{ MEDIA_BUS_FMT_SRGGB14_1X14,	MIPI_CSI2_DT_RAW14 },
> +	{ MEDIA_BUS_FMT_SBGGR16_1X16,	MIPI_CSI2_DT_RAW16 },
> +	{ MEDIA_BUS_FMT_SGBRG16_1X16,	MIPI_CSI2_DT_RAW16 },
> +	{ MEDIA_BUS_FMT_SGRBG16_1X16,	MIPI_CSI2_DT_RAW16 },
> +	{ MEDIA_BUS_FMT_SRGGB16_1X16,	MIPI_CSI2_DT_RAW16 },
> +};
> +
> +static const struct v4l2_mbus_framefmt formatter_default_fmt = {
> +	.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +	.width = 1920U,
> +	.height = 1080U,
> +	.field = V4L2_FIELD_NONE,
> +	.colorspace = V4L2_COLORSPACE_SMPTE170M,
> +	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
> +	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
> +	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> +};
> +
> +static const struct csi_formatter_pix_format *csi_formatter_find_format(u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(formats); i++)
> +		if (code == formats[i].code)
> +			return &formats[i];
> +
> +	return NULL;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * V4L2 subdev operations
> + */
> +
> +static inline struct csi_formatter *sd_to_formatter(struct v4l2_subdev *sdev)
> +{
> +	return container_of(sdev, struct csi_formatter, sd);
> +}
> +
> +static int __csi_formatter_subdev_set_routing(struct v4l2_subdev *sd,
> +					      struct v4l2_subdev_state *state,
> +					      struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	ret = v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> +						&formatter_default_fmt);
> +}
> +
> +static int csi_formatter_subdev_init_state(struct v4l2_subdev *sd,
> +					   struct v4l2_subdev_state *sd_state)
> +{
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = CSI_FORMATTER_PAD_SINK,
> +			.sink_stream = 0,
> +			.source_pad = CSI_FORMATTER_PAD_SOURCE,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +
> +	struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +
> +	return __csi_formatter_subdev_set_routing(sd, sd_state, &routing);
> +}
> +
> +static int csi_formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
> +					       struct v4l2_subdev_state *sd_state,
> +					       struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->pad == CSI_FORMATTER_PAD_SOURCE) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index > 0)
> +			return -EINVAL;
> +
> +		fmt = v4l2_subdev_state_get_format(sd_state, code->pad,
> +						   code->stream);
> +		code->code = fmt->code;
> +		return 0;
> +	}
> +
> +	if (code->index >= ARRAY_SIZE(formats))
> +		return -EINVAL;
> +
> +	code->code = formats[code->index].code;
> +
> +	return 0;
> +}
> +
> +static int csi_formatter_subdev_set_fmt(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *sd_state,
> +					struct v4l2_subdev_format *sdformat)
> +{
> +	struct csi_formatter_pix_format const *format;
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	if (sdformat->pad == CSI_FORMATTER_PAD_SOURCE)
> +		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> +
> +	format = csi_formatter_find_format(sdformat->format.code);
> +	if (!format)
> +		format = &formats[0];
> +
> +	v4l_bound_align_image(&sdformat->format.width, 1, 0xffff, 2,
> +			      &sdformat->format.height, 1, 0xffff, 0, 0);
> +
> +	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad,
> +					   sdformat->stream);
> +	*fmt = sdformat->format;
> +
> +	/* Set default code if user set an invalid value */
> +	fmt->code = format->code;
> +	sdformat->format = *fmt;
> +
> +	/* Propagate the format from sink stream to source stream */
> +	fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat->pad,
> +							   sdformat->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt = sdformat->format;
> +
> +	return 0;
> +}
> +
> +static int csi_formatter_subdev_set_routing(struct v4l2_subdev *sd,
> +					    struct v4l2_subdev_state *state,
> +					    enum v4l2_subdev_format_whence which,
> +					    struct v4l2_subdev_krouting *routing)
> +{
> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE &&
> +	    media_entity_is_streaming(&sd->entity))
> +		return -EBUSY;
> +
> +	return __csi_formatter_subdev_set_routing(sd, state, routing);
> +}
> +
> +static inline void csi_formatter_write(struct csi_formatter *formatter,
> +				       unsigned int reg, unsigned int value)
> +{
> +	u32 offset = formatter->reg_offset;
> +
> +	regmap_write(formatter->regs, reg + offset, value);
> +}
> +
> +static inline void csi_formatter_read(struct csi_formatter *formatter,
> +				      unsigned int reg, unsigned int *value)
> +{
> +	u32 offset = formatter->reg_offset;
> +
> +	regmap_read(formatter->regs, reg + offset, value);
> +}
> +
> +static u8 csi_formatter_get_index_by_dt(u8 data_type)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(formatter_dt_to_index_map); ++i) {
> +		const struct csi_formatter_dt_index *entry =
> +			&formatter_dt_to_index_map[i];
> +
> +		if (data_type == entry->dtype)
> +			return entry->index;
> +	}
> +
> +	pr_warn_once("Unsupported data type 0x%x, using default\n", data_type);
> +
> +	return formatter_dt_to_index_map[0].index;
> +}
> +
> +static int csi_formatter_get_vc(struct csi_formatter *formatter,
> +				struct v4l2_mbus_frame_desc *fd,
> +				unsigned int stream)
> +{
> +	struct v4l2_mbus_frame_desc_entry *entry = NULL;
> +	unsigned int i;
> +	u8 vc;
> +
> +	for (i = 0; i < fd->num_entries; ++i) {
> +		if (fd->entry[i].stream == stream) {
> +			entry = &fd->entry[i];
> +			break;
> +		}
> +	}
> +
> +	if (!entry) {
> +		dev_err(formatter->dev,
> +			"No frame desc entry for stream %u\n", stream);
> +		return -EPIPE;
> +	}
> +
> +	vc = entry->bus.csi2.vc;
> +
> +	if (vc >= CSI_FORMATTER_VC_NUM) {
> +		dev_err(formatter->dev, "Invalid virtual channel %u\n", vc);
> +		return -EINVAL;
> +	}
> +
> +	return vc;
> +}
> +
> +static void csi_formatter_stop_stream(struct csi_formatter *formatter,
> +				      struct v4l2_subdev_state *state,
> +				      u64 stream_mask)
> +{
> +	const struct csi_formatter_pix_format *pix_fmt;
> +	struct v4l2_mbus_frame_desc fd = {};
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_mbus_framefmt *fmt;
> +	u32 val;
> +	int vc;
> +	int ret;
> +
> +	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
> +			       formatter->remote_pad, &fd);
> +	if (ret < 0 && ret != -ENOIOCTLCMD) {
> +		dev_err(formatter->dev, "Failed to get frame desc: %d\n", ret);
> +		return;
> +	}
> +
> +	for_each_active_route(&state->routing, route) {
> +		if (route->source_pad != CSI_FORMATTER_PAD_SOURCE)
> +			continue;
> +
> +		if (!(stream_mask & BIT_ULL(route->source_stream)))
> +			continue;
> +
> +		if (ret == -ENOIOCTLCMD) {
> +			/*
> +			 * Source doesn't implement get_frame_desc, use
> +			 * default VC 0
> +			 */
> +			vc = 0;
> +		} else {
> +			vc = csi_formatter_get_vc(formatter, &fd, route->sink_stream);
> +			if (vc < 0)
> +				continue;
> +		}
> +
> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +						   route->sink_stream);
> +
> +		pix_fmt = csi_formatter_find_format(fmt->code);
> +
> +		/* Clear only this stream's data type bit */
> +		csi_formatter_read(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), &val);
> +		val &= ~BIT(csi_formatter_get_index_by_dt(pix_fmt->data_type));
> +		csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), val);
> +	}
> +}
> +
> +static int csi_formatter_start_stream(struct csi_formatter *formatter,
> +				      struct v4l2_subdev_state *state,
> +				      u64 stream_mask)
> +{
> +	const struct csi_formatter_pix_format *pix_fmt;
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_mbus_frame_desc fd = {};
> +	u64 configured_streams = 0;
> +	u32 val;
> +	int vc;
> +	int ret;
> +
> +	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
> +			       formatter->remote_pad, &fd);
> +	if (ret < 0 && ret != -ENOIOCTLCMD) {
> +		dev_err(formatter->dev, "Failed to get frame desc: %d\n", ret);
> +		return ret;
> +	}
> +
> +	for_each_active_route(&state->routing, route) {
> +		if (route->source_pad != CSI_FORMATTER_PAD_SOURCE)
> +			continue;
> +
> +		if (!(stream_mask & BIT_ULL(route->source_stream)))
> +			continue;
> +
> +		if (ret == -ENOIOCTLCMD) {
> +			/*
> +			 * Source doesn't implement get_frame_desc, use
> +			 * default VC 0
> +			 */
> +			vc = 0;
> +		} else {
> +			vc = csi_formatter_get_vc(formatter, &fd, route->sink_stream);
> +			if (vc < 0) {
> +				ret = vc;
> +				goto err_cleanup;
> +			}
> +		}
> +
> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +						   route->sink_stream);
> +
> +		pix_fmt = csi_formatter_find_format(fmt->code);
> +
> +		/* Update VC configuration */
> +		csi_formatter_read(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), &val);
> +		val |= BIT(csi_formatter_get_index_by_dt(pix_fmt->data_type));
> +		csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), val);
> +
> +		configured_streams |= BIT_ULL(route->source_stream);
> +	}
> +
> +	return 0;
> +
> +err_cleanup:
> +	csi_formatter_stop_stream(formatter, state, configured_streams);
> +	return ret;
> +}
> +
> +static int csi_formatter_subdev_enable_streams(struct v4l2_subdev *sd,
> +					       struct v4l2_subdev_state *state,
> +					       u32 pad, u64 streams_mask)
> +{
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +	struct device *dev = formatter->dev;
> +	u64 sink_streams;
> +	int ret;
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       CSI_FORMATTER_PAD_SOURCE,
> +						       CSI_FORMATTER_PAD_SINK,
> +						       &streams_mask);
> +	if (!sink_streams || !streams_mask)
> +		return -EINVAL;
> +
> +	guard(mutex)(&formatter->lock);
> +
> +	if (!formatter->enabled_streams) {
> +		ret = pm_runtime_resume_and_get(formatter->dev);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to resume runtime PM: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = csi_formatter_start_stream(formatter, state, streams_mask);
> +	if (ret)
> +		goto err_runtime_put;
> +
> +	ret = v4l2_subdev_enable_streams(formatter->csi_sd,
> +					 formatter->remote_pad,
> +					 sink_streams);
> +	if (ret)
> +		goto err_stop_stream;
> +
> +	formatter->enabled_streams |= streams_mask;
> +
> +	return 0;
> +
> +err_stop_stream:
> +	csi_formatter_stop_stream(formatter, state, streams_mask);
> +err_runtime_put:
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put(formatter->dev);
> +	return ret;
> +}
> +
> +static int csi_formatter_subdev_disable_streams(struct v4l2_subdev *sd,
> +						struct v4l2_subdev_state *state,
> +						u32 pad, u64 streams_mask)
> +{
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +	u64 sink_streams;
> +	int ret;
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       CSI_FORMATTER_PAD_SOURCE,
> +						       CSI_FORMATTER_PAD_SINK,
> +						       &streams_mask);
> +	if (!sink_streams || !streams_mask)
> +		return -EINVAL;
> +
> +	guard(mutex)(&formatter->lock);
> +
> +	ret = v4l2_subdev_disable_streams(formatter->csi_sd, formatter->remote_pad,
> +					  sink_streams);
> +	if (ret)
> +		dev_err(formatter->dev, "Failed to disable streams: %d\n", ret);
> +
> +	csi_formatter_stop_stream(formatter, state, streams_mask);
> +
> +	formatter->enabled_streams &= ~streams_mask;
> +
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put(formatter->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_pad_ops formatter_subdev_pad_ops = {
> +	.enum_mbus_code		= csi_formatter_subdev_enum_mbus_code,
> +	.get_fmt		= v4l2_subdev_get_fmt,
> +	.set_fmt		= csi_formatter_subdev_set_fmt,
> +	.get_frame_desc		= v4l2_subdev_get_frame_desc_passthrough,
> +	.set_routing		= csi_formatter_subdev_set_routing,
> +	.enable_streams		= csi_formatter_subdev_enable_streams,
> +	.disable_streams	= csi_formatter_subdev_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops formatter_subdev_ops = {
> +	.pad = &formatter_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops formatter_internal_ops = {
> +	.init_state = csi_formatter_subdev_init_state,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Media entity operations
> + */
> +
> +static const struct media_entity_operations formatter_entity_ops = {
> +	.link_validate	= v4l2_subdev_link_validate,
> +	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
> +};
> +
> +static int csi_formatter_subdev_init(struct csi_formatter *formatter)
> +{
> +	struct v4l2_subdev *sd = &formatter->sd;
> +	int ret;
> +
> +	v4l2_subdev_init(sd, &formatter_subdev_ops);
> +
> +	snprintf(sd->name, sizeof(sd->name), "%s", dev_name(formatter->dev));
> +	sd->internal_ops = &formatter_internal_ops;
> +
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +		     V4L2_SUBDEV_FL_STREAMS;
> +	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> +	sd->entity.ops = &formatter_entity_ops;
> +	sd->dev = formatter->dev;
> +
> +	formatter->pads[CSI_FORMATTER_PAD_SINK].flags = MEDIA_PAD_FL_SINK
> +						      | MEDIA_PAD_FL_MUST_CONNECT;
> +	formatter->pads[CSI_FORMATTER_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&sd->entity, CSI_FORMATTER_PAD_NUM,
> +				     formatter->pads);
> +	if (ret) {
> +		dev_err(formatter->dev, "Failed to init pads\n");
> +		return ret;
> +	}
> +
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		media_entity_cleanup(&sd->entity);
> +
> +	return ret;
> +}
> +
> +static inline struct csi_formatter *
> +notifier_to_csi_formatter(struct v4l2_async_notifier *n)
> +{
> +	return container_of(n, struct csi_formatter, notifier);
> +}
> +
> +static int csi_formatter_notify_bound(struct v4l2_async_notifier *notifier,
> +				      struct v4l2_subdev *sd,
> +				      struct v4l2_async_connection *asc)
> +{
> +	const unsigned int link_flags = MEDIA_LNK_FL_IMMUTABLE
> +				      | MEDIA_LNK_FL_ENABLED;
> +	struct csi_formatter *formatter = notifier_to_csi_formatter(notifier);
> +	struct v4l2_subdev *sdev = &formatter->sd;
> +	struct media_pad *sink = &sdev->entity.pads[CSI_FORMATTER_PAD_SINK];
> +	struct media_pad *remote_pad;
> +	int ret;
> +
> +	formatter->csi_sd = sd;
> +
> +	dev_dbg(formatter->dev, "Bound subdev: %s pad\n", sd->name);
> +
> +	ret = v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
> +	if (ret < 0)
> +		return ret;
> +
> +	remote_pad = media_pad_remote_pad_first(sink);
> +	if (!remote_pad) {
> +		dev_err(formatter->dev, "Pipe not setup correctly\n");
> +		return -EPIPE;
> +	}
> +	formatter->remote_pad = remote_pad->index;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations formatter_notify_ops = {
> +	.bound = csi_formatter_notify_bound,
> +};
> +
> +static int csi_formatter_async_register(struct csi_formatter *formatter)
> +{
> +	struct device *dev = formatter->dev;
> +	struct v4l2_async_connection *asc;
> +	int ret;
> +
> +	struct fwnode_handle *ep __free(fwnode_handle) =
> +		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +						FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -ENOTCONN;
> +
> +	v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
> +
> +	asc = v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
> +					      struct v4l2_async_connection);
> +	if (IS_ERR(asc)) {
> +		ret = PTR_ERR(asc);
> +		goto err_cleanup_notifier;
> +	}
> +
> +	formatter->notifier.ops = &formatter_notify_ops;
> +
> +	ret = v4l2_async_nf_register(&formatter->notifier);
> +	if (ret)
> +		goto err_cleanup_notifier;
> +
> +	ret = v4l2_async_register_subdev(&formatter->sd);
> +	if (ret)
> +		goto err_unregister_notifier;
> +
> +	return 0;
> +
> +err_unregister_notifier:
> +	v4l2_async_nf_unregister(&formatter->notifier);
> +err_cleanup_notifier:
> +	v4l2_async_nf_cleanup(&formatter->notifier);
> +	return ret;
> +}
> +
> +static void csi_formatter_async_unregister(struct csi_formatter *formatter)
> +{
> +	v4l2_async_unregister_subdev(&formatter->sd);
> +	v4l2_async_nf_unregister(&formatter->notifier);
> +	v4l2_async_nf_cleanup(&formatter->notifier);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Suspend/resume
> + */
> +
> +static int csi_formatter_runtime_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	clk_disable_unprepare(formatter->clk);
> +
> +	return 0;
> +}
> +
> +static int csi_formatter_runtime_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	return clk_prepare_enable(formatter->clk);
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(csi_formatter_pm_ops,
> +				 csi_formatter_runtime_suspend,
> +				 csi_formatter_runtime_resume, NULL);
> +
> +static int csi_formatter_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct csi_formatter *formatter;
> +	u32 val;
> +	int ret;
> +
> +	formatter = devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
> +	if (!formatter)
> +		return -ENOMEM;
> +
> +	formatter->dev = dev;
> +
> +	ret = devm_mutex_init(dev, &formatter->lock);
> +	if (ret)
> +		return ret;
> +
> +	formatter->regs = syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(formatter->regs))
> +		return dev_err_probe(dev, PTR_ERR(formatter->regs),
> +				     "Failed to get csi formatter regmap\n");
> +
> +	ret = of_property_read_u32(dev->of_node, "reg", &val);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get csi formatter reg property\n");
> +
> +	formatter->reg_offset = val;
> +
> +	formatter->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(formatter->clk))
> +		return dev_err_probe(dev, PTR_ERR(formatter->clk),
> +				     "Failed to get pixel clock\n");
> +
> +	ret = csi_formatter_subdev_init(formatter);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to initialize formatter subdev\n");
> +
> +	platform_set_drvdata(pdev, &formatter->sd);
> +
> +	/* Enable runtime PM. */
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		goto err_cleanup_subdev;
> +
> +	ret = csi_formatter_async_register(formatter);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to register async subdevice\n");
> +		goto err_cleanup_subdev;
> +	}
> +
> +	return 0;
> +
> +err_cleanup_subdev:
> +	v4l2_subdev_cleanup(&formatter->sd);
> +	media_entity_cleanup(&formatter->sd.entity);
> +	return ret;
> +}
> +
> +static void csi_formatter_remove(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	csi_formatter_async_unregister(formatter);
> +
> +	v4l2_subdev_cleanup(&formatter->sd);
> +	media_entity_cleanup(&formatter->sd.entity);
> +}
> +
> +static const struct of_device_id csi_formatter_of_match[] = {
> +	{ .compatible = "fsl,imx95-csi-formatter" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, csi_formatter_of_match);
> +
> +static struct platform_driver csi_formatter_device_driver = {
> +	.driver = {
> +		.name           = "csi-pixel-formatter",
> +		.of_match_table = csi_formatter_of_match,
> +		.pm             = pm_ptr(&csi_formatter_pm_ops),
> +	},
> +	.probe  = csi_formatter_probe,
> +	.remove = csi_formatter_remove,
> +};
> +
> +module_platform_driver(csi_formatter_device_driver);
> +
> +MODULE_AUTHOR("NXP Semiconductor, Inc.");
> +MODULE_DESCRIPTION("NXP i.MX95 CSI Pixel Formatter driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
>
