Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B9B33939B;
	Wed, 22 Jul 2026 10:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716522; cv=fail; b=bvPYVeqUXWdqj93ebiyt+k69LFh1MPboq/1CtKGd6ypJP58JLzU1J6RDhACtP63F3e9VouuLbk5n8vt+P+JJkZCLRPHf8glO/cQq2fFII9Y86bJtGfaLJ5s9dJ1ug3xcdXKqc12y1V6yA7/8tzUAXjwUjn7VXGdR/vrLqmLfgRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716522; c=relaxed/simple;
	bh=H+Tk4TX1Qpx60/QjcwXJWjpckupv2qgrMs7Yrg6MBuE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ORcea/ndPLgvXFQTntehq1exoiW0NSwmzgnbTByidq6XM0F2DKagFTqubRBIGDPha8+rwlZ/Ln83cD1K141H+EDkkGbwKxFLMghG1W28ahfdBmh+m+avDtH25yvws72+pRpnOONdzMQ7yRJ48FXEx6k+7kuwPdKm56JrLggqX5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=fDHc1Pf9; arc=fail smtp.client-ip=52.101.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="fDHc1Pf9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4k3wZ0RUWuI2GYMn0lER+wh4DigzkD92m9iRPaAK7cA2lYIB4ucyWBtInAs8jowRaDawjjkNO0yu8jlRae6uuSAn8cVi50ayg07wbQrNpt+IwMnsEIF3UulRQ5pLphLTf6iSsLV7F7N5ITmaFhq/yLB5jxvTOyQ3G4rz84tE4FWaoQyfNLSc2grL8nT+8MhwNXZC0QhPTH/b3eU9EDPf1fqjqz7DCpkTqGATsov6JfjvlblmyPGsLhKpcr+460a0Ta96iC5C858UwaDNLUJE7b44dMN4rYvgpDlky0wx9WiMBhTjWm2HnwZT0FOXWfLP8wgXOOMnIYPmexwZtdfpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtOzQ+rrBZk/cBpfRSkJ0aV7vgo7TfpxRyKQ2iVazQY=;
 b=HaPQCrGHNXxAbAZD8aCIoxFY79BuLIreDbXxC2T+YPfjXTytLHYuov38XnAGgT5PX737VxfGmnlJZVVPOwqr6NxlGCdvT4Er5WybeT8L9xwdrFLn3Ov3cS3MrRQFkF+nZoDNpowPkdaVzERhZgRl7wL1VpK/i+Wcnq4/Mkc9aUgVbsUgpEvOT7qiFiEzaM1iAssamd3tJGEXDhR0/guPIDKrIa9sCeEqKVP5CiR8VMX5UfQ0T9VVTmYcyRJtF0mL3LsQXh0cRHGkRPH2H9AXYNbkzkB9Tgx0zX9+BZ7NGZ/kYcAZtpw1ii7Bt/ro2smbW5U/+y137oSrwHQowzHU1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtOzQ+rrBZk/cBpfRSkJ0aV7vgo7TfpxRyKQ2iVazQY=;
 b=fDHc1Pf957xqQ42PecnWySGgwNCbmFyZiuroJyKEgFq1vDjAUj4hrObpJF9H/wpcp4EIibcQRtiHWSBm9TM6s745r562A3isxVBxnpbFgCgdSVDgwiAxfv8vfi3aBfhef32MUH3gsMJnwCI1FdU4e69/gholOnPY18qpMhwMZaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DU2PR04MB9019.eurprd04.prod.outlook.com (2603:10a6:10:2d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 10:35:14 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0223.017; Wed, 22 Jul 2026
 10:35:14 +0000
Message-ID: <7f3924ab-52fc-4fb6-91b4-42a5e55d5c76@cherry.de>
Date: Wed, 22 Jul 2026 12:35:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: rockchip: Fractional PLL coefficient on
 RK3588/RK3576 is two's complement
To: Alexey Charkov <alchark@flipper.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Wyon Bi <bivvy.bi@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI4PEPF00000146.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::890) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DU2PR04MB9019:EE_
X-MS-Office365-Filtering-Correlation-Id: c2bb9d65-26d6-4a00-d09f-08dee7dcea0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|22082099003|18002099003|4133799003|10067099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	w+RhSFZgXEK+gMzEk5WczZJN4q3NCqVHjrSRr3vZf1swcIx6STrUGk9KaRqzW5RcUYmf1EtiArpPf/SsAB2yl9Gerl3liw5FhN+cdZNmonFUMSTI61drcMPNCCRQfIfAoea94HoifJPemVT6DIqyrzxpHYz3g5rDRr1g93HyQIPW9gfn8wTGk2Aj4vbvAKt8SjOwdWcsgFv2Ho3622nBSNQQXSc9D5+hBYJs6qs44/a75zBCQgkCngYMASyUTCNgvrA9UFoCBxYuTWICjjvceo+SDUBiYcpgQGfVEfSjHa7cOHTWaVMmmezBMm9eqSMvGU8kv43lJESbxFoIs6eYe79HQBFE8hq06EIQ9BRb4zZHOoTeO93d4uBfNSlCzGM9W+K1BlmWKIFRXo0prvic/CoNXQuMs5pF3WEPC2vxtNj+4GOhlUxg8AiZcY3plasqud7EJbU3VRCF4llGHH10Xesqx4+diPQ7znwGUB6bQBXPp2JnV1W3NTHRP6wM/GvikUZ54hjwaHqeDm/hhHKEwtfeV3Cv07n5Et4Wx6Ox2cxaEoO8NU5tZ86J8MGL9pgx3eCjSqs8tsXxcifDUAO3dTttRf9bDDH8LxgzibhZjT7Kx2qlHF4HQtsw8HBR7UP9yXcMOYLCFUoCyM9tSH9VwqXFAylCN07ThnsWk0RlJrzmt2rnbPuagICCpLbdagOEhvCbBj0ecM6g59f7y6spFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(22082099003)(18002099003)(4133799003)(10067099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkIxRWs4Z2Rya2R0SnJWOS9XZDB6Vm9mR0tGYWFPeFc1TEErbXVvYmpUS2c0?=
 =?utf-8?B?QS9DRDJOMkFtd0lxTEhXSVZWNm9qeUU3R0hUTTBPeW53My9vWG5KeU9Ueld2?=
 =?utf-8?B?dDJBeEdBQTVvUmU5VmcvcHJOZ1haYk50V00wYldyVXluYmVLTnczTTdkTE8r?=
 =?utf-8?B?N09OS0I5SUxuZ2NZSUNFcnp6T0pSb0gvRklLbzAvbEkrdlJMditFN0Nwc2VT?=
 =?utf-8?B?ektQakw4Q2RkdzNMYU1Uc0Vvc293WDFnZlJqYXltbnpSYW1YSHpvbnVZOEdJ?=
 =?utf-8?B?V2VmK2VoZkpXYU1ZREZORHozd05jMjFIVGFlaFZTVXJtcENlaStlUGJLeU1h?=
 =?utf-8?B?b0cwNExOMTZURy9VSjU2REJ0bFpIc21FaUNtUEFRMGpGVzNEUEhuV1c3OVRX?=
 =?utf-8?B?WWJuUjFYalFFVjRqRFQrVlhVVUZVSHhxMzdjcFc1R2pTN2tHV1ZnVkYxdHZT?=
 =?utf-8?B?bE9CcW1yUVQ0MDBIejlCUjloSmljM3MvWGxvNzJ4WUowZ3IwN1hSRWt4SFA0?=
 =?utf-8?B?UjFFS2hiUEIydGk1TnhDQjl6MWd1SFBGNkpzZFM0WExIR3lVRUZEOUswNGUy?=
 =?utf-8?B?UkFmZDBzcGxEYXZRRGh6SzQxb3NHRkpXU3FKRUlOZW8yTEtOc3c4N0MwbHRl?=
 =?utf-8?B?VXFtWlRrVHlwS0xycXYxME1SS2RnL3p0YW1KYjN4T3piQ25rTFM1c0ZEbEtH?=
 =?utf-8?B?RklpOWpmN3NBS0J3cnpXUkJJVnFKanlOczhaeXBWaCtLSkR5MlVVWFY3cEli?=
 =?utf-8?B?bWdsSkFlM0FJTk9MREptUCt5ZkxzWHFDTmplVDdZdmtEbERBNUtidWJrR2cv?=
 =?utf-8?B?NE5jZVBUdnFncGpJTUhUWnVIK1p4dTV1Ui9GTDVTbHdLL2w1Y1lNU3dpbTNT?=
 =?utf-8?B?UEw1UG5lMmd1WEhMTHpTZDVkWXk4RjJzanJXT3p3Vlg5dHVuV0Q5eUR1ZkxD?=
 =?utf-8?B?bzFIYWQwNWFTTlBnM1JYZ3lVQVpUaFpsSkZHcUFuT2Z3Z0V4ZGxUTm1oeEM0?=
 =?utf-8?B?QWVkeUsrYlRsTkQvNjc5czZ1WXNDK3JyUEhzV25RVkRhZWpVcXk5ZUtpSW5L?=
 =?utf-8?B?ODk3S1JQaVJqSi9OWFluWllaVjBML0pvVzY1TkV4WG1wdDVoN29ERVBWVjMx?=
 =?utf-8?B?QkNhUllobFdJK25zbXkzUW5FQk1hcmFsZCtxOEhOaEpPUDVGbWIyN3lFSXRL?=
 =?utf-8?B?azFtZmU0Y2gyME1ZMFlwSHFjZCt1b0c0RHZiNStIdlFMejhFT0ZkSUFzTjhx?=
 =?utf-8?B?RWlXMkpJd0VYTjlkTEp0ZHZXNERjaWVuZFg2QUliMzMwdm5TU2dZTUpBQ3gv?=
 =?utf-8?B?NEhTNkFZN2NTd2xNV1pzSWM1SGFTZUxnVDRMVnBEMTRjSlpaZGNsSXJHTVBT?=
 =?utf-8?B?N3VvZjJVeWhpcmRVL2VzaHR0ZHZQaXdmUTJpZUdqZGY5K29hL3RJdVljSytB?=
 =?utf-8?B?cVQwNkE0eUVqaG9tZFlPbHJWVW5UWG1va0t1bGdSYk1qU2p5VUoyV01DMTVu?=
 =?utf-8?B?dVlZRnFQdWxXUXBNY3NQdWV3TC9OL0hERWxSQzJEZlZpSjZHakQ5SFRkRHNN?=
 =?utf-8?B?SHE5Kzhacm13aE50K3FuOUlCRnZ6V3RoQ0hqcTFVTFBpRHVPT2F2cjNBV1VT?=
 =?utf-8?B?bTU2cXFGTnZNb2l1eCtGcUhkMkhnUnlGVUFYYUtJRUJIUklITmdYUFlOZUVV?=
 =?utf-8?B?Umd5QUszTkZ1a05aeUU1S3FOM3MwYURDZ2hKV3JjZi9YcnpycEdTVVpSMmdj?=
 =?utf-8?B?dnpPREFibGhidmhjVnh1bUdjb1ozc2F4YmJra2xqRUJCNjJIU2QwVGxjTWtL?=
 =?utf-8?B?clkvSUVPNW40NzBmdWVLUldrVzJla256NERTZzg0YnZ5SDliSGtuUDFiRUpk?=
 =?utf-8?B?eFJlSVNRV0pmVGFIRFRseUo1MTJEd3J5VHFUMXBReWJGMUNUY2NxNzI4NStT?=
 =?utf-8?B?aUFQWnkrcFcyRyt1VURxYWNBNERUT0RQSWJ5YkxmWFp1Vld0dEIxTHpudU5o?=
 =?utf-8?B?S2FSdy9jdkdRZWprY0hnSXk2WG9ua3daWTcreHVKV0x6M1ovQ1ByMVNDN2tJ?=
 =?utf-8?B?RC9EZklZQ293QnBlajF0aUlBekZqVkticHQ5UzZhOTNtYllSaWlPSVRrVnVS?=
 =?utf-8?B?SFh3RGw3TlZXK2J4U0tHUnMxRHA1dlRMZ253aGErejhZTVIrbnpvK0ttdzA5?=
 =?utf-8?B?OGJyZC9SWGhvcVRtckZFaGcrbkNQMGFWVDY2bE1rYjVpeGVjcjU1NXd1cTVx?=
 =?utf-8?B?MDR4bm1UUWphOGUvYVdYeGlFb0hINTQyb0VwMXVPdzhOMHdEYlpQS1VmSUFo?=
 =?utf-8?B?dHFNTGpFcWRBTmt5azNzK1RpTjNPZW5MQXpaOStWQ1o1YzJFU0wwQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c2bb9d65-26d6-4a00-d09f-08dee7dcea0e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:35:14.0429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aT6ivEWwWcLMpOZDZY1OplkNpOAUSDc3YFD1KnUxTlNs58SY4GL2ymEdXVURI8Ie/GzdDwSUEUN4fuTp/Sq69lbbQkW2MtjKnP1Bc5/qlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9019

Hi Alexey,

On 7/21/26 9:17 PM, Alexey Charkov wrote:
> When the PLL rates table was first committed for RK3588 (and later reused
> for RK3576), the fractional PLL coefficient was defined as an unsigned
> value, while the TRM clearly states that it is a two's complement 16-bit
> value.
> 
> Rockchip's downstream kernel later revised the fractional PLL code [1] to
> account for the two's complement nature of the coefficient, but that
> change wasn't upstreamed.
> 
> Change the PLL table definition to use two's complement for the
> fractional coefficient and update its users accordingly.
> 
> Note that a negative fractional coefficient is meant to be subtracted from
> the next larger integer multiplier, so the _m values in the table are
> also adjusted accordingly for the two negative-k entries.
> 
> While at it, fix the denominator of the fractional PLL calculation to use
> 65536 instead of 65535, as per the TRM (RK3576 TRM Part 1 V1.2, Section
> 2.13.1.4 Setting Guide on P, M, S, and K):
> 
> Fout = ((m + k/65536) * Fin) / (p * 2^s)
> 
> Link: https://github.com/flipperdevices/rockchip-linux/commit/7a72bc05dcc3a51e85ae531749e6270bf9b9212d [1]
> Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK3588")
> Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK3576")
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
> Not adding Cc stable, because while this fixes a real bug it's not a
> regression, as the issue was introduced in the same commit that added the
> RK3576/RK3588 support.
> 

I don't think this is a valid reason :)

In any case, this patch is doing too many things at once. I see the 
following things that would warrant individual patches:

1) fix the wrong denominator, stable candidate IMO,
2) fix the table (using unsigned int still), to match what Rockchip did 
in their downstream fork (maybe check they did maths properly first :) ) 
stable candidate IMO, except if they are related to 1) in which case 
squash with 1),
3) switch to signed integers wherever applicable, not stable candidate 
IMO (but eventually may be backported to facilitate backports of future 
fixes),

> Note that there is a separate unrelated issue with the rate table, namely
> the 2256000000 Hz entry currently leads to a VCO frequency of 4512 MHz,
> which is just above the TRM-stated maximum of 4500 MHz. Also multiple
> entries in the table end up with Fvco < 3 GHz, which according to the
> TRM leads to a PLL period jitter of +-2% vs. the +-1% for Fvco > 3 GHz.
> To be revisited separately.
> ---
>   drivers/clk/rockchip/clk-pll.c    | 8 ++++----
>   drivers/clk/rockchip/clk-rk3576.c | 4 ++--
>   drivers/clk/rockchip/clk-rk3588.c | 4 ++--
>   drivers/clk/rockchip/clk.h        | 8 ++++----
>   4 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
> index 6b853800cb6b..f445b01aabd0 100644
> --- a/drivers/clk/rockchip/clk-pll.c
> +++ b/drivers/clk/rockchip/clk-pll.c
> @@ -13,6 +13,7 @@
>   #include <linux/delay.h>
>   #include <linux/clk-provider.h>
>   #include <linux/iopoll.h>
> +#include <linux/math64.h>
>   #include <linux/regmap.h>
>   #include <linux/clk.h>
>   #include "clk.h"
> @@ -913,11 +914,10 @@ static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned
>   
>   	if (cur.k) {
>   		/* fractional mode */
> -		u64 frac_rate64 = prate * cur.k;
> +		s64 frac_rate64 = (s64)prate * cur.k;
>   
> -		postdiv = cur.p * 65535;
> -		do_div(frac_rate64, postdiv);
> -		rate64 += frac_rate64;
> +		postdiv = cur.p * 65536;
> +		rate64 += div_s64(frac_rate64, postdiv);
>   	}
>   	rate64 = rate64 >> cur.s;
>   
> diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
> index 2557358e0b9d..63f229e73a45 100644
> --- a/drivers/clk/rockchip/clk-rk3576.c
> +++ b/drivers/clk/rockchip/clk-rk3576.c
> @@ -79,13 +79,13 @@ static struct rockchip_pll_rate_table rk3576_pll_rates[] = {
>   	RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
>   	RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
>   	RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
> -	RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
> +	RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
>   	RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
>   	RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
>   	RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
>   	RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
>   	RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
> -	RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
> +	RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
>   	RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
>   	RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
>   	RK3588_PLL_RATE(594000000, 2, 198, 2, 0),

For some reason Rockchip didn't fix this for RK3576 in their vendor 
kernel, so it's still using the value from RK3588 from before the commit 
you pointed at.

> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
> index 75d42fea2a11..24baa0ef9bf3 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -79,14 +79,14 @@ static struct rockchip_pll_rate_table rk3588_pll_rates[] = {
>   	RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
>   	RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
>   	RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
> -	RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
> +	RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
>   	RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
>   	RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
>   	RK3588_PLL_RATE(850000000, 3, 425, 2, 0),
>   	RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
>   	RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
>   	RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
> -	RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
> +	RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),

Are you sure this is proper? Rockchip changed 51117 to 51119 (so -14419 
to -14417) and 49806 to 49807 (so -15730 to -15729) in the commit you 
linked.

>   	RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
>   	RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
>   	RK3588_PLL_RATE(594000000, 2, 198, 2, 0),

In the commit you provided, they also change this line (though they 
don't change k, so unsure why (if) that is related). Wondering if this 
isn't related to the denominator fix they also have done in the same commit?

Cheers,
Quentin
