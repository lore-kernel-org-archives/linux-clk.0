Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163048;
	b=W7+wy6jaFnUF9J3nZijCJvnnoRsS9g0zYoxZFpy9Lej7kUFKw19TOtyIfHf0v37xyiOc
	 dNRWMDdvetrsFxdQ1Mjsm4NUVa/4iIrWLH/qTR8Bmltgn9vt0XaAq6JX8mzfeNyMT1PY8
	 W/2VMGFL9+qtahWdZfydXZik34gdecVk1VxNZcOCKN2bMbN27WqZkpWRZAeHNxnVCS2yJ
	 dkxg311CWTdKMeHvP3FBXg+tbAHXjY7RHYCWXRoa8kZUUxI9NanAqXL/365acBXZpIDDJ
	 gUhEHeUGEiXpaa1yshdChlmj68vdE7n18J39zFzgskM6J1aKKx0GR0VumSnKZTR66Gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163048;
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
	bh=vZtc0wjdiqQxlJGkIiZFhr+/5iPZbOkIXndqBMxjsLM=;
	b=Ln9rLOLzbqduCI74UOt3tmUbLMsntnZUlnsHeD5djvN45Yv5Z4GHVteg1CYtJdKlCBMq
	 e3GEIXoV61uLgHhdovGgSem/hXa7lm3yCB6dSuI1Z4ugem5b177e9gJdBf3fsWqJ2ZWhy
	 AIfJGQ98W2lId4x0EmLwXYCU8t3VrPGiLCQ5HOPuIOoLvct54FjqzTfEEkBm3dw6+NPwy
	 UH1EhsXvvFUHGYxXSsqnv9h+b5O5aSOlh2tK+4luY7Z/tWiRIJOkgzxbDR0AaRejMdJ/a
	 oyGKpWZ0U2tNUYsMNpiOWdckzFIto/4QDkPDcKvYHFVa19RmfUIyFmj14zqQvaQPymA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=H+KipDz4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.74
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023074.outbound.protection.outlook.com [52.101.127.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3507A606A320;
	Fri, 20 Nov 2026 08:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3507A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=H+KipDz4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=woMJM0s5Y9zMGW5LAghiXZI5n4Ou0GqTnBVhByrVls0jAr8+5k/FTefz/pOjw0wM+I0iX9paTGUr/9KeI8OJYgWPmMmlnFK876dmncLaZp0H9b9N3kh8qwIVpJg/snnGWn6QQWj+ROMaS/Kap9l4fy4DRRcWkQatYjAM0waivUh5P7bDOT8XUsGTA1qOzsw4Fcx/395SHSRmj4mbYt1ugQDTDA6hdqHEUsJBr0oJZE6n+e20yrkm+Qn98EmmCdTsJuCeqfN5a/9ZF2sNYKP4kR93wW8SK/XSPRbpUrq9alqc3OGRbqb13TzeSXCUYHZ0ztL/xfiQI7RSJim2mZerKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZtc0wjdiqQxlJGkIiZFhr+/5iPZbOkIXndqBMxjsLM=;
 b=XIc0oMVelTc3i/fbyXmg0z6Qn3uXfh2LTNrY9Fm+h7h+D5QVN9iksZUDEFO9sOmOIy3ttpRE7g8b26mKqCSERnA1sQofdlzH1HFwClUfGYBbyw9spYDAm/frCk7/l48gfOkRaEG0lDYg8BWUw7gUaMl7NO0SXPHbk7v4rI+SQ0k/WIBvYkWRiTUmCi3bnwEfCX2LTyloRAoI86BK1YMO39qpho5tbuNxZPHMOpcIARau8mBD0gyUWqVox6neFMrpPqPuQktb8AiCvr7yWTPhbU9FpRkrrA4j55Dgm+54utkeuHxhcjhbmrOZPyXJL1TmLHFmluV0jqRA59A2xd3EzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZtc0wjdiqQxlJGkIiZFhr+/5iPZbOkIXndqBMxjsLM=;
 b=H+KipDz41wqfW0diCBHT7bGtZC4EUDnY8vdcoPL8LZbc0+ErgMslt5U2r68z92SnCcAl8tLX39LsldkjPar8uBY2E544vL00UZ32xbaDEgoKPVsYahfgaAaQfrOKYL4Ek3SZQtPHpROWVZB+F1WjLg1TelYRBxVZOkrRdfuL6IzGE9Oh0RAbr1m72FcIcunESAvxDia31UD3f6jLw0CZ/bog7cM+QoCkKNEx2Fe1Jg/WkAzgt5hIAlykecqzUsZa0G8/DXmaFN50OiENsMo73vbGQhcbReCCRbGXv2y6IPNs3QAMywTZHkTzX11yiv8j8BaNQ5xpCEID/4FaNAMGaQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KL1PR03MB7489.apcprd03.prod.outlook.com (2603:1096:820:e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 08:24:03 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 08:24:02 +0000
Message-ID: <f70ae730-57d8-4b94-b1c1-d1e247f0c192@amlogic.com>
Date: Fri, 20 Nov 2026 16:24:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT v2 2/3] clk: divider: add CLK_DIVIDER_INVALID_ZERO
 flag
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
 <179390104085.2573818.16461908615505096359.b4-review@b4>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <179390104085.2573818.16461908615505096359.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JH0PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:990:76::17) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
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
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|KL1PR03MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 1993907a-1d17-4a2a-7d14-08df46dfa27d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|6133799003|18002099003|22082099003|3023799007|11063799006|56012099006|4143699003|261026121527099003|261022075727099003|261102123227099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	CQO7d4eGBtkfMCxFLibwDB1joXyJsOfEICJwyB0ibQw1R+QSN7E1VgiTxBxSRnfaDOJMQqU5jd5vetdtr8xcMddI8volghxwA3uUWDpZTgWSX5mNsbBE99daI39iVAsgLXBIzMSfVUmgdiSqEC6YhGzHh9SCUcVzv5486s/UkykOgsVYKioB/1rPvwoNNCCeZQbIq1dLUzmV7yI3efirGmw2DjrUMo2o3rcbnl/K6BGJLnVh9k3MSUTbPHgYWWLkYMzc2bcy8xT04yKxiPc7ORRrzfHIwGHd70tO8xSynZlIo03y7dt4BgIvNR+OwtVk9VkG5+gHBXAlCqIAE0nO/4lL+RvaFC1jj4Bh2Me0uYyZbZWlZkmgH8eh9rwH2ZunUCZf+9zSaWdrRqA0Fw4mb01uCmlUSZrHW7HOg0O1zDQBVoyJuQfvOl8+tSuEgyuGpX8V8rkOeLMh6yVEpnRI0VeNgvzrHCK6YCnqXYoD2PJyAbuTIyN/ctw6zWx63NGqnnMzIST3XwcybZSDNtUPLKD68hTtFr0hGUyZ254+28wo0S6rUfBrM+isT1sc7cg/+C1kBhw5tqteeJ0UNwsk4Fa8q7w4srL/A0GJTNDCa67dfkhgI4OcdB7+qyyN+NeSSMZgEPO+WS60qYWXHpN/kyNP0iqBy3dj2S9T7rXlgr0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(4143699003)(261026121527099003)(261022075727099003)(261102123227099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0dwakY2K21vMFFhQlV3dk1HRi9lNnVnTDJCRHp3SWROT0hKYys2ZzdBY2Yy?=
 =?utf-8?B?Wkd0WUFoSTlBZHY5b0ZROC9SNzdhWTl3M1dqNDVBc2Fvc010NStNWU0vSVUr?=
 =?utf-8?B?NStxQU42UFFtZWpadjFTeFJlVVNnSXFUME5MZTRxSS9qV2hWUmZQR1U4L3p1?=
 =?utf-8?B?aDd3WllpVnhhakc2VWt0R0FiUGdUS1lhS1MrUnJCVkpUaFhpTWdIcjUwVENv?=
 =?utf-8?B?MzhnaHFBazk4RUdrdjM0WjI4czc3TXprU3JxY2xwQ2FUaHFmWGpMQ2NSTUdL?=
 =?utf-8?B?NkNUL3BHUmE4KzBxYisyOWJiZzlIWG9GZWg5Y0lPZmpiOGJZR3dOOXhtazdT?=
 =?utf-8?B?QkNsZjQrN25VQmNMS2YyeWgxTUdVUkwzMS9ZQzRhSlZHbklxZzJQR09KWjhW?=
 =?utf-8?B?UmJNTzNpZC9yQ3l1MEN4RXJVVVVnZ2NSYnZWaitWeXBLRkNtTWh2NjNrUDY1?=
 =?utf-8?B?dlZnOFJ3MVpMK3dJN3lJMUQwcG9UekdodllPVUdpc1ErQWdweXJXWU96N0JQ?=
 =?utf-8?B?OVJSOWtqWjZicGMrMFJZc0xMb3VCbnlod2ZGK3RjSzV1Y2FpcVM5aHJMZ3hm?=
 =?utf-8?B?cDZRMWthTFZ1YTVic0VNNGNoRW1HbDFDY2NPcDh3YWl0S2J1UytlTjlIbUJT?=
 =?utf-8?B?UkgxbVN0R2lCcVFMaXlpTDBlcEw4Tm43Q09kNnlyT2svL1g4V2lZNnNCYXhR?=
 =?utf-8?B?ME9jWmFLMkVtNTNOWStnV3NGdUF5ZzZRRS9XVUFDeUMyUEU2Rk1iYVFUQ0dw?=
 =?utf-8?B?YVdBZ3RQdXFIb0dEdWtpWU1jKzdtd1JKRU5LWktvRDZJVEcwMlRvS1o4T2lF?=
 =?utf-8?B?Zm8zOWtqZEZacklFUlYwREhKVHozNkVoTUhDYXlJcHdNdzZTVDZvc3M0blRO?=
 =?utf-8?B?eFNQVEY0eDkxMUI4cXlzZGVqL0dLd3B4bU1EM3VEQmx2R0xRTWFmOGYwaGhy?=
 =?utf-8?B?a1NKaW5zcjNMeUh0a2ZmcVFUL1RqcVZneSszV1hFSjlzaG1QWldzZlFESnox?=
 =?utf-8?B?WGFCQkh6WUM5RUZvUzY0WkRIMDhjOEJFUjB2UENjOEUrQlRNVU8xaS9tK3RQ?=
 =?utf-8?B?OXJ0aDJEUzEvQnJ3MzV6aHF1OGw5S3Y2Q0FLQndoT3VUWkJqeWFGZVhKL2xn?=
 =?utf-8?B?c2xJYVJhNzJsN21tcGh0ZUZDc2RqVjNWeUJQbjc4RW1Bbzl6V1ZhdUhvYU02?=
 =?utf-8?B?ZHpSTjd6L0VjL0luSW9WcUUxSzRXVWxaTnBxcHdHZnhZYjQvOFpjSXRSOTMz?=
 =?utf-8?B?TDI2MWdiWFJhREpSM0ZYc3pBVy82SDVINEpyM1NOY3V5OHpwL0g3RDg3Q3Uw?=
 =?utf-8?B?Smp0dHl4bEpTT0szdVRFSEFBNkpKb0RQREJNV20vUFFpemZsa0xEWVdmOVVD?=
 =?utf-8?B?WTUxN2ExczNuVTlYZmUrOTh5ZnJ4OHI3Z01rcHN2TnRLN0d6b1BiRWEvZ1Jz?=
 =?utf-8?B?Q0tXZDF0YWpaTWtVelhyYU5uYm82OEt4aTk3MU9JSGc3T0Y4WkJhY0IvM2xK?=
 =?utf-8?B?N2NYR2NuZksyM1hCWU5iNTJoREUrYXZFVkpkZkR1dEMyYjQyZmdBN2dKeGtl?=
 =?utf-8?B?UEY4K2ZxNkZWWFBINTVuK01BNHV0d1U4ajdUYUJ1cHFPL0oxMTJTU0k0M2JU?=
 =?utf-8?B?V1JyYnVMVUFEME1IQnY3WXBMUURBZ29kK2c4L1M4MmpPckJiV3N1ZWVVSllJ?=
 =?utf-8?B?ZjJuaWlJNjVaRmFoZjg4cGtlc01saDNrYkNzeWxCVGY4ZjVXc2J6UGQ1ZTJ4?=
 =?utf-8?B?RHNnMDhYb2kzY0VKN3g4VC81SnpQOFRpRXVMNDZ0ZktVSEZqWkwzQm96YjBy?=
 =?utf-8?B?dlhNckROTFBQRnQxUCt6alVxL291WjVJU3lMVVFpa0x1bjhVWXlRY3Bmblpz?=
 =?utf-8?B?NE45K0pMQ3p0UG9MZkFZS1Axd1pZNlR3MDBnOUFBUFR3Ukw3U1YrRzZ4Qzhr?=
 =?utf-8?B?UHJNT2JLbjdCVWdCTWhiMzJlRDBVZldSd2lKZ2FCNHVXaFczcnNMZk8vc3c3?=
 =?utf-8?B?UDRpMWo2aFVya2lkMkZGQ3Fnajh5cGxMc1gzSjZJZ203dEkvalNuOXlwWmJC?=
 =?utf-8?B?MXgrNUN4TkhoSVJuZ01CUS96SW1rZjlQcDB3ZVhaODVaeDJReHNyOURjRFk3?=
 =?utf-8?B?RUFyL3VydmRyTzJ2Z0Nkd0FDZjdDamlYTE10WnhQc0kzOXoyWmpZZ2FJd1c3?=
 =?utf-8?B?M2RmRUsvcElOL2pHL2tJY1JqUjZxZnUvMU83ZVhlYWg2eTcxK0lwU0Yzazl2?=
 =?utf-8?B?dkxOYS9OVEpPczVkejZoY0hrWCs5cEgybUxSbThpbGdtaWhnK3BJc2FyWXhx?=
 =?utf-8?B?eEd3aGJYVldPSjhEVHpWeUNEQUpnVjFkL21hVTM4QmMyejdIbHBzdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1993907a-1d17-4a2a-7d14-08df46dfa27d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 08:24:02.8829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ij2ao4P89qW5hQaBKuAdNM/O4uhQGVN+Xl1Seka3ej0ICfc1xpn7e5iUUmGJee8toJwwGB8xuYpHxyLWsPuYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7489


On 11/6/2026 1:50 AM, Jerome Brunet wrote:
>> When a divider register reads zero, divider_recalc_rate() currently
>> emits a warning (unless CLK_DIVIDER_ALLOW_ZERO is set) and returns
>> the parent rate.
>>
>> This behaviour assumes a zero divisor acts as a pass-through, which
>> does not apply to all hardware. Some dividers, for example PLL
>> pre-dividers on Amlogic SoCs, come out of reset with a zero value
>> that does not produce a usable clock. Returning the parent rate
>> hides this fault behind an incorrect, plausible value.
>>
>> CLK_DIVIDER_ALLOW_ZERO only suppresses the warning while still
>> reporting the parent rate, so it cannot represent this hardware
>> behaviour.
>>
>> Add CLK_DIVIDER_INVALID_ZERO for dividers where a zero divisor value
>> is invalid. When this flag is set, recalc_rate() returns 0, making
>> the faulty state visible to the clock framework rather than hiding it
>> as a pass-through.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/clk-divider.c    | 3 +++
>>   include/linux/clk-provider.h | 6 ++++++
>>   2 files changed, 9 insertions(+)
>>
>> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
>> index f68216c65d3d..6c1523d22477 100644
>> --- a/drivers/clk/clk-divider.c
>> +++ b/drivers/clk/clk-divider.c
>> @@ -143,6 +143,9 @@ unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
>>
>>        div = _get_div(table, val, flags, width);
>>        if (!div) {
>> +             if (flags & CLK_DIVIDER_INVALID_ZERO)
>> +                     return 0;
> While I think CLK_DIVIDER_INVALID_ZERO really makes sense for a writeable divider
> only, to gracefully handle a reset value at zero that we would later correct,
> we should still handle all paths correctly. This include a RO divider and its
> determine rate path. I'll try to send something for this soon.


You are right, and I agree: a change in the core divider code has to be
correct for every user, not only for the cases this series happens to use it
for. I understand the RO divider / determine_rate path is the part that 
still
needs handling.

I will drop the 2/3 patch in v3 since you will submit it separately.

>> +
>>                WARN(!(flags & CLK_DIVIDER_ALLOW_ZERO),
>>                        "%s: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set\n",
>>                        clk_hw_get_name(hw));
>> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
>> index dc8e161f9c2c..fe2dbbba49e3 100644
>> --- a/include/linux/clk-provider.h
>> +++ b/include/linux/clk-provider.h
>> @@ -744,6 +744,11 @@ struct clk_div_table {
>>    *   big endian.
>>    * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
>>    *   Formula is 2 * (value read from hardware + 1).
>> + * CLK_DIVIDER_INVALID_ZERO - a zero value read from the register is not a
>> + *   divide by one / bypass but an invalid setting which does not produce
>> + *   a usable clock.  recalc_rate() returns 0 so that the broken state is
>> + *   reported to the framework instead of the parent rate, without
>> + *   triggering the CLK_DIVIDER_ALLOW_ZERO warning.
>
>   CLK_DIVIDER_INVALID_ZERO - a zero divisor is an invalid setting with no
>          usable output. recalc_rate() returns 0 instead of the parent rate.
>          Takes precedence over CLK_DIVIDER_ALLOW_ZERO.


Ok, it is short and clear.

> --
> Jerome

--

Jian

