Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011043.outbound.protection.outlook.com [40.107.130.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B25E2D8DCF;
	Thu, 22 Jan 2026 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769092414; cv=fail; b=Itvh0viqQ03VpN3R1X5/ADrJthHOhGkKGMOeXtdrlQLfzd+BqWLUqLW2Psvt+R4XB+V07ch0ziZC3YVGNhuaEqTey2jNyrkFbGMkheWICAmB7w+FMuxrvcr+9ObtLwc1Db1KW+Me+750e+qVSuv2qJEVOVBG1q8U3zlSIw98qaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769092414; c=relaxed/simple;
	bh=1ZMvTGwNbky9vy37t/bJBG9iW5mm9jpZsPsNjKZtv9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sLaPdELW0De+aZAftacT/LBQKFkUUjpBZnMR0vkBuSNmCuEnA2eWVURzX+zku8QrWxmLHL3RfCpulWAUnbypnz8Ibl5+z3ueqr3kV97zB/lrsgX5dkwrLcQO8XXSan4jTSdGith0e09T9bU2OqbBES2l0xfX7f6aKs1TBXLHCMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ph+tyate; arc=fail smtp.client-ip=40.107.130.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ph+tyate"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHo14Clgg9t6wpc5cjGZntQLXzR1XZ3e1NKIMuE6dCdhj1TvN3azO9Ii/S39m0CgjHtKov6VZSpiGYFwPDM0ev54WMHIeJEs5LCW82Iib5D3GSDQS+1hihCAxohsJIfNSSayv51C2MqfKcgCH5Ob1iCoZ7mfQwIlxg4zxYDHNPUzZb1Fsl6mepaclJOlknUew+Fxomi8NT2bfNw/d/XQsSBLLdS537KIuM1cUoEe8WGOsJJlt9uNFZfnXQcRKh6YpCSAHIxL5PELZwJhHKJJ1zvs7baArJtf2MBuLRPH8KnSkwoItnFv7CbF1XRJmk6ajsITFtunF4JHzJDiG9IKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XLf9lz5xbJG58Fpx5WiwNTdWNe5R5jaeh5LiYGSWIw=;
 b=eVWCkpEB7PHNvvAm3faVoc1xawlxARmX06zCcKLgTwkKSj1kCA6HYxefj0iltJbgmFa8ki7HVCBfkkWCkXkuJatTf489KHB/dKIAzv2IkRdG3BA85QlgvHCGlCeiGJe86e6BzuhwYgIQL2jyJq1vw6yVF86ZaCdbnIhFu6Cy1FGVvESjWHm/qkGbVud9KSiw9vppa9KoikdlO7blo11RtDUKEbISRJiNpw9h+f1pMnrqU94EfN2qnVTStiCve4dgTzSdEb6CKlWnT6q3MJ+lJJqSW4AapymjFCt1HSYkO68WxrserStEOdHeYsE7ivl7M9lcjVjMabaYnGj9D9ZA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XLf9lz5xbJG58Fpx5WiwNTdWNe5R5jaeh5LiYGSWIw=;
 b=Ph+tyateFlMsUDWmNgCkoeEDA2yC8CfwsaNQX5IbJv+OYdotZ4tYfs/uz0Kgf8gRUURsrNMgyHJNXz4Qyh0arKDNg0rYa5bbymvhYFVWBVxQh/l8efxOzsqoWmyN8F7ARar5QLpeZsrnpsE4AEpvjB8HmXwFViEr67GK4NU82Eu1gAANB6FrfxobpceVR/NUt3vHUEuKcluLh6qUD/rU/t5natZNzt5ogR1cIO8CeAnjT1VW6u5XhrbuuLDr1zgjabveLT9ETQSmeSLvuuAdhcFCzi4b/A3lK/05UIJx+8F2z4bEO7x8Uf4D05hrHdR0xbSipLQ5hS4U3PSawEBS4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PRASPRMB0004.eurprd04.prod.outlook.com (2603:10a6:102:29b::6)
 by AM9PR04MB8383.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 14:33:28 +0000
Received: from PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd]) by PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd%4]) with mapi id 15.20.9520.009; Thu, 22 Jan 2026
 14:33:27 +0000
Date: Thu, 22 Jan 2026 09:33:17 -0500
From: Frank Li <Frank.li@nxp.com>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: vf610: Add support for the Ethernet switch clocks
Message-ID: <aXI1LazRJ/jH2n7p@lizhi-Precision-Tower-5810>
References: <20260122130649.4150338-1-lukma@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122130649.4150338-1-lukma@nabladev.com>
X-ClientProxiedBy: PH7P220CA0096.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::25) To PRASPRMB0004.eurprd04.prod.outlook.com
 (2603:10a6:102:29b::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRASPRMB0004:EE_|AM9PR04MB8383:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a445bc8-1d72-42ee-1bb9-08de59c334dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N9TYv8Jj3si03emnE2LMchl3ziTR4YKjKWFcmxWK8Pqalx5yKdiHcakAEt5x?=
 =?us-ascii?Q?y7wh6jomD8RL3AWSwGri49Z9nkxTt1qAhPe8evNuZpOUFFuOr/6hYPeF1g9c?=
 =?us-ascii?Q?LG7wDC7997qhS5uhplsWXHXbpsNsy81dIn1kMFHsKZe0nQbUnIMzLN88/dx7?=
 =?us-ascii?Q?P8GfJhfCea7FBusZ8lrwsKntI+buPihFq5WQE6lV9Pmg6movMM/m00mQcTpG?=
 =?us-ascii?Q?Kfy9R7fX2QtUdUglcpuCefnCGQe6z5Myx0ah9/KeluGBd9M81FLIGkUygDWO?=
 =?us-ascii?Q?QuLt78UaFDnfOljYF4p9GKR6nDL1+GGZzrdDWOgsjcpDbn83uRQR3hxBF6Lz?=
 =?us-ascii?Q?A20vg6ACjxC6Ez+Kierkgd+jCuUlRpe/Q64mtwB9wnGHBhvTFJLlivCp+0tD?=
 =?us-ascii?Q?iQUmOcs97+zGApkDs0sbvsWcxPqDOJ9a67/SJ7sRMbfSWoFdQl7Dy8/jjnG9?=
 =?us-ascii?Q?ezr4LLWZWoKOIv5mq8QKT83aDwO6vKovuR4ytjVc6NLM3hlNA7g8Kc8VJESL?=
 =?us-ascii?Q?Jy6DdB9jV8WgK9je+A4csN7KnfoncwtU9mjVKKWSaVvWiToGoWwFRo9FRfQJ?=
 =?us-ascii?Q?oz9rnS5EfbT4x/zXKjGLIUhvM5AzIAtKiIf2di5FijtFxn6kRF+CKku4PGtG?=
 =?us-ascii?Q?ZC0nQbSAe+O3avdK1ksn+MZczVuum+VZZGW3l5YL/wyhilpqlL63SJrfBsjo?=
 =?us-ascii?Q?xuuWXUo0U4KuBwa0QqoRmQ1RIuzGIgc6Tf0aLUtQZLT/ib0QkZjrHRtgdD4k?=
 =?us-ascii?Q?diAi2M0TaiWEhkhJKkFMrDQqSes1mMDcmejAUsWTgc2UL0HHqyIwyDubXG9Y?=
 =?us-ascii?Q?j1QPMYvOMd48IoxAB9y6wQvGmCpqoRh7NmQHsPLUnvLiz21GvPpCwwBk31SW?=
 =?us-ascii?Q?CqAOz1N2WM+jaWIbz17dwp8+IGs07asuA6MBYc3QvP/evL5dahwIj8KPutU/?=
 =?us-ascii?Q?5/LiG/tfDna8K4L+lFJSRptdZ4ESDBQRjtWgCHNrEeqSLuY/CTM7ANBQwj10?=
 =?us-ascii?Q?lh85sn7lN+yz3M0HdW0YArRVkhBSuhXKEXRVavfn1bzQqcLMB0Kg1Q7Vi2AT?=
 =?us-ascii?Q?0X8VgYOxpyDGCifYHYhYaDDpdG3mUTt2fVQcPws/YBU6FJIqKGs03QpjyhQd?=
 =?us-ascii?Q?MyVaZA6jgVrIDu0+Fls2kKI6JSAmMYdstMxj3k9g2Ja0R5SHMaQSaK/67vXf?=
 =?us-ascii?Q?JbGYQQLUYMxbmPKdn/dlWYDz6Ph0xDfpo2YMWwxDy1YKhQSh/KUNliEofUlV?=
 =?us-ascii?Q?M+kTHYxd8DQnUujggyfWX87x7rMf0dJqkHzdNHph63vAhJ6kftLCWkk6cQcd?=
 =?us-ascii?Q?gDEcNTJiPXgxv/LEZ5++NBKtywdDgtfOqLkulwtGQSOZDmvULuPYQXZQJ9ME?=
 =?us-ascii?Q?cmMpOYdUKkTtAsUrQv+1z41XxFeBl09S/BviZre/UBg8oZl33HBWQAFCvnmC?=
 =?us-ascii?Q?OZ+9rKbCBTapjnVbr5ECiKa14elGcgeTpNfHmXJDPAr46IFoh1usfBWtWKHI?=
 =?us-ascii?Q?d2tOZytrWPEhUJ7QY8Is+k1T5oEUvpzNbENLA9eS/FWj2HiF+xQbhdK2KSKB?=
 =?us-ascii?Q?WvY5il1Wy4YxZxGOLtg52nUHKae8+zEjhK+44jzpMieUlnOfrK4dawNhGeil?=
 =?us-ascii?Q?jwWGiW32CAz8ezhLlLqqiI0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRASPRMB0004.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oduEt8hcu03Qokhr9DjDnY673d/+B1CDdRt45HxhjwIPnUbP0ZRIGx49z9eY?=
 =?us-ascii?Q?Hp8qbJKImNMmez4SwGM7gSVAHpKx+IAlnraKR5ieWwRgLachC5vNOKN/TlUk?=
 =?us-ascii?Q?1EA8qlsF+cs61lELPzgjCk8w7Iqn6RsO5Pr1PBEM5NWiNJvm418+GVog+v7D?=
 =?us-ascii?Q?/y+2tyBKhe54MWAwG20YveYQH0bjlforbqVVtpoko4Ua6pjZ2vvx5Jj5NDpx?=
 =?us-ascii?Q?KsmjBADl9SDcb1sHpXCIylW32Y8WNevyBD/19dtrX2Ntj6OwGdqEp6/A7mpV?=
 =?us-ascii?Q?23sasAh0hCC8YzFa6Di6zBfARfczcpKnAEHY4fCTeZj+xQS/+n+M9k8ko4zV?=
 =?us-ascii?Q?9OePU05+EqP06kktVr2sgqtA6PmUmLRB18Fx3WVjK5SmlCt2xZ8ce8F6fWgC?=
 =?us-ascii?Q?XOrTPwAHs9wElrGyk+4jf6/F7zPXLc0GOnId6ILcVKeHZAE3vQU+pB3bqqlJ?=
 =?us-ascii?Q?KK7W0cS/IYoDr8P3jxnlwtxw7n1IPjBI8T79QyZXw6B8npCjw/s8tH4B2e/5?=
 =?us-ascii?Q?X5V6KmUDpALeeao0t9U+fj7Ce3LzoMKYlh9zrRE+IeClHd6UE6O+9w3znSnR?=
 =?us-ascii?Q?qrvZS9cUQ+OcCaj20EN6BbnqYvmzk8x86HOaaoc0y64LemBudY4jeKNDvtMn?=
 =?us-ascii?Q?tAXSQUSOFNSikCPuIQAI7XdKBsQwj1oY1BOVUuHCWismnIHlOK5rxp9CunlH?=
 =?us-ascii?Q?A65TUNl/dM/zxKPXWAXOsi8IuJ9bHgz4XxUf2ZISHkXJSGy+niAJYg2sakY1?=
 =?us-ascii?Q?OyIiDwxJ4ttVzRbXYGBsAd3pzJbyzZ0Kuyqs95pR3MIbEq55D+znO9gJmE9g?=
 =?us-ascii?Q?buHluzDsabw8cBwV+zNmpG5KSv75sKhf+5KD9RXiMCE5Ke9SMUWFqk8IOS30?=
 =?us-ascii?Q?rtmuIhLg2rRnurLigvyHjOV2QvmQ6cxmUgAZH2hOtQvHht8cuTblpsKMV8S5?=
 =?us-ascii?Q?kDQAaLfcvH0w0HP7Zi2YiQeKIbftmqyijKB7oZ3xsRLuOr5PFBW4Ncu/jjmm?=
 =?us-ascii?Q?MVAVgJCs6iuQVdrBzy5FxCyevJvuA1klUmEz8OS5elsZikiJgrpDu0aB4Zum?=
 =?us-ascii?Q?MT55lcoPChfqY7zYgf5Em7gb14gU2b8r6msnTzc7z6VOMIgRp+2t/2Hk6MDz?=
 =?us-ascii?Q?6ZJu6Y/67FdndbATdZtMeh8XZrAfFI7RN4g3XJ4GY9+5ZFAQW/A4ghkEWffI?=
 =?us-ascii?Q?Cd+2ETkiQ62Ps/OwDfKf6u6Xwz5h+Xo+ZNd4Y11ymOOsE6woyP0ChfkHVe9N?=
 =?us-ascii?Q?vUXvyhKGK6x959UktSoyhzzMic9xOdAb3Hxl2Ij9K9io4Rmf9ls0sj19L/jc?=
 =?us-ascii?Q?7dgkwpTTLbCh+Qo4djAuo6jOrX7/ciBMi0SZiWwJtmfcX2/Cal60zSa1lFwm?=
 =?us-ascii?Q?IExI/zi0KCXObULISwYhZAA0dlXtNUr5AF9YyHxR+h4UntaiDRxXLOy1VTg7?=
 =?us-ascii?Q?SF84NyyfvA4pAUXF4M6lV4pfx55CbmWfS33V4TRvu2JKTK4dy9VSk/PE1E1O?=
 =?us-ascii?Q?5R/1dbV+YXag0WM7Vz6W/6/vrNq5mVAjFh+IhkaGtEj31EBq5yntbu1+Oixi?=
 =?us-ascii?Q?0sG+abMAZkC8wGaA+lau/1d/DwOt1JOIWNWMS9jXgMkiGV99x9TYW6vflAQE?=
 =?us-ascii?Q?4sR5IeNgbsH9jgH8l/B9RD/djMarLm61x0YW0O2w7H8facNttZTVBHAObJ7a?=
 =?us-ascii?Q?K4M0PhOGwcW7E0Z6YeMxFAjBqItJsuBHISD2sEgBPX4mXxqlDaJTqT8GWivN?=
 =?us-ascii?Q?E8Vz9W/iVg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a445bc8-1d72-42ee-1bb9-08de59c334dd
X-MS-Exchange-CrossTenant-AuthSource: PRASPRMB0004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:33:27.8222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8BJMKLNjb/D/aTFVVmfGSMl5bw23yZpuZNr4+YIIfvfKNwrm0Cv7NKV96nukgWx09527bVafviGSqWKHDdSIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8383

On Thu, Jan 22, 2026 at 02:06:49PM +0100, Lukasz Majewski wrote:
> The vf610 device has built in the MoreThanIP L2 switch. For proper
> operation it is required to enable ESW and MAC table lookup
> clocks.
>
> The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
> to provide clocks for each AIPS1-"slot", which size is 0x1000
> (hence four separate entries).
>
> Those can be enabled via clock gating CCM_CCGR10 register
> (0x4006_B068).
>
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/clk/imx/clk-vf610.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/clk/imx/clk-vf610.c b/drivers/clk/imx/clk-vf610.c
> index 9e11f1c7c397..88c9b656f244 100644
> --- a/drivers/clk/imx/clk-vf610.c
> +++ b/drivers/clk/imx/clk-vf610.c
> @@ -309,6 +309,11 @@ static void __init vf610_clocks_init(struct device_node *ccm_node)
>  	clk[VF610_CLK_ENET_TS] = imx_clk_gate("enet_ts", "enet_ts_sel", CCM_CSCDR1, 23);
>  	clk[VF610_CLK_ENET0] = imx_clk_gate2("enet0", "ipg_bus", CCM_CCGR9, CCM_CCGRx_CGn(0));
>  	clk[VF610_CLK_ENET1] = imx_clk_gate2("enet1", "ipg_bus", CCM_CCGR9, CCM_CCGRx_CGn(1));
> +	clk[VF610_CLK_ESW] = imx_clk_gate2("esw", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(8));
> +	clk[VF610_CLK_ESW_MAC_TAB0] = imx_clk_gate2("esw_tab0", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(12));
> +	clk[VF610_CLK_ESW_MAC_TAB1] = imx_clk_gate2("esw_tab1", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(13));
> +	clk[VF610_CLK_ESW_MAC_TAB2] = imx_clk_gate2("esw_tab2", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(14));
> +	clk[VF610_CLK_ESW_MAC_TAB3] = imx_clk_gate2("esw_tab3", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(15));
>
>  	clk[VF610_CLK_PIT] = imx_clk_gate2("pit", "ipg_bus", CCM_CCGR1, CCM_CCGRx_CGn(7));
>
> --
> 2.39.5
>
