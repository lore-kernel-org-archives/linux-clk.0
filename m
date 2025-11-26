Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022128.outbound.protection.outlook.com [52.101.126.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FD330E0D3;
	Wed, 26 Nov 2025 03:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764128704; cv=fail; b=WbBiZGjtuZHvDwtuI3y4+g1ZVVT8udCYAMzhMcaUICTYTUD7+mYh6/yYnBwgGG1b3XD/vaUaZmk1QLcBDCmrYHmktU4s3icUqZwChhElznYq/f4QEGRlJ4DQOUciuSyoy0VJDRKHqn2P7ML0X9joCBR4Xv3EoEyW92TXcvdJRoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764128704; c=relaxed/simple;
	bh=tYYK58vytkYfqFMTkh2r5V90bSAd8YWey0gLX/eN47Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kzI2D/LqeQPfIeNykFAE0UDPi2aKgUYpvmOtNSpPcDJwXPE347c5cmqicf9b6mUhw2ZRA0jwVUH5/4iIZi8E3epJf0XAqU8I7VB97Ia/WXOha0xlNKWcV4qPe8TnFTmOPimpfsdbWuyITSR5wctxOo3eGfNE64P/UVQCHeg/iK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=xk2HPqR9; arc=fail smtp.client-ip=52.101.126.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="xk2HPqR9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibAhRPVM7hqgcVAX/Gi5HQrC5+emfpa6IvS5fUBZSeZhQ9DwvSjoTwJAHtdsT6K8ubLj97Dybu6nvysMoDy4lffPFBK74MGBWvGe9jzeXoDK8vBmlOQXxnKVA6dMT/cME9nsNioAhRIP1H1jwuKr+3PiXMdunuvKd/OF56AqDdbF49IjhytHLs+4rOIs9a4AFaDV0WyMgONCceX5y+ESGfIanqDbUeRl6PoWkKZwzaDKlMhxxhRz/foNkujINDPYC4wPjV8vMrlHAeZHkU3OiogawKWZ1cziQC51y24UKgoB2t84N3BAUxu4XZglhkobm8PNwzpv71uNeNLI3b2sKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3/+xX0oyOQgYwKd6Yj9RNWNzTKoBxH4o42QMyreRLY=;
 b=Vp16IcUaGOo9bPGWCGzWc3AWUPF4KJpqc11O1K96AKrAD6NWhVXwcWZKoOaQNqvWBlQzBPxsv6MxK7Wto7gctwJhfSQsfKyvkj0fET/KVhXpUICoorT4kNn+gXO1fGw/uVcq9Kdp0mdfCkGN2j/LWWS3IswVwIJ7gFIsVw5h4Oh2BPPAG5QebWahPmpTtIgm6oD7MbdTLpwjvguaIuzObJFUlWpMecHjQSbkaaiPGxAU8MMh3WDzQH7YWSpox5WR3k8HNbJUr6STjAM46mxo5gDApYnjdFxTcqCfYPPrln/9BQgcwoRoqF1lvnYbjqVf7aLre8Tayftqm/GmLNSA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3/+xX0oyOQgYwKd6Yj9RNWNzTKoBxH4o42QMyreRLY=;
 b=xk2HPqR9PGuX+CsfAn40oiqij1xq3yJhIYO+92yc6jWkDnEnYHda3VK17KsHvN/9CHaBky2CD0RPoWciCsS2X4Glsn3qXbvoa//mf1b/pMUfUA5jFgIrx/6tlzcWP8AWp+iFMYF+K1BgAT8TcC28l/GhisXfTIJqhPT19r4GwnrPz7VfJ8Y7ralLCoF6J0wTk5GEWEBmFgdKafX3e+phTIkRulWe81z5Z1SzPpnyOjR85aY6yyTmEcvflS1LfMXmTHYW9j4WNoNk8ymFeLQbdbGCa8AbkwMCE+AbI0PjNVrsGAadPsXTgUZ17ffjc6coxCNHC3bZhU6lfLkBPJYsaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KL1PR03MB7126.apcprd03.prod.outlook.com (2603:1096:820:de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 26 Nov
 2025 03:44:58 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%6]) with mapi id 15.20.9320.013; Wed, 26 Nov 2025
 03:44:58 +0000
Message-ID: <27588ccf-d6f6-42c2-86e2-92cb1addcd24@amlogic.com>
Date: Wed, 26 Nov 2025 11:44:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] clk: meson: t7: add support for the T7 SoC PLL
 clock
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20251121105934.1759745-1-jian.hu@amlogic.com>
 <20251121105934.1759745-5-jian.hu@amlogic.com>
 <1ja50bvl12.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1ja50bvl12.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|KL1PR03MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: 70961e3f-7e7f-48cd-cc1d-08de2c9e2b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkVkQ0N4anJsenE2cnlEblkrZm1mK1haaVZzc3JiU1BUTWFrYTIrTm5yYnlu?=
 =?utf-8?B?dDl5VVZxOTlVV3l5UC8yUElKQ1FmeWxObzgyYnludXFNRkF3aVZ2MGQ2ZFVM?=
 =?utf-8?B?MzhJUUtvZERwck9KNkF4dVZIeFVyYjJtUitab1JPU0JqWVRaQWNTMFNZcEFy?=
 =?utf-8?B?RnBjV1RLVDRoeU9jM0NmVGd2dHJveGw3NlpnK3N0bFhBWnYxL1NxWVRTZnFL?=
 =?utf-8?B?L0VHTUpaU3JqcDhydkliZXdVOWFHYmxCMDlDbEpMaFRWTDY0TVh6QXQ4NHQ5?=
 =?utf-8?B?QlcxV25nQ2NQWXhxa2tVVGpjTGFMSmJyenFwTHZHcVZ4cXcrVi9MVnhOM2xF?=
 =?utf-8?B?VS94eVBUNnltQVRITTd3eTRuZ3grLzdtQlJkWmdaRkhocmtIbS9OdVZXd1FT?=
 =?utf-8?B?MGRib0NnWG1CTk8wem14dUlUT2w2N1hONnAyNHI3K0lEeW1uYTdOSVdVUlZz?=
 =?utf-8?B?b25pTE03eFozRFhMQ2ZzZzZnanEwa2tmTUY3cGgrVnoxMjlvc2hURFdoR05K?=
 =?utf-8?B?REFyK0xGWkFYckRvTVZ3SEdOVjVDblR3eTNLcU1Jb0dwQjBYNUl4dE1mM3My?=
 =?utf-8?B?VGpObFYvUC9jc00wMXd2UkVPM0RTS2tJcE1xeGVCUktWQzdxMmJuNHZFRXlV?=
 =?utf-8?B?bzB3V1NVOW9nbEdnSlJzQ05BSDN5LzkrUEl1MUt1dWcxMExHSGJxcVdaeXVw?=
 =?utf-8?B?SE9aZncwSkpjVHpBV0ppUzdQTDVlWWV4azRxQVl4VjlTdVJwMGEyWWRVVndl?=
 =?utf-8?B?ZjVuZlNYeEE4bGtOaGFYcWdGMlYrTDFydno1cVgwc2ZONzZLcXoxQ2R6cFcr?=
 =?utf-8?B?NGtZelVRSXptWTZWck9CMEZWcEJLMzlPVWc3RXZoWlhWRnJCclZ5NFhFdDdU?=
 =?utf-8?B?anFPaU1PRG1MWlFTbk5xNHpwY3Z4THBlYXExaG1OQzM2dnFoUWxyUnA4ejQr?=
 =?utf-8?B?RmwwYjB1cjNJenJMNWcwTDh1b0ZtNk1oTkFxUnNCdzMyZ0xiK0ZEdFgrY0RZ?=
 =?utf-8?B?MUF4MDB1QjNzLzlkSTkzV0pFNzNHZG9STUF5UTlLWDFzS1U3cUozcmptcE5Z?=
 =?utf-8?B?Sm5WY3lWeEZtSjFnWW9IYy9BNitBd0VHSTVPV3hHcWhodWlWRy9ZQ3hTSFV3?=
 =?utf-8?B?aXM4U0RaWXVTZU5JS2xIUkpFRHNYc3loc3pkVmI3Qnc1c09lN3ZVa0RSZ21a?=
 =?utf-8?B?UU5rR1Z6ckMwQ0VtTE1EYW41SHVCdmJ6NGliSTU4bFRNVVdrM093dDZiQVZl?=
 =?utf-8?B?dHVWYWpIV1lkMEt5bWRZcEZNSnJSK2VsNjR0aWdtN3JzV056YWpGWmxDZVNO?=
 =?utf-8?B?S0JoWkhXZWdPZlNXM2VQNzd2MURGVFVoL05FSmlDd2s2M1FaMWtLNkpVem1S?=
 =?utf-8?B?VjZiY2xUS0UxTUt4NXNmTy9BWFRPNWtPcm03Z0g5SEdZSU56WHdNZE1Ick1i?=
 =?utf-8?B?eXNuNTc5NlZCb1cyOXFaVDN3b0RNUnhyWlh4eXBZc1VqWFcyZ01VeVV3WmZh?=
 =?utf-8?B?SWhHQjJOVXBqQkY5WXVLTkEvWDIydjdrMWczaEI2UmZEdHUyZTZ0YU5RL3Qx?=
 =?utf-8?B?MTIxM0hOcFdLVEJhNi93TXlraDhKY1R3MC9vaExhaStiaStlQzQyWVdFOXJT?=
 =?utf-8?B?ZU41UThVUVQ1a1RhV1p5YjM3MURZRzNYekUzbWd5aHFYYTN6ZUlhYmFqd0o3?=
 =?utf-8?B?dnYwTzc2RHB1ZTY1VlBJcXFHTXdyS3RXQmpTVlc1OFBNUVJkdXRVWGlXY2JW?=
 =?utf-8?B?RGdPZVFPd3pBM0xhMWlsVkpxKzBIdm1SYndDd0dTVHFQOHluVVphNURmckVK?=
 =?utf-8?B?VmFrZTlpSXRhRGNvWldJcGp0T0JTbURlaUhzVGhnQW5TSjlSM3l6ZnFkVFBH?=
 =?utf-8?B?cWhiRGU4cFA5UGRIVXROTUhML0ZYQnp6SzJSQ0dSeCtLREE1MFl6cWtxQVJE?=
 =?utf-8?Q?xauiuNg6gdUbuSBaRHnEmOXG4WjaZTna?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjQ3Wk1XV1h5V0hBUjJOaFNlQzVOOXMwQit6UWhxVEZycUJYdEdSdCtQb2lv?=
 =?utf-8?B?eFJUaDRYRG0xOTdncUtvalllRlRJTkg5VU1Tb0hOSmFVMHJCNkFLb0hJR1JV?=
 =?utf-8?B?SENveHlrWXNkd01UTFUrVHFOOGw2ampiWHBtZUE3MHlReWZ2T3FtWGoya01D?=
 =?utf-8?B?REErbjRhYzdwK0ptYXhkdnFOdzB6azdtZnVtR2ZkcmF0RjBKekNZUTJlbXp4?=
 =?utf-8?B?eGxLYUdWWVhUK0JXSjVRS1BLT1VQcVlnOUhXRlY1YmJyUXZkS2VhMHVuajlj?=
 =?utf-8?B?dWw3RTJpY3BRUDg4TEsxbjI2ZnVwL1M4ZzVPUURGRHZrNFE2aDZGTEovWmdp?=
 =?utf-8?B?Ukh1V1NTeGZSTkNvS0pzUnJQMnBMQVN5a3Jhb25TWjVROXYrTGNCNGF1Tlpi?=
 =?utf-8?B?c2R1WjFaKzBCbFpQNHJiaXlBSnprVm5FOFBvSXpkUm9rM2ZXWCt0SkVUZXla?=
 =?utf-8?B?NkFwVm1LRUt5YWRQRzZCZWRFL2VybHk4aDVxZ2h0djZqNkM3Rzc1bjJLQXVx?=
 =?utf-8?B?cks5WU1nWTZjQzRXVWY0RG1Kell4Z1pVNmljUkl6aWxwVnA5WGRaRTUrUnZO?=
 =?utf-8?B?R3R3bmJyQ1dwYkJKeDBiZmJRVGo1SHRBd2tFMXg4Ymo5Sy9McjBiYjB4N3Fs?=
 =?utf-8?B?VGlhNlROeGVRZlF5RzBkYmhHeW9kM1VPWk5CZWdFM0ozNy9GMkF1d3UxN2Z1?=
 =?utf-8?B?TGlCS2l5R3llaXM2dlF2MFFmWi9OZDh4eHAzSFBYSHVtSnozZ0RqR00xL0RL?=
 =?utf-8?B?TiswSGZacU1IWmxuRUdlQ2dEUEF4cmQ1K25LQlR3NTVvenl6TWJqdHBiS0tk?=
 =?utf-8?B?dkdLL3lpQVRlUnNKVysvN3lucm9uRGlJaE9xZGRzT3ZmL2xoNTZ2Qld2S04y?=
 =?utf-8?B?bnBnQmg4UVA2ajBDa2J0WVBNdTlEYjUwcGZwOGlQeDBMT0Fxc1pGWmpqRUJt?=
 =?utf-8?B?N3hob1N4Tko0OVJNY2hsTWNwKzZ1UklaajZoalNUTjZMeE9HdHhpTTNXK092?=
 =?utf-8?B?MTQvczkxQ3hVREIzZTlBbGJBMTBNeXFCMmh0OGpLQjdxRHpOTkRIU2RERFBs?=
 =?utf-8?B?MVlPSjJ3YXRydTl6NkwrSTdlWlFPbkcxbndEelJzTWVncExSRkU2SnNsY2Vl?=
 =?utf-8?B?aHJaV2I2ejVVN1BTTWFaVmJDSExIQjF3UmhpMi8xUkhYN2ZianVncmFORkpz?=
 =?utf-8?B?cWdZaDRDMkNvOVIzN2t3UFpJN08yVE53QlhhSGZqQS9BNGkxZTkzUTBGaVNI?=
 =?utf-8?B?UGxmNXZ5RVVReEdBUUx3SDBRaFYzZGlZTkpIa1NkREhuMGl5dkJYZDRPa0hQ?=
 =?utf-8?B?MlFSdzhYd3FFbCtYZlZncUZFVTdYajkvU05neHZ4bFZCU0EyTjQzQlhKL0tT?=
 =?utf-8?B?bDFKaUNmWFJ5ZC9WK1p6dGxUckI2ZHhnZ2xwWVpwbUhLRG1tODdpaTd2cXB1?=
 =?utf-8?B?cWgvbE1PaXN5L1JmZmxVVVkwa0F5WWRQaDh3ZTJjWHFBcWttMERFQXp0MTBv?=
 =?utf-8?B?VnpYV1ZSa2JxYXkwMUVNenlrNDZlZU56V0NheFJQRXIvUDhRcDY3aThzejlF?=
 =?utf-8?B?ZWJYQS9RUkNDWnhZdVFldmlRNllIdC9QWWxkbFZCVk93WmVyM0s0eWc3TzQ0?=
 =?utf-8?B?Z096MmNSMGgzRjNXbjlZR1ZPdVVzaVcvOXRuTXFlQzlDVFRlS2RIRC9JVzhz?=
 =?utf-8?B?T1VWaXlUQzg5U05rTjI4NnB2ZmxoM1MrMFVVSXRvaFhsQ1A3WDFidFZ1cWdk?=
 =?utf-8?B?MFNEaWJqNXZqemRRYUZlQWdSa2N3dUhsVmFtaWtZc0hPb2NxZVFYMkZDYWtF?=
 =?utf-8?B?TEVvVkF6c0R5UC9ubUxnUXlRQ1VRRld0V29LVGtVYWZFUjdib2RKRFp1dmEz?=
 =?utf-8?B?YjQvMCs0NmNkU2dBV2hINDIyeXl0ZTZydzRDSGpZdFlyajZzdUFlQmF6a3p0?=
 =?utf-8?B?MXEvcUxnUzcvTGp3VjRUblZmam85bU1BUlZFWWJwV1J3ekhhQXY5OVRCbWFw?=
 =?utf-8?B?OEowZmk0ZllUamhZQVJVaCs3M3Z4cnZhZVdOMksvZ0YxT2lPWldHdU9TMHlh?=
 =?utf-8?B?MThOUCtiN0FKMTdkS3FhR1M2d01NcXp5MDJZYzdteFZIQVBvUElEYUVMdW9n?=
 =?utf-8?Q?Hoi+iWsRWghW/71yOjMi4Cv1N?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70961e3f-7e7f-48cd-cc1d-08de2c9e2b8d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 03:44:58.3838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6CFEkwZ0TzeTpbeLgN7Ablff5DRSh8mBxpqwwZX9nKUFTQNdnksup8ZZqa513kOWMMFH11JarSfOnDdlFIYGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7126

Hi, Jerome

Thanks for your review.


On 11/24/2025 5:26 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Fri 21 Nov 2025 at 18:59, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> Add PLL clock controller driver for the Amlogic T7 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/Kconfig  |   14 +
>>   drivers/clk/meson/Makefile |    1 +
>>   drivers/clk/meson/t7-pll.c | 1068 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 1083 insertions(+)
>>   create mode 100644 drivers/clk/meson/t7-pll.c
>>
>> ......
>> diff --git a/drivers/clk/meson/t7-pll.c b/drivers/clk/meson/t7-pll.c
>> new file mode 100644
>> index 000000000000..bee8a7489371
>> --- /dev/null
>> +++ b/drivers/clk/meson/t7-pll.c
>> @@ -0,0 +1,1068 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2024-2025 Amlogic, Inc. All rights reserved.
>> + * Author: Jian Hu <jian.hu@amlogic.com>
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>> +#include "clk-regmap.h"
>> +#include "clk-pll.h"
>> +#include "clk-mpll.h"
>> +#include "meson-clkc-utils.h"
>> +#include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
>> +
>> +#define GP0PLL_CTRL0         0x00
>> +#define GP0PLL_CTRL1         0x04
>> +#define GP0PLL_CTRL2         0x08
>> +#define GP0PLL_CTRL3         0x0c
>> +#define GP0PLL_CTRL4         0x10
>> +#define GP0PLL_CTRL5         0x14
>> +#define GP0PLL_CTRL6         0x18
>> +#define GP0PLL_STS           0x1c
> A new line between each register region would help readability


Okay, I will add new line for each register region.

>
>> +#define GP1PLL_CTRL0         0x00
>> +#define GP1PLL_CTRL1         0x04
>> +#define GP1PLL_CTRL2         0x08
>> +#define GP1PLL_CTRL3         0x0c
>> +#define GP1PLL_STS           0x1c
>> +#define HIFIPLL_CTRL0                0x00
>> +#define HIFIPLL_CTRL1                0x04
>> +#define HIFIPLL_CTRL2                0x08
>> +#define HIFIPLL_CTRL3                0x0c
>> +#define HIFIPLL_CTRL4                0x10
>> +#define HIFIPLL_CTRL5                0x14
>> +#define HIFIPLL_CTRL6                0x18
>> +#define HIFIPLL_STS          0x1c
>> +#define PCIEPLL_CTRL0                0x00
>> +#define PCIEPLL_CTRL1                0x04
>> +#define PCIEPLL_CTRL2                0x08
>> +#define PCIEPLL_CTRL3                0x0c
>> +#define PCIEPLL_CTRL4                0x10
>> +#define PCIEPLL_CTRL5                0x14
>> +#define PCIEPLL_STS          0x18
>> +#define MPLL_CTRL0           0x00
>> +#define MPLL_CTRL1           0x04
>> +#define MPLL_CTRL2           0x08
>> +#define MPLL_CTRL3           0x0c
>> +#define MPLL_CTRL4           0x10
>> +#define MPLL_CTRL5           0x14
>> +#define MPLL_CTRL6           0x18
>> +#define MPLL_CTRL7           0x1c
>> +#define MPLL_CTRL8           0x20
>> +#define MPLL_STS             0x24
>> +#define HDMIPLL_CTRL0                0x00
>> +#define HDMIPLL_CTRL1                0x04
>> +#define HDMIPLL_CTRL2                0x08
>> +#define HDMIPLL_CTRL3                0x0c
>> +#define HDMIPLL_CTRL4                0x10
>> +#define HDMIPLL_CTRL5                0x14
>> +#define HDMIPLL_CTRL6                0x18
>> +#define HDMIPLL_STS          0x1c
>> +#define MCLK_PLL_CNTL0               0x00
>> +#define MCLK_PLL_CNTL1               0x04
>> +#define MCLK_PLL_CNTL2               0x08
>> +#define MCLK_PLL_CNTL3               0x0c
>> +#define MCLK_PLL_CNTL4               0x10
>> +#define MCLK_PLL_STS         0x14
>> +
>> +static const struct pll_mult_range t7_media_pll_mult_range = {
>> +     .min = 125,
>> +     .max = 250,
>> +};
>> +
>> +static const struct reg_sequence t7_gp0_init_regs[] = {
>> +     { .reg = GP0PLL_CTRL1,  .def = 0x00000000 },
>> +     { .reg = GP0PLL_CTRL2,  .def = 0x00000000 },
>> +     { .reg = GP0PLL_CTRL3,  .def = 0x48681c00 },
>> +     { .reg = GP0PLL_CTRL4,  .def = 0x88770290 },
>> +     { .reg = GP0PLL_CTRL5,  .def = 0x3927200a },
>> +     { .reg = GP0PLL_CTRL6,  .def = 0x56540000 },
>> +};
>> +
>> +static struct clk_regmap t7_gp0_pll_dco = {
>> +     .data = &(struct meson_clk_pll_data){
>> +             .en = {
>> +                     .reg_off = GP0PLL_CTRL0,
>> +                     .shift   = 28,
>> +                     .width   = 1,
>> +             },
>> +             .m = {
>> +                     .reg_off = GP0PLL_CTRL0,
>> +                     .shift   = 0,
>> +                     .width   = 8,
>> +             },
>> +             .n = {
>> +                     .reg_off = GP0PLL_CTRL0,
>> +                     .shift   = 10,
>> +                     .width   = 5,
>> +             },
>> +             .l = {
>> +                     .reg_off = GP0PLL_STS,
>> +                     .shift   = 31,
>> +                     .width   = 1,
>> +             },
>> +             .rst = {
>> +                     .reg_off = GP0PLL_CTRL0,
>> +                     .shift   = 29,
>> +                     .width   = 1,
>> +             },
>> +             .range = &t7_media_pll_mult_range,
>> +             .init_regs = t7_gp0_init_regs,
>> +             .init_count = ARRAY_SIZE(t7_gp0_init_regs),
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "gp0_pll_dco",
>> +             .ops = &meson_clk_pll_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "in0",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_gp0_pll = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = GP0PLL_CTRL0,
>> +             .shift = 16,
>> +             .width = 3,
>> +             .flags = CLK_DIVIDER_POWER_OF_TWO,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "gp0_pll",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_gp0_pll_dco.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +/*
>> + * The gp1 pll IP is different with gp0 pll, the PLL DCO range is
>> + * 1.6GHZ - 3.2GHZ, and the reg_sequence is short
>> + */
> Nitpick: if you are not going to explain why the reg_sequence is short
> the last part of the comment is not very useful.


Compared with GP0 PLL, GP1 PLL is a newly designed PLL. GP1 PLL DCO 
range is 1.6GHz - 3.2GHz.

Since GP0 uses 7 registers while GP1 uses only 4, the register sequence 
of GP1 is shorter than that of GP0.

It is a known fact from the register definition. I will remove 'the 
reg_requence is short'.


After updated, the comment is:

Compared with GP0 PLL, GP1 PLL is a newly designed PLL with a DCO range 
of 1.6GHz to 3.2GHz.

>> +static const struct pll_mult_range t7_gp1_pll_mult_range = {
>> +     .min = 67,
>> +     .max = 133,
>> +};
>> +
>> +static const struct reg_sequence t7_gp1_init_regs[] = {
>> +     { .reg = GP1PLL_CTRL1,  .def = 0x1420500f },
>> +     { .reg = GP1PLL_CTRL2,  .def = 0x00023001 },
>> +     { .reg = GP1PLL_CTRL3,  .def = 0x00000000 },
>> +};
>> +
>> ......
> --
> Jerome
