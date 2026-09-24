Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023129.outbound.protection.outlook.com [40.107.44.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5423B585F;
	Thu, 24 Sep 2026 10:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246267; cv=fail; b=lxPKkRN0FETEQWC8J5UsviYU3cRktZn64L+sQIQ7y5BIwKxwT5a9JMP9BZneLKWxnZDJkcBVH9xAtmjuc411W7ii84XJ4xDpqALPRni6yZddZUEY28q2Zp4i/hy1h/GNzvw0KztsRl3/wOMc0XcgdF4Gy+T3ea61CO6fvU0FpH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246267; c=relaxed/simple;
	bh=3MhdNvD11fGKPTahpDAbdj6l97px4KM/gGj3RKecsu8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Dd4O6TVv+3d/3rRcV+vJnRs1gde0fu9rzYXsnD+0KCtElurCMAZFvOMgu59WXQV7d3gPI8rCTvupj1QP693VaaTC0f6n3tNLtkauvmE1o6uUONMSD+qdSG/LB5dyqIQLLVn+QmRGtBEu1/G1L7CwPU++su0hiJc4QCm/jzTBeWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=fk6C/UAy; arc=fail smtp.client-ip=40.107.44.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="fk6C/UAy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+lN1ShL6F8RypAKtxB+Q1YhiJ803rZFM9X54+uwQsFKoA+40rthju+IZpumn/04WJhAG9w0LfTkj8t/YJFPPSccIeljrGZwuPF9MfZINn8zxVC+qbir6O8G7MgfSnXZrzG7pp/QrTohe1ZSN4z26DaV9vfK5MWHeSDU8RKUCpJ1Aw12KS8cLGbHmr2GFKt8Kcgv0bQAbQ0x81RnHEpzylCh43a2XixrK4WYevOHPSGeekee1SwzyQHBQcwElE4Ggt7rVzuRoTqvTXuvc+f/64UhjyczzsQNpgOWvbjoP5K3fo5e7JhQJPVVJKy4rSYlNQ2IAtZkYLOwrcAzkqzDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aVGVA/y5suqMtGINtsNZSCng9qJcTNEhVywcJgm6MY=;
 b=Z4NK70mVSIDUkWgZ/xZEw3+b3Y1IQa1rTCLuq5zGGKD/n0G16H4vZVYKJhjkX/AH8Xa+wJ5kKBvOhTIMGdqrV2TEl1TqSHC6kn6AYKsJISzOknXk+RujjbJWvlIHdsOdC5KOGu77hOHHj44VgDzjPOMDPSufgOV1ruzEgG7aDHTHLiuVJ2F+ayYgNk6Pmpx7DhqIxTrw1WkhiMLPbp6pg4gcDrxfdRjvwB0RUkXALASVW5kwb5+54j7msXzhIckidTvNGzCDiz+D5wVpvpSdS+BgCe1SWCSbyhIMlI2fUL5QycDvd9h9iKf7hS3BO19MNMm9VBS/38s5j39LtdqOUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aVGVA/y5suqMtGINtsNZSCng9qJcTNEhVywcJgm6MY=;
 b=fk6C/UAyfHvVspRKqIobEOlQ6YWX5rMja/S1DfBjHifbSg/NCrpU3XLqqJ7OJ9gcZoTjK53PqBd5prWhMuqRPIrgvm6TKlnete8aIdkndibNgEINAAI4yVC93eYbpjdGSNqRqIV/9CAhWsDcBCCEORo6upzm829qGqfTZa2LBRekg80AyUsu6fOt/WAkG26zj44K37O4YqtGrxHnK8gTUV6fnLdt5dxwpUTfEuuKxUJQnDmKjIB0H1Z4Pq/BJ7hZnzRhONXBOJ4/2/kLfD2BMu3E55tEmZAdwhM1+IBCzF7c1o1crZriKwCIFwMaC6saCYsSvUp+vWiyg7XsYfIGww==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KL1PR03MB7902.apcprd03.prod.outlook.com (2603:1096:820:fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.16; Thu, 24 Sep
 2026 10:37:43 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 10:37:43 +0000
Message-ID: <e9ac114c-625e-4d76-9aae-0afb90d0ed92@amlogic.com>
Date: Thu, 24 Sep 2026 18:37:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] clk: meson: t7: Model PLL pre-divider as a
 divider clock
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 robh@kernel.org, neil.armstrong@linaro.org
References: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
 <20260923-meson_refactor_n-v1-3-3a8ce27121a2@amlogic.com>
 <20260923112659.8A02B1F000FF@smtp.kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260923112659.8A02B1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0018.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::17) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|KL1PR03MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 956b2bab-cb4f-4ac3-7675-08df1a27dd40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|4143699003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tBgjBRxkAgP5ucIFFR38Ik9UeEY8gkt28Ys0n5YYeCtcnaNbwcZeRgwWFOHOwjJ68J4W8h9VkdX3ef2WjsvjpvlHHsbvW9BtSdlU9FV8iDPKpNNMGV2PlKAxF1ncIQ96xAT6qyz3D1GrJdfCNsprf5Z1mrzJC3kWly+HPm7+NfoTq25icpCrALg+44twcD+4tnQWqn3JFvQi/1xEMFMvzgCHlr2k4BLBmQNJt+zc/8fbhKttJ0xfkMPGMawcTfsDMpCYw3l3/ly13n7TfflniFNc3iqa4WAysOZQb2ntdV7XF1PrYTP+tWPSObtJBRXHxRsl7INoMRdrIPsXEqabqYmiYeY1s0FjTP5ER5QZGIHQ2kST0H/cA5tH0rS+6Rc/RuVytHog6YGvNviZ1A5fujA6dkFRf7cFf7ZbERzdbnIsxyXUMDhUvIPNgQywW72uqwBLV343HCr5PTUotJFuSeItTBYOkA1ONDn1ZO2Au1fUPfkHE7+oropGNjbBvsBqPoNDvgkfvmDCs1jV5Gv8d6a2E4OxTYlqN88baW+Kbqn6cXXe4uGOI4bOZxo8FXavT5NNEhlkURggDr2zzkK6JtMaR+8L0/BkHp1mlF9STzY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bCtmNE9rbmxMT0l5MnJ3a2lHSkptRWtzODArSjRRRXZVcUxydG5MK21Dcnhk?=
 =?utf-8?B?K3VtbjNzcHBER1VpR3htWkgrUU82MUUway84QnNpRGpFRnBFKzhwRmxrZU1C?=
 =?utf-8?B?bHhWakxvV3BJMEMxYlZVUFNhc2pobHhNWVBzT1dnK2Z3a0wxZzlQV0FHdDNE?=
 =?utf-8?B?V01XaGdHVGlzVDlNUWJZNW45ZVhlc3lVam1JcnFSOExSK29zcnNsQWZtYVVM?=
 =?utf-8?B?emxNNXVpdGVrRDJyMjU3dWMydlRrbHZnYlFWazV5amdSSVFBRERHVEFsc0Rh?=
 =?utf-8?B?MDFIRFBZRGZtNFNGSkVOcEpMMlc5S1FqOEZxcHJlVGJEYVFDU1NQSUwrbW9W?=
 =?utf-8?B?WUFFQWhQSHRWWW1SVUtWaVJjU0s1WHEzSmtHWkl3QXJTRUduYjZBUGtEcU1h?=
 =?utf-8?B?UlVjOWMyUEorS0t6VXBkWmgvaHZWSjdvU2ZFK2dneHR0cVpxNG55OUN0bkxM?=
 =?utf-8?B?ZjVuaDVpM0pLRjdRN3dBTXJpZ2loeDU4Z3B3RTBnQ0svV2hEZTIzaHlnMm1l?=
 =?utf-8?B?OXJpVEdJUldVQWtPbHlmSjlVQzB4OFhBWTI3ODZwL1VpLzNXUHIrUXZnaytQ?=
 =?utf-8?B?Mmk0NG1IcStDZzJES3M2alBRMCs4ZDRaVWZzQURjdkJFL0F0UTBvcU5BK1pM?=
 =?utf-8?B?V3lDSXJXTy9YSlNoK0twblc4Q0FWTXRiVUpEajQ1VTAzVFVhYks2MnBCQ1kw?=
 =?utf-8?B?NDh4dDlJdDJBb2t1ZUE5OWNtQ01iY1gvcFFoTmRMMnZVQWVZZ2V1NTF2emwx?=
 =?utf-8?B?TGt4cklybHBKUE16eDBFTUhwMDBvWHptMGw0QlJlOWc1bnkxRmFjODJVNDVy?=
 =?utf-8?B?N00xclFST2lhN0dIcFh1aVY3Q09BL2FDYlU1NVRYb1pWWCs3MmNpSTByc1cx?=
 =?utf-8?B?eG5rRVJmalg3anNETDJJTVFJRmMrd0prL29ZLzZYZEVhU3picHc0d1hDNTlP?=
 =?utf-8?B?TENYZXYxalUzT2RBbmkvR0lmazVGVWd5bDBSQTQxdXR3M2N3RHN0SWM4dmdK?=
 =?utf-8?B?aFQ2RnlBQjhzNG1VY1pneVhOemNjeWR2TFFVVDM5WmFFdU0rbGJFTDJnaXF0?=
 =?utf-8?B?ZW5iSDdoY2VVOG4zNlRSc1V2ZDRZV2dld1k0eUtVOVd3STFadnNlNnFhZFdF?=
 =?utf-8?B?cXVGU3Y4MS9RYWNLZHk1ZzFDK1lhd0M5RWx2czRIS202NkhoRlFBbDZ3TG9r?=
 =?utf-8?B?YjJNdWhVeDBUb0FSeklqR01RTElLcEg4bXpBOHBBWHhCUmowRGJVcU5DWm55?=
 =?utf-8?B?clFhdFRYTmpoRktJd05GcFZTdkJiY2JWcENIb3RRblpRdzQwN0h1ZjVFd09k?=
 =?utf-8?B?YUFja1VxdUhUQ1FkMWdnWEREQmZpUWZTckoyK0hMN0F0alIxYkp0SDI0RVNl?=
 =?utf-8?B?RU5SSThVS3hKcjlxWHg2aWFCS2FTbnBMMXhLZHc5Y2RRWFB1M0JkNGV5cVpu?=
 =?utf-8?B?S1ZxNUFMcXNuSXpnbC83T3k1cGJhMThBN1gwWDJyUmY5dWpkQlNhRVNpYWc0?=
 =?utf-8?B?Und1ejVzV1VGVGlWUlNSbXBMaUs1eVdBNEhHKzluWVdaaHRzajN6bUpFVm5i?=
 =?utf-8?B?SFEvSTd6R0lZaFRIZGFWbjFBc0pEN0F3M0VHMWZ6OEYrdU9wV05UYVhyM2RP?=
 =?utf-8?B?RFFxWU9sR2pMaWxvTUJvYnpBOW1wdjBWN2FDZWFpL3JvaXpLVDZjSFpTeERF?=
 =?utf-8?B?VWxOeXpobDlkSU0rV3J3OFkvQ2dtek9GUDZCRkFMNU9iVVQ2L0t2Zml5KzNZ?=
 =?utf-8?B?MCtHU1J1ajEwWDVrcUc3aU9NTmFLS1VrVEwwdG9zK0NaMWNCN1NBc0FOSjlF?=
 =?utf-8?B?bE10eEdGZHE4WTcyZUVjek11c3RCTk5CS1RRdEhaWjhPL2hxQXQ1aDNhUUtU?=
 =?utf-8?B?RW9zbzRCMTduekgvaGhadHJUVDBFbXZDdDJnM3IzMU5IMWlBOTlTclp4OTZU?=
 =?utf-8?B?cEZRNkpLOTZsOFptU0t3c0tDaXpKMGNaOG15MGJxeGtXcFJSWGplYncyVUp3?=
 =?utf-8?B?OGRnbDhKb2FQUGFNQlQ2OUpKVXJiZGdWM1plZU45YUZLdjAweGhoMWZ1a2Nn?=
 =?utf-8?B?SGZiNVhvSHlPc2E1NGtQRk1CL2VSUVQ0ZGhycWZ6MEpXcjNKMGdtcW8wTXNU?=
 =?utf-8?B?eGlnYXZjOWdxMFlBcms4YTZlbFczSWZBUVR6T25kWWlsQldRcnNscFZhSGRw?=
 =?utf-8?B?LzdWenFBYlNRMmRSV0tmUlV4dFMzcjFDQ0l0MERIazBJVWltQW1ud3lGeit1?=
 =?utf-8?B?M20vSXF1cFlEOHJMTDFrcWV5djM1SEMrMllBSkZtcUxKVG5VR3Y1a0RxU2pM?=
 =?utf-8?B?UHhaM3B1RWJrUnpFaSsvWTN2UHd1QjF0ZVRXckloakhhbFByRXZwdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956b2bab-cb4f-4ac3-7675-08df1a27dd40
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 10:37:42.8980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2y1rccH5oPmpoy7x1XWZxfvCgUST2GgftNJg4Qg3AUED+y1loAwk6rtMIvoBvbIbd2+pYtN5+ysLdx+uUSFHsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7902


On 9/23/2026 7:26 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] clk: meson: t7: PLL pre-dividers permanently stuck at 0 due to missing CLK_SET_RATE_PARENT
> - [Low] clk: meson: build failure in drivers after struct meson_clk_pll_data change
> --
>
> commit 03f0a62ef49427b4fecb0de15b51e80cb45be623
> Author: Jian Hu <jian.hu@amlogic.com>
>
> clk: meson: t7: Model PLL pre-divider as a divider clock
>
> This commit replaces the dedicated PLL pre-divider with a standalone
> divider clock in the Meson T7 clock driver. The PLL DCO clocks are
> updated to take the new pre-divider clock as their parent instead of
> the input clock directly.
>
>> diff --git a/drivers/clk/meson/t7-pll.c b/drivers/clk/meson/t7-pll.c
>> index 0a622f45fa368..049f0c879c458 100644
>> --- a/drivers/clk/meson/t7-pll.c
>> +++ b/drivers/clk/meson/t7-pll.c
>> @@ -71,6 +71,34 @@
>>   #define MCLK_PLL_CNTL4               0x10
>>   #define MCLK_PLL_STS         0x14
>>
>> +static const struct clk_div_table t7_prediv_div_table[] = {
>> +     { .val = 1, .div = 1 },
>> +     { /* sentinel */ }
>> +};
>> +
>> +static struct clk_regmap t7_gp0_prediv = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = GP0PLL_CTRL0,
>> +             .shift = 10,
>> +             .width = 5,
>> +             .table = t7_prediv_div_table,
>> +             /*
>> +              * The hardware reset value is 0. Allow it during clock registration
>> +              * to avoid a warning from the common divider code.
>> +              * set_rate() will program the valid divider value (1).
>> +              */
>> +             .flags = CLK_DIVIDER_ALLOW_ZERO,
> [ ... ]
>
>> @@ -97,11 +125,6 @@ static struct clk_regmap t7_gp0_pll_dco = {
>>                        .shift   = 0,
>>                        .width   = 8,
>>                },
>> -             .n = {
>> -                     .reg_off = GP0PLL_CTRL0,
>> -                     .shift   = 10,
>> -                     .width   = 5,
>> -             },
> [Severity: Low]
> When removing the .n parameter initialization here (and presumably from
> struct meson_clk_pll_data in a prerequisite commit), does this patch series
> also update other Meson drivers like drivers/clk/meson/gxbb.c and
> drivers/clk/meson/axg.c?
>
> Looking at other drivers in the tree, they appear to still statically
> initialize .n in their declarations:
>
> drivers/clk/meson/gxbb.c:gxbb_fixed_pll_dco() {
>          ...
>          .n = {
>              .reg_off = HHI_MPLL_CNTL,
>              .shift   = 9,
>              .width   = 5,
>          },
>          ...
> }
>
> Will leaving these initializations in place cause a build failure with a
> 'has no member' error for those drivers?


  I will include clk-pll.c and all the PLLs in a single patch.

>>                .l = {
>>                        .reg_off = GP0PLL_STS,
>>                        .shift   = 31,
>> @@ -119,8 +142,8 @@ static struct clk_regmap t7_gp0_pll_dco = {
>>        .hw.init = &(struct clk_init_data){
>>                .name = "gp0_pll_dco",
>>                .ops = &meson_clk_pll_ops,
>> -             .parent_data = &(const struct clk_parent_data) {
>> -                     .fw_name = "in0",
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_gp0_prediv.hw
>>                },
>>                .num_parents = 1,
>>        },
> [Severity: High]
> Since the pre-divider relies on .set_rate() to correct the invalid
> hardware reset value of 0, will the common clock framework ever actually
> call .set_rate() on the pre-divider?
>
> Without adding the CLK_SET_RATE_PARENT flag here on the DCO clock
> (t7_gp0_pll_dco), rate requests to the DCO won't propagate up to the
> pre-divider. Could this leave the pre-divider stuck at the invalid 0 state
> and permanently prevent the PLL from functioning?


Ok, I will add CLK_SET_RATE_PARENT flag for DCO clock in the next version.

> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com?part=3
