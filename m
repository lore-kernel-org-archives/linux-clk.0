Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023093.outbound.protection.outlook.com [40.107.44.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80C2441027;
	Thu, 24 Sep 2026 10:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246210; cv=fail; b=XTa7wIVuNBs56c9fNxarAoQ/8/Pg59jTDEdlfmao2HH6qyNw1qTT5k32qr289mkuF8oDA1wKhhqBHgFs99x2foCNXVsHR9GX7Cx4b9G0I2wF+hmb7qaHVfDrN0rgrM7rrTkvJ7rceXau/A9hM4wpAlZy8oeCELqxSd2b0OD8ORs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246210; c=relaxed/simple;
	bh=tA3+pJvR75v023WUPwKE6LNrXV375BhHsiWPATif2rI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SB5XlcnBbBffSyX/9fgHRK8GdhxbMgTdj2MtkxnkWmhYnAHozYW0+vI/IitedAypmtTOjThaEzFiZRZl69UAr+H7PKBC9Z4feow+//YlJFGqiaml/5zWc8rwseIScwlQTuHeITgVZvA4ngaHfxaQhANGBZpyx8VqKjrGfsOJgz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=H407oEon; arc=fail smtp.client-ip=40.107.44.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="H407oEon"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TN/OAWEjqpz8RXlUG2XyQi2yxtDJQmhZVG+VpMzOW4+H0gwhsNF20luW7f4kYLfiL+3fflN2dgSRceMesBsaCF+Im7GaBJhkNsCWANaCGW5q+tXqGYm0Wm+Udy7uPk2ZXHtV11yNEj7SserpCGh5VAxW+1hBL7g0CLmtUDDX+aVJrl8PACKpkSOWVyp4swzhvTd4E9qDGecT6XmehZXkrw7QUvPfIOAJxW1B3GeT2t1FUci/o/ioVPrCc3Qu71Jk1pgicx0hJITyofdxq1xKyfXRCJb7gy+uste5QC4A4cKB5oviT8vdkvpr6yGz+oj3UnSAvbf7XZWmnJbRKxUyZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcxUdSWXO0uo7qWCpzUXhO/KcSLWuya52Xj9nXMGXv4=;
 b=ZrC1IYTR6FPXjxz/xkME2/atQa2iYxCNULQkun5mSbvqyjOck5y/IB9Gpa3/+NCrpo7KSTdEgUs880NQyqsf6uxvGuEXwSutQ/s7NX/o40tb8oa9zshvFhEVdDx5+BZthf5aDSsqu7T61Af+B0ZiPiVCbNtJZCsP2+JmYqV3MMF3kCGlkOtXEJTeZwrVq3v/s3j5HhUxFd7tlOd5K6VgO9xD+U2t6alFSjzVulVN4tSBaFxSoGDe5CbV5BIrU4+WPLM7TywW884SjThKUmWSo1AIx8y7kkyvX6Cv4qbUzBdDHqyANMGKxJlx1TrfGkN1CjfcADDzys32aWLuKz+nzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcxUdSWXO0uo7qWCpzUXhO/KcSLWuya52Xj9nXMGXv4=;
 b=H407oEonkzNix46lWe7RybSOc9/I8TGsJ35NmQuApHl+0wGXx7K5kUxQF1l4OeY4dhLO4XkuGCL8/KXK9329///VDR1WzpkKQYsjCngAAmGyfUP4hm6fvN2NNVxhFh8muP++2rhinNG8X4OJMtwhkU+KFnS92bqiEr8BRz+331Ahe7uVIWRGA/2EoBufZfbvZ52HLoM3VOhfuoZue1nCen06djq9V2cgDmgMFlobTRGFCVEy9A1UZAvt5+XSVcaBHyKb1A173DMDw4BxWe4M8VzgdIBLSauVNSl36afV0XrnY1o1FdREWeWbq4nbfYssOTxej9f8Ga9iQdLyzYpX7g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KL1PR03MB7902.apcprd03.prod.outlook.com (2603:1096:820:fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.16; Thu, 24 Sep
 2026 10:36:44 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 10:36:44 +0000
Message-ID: <719ccdb9-82ed-456f-a222-3a0e6319e886@amlogic.com>
Date: Thu, 24 Sep 2026 18:36:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] clk: meson: pll: Remove the dedicated n parameter
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, neil.armstrong@linaro.org,
 linux-amlogic@lists.infradead.org
References: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
 <20260923-meson_refactor_n-v1-1-3a8ce27121a2@amlogic.com>
 <20260923112431.925B71F00893@smtp.kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260923112431.925B71F00893@smtp.kernel.org>
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
X-MS-Office365-Filtering-Correlation-Id: 4961a209-e6e7-4c2d-713e-08df1a27ba48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nUY6MUOLN/oHnbZRVsRPvJUXayOqz79WH+0Y+mZtgvkl5A7O6kQ0hZHEQbjFdyHZgaB/OBqYdhDhxSJbJPN8M5FliKZk+wjQyHhweLCx3WUCIUt+8j5axrhSYYatzIppg6rsQbjaNHrlT+lUc+lfH73KR1LuY5IZIK81oA7wQ9cmtvLBsqsUkReRGM/sX0O5N4UavinRwWU/vWOEx2UZvTdxDHEWjlX6UGMGxIRzWI5urX2i9zyaTHawmZlg+l0RxUHofbPSudQL3zOyQcXmZ44hIshQpKB7IY6PJtqQl5XUCAvqaT5Cm386u/EwxpVoZGU0JwfhgM2jBcJqctmJZphCxyLHA6ctb2TNkQSM+/nVrtcw5EZARIf7r4NrbtSTI3KLWMPP9sFUKqbHjD7Mh9qhyBv1f2O6ArllaL1UsXRqBwCF+xEKKdLMSqR8j0M1MBS5ZZ3h6pvvKGTq4W6hwMzkh5teTUYCpbZr+3F1m1S06iq/TSfnfou4TeA0oVZShVUvzwn9Xw7bB7glxi0P1JFw1BjPJXvNnAGQRzgxxY4QqX/yZJxGBj6pntv1StBSK/fbhzX7lv3TT2P+fe1AcS8KnK2V/qnZt9N7euaz/wY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUxjaGdZeW5LT1B5bXJpVTNHS0hISXR1MTdsOEkyc0ZMN1FrSFVFalJaajF3?=
 =?utf-8?B?K1pyZEIrRjFhVzlOMDYrc2Znc01MRDhMaW9GMEFzb1BYV2VVOFFubkdtMWdo?=
 =?utf-8?B?bHFYVHpEWXBSTUY4KzgzT0Y3eWIyUHM3ZUxXa1J2TVV4eFpnMWxzOFcvZzhz?=
 =?utf-8?B?TFEzUVZBcExjY21nNGtwVlErdGpGcms3YVdxUi8xU1pVNlUyUDBsQzZlUWEy?=
 =?utf-8?B?aktlUHZCMURwbjBZSER3RDNjc0w4d2JmS1hMaGlmc3hGeUJCako4MUM3UFVz?=
 =?utf-8?B?ZzF6elg2VXhXcEUrMEJPcllyV2lCN0FoZXhnTDc3VnBRU3ArbjhYT0RUQTNJ?=
 =?utf-8?B?dmdJdXpON0NSYVhEZXBmdXUyc0g1WGtqWTFxenNPUTBoNjhCU0lVZ2ljSnNp?=
 =?utf-8?B?dDl3TllMdkNGYlE1a1RaMk1NRUJiM1lOdEpKaEk5cDFrTzZSZThnUWh4aGJ4?=
 =?utf-8?B?VVpwTWFOZ1RKNTVUZUMwc2Q5OEFpQTVmRVU3ZCtpZFY1Vlk1ZVJzMlFidnhC?=
 =?utf-8?B?Nyt6aC9CRDVDaDVkOHpsRHcwaXR2ZHVVaTJRMU5DL1lBb1NENmovV21BUE45?=
 =?utf-8?B?cVRsMS9rc0F3L2lWVU0xSmZDVmNPWC9YK2pXN0JBRktrdk9YbGF1RG5oMGd4?=
 =?utf-8?B?QktJcHVsNkFudGR6cHR5dG1TU1ZSbC83UGNUdUx3a0drSUJveTRpb3p5dGZG?=
 =?utf-8?B?WHkzUTBqSXd3a1I0MDRQbERlVDRHRDVEMFhac3FzQk41OE1tZ0pJdmZSL21s?=
 =?utf-8?B?MDNyMVJqMFgrU0ZtbkRyaWlaemU3em51QXhmMkdMMmpGbmsraHZsZkdQbzZi?=
 =?utf-8?B?NE8zSU1GR3RyV1Uya21uUE9oak5RWjRvSm5FaTZ4ZnN5THFUTzhkcHJlaEM3?=
 =?utf-8?B?ZnZRakd6QVRKazJZNElFZEFuRXIrMVpUS09kZHF4aFlyMmJEVUJMdnRPMjVS?=
 =?utf-8?B?dm9IYURLY0FHY2t2MU5XN0Y5MFJUa2ZCMU8wYTJ3amRncXhTZkZ1bmQ3VGc3?=
 =?utf-8?B?L3JpcWhRTlhEV21yMEVnVG9qTWpmdjUrbHlmdWdNQTNlMjAwSkM4dWszb1pk?=
 =?utf-8?B?cStMNWpPTDhtbVpUUzFCNEpUdmJEWmp6ckFDUnRPMFkyc0w5WlNRbFd0dlpP?=
 =?utf-8?B?c0o1Y2FZZytWaUtzNmRTS3hRd21Cbm55c2gxTlF6NXc4UzRMeFdLNXZ4WlYr?=
 =?utf-8?B?R0pGNVN4RnlyS2hpek1NU1NEbW1wZUVHYWVybi9Sc1E3L3Y1bXpoSlZLMTVP?=
 =?utf-8?B?NjVJWUhPdzU3TGgxakl2SDZpdCtZTCs0djkzRTJPY3R3WmtHVHM0U2dyaTNp?=
 =?utf-8?B?NXAweXE2eCtDVk5BdnJPQUpmZlF3alZNell3K1d5TmU1ZjBxS0t4ajk2SGlG?=
 =?utf-8?B?Y1U0SllNWmtHdHVtZnhnL2JHU0wydjBQeVIvWisxdmlPbXlSR0owUmhWSzk0?=
 =?utf-8?B?M3p2Y0ozNkhzNEdseFRocml1U0hUcXc5OUxHRkUzdy9PSjFoV0lwUXBkam41?=
 =?utf-8?B?aVlkbTY1R1RZcEdPTHYwMFlrdXl5NzlFL2FpYXVNVTgxeldFNVF2WjBlb1Fx?=
 =?utf-8?B?WGtKU2ZXNEFaZUZqdmhiQTQycUViM2NBTE5zajkraWZ2QmUyTjYvUGk5THNu?=
 =?utf-8?B?VE9MUTZvTitNc2pqYlVHWG1CTnNNRUkxRHI1anJQaTFNMjFRRDkvUnJhUDN2?=
 =?utf-8?B?SzdGMXV2NklMMzNvK01ON0cyTnpyVENtbndQZ055YXJMakxWaXFFZUVwcVlX?=
 =?utf-8?B?SzZqRWNYWGxvWVYyNEdkNUZTc1plN0VmOUY3c2k1TE5acGpydGpRU3J2R005?=
 =?utf-8?B?ZTBsVjJuK01jRVk5LzBMZVdWTVByMDJRc3pOcmFXM1ZNR3hPbVdtbzVNQUo2?=
 =?utf-8?B?YXlZdytBOEdLanZ4ZUhTRkFMeEg2REZ5R3c4N1FqaUZYVGRMV2Ivam51ZytC?=
 =?utf-8?B?SjU0Vk16UWRPR24rMUNhbGdmM1FzS201dWM0aWZSK0JoUFIyRnNzcGVpTjRP?=
 =?utf-8?B?TWxaYlpScnJjdCtNdVRKc1NqL2pjRTEyZlA3WkU4MnBvd3U4M2dXK1Z0bzFr?=
 =?utf-8?B?RXFVdlM2a1ZvRkduaFphcitOMlRLY1JieHhGVStZNjZhbS85cWZPSjIyL1I0?=
 =?utf-8?B?MjUwLzRmRml3SThhT0UvRGg0OEdJK2V0cmdreTFyT2ZVQWZKeUtvZWc3M3dj?=
 =?utf-8?B?N1pOdWF1MldpSis1Mmt2MXQ5OXRKaGh4RTJmVUlud2R5WjNDUUpvY1ZETVVa?=
 =?utf-8?B?ODRWMG1zMUFPM0pIcUd2N2dJZU85Q2pBeGs4dnoxYlYzZk1VWHE3UXRGWFN2?=
 =?utf-8?B?OUlzbUQwT2NYdE01YUJDUUcxMW9DaURJMUJseGY4d2hwNVFjMHVoUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4961a209-e6e7-4c2d-713e-08df1a27ba48
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 10:36:44.2576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7j7kE3Kps4O2400iI22YFh1qJbZaX9YKzubyRuZMXpzrcUv8JCAdqFVKTd/gB5aaRzBq9z7jWcJ9hrQeJ8yT9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7902


On 9/23/2026 7:24 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] clk: meson: struct meson_clk_pll_data removal of 'n' breaks compilation
> - [High] clk: meson: pll unconditionally requires range, breaking table-based PLLs
> - [High] clk: meson: external pre-divider violates PLL disable/reset sequencing
> --
>
> commit 9a0d9eb075576d244c161f62134109ad2353a8b7
> Author: Jian Hu <jian.hu@amlogic.com>
>
> clk: meson: pll: Remove the dedicated n parameter
>
> The Meson PLL framework models the PLL pre-divider (N) using a dedicated
> field in struct meson_clk_pll_data. Since the common clock framework already
> provides a generic divider implementation, this patch removes the dedicated
> n parameter from the framework and simplifies the PLL rate calculation.
>
>> --- a/drivers/clk/meson/clk-pll.c
>> +++ b/drivers/clk/meson/clk-pll.c
> [ ... ]
>> @@ -119,145 +107,48 @@ static unsigned int __pll_params_with_frac(unsigned long rate,
> [ ... ]
>> -static int meson_clk_get_pll_table_index(unsigned int index,
>> -                                      unsigned int *m,
>> -                                      unsigned int *n,
>> -                                      struct meson_clk_pll_data *pll)
>> +static int meson_clk_get_pll_multiplier(unsigned long rate,
>> +                                     unsigned long parent_rate,
>> +                                     unsigned int *m,
>> +                                     struct meson_clk_pll_data *pll)
>>   {
>> -     if (!pll->table[index].n)
>> +     if (!pll->range)
>>                return -EINVAL;
> [Severity: High]
> Does this unconditionally reject any PLL that lacks a .range definition?
>
> Many table-based PLLs in Meson SoC drivers (like axg_gp0_pll_dco) leave
> .range as NULL and rely strictly on .table. Without .range, rate calculations
> for these PLLs will deterministically fail at runtime.


Yes, the table consists of m and n, and n has now been deleted.

Therefore, the table method will be converted to the range method.

> [ ... ]
>> @@ -420,7 +311,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> [ ... ]
>>        enabled = meson_parm_read(clk->map, &pll->en);
>>        if (enabled)
>>                meson_clk_pll_disable(hw);
>>
>> -     meson_parm_write(clk->map, &pll->n, n);
> [Severity: High]
> Does stripping the write to the N pre-divider from this protected atomic
> section violate the hardware requirement to place the PLL in a disabled and
> reset state before its input frequency changes?
>
> By modelling the pre-divider as an external generic CCF clk_divider,
> its .set_rate will modify the hardware register immediately without
> notifying the running downstream PLL. Can this cause the active PLL to
> lose lock and produce an unstable clock, potentially locking up the system?


Separating N from the PLL will not affect PLL locking.

The PLL locking operation is initiated by the enable signal.

>>        meson_parm_write(clk->map, &pll->m, m);
>>
>>        if (MESON_PARM_APPLICABLE(&pll->frac)) {
>> --- a/drivers/clk/meson/clk-pll.h
>> +++ b/drivers/clk/meson/clk-pll.h
>> @@ -11,29 +11,17 @@
>>   #include <linux/regmap.h>
>>   #include "parm.h"
>>
>> -struct pll_params_table {
>> -     unsigned int    m;
>> -     unsigned int    n;
>> -};
>> -
> [Severity: High]
> Does removing pll_params_table also remove the framework's capability to
> enforce non-contiguous PLL multiplier rules?


Yes, it losts  non-contiguous PLL multiplier rules

The "range" method can cover the frequency points of the "table" method.

In the pre-divider, N is typically fixed at 1.

>>   struct pll_mult_range {
>>        unsigned int    min;
>>        unsigned int    max;
>>   };
> [ ... ]
>>   struct meson_clk_pll_data {
>>        struct parm en;
>>        struct parm m;
>> -     struct parm n;
> [Severity: Critical]
> Does removing the n and table fields from struct meson_clk_pll_data break
> the build for untouched SoC platform drivers?
>
> Drivers such as axg.c continue to initialize these fields in their static PLL
> definitions (like axg_sys_pll_dco):
>
> static struct clk_regmap axg_sys_pll_dco = {
>          .data = &(struct meson_clk_pll_data){
>                  ...
>                  .n = {
>                          .reg_off = HHI_SYS_PLL_CNTL,
>                          .shift   = 9,
>                          .width   = 5,
>                  },
>
> This will cause an immediate compiler error because the types have been
> removed. Will this breakage persist and break git bisect?


That is indeed the case,  I will include clk-pll.c and all the PLLs in a 
single patch.

>>        struct parm frac;
>>        struct parm l;
>>        struct parm rst;
> [ ... ]
>> @@ -41,7 +29,6 @@ struct meson_clk_pll_data {
>>        struct parm l_detect;
>>        const struct reg_sequence *init_regs;
>>        unsigned int init_count;
>> -     const struct pll_params_table *table;
>>        const struct pll_mult_range *range;
>>        unsigned int frac_max;
>>        u8 flags;
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com?part=1
