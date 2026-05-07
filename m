Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013069.outbound.protection.outlook.com [40.107.162.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7441FE44A;
	Thu,  7 May 2026 16:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778171664; cv=fail; b=dTFKNdps0s5a2kBOmNYzHpkadfZJc1cX9UYH1UNGOa9ep7/6yteMPAAMvtxykXRGMA1hrawzt+DaAG8zLmflegOAiPrDZFiutsYpY+/+qER/iV28o7uU7pGarcuNVffRPpNYfyV1RDzwRvGaPjVEYbjTgCiPznAxbWaaMnfvaLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778171664; c=relaxed/simple;
	bh=W6bRK03mmYSCusBQZfaG541IubDqcUCp5kiKEDq7on8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O75mr0ngOevTzHeBkMM9B/QDDpXcQXtfhqWAKgzuIQsWd0keKePRU7d6rzw1QvVfe30qsVRl/DgqujtYEm5Bwmen78xc79HXsqPydL6FAATKSplQ9VgjE5BmvSbDS0geWA6DzqGcZjVlR5NX+bQUlBpvcOkh1Fc3A535FuDxoH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e9xKnsR+; arc=fail smtp.client-ip=40.107.162.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e9xKnsR+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pq55HIwJos9cftPJbCFbjutHG5q7BnkK88S4LiOqyECYZnIzXXCw5KY2shoprTcc8PU1FLv5KcGGfKKWj73uQUTJrM/f+0/5FupXKC6G+jrlEiMAPbogyq6KuZZm0PnzsrnOQ9d4XDjOalHAVP//s/Ji137OAavCIAn1AmUlhQ6fOZkXDPnoR9z2Adyg+1QyvOAJM48CQ45p1ro+T2l2ru35IjArtdG465K9ysr/9mm4JUrblNZEavxtAe49Sx0++OZKQAxC6ttLXUhlNMCGnVhE8RR9/qtcdvVkV2emy1+iz/7nUx+BDCIVaR24kAqXYcUuccqFRBosvbDQa80q5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkJ/rFPnsI3fs2ZTVhZ1gAuHdZtpHtVhfPmmW3fQ0Wg=;
 b=nJlxU8bQeU3zaKQ07/oUaAnfC2dt2cyalgQcMIw94F3gDg/OtZjGBS8TClvPcW3E9S9jOZCD8deSP926PGPJUuWhAGkPNJGPfOdsQ1brVi0xHe1tzqwJVWCLFlK+POo935XsYYBmQOOgd0sM8u2b1W2RywdGd3bUpE/5PpdHLxQFNETawg1PXNT8nSNAyw64Xdc5p3uCRkFlaJ7d8h4wWKeDLpEqmk4Bb8zbj1cs3RLdjSxYY+F0WWUF8ZcQHF6q7fuH1SzvdEYrxQBt3C1NlNYCMmoRC8wVHe4GlmDBaiOvODF55Wnr21NtdnBeecupj7GFZESr8bGdJDHtQm2eGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkJ/rFPnsI3fs2ZTVhZ1gAuHdZtpHtVhfPmmW3fQ0Wg=;
 b=e9xKnsR+wsT4/SbRhVszBG1nATVXCNX0zeHdpbs+o8TZbs246v/9zJmDtpV9aHk3sQ5gEx+xtxK8jY7FzWjFe58avXQ50x2yyiEBtZffiMaoIVhsradRkdmUnKgrYEUFBzUmIVI6aIti2WtDCkCyBPmHXECRqJyKt9wOoHAnKx8ky4Rjh4ivmcy+sd2fi46AEJ8T9HCAVF5Yu9BxAjJ3bZoUvAY2Q2ta/uzAIiaOMSZCIvHoCEdrKT3m4jdEZIn1FBfAaTwlRnVHO41u15/+vDUZSGsNGBncv+rOUL0zLGNWKBfadLJqbf8W7dSgmadhGd7yIJuOnWVMpIyGXnY0Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA3PR04MB11227.eurprd04.prod.outlook.com (2603:10a6:102:4ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 16:34:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 16:34:19 +0000
Date: Thu, 7 May 2026 12:34:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk,
	mturquette@baylibre.com, sboyd@kernel.org, tytso@mit.edu,
	aubin.constans@microchip.com, Ryan.Wanner@microchip.com,
	romain.sioen@microchip.com, durai.manickamkr@microchip.com,
	cristian.birsan@microchip.com, adrian.hunter@intel.com,
	jarkko.nikula@linux.intel.com, npitre@baylibre.com,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
 compatible with the required quirk
Message-ID: <afy_ATPpDJXMIGXQ@lizhi-Precision-Tower-5810>
References: <20260507084805.481737-1-manikandan.m@microchip.com>
 <20260507084805.481737-4-manikandan.m@microchip.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507084805.481737-4-manikandan.m@microchip.com>
X-ClientProxiedBy: PH7PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:510:339::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA3PR04MB11227:EE_
X-MS-Office365-Filtering-Correlation-Id: be86e606-6596-4a11-5367-08deac567ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|52116014|366016|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	RQ0pMSIlqqHHLgwSf7izXR4G7F/TJJzaeZhap0bs6/DuMTM6yo3OYwnGA0a/r5/q8UICzhiPGMKWTmE1j/XuCsHrDPve4IIAUoHko8mgpWG4i9b5xELN0QvYiE9Sv/hrObBnkAMYVNUWFdVWFO7uGpqrGuON/bX1y6IPoBNYno4Q9iqee7ZDH/6E/0FgERuCP1n3yRplnL6nnNa+GITOxFzErN8Iq+jynlTnRwJbgag6utxgbm9edZYsgVyPF9e3K2VPvTnTYkzTxZ1FMCj6j+1n/Giam4G4nCiUbllPbJE9bwIu1Uet3I0duixW3aWDOplaSPB7hFWiP4FutEhST71CO54qVIqqxst2ZgZzxaHtmX7MTAa9kiBGRQ7yCI0WkRpSECFtKMU5Rq9q5NgqyRbcUVF7tJaxzOPH/oHQBhqpd+6kR32KQxmQdv5OF++ZdvmhLcFoMF6rzc3OHXjI44PBjqLS1POTdNDNI6ix7tBiIyQC+gHyze5wO8d2G9U49htGB9B9ByvsqMKs3h7zb7+kaAnDGlZNihWH9hs7zw/TDmW5eQSN/ON9u369jksFIcClORB2CMWevnvu1S9J0n2Fm29mXl456ICl9iu3Z9IxlGiPgcPSLiR6nOG+F+4tIE8Mg6Ub4QtnpIjPZS+oXN6NFki3U36LNanL62D/BM5WXN3GAuCmfFGdTKTIYXTaQvdbx4KDARw53TaOUDUaeUA3xC/7dT3SOjqc8CBcEmsrOyc59G3Tbl0ke4R2HCeS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(52116014)(366016)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZULkbxz+K8sn67jPz5WGSjhNM2nzXWDFIbdPMLFfMfEZOYMv8inLrvhtuH9H?=
 =?us-ascii?Q?GCuDpTL4Ct24LZsiPGO4GFj0/PS7GESDuPNCrCdBojV+Ukg7kVwt+cscNRw+?=
 =?us-ascii?Q?dNqVlA1xxk2+gLRV5z7vgE199tgxWb8fJm2BNva99Imxi8Ff+j8PX06/50vJ?=
 =?us-ascii?Q?ZH0k+1HOy9SZzxGzKxOURp50PLbAVQqTlF/qXL/oLSBQTI9Sp7AMymEED5YH?=
 =?us-ascii?Q?rtPaZY34+qR7kcz1FU5Yfj957Q96Dcf3UwLkOJfot08hikHAmOvQ7Zo94TfL?=
 =?us-ascii?Q?uwhyMO6Cn/k90seSttkfgspuv8PmRdjO90dP+XdNAOTM94gPfE+HcWz90Z7f?=
 =?us-ascii?Q?aQXeny0Rr8HQ8EVUNRGWP+JUkkPRBi8ZUw+ElBqkYmpwnjoB7VJhMUpLPPcW?=
 =?us-ascii?Q?J8hinyHIVPLi7Cg9NLswoSfhQRVcBUAOHi0wWVDJphU5WjKYqko+vY2orrVg?=
 =?us-ascii?Q?ZceWB5G7bzI1dpxjjgMl744HwuwjofqAL9KpFcvPIJFbTOKjox6D0uskQl1Z?=
 =?us-ascii?Q?f968dDIAQ6nF+Bk8Gqg4lASaG65W6+1Mtl+okJmQNyrpnBAF3whXmBRBZ0oM?=
 =?us-ascii?Q?9MzETStZA3wILdBfOjNqArMItOAcIU8ufBZyVHhgB4Aj+cLW+P1oXuzRgg+y?=
 =?us-ascii?Q?SBGF3WlJnogLA3OylY4YtydWMRsoS4Z0A5VYcEgQ2+dKaAPUktk26CErE6xL?=
 =?us-ascii?Q?bhsW2aZTd7RirucoN32zeYKcjBBJ3C/Slar8joLeIh2ibuw/hJl8hM/qfVno?=
 =?us-ascii?Q?9yucjyldEvIKjh+PzhwCqYCgrjOxTgfyX5VfuKHiBjJujLqR6aLtWARaIlg1?=
 =?us-ascii?Q?E/z4pyM5e4CkNGx7P4FSpglTPx6hwi9T11I4vF/dvR/MN/j3WQaCXiIjnYNH?=
 =?us-ascii?Q?CYODdQiTXyREfizTNakBSZrMyWo5AV2S+2yvyVoZ2D3BLtp8XGBGZYGaudPy?=
 =?us-ascii?Q?zZZWFfDYbTrp8OE2VMvICkUtjNgovXGRQDy6LLRBfjaqhhuVX91zDD+i90VM?=
 =?us-ascii?Q?yTKVEJomxWeoCQv5DyQQ6/4REP3iSdIgsK6vtK5jThf8/ORkC2X16YKWDTL3?=
 =?us-ascii?Q?Spt2Rs08wI2NzgmQCc9q0zdTu2NBvDMCttIV5bQtbImZUmifcuZDOZwqc/Gr?=
 =?us-ascii?Q?mU6xCrwF30qdaxQwYcM3+j2eh2CmiEYRKRGAHVsg4Sh1Ias48R1YqF2uI3CQ?=
 =?us-ascii?Q?zjLLP6+U+dP0R17CdS7k7Q276NLUPMg5o8vLoX+Ge/iy1agXHuGv6MfPFhJg?=
 =?us-ascii?Q?b7Ir2iA9rWksX+QPFYAmR1pG4N8d61wmvKFWmam6FaIGpY59dbJ9KWN/GhaY?=
 =?us-ascii?Q?uGr96RHOX1Ov0JUK5oLmQv6h5nM3kQKJDwZyBGcjxWtKqrvT71zJnXdqoUDD?=
 =?us-ascii?Q?FlPuRbzRAK4LKVNJv41vty800LdKkZ3FRG5+OmLQa2qwaecKxY0nAEvk3hYj?=
 =?us-ascii?Q?ndbPZ3uSd+/4kBgs4DW8msBxfl6KLc+pI1RNVn2O1XjphSGDa7/JTr/8Rt6N?=
 =?us-ascii?Q?/mL5LzrMQ17nor3OGU/8oN4OnzmzLPhTBE4OeBQ90P2/1W7BnMVMWTEW9vnB?=
 =?us-ascii?Q?jHlWrXgsfUBDNpbpWVzD5G7lrKmt23OlvhJnYp7nI0Q4Ef4ds68oW7rci0C0?=
 =?us-ascii?Q?bAPVYipnYBX1hVG0imEzD315K2gtRoNeLjqyXZLDmC+dEzjSKl4K4KSw4poP?=
 =?us-ascii?Q?ZTBJ2vkNd+bqNB8oTF2+C3HwzYGb0eIeTqE1CHCV69dT5SMgVynjfM2ecxzg?=
 =?us-ascii?Q?8JZcC1MyUA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be86e606-6596-4a11-5367-08deac567ca2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 16:34:19.2999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9f7AkdBFOD3aqBHMzcYIyNO1fx5UAg27rvhqG99nmM0Wqn87ZZYtsI8LK9cZB7gFU4k1fkFafh2GgLOZHOaKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11227

On Thu, May 07, 2026 at 02:18:03PM +0530, Manikandan Muralidharan wrote:
> Add support for microchip sama7d65 SoC I3C HCI master only IP
> with additional clock support to enable bulk clock acquisition

add apply the required quirk.

>
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
...

> @@ -1031,6 +1038,9 @@ static void i3c_hci_remove(struct platform_device *pdev)
>
>  static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
>  	{ .compatible = "mipi-i3c-hci", },
> +	{ .compatible = "microchip,sama7d65-i3c-hci",
> +	  .data = (void *)(HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING |
> +			   HCI_QUIRK_RESP_BUF_THLD) },

Now don't prefer directly convert drive data to void *point. ACPI use
ulong as driver data. It can be updated later.

Frank
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
> --
> 2.25.1
>
