Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011004.outbound.protection.outlook.com [40.107.130.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406D039F16E;
	Tue, 17 Mar 2026 09:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740707; cv=fail; b=m1dGg03E67WZekOUeEDHehTAYUA8x1CLrUUI85FpyPMwzzUZqTZMB9vpLFE97WmRmJthm0SVxLol3fSZP967N0Ye9JnD0i2+kI7fALgz1KAcUIGfU/9SzFOiBFZmCMCzV8BS7F3r1ilNWUHS3C31VwGJ8CDkXPqrFTDQIZFtwvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740707; c=relaxed/simple;
	bh=71fx5WgwNaP//XKa8Yg3b13h0oi9ZB2Pt7YLrS1XPN0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=px9Z3RAzytlvT+bJlRKNoa1zA8aj3eYDXNdULYFe+z8U0WG+/YWwaO1P+Lzt/MckLN9nZaMOSYpJmFVthH6fj4fvmPLWSGm1ssOHMWSVPvAhJNo/abBMiKKRVGkjeIeWAlP0DbK7ebfXp8OPNYAFwAwxkUGSzN/SXFJZB2kHXjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ni9CA++c; arc=fail smtp.client-ip=40.107.130.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ni9CA++c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKVcwKNBtOuVA1IpIAC0oBDJKUolXiRS21wC1w1XxmKEGAvsck1ZbS/PU8GCEthqfJdGqxgtBk3ik6Ui1Ob2E1HprNooOJC78DtLzcsO8zImFSpP857ribsp1sAwKGpyez4q7zYbGK0Mxhg8Uov3WcSHIbDcVXd0b8cHiZgs9ENT4KeAjz54WNcvy30Zdsl7HV5QUj39yE78THaB8kqx7e2mzyqmK6UCUddpJhitKDOvgRm33hS4IEZBhXwr/9ZGCdmPSlsd0hdc9Gs9mCmqOy0B90SBWjg31BlP9NnumvvxM9w3CMZaTzyYFFjtHULd9amuWiSM5LsX3v4j/Afl6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oo9Q2eZNKug/oWXCXLaEvNRJTYeHc9/7iG0wWfRYtNE=;
 b=vvMLu4okrDyTO2Wxgw42sZ7UL4wkfLe8f3Yut75Z8YYO3zF/XoKtX2QmGbbuJCGJsAd3+ibZKgKChkzpZzBvrVYBKsgdBqvdZAyNE1I2Kd5I6XXybVB8UE1hut325kBvVS7sztpeqeelYRs37VeF7b2361o8IEgR05KWxPd4C++9l6Yd/g2ouKk8dNtMrfzJNHxPynkna7K5oVZDLtCqdozz6g2OpQ+iBEkhA/A/pDubVwbnDjoTdqUGjh/mvGz2ZHqeau0OJvmSWO6I8dzI2AyMNGZNvd2SbkQcyqo+thiTk1o5CGUT1U/eHm/uIA1w8JSq/+pXPE/jL8ujvIa1Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oo9Q2eZNKug/oWXCXLaEvNRJTYeHc9/7iG0wWfRYtNE=;
 b=ni9CA++c+y9v9mNEO+rspmwlRqr1VMk09pJu4/n7A0fD8QXjY04PtchFi4eBEYZNLQAP75juY3MzX8ThgS9nzaFl114C/UWeFYVxq88JtW1Toe7iojQVgU7ZHN6jMvfcR6I6GJHQySVLM8RMQAb5zIOW32c0lWmoBKq6xG+2CyQqG2xJYGlttE/1pDWZFQezLiXXfsCQRUwJ18SW347l/ajyY7LXDj5AQ0goEZ6CmTYpz87h97iFwITd3BDl6EKlh1i32AwPd2k3HWbw8XmTzfxBJk8x9qJyYuqMmKwbemqMEvOnVFDrmI2fMJ+jvQqeEb2G4/xZAU08Ab2ezM4qWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AS8PR04MB8628.eurprd04.prod.outlook.com (2603:10a6:20b:42b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 09:45:02 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 09:44:53 +0000
Message-ID: <b3d4e63b-1fb5-4db3-a5eb-b0287fda3a02@oss.nxp.com>
Date: Tue, 17 Mar 2026 11:48:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] clk: imx: pll14xx: Use unsigned format specifier
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260317093353.964097-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260317093353.964097-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::15) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AS8PR04MB8628:EE_
X-MS-Office365-Filtering-Correlation-Id: 1085dde4-41a4-4315-c38c-08de8409d6f0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|366016|18002099003|22082099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	AlDk2sEOObI2uw0XtQiqzpr6HqsVV6zHfq2MF8JEpulvWG0WAYyBw+aRAF5lhsVlxRbYMmej5kxL2zxlKOZCvNKLRbAYtVaT4XansO26Sxi0B5ulQN3gc8v6M+Po3LZ2d0u6crILeVhH8Mespc/YHIo7qZMfHWasYjdaHfTLfsaynok4CMng3sCRUp8w1/sDfTFTx3xUi89ZgV+73aiEEZnf9qVunW3Z+iWPI3yq9pe8Vk9P+F2VkKUpTv29nAa67D0fuUxZKwj7ZRoNMLtJy97qeEf5nxCwM04tSOYNkC6NObSVBKCEFNW6d/kD7dL+a0JEarkJ0EPdMJHhPzNMBfQ+ujD7/EV6djtBcuPGbsnP05zmJxE4bk1C66bvNHI3Maybe2+aTRoH1atrXlCZLDgFwjhKpfw7SBGCWK5xfsaPGkX+iHt7mKKQcgp/XCz91tPL61KNpZJ0EdJ+6hoCkds+HTDt+2sOm/ClVGVGGkx+hrxWAdmcRrlajvf+wLtZcLMfZfxRgxAgAS6zc+EGHjygSKyrEKCDthFWDO/RrGxIBOEISX+oLUWwKDwAQHFYVODuptCx1v0ws0KEI6Xhh/i9GXgnWOPpKih61yQsq9kU0kC77a0bT5Vbw3nWRohSJGXfmpRlAPAuUbUKl48vshjSJEc2cWwQAnhgtWoFwI/75cgb0opfMCXMlegYKl+7WAm5cIz66ozp4bSYq6hVHMECLbpieLk+X+uZlrzWpmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(18002099003)(22082099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODJGS3Z1R3g5ZDd4QW94aE9zckdyclREbjQ1RWZHaE04Y05yeCt6ZTIySGJj?=
 =?utf-8?B?cWYvQTRIQ0U5OHE2cmg3Nm9VVi9Vdk02R21CbU9zUGZFY1I2V2Q5QktWSmZz?=
 =?utf-8?B?cHhqU3lZbk0yV2toMzQ1a092Sm1lQk05RzV2Z3hwcEdtc1NJUUVLYnQ5YWlr?=
 =?utf-8?B?cHY2RTdyYy9nbGxlT3ByQzlOUTZjdDcwWkFtNjk0OWNMajViRENrNlFBYUs3?=
 =?utf-8?B?YVZGWGpHanVJZ1h3SE1hZjJ4b1hyeTdpbGV6U0NlL1RLdSsxc09TQzFEdkV2?=
 =?utf-8?B?aTFlNnRxL1JTYWZOdzk4WmZqWW03QzR0eVRyMHB1NXBLN25PU29LVFhOak8x?=
 =?utf-8?B?ZmhmelRLK1I1VXI2RGN4SHNLN2plK1hXN0RrWGNWc3F4TTNraWQzSjV4TTF5?=
 =?utf-8?B?UkZRSTU1QnB3Q2VKb0N3SERSaERtb2hrNkRkaUt3a04rZ0IzaG5SbFRnV28v?=
 =?utf-8?B?M3F3YUxvV012UW9MQlhvYmkvMzBNcitrditESWV1c0pPQ29MK0ZxajBaREJp?=
 =?utf-8?B?TERvWWdRRmVWWXlaazhQdVlvQjBsdTd5UE1qN0d3NVZZNXFaL1REN3NzR3ha?=
 =?utf-8?B?NVlHcFlLVTkrM3ltcmZ3dWdWaWRqTkJBL3Bya2U4TDltTjMwMTRXSFVYODV0?=
 =?utf-8?B?clJkR3NPaGl1YnV1dU94d01uL2pTZlBaNGczNHN2dXFDKy9uSXJiUERNd2p4?=
 =?utf-8?B?T2pKSTlXd2FOc0FuU1FFV2lIdEV0TTVDR2Zyd2FXNFB5eWg5L09KVWs0UXhW?=
 =?utf-8?B?ZVNubkJVZWJVOHJ1NVc3dTBBTzd2blhwMk16K2djMFZPNzFTcWZpMDVxSU96?=
 =?utf-8?B?TlJCWFhRQlgxL0hBcVB2eGFoYUV3Y3c1Y0lLeFR4MU9RV2NCNjZXU3VWNi9i?=
 =?utf-8?B?dzVyL3FVbGFjRmpGamhEODlzWURZUXE5QytxaVVWVTNoeWlhbmtDNVNtSUps?=
 =?utf-8?B?UTI1cjl5NGtRWUg4VkRPbHA0cUp6VGIrSjM2QVZPakhtcTJpZW4wWlZSMVZt?=
 =?utf-8?B?eTB6RkhVY0VGRWs2U1V2aW1MRnZsQjB5aXIvMlo2NEp2OE53TlBMRjliNXZI?=
 =?utf-8?B?YTAra1ZZbGRpSWQvNWtUeDhFcEw2Qm05Y2hXN0M0WCtQUXhUcnBKb2RPbUhM?=
 =?utf-8?B?d2o0WGd2MjVsZUtHOGVKbkhWeTdlQzdvUUpoRW1ZUGwvNEZrT05UWXNxMzAz?=
 =?utf-8?B?Vm5CKzkzRitGbnFBQUJ4UzBvL2YwRzMxWFJqRzdBRG5tbGx3ck45R1M5Z05z?=
 =?utf-8?B?RTVIU1FESWdZMmJHR1RlTFRUZ0N2Vmd0czJxakxhODRkWmlXTHhKdVB0VmxO?=
 =?utf-8?B?TG5yZHhUSFhGcmFVYUNUZDdGVzdwcFRqbkluOGJ2RTVZSk1OSktDQ1U5cGxF?=
 =?utf-8?B?eDNPbDdnblJYQ2ZGaEhlVlU2T0pKc1o1SE8rQURKZDJWU1A5R1d1SzQ2SXFC?=
 =?utf-8?B?cURUY2tRSjZzRkNZeDJ3QTJkQjBEVnBoVVBBOXZqeVB0ZEZibUZMK2xzV25N?=
 =?utf-8?B?SXJwVDdsSkozUUtwWThiTjcyK2JzbHNQUW5NTkFpSXY4ZGdZWEY3NW8xVXFL?=
 =?utf-8?B?Sk1YVTdkNWdSRUYvaWpKSjdLRUx3TElLS21nbDFmT0tkZnhJVEo2aUFZZE9q?=
 =?utf-8?B?cVZNT0tDWjVNYW9JUUdnYkY2eWY4ZGdSTzVwWm5OcUpSd1pGd2FpbHc5NEFn?=
 =?utf-8?B?ZFVjenZWaEhuT3NnWHN2dnJQcU5Ya2dsQjg3ZXVNL05nWGo5aXFKM050elll?=
 =?utf-8?B?VFM2TTRqRDZ4RHFaMWJJRGdCUENNU0IzTXFlZ0hRaXFzekxhc0RsODExTHc1?=
 =?utf-8?B?ZWlyRlZHcmpkd2EvSGdRR3l1emNZbVBjRjI2UEplY1dwZ2ZPaGFjQndOdjBM?=
 =?utf-8?B?Y0MrS3lEcldtZk1XOXNPRFdVS1JoWVBweno1YUNMc0ZJM2Q1UEFCMnRGWjBy?=
 =?utf-8?B?VzZGamN3Mjc3am1Lak5QYmt1UDhId2NkV3lOYjdZRWRKY2dhOXJuV0pybndj?=
 =?utf-8?B?cFI1U1VHd1BjN3BmUnRWWVQ5bEtlUStzQ0prbU5jRytmRXJsb3JjWmJtUDJu?=
 =?utf-8?B?SUZoT2VJblFqWnZuSlR6RDBkZzBCTlY4eGE0OWZuV3Q3MWIxNk9nVG5XdFE3?=
 =?utf-8?B?STVaV1REVnZUQjMxVFdHVEZmc2szbXRuMkp4YnBJRW9zOWFldDFqUE81eTdI?=
 =?utf-8?B?dHY2NmdxcisvTmxiRmJjYWxWdkM2SG9Xa1RYb2ZyVFdQMDRnM2VZaVR3OC9w?=
 =?utf-8?B?aUU5VW9mcHN2dG5HQWRxb1NpYVcycVNaZ3hKTU5VcmJaQ09JWkE2aERnUGxZ?=
 =?utf-8?B?MmpIVnc1WDNaSVcycE92aE5jeGlFQUE1T1lZTE5YN3ZCRXo3MTlVQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1085dde4-41a4-4315-c38c-08de8409d6f0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 09:44:53.0863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zhy878lre/T/8gvPPOl6jPFnk1HWU4LzpbH/LlGIbrAe6KtM4oc6HgxIAcZ5Y1lEAs8Ygf75oUSMT3FeDxJXng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8628

On 3/17/26 11:33, Alexander Stein wrote:
> The debug outputs use %d for clock rates resulting in negative clock rate
> during rate calculation.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/clk/imx/clk-pll14xx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index 7552aaafc3395..701a7a02235cc 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -151,7 +151,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
>  	/* First try if we can get the desired rate from one of the static entries */
>  	tt = imx_get_pll_settings(pll, rate);
>  	if (tt) {
> -		pr_debug("%s: in=%ld, want=%ld, Using PLL setting from table\n",
> +		pr_debug("%s: in=%lu, want=%lu, Using PLL setting from table\n",
>  			 clk_hw_get_name(&pll->hw), prate, rate);
>  		t->rate = tt->rate;
>  		t->mdiv = tt->mdiv;
> @@ -173,7 +173,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
>  
>  	if (rate >= rate_min && rate <= rate_max) {
>  		kdiv = pll1443x_calc_kdiv(mdiv, pdiv, sdiv, rate, prate);
> -		pr_debug("%s: in=%ld, want=%ld Only adjust kdiv %ld -> %d\n",
> +		pr_debug("%s: in=%lu, want=%lu Only adjust kdiv %ld -> %d\n",
>  			 clk_hw_get_name(&pll->hw), prate, rate,
>  			 FIELD_GET(KDIV_MASK, pll_div_ctl1), kdiv);
>  		fout = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, prate);
> @@ -211,7 +211,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
>  		}
>  	}
>  found:
> -	pr_debug("%s: in=%ld, want=%ld got=%d (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",
> +	pr_debug("%s: in=%ld, want=%lu got=%u (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",

Since you are here, I think this should be 'got = %lu' instead of %u.



