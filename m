Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.87
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792637668;
	b=ZLgWGcHv/QpraB0xV5HX6fHvuEfjPwCqBCSoRlHpoVyAEbtSiJDQHRrd+R7mchQgJRJH
	 guNUvbAMguFar7PSFxI9uU2r1ZH7Y1U/ybmbTS/z5qgeEdDylUh6hxM1fcXB8O4BqAKBv
	 2H1kdQB9pXfWUKkQXmKZz/rXnJewPl3Z3y8W0EUeeg/5/OUFWurWJLLjbllMOGltl3bSB
	 cJj8xrZ0Ytqt5ouJCltXUPdbkdyFJAGvXpG+QU3d1k7hS4WPMQzJbrdwj5ZcDxAXMU5o6
	 +vekFNeQjg2PVxMYqFt4kb3LbiBeFP4wewio94mllsp0UKNHpo79P0jezN8vPo52Smw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637668;
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
	bh=C9a2YD2gJZMUdlYvF8L+DdAjxH5Ls/5DksBvPjTJBcE=;
	b=Xccc9GLB49a9VhI3CeLFmXtGIDq7xGI2nrJG6KHemgoW+DeIPuuIcj2gC68qXDAhkko/
	 afNOZEsWAHhIJnA7xsHOccsw3AmoQHo06dHqvdz5qUKehvlp0FOI114soF2PeYc2y22Dq
	 GVR2BYqXekLipOEc74hfrK8eiUkwHERzVhkQ9LU5gi+SZquXTd8SgtHrhrkGrI1exla8I
	 pxHtHeEPaHVv1PzK7dvVmsgJsk9Vdt8Ve/sLwFuoR8NEfXkxiXBO0LoHZ2m/thOG2ZPQV
	 yDW5tJo63CeQ2OvwqK3narsxxT8VDU8qpQMeMAK8Tj3jn/KEezzm2xBDm8fyDywcRLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=ObmqC7xh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.87
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023087.outbound.protection.outlook.com [40.107.44.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056E0606A319;
	Thu, 22 Oct 2026 02:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 056E0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=ObmqC7xh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5ZGVBdboJmn3ZSJK7mOTpXz+vb6QQ+5Zcd+vd7Z/zY+s6AM6mL5Aps0B82RqfINdgN4k+Uw1mzxza3eVWJVjguy4eIgTbj+uASiERlE86GmriqEwkRpN+l13MWvTQUmHFkyo78Wv0BWEKLthqP1HX8zzQFn0VXhMhr07UP6zkuTDcRDvnwPnohOireBODn8dNlKbMCD/Wt1fYHV4nzlpUX3fDo79z7CbHtmb9+HJPZfXofDKE4rLt4cIgnk6acDX/poNxSpXupHiu5C+J4ZCJwSKqGfpyVzbYomLSSZeLnCu1u4/Ck+QP/a64CEvtBALTqjQvJSopUs5XjHZIos5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9a2YD2gJZMUdlYvF8L+DdAjxH5Ls/5DksBvPjTJBcE=;
 b=r9bYb0X1mfWj4AMXkU+y3C/uLCzJd+vlde/QdYJ3CBNTK4Eu+c1p3Js1Z6yrFWsqNeIG82xger8b/tQHaxFRYBNV3Aa0VArgzjWo6QiOb3lfxVEEPLq7wdhKZv8Tgo9xB9OelNWJNI6c8A/hsL1rABluOeUYDgtL0Wl56aS7Amm5Nv8AFR063RoiLay3b0Oagm/t2ZO2qU1+rM28A88vpOUsvd49o/DF8yLTDwyBHxwCj5EycuecglWO+UqlbC1OPfrj6CmxSx+kpWFYQ5wDbKaJr80qUTiYFQW9heU7G21sgxCKzy1tTqp0xD4Oq8vi91OMoxuAVAxM0/pMQgYk4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9a2YD2gJZMUdlYvF8L+DdAjxH5Ls/5DksBvPjTJBcE=;
 b=ObmqC7xhlxEcw1h8EKJIK1yolsZ0RpUD7t39blE86inodChOhvrgkLjzfOXHzw4TDSn/YQi4VOLXCFR68iMq+mb+RiYfZURIfBQ3/5W6sXG3AiOjaIlWO4psQcPosV/yPbRsV+HKB2LuCmE3VwYz+RutWTZxrK3yVch2uInF2AIZ3G8vDqHKwYklFQmB/BNhK0/31BBLtzM6P0DJuEayvGthZSZJPbssR92LbTQmmry6tgG/VzOIskxlU8iBtgcxIhAAtgMPEMrPkRH9XFBiG+Yava36412uoDiGoidZK6rludA6xMOTE0KeC3MULLo4XrK7kKwsD8uuIwkk2U02oA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 (2603:1096:405:3c1::21) by TY1PPFC94CEC410.apcprd03.prod.outlook.com
 (2603:1096:408::a6b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 02:54:23 +0000
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7]) by TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7%6]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 02:54:23 +0000
Message-ID: <cecef927-49f8-4351-803c-28ba2a10fed1@amlogic.com>
Date: Thu, 22 Oct 2026 10:54:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-5-2b9aeae9cb8a@amlogic.com>
 <179259528987.4070168.12089976339610295834.b4-review@b4>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <179259528987.4070168.12089976339610295834.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0214.apcprd04.prod.outlook.com
 (2603:1096:4:187::17) To TYNPR03MB10226.apcprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYNPR03MB10226:EE_|TY1PPFC94CEC410:EE_
X-MS-Office365-Filtering-Correlation-Id: db391aa1-423c-4d34-c10c-08df2fe7c731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|22082099003|10067099003|261021123027099003|3023799007|18002099003|4143699003|260925021311599003|5023799004|260925022911599003|11063799006|261009223027099003|260925021911599003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ralrJPmNNKcAmIehgPhHwi1actcvZLG3Luz0WgP6+MNeWrmdUCQLlvsMN/Wss4SHuCaQ9ZVbSInbTBZHL3ZpVTtx7IrUq8Muv+o32mEPJ6zo6mZ5VBQsTlQyJijh91hZHfkeu0KiFPVkuE8696pdoW9GmHV6WPfaOsct4RquCX30LruYv/oGWmjUPIPC4KGHEC5t7Ri5Yij5AOzYoXhiA5wW6qucSyr2XRsjQ/ghe7Qbrl1aeAceOsueIFJTLcjq6HVVmno6HjBagpMu7gGNP34KcDK1mMLwAZp8kKBEAjKvkJ8u1Xgs9jbMZeIEKR6z3/fRObAVM9E5NJVH+G/aXjYvuuMeMd8R+OQp/T3h83ddO2tiJQghIzOvxsNGtDFpX2CVz38mzDkp2VkSGbZbze9xzR61ElQeL2ul9/UoAEBeEiAUcBrIe3oWcijWIbEi5RUzg0DcnL/XrUDtBItWjh/l6hl6ER6peeVqRDPyIAfkzPPtR4mOMuPLONNV8+oXPtwPtVbD5JizANTTwdYaoPyjjkwR8MGMrlFdAGt6r4d6Rw42ArWQlwLlVvXjWLRryeK4Wc2cUoEsZb0J/a2OOtQJLtPoSh1nJwjn3yPjpQJjMv5N7IX30C1sgrKwUzBJOz3uGTtREDuTcVsGtAWSLtxLPD0wfnq4zw8p2KO30Hw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYNPR03MB10226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(22082099003)(10067099003)(261021123027099003)(3023799007)(18002099003)(4143699003)(260925021311599003)(5023799004)(260925022911599003)(11063799006)(261009223027099003)(260925021911599003)(261021121427099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UldoK245SjRnSHBjUVcwYlh3RnRHYXVIdlZGRTloY2l0MEgzQTNsWmpSUHRz?=
 =?utf-8?B?UDFiZXBDMkNqOEtuV01kSGU2Tld2ajFneWQxRmxtK25xNGg1WVhSeUFLVmZt?=
 =?utf-8?B?SDFnNnhQS1JHL0laRUg5UjB0anFMcHdLMjNBOFpTc2d3aENIek02SGwrRzZp?=
 =?utf-8?B?clMvMlpoZVQ1QWhJNlVkdU1xWDJFRlIrYW1QT1BrQUt0bHBLZTdQSkZ0eDVD?=
 =?utf-8?B?ZFN3V3Foa3ZMaUtldHl5NXpiYVRYZldkeCtFeDE2bkRTTFNtakRQSUtzWlF1?=
 =?utf-8?B?RnphSU1GaXJzRDBuY0JVOWhiRlRvVzVaMDVqS1Z0SkIwSjFsc2JpSUpQTXhM?=
 =?utf-8?B?R2RtVUxtK2hKamFNdy9aRitVWW52eTFtRE9VV0NkUlBmSGRMK0d0a1pWSVhU?=
 =?utf-8?B?U29aZ1QzOWtYNDh3K1ZLWHZYOWFCK0d4aHBwTUU1bVV4ck5tK0ZwN0Vvck83?=
 =?utf-8?B?TzNXdFlYR3pweWt6S3VyUURPT3VwUmxSMmhpa2x0b2xEQ24rN0FtUHl5a08z?=
 =?utf-8?B?U3ZQT29GY3VVNzd6S09vdDh5eFhxWlhoM0pxdEYzUkRtdDRmOGdpN0NOVCtw?=
 =?utf-8?B?bENCd0ZtMllsVWtkclo2Ujg1SEVDZGlkR05zM25mWklITnVyc1hTaTFNdlF5?=
 =?utf-8?B?eUVXR1FTcDhlVEVZR2c0bDh4bEgxWHl3N0c3KzJEU3lJeEJWTU5lY3Z1VEhP?=
 =?utf-8?B?WXJONVp4ZVFUTlZlYXZETG9WNXh3QXUva2FDeHhRRkd1UmQ1cm5zcnlXTjVJ?=
 =?utf-8?B?ako2N2wvSTdhQVQ0WFpLMVhhL0p3aVkyQ3FZdTFBRDBNVytuc3ZnSWlSVFFL?=
 =?utf-8?B?ejN5SVJib0NZdU8yZncrejU4VnpQYVJtR3VTOGxOTGI0RWpjdENRVERkR0ZD?=
 =?utf-8?B?N0dUUThKbENLdmJhSzZuZ3pPclZidHMzZFlUcDM3czRBOVV0bUw4UUFpRnV6?=
 =?utf-8?B?YUpxazdEbEZDbTFDTC9pSEx1TzByK2QydlNlM0JROTFHc1o5MzJ4RFJmWDAr?=
 =?utf-8?B?ekM5eWNGS3BSa2JpYTVVZzdJMDZxQUZ4UVczYkd4d3VmUUhsMEJreGp6MXRM?=
 =?utf-8?B?MUlDK0tpRmlNT0tLSUttMGRaSFhBSUdUU3NNTGVESUdSVzFweDJySG5RZ1hH?=
 =?utf-8?B?dUJadTFJRlFZaWlIRVdYaE1XY3FudUJWdStTcERyREhXS3E1ZGZwT1YzelF3?=
 =?utf-8?B?NG1scU4yQ0RpcHRsNEg1N3BiZ242WlgxQzBsYVNXakhyejdzMXpGbW50SHND?=
 =?utf-8?B?ZjVCZ0hOVzBiYnpBVENBWUFGOUJDUG82K3ZqYk1uL2FkcUpxc0FWZnNPelRa?=
 =?utf-8?B?c3hzelR5dDRQakdaUFhCYzNJMC9qblJYZkh2M0NYLzl5WWE3dFRrREJOMlZa?=
 =?utf-8?B?Q09yK1Y2WTZHcUxja3FhZVBDanE5NWVlN0FJbkRNUFlpQ0d2QXh1OENERkcy?=
 =?utf-8?B?TWpBRmFlOVRRV3pucmhBRE0xWU1PcFY3UG1DeUI2M0ZES2R5SFRBV0ZYaFVJ?=
 =?utf-8?B?VklmTExTREZuMTBOSzB1dVlPUDBRQ0RNci8wZThLSk4rdHlEL3JzTkRzSS9q?=
 =?utf-8?B?UFFIMFhtU2UwV2dZcUJqbXAyM256bzJWUjJtd1JRQVhPVzlnQ1AxVm8zUnN4?=
 =?utf-8?B?MDRyRkQ0bDJIYlJOVmhLT0RpNndEVFNVdkJrcUZEMmNKbEx1bTR0UjNlc1BP?=
 =?utf-8?B?Z3l3TnpHVDVDUnJZL2ZmSWZSZ0ZDMCt0MzlTcTZWOTJNZ3pUdk1sZ0dnUUp3?=
 =?utf-8?B?K1hoa0Z0SlhiSlQ0a0MzSS9UREtSNjUxbW5raExmWEhRNTE5Z3VmSExncW02?=
 =?utf-8?B?MlNrZVFIbW54TEZtN0lFcUtqR1RUVEFNUFVrcko4dEpEVFMxRFBYTmtWM2hY?=
 =?utf-8?B?YlFIVUpkcGRLRkVGNEVoTWtpY293OEJjR2dsOW1PR2tpQk5lVCtrWmlwS1Fl?=
 =?utf-8?B?Z1Izdi92VkFQbkNhSFVaWnppSHVETVdSNCsrTHV1R2JWZkxRUkY4UmRYejA1?=
 =?utf-8?B?ekZiL3ExRUlFajVsMmhUb2k0VHFSNGxMOEU2Rk1yaGhLdVJkQ2xZbnFTMkI1?=
 =?utf-8?B?RVNOZjlLakFNTG0vbDdPT1RZQ1FLak5ucm8vdDNPMkFPRGcya3BYajVLTVg4?=
 =?utf-8?B?MmVBcHR5S1N5MXdWQVYwVzNnUC9TdEdHbDR4cnFiOE0zbmZxcDFUZUZXcmpj?=
 =?utf-8?B?WUZlYlQva09GdFUvTnAzaUVtVVIwSGE0cFdTaVJ4M0Mwcmo4eldSaFJXRTdX?=
 =?utf-8?B?NEMya0RDemJOTlZrQ0YxZnhZaDgwU2lFejFuNlRKckkzYWMyNElYTTZKRUJ6?=
 =?utf-8?B?akRVNk1iWVVoR0tzMFdrcEJiQ0JGM21TbE12T2JmdjUvOElaeHpxZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db391aa1-423c-4d34-c10c-08df2fe7c731
X-MS-Exchange-CrossTenant-AuthSource: TYNPR03MB10226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 02:54:23.7415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSVoXzz6lYfUurXeO9UzZbd7+R0cE+rw+JDFne3Yr2LXN1EIpfE1hpwkB/0fED3YGM8HwDRLSQEYFBGIZyRywIjjnxU+z/aAW+wmTQcY/PQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFC94CEC410


在 2026/10/21 23:08, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
>> Add basic audio driver support for the Amlogic S4 based
>> Amlogic AQ222 board.
>>
>> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
>> ---
>>   .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 219 +++++++++++++
>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 360 +++++++++++++++++++++
>>   2 files changed, 579 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>> index 0a3f81ea0fb0..d614dcd6933d 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>> @@ -75,6 +75,19 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>>               regulator-always-on;
>>        };
>>
>> +     vcc5v_reg: regulator-vcc-5v {
>> +             compatible = "regulator-fixed";
>> +             vin-supply = <&main_12v>;
>> +             regulator-name = "VCC5V";
>> +             regulator-min-microvolt = <5000000>;
>> +             regulator-max-microvolt = <5000000>;
>> +             gpio = <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
>> +             startup-delay-us = <7000>;
>> +             enable-active-high;
>> +             regulator-boot-on;
>> +             regulator-always-on;
> You are adding that for audio and it needs to be always on ?

Thank you for the reminder. I have reviewed the U200 DTS and found that 
it can be referenced within acodec.

  Previously, we configured it as always on for testing.

>
>
>> +     };
>> +
>>        /* SY8120B1ABC DC/DC Regulator. */
>>        vddcpu: regulator-vddcpu {
>>                compatible = "pwm-regulator";
>> @@ -129,6 +142,212 @@ vddcpu: regulator-vddcpu {
>>                                <699000 98>,
>>                                <689000 100>;
>>        };
>> +
>> +     dmics: audio-codec-1 {
> Unused: nothing references dmics.
Noted with thanks.
>
>> +             compatible = "dmic-codec";
>> +             #sound-dai-cells = <0>;
>> +             num-channels = <2>;
>> +             wakeup-delay-ms = <50>;
>> +             sound-name-prefix = "MIC";
>> +     };
>> +
>> +     dioo2133: audio-amplifier-0 {
>> +             compatible = "simple-audio-amplifier";
>> +             enable-gpios = <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
>> +             VCC-supply = <&vcc5v_reg>;
>> +             sound-name-prefix = "10U2";
> Did you just copy over the u200 file or is it really the component name ?

Indeed, it was copied from U200. I was not clear about the original 
naming intention.

Is it acceptable to name it based on the board name, such as aq222?

>
>> +     };
>> +
>> +     spdif_dir: audio-spdif-in {
>> +             compatible = "linux,spdif-dir";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "DIR";
>> +     };
>> +
>> +     spdif_dit: audio-spdif-out {
>> +             compatible = "linux,spdif-dit";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "DIT";
>> +     };
>> +
>> +     sound {
>> +             compatible = "amlogic,axg-sound-card";
>> +             model = "aq222";
>> +             audio-widgets = "Line", "Lineout";
>> +             audio-aux-devs = <&tdmout_a>, <&tdmout_b>, <&tdmout_c>,
>> +                              <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
>> +                              <&tdmin_lb>, <&dioo2133>;
>> +             audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
>> +                             "TDMOUT_A IN 1", "FRDDR_B OUT 0",
>> +                             "TDMOUT_A IN 2", "FRDDR_C OUT 0",
>> +                             "TDM_A Playback", "TDMOUT_A OUT",
>> +                             "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>> +                             "TDMOUT_B IN 1", "FRDDR_B OUT 1",
>> +                             "TDMOUT_B IN 2", "FRDDR_C OUT 1",
>> +                             "TDM_B Playback", "TDMOUT_B OUT",
>> +                             "TDMOUT_C IN 0", "FRDDR_A OUT 2",
>> +                             "TDMOUT_C IN 1", "FRDDR_B OUT 2",
>> +                             "TDMOUT_C IN 2", "FRDDR_C OUT 2",
>> +                             "TDM_C Playback", "TDMOUT_C OUT",
>> +                             "SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
>> +                             "SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>> +                             "SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
>> +                             "SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
>> +                             "SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
>> +                             "SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
>> +                             "TDMIN_A IN 0", "TDM_A Capture",
>> +                             "TDMIN_A IN 1", "TDM_B Capture",
>> +                             "TDMIN_A IN 2", "TDM_C Capture",
>> +                             "TDMIN_A IN 3", "TDM_A Loopback",
>> +                             "TDMIN_A IN 4", "TDM_B Loopback",
>> +                             "TDMIN_A IN 5", "TDM_C Loopback",
>> +                             "TDMIN_B IN 0", "TDM_A Capture",
>> +                             "TDMIN_B IN 1", "TDM_B Capture",
>> +                             "TDMIN_B IN 2", "TDM_C Capture",
>> +                             "TDMIN_B IN 3", "TDM_A Loopback",
>> +                             "TDMIN_B IN 4", "TDM_B Loopback",
>> +                             "TDMIN_B IN 5", "TDM_C Loopback",
>> +                             "TDMIN_C IN 0", "TDM_A Capture",
>> +                             "TDMIN_C IN 1", "TDM_B Capture",
>> +                             "TDMIN_C IN 2", "TDM_C Capture",
>> +                             "TDMIN_C IN 3", "TDM_A Loopback",
>> +                             "TDMIN_C IN 4", "TDM_B Loopback",
>> +                             "TDMIN_C IN 5", "TDM_C Loopback",
>> +                             "TDMIN_LB IN 3", "TDM_A Capture",
>> +                             "TDMIN_LB IN 4", "TDM_B Capture",
>> +                             "TDMIN_LB IN 5", "TDM_C Capture",
>> +                             "TDMIN_LB IN 0", "TDM_A Loopback",
>> +                             "TDMIN_LB IN 1", "TDM_B Loopback",
>> +                             "TDMIN_LB IN 2", "TDM_C Loopback",
>> +                             "TODDR_A IN 0", "TDMIN_A OUT",
>> +                             "TODDR_B IN 0", "TDMIN_A OUT",
>> +                             "TODDR_C IN 0", "TDMIN_A OUT",
>> +                             "TODDR_A IN 1", "TDMIN_B OUT",
>> +                             "TODDR_B IN 1", "TDMIN_B OUT",
>> +                             "TODDR_C IN 1", "TDMIN_B OUT",
>> +                             "TODDR_A IN 2", "TDMIN_C OUT",
>> +                             "TODDR_B IN 2", "TDMIN_C OUT",
>> +                             "TODDR_C IN 2", "TDMIN_C OUT",
>> +                             "TODDR_A IN 3", "SPDIFIN Capture",
>> +                             "TODDR_B IN 3", "SPDIFIN Capture",
>> +                             "TODDR_C IN 3", "SPDIFIN Capture",
>> +                             "TODDR_A IN 6", "TDMIN_LB OUT",
>> +                             "TODDR_B IN 6", "TDMIN_LB OUT",
>> +                             "TODDR_C IN 6", "TDMIN_LB OUT",
>> +                             "10U2 INL", "ACODEC LOLP",
>> +                             "10U2 INR", "ACODEC LORP",
>> +                             "Lineout", "10U2 OUTL",
>> +                             "Lineout", "10U2 OUTR";
>> +             clocks = <&clkc_pll CLKID_HIFI_PLL>,
>> +                             <&clkc_pll CLKID_MPLL0>;
>> +             assigned-clocks = <&clkc_pll CLKID_HIFI_PLL>,
>> +                               <&clkc_pll CLKID_MPLL0>;
>> +             assigned-clock-rates = <1179648000>,
>> +                                    <270950400>;
> 2 PLLs only ?
> 1st appears to be for the 48k family, the 2nd for 44.1k
>
> No 64k support ?

I have carefully reviewed our previous records. Only the 48k and 44.1k 
clock families were taken into account, and 64k was overlooked.

Upon checking the U200 DTS, I found that 393216000 is also included 
there. I will add it in. thanks

>
>> +
>> +             dai-link-0 {
>> +                     sound-dai = <&frddr_a>;
>> +             };
>> +
>> +             dai-link-1 {
>> +                     sound-dai = <&frddr_b>;
>> +             };
>> +
>> +             dai-link-2 {
>> +                     sound-dai = <&frddr_c>;
>> +             };
>> +
>> +             dai-link-3 {
>> +                     sound-dai = <&toddr_a>;
>> +             };
>> +
>> +             dai-link-4 {
>> +                     sound-dai = <&toddr_b>;
>> +             };
>> +
>> +             dai-link-5 {
>> +                     sound-dai = <&toddr_c>;
>> +             };
>> +
>> +             dai-link-6 {
>> +                     sound-dai = <&tdmif_a>;
>> +                     dai-format = "i2s";
>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>> +                     mclk-fs = <256>;
>> +                     codec-0 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
>> +                     };
>> +                     codec-1 {
>> +                             sound-dai = <&toacodec TOACODEC_IN_A>;
>> +                     };
>> +             };
>> +
>> +             dai-link-7 {
>> +                     sound-dai = <&tdmif_b>;
>> +                     dai-format = "i2s";
>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>> +                     mclk-fs = <256>;
>> +                     codec-0 {
>> +                             sound-dai = <&toacodec TOACODEC_IN_B>;
>> +                     };
>> +                     codec-1 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
>> +                     };
>> +             };
>> +
>> +             /* 8ch HDMI interface */
>> +             dai-link-8 {
>> +                     sound-dai = <&tdmif_c>;
>> +                     dai-format = "i2s";
>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>> +                     dai-tdm-slot-tx-mask-1 = <1 1>;
>> +                     dai-tdm-slot-tx-mask-2 = <1 1>;
>> +                     dai-tdm-slot-tx-mask-3 = <1 1>;
>> +                     mclk-fs = <256>;
>> +                     codec-0 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
>> +                     };
>> +             };
>> +
>> +             /* spdif hdmi and coax output */
> No pinctrl on spdifout_a, so the coax output cannot work as is.

At the time of testing, we only covered SPDIF to HDMI TX.

  I will configure the pinctrl settings to enable coax output.

thanks.

>
>> +             dai-link-9 {
>> +                     sound-dai = <&spdifout_a>;
>> +
>> +                     codec-0 {
>> +                             sound-dai = <&spdif_dit>;
>> +                     };
>> +
>> +                     codec-1 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
>> +                     };
>> +             };
>> +
>> +             /* spdif hdmi interface */
>> +             dai-link-10 {
>> +                     sound-dai = <&spdifout_b>;
>> +
>> +                     codec {
>> +                             sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
>> +                     };
>> +             };
>> +
>> +             /* spdif coax input */
>> +             dai-link-11 {
>> +                     sound-dai = <&spdifin>;
>> +
>> +                     codec {
>> +                             sound-dai = <&spdif_dir>;
>> +                     };
>> +             };
>> +
>> +             dai-link-12 {
>> +                     sound-dai = <&toacodec TOACODEC_OUT>;
>> +
>> +                     codec {
>> +                             sound-dai = <&acodec>;
>> +                     };
>> +             };
>> +     };
>>   };
>>
>>   &pwm_ef {
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> index 2a6fbd530836..2cf9a8f3f396 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> @@ -11,6 +11,11 @@
>>   #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>   #include <dt-bindings/power/meson-s4-power.h>
>>   #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
>> +#include <dt-bindings/clock/axg-audio-clkc.h>
>> +#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
>> +#include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
>> +#include <dt-bindings/sound/meson-g12a-toacodec.h>
>> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>>
>>   / {
>>        cpus {
>> @@ -908,4 +913,359 @@ emmc: mmc@fe08c000 {
>>                        assigned-clock-rates = <24000000>;
>>                };
>>        };
>> +
>> +     tdmif_a: audio-controller-0 {
>> +             compatible = "amlogic,axg-tdm-iface";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "TDM_A";
>> +             clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_A_MCLK>;
>> +             clock-names = "sclk", "lrclk","mclk";
> Should they all be disabled by default ?

Previously, we assumed that audio was always present. I found that U200 
also configures it as disabled by default.

This approach is more prudent for SKUs without audio. Thank you for your 
reminder.

Thank you for all of your review feedback.

>
>> +     };
>> +
>> +     tdmif_b: audio-controller-1 {
>> +             compatible = "amlogic,axg-tdm-iface";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "TDM_B";
>> +             clocks = <&clkc_audio AUD_CLKID_MST_B_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_B_LRCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_B_MCLK>;
>> +             clock-names = "sclk", "lrclk","mclk";
>> +     };
>> +
>> +     tdmif_c: audio-controller-2 {
>> +             compatible = "amlogic,axg-tdm-iface";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "TDM_C";
>> +             clocks = <&clkc_audio AUD_CLKID_MST_C_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_C_LRCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_C_MCLK>;
>> +             clock-names = "sclk", "lrclk","mclk";
>> +     };
>> +};
>> +
>> +&apb4 {
>> +     acodec: audio-controller@1a000 {
>> +             compatible = "amlogic,t9015";
>> +             reg = <0x0 0x1a000 0x0 0x14>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "ACODEC";
>> +             clocks = <&clkc_periphs CLKID_ACODEC>;
>> +             clock-names = "pclk";
>> +             resets = <&reset RESET_ACODEC>;
>> +             AVDD-supply = <&vddio_ao1v8>;
> Board-level regulator referenced from the SoC dtsi.
>
> --
> Jerome
>
