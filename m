Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022099.outbound.protection.outlook.com [40.107.75.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8623D3333;
	Wed,  8 Apr 2026 14:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775659473; cv=fail; b=u4B9hvcMmgdDYkDkvxeKMGJjEKZXz8wiENb3l4Lz6qoDtBBlTOXXmm4+EZhUWEnvJ73TrrQjFvyZDbTeidQZfU/ZMKJxbwtEme/JM036/V9dGB70QdsfBim6D5CBjeCFHC9Bf02Fpa9hlXcdLOy9oDs9wXLNYuvUBW9tD9FydRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775659473; c=relaxed/simple;
	bh=Ra5pBGdfg6Gw75Mxld8qAAM0y3tADy2GIIyrIhRLgyw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LLBcOIEfa+HR71GrFaitlCsJ8iF+S/OR17uy8LB6FCYe11Z/pnKVnHLlASqtcYVETG2Q1ZIBI9gMCH3BiDeRo8PmF5U8UW/LFeqBSF7/8sFrN29vBdSf8yPTwtoF5nXP7GN5+xeJhPxBPC8x+EGFyTttxKSk2ClPr/ROowlzjIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Rr4J8f55; arc=fail smtp.client-ip=40.107.75.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Rr4J8f55"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+LyjYUWh4wKn+hpyVwwV2srfjLva8foy8q4R1lIknSN8DiqLFq/1aPthoRhRISbGqxcgXa0fn9pFy9Aaj46bf61sxuWLMSY6ITk/H+M0Gt2rA0K1qPDYpWiW8TLL+wGJC+8JoDFgg3pzYm2ofhM9NjHHhXcYkc5w4RXvSrNvAxZhQUEaR9OnoATYBKauJMGCV4TVmIB9O8f37BqQBtFtVU/OCnKbaqQlTFzVH49LnWtK5V9gOefDA6S3e7UEySrRubvxg47WXciy34JP/6VhXcIpV3oOtzNYy1BPsUMzoT6Gi57rfKS3uz6MIjlqFDAfeGqTR0QDY2hl77eCEicOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+g01k85OZ66nqrujJH6SpKHDmmSi1QscCq5Ew4Jkoc=;
 b=ASoe7AunyP+3pZaYcIvrBCTc37kmZV/FAdF/qhQPzsTbA26Yds0c0TjNbvRAP0nghHC6PkSQopOx1+GBdNMSnWGYxtlTuwCZsQ2y85jfgQ/amKWBpOwKijUEaTXqDB2rFKplybI9Khws3SWDXXaDI3hzOkJbzk/d6gtfBDAiqFFeUD/3PA6vsfbcqMhkPtguyBJW90i7E7Tq5RTSG6LaRIc8JJIGDYoxFcEtayYT5Qv7k9M8OKrSAPt/j+ZHtApWxTUmfsVRHt7oxruKD8u17ahvXN1jlFoBlgIZaoyXg9aYQfH+5IejMsqTocFp5fcc3lESLhSLyFaEI+o3SqkrzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+g01k85OZ66nqrujJH6SpKHDmmSi1QscCq5Ew4Jkoc=;
 b=Rr4J8f55I+EtOnh5FG+TzrCvoRInc49iL/j0uDqpw1q1YdayAltNBGP8kKjbQZ9AyQl+oZbIWZ+bbr3fia9jGxl9XsYGPt/zAe7Pn7bItVpQtT1B5dj3/DUOB7wZVIBpnH+azEPJCKz9RUjwLH+YZAeq/ykZoi7hg7C/0fkqMwptqcv7f3UqskGxpk0gjebJwbczzuc4jLrny6HdxlEIRoUqBQ2N3PDqHhcPp74CR/z1S61knLT3EAojOLK9Zp++z+tGhBoq7hSWJmNeolXOho3Lcbnmcmv5MbTy/2hXHUwPQm8FBASWkgiz7m7lM15YeuuAGOIBvbPx3AapcYhw5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYZPR03MB7060.apcprd03.prod.outlook.com (2603:1096:400:337::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 14:44:28 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 14:44:28 +0000
Message-ID: <40e2f836-4a6a-485a-9b92-1e42dc606e0f@amlogic.com>
Date: Wed, 8 Apr 2026 22:44:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] clk: amlogic: Add noglitch clock driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
 <20260209-a9_clock_driver-v1-6-a9198dc03d2a@amlogic.com>
 <CAFBinCBXFxefUkNj3sqUdnTz7vf72jV_FkCP6gd2veTtLHWnBg@mail.gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <CAFBinCBXFxefUkNj3sqUdnTz7vf72jV_FkCP6gd2veTtLHWnBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::15) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYZPR03MB7060:EE_
X-MS-Office365-Filtering-Correlation-Id: dd2bc379-44f9-405b-05c2-08de957d55ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bF2tdxklWc22T0twfuMIO5uJqK234qCZdo2R/TolhQbjKMfFZ9nifQV87EMyrlnFQ+sA+CGcUfebmyEs7waGyCwZJN3NEDpEq4POWL9oPK9CPmnjc58M9yW6MefFEsodHwwYDlZydI9AvF7aYKfqJg6AGJrPS0jXGk9NLAQicP9R89Ofg4v228alZUlTsnE865va4CRAw44HA6wPflkCV0d86UR5HQHIrax/kFI9z3rf+qisVZsDJSTrl8b/z9jZZDZgI2YqBfXyyY2byIO+1ktd8qBMuepObhSS5eMuUQuFpEinVksT9DujMgzAE7EqSHREzvW9cxivgynDG0SHcEic/PsmWTcHEXGQCs0qL8/55SiDyQcf3b8IMtTUM4ErSClyg+eddoLh1fcLlm90rzTXgzEVgpktpOJz8e52wKLXdmCPYVtiCz8mZmT+ek7BbZzfgfv1SFr3jchuGkSmdA0RWLnYadDUOQTy/LHoyeDX9Gj11r9cyv33Q8tj3KWiVlx1qwc9VPAoL9MargANLd4djN1XzC+BwAbNa07mbCe0eexn4ypH100mpCZHqCECvD3vfVbYhvdipVG+fdewuSXI5lLoDcwFUzSrJ56lEE/fNDr9gb49qRh5BMs6MCBbGST0A2iOFH/TAc7JBdIMS8HY+1rfs/gctPaj+xGEDLR713ok4cJgNGEoYA9FqDRb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlNoUTB1aU9aeFcza042UFdOUzY3aGtKRnV4NlFZUjI4YWwxR1hHT0xnaXVG?=
 =?utf-8?B?cW0xN3Nyc1ZQcXRVM1lpNk8zb0tOc0t5TFd0K1dQZEZBR2U0MStLZVNhQ0NG?=
 =?utf-8?B?ZUF3Q0pPU2FvQUxIQVJsS0lvNklCTFl0Vk1KNHN5M3dYYTV6TjZPbmdTVjJm?=
 =?utf-8?B?ZkI4YzhqQ0lOSDZmQzBDcFlwTzIrbGl0dy9VYWhrSzZ5bHhldXRseEtSbS9P?=
 =?utf-8?B?d0tBemlEVW01NVpwVEdTNmtlUzZYeEZpVEQzUXNNYU5veVhyTlozYXlIM2Zq?=
 =?utf-8?B?clVtTUZqYmtIcFYyRk52ZG5UQVc3bkp4cXZpamFVQTVOZXJFOW4vZ2JaR0RD?=
 =?utf-8?B?SHhOdHJhNzYwN0hKZlBwSjI2Nlk1UUk5UGk1NWlmeEcxTi9HdXZmMkVUZ3cw?=
 =?utf-8?B?Y3Y2bUU3dS9nNGV1WGF2SmJwQnlJMVF3NW9reG9vMnVxOERLYUhRT2QzMWJV?=
 =?utf-8?B?NGFaQUE5eG1TcVRYTE1Kb01Pc1Z1MkVsdlJlcFd0ZFRidmtYa2s5QlJYSFJz?=
 =?utf-8?B?K2EzMDZ5cFo5ZEdxYXVtaDU0RndIRGpsTUY4QnlYd3QveEt6RU5CRHpGTE9Y?=
 =?utf-8?B?SGpFQXBLNWN3d3UzNGZvLzIveDFiTnpqeGtJY3haQ0s2RzQzNjVwZyt5a3JX?=
 =?utf-8?B?QzkxVUhLSzlMYjQvL1o4L2FPR1NJRFRKUkFGdk8zZXFhOUJUeVlzRUk3OHVt?=
 =?utf-8?B?cklpNDcyaDhYLzVIcmZKOGVUQmtGZlVOSEVIaFpKYXNPdHpUclVmZG1iU1RP?=
 =?utf-8?B?bUZmZTRyMWVKcHI2Z05YcDZxdnhLaktqclN5WU5tMk9vWC9ndnBtM0VWOU5y?=
 =?utf-8?B?aGJrK3owd3BiTFdTVFpKM21NL0pWM0poV3NqSTdYdnRjZGZNb1p3a3hVWEhM?=
 =?utf-8?B?UkhFVFE4NSsvWHh4bTNQYUh2RmJLcDg2dENPdXQ1VmNrUVFOTUhQenhlN0Jn?=
 =?utf-8?B?WlJKMVhqazRRRlFiSndTWVdITXpCVk1sblV4blo5SzFBMkF2a214eXlJR2NV?=
 =?utf-8?B?Nk1kaGhrOFM5ZU9wblJET3NMUFNFVVFtWldITXE0cUhlTnFzZDkycVJCeHM2?=
 =?utf-8?B?U1lOclc3NkdNdUZHanN6VUIyZ3JsZWs3aGVGaVdES2l0dTUyV2R2azJtTTZR?=
 =?utf-8?B?aHZ4am9ZWmZWUlI3Wngxakx3VkFTcFVZZUpqYTB5MGlMTUdOUTF5NTc5SUk3?=
 =?utf-8?B?NjBzdU9mLys0NjVRVVlIcExZVzVaSStXdWFwckVYdXJpa09scngxY3hhN05Y?=
 =?utf-8?B?V3BMTUQ3c0ZzTVlEUTlqUFl2djJuY1NjL2xFS3NBdVNkZmhKM0h3VnVmTDh1?=
 =?utf-8?B?dU1SNTR6c04ra0xuWmJzZGZYbjE5ZzJEYUlkcXRWN25WYmxwa0FKYXRuZ0V2?=
 =?utf-8?B?TUtKS2V0NjlQeGdLZDFxMGMxb0t6L1hqL0ZnS0l6YUlYcC8wTmh5NHJEWURD?=
 =?utf-8?B?akczbmxQVEJKcGtwcWRGYlJjeUgzamlQU1B4RU9zdXJ4eFNUclVySGVnejU1?=
 =?utf-8?B?Qk1kL3YrWnM0dFpQSXArL3d5UVBWU0hGRGRiYjBKRXRQYWdQNCtpa0xacXI5?=
 =?utf-8?B?QnU2TzRiaXdMVGRVMEdETEpJS252Yk1Dc2hWSzRmRzJSRWFTVGVTZWlRVGl2?=
 =?utf-8?B?ZC8wTmFJVXRsMUJKV1VVTzJuaWszd05iUktsVHFUOU5EQ1NxMStoQ2tTRFRh?=
 =?utf-8?B?MTM0dFBHcTdWN0w4RzdreU1ZZm9OVmd0R0FKS1pQeUh1ZmZiTTBLK0NpSlpN?=
 =?utf-8?B?aW1pZW9JYjRiU0NhQXlqZThGdXJadGJzNGR0TXkzRzBPMnErRUxqcVcrUVc5?=
 =?utf-8?B?WjFoa2p6YmJ4TTNTOWxkWkxjbTF2NHZmMkVleW5JdkV6SkF4RnFOVXAxT2p1?=
 =?utf-8?B?cHZzcjl5Z29sbWs4OHViRkxzS2Z1ald0Y29aYTh2WGZZendvQUhvWmhCSTE3?=
 =?utf-8?B?cUVsNnRRUXFPYTZBckozd3hDV3JoU0ppaDJYZHZOWXE1VTJhZkFkbnNhanEv?=
 =?utf-8?B?NFlXdTBaVS90SThINDhiUHNyQ2VGWm82QVF2WjlCdVVWZm1rbVJIUUFVWFow?=
 =?utf-8?B?Ujg2N3c0VExuMjdXZjlzVW41cEZBdmVGZXBXU25MWVd0V2p3SkZCRk5mRG8w?=
 =?utf-8?B?Z2h6ay8zSVR5SlM0bkJZQnlFN0ppRkxITGpaV1o3UEdIM1VtUUZOekhWWUdY?=
 =?utf-8?B?N1BMUWJycnRlQkdiTHVMZkw3dS8zOS9MZ0lyZkxsQzYzaEFQbGdweEtmWDZJ?=
 =?utf-8?B?T2gycVFLbnlES1JqVlY4Q1pHM2ZpaGZ1MTRuWXZVeE1rUTV4QU42VzRkcUJN?=
 =?utf-8?B?Q2s3VFJ2M3l3VnJ5cDFuQTJ2SkhzMlRpQ1J4ZE1tU3ZabVcrUU9RZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2bc379-44f9-405b-05c2-08de957d55ee
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:44:27.9129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVlpUP3xr6Iu2zwsHYgcsFEYgMiVMBGkK8/q/OMEqUNe0bYhB4H3uiDqwJx0S47kRh4OWvR9gdqQ7qx4g03qvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7060

Hi Martin,
Thanks for review.

On 2/10/2026 5:51 AM, Martin Blumenstingl wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi Chuan Liu,
> 
> On Mon, Feb 9, 2026 at 6:49 AM Chuan Liu via B4 Relay
> <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
> [...]
>> + * To prevent glitches from propagating to clk_out and affecting the normal
>> + * operation of glitch-sensitive modules, the no-glitch clock must be configured
>> + * following the specified sequence:
>> + *   - When the clock gate is disabled: configure it as a normal composite clock
>> + *     (any glitches generated will be blocked by the gate and will not
>> + *     propagate to clk_out).
> This part is easy and makes sense.
> 
>> + *   - When the clock gate is enabled: configure it according to the following
>> + *     sequence to suppress glitches:
>> + *       - Configure and enable the idle composite clock path of the
>> + *         noglitch_mux with the target frequency/parent clock.
>> + *       - Switch the noglitch_mux to the channel prepared in the previous step.
>> + *       - Disable the clock of the original noglitch_mux channel.
>> + */
>  From a previous discussion it seems that in reality things need to be
> handled more carefully as you previously mentioned that
> CLK_SET_RATE_GATE is not good enough (the description above is what
> CLK_SET_RATE_GATE already achieves).
> For the more careful handling Jerome suggested using the clock
> protection logic: [0]
> You wanted to try it out at some point: [1]
> Is the verdict that Jerome's suggestion did not work? Can you please
> share some details as to why it doesn't work.
> 

In the actual use case, this switching operation completes within the 
nanosecond range (with a minimum clock frequency of 24 MHz in typical 
scenarios), which is why no issues were observed on our previous SoCs.

Thank you for the reminder, to be on the safe side, I will introduce 
some explicit hardware delays in the future revision.

> 
> Best regards,
> Martin
> 
> 
> [0] https://lore.kernel.org/linux-amlogic/1j1pnp5sg7.fsf@starbuckisacylon.baylibre.com/
> [1] https://lore.kernel.org/linux-amlogic/1639bb9d-9cb7-409f-bbf8-bfe4a5d1b8bc@amlogic.com/

-- 
Best regards,
Chuan

