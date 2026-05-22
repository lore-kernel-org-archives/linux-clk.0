Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023073.outbound.protection.outlook.com [52.101.127.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86F6358360;
	Fri, 22 May 2026 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779436177; cv=fail; b=SwSgT8pjN2TFlMTm/sE/mTX1wydiDXY9G5DrqmffhlDiyheJjgBh4qGFNEXXcUCfaj2oqIIZ9sQyIN7fJH0DRs0G4ArAZ5Z5koKWV4oJw85HCZV4MA13+63t0TW44SCafvPZrzVG8UgMGidVqLX9NiDrW+iC+HaiAdI5XKlP5l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779436177; c=relaxed/simple;
	bh=TPifk2s56vdWhVoGEsS5OgJSIKE2KBoxAQ3Lzn7C+G8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LI24zWe4iDTgC0nvjJukDaP4U3I8pt3bJ/V9YTBgvtJ1WPPA7rLx+bBcscJGle8mD8EONQPGttK64dIBn9pD9OenamGIANxfjwHA+UaPjHsfzaFJ+Wnn+tIlNpiI5jgranJaRLwPPTWudlNdZ+H/aaskXJFzCRsZBU/sPooVPAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=cJyBM3hR; arc=fail smtp.client-ip=52.101.127.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="cJyBM3hR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCew8Vg1hNtrIeDr1RNmDqeHwj23gIStc7METKQn8UamzHqiyVHle7Gs3PKxNwVVr2YjRfpcOBcf7Kj8DGBWtcT2wR4rbftqThHxNIWyafz3HrAZ+EVH3uJL80Ud/5zJhDsytKDjTAHhq3lAh7yMcOPFtZb7fD9j+2QiWpSCP27yaR5Ue/SJSNWHINrrlkJkdHAIQBKGeAMBF4wxDyUDrXcdcKld4M9146CTDfl9SKHSTvrgHaPONiJ3PqvgTIyNSbAOWBRYpAuO1hnvYDVdOrOeoiosPFBgP0sJOTXdaiRhDZMqaIjBmuA1t0VSXsGiadFjyE5tOkvsqkGORAMWsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRufCNt5hSeczlCTxErBMAcYzL3RTS3A9fv99dGMPvI=;
 b=OLgHRJMx6+C+BDpuLUkEpaLve1IgsaE8u2RdzOPlfWngan7ooIwukbp4uDrgq3tUZ+NreMr63erEnoxLo6BqRIw6JLGapfyqRhyAgk8uQxNoGM96aQxJwiLzuWRaFmPBWtm6WCD4UKOwG79NgQ10RJp5wf/1F9/+XDs3eYFUlTzwbY88tmH2iPzWIZJHkekipmTVAw97cNfo8x+gLM7EYMJnEbV7tAGGeultzENHFYFZfM07VFLLLI2GZSPXAgS7SeuoI9TCgBDnmLQ9TGSAmqPQO6zIq38HCSV3TvU18clDWhYcnCir+/jb8/gpOdLH85LxFlyUcF21ZbCB12VaLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRufCNt5hSeczlCTxErBMAcYzL3RTS3A9fv99dGMPvI=;
 b=cJyBM3hReWRtX/+Lya6e9laa/L94uxlLKBxZpSMpV+z+u/wIVSP/j/tpQU9WpEcQgIz8ZaieuBXnzBqYgZEGdSorsbB7P7xUQNKlwlkrxJ4X7O3+tbg6oV30+T2CGHuwI7XvHioCBGbzEDPNWdyz3ozBQ3/VdAVKLhZMKDC+X+vuunAPYcDY1q9xE2uqW5sNJR2oilY0vRZSjBZSsy0VsQjSUzN1Dgbkki805ZgymME9j/89vYEX9GGbkK90TOKDm7yfMb++0vdep9dE5T/dJG0gnX0j84qAB0aPFexNPd5/W6+rdfDVkpsRYeqRyvsCyrMtdyH4RDc5GP9As77ybg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYSPR03MB7369.apcprd03.prod.outlook.com (2603:1096:400:42c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.6; Fri, 22 May 2026
 07:49:31 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0071.005; Fri, 22 May 2026
 07:49:31 +0000
Message-ID: <4779aae7-f47b-4cb0-b2cb-1e021fb0cd80@amlogic.com>
Date: Fri, 22 May 2026 15:49:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] dt-bindings: clock: Add Amlogic A9 peripherals
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-3-41cb4071b7c9@amlogic.com>
 <20260515-augmented-cyber-puffin-4db20f@quoll>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260515-augmented-cyber-puffin-4db20f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0230.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::16) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYSPR03MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: a36c85fe-ddcf-489b-dbcf-08deb7d6a8c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|22082099003|18002099003|56012099003|3023799007|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	x0IQ/6N/ZaXMcFIvvcI2qVnkDefNc/FA8lA9Eh8kfoNZMPKi3Ob99ojS3qWh3tUREdJtpfG01w3wwybBlxMNKPK89yjy1n3AsXlgxpZurfPBsb7BL7e48Pc92k4B1GcTM7yBPiorKsO4xr1Ly0/TmD6f5/XFUkM0bCkYs3jXdwBC5MSAvnhjlrZp05GaiFGri6a39GKPZWK46pXw1xiJa1faQsifrpw+MZDSlc1wtZv3ibppk7iQ1ojCrZTo3DAAtwsEPeii2uUdMO3LQrqvQ0Kt3b38i+CCs7ccw3IDwD2W63PHIS7on4lj4E0ImhRiqwp7bErjLPn5AGpsPQFOiyvz0pB4Uhs+9QsKoTYbRCDYBo/cqZsU8lFNSrB4aLYXkGW6yFEEYlCYSiwmm1CSl77hVU0yFylPWMFOydOKhJfTweMsm7xUlzVQ27c0KAm5c8orpCtmhq5Ac95ec2lzqd7s96llyTuJ5u/SIgqXCMMl8MX4AW2VWLzobwRSWKvpgaa68p4Iw5piAkHpeC794dnVV3ZCdpOoMBy5UzpDO/m+l+UFgsbVrgVReqJhpE4dUeWliw2UVDX3kbOybytGIjcsyQ25psl+N2a1oHrpA4+2RmI8okuYptUwXLvxQjDTcKnzZNJwEmcVsG7Sh8n96Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(22082099003)(18002099003)(56012099003)(3023799007)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjRldzhEa3JlNGZ5SEdWVXZiUlBlaUNkUCtSb1A2SVFFNEZCY3NnL1lHZkxB?=
 =?utf-8?B?YTFhZGFKYmxuRkxrWWx5TTRvZFhjbUFiRkJQaXZQQStqUXNaZThvcVQrcC9W?=
 =?utf-8?B?ZzkycHJIV2JZNDh2dWRqQTBhaG1jSGtFQ3EyZHZWZUtQeW5JSDVMVVZXd3k4?=
 =?utf-8?B?aDhGRjRiYW1LMmNnVUhMajlaY012dDZJL2VXTTl3M1doRmxUVkEydU5wZm5P?=
 =?utf-8?B?SzJySVE0dG93T3VrK0w4RUQ0Ukw3SnA5Q1NwNmFjaWRoZTRtVjBuMXRFeUo5?=
 =?utf-8?B?U2wxNFQxaFpsQTIzUjBZQi9CUEgvVm1pU1plbmJ5Q2VDQklhOW4zcEpHdk9C?=
 =?utf-8?B?cU9Ieno5YTU0U3dzSUhLVTh4cU5CRXF3VGlQRWJlbUQ5ZGI3VjVjdFZzSExz?=
 =?utf-8?B?dnZCRU45cEQwSlByRkh5eVU2WENtb3ZYc3Z3cWJGZjJESml2QzJ0UzR1V3Bn?=
 =?utf-8?B?TEUzWHVualVTeFdTS21RVWFOb256TnI1SWRLWWcrL0t3ZExrOURPYmU3Y1I0?=
 =?utf-8?B?ZVZobkExeGNIZ2x0TzBOOWdIeEkyeHBBZ3Z2TXczSTliaXNkblp4OFdZK2Fm?=
 =?utf-8?B?WGo4UzBOc0VOUW9SQlZLbVVNbHRpcndXNm4zWUFYOW1RRHRYRytDRis4dE9O?=
 =?utf-8?B?TXFYWitvNy9LRFZKRDgzYUhDVUFKOVQyTmgrQzZoL1FBeW1PY1JTd1UyVVRQ?=
 =?utf-8?B?NG5tK3RKaWFIQUh1Y0Q3K3A2N2RmSlRLZTJlWWpFSkNYK3J2QlRNK0toa1hi?=
 =?utf-8?B?ak5sTnpNRVdreTRPTFR2ZlBlN21lN3RxOUhuZGJxZCtOUFBKN2FPblRrWDl6?=
 =?utf-8?B?aitjMTRkUklBQ1hXU2JpOU9ZTG1aR2dLVEVWbWpMbnExNXJGZmhQWHQ1QTRk?=
 =?utf-8?B?clFLQ0JuZGViZHBIN1hOQjJFNWRFMXE5cFNIaXJwVitqVklhcnRQeUg4bHpo?=
 =?utf-8?B?WlNTVGFGSGZvQnZGQmlHUUR4ZUpBcCs0QUVRS3Z3VkxQbnJrVzRyTURvS2pK?=
 =?utf-8?B?MEh6bUljT3l2dmlmV29Hb3ROLzN6ZWhhcDNjRjhnQ0VJTjFNMVlDVzJwMkxD?=
 =?utf-8?B?dmlCVHZKc0pLT1JkN05nRFNLY1M0K0hKN0MzVmpUbVltVEpFMkZCUG94ZEtK?=
 =?utf-8?B?ejlOb1M1VWN2OVJQeWlDQjdsYjhkUGExbDFwOUMvdU5DM3VmejRjR3g5OGs2?=
 =?utf-8?B?MmJwMTZIK0tYdHdQOG1vME9JWXozVzJVMnJyMHVRdjFTRkRpbFRlT0dabXZI?=
 =?utf-8?B?b2VwT2d5THdZenV1VTk2MnlQVlIzVU16UlFQaTl4YnVwOWh1TVo4d293dzRE?=
 =?utf-8?B?YTcyVHl3STR4SFoxbnVYdW02a2lid0VkenpNOFoweEViVjMvY2EzMGttd1VK?=
 =?utf-8?B?T0FEUmsvM1BjaTMzbXJER2FpNEJaMW94NzdJUEVkYTVZemhjR1JuS0RiSWx2?=
 =?utf-8?B?bVhmMjJuN3J0ekdJNjY0Rm52V2JPMFhHNndLRzlGMUFVWDE4ajM2U1BFRDBu?=
 =?utf-8?B?YzVKM0RicmxpV1VsSEpyVFduNnNwWkVTYTcxL0ZNZ1h0dWF3VDN3aUE3bVJ2?=
 =?utf-8?B?L2RrYU9zdmFLc0xMSjdGZnBqV0o1dW04L1E4dVNXWldjRlZoVEprM2ZuRnJy?=
 =?utf-8?B?TDlBZGpnQldMakI4K1FkV0tWSXg2dnBmKzlQTlJ3WEF3NWFLVEJmVm81bnhp?=
 =?utf-8?B?dDVsblZMK2dldmJ4UEFJczlZQlZhUWxyVDE3MmFTclV1UXpNNW9GbEhPWi9v?=
 =?utf-8?B?MWpRRmNOZjdOcFZOOEJqeGhNR21GS2lMcUdyV241U0JzR0s2OHpoVGN6eHlp?=
 =?utf-8?B?dy9zaHo0SVI0Z0JuUFFqTDJxSHVqT2lRQUdEMGhJTzlFR3VlMHpRVUtPS0ZJ?=
 =?utf-8?B?RDBsMkFHRWxGckhYWkxITmZVSW9DZStkVWFIOXpxbUNOd1lvcy9lS0xGdUpQ?=
 =?utf-8?B?THhVOW9ZeG0wbFR3UGx6ZW9oZVkxK3YxUHMzVlJxRklSdzdHZERXVWx4UG9t?=
 =?utf-8?B?WnYrVTJwRGdtWDdCRlpPbUdRSndnUnR6MnI2NGlJQzFzR2t2QVY5eHVLWkd4?=
 =?utf-8?B?OTdkbi8rcm9pUWJhTVhUWjE0dUxDM1BBQWdISTMvN1dXbVBDellZN2labkY2?=
 =?utf-8?B?a05tb3d6UktZTk8vNGJ4OVlidVQ0d0gzOWV6L0p4VzNOcTNEU3FuT251anVk?=
 =?utf-8?B?YitNbkVzKzNtK1VVY3p5Zkp0ZTVCbWFlN0tmNS8vK2pCeEkzMURkLzB3aGhi?=
 =?utf-8?B?RUpZVkt4K0NNRmRia0I1RXUrZ2ZsSCtFenhabS9VTWdIRmYrbWxick1JU2dm?=
 =?utf-8?B?eWpNdGIrQ24rM3V3azRBa2FIMDlKSTlOeitMcEtlUjlROTBwNitHZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36c85fe-ddcf-489b-dbcf-08deb7d6a8c7
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 07:49:31.7166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlUHWuOmko/p475nQ3MrwtX+Scq90M6W0/CnQ3fPkNCLtzcHWThLLQ0jR8lY5+0a2Jk/K5SULLs/uaCvYLgpGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7369

On 5/15/2026 4:10 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On Mon, May 11, 2026 at 08:47:25PM +0800, Jian Hu wrote:
>> Add the peripherals clock controller dt-bindings for the Amlogic A9
>> SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   .../clock/amlogic,a9-peripherals-clkc.yaml         | 150 +++++++++
>>   .../clock/amlogic,a9-peripherals-clkc.h            | 352 +++++++++++++++++++++
>>   2 files changed, 502 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a9-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a9-peripherals-clkc.yaml
>> new file mode 100644
>> index 000000000000..97e2c44d8630
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,a9-peripherals-clkc.yaml
>> @@ -0,0 +1,150 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2026 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/amlogic,a9-peripherals-clkc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic A9 Series Peripherals Clock Controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +  - Jian Hu <jian.hu@amlogic.com>
>> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: amlogic,a9-peripherals-clkc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  clocks:
>> +    minItems: 20
> I don't think so. How they could be optional in silicon? How does
> exactly work from silicon point of view?


These are internal clocks from unimplemented analog blocks, and these 
clocks will be added

in the future. Marking them as optional is indeed incorrect.

Only the last external clock is actually optional.

I will fix it in the next version.

>> +    items:
>> +      - description: input oscillator
>> +      - description: input fclk div 2
>> +      - description: input fclk div 3
>> +      - description: input fclk div 4
>> +      - description: input fclk div 5
>> +      - description: input fclk div 7
>> +      - description: input fclk div 2p5
>> +      - description: input sys clk
>> +      - description: input gp1 pll
>> +      - description: input gp2 pll
>> +      - description: input sys pll div 16
>> +      - description: input cpu clk div 16
>> +      - description: input a78 clk div 16
>> +      - description: input dsu clk div 16
>> +      - description: input rtc clk
>> +      - description: input gp0 pll
>> +      - description: input hifi0 pll
>> +      - description: input hifi1 pll
>> +      - description: input mclk0 pll
>> +      - description: input mclk1 pll
>> +      - description: input video1 pll (optional)
>> +      - description: input video2 pll (optional)
>> +      - description: input hdmi out2 clk (optional)
>> +      - description: input hdmi pixel clk (optional)
>> +      - description: input pixel0 pll (optional)
>> +      - description: input pixel1 pll (optional)
>> +      - description: input usb2 drd clk (optional)
>> +      - description: external input rmii oscillator (optional)
>> +
>> +  clock-names:
>> +    minItems: 20
>> +    items:
>> +      - const: xtal
>> +      - const: fdiv2
>> +      - const: fdiv3
>> +      - const: fdiv4
>> +      - const: fdiv5
>> +      - const: fdiv7
>> +      - const: fdiv2p5
>> +      - const: sys
>> +      - const: gp1
>> +      - const: gp2
>> +      - const: sysplldiv16
>> +      - const: cpudiv16
>> +      - const: a78div16
>> +      - const: dsudiv16
>> +      - const: rtc
>> +      - const: gp0
>> +      - const: hifi0
>> +      - const: hifi1
>> +      - const: mclk0
>> +      - const: mclk1
>> +      - const: vid1
>> +      - const: vid2
>> +      - const: hdmiout2
>> +      - const: hdmipix
>> +      - const: pix0
>> +      - const: pix1
>> +      - const: u2drd
>> +      - const: ext_rmii
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#clock-cells'
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    apb4 {
> Same comments as other patches. Do not come with your own style, but
> adjust to mainline. Do you see this anywhere?
>
> git grep apb4 -- Documentation/devicetree/bindings/clock/
>
> So why coming with something COMPLETELY different?
>
> Best regards,
> Krzysztof


Thanks for pointing this out. You are correct that there is no precedent 
for "apb4"

in the mainline clock bindings. I should not have invented a new naming 
scheme here.



I will rename this to use the standard "soc" naming that is consistent 
with all other

similar bindings in the kernel tree.

Furthermore, I will search the kernel to see if it exists when naming.



This will be fixed in the next revision.


