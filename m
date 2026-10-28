Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793190061;
	b=TBavRp/0gBXeR1fYg055s4+Y88rdDByAfh2n741TD7BBhjGznnaH3HL84o+dttfv56Td
	 Ys6J6VV7I43fANJGcMA1sdbAhdarQLDPZkM2Gx9I+P2DanMQph5/fCum7AnQO0e7qjeBN
	 iM/QiLLcga1DLuICfZTsJgpuZH7YXZWSc62+GVXVOSRrEb2Eg3SZzcDmLtzgFi/vs3jwe
	 lliKiAVfkzImh3cA/xoJZ3M/YIsbamMiE7zIEzNr4XA1K7s+GEI+O8Q29/THNKMUFQmJm
	 +IGu7LOPAKPUjFLDP3csI0i91SflR7oq+3EB1NFgSW4dx+aURmAtwp03snn/NcTKAkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190061;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=HNfJLTfEegqv+3oFxcJm59fWMWPhakplaKdKJT5G1eQ=;
	b=RPwkoEMUfx/72DZzv/CLFZ26YtzO8vsFnZNMs8Zkeyk7ZN3z4gX1opkzR54FrtU4dQIX
	 UQHfXyqjxACA/4zNSYC23yeuW0zNpGTcpHU1elP4MSLOzLS8kQq4L2StXRm3O4/9QnqDP
	 HlDP9K353XrlST1VAegRYzaFtH3F5x8t7h846BYrAOS2k1HqFm6Y6VUJ2T8ZxfcrLRs8Q
	 B9h0E8Z3t0GNEm+KNQu5tjJJhmes107v3n0risBwesaT3t+qbGj4uD95owFmKNmj0SguV
	 6nwkPpl6G/baoff2EQHz8iTJh3kThZfbF21Sz8TI/YOAlx+umJnXO7FlQIp8WW0QyiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=yJNugPLC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.114
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023114.outbound.protection.outlook.com [52.101.127.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72A4606A31A;
	Wed, 28 Oct 2026 12:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D72A4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=yJNugPLC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfnVPchdC2VuBBMfXLE7uCCEZ9T3R3o5vizeKHNFTU7vWF7w2HK+tTeJwJW7GDySv/1xWpLuJuONvryDX+6bwvF1bZhJZJQBAcKSuX9Uzx3AVYU/mTxz/N5gPGhTsGhJQQODQ6G/ZuwaFyp3HokMwLi++a5XzJ+i4gODAc0jFlSxA15S6+v+IItwPRvlViIX1uxwb6gZVDZ+h5esVZu/fSdU6UTZQkqOhN5JxHTtv+kuBj9VNGq7XosjQZvhqx5urn3YDoeZHGmTEJN/FQFQYJCg9OKlPlRaB/yUwl/o7XlfH0XNqjsikn5ywFnmj/eewdIg8+xjpH1551LhDNKFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNfJLTfEegqv+3oFxcJm59fWMWPhakplaKdKJT5G1eQ=;
 b=O+nI3RPtOxmjEomk6NIk1bSQsowW/oMxyhQSh2z6bFhS0D1t1DmGSKLSQdbbMEfv6w3EHolkyoxHFuM0gh/BvOju4n8O9wjoMXP5IzPJ1Nc1gKmXnllNuEbzQUsH7E+dJgxqcdpfDE/l2QsxkiK0VZvMaNrfTxY4TTF/qjZH5VwjHP8UYuUCAgp5hq3oLU1UafiXjRRAhQIT1MIIV7qYKuRt/wFnctzGz+z5i2OA2R+Ja22EuZtcAp8518uno/briVgWvih7Kk8B/KJNSmZT7srX3vPZBHhok3VPXjywF+gq6PNmJJg5WHGX2vyHfvU33eZlrF5mISvxiqwKZmi0gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNfJLTfEegqv+3oFxcJm59fWMWPhakplaKdKJT5G1eQ=;
 b=yJNugPLCWN7SNNDBOioaexAbHV1CKaoz1E0RC2LUxFOyc9ktHEndckbTzHLNnHriClZwfI/KGwSA02FhvJtNxOWY/Ie7uvmHFBri8elLRULpNrNVHic1aJqUeR8YL0o87rw/haXKrM6OVQAr/tX2Y6X+JqMZCaRUMl8zh1qRvp+XtHCg8HOWRqXmhXIjMz8teGi3lbPKXKHQylvUlkki5xTED3kaioTsaYZggK2q07l2TKYvi3GMMNdAeJByHaze37lBm+ntiPDjnFD8vRD8K7vGNpv5EaBqhe6xdkN58ODYXlQjCb2Ojct52ZsbLSL2yZ2+mpxXcV1LhhGvedS2Hg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 (2603:1096:405:3c1::21) by TYZPR03MB8295.apcprd03.prod.outlook.com
 (2603:1096:405:1c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 12:20:58 +0000
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7]) by TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 12:20:58 +0000
Message-ID: <2f33d959-32cf-4b3d-a3eb-a12a032298a8@amlogic.com>
Date: Wed, 28 Oct 2026 20:20:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec driver
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
 <179304854619.199157.2693374514232344592.b4-review@b4>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <179304854619.199157.2693374514232344592.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P301CA0049.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::7) To TYNPR03MB10226.apcprd03.prod.outlook.com
 (2603:1096:405:3c1::21)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYNPR03MB10226:EE_|TYZPR03MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: b681c25f-4050-4b5d-59c9-08df34edec0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|261026140227099003|4143699003|56012099006|261022105027099003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3MkqxVVGbzlDlVTqOmJW3iGkaFkH00KRG8uyozR1PyZLZA87CXFDKvpcKysTGPa+i9ulBOQdxCM6vLnckxHr+SI5MUOfcuvYaPzi+XgRp8/ki/2tJ+cBF1dtS0wolfDVn7ibyjOhmtzMVGebcZe4zrLHBM+7HtGrPwXMi3wbp7baVHrkHeHetiqnZgWplgnkZQApR8gzQrxNtoahAvNAncTwGN5Z5C5W9qIJ/55Srv8keA2rsl80HLuLWucBF4lccu4pqfNuBsyN4mxdYDbzrIyWNwxY1uv4kL6frQhtsjs3fZuD7rFynVd1BfzGB9LfWGPT4egioqYXH7m4PTB+YXdXZz9hVT6mxq6Wgk8HZlbX0e+n3Kt/14dzTIk6Lvu8U/+put/TAcMxQbs314iYsFFPjfV4rcptEbXurLse0htODbSGiT8zWxd62pQvw0IWIb+i8oASJRTWpa2nUdcl/pa+vqaKnGULZmRreXrRuxgcqrxQkgkz4v4oO7MxcEW4jheYfwSu9hOAYRifauJtPM63lqesqw2sqzxuXxFCnPh2GlgGVTLP8xlN6jU9m2n+YE61Cvb4g+DXQAtMYjeDeqh6Q33FWs1z/J6s0Tdci71301beXk57fpVgXF02fuD4lSLwTcVDFAtAt+daIvHDbLpbH2CwUdmpw7igcmWxnj8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYNPR03MB10226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(261026140227099003)(4143699003)(56012099006)(261022105027099003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFczbmVYOXh3b2Q0VkxVVXJibUJkVkRmMFcrWjFwLzBEbmdBNldoRmpvMFR0?=
 =?utf-8?B?dFNSOHF4ckV1aVNhaG1iSWtSRkhEenM2SmJobDBqN0RGbkQySHhFeHI0VVlv?=
 =?utf-8?B?KzBrZ2NaZWMwbktyMnBXVWtWWXFpZm5RU1ZvV1NDdVVhK0VYV3lRc2ZMYk5w?=
 =?utf-8?B?RnFyVDM5U014SE5IUVJJNHcyVUptNkpDcEEzMDdaZU5ZMEwvWlRhaEd2bHp1?=
 =?utf-8?B?bG0rcWNxNEpwd2ZPSHp0SGwzYk5LZGtkb1ppdmpabTNGeEwvUzRGMkJNekM4?=
 =?utf-8?B?RTBlc1VxcUpIVkRWdE5LVDBaL3VRRmtTUTNPOU9DSUNzUUUzT1FuVGpJWTVS?=
 =?utf-8?B?bG9uSGFNbFc5ZnRNbEgwTmFoVTNBbWJFVVhmOHpUL1hKRnQzSHQrSU1hNUd3?=
 =?utf-8?B?dGszR3d4WDRsOWc4ODMyTlhFdHZTaWZ6MUkxeE04QXVBVFpCdkxqR3VrUXhy?=
 =?utf-8?B?ZnVFYlZ4M2FXN2N3OEdXYWFGdStONHhPYUV5Zm4zNDY0Si9wVmUreElSeC83?=
 =?utf-8?B?MWJZVTFsRDF4a2IwdVQ1R0pRd3hrQmtqeXZMaTJnV3kvdVJDWHBoajB3OU4w?=
 =?utf-8?B?N2JlYkVnNW1XTkROMkdhZmxTNXJIUWJtR1FaQ0c3d21oWWR5cEFWd05JUkVS?=
 =?utf-8?B?RW43RzZSYkp0aHpMVWNha0ViSHJqeXpuZUdYSm1ybldBaTZNdFZtbUZTeGcv?=
 =?utf-8?B?UDI3SEkwaG1HMnIyS3pabHVEOTF3aE9nM0Y0R3dsZ0VqTS81Y2pnVTlWaE9q?=
 =?utf-8?B?TVkvUWxIOUJ5QU80RWFCb1orN3J2QTZ4VGlMT2liOHZua092Q1hSemVpT0to?=
 =?utf-8?B?SThLTFhCQlRJV1NDbmIzWFBKM09Ga3F0bm1BUzZxK1pQWXZlL3V5UHJsMHN6?=
 =?utf-8?B?K25lZ2ZsVUJueWJ2bWpYSFVDcFkzbzlaaWNDTEVIQmV5SWpiL0wzU2hIbVVH?=
 =?utf-8?B?MzNLZ1ZDNkpWd200YWV4VlRPa2k2blBlenNBQ1dRNTZlOG1JWEdQaDUxalRY?=
 =?utf-8?B?UGtqYXJkUUN4ZFR1ZnZ0ejNTaXVFd1htbnNJNjVBa2hlRzVLWFRENkwvT3R4?=
 =?utf-8?B?VUpLeEpTbUpWVnRLTEp1SUZYWk53M1dFOWpFKy94cThFM3g2NXhWR253VTFD?=
 =?utf-8?B?amhKYm9adTBLSEVRU25TV0tFVTVNUVh3MmxRc0padVJ2Z1ppajVJWVFwRTBu?=
 =?utf-8?B?cWhQNE53VTFUTTJURGdRU01QL08zOFUydXlTVnY4V3M3bk95S1BSbUh3L2hN?=
 =?utf-8?B?MUNVNTlsTXAzemxWT0ZhNWU2eHA1bkZnR1ZSSkFidEFqOUZWQ2VNaUlIODda?=
 =?utf-8?B?bFIyZUk3YkxoLzNTRU5ndXVDUmQxV2Z0c2xpUlVjVUxVMEZGRWwxS3BwVC9V?=
 =?utf-8?B?ZDFHTy9TQ0tpQ1Q3N05UZER4NTJscDAxMGhWTlFaVnVwNElvK011SVRhV1Ba?=
 =?utf-8?B?alJxNUFscFpoeEhsU25HeUY2ZlpNNjBUWnUvTS92UmlVVGR3bk05akg1Z1Jr?=
 =?utf-8?B?ejRuekwxNDhXVHZ2NkNWRXl5WUh3Y21BQkhPaCtJazVrQ3EvcnNQQlV6Y3V5?=
 =?utf-8?B?Q1JYcUJiSVl1N09sTVAvYnpUVlZheWVUMk00L05EZmZsZ2hhWHJtcEpKTndI?=
 =?utf-8?B?cGFuMXBrNDFjdFZDbFQ4U0NrVVRMeWhEVmc2TkxxRU9aQzBFQkJQemE1TjFr?=
 =?utf-8?B?QVc2NUx6L0xGWnBOL3dXWExaK1BvMENGMFhaVnJTcGNNWU5DeHk2dFh6QVBK?=
 =?utf-8?B?SjBXcjQ1c2txdHFrbzc0MG1OaTE5RkZLbFRxd05kd2lsblV6dnQ2Q0NPditT?=
 =?utf-8?B?dHp0S0lzMzN1MW5FbHVXQjFLOHU0L0VWQUV4M0h4dXNjWmYvN0JBRlI5NVNE?=
 =?utf-8?B?NHpYN1BTdWZTTUFEajZ3OUU3K1pURzlCdTBTc055dXB0MnBkSDdnVmdBc0t4?=
 =?utf-8?B?SkZVNGlZdlRlV3lmM0FsUlZXaHlGbWNTckozQVcrQS9kUDVRWmtLSFJib3hT?=
 =?utf-8?B?cTh3M1g3ZGdBT2pFOXpuTHpQV3dFN3NidzNDYnphM3Blc1pIRGUxa0lrWFFI?=
 =?utf-8?B?cWl0TTk5dC9zNzg2MmM1N21QR1phdE0zTS93SndXeU4rU3gvUFRsY0VvSnVG?=
 =?utf-8?B?RDlNUzJFWk1SMzFrRGVNTndGL21DZTZFWGY0NjFvYmhSSmpIUGN3STRYVHd0?=
 =?utf-8?B?OE5qRldYRVNHZlBwSzJYeXA5NXdsT2pVWEFTV3h0NzlpOUEyTWpMZkg1NitR?=
 =?utf-8?B?OXBzNU1xcHMyVFVTNGdlejBvbXJIZ3hkbXFLOGc2N0lEaFJXUnJMKzdNWng1?=
 =?utf-8?B?TlNiYTg2Ukx0dklzVG9oV0IreU14NVc2QmRMb0YwQnBIZkU2d2I1QT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b681c25f-4050-4b5d-59c9-08df34edec0e
X-MS-Exchange-CrossTenant-AuthSource: TYNPR03MB10226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 12:20:58.3079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NisFzRB5lyu0IQ1Dq50yh/W0LlXN7waGUgrr4fzO3cRhVyyHpfXPM00DQi5En8oKYcdHSwwR+yVHvyWnKGYrRnOtPZvaD5HuYQ5A2yse4AI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8295


在 2026/10/27 5:02, Mark Brown 写道:
> [ EXTERNAL EMAIL ]
>
>> The S4 requires additional clock control bits to be turn on while enabled.
>> The S4 has 8 TDM lanes, instead of 4 on previous SoC.
>> Update the widget accordingly.
>> +#define CTRL0_BCLK_ENABLE_SHIFT              30
>> +#define CTRL0_MCLK_ENABLE_SHIFT              29
> Should these have a _S4 suffix?
Got it.
>
>> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
>> +     SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
>> +                      &sm1_toacodec_mux),
> Should this have a custom mux for S4, it looks like the register bits
> are different, a shift of 19 for S4.
Thanks. We'll add a dedicated S4 mux for this mapping.
