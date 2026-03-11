Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023075.outbound.protection.outlook.com [40.107.44.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975071DF74F;
	Wed, 11 Mar 2026 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229732; cv=fail; b=ZDO2ucDqGwnG5UgfYLvlN8UJX0eTt78SU25INNLlERUJFv7ZBu2HDgtOit6HR0jrDHd27fyk3RxWcFPQ5BshaddRwVORHXhWR4LtP3sB99H2soscqCiUQKZFr/17DqOcveod5YOm/JLV2EBEB5RNNVXakwPiGx1yMm0HJtz1yPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229732; c=relaxed/simple;
	bh=RpejwDWBaS7r2tOmc0R/KdRB4c+JK8E24vCyf1UptfI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Jdx2BO2tnwJeHIUA44+rfo+pqgWt5MBP0CUh3mABF01U4IHYWwRsPhv6kZ41TZcpL/ZIiMYphMlj/d3RQXoH3ryzho93aXPoYP8vojcon7p5Zm4+irkyP/TLqmbrzoC66xdXQomSShsHzJi7AyQxaBQicINteLzn/3L04JLMAqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=EtkoC8k7; arc=fail smtp.client-ip=40.107.44.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="EtkoC8k7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPCHUhnfDrSfMEfteMa6kn2gzL3P4oKQ9IUk91CNtMyOZHrosGi71ns+jcCg6MSj/1l8tKtk78/owf3/ZsFlPJ+GfrACfLAHasyPrz5mpI4NrqA8eDMcT5wGeCVBsQF+ZNQ+cqk3cN0fXIXGwSNNLG0uzrtKCjwsYEmNJ9MhY5nX949t6XXgUI8oUXzW3pHMw7G88IYqRpXlcRNGcz78TrRmQ4pRoXdY2lUxDwBWR6O8BdqQtdzzcFFkTRsUbzpSNrPvlEcAIL1fUv/pcqWN5+Uh2JEtKevXg3uFYW6uoP/U3wqZcB6zc6Bdwd4KZFxTJodOm1P17iU0DpuDcQZm3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hejBmqd7wtep5AAmfWyanm1MQUmgo8GjVSnjr3Gt1wA=;
 b=JfXg1TB+ZmWrTlBtDYYB6PxNYX1Q43Mw9IPCbB2CCJuS2mojerK0hCT1M/0kFSf/to/cqvbxmT6kA4KO5DzRT+uuwv5TTKyWdiyRh/148Bam98TZbPYxe2wF1ozXvLiYltw6H5REOQ+m/skqLXXr0OMbs7t7/wOItY8z/zG1P2WkdnLBwvxEyfLorMCP1ZDFiFKzjghXqf2ig+fMHXMyuqcLLjuVCNocklHyD7o5mbBpcKNEO8mO66beRQNaSSkPMzn3FXRBDu7Izj30P+2JZkYpq3/I3wDvzr/Ri0CSQCIxDDH4bSXiK55QieAzAYbKsxUV5rrtqbrghm5ieqqfmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hejBmqd7wtep5AAmfWyanm1MQUmgo8GjVSnjr3Gt1wA=;
 b=EtkoC8k7EcW/EgJjDZ4VufNkW4zFcTOCbMGfGdFWJtCjgn7N3InLk6BbI3lykqRcMwzQlnPrz4/PkV7pPoBKfABEVUqIa4+G1d5gg6ACHsBXcWq6kZzeSUhXaWrM7EIoo8JgefMmA6u1RfIAfCNhom9VsB51mStacV8S9ZI5rAzvqoq5uXuVrDeid1G0q81aRnAsjXV2yBzWtbI8YpI967xOiXFTu70lsP0sKOKhk7Ep5i6oWKM8IVD40Cp487nM2U12Ld+urOmiWvScIzdOI41amw1NaILvaJIn+R8FSrxoildBsCfMXjfOlYAIgQlGdvHaNV6KUlZtN9YV00VroA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SEZPR03MB7146.apcprd03.prod.outlook.com (2603:1096:101:ee::14)
 by KL1PR03MB6975.apcprd03.prod.outlook.com (2603:1096:820:ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 11:48:46 +0000
Received: from SEZPR03MB7146.apcprd03.prod.outlook.com
 ([fe80::d880:2a36:4b28:7bec]) by SEZPR03MB7146.apcprd03.prod.outlook.com
 ([fe80::d880:2a36:4b28:7bec%4]) with mapi id 15.20.9678.024; Wed, 11 Mar 2026
 11:48:34 +0000
Message-ID: <172d5b9b-2274-4c01-92f5-c9f70efff7f6@amlogic.com>
Date: Wed, 11 Mar 2026 19:48:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: t7: Add clock controller nodes
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-4-jian.hu@amlogic.com>
 <b6677544-d679-4f01-bcce-f9ce1518f942@aliel.fr>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <b6677544-d679-4f01-bcce-f9ce1518f942@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0104.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::8) To SEZPR03MB7146.apcprd03.prod.outlook.com
 (2603:1096:101:ee::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR03MB7146:EE_|KL1PR03MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2ac894-01ab-4655-241d-08de7f642037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NrLziaAvCKwo6PlhLEVsPYKKs6rYowvE8Qb0IYUpqd1zpgakXXau/HBpBoPy9Oda9W3bvXKTGUxzODENgQY9WUVVS/lzeTPGn7zLnod11IGjNU1yldjehCj8um7uXuEqnhMsuC/U8+geprbbLqcgDlcIBL7otHdROdzDs01QTytA2jcEugNtJ8NvcJgl56hBAg1bMPPlzMS0jC3T1laQyAOzRwCUO3b6qyONsV/HwQFNfK6IjRkWthG/p/cwHZGmcqkjUrXedbA5dhT+CfPY7sSi5dMWjfOMknJ5Y4JFmrJsnMCfNavS63O12MrUWelISkUh3hrPXvg+a+427ClMhj1yHjOLxKiYhdzYWaOw4K/0SvtpC/heiD/sdZFkXIcht12WR8Lo+ag/Bf/cFFQ7pbeixZLsCd5+IeHOy3oJgwJOlIvOPxmDnJtetn49rG9FOyKJEF4wBczyjR16CtwmdWbK4w56RJ5SmO177Ro4HFtZ7qwWn1gy33RDUPuTxuY5NUvm+EDwhDIZrfNSQfFZuo/qQmk10mIZrmws8Bf3YUkFIxxI4WcwNBx9n2PlzubCY9WuUMv+VRCRoPCkW/QnGQKY5Qew5WT9opKl2UF/GkdGvI1AAXc4VqcNDdM2mHfM1xcLTma4qA1GsbJu29q6ST0qpGocACQckeey6viQzm/zbpz9P5XpAdiUNPR6ZHjsif4AojCCsrt/s7An5qW7oOHTkB3xsdohemJlv9cQitY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7146.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SStJKzRhYlUwRkxDNzQ0ZFJhU0xvNnViTDVNZkpFSm5CRlRBVGgrdDl1eWw3?=
 =?utf-8?B?L3NIMHVkMlltdlJoRlo1UUJDM1lwdmdBSEhraTY5RFVPaTZYc213YitraG9x?=
 =?utf-8?B?YTRoMnVpUGJHdDFVQkhTUGlRQW1Ib0R4N3dwVWtZT3FiUGNvSjI4SzhxTlUy?=
 =?utf-8?B?bE9KRjZpb3dGV3lKK053UTVMRjBqN09iZHRqQ05vOWtUZ1RvU21sTzF1QjQ3?=
 =?utf-8?B?RjJBb2QvbHJPWUtiWG93S1ZPMGU4eERoS0Z5RE52a253a0lNRkp5MkQ0a3Yx?=
 =?utf-8?B?SDlmZk5BcGcwYUMyNjRkYkNtcy9Ub1FWMDR1bUdJT0Z5MmQ4aHJpdHY1TDJa?=
 =?utf-8?B?c0ZBRUdSeUwvSFVEUnQxSVVpdXFJWWN6cmdQUFVQRGM5RE16OXFDSnZERmZj?=
 =?utf-8?B?Qk5HdGtnY3NhaCtFaGozMXJnUTBXQTVWTzVGWHNrR2RZVy9rU2VGakVDRzZQ?=
 =?utf-8?B?Q0JIZThkeWt2enc0dDRVTzdxZGlBcDdqc0tVaUMybWhIbWVKRXlCbk13MjU1?=
 =?utf-8?B?R2RoR3plOVNZclNOeXlTNTA0amg1SHpPWDlidDRrZ3lpTk9vc1UvUUJ5ekhS?=
 =?utf-8?B?em0xOSs3Z0J0Q1RzV2NnckxGWElVdjN5S0Rpd1VvZDVlTVU0ekFmVXlpYjVI?=
 =?utf-8?B?ZEtnKzNDOW5sNE04N0x0WXpybWExeGVlR2NuSmtyazhNYTV5clVwem0wZ2Vp?=
 =?utf-8?B?ak1TamoxYmJMaGt4K2xGSTB2aFJFL0lqWTFVSVJMV2NOeG1lK1c3SDU0K2ND?=
 =?utf-8?B?VHFjVmt5ZGVmR293a0hMZjgvRzJwVDRsK1F5c1N5MTNiQVVIV3hMemdNckZF?=
 =?utf-8?B?RWdKSmVBd2hTc0hHSVBRVnpiTmlVa2I0VXJWQWpPSElGcFloZGdqampOODRK?=
 =?utf-8?B?QWZkMDYrc0l2WGVmZklOV1J3ZHVBbkNxR3ZUaDRQU3dmcUh6V0NKQmZEcFNi?=
 =?utf-8?B?UFd6aDhpdlZuMkJHTm45NkZYVFdJcmRMcUdpeFBvU1hqaGRkcjYxQVFJbENy?=
 =?utf-8?B?U1VwMlVZR0d5ajNyZllVOHZxcmtXcEwyYWVDaFh4OCt5WGRSb0QxZmVRbzdC?=
 =?utf-8?B?aVdTeU1LcXhON1BOVG9TTy82bWpLNjlHbHdVM0dRcUFnUUo3S3V1RkpJQ1cr?=
 =?utf-8?B?V0NZVStzQzZvaUxXRlBuSUFxRWsxSk1kYWc1V25uSWhSNVJ2VitWd0E3ZkNy?=
 =?utf-8?B?RHdqY2p3bzBqc1B5UG9iNGFWMUMyTk5mTDJIUVN0WDdjUWpkNkRmcm12QkJo?=
 =?utf-8?B?SlJpZkptMTA0b3NYWnhKaGZkUG9BNXZMTzdlWER2UVFlKy9QNHdCR2FWUmhZ?=
 =?utf-8?B?N09TRzVhNjVRbnd0SlE2ZnIwU1NjYWgrQmhKUko5K3AweER5b0tmZFpvQjIz?=
 =?utf-8?B?MDRWS3JFOHNabExZOVdIY3lybGdlbEJrMlZ5c25LK1NHV1QwNFJ1TGRucURP?=
 =?utf-8?B?cTJFSFQrd05nQzJiSnlGdVZjemtTOWI4czR2OUF4OUcxZnhjLytZN3RzQmlk?=
 =?utf-8?B?MCtubmhrVWl3MS9TUEVjdW9NbkJnSUZPaUdNZmhWYTlpalpsZGVxcStDd3N6?=
 =?utf-8?B?TnFqZktqTis3UEpNMnhZL2xBczBZK0hkWDVtRlRFY2NGd0pROTZBbzNqSXhi?=
 =?utf-8?B?YUpMYytYQWFkQWVBczFSVlA2RFR4UktrYnl6VkxtK3BiL2MxMkUrRXFNN1Bq?=
 =?utf-8?B?Nkk1ZUV1aUJuaTYzQWttemluQjlxS3B4aGxoVFBqclZuNFgvZ1RhK2drcXND?=
 =?utf-8?B?am5LYmhmYU5aNUo4NlBVbmZDUzFhME9POWgxSU1ldllpM1lPU3gzWkpLOVRo?=
 =?utf-8?B?QXRHK1BiL052V2QvTlpJNFF3QlNBU3pyeGh3TEZPczh3S2VVWG1vSHRvUkd1?=
 =?utf-8?B?ZEVLUGRVWG15eU1xb1JZQnFaelNCN081ejRLV0huWnBQWUpuNk1lUlNDL0ZW?=
 =?utf-8?B?RmN5WGRJV0JtRkNZaUlNNmlOcjNoN090T3Fzc0JIVk5HQXRkOHRoRUU4VE1F?=
 =?utf-8?B?bzJiTDRsUWJxeU8vaVF4N29hY0pWOTZXMkZZdnFWa0FlZkZpNnNGY1RHN21t?=
 =?utf-8?B?ZFI1S245NDJwaTlXMGZuZXhZNGtEVFpCUk11SjE0dkZpK0xGZ1c1cDVRbzlz?=
 =?utf-8?B?eGpSQkcrTUc5WWxvYTFQMkFLb3cxV0dEV2ZLK2pacnRQV0orK09SNml6NnpQ?=
 =?utf-8?B?UkFGc0dQdWVhSVVpK2cvYVFJMHFCaVlialBhbXovSkIxUzR4WFJ6bGF3eTJv?=
 =?utf-8?B?Njdmalg5ZzRNMTgvK0ZzUktRMHhUSy95THQ3SzNadVc2MXZWZ1BVZVhyMXdt?=
 =?utf-8?B?QXRVZk5Ia2MwcGYzV2xwZS9Xb1RUajZVeXpHMzRySUZJdy9VcTlmUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2ac894-01ab-4655-241d-08de7f642037
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7146.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 11:48:34.8850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wf5h27cHy3NcoMq92TA7cMuAlcgKgI8MyIHm1Zutqws3+vt1GCd2gBd7OTarI491Ujr+qEKcafv7VbF7kh2DrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6975


On 3/11/2026 3:53 PM, Ronald Claveau wrote:
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
> Applying your patches shows the following errors
>
>
> [    0.019608] sram sram@f7042000: error -EINVAL: invalid resource (null)
> [    0.019622] sram sram@f7042000: could not map SRAM registers
> [    0.019627] sram sram@f7042000: probe with driver sram failed with
> error -22
>
> Adding a reg remove those errors on kernel logs
> reg = <0x0 0xf7042000 0x0 0x100>;
>
> Can you have a look on this ?


Thanks for your feedback!

The -EINVAL error is caused by the missing 'reg' property in the sram node.
The SRAM driver requires this property to get the physical address range 
for MMIO mapping.

The 'ranges' property remains correct, and the 'reg' in the sram@0 
subnode is correct.
The SCMI clock driver works fine.

I will add the 'reg' property to the sram node to fix the kernel error 
logs in v2.

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
[...]
>>
>> --
>> Best regards,
>> Ronald
>>
