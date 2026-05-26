Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022127.outbound.protection.outlook.com [40.107.75.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B9C349AF6;
	Tue, 26 May 2026 09:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789507; cv=fail; b=NCkhHS4ZkWuegojTm7N7AvKmLNWJ9w7v4alsNQtJZMypKHNZrWhdO4WeKme/zCjT/h5AsKzpNS0ht9NkdCu44XTsZ7e6uiXMYXPxFHCDeW+fzQPnQh8WC4iC8WmkIW9gSkVfqxcna05FOaeOB9dd4SWZPl/OJ6ymCHmNrLNQH7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789507; c=relaxed/simple;
	bh=30nrS2uMvo/qIKI2oa2N1kT6Fa+c3e0sVkdn5kzDh1k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mGB4OLlBdH54bc8DDq1mK5hliBJ0nqHh1ZvKmYuWutc8UA6Cq4pZ9bvLd7EPUhrls2M6c8EffbYePtb1/hw82ZAXVke4TGdyj16yFe5GRBZuEvt6p3EioCgEZJRs5Vd9TMJrI9pNbpShnssKth5+w9/XgPoQYGc6cheDI7dQAR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=L+WH+nIR; arc=fail smtp.client-ip=40.107.75.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="L+WH+nIR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qre/BnxHvItClEmKiwLiNJRuBZioRxzbgPiDfkB7H2Cl6z7kDm85YI8jw8kUfxkiezDddwS0X2srahoef37hQWOZUea4arNeDH1rDj8hJcUeEwt9JGbp1pYr4lHWTezMIe8WYwYYOyAmO1aL6O4TqmrTKOwLrq0SNHGoc/O4Np8dF2xOS9gXkMwERUmx9XslBCaAQmVQrMbVGHpSJDpjftSdNv8ovyLecdN1eEU+eZTxSFEPj2QbJroNYfEv51uD1SgqL9U9scTcy7VQb6+XwITg3sknOxKc7ShMJY7MykmjNZWUyRBbFisTnDMJNNU5b7uHVXYlhPnxgq/bj0UVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vohjKr/7bo4L9MkAcI42YrMqH3TfW+vOG9VO4+llpqU=;
 b=YlNs0DXPs6tIYKkmQXrG48SCE2iU8s/1C12GZv4QHdM9GPBq1Q6izv6ftPCiTMuseaM+JQrtJ0pZ7XhyQTLu4E0tImZl5EiwkNzN3oCyxXQ/LktVjty/TFKF7q5A+aY4pxv9cMn9NxSh041hXcix0uAZS42RHXvCyV9+2J0ppE6rbolKRiEAEnzoyoOwXwtUvjoukPxGINVli3kZ4WcFTlomSPhLx9wXUvNazTSszWEgGTv4DQRIOmAuJCv1kXl03PJqdl+KjaE49GxLFVefLXPCIqwur9Ne1F30BTUZIAu91w2NNGLpIWuCXIvc2SB9I+5H7/oc+NoThtMZkbVeuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vohjKr/7bo4L9MkAcI42YrMqH3TfW+vOG9VO4+llpqU=;
 b=L+WH+nIRQevsMzTpMNJDN76x9x0NdR1MwGdES0K4hCRNGfntvnZHypvJSmU5m8lfxE2BSadvHgtaK7UNbP1qfwrGPGZSfBdRdqNRiyHUB3V8VcwS5rDgKugoTqUQrEpvNEkmHGzIkFFP3dU2uSZGX4YHs5Jl5QbchsCcthsYNF078fELp2Ed+2OnIN6TcRVnnBBwtvB1jbKnSYmXMLu2V1MWegPdrPZ1LW3zJXoOYry8mKnL8KbbzdN2hAYNywvJsxbJ1arg/oTuPRQYbBMDSu2kg80hMhRN58WQztUqaqxiAqvijIyNbcHdtf3Dh9LSlj3ytraOZcsPMH3EO/Hntg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYZPR03MB8252.apcprd03.prod.outlook.com (2603:1096:405:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 09:58:22 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0071.005; Tue, 26 May 2026
 09:58:21 +0000
Message-ID: <3fda1592-f7d0-4e86-8615-602804673414@amlogic.com>
Date: Tue, 26 May 2026 17:58:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
 <1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
 <8d89b669-e72e-4663-9596-999a12922d32@amlogic.com>
 <1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:4:188::15) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYZPR03MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4e8a99-b378-4512-1dfc-08debb0d51f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|18002099003|56012099003|11063799006|6133799003|5023799004|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	XzhcmZB5WWCEGnBxH2bRc7oSKwKmsyo+camFtcor+VYSfAHZCCElBqGADiGLTCru5RSK62zunKJsb7Pv5EjMsjQEauj1enZB4l3PFsQ1xj9G7RJXBfnLaL1HNMRGhTFVsyG1Dtll2k0bT9F/xYO3DeX637km1ax5mbS5QLy5+24hRDXKh47WoIggfO83pd7ga+4rZPUqoUXcGy/ihHzyEBbdtGIOvwGL4w7MsWmZFM0vNEyFtiKqtxblTRcXepE+DRhlfHELYYXNqi8Erj4m36tEoXbZFtnNQCjeW5R85fZn5D0ojmaAywTjBeJua6Os7YLvw3cGtiotVHgI8FLraXSmFtOek6Cpy8OwnJosE2wbnvSERw0wfAx5PFEM2wKzisF6P3jSlEI0inIxuLoTqQmNPOqqZZBDHqFL1V6TcFqD0dXVZZ75jrXWWvxpt05AGsJhW+Lh4c9fNB+O/61+9wIXjLA5Dm9l1JwD1PqGnjHzt1+6S+7fGzTK8WhjNIeUw/9UTDDAYlwY66Vla4cHGKsCpJH2DN4YM1c0RZ9pUGWXBqeLQP/0s3gACFQ0A2Sk5pvkrKa1sDWnipEOcu04/NX7yWyAvSMu+6LoZq2k+ILTBCalgzvzoVu4+jbtGoV0tzFVYLrLqi/9roLhpfxbuU2pbxnLwasFFH2kw2HGefL0ork6APVXvJ2c8rATSNNe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(56012099003)(11063799006)(6133799003)(5023799004)(3023799007)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWw1K0pCNEVYRk9qUWx1THAyUnFSeURTWE1VU2kzOElWeFdhWCt3MGJyWk1Z?=
 =?utf-8?B?REowTXRYejhBWGNad2kzWlJualpLanhzYWpsaHRlSUp0MHYwY0tkOUFFL1RW?=
 =?utf-8?B?ZE11U0Z3RC9EWEx1ZkRQeEFMek5LZXNxK3NQQjgvcEdvNmRvU0drYmRxRlVC?=
 =?utf-8?B?M29kYTM3UFRhaFZoVWczbnEwK2JaRzVyQTBJRzJiMW5qQkxscGZid0RKWG14?=
 =?utf-8?B?MXhneU1Ud2c5UXlSZ2dRWEoyRHYxQ2h4ZlpETkthSG1EdzBqd0c0dmhBRUhr?=
 =?utf-8?B?NldBUkx2WG9DSFVWdXFxUnJFRDFLT0dSaTRNVEtNTmNNTVB3ZUlNZVBjeWU4?=
 =?utf-8?B?QklLK01JcTM2VCtqcTRTY3N4NmlqNzhWaDAxdFd2YlNObzRpS25lekVVcjc0?=
 =?utf-8?B?RUxoYllyTGlRUG9ZbWxEL3I2b2xtQVQvNFZHUGdHTmZ1RWRrRXVXNCtnRzh1?=
 =?utf-8?B?WU1XTDUxSVRhRERCOFR6S0VCWG5lRzdyTHMzR3hDOHEvcUFxSFBoZVZ3RURR?=
 =?utf-8?B?NDQxQUZqQTdNZnhtQU5TTlNiN1ZOb0wrYzZLbExQLy9CZU83RFJxYURBRG1m?=
 =?utf-8?B?Z3lFc241SGsyamwwdDJtV0hDa1ZYdjMyOTArcXBUelAweG9DQjUxSzRVMlFG?=
 =?utf-8?B?WVQ0SldqVHlpUFdIaHRscU9RajF2eUVqU2gyZ3hXUkliMWJWQW41VkxxaEJn?=
 =?utf-8?B?WkdGZEE1TjMxQWk2V1pDN1ZZdXdBa0NsZENOY0FvTDFlZ3UxaExGWFk0SCsx?=
 =?utf-8?B?LzlGeTZmU0Iyb2lRMENSME5NQWhiY0orazFOZU5pWDNXZzFJT2dhZlhlalp1?=
 =?utf-8?B?ZXUzVkFseWU1UTFsaWQvSHNETVlMNzI1VHFGWStDS2NsM0c5NWZtWHE1VnF0?=
 =?utf-8?B?MC9CVTJIdzNkMVJ6T1o3bnNzNFlHNEFRSDhNV3oxYkxJS3FXUVVBZXNzN05z?=
 =?utf-8?B?NXAxcUZWL3NCZi9SWHdIR2FhUnZiREJDQlpvSmkycTFZeEsvVVo1aW9ydC8y?=
 =?utf-8?B?bFEzRWpHWmN3NytHV0VqRmtESXRNYVB2Zm1zZXFZZTVHQmFZZzNzVkd6K0VI?=
 =?utf-8?B?TmJFWUFTZE9nNUhEMnp2RUYwZzkxMXlrcEZzSkRFS085TE0zclFjbGhwaXVY?=
 =?utf-8?B?V1IrQ01GSnlCVFhiUHVUazN1YTM5OVM1aGVjSGtCQ2Z1Q3pCdnN5VldZczNa?=
 =?utf-8?B?T1Y2aG1nZDNEeVcrYVhBUTZxdkI3YVZjUWcxZThhNUJVd0pWS2ZlMVpWTXZ1?=
 =?utf-8?B?WDdPalA0OGp3SW1UK0s2Z0Z2VzZkcUZmdE52b01lVHJBdGZ6aktCOW81SGVy?=
 =?utf-8?B?c1Jya1BkQmJ0VG50MVNwOW1LQXRuaWxqMXg0UnRpQjhVa3Y3SGk2dmxwSkpF?=
 =?utf-8?B?UHFuL2Nva1F0OG1TY3Z3RWRrbWpPMExqSVNhbE1UVkNneitCQ3FLZlZuRjZr?=
 =?utf-8?B?eHBuODFtY2F2eFZoN0UzbHNKMFlsWFp0eHU5cjdNdkxkMHA5ZU54NldrckJI?=
 =?utf-8?B?TnZUM0pOeGt4Q1lkWlhTL3RFWXFzWm9UYjcrOUIxd1ZTRUM2QnRjbHpudXlZ?=
 =?utf-8?B?cE5wanFtc21ET1dVMGlHbUM1QzBrS0JnRkl4MlBmZldiekRDaTVSQzY1NnVB?=
 =?utf-8?B?MFZuVVp4VDVpb1BPY1BGZnBjK2xjcHhGMW9zUllvZDZOS0NoQkNxTkt2QWk0?=
 =?utf-8?B?UHRaQlZHR0ZXWEZzQzNWT2JaQkxrb2ROdXpXTWQ0MURyMy9MdzUwcTFRdHNj?=
 =?utf-8?B?cGhBSWhQeGlaOUV4ZnBjKytKZUd6QXpBU1pRTDBBR2FxTng3RmJ0eDR0MlRP?=
 =?utf-8?B?SlBGMVJjYzU0Z0I4R0NoenplWDNXTWxZVVhoVGJWczlzWTIvNk42S2kraFFP?=
 =?utf-8?B?L1VWNWFaRi9lYWZsd0JRSk9xY2wrRGtBUFlzZ0xDcDZTZ0ZYTy9QalIyb1Bq?=
 =?utf-8?B?OG03UEZZVXp5YUVGaFZ5Rk9QdEtMcjFOM1hKV0poRUhzSlJGSDdRTFp3Skd3?=
 =?utf-8?B?RWNiN25aSXJYbERvY2hZMExYMUFFbWxRZDVvV29iRmprSVVYaGw4YmZ2K1pM?=
 =?utf-8?B?YUtxOS9nYlhXK2dHRlpuWG5ZbWtJYzRRSnY0aTNramVIendrL0Vkd3VpK0Q2?=
 =?utf-8?B?UFRQYmxOSDg4ZmNOWWtvaWpGMzBjMkZQN1RlQ3dTMUVCR0xONlRPbXdQT1Rk?=
 =?utf-8?B?TE9uYnVtMTlKQVpwejVob0NNdEYzVk9QLy9UbFFaU2RITGlnSU1uOXd6ZUFT?=
 =?utf-8?B?QmdxRTczWlUxTk1VaXpNTVd6ODVUNjZaU2pMR0lwbVM3QS8remdFRHRMNWVt?=
 =?utf-8?B?eTRlcElwTHVhbDE2bXFaTDh6TXFsNXFlUWpNNU02UWlpWjNVWExEQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4e8a99-b378-4512-1dfc-08debb0d51f4
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:58:21.8732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUhYLv2+SM0m/AzidhZXvmrIVBHZIUODk10ZrYIU9Q9LX9ON7ob04IjFCdsZ3LgA9KU7nkV1UCLmZNwLO/giLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8252

On 5/20/2026 3:35 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On mer. 20 mai 2026 at 13:47, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> On 5/14/2026 11:11 PM, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>>>
>>>> From: Jian Hu <jian.hu@amlogic.com>
>>>>
>>>> The A9 PLL pre-divider uses a division factor of 2^n to ensure a clock
>>>> duty cycle of 50% after predivision.
>>>>
>>>> Add flag 'CLK_MESON_PLL_N_POWER_OF_TWO' to indicate that the PLL
>>>> pre-divider division factor is 2^n.
>>> I understand what you are doing here but I have to ask why this can't be
>>> implemented with independent dividers that already supports power of 2 ?
>>
>> If we use independent dividers, the n member would have to be removed from
>> meson_clk_pll_data.
>>
>> However, n is referenced 35 times in clk-pll.c, which means we would need
>> to modify all
>> related logic across the file. This would be a relatively large
>> change.
> Yes
>
>>
>> Moreover, for all Amlogic chips, the n divider is an indispensable part of
>> the DCO clock.
> There is hardly a justification here
>
>> The difference between SoC generations is as follows:
>>      Previous SoCs PLL: n = 1, 2, 3, 4... (linear divider)
>>      A9 SoC PLL:            n = 2^0, 2^1, 2^2, 2^3, 2^4... (power-of-two
>> divider)
> Yes that was fairly obvious
>
>> Therefore, splitting out the n divider from the DCO clock might not be a
>> good design choice.
> I'm not sure I agree and you've only stated your point of view without
> providing any technical justification here.
>
>  From the datasheets of the different SoC we have, the documented
> limitation is always the DCO output rate range. Nothing related to n (or
> m, or the mult-range for that matter). This is a legacy problem, we
> started with monolithic driver and slowly simplified it.
>
> As far as I can see now, reworking the PLL driver to be a simple
> multiplier driver with range output rate constraint could actually be
> simpler than the current code. I would also make simpler to accomodate
> differences such as the one presented here.
>
> Unless you can provide technical reasons why going in this direction
> would be incorrect, that's where I'd prefer to go.
>
>> [...]
>>
>> Best regards,
>>
>> Jian
> --
> Jerome


I agree that having an independent N divider would simplify the PLL rate 
calculation.

A separate pre-divider for N is technically possible, but there are some
hardware constraints that need to be considered:

N = 1 is the preferred operating mode except a few fixed-frequency PLLs.
Larger N values reduce the PLL phase detector frequency, which may 
negatively impact
jitter performance and overall PLL stability.

Because of this, we cannot guarantee stable system operation when 
arbitrary larger
N values are used.

Some PLLs require non-1 N values to generate specific fixed output 
frequencies because
the target rate cannot be achieved with N = 1 while keeping the PLL 
while keeping the
PLL within its valid operating range. So N is designed to have other 
values ​​to
satisfy this requirement.

For example, the AXG PCIe PLL uses N = 3 to generate the required 100 
MHz output frequency,
since the target frequency cannot be achieved with N = 1.


Additionally, is the refactored pre-divider N implemented as a separate 
patchset,
independent from the A9 PLL changes?


Best regards,


Jian

