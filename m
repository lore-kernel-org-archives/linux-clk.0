Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023099.outbound.protection.outlook.com [52.101.127.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA8744781E;
	Fri, 16 Oct 2026 13:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157103; cv=fail; b=g8HoJc+CrJB6bOkh0TYy7GwZTCbVcIuu7N1ryBk//bJbHUhF0H0QKlYQF/fLbA1ROW6ZA77HljxQiFtvq+uJ3b1OBdG7OsN94XyedxcFhoxDeGDLSr4OTf+Tr23GF6fjy1i2UvcwqmfOiShm0yWc7t9sx8tJy8WXsr5rhsA8mbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157103; c=relaxed/simple;
	bh=ebC8FxkqY3kzTpGF2wCh6UGnSiK/PkqdFHVG0oVf34w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jHL6OSpiqX+md05ABFJmRvF5tcrqKAF1At8HCdiIH+TYFR63uPc9A/1UP4y8iq+N1Tn+TneYZg9d59xYGujMzfhQ/Pt2E7Biu9a5fKdSQp5q/WlaUWERi0heUZ8DSKi2+U9+ArU5Z5jBWPtM6clnwskGh2uSqseXiv3yiKLdOPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=SCxlnl5g; arc=fail smtp.client-ip=52.101.127.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="SCxlnl5g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4aY5ox5TrLt8m08x+vBckS4JHCWcBR6D6zNvnblmdL5dBjzgq1yHPJOLuU7eUc0LD7Ar9GGKKfqvDPAsFzwQECaqHrQS0pElO3K3lk0jNaLtTcVO56wSel2e56/Z4dzX/mGUuDKhUNELHOuPylolMZvM+8AbiHcf7of4EWWPJ8yhHM5ubOB4lT5RsXJmbSicnvqLv2Am0VleUJP+oPh7JkGWSEkXvUHS9shx9EzMdqb8ylZ36S9AwezILNJ+y2c7R3HybLludbBv0d6apggbsc9lJ+3ASnTGwoRX5Ehz2euFnOTN9dHoGYZIAVTgBMrAD6GBMSAWr3ENgDqAtmNAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8jyC4FL+hfNvEW1UoADjwjwyhwL/nyG7/+IjtcU9R0=;
 b=b7nwBaG3Xsf9k/DktrZaEIQyCnBh9Xg3/BPBgiPqGJL1cqSLOcNqTW5Wq6F1erpH2WDTXqGh83vPJi12TEjVZS2x4MDRDjXnAwrP6l96cUZdDrRfX6qqvWJbofJurpTF/2IobHxXOgfLHteuT/MH5rw2Bdl0ME2P1z0wmmpYTPD3/QJ/1HB6vFrJR0c2fXJah8yOcG4Oft77IDeswrJxjwGcGuus4rb6c9r8rwPzniHTZ9/CCjkUmNu9JgUu9qFhSsO5lWlrwIpFnuDeOqw0v1G0AUUZHiLFiAIvYBpZkK/jvemoLS2jBKXW7oHH8puMMNwM2qG7BoUrFJF+wSNAQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8jyC4FL+hfNvEW1UoADjwjwyhwL/nyG7/+IjtcU9R0=;
 b=SCxlnl5gGVpvJO4FNmtpUsOCWKbPbmSknPB6vRn+Usr/msWgwYrixncgp5Fm24oShz25Ss8HZ9c/P0WMTuxEG9BaL4TUaCAl6Qj67zG56YTg4Csni/AsLUl1OWcv7KP4QHr5sN7vXlrnO2qfeSraGq/Ce7tmcv1tpnBrvwY7qIemq03TKZRYIocI3AJjEJWG6duI5dTfph9lGjvoVMS9pSEHrsMwhMKAGAmM5PQTcAqVyuAPktXZhOYNXYUTHMu5naOZxHr0PW2WV6eD9UH+wtimLtELhypegK3Mi8E0X+TCvR2Hrrr8ZZ5+LAEG3+FrnqAOtsB+Ue9cpb4T2M4LeA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SE1PPF8E7AFCFC5.apcprd03.prod.outlook.com (2603:1096:108:1::857) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 13:24:57 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0522.016; Fri, 16 Oct 2026
 13:24:57 +0000
Message-ID: <3ebcd7e1-c463-47ea-a8ea-368afd89b603@amlogic.com>
Date: Fri, 16 Oct 2026 21:24:53 +0800
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
 <7bd6015c-3b93-4ce9-bde9-506a727525d8@amlogic.com>
 <1jik3bp7tm.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jik3bp7tm.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0208.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::12) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SE1PPF8E7AFCFC5:EE_
X-MS-Office365-Filtering-Correlation-Id: fac52ad9-380a-47cb-a683-08df2b88df04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|6133799003|18002099003|10067099003|22082099003|3023799007|13003099007|5023799004|11063799006|261009223027099003|4143699003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	eQZSxpIulflr6hcsI+SLujR94DfEZs5g/RHjgcqn+I1LFKrFaR5o9HbVmmbGzJXZG3VJwEGJd9uG02b2oLu+zbcKAT8bLyVbUUaJRvAYdgz9GbWYa2vzH2fyKuKT3OoQJ49OeQT8n3tDvWKFFbRjdFev2xyQBZtkjiXPlWZ9zDZeKAwRszfEsn78hfaMtON3FtMLFPm8FdzUc0VQJwvMA+UkI7JQLGaF59zzv4+GtMFcGOe3mwksu//O0EsOjxFH62cvMg1sEjQRr6k4kPssTKGTtYVooEMlKdLFNjtskRPAnatJl3FWNZplDD7dDQJW8Ko1IQJYImIrmn+3hZ6KVxSKAB53trUSsjGVXgqszqcjIO9NntsDx7BItUnapGX30rwbH/EDf2T+0YIY1/Crzf3XW2FwmEjwyI0KnCgjkbcWeu1lIWs720pN3F9VqWmpsrO6xWccxc+AqiecbHGl5qgWL9MnhWRsgCyodh7NWbnFxv3CMSYW7jqZrpYbFtMmzVo47caK+pWp0/TzRFTpDZNYLsxg4rU8tJKs+BW3BMTrw+pLgOfwmlAyWDiHjeZg8/PAScfGqN2lzOKNCqI7t1rVybHgNDu9mZF5VFEKkGq5Sh0rUJQxXBz3xThB3Ozfrb19KjAQJHAnoFc0Gifxyc65kSwN5OTc62WFAUTPwis=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(10067099003)(22082099003)(3023799007)(13003099007)(5023799004)(11063799006)(261009223027099003)(4143699003)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXFlNjVTeGlFS3JWUFh0NHZEbk1vaXV6eFZ0UHdvR01NTmxmL2tjbnlTQU5U?=
 =?utf-8?B?dHR5OGZSNWlSU2NxWnQyR2Mvd2V4NDlwMTRQYUwxYUJaWFN0TUh6S3hWaFlj?=
 =?utf-8?B?ZWNwSnh5RTg4ZzZoSGZmckl6M0duU08zTVJZODA0eHdSbmR0eUljQlhZRVZ4?=
 =?utf-8?B?QW9lV2FmcUhBRG01WEVVeTNCTjdnczVKdVVJekRENnJndmlGZWJGczRENkVx?=
 =?utf-8?B?Y1p6bXFRNnI4dXBvU1BSdk1VQkc2UlhkR0tHZ0tDRit3L1hnWU1jZGJNQzgx?=
 =?utf-8?B?UlV0ckJDcWhZUUVqSytBbTRoRmFpNk9OVTdBUStXQ0I2VFlGNGFmMDh4T1ht?=
 =?utf-8?B?T1paRmQ1b3lkazlJMjEzV1BxT21HV3RKbVppMDdhYVpFNURzRlFKVDZ1WFNa?=
 =?utf-8?B?Nno1RnZ5UU91alVrQ1ZFRWhXYWdTQlJRSE5IbWVoejdLVnJQUDZDUXl3T0hD?=
 =?utf-8?B?RGlMRVhINUpsYXFHN3FZY0xFYzU3SUZiR2gzYXhCdDZzRnpqTUZGWm5wb1lh?=
 =?utf-8?B?WCtTNEFxUUxRSGZtdlptbC81a096Q1p6eGZDTDhnbURqUUh6YmxkcXZIVUxY?=
 =?utf-8?B?NHBmQnRUdlBMY0FBL1BVVUV2N0d4Z0hIZGRGcXd2dG9yV1BCdHNWOTREK2x2?=
 =?utf-8?B?bmpMV2hGTjI4blByTVR1NlZCODFiNEU1YXByTk5BMzlJNSt0WnVGMXNVS0JK?=
 =?utf-8?B?UkpmZmlJcTB2TXhvNVMwdXNsems1NTBzZ2tRR3UyY3hLaC9YZ0lMOHAwUmhw?=
 =?utf-8?B?aXZXaEltQWhjZkpIZThvZ3JLaWo2U3pyU1FUa1dtcnNseWtpZW1qYWZwWHly?=
 =?utf-8?B?OGtzWG03cEhpMnFJWkpzbjgrNHhjRTMweVRoSm44aTZhM2lZclhsWlJKeWps?=
 =?utf-8?B?bXIxdVlVU3g4ajlvVGhXYVdYZkMyWDU2ZmpWR2J0S25iTmNJTGlxZUsyUU9t?=
 =?utf-8?B?ZUlzSjBLVTlMSWNBbzc5azVScC8rMDg1YjhmbjJhbmY0M0x4MGIzQUs5WUIr?=
 =?utf-8?B?dkZDRVBhdERicTlLQy9uQTNTOUwweUtldHJHS0R5YlJ6ZjgwZFo0bmRDanhD?=
 =?utf-8?B?b0FYU0tncEJCMlFMQXFQY2Z4R004ajl1eWJQRk93L1pvazgrRXBhNUJtSmpN?=
 =?utf-8?B?NzQ4d0dvTE1rSlRiQjcxOHB0SCsxb3NTd2xqUENlZ0w0WWVMUWR6OFJtWkVW?=
 =?utf-8?B?V3pyM2ZVVkFmNGtyb3lPK2JobW1QMDVuRFYzNHFKZmlkZDdxUVdtYVQ1d08v?=
 =?utf-8?B?K0Q1WXVqM2VyZUg4SHRrYmRWaG01TWFxOHdjeEJwYUI2bFZlaUlYalF3eFNC?=
 =?utf-8?B?SHUrNTZLSzZlVVdXdDdidlo5czg1c2NjVXh1NjRDNnNHYjdlbzdZNmVhelI0?=
 =?utf-8?B?R25YTmlGS2dKL3dQZHZ5b1Q2UFBtdGwzZ0oyOEs5SWl1K1hXaHd6V1FJbDRx?=
 =?utf-8?B?eEhuK3Z4WVJheXVpN3Zrc0cwN3R6VUowdXMxUm1zUjJnMU5RSGV2MHRET2NU?=
 =?utf-8?B?Z3RINjMvWjNaRTk3aVJIc2x3ejVHQmNrZGJlSUcwOUdvSDlxdXNZYUs4WHhQ?=
 =?utf-8?B?ck5SZU9TMUJoTVRNTUJPRjM5aktEWmpCOUxHK2pLOTNsbXBLOWROTURZYVVC?=
 =?utf-8?B?T2NNTENxMEwrVzlDMkJXNVJaSXZUaGVyM3pxQ1hOWkJ2Qy9obmdUQjYzUUds?=
 =?utf-8?B?YUcrbWxEUURIMWNNRXdieS93aENvNkdIemllTjhFSjFZZXFQc1hpMXhOWW5R?=
 =?utf-8?B?WjRCbkRDYnNCaTJKL2VpQ2FuSmVSQnFob3BVOXdmRlBEcTBRNFJ4WlJmVEF4?=
 =?utf-8?B?eWM3NGwvU2YwS1d4SFdmdE1qeWd2U0Q3M3VpMnN1ekJFb09ZOGg3SldFaHpz?=
 =?utf-8?B?d09vSExJNFBBSXN4R2FwaHE2ckhpNURoSml1VnIvVTY3ZXpRQ3BxOU5yVkJk?=
 =?utf-8?B?UXllNU9FNHJQeDA1VElqYjFCQTJRUkRJampHNE05VzlRcitCUkVkSFV6Qitk?=
 =?utf-8?B?a0QwUHZpS0o2b1NGVzFyZGNRQmFwTTI0MzVGaU9IU3hyaE5PZmJVOHhOSjQ1?=
 =?utf-8?B?WUJWWC9vaURNdnJYemdRaE9TWjlFU2hUODJyaTlTMjEvZGpqSytNcmdtRnlP?=
 =?utf-8?B?Y3RRVFg3Ylh6OWZ6NEpMdXNaZ01ybVo1aEREQktnNE5IMG1lODk1NnoydDNB?=
 =?utf-8?B?emNCVnpkQ0Y3THBQVGhBejhUeVNYMXRzcThRZjFIemxTWjFIMmlnWHl3RWJm?=
 =?utf-8?B?S3ZTcCtvY0wrMTFZa3RVRFM5U3BEdDZvb3R4ald6RnhKZ05mTUlkVnVvYUk4?=
 =?utf-8?B?MFlUa1Y5UWRTV2h3SjliMkFSMXN0WlVkU0tPcXlPMmdFMGdBTXFadz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac52ad9-380a-47cb-a683-08df2b88df04
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 13:24:56.9087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZyi/8AL3rWj4oFYIXxohW7IRyIBZSPWSO717IPawuAOtAgXBHNIZifDfdbw8O6AQRKCfg6EO8TjHZ4TZ08qDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF8E7AFCFC5


On 10/9/2026 5:00 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On ven. 09 oct. 2026 at 14:35, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> Hi Jerome,
>>
>>
>> Thanks for your review.
>>
>>
>> On 9/24/2026 5:35 PM, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On mer. 23 sept. 2026 at 19:14, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>>>
>>>> This series refactors the Meson PLL framework to remove the dedicated
>>>> PLL pre-divider (N) parameter from the PLL implementation and model it
>>>> as a separate divider clock.
>>>>
>>>> Currently, the Meson PLL framework models the PLL pre-divider using a
>>>> dedicated n field in struct meson_clk_pll_data. This makes the
>>>> pre-divider part of the PLL-specific implementation, although the
>>>> Common Clock Framework already provides a generic divider clock.
>>>>
>>>> This series separates the pre-divider from the PLL and makes the PLL
>>>> DCO take the pre-divider clock as its parent. This allows the
>>>> pre-divider to be modeled using the standard CCF divider implementation
>>>> and simplifies the PLL framework.
>>>>
>>>> The series currently covers T7 as an RFC to get feedback on the
>>>> framework design before applying the same approach to other SoCs.
>>>>
>>>> Series:
>>>> clk: meson: pll: Remove the dedicated n parameter
>>>> dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
>>>> clk: meson: t7: Model PLL pre-divider as a divider clock
>>>>
>>>> The other Meson SoCs will be converted separately after the T7 PLL
>>>> framework refactoring has been reviewed and the overall approach is
>>>> agreed upon.
>>>>
>>>> Any feedback on the proposed clock hierarchy and the separation of the
>>>> PLL pre-divider from the PLL itself would be appreciated.
>>> So if I summarize this RFC, you have simply taken the divider out of the
>>> PLL, no futher addaptation. right ?
>>>
>>> I'm happy with it on the general principle and fine with the change as
>>> long as you test it on as much platform as you can, clearly flagging
>>> those you have just compiled tested.
>>>
>>> A change like this would likely need to land early in the cycle give as
>>> much time as possible for testing.
>>>
>>> However there a couple of thing I'm concerned about:
>>>
>>> * You've drop the table support: are you sure this is not needed anymore
>>>     ? don't you want to be able to restrict mutlipliers to specific values
>>>     sometimes ? If not, then OK.
>>>
>>> * the determine_rate() make no call to round the parent rate: Since the
>>>     parent will be the divier, how do you progate the rate change so N
>>>     moves and the best parent rate is found ? For sure this fractional
>>>     multiplier clock will need CLK_SET_RATE_PARENT to adjust the
>>>     pre-divider.
>>>
>>> * Goes with the point above, but I'm not seeing anything that favors
>>>     lower N for lower jitter, Or mention of a minimum input rate (which
>>>     could be a property) ?
>>>     Those are constraints I think I have understood from your explanation
>>>     here [1] but maybe you've got new information to share ?
>>>
>>> This is overall going in the right direction but determine_rate() and
>>> constraints need work.
>>>
>>> Note: you are more likely to get test feedback if you add g12 (sm1) as an
>>> example. Those are still the most widely used amlogic platforms with
>>> mainline.
>>>
>>> [1]: https://lore.kernel.org/linux-clk/c9c4945f-cdfc-4382-b8ca-71b69d91deb4@amlogic.com/
>>
>> Yes, your summary is correct: the RFC simply takes the pre-divider out
>> of the PLL.
>>
>>
>> 1) Keeping the table support
>>
>> Agreed, removing it was premature. Some tables cannot be expressed as
>> a multiplier range:
>>
>> - pinned (m, n) pairs, e.g. axg PCIe GP0 (m=200, n=3) and meson8m2
>>     GP0 (m=182, n=3)
>> - a pinned m, e.g. g12a PCIe PLL (m=150)
>> - sparse tables, e.g. meson8b HDMI PLL
>>
>> The per-platform conversions will turn the tables with contiguous m
>> and n = 1 into range, and keep the tables for the rest, so
>> the framework will support both.
>>
>>
>> 2) N is fixed per PLL
>>
>> The main new information: the pre-divider is not meant to be selected
>> dynamically. Per the hardware design, each PLL has a single fixed N
>> value, defined together with the rest of the PLL: N = 1 for most PLLs,
>> and N = 3 for a few special cases on older SoCs (the axg PCIe PLL and
>> the meson8m2 GP0 PLL). The PLL input frequency constraints are
>> respected by this fixed value.
> Ok, but this is not we have done so far. I don't think fixing the
> predivier would break any use case, but if it does we may have to
> re-visit this.


I agree, fixing the predivider would not break any use case now.

>> Keeping N at 1 minimizes PLL jitter and yields the best performance.
>>
>> So this is less about dropping the constraints than about the fact
>> that there is nothing to choose at runtime: no N search in
>> determine_rate(), and no PFD input frequency constraint to enforce,
>> since the PLL input frequency is a constant for each PLL.
>>
>> 3) No CLK_SET_RATE_PARENT on the DCO
>>
>> With N fixed, the pre-divider rate never changes, so the DCO does not
>> set CLK_SET_RATE_PARENT on purpose: the flag would claim that the
>> parent rate may change to satisfy the child, which is not the case
>> here. determine_rate() never touches best_parent_rate so the flag
>> would be a no operation today.
>>
>>
>> 4) Implementation methods for pre-divider clock
>>
>> While testing the RFC I found that with the single-entry pre-divider
>> table ({val = 1, div = 1}), the pre-divider register can never actually
>> be programmed.
>>
>> The pre-divider field resets to 0, which is not a valid setting.
>>
>> During registration, recalc_rate() reports the parent rate for the
>> zero register value. With N = 1 the reported rate is the parent rate,
>> and the single-entry table also rounds every rate request back to the
>> parent rate, so clk_set_rate() always bails out early (rounded rate ==
>> current rate) and clk_regmap_div_set_rate() is never called. The
>> register keeps its invalid reset value.
> I see, you should have had a warning like that then ?
>
> ''' Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set  '''


Yes, there was a warning you have mentioned. After adding the flags 
CLK_DIVIDER_ALLOW_ZERO,

the warning is gone.


> But from what I understand, your divider may have zero written in its
> register but it will not output the parent rate unmodified, correct ?
> In such case CLK_DIVIDER_ALLOW_ZERO is not correct.

Correct. With the reset value 0 the CCF reports the parent rate, but
the hardware does not pass the parent through: the PLL does not lock
with a zero pre-divider value. CLK_DIVIDER_ALLOW_ZERO is indeed not
correct here and I will drop it.

> Can you clarify the meaning of invalid ? If the just no oscillation I


I have a definitive answer from the hardware team on what "invalid"
means. Writing 0 to the pre-divider of a PLL that is running and
locked makes it lose lock.


"Invalid" really
means the PLL does not work in that state, which is also why the
output never matched the parent rate.


The pre-divider is also not a general purpose divider. The 5-bit field

can hold 0-31, but the hardware specification defines only a subset of

these as valid division values ​​(e.g. 1, 2, 3, 4, 5... up to 31).

Each PLL is designed to run with exactly one of them, fixed by that PLL 
design (usually 1).


> guess we could add a 'CLK_DIVIDER_INVALID_ZERO' that returns 0 from
> recalc_rate().
>
> If your multiplier you'll probably have to handle this is
> determine_rate() with something like
>
> if (req->best_parend_rate == 0 ||
>      (req->rate / req->best_parent_rate) > YOUR_MAX_MULT) {
>      clk_hw_round_rate(parent, req->rate / YOUR_MAX_MULT)
> }
>
> Then you update req->best_parent_rate with the value you get and CCF
> will update the divider when the rate is applied.
>
> If you then add your single entry table and CLK_SET_RATE_PARENT, it
> should work as you expect AFAIU.


1) add CLK_DIVIDER_INVALID_ZERO and return 0 in divider_recalc_rate

2) update best_parent_rate in pll determine_rate()

3) add CLK_SET_RATE_PARENT in dco clock


After applying the three changes above, the pll works well.

Thank you for your suggestion.

>> v2 programs the fixed N at registration time, with a new
>> init_val field in clk_regmap_div_data, applied from .init() once the
>> regmap is available.
> I don't like driver setting regs without a clear instruction from the
> consumer or the framework, it is a splipery slope where people just tend
> shove their use cases..


OK, I will remove it.

>> Or do you have any other good ideas?
>>
>> The patch is available[1], Please help to review it.
>>
>>
>> 5) Testing and rollout
>>
>> So far this has been boot tested on T7. For v2 I will
>> convert the SoCs one by one, starting with g12a and sm1 which
>> have the most mainline users, then the remaining platforms.
>>
> Please add the RFT tag. Please test GXL as well, you should have no
> problem getting your hands on one, those are still easily available.
>
> For Meson8, maybe Martin will be able to help us out ?


Ok, I will add RFT tag in the next verion and ask Martin for help.

>> [1]
>>
>> --- a/drivers/clk/meson/clk-regmap.c
>> +++ b/drivers/clk/meson/clk-regmap.c
>> @@ -163,10 +163,28 @@ static int clk_regmap_div_set_rate(struct clk_hw
>> *hw, unsigned long rate,
>>                                     clk_div_mask(div->width) <<
>> div->shift, val);
>>    };
>>
>> +static int clk_regmap_div_init(struct clk_hw *hw)
>> +{
>> +       int ret;
>> +       struct clk_regmap *clk = to_clk_regmap(hw);
>> +       struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
>> +
>> +       ret = clk_regmap_init(hw);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (div->init_val)
>> +               regmap_update_bits(clk->map, div->offset,
>> +                                  clk_div_mask(div->width) << div->shift,
>> +                                  div->init_val << div->shift);
>> +
>> +       return 0;
>> +}
>> +
>>    /* Would prefer clk_regmap_div_ro_ops but clashes with qcom */
>>
>>    const struct clk_ops clk_regmap_divider_ops = {
>> -       .init = clk_regmap_init,
>> +       .init = clk_regmap_div_init,
>>
>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>> ---
>>>> Jian Hu (3):
>>>>         clk: meson: pll: Remove the dedicated n parameter
>>>>         dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
>>>>         clk: meson: t7: Model PLL pre-divider as a divider clock
>>>>
>>>>    drivers/clk/meson/clk-pll.c                     | 178 +++++------------------
>>>>    drivers/clk/meson/clk-pll.h                     |  13 --
>>>>    drivers/clk/meson/t7-pll.c                      | 183 ++++++++++++++++++------
>>>>    include/dt-bindings/clock/amlogic,t7-pll-clkc.h |   6 +
>>>>    4 files changed, 181 insertions(+), 199 deletions(-)
>>>> ---
>>>> base-commit: 43e1705ecab981c66baee89041e6f728c0436f19
>>>> change-id: 20260923-meson_refactor_n-e7f25904e536
>>>>
>>>> Best regards,
>>>> --
>>>> Jian Hu <jian.hu@amlogic.com>
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-amlogic mailing list
>>>> linux-amlogic@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>> --
>>> Jerome
>> --
>>
>> Jian
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

