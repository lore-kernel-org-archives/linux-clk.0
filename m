Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.141
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793587743;
	b=as9LU9J53mbK7NNuyj7Lj3fP9oy1qUPxipylW01FyfpJBWZ82V+JhHuehUAi0MvV5RI0
	 1kly+SV0uRBmZ0OFi6MdTlfdw4n8aONVRRlfs4VLi7x1BVUawv1c/EUpbPjWoMShci1f0
	 q9sKLL8RwJ/QAEIAwmsrtVaEZJuZot8yQ6ahrQkT/K0ON7sz00nAGmwP5yNt6vJW2iGlo
	 dxulyTnIlhVPu/eRYOFUWFVl6IgDu3Pqmkg6Xohk9GvHyfrWTE/Pk/dFzxhgx4/kydNub
	 2tZwWhR4n42wIydjJzxADD6ckT5eYWg72mp3awNhHSenmiVmYBw625lmz8XczjSwmSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587743;
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
	bh=C4g2wP8lXATqQy1JaxG0Rdx7dfS5DOeSPCw221jeens=;
	b=QlRQ/XmVKDg4vfd+rE6YGgWtKAo+v5FI+sXt2nhKkbTHakFWMoJ714eJTYbCEio8jA/R
	 LI7u836KVzkwRW2kx5nQQNViM5KY3IJ3yBUAgHbnON6/1vCcIq2Zwaqt2anPXMYrNQrPX
	 t6w1lhzp783EjpedBWcANEE94xIi9y+aLCKzue9qKgVmndNiNrE0REgbyxvNZ/8YK+cQP
	 3igR0IIeBzrQDre5VBGxnR4taDqeDviJV77PKZAzLhj/W0VGXzEIclWCUb+ub387//tlz
	 HZZ2DwFmif2IZCsP7OZXdX/0m//ZHkROCvS0I2PotJmk3wegEmSqRqGunP/NJjHLt9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=eMZS+Rpt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.141
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022141.outbound.protection.outlook.com [40.107.75.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F00F606A324;
	Mon,  2 Nov 2026 02:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F00F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=eMZS+Rpt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBdQ7vAcdpkJtY0thA4SL1XQ2hPSRxAGMn/c0eQ2AXWZWVyvA6+rkojdVDB/7lDUf878e/6pltFjpYv5JElokuhjo+vL9ATkehSLRlGTVUbGR0a1RnLqub+WRxM8G565Hnap8oQ1iyVGHILctBBdf+icoGq4AzIye3z7zzdCQBSvsyl7ekn1/pU7VyxcOCxWj6DalkdIS1UrroWGPLyyDRiBL9A2NGckKxm+6kiyT0db7QMQFmN2YVXAmeoXB6js1J0oSL7B+rlSVXp27czVGXV8QUp+XOD6W50mw/Q3Ho0PwRNQ7OstbH0O4yOpNjKUEo0H2lHNHxHtsdfMfFhnVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4g2wP8lXATqQy1JaxG0Rdx7dfS5DOeSPCw221jeens=;
 b=iHGimsrCpoOp7uofBSGzoxXmEESaEVfIGGduIVU8Ye93E5ME0MGQ9Oo41XBDvkdHWWZYIjZZ8TpBVh4+airwws+Z/JyalG3xtBpQYKtjex6vD/z18I8L60+l6bNPUpp2Apy1OT50MRhPIZIcaZxXUKaUNQfgheykckAh+esxkPq/lNXjiYnzn71b0KVyg+v2lG91Dx8N88yLxdXmZxZRSM1vgVpVxUn3xEiq88xzvDpQGsBnUUU+nyNbGFRbScTJstBHrx5dSBQR/0pBUEza64zHjmpN/sfpXXmc9QzaliaM2y7/R7xbKoGO+YNbeiPc6iMhULoOcqVVXe9F0OUvSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4g2wP8lXATqQy1JaxG0Rdx7dfS5DOeSPCw221jeens=;
 b=eMZS+RptPBBmJk6iV0Iu8onM4pvKzxbQwBFIJY1R23uL5CwnWd0VYlhV6sL74Wq69tYRpCz6RnfVqNKMx38OF/p0+tYBc/enjqe/vovvGuEoplsmZOVxasYDSkisHvDRZx8+ond+HVK1IqzEMi7LK0A/Ve1t+NQNMcXYA4eNjt56XOwuniUGKLJE7AD5c+s9qVdpCdM7mhVM7c5N1xqvtdGVja6M5DxeepOcVgsyaSHE7xNpM3+mXEWZz4G5cJuqa5b3/oXHAhCxNzzmpdwNqcR87nzTLVf40QNWPiXnGxsefVD1Bbj8DYJKgFWycXQ/yqv8NcGHlPDX2YSKTqClTw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TY2PPF94EB25A41.apcprd03.prod.outlook.com (2603:1096:408::9dc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 02:48:59 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 02:48:58 +0000
Message-ID: <f5ccee19-ceef-4427-8d66-8feed49b5475@amlogic.com>
Date: Mon, 2 Nov 2026 10:48:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: meson: Fix PLL enable timing
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261028-fix_enable_timing-v1-1-70f060ec3f2a@amlogic.com>
 <179335104535.2573818.8004160070280286355.b4-review@b4>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <179335104535.2573818.8004160070280286355.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To KL1PR03MB7149.apcprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TY2PPF94EB25A41:EE_
X-MS-Office365-Filtering-Correlation-Id: 37051901-0d8a-4115-c249-08df388bd807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261028144727099003|4143699003|11063799006|10067099003|56012099006|260925021911599003|260925022911599003|260925021311599003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	mtawj1e32p2bbG3UELCVPjQhrWS5slT3Ddr7iCG+XDOEMUmpZHD+s6CmOvwhAPsT99RCBxzkDbkXbQMlr9Jn73khYPvdQoOCQGITzhEe8KqU6jbMS15NYfjSQA1FDDnwAXBaXUWvERUcvSQaE/PqZSOF3zCVufuv3xREBOrq6qE0tSvBtPxj7V/7cHoeRh1qOH5du9/VG+G1NollNBa/poUfYVxFiYsAOTC3PwjPyG6S6LGIF/AubJdxQo1JxkgoV/ouFjDQcjye3Yx+C8hEcaGUMse6wmyYxIiiXCR7nLbvRP671Sm4rnWrj7Tv/NWM1V9YOm9yG3Z7209ugNIsYROrodz3bAXi2124oXv4J0rOyW/BjN6iWlUIhVk6sKb9TmBXx3lyLNv0XYlD0cAL/TQNAmHWyRD2havHPfVVyTyBpGKVqMl3yNdNJuTJEjh4r/zw/kwGFFfZIlbuf6GZ8pXs5+J0efABQ4++oNnRkxA4bD5mpMN6rxaB8as/uixjL8LyHFuvgAVBgGF/3z2dJE+r8vG9pQ0vzx9hLzgHLNaQuJGHL0l+qu5zSEeHuyZHvcDKgFbWTe/SkhLzZ5cPJRy/gu4wX7jhhWlEHp/XMQjv5CrwBa+kUkFyMvSjaKJ0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261028144727099003)(4143699003)(11063799006)(10067099003)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1lUYnhsQWs5OWg5MlE1QityMWFEN3ZzU1dwQ2d0V0IvemZRNnY4L05LaTdy?=
 =?utf-8?B?T2xUZDY2SERScTZ2UE9vS1p5WG5lTUcwMStOVVJ4REgxcVRFcm9GYnFzVHRN?=
 =?utf-8?B?RVhXUnQrL3JKYW5WWTdOODJxaitkZDRRRUJkUDNtUVJtbU9RZzQxODF1U2lp?=
 =?utf-8?B?bGJDL0F4TkZXSGVpUkNyVVFvM0hMczNudFF1Znh6ekVBVXo4MVlxa1hXZ2ph?=
 =?utf-8?B?NENFeUxXQWM2ZkdqZ1lPVVBNdnA4dFhBV292Z05BVk5nSkFkYnNWMzlRZHY5?=
 =?utf-8?B?M1d1M3JtVjhGaGs1ck5GUkVKbTUvZmZ2MHFuTmxGNUk1eTFzNW83SFZ6TjVI?=
 =?utf-8?B?Z3RwTkhlaHpuTmdnQWxzN3dwTkdUM2hJcWNlM01mckU3aStVR3RxUWJvZllE?=
 =?utf-8?B?aEtFOHFmZFRGdHp1WkdaYzlhN1JyR3lKZUtHOGNLa2xzWndsSXBMVmpBVEJD?=
 =?utf-8?B?SG5zWCt0N29rdnBEUEh4TXQ2bGlEUFdMN0lyMUI0dk56YkJxdkNPSWNNelMx?=
 =?utf-8?B?aVczV3JpWllSN2tzMlIweWhYc3VpRVlrVFpYdjJzWFhIdDQrenBhL29Xa2ZT?=
 =?utf-8?B?YTU1WDczUmZrYWRZR21nZXdtZE1wN2JZa2dWU05xSytwaGR0QzZwQmJHRHJV?=
 =?utf-8?B?dStwVXFSNE5Sbk1ZZURDODFESVdIbGJidXRIOG9aTk9QdEozaXVOcEZIRjJN?=
 =?utf-8?B?YjRwNzcvVkhBNFJydVRDQWU3T0s1SWZZZ3FzK3Fwa2VRbHpJMStrYmx5bjZz?=
 =?utf-8?B?Uk9hRUtMWGRwS0owNTRHSXBWczdMSlhQZWluVlFMU0MxdElaTWJlM3R0WXpO?=
 =?utf-8?B?TGNEK1VvNU8zSTNLSHkyZlRwaXNlaklwZ0k4U0Z0Ti9ZRFZIRzgwWFdFSWVN?=
 =?utf-8?B?U1Y2UVVQMkk2WWcxcWJ2TjJpUEk0d210L2R0NmM3TmhzSnZCeGwyNVY4MmZq?=
 =?utf-8?B?TWxRbUZMMWF2ejRhZzJneVlsYjVpMWg0VUg1WTY4OFRyMVA5U0ErcUNkZjJw?=
 =?utf-8?B?akhGeHMySmZqT25VbzZFcE9zL1FiWGI4UnREZC9QMHNyUmtYc0FjRnRncC9Q?=
 =?utf-8?B?UC8yRDFsVXdLT1NvT2NLSk1oZER5YVBIdmtWb09LWlNocDE5ZFA5ME5JSDJB?=
 =?utf-8?B?RjhVZzZjVnd5cHkyNjU3ZHFDN3FuUjl2d2JKZFJCSDd0L25pZmp6eFlIL1gv?=
 =?utf-8?B?K0pNOTJLakVpcHp6SXFqYzZ3Vm80SFNoOVVpR0V6TFBxZWtwZGNXcEZNdGpB?=
 =?utf-8?B?cENrR09vYzZMYjFINUkyY011d1RRNHlKK3ZoR2ZqaUlsWVRqTnlna2EzVEhu?=
 =?utf-8?B?TURWVFM0TTBYMW50eFQvajg4b2s4VkF6YmM4OG1xVitlMHhsOVdSdWFjSk1T?=
 =?utf-8?B?NXE3VU9vbnpJTmxLRVRneWVZY2FmellrdHFIUmhCQ3J6ajYrejRXZFB4cTNJ?=
 =?utf-8?B?cEloQndBYlNoRTB1TCtjQzN2SFBSWTBxVloyUGtOclQvSDVtamt5ajU3MDRy?=
 =?utf-8?B?Y092Q3J6bmpndVlkemtxc3JPU2hCRWtyMVk3TzBtYWU4dmtENEtJVWcrVldx?=
 =?utf-8?B?aHRlUlBIbE5iMkp2MGc2ZGVpNmlKWWIyR0piLzJVYmxwTnZ5RktZSE1EOFkv?=
 =?utf-8?B?aDQ3RFBTbEZ6QUNVRVlSMURCOEdFeTVoUTZtcWRBYmlsLzh2U2svVkE2WHBC?=
 =?utf-8?B?RUNZeVUwVWQyK20wWnY1SjU2aGFkT3I2aWkwV0pKeGF0dit3WTE3T3V2ZDdi?=
 =?utf-8?B?dHAyM0hxWHJ1a0EzVEdVMnltVDF1M0RIb3gyaXBUcmw2Q2wzcFdpTmRLOVQ3?=
 =?utf-8?B?QStHcTlzUndmcjQzSTl1c2hneHU5NTJTYUthR2hYSEk0OXlYSytUQUVvRkhz?=
 =?utf-8?B?NTdaSGRRRDlXOXFTVFluN0JIa1FSZG5xMWdHTUwrRGhkVEwydUVHb2Rod2J5?=
 =?utf-8?B?RzJiUTk1Y1dSL3NXT1pjSE90N0h5eWdyRXo5ZWlkNkEvWnR2dWpXTzhodUtM?=
 =?utf-8?B?M1I4VmlnQVJLalVLK3Y4YVdDdWZjNUpvU1pTdzlUdExzem5PQ3BBUXF6N1dV?=
 =?utf-8?B?SkJpUytETG8xYzkwMENvUGw3ZHZSMUowUWRlN2VEZkhuSytXR2RYYnJsTWlF?=
 =?utf-8?B?WkFITGhzRkM5UHdiTCtXUzJhMkVacGtsVjE5UENOSXlzYi9Ka0ZLVS94aDEr?=
 =?utf-8?B?Wmd1dkZoL0d6TGlIQ2svNGpkZXV6MjVoQW53Zkpib3RLWjZGMnozMHJ5N2lJ?=
 =?utf-8?B?VHBveWU4R1hIZ2hVVDR2T0ZwRHRuT0MzbWdzUlpGU2tBK3dnS3lVUFFuK0dj?=
 =?utf-8?B?bUlXaFhJL0VnUzV2Rkx6dzZBUzRFUVVlMS85NjB6NjZnYW1idVd6UT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37051901-0d8a-4115-c249-08df388bd807
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 02:48:58.7224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1atYSiBjX0+1mqWOVHlcG8nxLbY58Hp83aS8SDBQFVHkPBPLwiNGkT7r0oLjcHc45djs7YSY/g+l5L4kVmaVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF94EB25A41

Hi Jerome,


Thanks for your review.

On 10/30/2026 5:04 PM, Jerome Brunet wrote:
>
>> The hardware requires a 50us delay after setting the PLL enable
>> bit to meet its timing requirements.
>>
>> Without this delay, GP0 and HIFI PLLs on Amlogic T7, SM1 and C3
>> may fail to lock under stress testing.
>>
>> For example, enabling the GP0 PLL at 1512MHz may lose lock and
>> result in an output I/O error:
>>
>> echo 1512000000 > /sys/kernel/debug/clk/gp0_pll/clk_rate
>> echo 1 > /sys/kernel/debug/clk/gp0_pll/clk_prepare_enable
>> sh: write error: I/O error
> This is something for the cover letter or bellow the --- for a single change series.


Ok, I will move the example bellow the ---.

>> Add the required 50us delay after enabling the PLL.
>>
>> Testing on GXL shows that the PLL works correctly without the
>> additional delay and continues to lock successfully after the
>> 50us delay is added.
>>
>> On A1, remove the redundant 10us delay before enabling the
>> self-adaption current module, as the new PLL enable delay already
>> covers this timing requirement.
>>
>> Tested on: T7, C3, S4, AXG, GXL, SM1 and A1.
>>
>> Fixes: e40c7e3cda07 ("clk: meson: clk-pll: add enable bit")
> This is the commit which introduced the enable bit and it is not really
> what you are fixing here
>
> A more likely candidate is b6ec400aa153 which introduced the delay
> sequence you are modifying here.


Ok, I will change the fix tag to b6ec400aa153.

> I've got this other patch addressing PLL delays in my queue:
>
> https://lore.kernel.org/all/20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com/
>
> Which one is it ? both ?


Yes, the are both addressing the PLL delays.

>
> Please consolidate and resubmit.


I will combine these two commits into one in v2.

>
> --
> Jerome

--

Jian

