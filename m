Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023113.outbound.protection.outlook.com [52.101.127.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F78E44C65C;
	Fri,  9 Oct 2026 06:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527763; cv=fail; b=BG1LKbla1/OZA2nJqB+uZT3Cs6/kGeCRIRi9oDQulj1NQDFVEzr8VHj77rI/cCQrXN/V2DTWDRy5I1s+ZA6JUCQ9/v530gb8oU9cu0Rwx8rLbSG7mDuodTN55clN0yK5n6A/8lum7REDcvFv8vfA37XLbdVhxfHlErR7hxT1+7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527763; c=relaxed/simple;
	bh=0tWdCa9iv4QPYYwsLK825tRb4+tduzkBRJzQUmQ5JDQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QoFmuZaPP+PexJD+wGVwk/feLzXDVjJI9RVCKN+R3rltwm6Y10+RdifjhpLOz5O7rvrm/ke7DTDQb14CWXUrw/SXHTOtP/sveOvai1ODThcKsT0dtRaO8OrvbC0kD+ThgUEwnnMWhXy7CBp8PWiww+1OhbuU6SnA/qbbqOL4cms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=dPmAY4fT; arc=fail smtp.client-ip=52.101.127.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="dPmAY4fT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rd83yWqw762Ujb/k+Bavb/Av1ckZbqK0YhhRmBGxLCxKg5atEPhFPVqxMJZijzIE2EyPPaR15I/Sr1r+1gI6pQRAXtu2MESE1QtQA3aEM85lOTvHLlC6eB5jSH3Q5Mr49mzWuMo6sAlafUG7bbZ87Fazr/zxOwz4Lke1Po+4rx1jRdGHYVl2mcCfrJxVYNnJRuf1DYEMjwFuJyDE8/MBRQQ2SskFAiT1rDPDwTx4bfbes97IPqIbac9ODqSPHQdG0pGjzi6wSSvc1+mFIxyKNeWAiLMDz7Alz5jUS4eKG52vbJa16AqxtK2YN/WgCvW9YIbYLXLNRTjduY0Tiu2oEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0gceLecZa91dn6xrzfLTQvR1VTRtKzvhZXa3nwQVb0=;
 b=vbjACLvQejaXGBj42FF4Wzht7i2a2/fBrIjsG1HzAOjcfEkpR46lxq7+YFEo4UmN+Vl+SxDYT2b28rzu+Cs+KiW1AGFoNXSw8fdHjEF2DbEI4vLX2319D90o2kgl1x4GjewEh4VahHs2Dvz6MBzRxx/R9/BWinKFF/fO31jkHJ+7ZM3GWbq3LIuMaxbncgX3RdiI3aaYrQ+5b6uRoHuAzTer99XPeqGrqciUgjMhrXsyjpNIGmHXeADZr3mm+hRFA/2j1MVaiwkw1uDrST0wRS68fNkcUDhUt69/TpbmESD0Lxh4BmlAJHvPmQmDRFVZ/qFBFQOBbsrgQqa5CcadRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0gceLecZa91dn6xrzfLTQvR1VTRtKzvhZXa3nwQVb0=;
 b=dPmAY4fTAoH0XPZpgHsvg/5aKe/+bbmLulQtDzGf+/oq2kCzJ+iIjwdGD4B01ZdPXWdvLSmoJn6HVsC0Txx/u2yBXl47r3kRXEvL6BwI/Gh+2vMGaxPiWFT7zNX0FhvKT25uR9DsPW3OjjgPCQLhW5gWy9fz2bY+mGNYH0IWsiam3ia4+me7VBxSin4H+VUJlfl70ZcRuD/NlCgfxSFjib2ciPCULaX+5agTdG+w+Cv0/9ed9WnLeY52gszd7m+gq8WpsCFDVEm2FehbkA3m3Om9y6/lsd8GVqlJ1DSOLjK7AbDYBEcWidKewGzDYWZLhBBK+7EfppOmAWsfxLqZ/Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KUZPR03MB10145.apcprd03.prod.outlook.com (2603:1096:d10:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 06:35:56 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 06:35:56 +0000
Message-ID: <7bd6015c-3b93-4ce9-bde9-506a727525d8@amlogic.com>
Date: Fri, 9 Oct 2026 14:35:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] clk: meson: Refactor PLL pre-divider as a divider
 clock
To: Jerome Brunet <jbrunet@baylibre.com>,
 Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
 <1j1paj9elx.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1j1paj9elx.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0150.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::16) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|KUZPR03MB10145:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbaa891-b6b1-49e2-d2d7-08df25cf9309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|6133799003|18002099003|22082099003|10067099003|3023799007|921020|4143699003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	IIqjdi2A7cA3MfjRenBaFMzzrt6/WYd2x1gHUYosgp984o8WJEz3gT552ufuLUnwj1hZsLm5oyxUOMvjSzpD+Y4y79Lux2zOftySkqEcmQXoYRbtsHviPF7z9wIp5cql2XSHvdF2RMG/vIrR/rCDpPthwvjV5hgMH7P0vxcho/DnjLdqqzqj/q61TuRzz/PwfopKNAQYFIAlnq3nx8p6jpJJ0k6FFFm3oxOHmIMBfo6EN41MVWRDxCbmKlTxLOuAgjlXCccWRMY19ULJJCeZJoQqZ2Rvvb5lit/5gvslI10XxxWYuotDIXxdluvEfMLrhO7ex9R0N5yqaYkupaL/Nao+347p4rv1QFkg4JTA++uRgJRfirqhan/54cD3/4n85ZzLts1yk4INHlfGlmYcoDvCl5ShbgipMBWJUW8hkK8X2PPRf0aGZRzpzrlJUMXaJ/1vUOrYHxuW6UguGBcjP7zMAXVYzfK2A8L8idgnD8TRdfQ/gYp3se1HKkYNG1WdqJKxuGJGlUgkoUVPyFtjNOLOeuj3s5qpjp2P4YdqoTu7gLwMuOP8rY5ML0I1lTp7+vtUSS6JPWAIncGiF1z4nVdKF6isA+Hviep+s41nDfvHoZT6DmJJcHUxkYQHHBcM1hBeR3P2riZRtRwSJZ/wpaTxrewNWyjKV2/zU5M4O/Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(921020)(4143699003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE9CcUNpWDBZWlBscnRiU2REVWkxRU9YaHZodkwyZUprUmdEMSt5ajVvS1Ix?=
 =?utf-8?B?SkVrMk51RS9ScVNKUWtUak9YQUZZa2YyK1VZKzIrVWR3TE9FN3RmZ1h5bnp0?=
 =?utf-8?B?bkRwWVhZaWJvRmhmTVBHcWdhRGZidHFBa0RrWTRUZk9acVBVR0F5ckZmVmor?=
 =?utf-8?B?bnBtcThCTVY1TGZaVWhoSHo2dnNuUjhRMTFUOExQZmNVRHBOQkxrOVRRMUJP?=
 =?utf-8?B?WkdlM2txZFB6cjNlM2szSlhRekRvSDlpdnRad0NYMExBTDZiUDlndDlCZlRw?=
 =?utf-8?B?VkZpVHB6dFlQU2UyQ1NFN1NVTnZYQllwU1grOVUvMms5bjkyaDdSQmcxR3Fu?=
 =?utf-8?B?aGpCYlc1NCsweVJra2U0VUY3ZnQvZVU1QldGaERMSmJRSDZRd2RuRkZXSk01?=
 =?utf-8?B?QzEyYWhEbFhuWkhydUxiTVpxQy9NdWNBMUFCTVFMaCtDZUlHcXZtelBjWkd4?=
 =?utf-8?B?TG0rMml6UjlFMmJZc0Q5aC83bmRVc21kSFVjajdNNUdnYXkzQW0yQ0hEVElY?=
 =?utf-8?B?dXR4VmFXV3FtQUViOE4rT2I3ZWNLZ0luUytFZENIS1NLUFZLSlNjMmdJeDJx?=
 =?utf-8?B?RUtnYUZGSmRod2hEYkJmMUhaTjFZcVp0UVhqN0w4aXdYb3RRcVhLaTh6WE9B?=
 =?utf-8?B?ZjQ1VnFtVmJTcENCRWVkYU9tUHNJQW5pRmxCTTZjMnlzRU9IL3hOdHdqY29V?=
 =?utf-8?B?dXptVWxLVEN4SzVaRTl2YmlWeWgyVEhQczFwOTFYWUROb1ZRVjhydTJWL0Rr?=
 =?utf-8?B?TENhVTRrY3c3QlF0cXlNTXRhTWhhOHVzWHJOd1RLald4dVg4VE5qSU43dmVj?=
 =?utf-8?B?ek1UT05PdDEzZ2VFaEZCQ1h1eDU1UVVaTjJndmhUczRYdllaZVNUclVId1dq?=
 =?utf-8?B?RGliQVhUSFhGUk5KTUVibkdTMnlicHFDcTBWbHJrbnNFd2VKeE5IQ1dzYk52?=
 =?utf-8?B?SDErU1BPek4vZThoSGFXMHJhMS8ySXB1ZVZ0dVVKS3V3TFloYTU4WVM2VDNp?=
 =?utf-8?B?Vmgrdk93TWFjVEd3TlY1Tjd0cjg2WGx5S0JVb0lEUlMycjJRbXhMbkhoYkt4?=
 =?utf-8?B?Qys0Zks1TE8xV3I1RS9xUytLNnBNakEybTJzQkM2VVJ2bDhPYU52S2NZUEpL?=
 =?utf-8?B?UTNib25FMXFzckdFTys2SGV2Q3FKa1lieGZZOVE3M0N6RUlsbmVlN2lLNmlu?=
 =?utf-8?B?WUk2ejhPTW5XckJEbUkyT0Q5alNEcjZEVDNFc2NidkdEWGJZR0o0VTBtcUJa?=
 =?utf-8?B?NFQ5bi9oU0RPWHEySXhwUzBxdythdEs3d29xc3VHN0x5djdvYzdZNTFwMUR3?=
 =?utf-8?B?cERGVFlKNEdPRTlyZWhDZWYwNS9GYU9wMnN4NUR4K1EwYzh6QWZkWW9hbHJ6?=
 =?utf-8?B?b3krbGtaajRwSkNrMFpVRllSZGQxSUdVcUphYVpnU3FGRlgrS3BmZnpqOXI3?=
 =?utf-8?B?UWFzSHRDWXpJUHM5NTVDTUU2SkY4S00raDFIZDJSS1NxblNIYUFHdUFTSEhn?=
 =?utf-8?B?V0pRU012K2pKT3IxMzFTSmF5ZXJFblBJYmdHRktDVmQzT2pIYm1ZVVF4bkpN?=
 =?utf-8?B?cmxMSHUzbnBOcGFzK1lKTW9oMW9HZVBUK0FzdFFNQkRDdmJSTEFoM3hNbitQ?=
 =?utf-8?B?VHlJcG9DZCtraythV2hZNGp4bUFzTTBHTUxJdFZMWVpBQjlCekhGSHFaczhD?=
 =?utf-8?B?THdFdHZVOVErcjRkSGIzWHQ1Qys0VVZ4Mm1IbDM1d0VnaTBmOWNWOU92c0s1?=
 =?utf-8?B?VkYrOG0zNFd4LzROSUhlODAvQldzSzFHYVdmWTlHeGNENlhodGZTWTNXNnBz?=
 =?utf-8?B?SzQ3bE1vekd1ODJMZDI5Tzl1M2htV1BUSjJBRzVBaGFMVWlNM2c1ais0RDBw?=
 =?utf-8?B?dmJaOUlkL3d6Z04yeldHQWszNVc4Yi9nRkhSN01sMkoxTDVOWXlLVkRtVHlB?=
 =?utf-8?B?WWJFRHVOVko0WFNlL1AzbFJDUmVOM2JYcjBmcUwxU1QrbUExb3ZJV3VNdnFE?=
 =?utf-8?B?eEdrRUxuVGRhVTd6TTBUV0RuSHh2Wk9GNG93ZnRxK2ZqK0x4TnJ1amxJZ2Vw?=
 =?utf-8?B?NFBYY1JlQXducFRmRWwwdkxqZE1rVjlnZDlDQXlndGk3OUN4ZzJ3ZnZKTXdO?=
 =?utf-8?B?a1JSQi9LUjB5TTByZ2lzcjVZTi8wNXZ4Mzhpa1BrazB4aW5qSEJoczFOUHdr?=
 =?utf-8?B?RlhsQ1hqVHlxYWVuMGZYa01PV05VaUZpbWNLUzlyMTdOeUhnSU83Y2RhU3JL?=
 =?utf-8?B?TS81UXRncHgzS2h4TjM0cjY2aUNoc2Z6WHVLUEkxLzRGbHRIQXA0dXYyT3dt?=
 =?utf-8?B?a0pZODdEUzdmV1BQbVc0Y1NJWUlrYjdVUmxKb0VuL2kyWkJmdjU1QT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbaa891-b6b1-49e2-d2d7-08df25cf9309
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 06:35:56.6560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQDAY1KTpAe4RSpeZcKmakMNkov6DUZ80tz6k2QbhJ2NHanHfBqBK8kvDjxLBFZyctfNX2vREqv2zfx2zkfxbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB10145


Hi Jerome,


Thanks for your review.


On 9/24/2026 5:35 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On mer. 23 sept. 2026 at 19:14, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>
>> This series refactors the Meson PLL framework to remove the dedicated
>> PLL pre-divider (N) parameter from the PLL implementation and model it
>> as a separate divider clock.
>>
>> Currently, the Meson PLL framework models the PLL pre-divider using a
>> dedicated n field in struct meson_clk_pll_data. This makes the
>> pre-divider part of the PLL-specific implementation, although the
>> Common Clock Framework already provides a generic divider clock.
>>
>> This series separates the pre-divider from the PLL and makes the PLL
>> DCO take the pre-divider clock as its parent. This allows the
>> pre-divider to be modeled using the standard CCF divider implementation
>> and simplifies the PLL framework.
>>
>> The series currently covers T7 as an RFC to get feedback on the
>> framework design before applying the same approach to other SoCs.
>>
>> Series:
>> clk: meson: pll: Remove the dedicated n parameter
>> dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
>> clk: meson: t7: Model PLL pre-divider as a divider clock
>>
>> The other Meson SoCs will be converted separately after the T7 PLL
>> framework refactoring has been reviewed and the overall approach is
>> agreed upon.
>>
>> Any feedback on the proposed clock hierarchy and the separation of the
>> PLL pre-divider from the PLL itself would be appreciated.
> So if I summarize this RFC, you have simply taken the divider out of the
> PLL, no futher addaptation. right ?
>
> I'm happy with it on the general principle and fine with the change as
> long as you test it on as much platform as you can, clearly flagging
> those you have just compiled tested.
>
> A change like this would likely need to land early in the cycle give as
> much time as possible for testing.
>
> However there a couple of thing I'm concerned about:
>
> * You've drop the table support: are you sure this is not needed anymore
>    ? don't you want to be able to restrict mutlipliers to specific values
>    sometimes ? If not, then OK.
>
> * the determine_rate() make no call to round the parent rate: Since the
>    parent will be the divier, how do you progate the rate change so N
>    moves and the best parent rate is found ? For sure this fractional
>    multiplier clock will need CLK_SET_RATE_PARENT to adjust the
>    pre-divider.
>
> * Goes with the point above, but I'm not seeing anything that favors
>    lower N for lower jitter, Or mention of a minimum input rate (which
>    could be a property) ?
>    Those are constraints I think I have understood from your explanation
>    here [1] but maybe you've got new information to share ?
>
> This is overall going in the right direction but determine_rate() and
> constraints need work.
>
> Note: you are more likely to get test feedback if you add g12 (sm1) as an
> example. Those are still the most widely used amlogic platforms with
> mainline.
>
> [1]: https://lore.kernel.org/linux-clk/c9c4945f-cdfc-4382-b8ca-71b69d91deb4@amlogic.com/


Yes, your summary is correct: the RFC simply takes the pre-divider out 
of the PLL.


1) Keeping the table support

Agreed, removing it was premature. Some tables cannot be expressed as
a multiplier range:

- pinned (m, n) pairs, e.g. axg PCIe GP0 (m=200, n=3) and meson8m2
   GP0 (m=182, n=3)
- a pinned m, e.g. g12a PCIe PLL (m=150)
- sparse tables, e.g. meson8b HDMI PLL

The per-platform conversions will turn the tables with contiguous m
and n = 1 into range, and keep the tables for the rest, so
the framework will support both.


2) N is fixed per PLL

The main new information: the pre-divider is not meant to be selected
dynamically. Per the hardware design, each PLL has a single fixed N
value, defined together with the rest of the PLL: N = 1 for most PLLs,
and N = 3 for a few special cases on older SoCs (the axg PCIe PLL and
the meson8m2 GP0 PLL). The PLL input frequency constraints are
respected by this fixed value.

Keeping N at 1 minimizes PLL jitter and yields the best performance.

So this is less about dropping the constraints than about the fact
that there is nothing to choose at runtime: no N search in
determine_rate(), and no PFD input frequency constraint to enforce,
since the PLL input frequency is a constant for each PLL.

3) No CLK_SET_RATE_PARENT on the DCO

With N fixed, the pre-divider rate never changes, so the DCO does not
set CLK_SET_RATE_PARENT on purpose: the flag would claim that the
parent rate may change to satisfy the child, which is not the case
here. determine_rate() never touches best_parent_rate so the flag
would be a no operation today.


4) Implementation methods for pre-divider clock

While testing the RFC I found that with the single-entry pre-divider
table ({val = 1, div = 1}), the pre-divider register can never actually
be programmed.

The pre-divider field resets to 0, which is not a valid setting.

During registration, recalc_rate() reports the parent rate for the
zero register value. With N = 1 the reported rate is the parent rate,
and the single-entry table also rounds every rate request back to the
parent rate, so clk_set_rate() always bails out early (rounded rate ==
current rate) and clk_regmap_div_set_rate() is never called. The
register keeps its invalid reset value.

v2 programs the fixed N at registration time, with a new
init_val field in clk_regmap_div_data, applied from .init() once the
regmap is available.

Or do you have any other good ideas?

The patch is available[1], Please help to review it.


5) Testing and rollout

So far this has been boot tested on T7. For v2 I will
convert the SoCs one by one, starting with g12a and sm1 which
have the most mainline users, then the remaining platforms.


[1]

--- a/drivers/clk/meson/clk-regmap.c
+++ b/drivers/clk/meson/clk-regmap.c
@@ -163,10 +163,28 @@ static int clk_regmap_div_set_rate(struct clk_hw 
*hw, unsigned long rate,
                                   clk_div_mask(div->width) << 
div->shift, val);
  };

+static int clk_regmap_div_init(struct clk_hw *hw)
+{
+       int ret;
+       struct clk_regmap *clk = to_clk_regmap(hw);
+       struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
+
+       ret = clk_regmap_init(hw);
+       if (ret)
+               return ret;
+
+       if (div->init_val)
+               regmap_update_bits(clk->map, div->offset,
+                                  clk_div_mask(div->width) << div->shift,
+                                  div->init_val << div->shift);
+
+       return 0;
+}
+
  /* Would prefer clk_regmap_div_ro_ops but clashes with qcom */

  const struct clk_ops clk_regmap_divider_ops = {
-       .init = clk_regmap_init,
+       .init = clk_regmap_div_init,

>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>> Jian Hu (3):
>>        clk: meson: pll: Remove the dedicated n parameter
>>        dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
>>        clk: meson: t7: Model PLL pre-divider as a divider clock
>>
>>   drivers/clk/meson/clk-pll.c                     | 178 +++++------------------
>>   drivers/clk/meson/clk-pll.h                     |  13 --
>>   drivers/clk/meson/t7-pll.c                      | 183 ++++++++++++++++++------
>>   include/dt-bindings/clock/amlogic,t7-pll-clkc.h |   6 +
>>   4 files changed, 181 insertions(+), 199 deletions(-)
>> ---
>> base-commit: 43e1705ecab981c66baee89041e6f728c0436f19
>> change-id: 20260923-meson_refactor_n-e7f25904e536
>>
>> Best regards,
>> --
>> Jian Hu <jian.hu@amlogic.com>
>>
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> --
> Jerome

--

Jian

