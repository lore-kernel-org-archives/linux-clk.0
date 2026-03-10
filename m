Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022133.outbound.protection.outlook.com [52.101.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2F234D3B1;
	Tue, 10 Mar 2026 06:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773125471; cv=fail; b=LptdLfkeB72eWNKFRxy1Hm5KG1ey2zRQyj8ZO4qAUgXMS3jnEKQ5VRb84JMa2cdu47gPWt+XXlbEFYyl6l2sol6ccYLpkzZd6vwwNW2oL+ABY7Qt/HYJGyvpVhhzvUaSig5RrcOA9Wo0ehTjUiW2hJPWfp6kHmiEhSZGjuqyPm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773125471; c=relaxed/simple;
	bh=Fxir17Q+mYRc5L1Pg0NqASGJtSAkOlXjK7L8OlXJASQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ko1kUVGl5axGO7ZKE0JYHABJXQbkuMqkaxjvWnLwKiAXCGFpnojMkOUrN85AoY/iwWAaajk2BklNq9REnD4cNOa/45EYsdJ6jspO0pacPKTit98XOEbfsyqqLmVyX1b+ZxhwvhEHQ7KQ2oqs7EE67ir/DJb0U7gwJsGkSbnqFq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=JPUCChuh; arc=fail smtp.client-ip=52.101.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="JPUCChuh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wy9JUz7KmIKUBSazQURxJYl0NBoI7NTfT8UdrYO3tPF4ByMQqKsBGv7QD0GWZqes6CQkoauze1aKibRpJ2ta+qHdDtoH3v3eoNTyIevscovv5qaAc9tiLbbIfkM15pWnx8yy0ZyUxiC5L74ZCP2p+5CPJ8JHNJcWum0vqkENKjg88txWscU7hSRdrx71s3/dXEeaQM1t2SxihsP+jrVUNIKxF/2syEmJizHP5be+K7n09w9oCgezBbOkkCkB606epkUumW629mQ7umo4aTaClODURpqKKIZuR46i1TBixmuBwCsXcWD1pRh4LGSnhNAyYnS6ReSqQJJu3UnT8vGhRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQXg+B5R20VKs1LfEA3OWOHCJZuGBIDr09eE7/q5PXs=;
 b=Y25kveaIJz6Py5dMO2CgmjI2/sdPvC0ohMiOYL/0rXmi8I3sC07pKW+4Uq3gKNzXKfnfL+Zll9EpIf4Jjm4WQjZLH26zonukupN7KTrP2OJ67lImMuXE4+z195yi2zT6Y0aYbxaAGrCl44aTQzQND/60gSXBT1HIazBH7jLz+2sIfVUJibtlofE4vFjY1Cxp3VZvkZ1kFE8ESzYKtRyoMoBM9xqNi1W0w7/uvByWGzBnGwJ3pn8d7N8vQ8ZkHOiwubLKaeWAAyKNg1MmAjaCnrAoIX6JUsAUAdtDgRuhwVdjv8W6ElO/X0+DK/SOxo3IBbcChxRh+di7WHwib0IGig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQXg+B5R20VKs1LfEA3OWOHCJZuGBIDr09eE7/q5PXs=;
 b=JPUCChuhMSAfxxO1eD3QvdFFJZI3LWUe2txWtBVw6gGBIXqps+Sdgot1g+QbjJokzIOyMcDuwqvfJdhWnvxWU7GqXOFeY8g6BpEt3Kc7RqbezNI7Iehr+l8NK84U/g/HDOwF7I/oO0heTmMdu6WJXtMxmMVp2z9LLP6ao314njowFF+EjsIIW2umpXIaXhqnsTG+8AAJesJOX+yTdsF50DseNL2cEOUEQtlcMzIYKFuq0ii3wOS0LnIKfEX+w/Rh62SvgfbBDBTmdck5US/VdB66gp5+HFUpCDUUjVyVuj8QMFoNH97aUPLRuZbo1lVo08NNo1O8CnZtcABKa/Yp1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KL1PR03MB8161.apcprd03.prod.outlook.com (2603:1096:820:ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 06:51:05 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 06:51:05 +0000
Message-ID: <fb47c7f7-9eb7-4895-8652-3b5329d23752@amlogic.com>
Date: Tue, 10 Mar 2026 14:51:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3
 parent clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-3-jian.hu@amlogic.com>
 <20260306-monumental-nuthatch-from-avalon-bf108b@quoll>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260306-monumental-nuthatch-from-avalon-bf108b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0195.apcprd04.prod.outlook.com
 (2603:1096:4:14::33) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|KL1PR03MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: c814a86a-5006-4415-aff4-08de7e7166b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	ZxObZYW4FjRGIuVueQmc+B/mEB6jx/fWHtsEw0v/fJddLX+82NePUr6TnI6BpKMW4UXw/JnE49p4kCgSyCr9Ik2WwfuWamaprSRiABDAipBwYGNWrd89utAU+3v73PDOiRwnoqNmBb8h2UrIoEkuyKrt3Lhgo0LQarp+Un5YNF3ayriTN3ZpxGxQfPOfiBhRfQK08EnAFHcB48+wG+r7Ax8eBm/DMprBrOSLqBIrVGvr/Ouv3jnOwQ09Tcd3Soic9ab/Pt8e++YrhUZaxVIloFy5esiFWKadRy3400cET+RlaU1lnQJowt8jbAe36zApGIiKSNQCgH4m9YO7IZSjKJpv1+Hep4SgcmddwOSCzp0H/fp5huHib10u5XNKIxs0VHwspdyIwkm36T0UjZz90Zej7cDNV+31vVLNqAQizCt2w4dpPIK36qsoPHFJxkmQJzOiL6cfjLyNswzuxuaLiae2dHzD/HqdprV9P2FcEfR+AEhanPzGp5IWkddSMQ0wOkvn27HDDR/KtU2rAVqKL2LbwjFg4rv9mmq5CqzEB+YyoP/If03Gr6plVQqMy/6HC6p76yRiimMBXj9bmL56Hx69VlPNNIXv1rM+cUxnmJzrpiDTOHchOZeWVtHQ5A3e6tJ8XhfMQWa8R83p+lJqmUuO5jNdqyaBXj/NC9FUiIzl/CZYD1noL3Sd4dwiZNhcipcJPYa1j2fjD/WyOMzV1ys+SktWH0TzAD+d6rMk13k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmZLK2NqY2o2aHVvMWphODJhallyRXE5UlVYZG5mbC9ra3RRd1hOUmVnS0ZN?=
 =?utf-8?B?WkFRYmoyQm9iNDh3SFdTN012SU04YWVWbU1mVWpVTFlnN0pSbXJaeStYdG9S?=
 =?utf-8?B?VEtYMlJISjFmeC93Q3I3S1VSRVNOcjlsK0ZmSDVVQXIxNlpwR1J4VGNoNUh4?=
 =?utf-8?B?OWk4YmNTZXdNUlJrZVE3VElDSWhsRlBXVUVlRHV3MWZWTWtVVGxnZ1UvZ2pH?=
 =?utf-8?B?VkFxMkRUb0NPbkVHeVVySUVtbERpeks5cHhyN2tPMHN2ZUM2S2kxWWRPQW5E?=
 =?utf-8?B?bG4zeXk1V3lhRjlGZzFPYUJ5cUtqbWVQQW5QRGJrQlVxeElwVG1QSEQ5SEth?=
 =?utf-8?B?QnZXRCtDKzBVM0tHbXFsbzVRenByL1U0RnB2alR2MCszUmkyb0xxYzA0bFdV?=
 =?utf-8?B?bVkzU1Vrcmt3QzR3bng1RlVGOG9XY1dNczE3R0xqMVJxKy9jRUJ2dWM3SEIy?=
 =?utf-8?B?SjUvNXZLVWtlZ2t2bFpTY2ovK0Z3dUpTRmtFUmdxY2hUTFkwSkN1N2RLdEJs?=
 =?utf-8?B?OTE4eHRud0s3c3VSQWpaeithOFZpM1hkMXlGTUMxZHp1b0JDZDI0MzBmaWdl?=
 =?utf-8?B?cHZTalB5d2l2RDVVcnVoOWZ5R2N6Z2NNVHU0ZkhTOE9FRlJzTm15TzZ5ZVBQ?=
 =?utf-8?B?V2dFRmlRN05KMW5yQ04xdHRTY1RRRzk2V3I2ZC9LdFl3T0JZLzltRGhvSlBh?=
 =?utf-8?B?MXBaQ3luZUtkdVNlYlpueFdqWDBXdk9aSHFFQjdmbTM0N3ljaC9jalZXWXQy?=
 =?utf-8?B?bFliL1l6TlhHZ1l2cTBJT0s5UUZqYzR4cEZaMi9GRmtuWjVmbHUxcldRNG02?=
 =?utf-8?B?cG9RdkVyaWladzlPZGdEeDg0amNveCtidUxSYzM2azF2R000dG9HUG1ZRzVw?=
 =?utf-8?B?UmJ5ZGZFa3dSNWxXYlRhRUhIOUZKU0tsd1NNUGdGQnJjUUlxMVRFYndId1NE?=
 =?utf-8?B?bjZHRDVsNHZTVjRTREVubXFMMWlYK2xmc1cvWXFhSEtIK2lHdmVTcmxCZVg2?=
 =?utf-8?B?cytCd1ZiZmNUTDNoSGtGZXdYNGlWaFRnaVlURVFkNU5reHNmWjBIR2EvL0VS?=
 =?utf-8?B?akJGM2huODdoVmFsZEtBdHlVQjB2cHBydFFKTE5jUFpPMDlNL1JTUkQ3ZTl3?=
 =?utf-8?B?cWN6OFhDVlJrc3d4Ujh0c0doMytteGxleTMrb2U1SnV3Mkl1WW1GbDJRb0JL?=
 =?utf-8?B?VnlwOW5BU2hlSFdFNTVzZGx4bGVFNnZGVzNqb1JUQURBbDdxRWRvRWIxN0pa?=
 =?utf-8?B?bE01Q0dvU0kydkhOMS9MNlYzSnpuM09uOWJzTXNWVmJIRlVSVzZYWWQ1YTNG?=
 =?utf-8?B?b2lPYkViTmxlTnBWWm5HL0J2aGRWQlJlaVdGdGlQa0FESURSMWRWRmVIZHlo?=
 =?utf-8?B?MmRXMDNJcitzRzdGbEhuNEVpWWNkU2pCVURQdTVhbmJzQmplMXRmckxOY1Va?=
 =?utf-8?B?TWVZVXdXQUcxY0pyandsWjdpZitEWG9YQndmb1FCSFRzcXdBYjBEUHhFRmhS?=
 =?utf-8?B?NnZRQ1UxSXBHb3N6Zm1vdUtqL3NTNGJqNlN6VDllc2VjUTRZcGJyb0tqOEtQ?=
 =?utf-8?B?NmVoZUZLN01yTXMrekpheWtoUEYrNmhWTm9vR2VINS9ObUszdlZWb0lLRWhp?=
 =?utf-8?B?R1ZuNmhJSi8yR09UdWVrRFdrYTFyOGNhLzZ6VW94VW5hY0dzV0hIdEFZeW1O?=
 =?utf-8?B?VjRJTmRRc0I2czlRVEd5YTBjVSsxVE12WndKR2tMb0kzU01XTGVXU0RkL21D?=
 =?utf-8?B?YWM3aWxhdURuMklmTEU5SXNraTJYVWVabHlBcG84d21RUFpMOVlZNUJGOGg1?=
 =?utf-8?B?YWVYaHZaOVNsZzlSN2dlOEczaW9UMWt2akpuVG9WNlc4KzlQbXZwdDR1VGdG?=
 =?utf-8?B?dmN5SmRJQmNNR2ZzVThZSnk3ejJXQkFSMllzWXhWbHRmUURGNVB1c2pPU0VS?=
 =?utf-8?B?enBzL1lkempobDFGNzBLcG5KNUhzeW91SzR3eFgxQittd1J6M1lReEppTWNw?=
 =?utf-8?B?S2NjQ1lGOUtBZXNnMkZnS012amdQdjJRYjhVL2o3MnRwMGtLU1BzdERBR3pI?=
 =?utf-8?B?bnhQVXMwZUVHL0dZU0t1ak9aek0wSWt5V1JjNDNtTWdPR29nWFhEZUtkQ3ZE?=
 =?utf-8?B?Y2RnUFZqb0plTFlpaU9zdklwZHp5R1lCbU1PVzhEcTQ3QkFoMXlQdUMxenJC?=
 =?utf-8?B?YXhKVGFGR2M5ekNBVkc3NWlnU0h4SmY2NEIwL3FNUzJFdHJQQUszSWFKQU9S?=
 =?utf-8?B?MVdkWWJWdWUzZGdCZTdiZGdOL0pPZE5XcnJSVk4xZG1SUU9NTVdhYTB4MmJQ?=
 =?utf-8?B?U1RJT3U3ejZlN0R5ZE1NZUx5QzNWT1YwcENISnlTL2lwODFYaXBFQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c814a86a-5006-4415-aff4-08de7e7166b6
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 06:51:05.4883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhWDWMeCNHHscSUGcwn881PcLdZl2po+bs/cP5zmHWp4wOzT+frobqFvPe68zh4U5V/6ADR+UhytQxUPTGOKHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8161


On 3/6/2026 4:12 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On Thu, Mar 05, 2026 at 03:43:26PM +0800, Jian Hu wrote:
>> The mpll3 clock is a valid parent clock for sd_emmc and mipi_isp on
>> the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
>> Add it to enable proper clock parent configuration for these peripherals.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   .../bindings/clock/amlogic,t7-peripherals-clkc.yaml       | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
>> index 55bb73707d58..27cc1f331587 100644
>> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
>> @@ -24,7 +24,7 @@ properties:
>>       const: 1
>>
>>     clocks:
>> -    minItems: 14
>> +    minItems: 15
>>       items:
>>         - description: input oscillator
>>         - description: input sys clk
>> @@ -40,12 +40,13 @@ properties:
>>         - description: input gp1 pll
>>         - description: input mpll1
>>         - description: input mpll2
>> +      - description: input mpll3
> Nah, ABI break. You add it to the end of the list or provide arguments
> on ABI impact.

The third patch in this series enables the DT for the Amlogic T7 clock 
controller.

The clock controller node for amlogic,t7-peripherals-clkc has not been 
merged upstream yet.
This change modifies the clock index order, but it will not break any 
existing device tree since the
amlogic,t7-peripherals-clkc bindings are not used by any upstream or 
downstream DT at this time.

Therefore, it does NOT break the ABI.

The last clock entry is an external pad input for RTC and it is optional.
For logical consistency, it is better to place the required mpll3 entry 
before the optional entry.

If this change does not break the ABI, could I keep it in its original 
logical order right after mpll2?
> Best regards,
> Krzysztof
>
