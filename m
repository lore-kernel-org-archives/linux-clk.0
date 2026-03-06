Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022135.outbound.protection.outlook.com [40.107.75.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56F626FD9A;
	Fri,  6 Mar 2026 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772784643; cv=fail; b=bKiuUt+/zVaM7RmRjklT7fpknQf33XS53jSq9VT3Kdhjzj8ATIe35Y8SvE/nQqNYfmtVj/7BgvZtOfLV9CVkvXl07Il0Rarwn9AUy2l2pZk6F4CzYPLBM07Vp1B5e+pQoiVQO8Df2OQl9RkBRW3QDIWbf2G/xNiUlYD369MvHuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772784643; c=relaxed/simple;
	bh=wEV9OXIQKpZOzGo0dReDiD3HeMUCTKXcPcaIJiIFwNs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bace77X9Sv2GGpsevOrL2svKWwt0ZMqQ/irwaErC6lXMNxC4cYYRJKIwy/OX8Ks9AMF5oEkbOvx1rkQlzww8zJVCeFUZ6IkcsV8//o7kKEr7b6/141nit7Tqpo45ZQehUn/PqbrHNUyjjNhi/v3HExO/V/ElgLMC9NKdT8z8QUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=CdhA918f; arc=fail smtp.client-ip=40.107.75.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="CdhA918f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhtV4C3LdS4XTObOBFapsQM3pKygXyWKjtby/lxtMePuEA3Ul1PFnJc/PtOxCzkbjRG4BAe3lwxYfiMDKZrBEvxPoQAslgtDtbKmPBzip/JNDCVLf1/ubwkfJAXMfxTHATP+1kKLnPVMJLqnx7BiNGYbSLPF/1Bv8o08DKxGNyzUuh06o6JQyoIe48Z0lj9kCaZ5NX+HHvP5MMk0x/CWTZ/N7Cg5SpENdw+2uGYblBbrM3AjYe08nlcHZ2rPMtSqB/pyM9NmG3wt+EJX25KGvI+3Rwqi2AHDfGRoiQ8k4dFuBmz6FllAIb9YNn2JsUHj5eusfR7hyzj6vO818XOW4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0fZNd82SDdZuURddh7HRHRfpYoRd00CDTp0qOdNMIM=;
 b=d9FxnM/Sgh8WTd2ZiXcWy0EEctIg6MQbOrXXoohatObKI+SXtmxUnozOlKhwixYwWZwUfEuwOBDp9Jh+I8bawgjW3L32Oq4uMlwt+P9Z1YhB2nUwAsHqAdRntXuJ9N+N/LvwJTjZAC3sAHqnzIERoP6qA3jRk2MTht7r4Zw85lAfdt52/4brpnigtLIHRn8dudq8C0gObIOvOoHbGb0/jyG/T20J5VpUGbRaeCZkqqykEvSXWGFiLWeVFTPli1i8Whgxbhg6z0dQhft3/48lp35ksbSxDGEDvdPX6Av+xe2Ba5I9Y7OXZkd170Sldm4vMTrVi0sMb8QeZ+LT+iFfVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0fZNd82SDdZuURddh7HRHRfpYoRd00CDTp0qOdNMIM=;
 b=CdhA918fmLrt7tYkvrpeZoW8WXfXP8gFXLGaRjnUWag5Ngt2DLcLO7s47unfogqu0D2Jap2PzNWw6Z3c7X1JdDpybPHwKgLvh1CEh4RXORiiu2gz3ZmEvkqqzf9MRVHykqyre0cm+D86IIr1n4P/+BVlPzMhve/K2Q/0+iqlnYvpEDabhUJ3bU9d5k8/6N17O6hfnZo7n3RgKjn1tARxR0MAMuFyEMngY8VeXNQZ8oe5FUVhkOnUJn1rXxG+sdUUSsrr9k+EMUHXronczY7CQLMYfyzAI+th8cvR76a6UL6fr1QNbskSC8JDhWN/xe2iKMSZ6mHj3aN1YPCapswZwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEYPR03MB9374.apcprd03.prod.outlook.com (2603:1096:101:2d1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 08:10:37 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:10:37 +0000
Message-ID: <f5d907f5-e8a3-4acf-bf45-a373db9b60ab@amlogic.com>
Date: Fri, 6 Mar 2026 16:10:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: t7: Add clock controller nodes
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-4-jian.hu@amlogic.com>
 <e8d1ee42-2e57-423e-a431-90b241709158@aliel.fr>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <e8d1ee42-2e57-423e-a431-90b241709158@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEYPR03MB9374:EE_
X-MS-Office365-Filtering-Correlation-Id: e180fe0e-c2e5-4d5d-0375-08de7b57d992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	qnu/tNsqT29uYUQpDyYkxbAP3IX0gvNpVysFBdiqHgMvwHjKOFaVMoDAo5nkflvOSByf8WInj2q923UqtZ/X6HOChcPt/YWLnUAzm/+k0YLQDL4Tkjsmg7pxa+z4cOL2wblWIY4SguY3Rbtmr36ny+rzmENB36RnlzwLM+kl5Gv48VVYbAl6qkT8Oo0avPc+Lsal71HR5Mw8SwCSDedrkbMfXx0jP4iqd8E6uOrsHGqT1dHhdd/sC/RWsOU8Ltx2ON8QjIOH9sJ7jB0NpuVR2LpFmsfw2WXC9mzOv+Ua/0TMLHIX7/Ghishu5265kHbGV5+8PmDNhLmj9AISwD8fbMcQa39Pq6AmfaS9nLgzULx8yIkwBTH6lVwGvTCiO0RKf5MrM+3N57wWNpxfBefEPFgoyQrUF39kvOvqekVQcGP+StqCCAvdmPJ/PyQsRw7I37NkwJPIIyNTopEwft2BR0iPH0nROatePG+iPlhv7m4c4EOv+ip12iBtGt3oGoIrZ4y9/BtsPOcz4EultCDW1LNUmyV9PItvGPXC+j/SJWdmtXYsqAbcgAcX8gHI7jI3aTMh4CflejT6Fd08t6ckQlMkNWrxpD2nc8kGOuJAKPjqPXDhiEMwFZ/JR8frtp9YcQHdiF+RUt912kEUuB10mKhdx50UvkzWwQA4+mORuhb7TskEgcJYhlPMDKek1Z/W22x1Rt2ftqrIGRSHXH8dATiCx+/yT4/EPscj+aUE2Y4NGcyT0V+JeNp7faboAoWz050i1C3J3ek7pxZfghbfOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVoxOTlKdW5iUTFBZ1ZLaEt3ZVB3c2hhVVpKRXNKeExJVStXanlZbTFkQ2hP?=
 =?utf-8?B?Y0o0Z00rQVhSM3d6ZDNxcXF0eDdqc1RoTkQrT01wZU05endOWG9DUThiTVFL?=
 =?utf-8?B?ZVBvMFIrZzJ2ZmZoWWI0T3ZEUGxvdGdHNDM4b09xdm9VdVVmR2JnQ2pPbXRi?=
 =?utf-8?B?UkUzZU1Sa0tCcnQvc0pmOWdzam9KaFZUaEg4RFBydElNMFcyeTFKUVhTYjNa?=
 =?utf-8?B?R0FBU1dwTGZPNVNxMnJMZVNVS1M0WVY4cUVCL1oxWkhTL0dVRUUrNDZ1cGt2?=
 =?utf-8?B?eWdIN0lURVhIMU03cW9nQTFLbzBQb1A2WFg2SmhCbGRqSzh5Y1h4RmRiYUpD?=
 =?utf-8?B?Q1V5WDV2OWR4VFhKZGVCYnhvOUpKL1VMYU9VMitnQjNNTFFPWW1HdTlTZGMv?=
 =?utf-8?B?WkJhK29ZWmdJdk5FNFJ6UDhTelV5WUNPZ1QyWkhvNjY1cUcwR1VsOGFHempE?=
 =?utf-8?B?aXFIZi9QSlZ5RDZnU3R5aGx4bm5GdmFpVXJKWnNmdXYrem1BY2p1TUxyNFBk?=
 =?utf-8?B?MEQ0UnlrZXlVZnhUZWh4MTRaY3NOL0RMQVdMWm81WFZZbVIzelNPK3lxdC9Q?=
 =?utf-8?B?eGQzVmxGLzFEOHkyTXlPL0UwZFFwQ29BYi9xbEhEcU5BUm0zbVRxRHdrYzZr?=
 =?utf-8?B?L3VqUXZ2NGR5SjdlcUVQV0xzamJZZzNUNmVFWmpoRzFuN0xJRmxxTmtwejQ1?=
 =?utf-8?B?RkZvaW9PRGFhS3NaTXN4dmpYeEpubnpYYktSckhWcEFNV2pkK0pSQVUzV1pG?=
 =?utf-8?B?dytudUFSdVJXOEJVbkl1UllQNUJMWFpPTXZLeHEzWU4vSkZya2hucXk4dUZ5?=
 =?utf-8?B?QzZJa0RnL3didUVWak4rVFBpR2ZOOXBNdDk5WHdBN2lWUzNzdzMzUXkrQkJN?=
 =?utf-8?B?WlVmUkJtT3VSVFc1L29pbytVNTc0UStXU1RmdnRHbndEdFdtV2Rqd3dSeWlF?=
 =?utf-8?B?VnhSckVwSERndFFNQ3RPMHR4SnlJRnZmdTJDSDNLZXg2R25rcG5HOWFCa1k1?=
 =?utf-8?B?TWxZemp5SkZCQVVWeHRNc3pOZXA1cEl3bzZVTlhQa3kzSUZhQWN3QTNIZnZP?=
 =?utf-8?B?ZC9CdHRoOVhhTGwzOHRHc1VJamlmZSttN1J0Qk0zazlXcTVpVG9NRmJVbDNW?=
 =?utf-8?B?NDgxODIwa21uTkttM1Nuc3ZNVHpsTGdNRHl2U05rbkNRYkF1YURIVExHSGpu?=
 =?utf-8?B?SHQrVktGMGhkL25TVnNzcERxS1ZSM21hZGN6NW5rZWx2dUlOaXltbUpOeDdp?=
 =?utf-8?B?K05tQVpxeU1MaVAvd1d5SmNSWTBCdTlGaHYvb1VienZyeG9pOFk0WkNsU3R3?=
 =?utf-8?B?TERpL3hEOFUyOExhaktNKzlwcDR2YzlqU3VhOUIwY1diZTFrK3NOMmxCbEdl?=
 =?utf-8?B?a0hVWkpGRmh2TVpQaXk3MjR5K0FubEJ1Q1dIRlJKSExNcUo2QTVZbERuUHp1?=
 =?utf-8?B?VnZlS1lQeDVHSWliWFdlOHE1aFZGL3hMZnU3NWZwSStIQlF4SWdWNSthZHRB?=
 =?utf-8?B?NlJ4a3JMNXVFd2pJNGVkQ3VPZUU2M21qbVRxaHloa0FMdjVNQUlrYTZUYmpR?=
 =?utf-8?B?WG1TZXhiNFlrN3RGdFQrRzdwNURHY3FZWmhOMm5vSDRqV2NRd3Roa2xmSGUx?=
 =?utf-8?B?UUNzYkJzK3BGWWdHT2NCdXNTdFA3dWFJenZlejNPMXQyRFFrMHBhY1NqQy80?=
 =?utf-8?B?UFB4T0t2NWJCQmp2TFQrd3Q2dlRtYUxob2NDUFBCZ3BaUmlyY2tnRUltRXBE?=
 =?utf-8?B?VFdtQVRucDliR0QxWDJ5TzE4NG9rbnRnd0lBZWMySUsxYUhoVXJLWVJqRmRI?=
 =?utf-8?B?SDk1b21EdmdtejlQZ2tReDQzb0xXc1VBYkRzTEdhU1pPMW1NV3J4bEU3Ymly?=
 =?utf-8?B?bGhSSnlUM2pEOGR0UHRZUVo3bC83UEgxLzhvRXFmUFBGdlloUFNhV3k3WmxW?=
 =?utf-8?B?UDRsK1pla21Rc2FWQzJqeE1SZDE3djkra0VIWkwyS0hrQlpoTEhaZk5BYWdW?=
 =?utf-8?B?QnFqMTh2ZXFqeEdqbVVLMnRpbEJWbUNBWW9JbmJqTTlWQ1I3V2xLbnc1TlVV?=
 =?utf-8?B?S3k3ci9LbExYenR4a0cvSHJHemRETUw4ZzZTSHNVN2pRUnBuQy8rdEZ2WHBB?=
 =?utf-8?B?TDQvYzhVdDVNNnhhZy8ySEdRblM3c0hoMEU0TkhKQXF3TXNyVWdibFBVTk5W?=
 =?utf-8?B?SDc0cnN3OUdyOFZpMlFvMFY1bnNMVjdNL3FBM05nMitGR1ExN0JOOHVJT1BG?=
 =?utf-8?B?ZzF1M2N3UzQxbWFMeThseHNzSlE3VDQ1bjY5bXk3bjJZRDVSUDdmd21nU3p3?=
 =?utf-8?B?ekpVdHVSSU1acjN1dkFjWEhoY21reXVwSXJnNEl5NkVORUNCcStCQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e180fe0e-c2e5-4d5d-0375-08de7b57d992
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:10:37.7743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNDyXYzdD9eCP2D0+VPrTRYY1YLEjpvyg2z99PbvqQoLPby7cjvXy31FfDJ+hghuCLeoFghEDPDt5fbSidbDGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB9374

Hi, Ronald


Thanks for you review.

On 3/6/2026 3:47 PM, Ronald Claveau wrote:
> [ EXTERNAL EMAIL ]
>
> On 3/5/26 8:43 AM, Jian Hu wrote:
>> Add the required clock controller nodes for Amlogic T7 SoC family:
>> - SCMI clock controller
>> - PLL clock controller
>> - Peripheral clock controller
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 125 ++++++++++++++++++++
>>   1 file changed, 125 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> index 6510068bcff9..6ea1b583b13d 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> @@ -6,6 +6,9 @@
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/power/amlogic,t7-pwrc.h>
>>   #include "amlogic-t7-reset.h"
>> +#include <dt-bindings/clock/amlogic,t7-scmi.h>
>> +#include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
>> +#include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
>>
>>   / {
>>        interrupt-parent = <&gic>;
>> @@ -201,6 +204,33 @@ pwrc: power-controller {
>>                };
>>        };
>>
>> +     sram@f7042000 {
>> +             compatible = "mmio-sram";
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>> +             ranges = <0 0x0 0xf7042000 0x100>;
>> +
>> +             scmi_shmem: sram@0 {
>> +                     compatible = "arm,scmi-shmem";
>> +                     reg = <0x0 0x100>;
>> +             };
>> +     };
>> +
>> +     firmware {
>> +             scmi: scmi {
>> +                     compatible = "arm,scmi-smc";
>> +                     arm,smc-id = <0x820000c1>;
>> +                     shmem = <&scmi_shmem>;
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +
>> +                     scmi_clk: protocol@14 {
>> +                             reg = <0x14>;
>> +                             #clock-cells = <1>;
>> +                     };
>> +             };
>> +     };
>> +
>>        soc {
>>                compatible = "simple-bus";
>>                #address-cells = <2>;
>> @@ -224,6 +254,42 @@ apb4: bus@fe000000 {
>>                        #size-cells = <2>;
>>                        ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>>
>> +                     clkc_periphs:clock-controller@0 {
>> +                             compatible = "amlogic,t7-peripherals-clkc";
>> +                             reg = <0x0 0x0 0x0 0x1c8>;
>> +                             #clock-cells = <1>;
>> +                             clocks = <&xtal>,
>> +                                      <&scmi_clk CLKID_SYS_CLK>,
>> +                                      <&scmi_clk CLKID_FIXED_PLL>,
>> +                                      <&scmi_clk CLKID_FCLK_DIV2>,
>> +                                      <&scmi_clk CLKID_FCLK_DIV2P5>,
>> +                                      <&scmi_clk CLKID_FCLK_DIV3>,
>> +                                      <&scmi_clk CLKID_FCLK_DIV4>,
>> +                                      <&scmi_clk CLKID_FCLK_DIV5>,
>> +                                      <&scmi_clk CLKID_FCLK_DIV7>,
>> +                                      <&hifi CLKID_HIFI_PLL>,
>> +                                      <&gp0 CLKID_GP0_PLL>,
>> +                                      <&gp1 CLKID_GP1_PLL>,
>> +                                      <&mpll CLKID_MPLL1>,
>> +                                      <&mpll CLKID_MPLL2>,
>> +                                      <&mpll CLKID_MPLL3>;
>> +                             clock-names = "xtal",
>> +                                           "sys",
>> +                                           "fix",
>> +                                           "fdiv2",
>> +                                           "fdiv2p5",
>> +                                           "fdiv3",
>> +                                           "fdiv4",
>> +                                           "fdiv5",
>> +                                           "fdiv7",
>> +                                           "hifi",
>> +                                           "gp0",
>> +                                           "gp1",
>> +                                           "mpll1",
>> +                                           "mpll2",
>> +                                           "mpll3";
>> +                     };
>> +
>>                        reset: reset-controller@2000 {
>>                                compatible = "amlogic,t7-reset";
>>                                reg = <0x0 0x2000 0x0 0x98>;
>> @@ -234,6 +300,7 @@ watchdog@2100 {
>>                                compatible = "amlogic,t7-wdt";
>>                                reg = <0x0 0x2100 0x0 0x10>;
>>                                clocks = <&xtal>;
>> +
>>                        };
> Did you forget to add something here for watchdog ?
> If not I think you can remove that blank line.

It's an accidental addition (no missing content for the watchdog), so 
I'll remove it in v2.

Thanks for pointing it out!

>>                        periphs_pinctrl: pinctrl@4000 {
>> @@ -269,6 +336,64 @@ uart_a: serial@78000 {
>>                                status = "disabled";
>>                        };
>>
>> +                     gp0:clock-controller@8080 {
>> +                             compatible = "amlogic,t7-gp0-pll";
>> +                             reg = <0x0 0x8080 0x0 0x20>;
>> +                             clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
>> +                             clock-names = "in0";
>> +                             #clock-cells = <1>;
>> +                     };
>> +
>> +                     gp1:clock-controller@80c0 {
>> +                             compatible = "amlogic,t7-gp1-pll";
>> +                             reg = <0x0 0x80c0 0x0 0x14>;
>> +                             clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
>> +                             clock-names = "in0";
>> +                             #clock-cells = <1>;
>> +                     };
>> +
>> +                     hifi:clock-controller@8100 {
>> +                             compatible = "amlogic,t7-hifi-pll";
>> +                             reg = <0x0 0x8100 0x0 0x20>;
>> +                             clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
>> +                             clock-names = "in0";
>> +                             #clock-cells = <1>;
>> +                     };
>> +
>> +                     pcie:clock-controller@8140 {
>> +                             compatible = "amlogic,t7-pcie-pll";
>> +                             reg = <0x0 0x8140 0x0 0x1c>;
>> +                             clocks = <&scmi_clk CLKID_PCIE_OSC>;
>> +                             clock-names = "in0";
>> +                             #clock-cells = <1>;
>> +                     };
>> +
>> +                     mpll:clock-controller@8180 {
>> +                             compatible = "amlogic,t7-mpll";
>> +                             reg = <0x0 0x8180 0x0 0x28>;
>> +                             clocks = <&scmi_clk CLKID_FIXED_PLL_DCO>;
>> +                             clock-names = "in0";
>> +                             #clock-cells = <1>;
>> +                     };
>> +
>> +                     hdmi:clock-controller@81c0 {
>> +                             compatible = "amlogic,t7-hdmi-pll";
>> +                             reg = <0x0 0x81c0 0x0 0x20>;
>> +                             clocks = <&scmi_clk CLKID_HDMI_PLL_OSC>;
>> +                             clock-names = "in0";
>> +                             #clock-cells = <1>;
>> +                     };
>> +
>> +                     mclk:clock-controller@8300 {
>> +                             compatible = "amlogic,t7-mclk-pll";
>> +                             reg = <0x0 0x8300 0x0 0x18>;
>> +                             clocks = <&scmi_clk CLKID_MCLK_PLL_OSC>,
>> +                                      <&xtal>,
>> +                                      <&scmi_clk CLKID_FCLK_50M>;
>> +                             clock-names = "in0", "in1", "in2";
>> +                             #clock-cells = <1>;
>> +                     };
>> +
>>                        sec_ao: ao-secure@10220 {
>>                                compatible = "amlogic,t7-ao-secure",
>>                                             "amlogic,meson-gx-ao-secure",
>
> --
> Best regards,
> Ronald
