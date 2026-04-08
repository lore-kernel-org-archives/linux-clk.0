Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023105.outbound.protection.outlook.com [52.101.127.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FB226FA60;
	Wed,  8 Apr 2026 14:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775659015; cv=fail; b=eLWYNkY4KWxw6Wul2QpLu8xX7uy2A1S01nFYW2ebj14ja0H7sG3oXYCuzqIQMQgM6NjY/Iaf2aMUsfXjRQQzLiyh7g30Q2OfyW0t01UyLWOB6qaVxeX2fPaCpyuX2NnjiWEasrJWmt/Cew6uetuxCF14kRpyr+A2OkCumbBFV0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775659015; c=relaxed/simple;
	bh=YujX6mpmSeq2aI1/jS14a1yylE0F2l9gZZ8wCD5+FqY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hFQBHj+MQPM93enoJQLMiooxjdrJpfGb5bJgPSBnuFUeuToH4GCWmMpUK5zMQu6Aqj3yM1oyqLTQPjPmPZ/sapjmbiooDgjhJ2mOMfQPHHb2dB8FWS3L46eMYa/4H9foG27SjRKq+mTI3+waBJkRYs5BCCh53G6LRJpSGvGc804=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=tlBR5Qtl; arc=fail smtp.client-ip=52.101.127.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="tlBR5Qtl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayuGOUnYk0Yhur4WeGPACdQBdOCkMc7Bbzx4wsO9dtoyyOwD2DleHKSpIjHETc7AbblDruwrRx2/jIclIjYxwTTPFqvwPp+AJYElV9iwsP0SdkcGXdok96BqehkYlUsCs7vGTk5MUyaWFWtnW1T+PAv7cHRc5caKs4+xQxqlMMqs3PVEfEZpggMMcaMVqeZx/gMzeD1T1e7s6s9rr5hCQuS7nvhRB9jzx9YUSte7p6pmpqATQ4wUvMWbQTOnxLrxVxvlbFzIXj5AwR7pjunJYLf4TT8Sa/o16E65XJTVfwg4QseeMvNPeeERMb/mrz8eXz6OLD/Ojfjvg+BO/qd98g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSFj1DdV7zjuTujgHOFHkR7choM+nSoZP9jHu0f9DVc=;
 b=Gq7Tf5hFbkAl1P73r5A/EvELFBrfLDG0//B/Y1w5A/KHtK+sEUT6xLkAGB/KYoUS/3CuuIPCtRg+dqjEnOqxIcpYEJHK4YpQ4T48zcOgcaKKJvqJG7WqiOLwxrpwMroPqBHwtCN8nBlUZN01JwxdT4RZWSxZhuluoozO/ICSBc7cMRPvJLivKNKOSzroo3OjXsnmubdX5GINMn2EVND/ziqEngIHLNAJJc+D8QhYgazcOGsb2GeZqUMw5Jx+81fwgARa+/gwOVaZmhA0sMJiLb27KtriRXyWhpFnpXzSPOXGlZGUnsBIra0bwk0C1jmNPfb3t/8AxtWCMRujkvOvag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSFj1DdV7zjuTujgHOFHkR7choM+nSoZP9jHu0f9DVc=;
 b=tlBR5QtlZ8sKU4s8AW26NzVaqELtsTQnQYFVN9i1sO0Y9P15+zUq2Cdx+3rIoBp0AVTZ73PO/ZR+vPsg8lDKrTOfLSmtyXVGNnQSvTbAYSDrIOifynKN26yuxmXrljEF7pqhFBir5qOj1O5dBUbJ5C1RnHjF0MgmhoUNsYPQ0NzdWBydTGKCioLdTNweim0zmt1VfqkcEbBtBQMTCDeNSPOnF+aeb6F2W9CI4OZB9NUXgb3pLppGiI+U0oC/xYbrYdu+/NxkDiiI6pNFs8MDuzhtx5c41+vX4yu9jFrQjEIgBTtReCxwWz3ZZhbsv2MliZDukT6KwUrey+2L5T+Fug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYZPR03MB7228.apcprd03.prod.outlook.com (2603:1096:400:343::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 14:36:50 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 14:36:50 +0000
Message-ID: <002489a7-a573-4539-8f2c-326c41cb0344@amlogic.com>
Date: Wed, 8 Apr 2026 22:37:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] dt-bindings: clock: Add Amlogic A9 standardized
 model clock control units
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
 <20260209-a9_clock_driver-v1-1-a9198dc03d2a@amlogic.com>
 <10caac08-1a1d-4fe9-8df8-e0b75c532e8f@kernel.org>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <10caac08-1a1d-4fe9-8df8-e0b75c532e8f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYZPR03MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: b69b25a5-94c3-4db2-e6cf-08de957c452d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yiO7iZGW23RmK2M21DrsR8YeKW6BuuKA0ZoBpEFTGPo/fUSQjHUb7bG9StR46QPHK5cGioJnozK1b97F3oCPxQHKjsnRPYhK8Gm4TcrkhF43weXKuJTT/g9mRf4+mhKbtHnhOm/NKmrvvXGkKOhZW8zJ9vdkZFCngvsVVfMSHz0MYnqhOIIlpNe2tpOc8zRFOvLufLwp7Jx3bX3Aq9Kr9KZHaxvTNr3l5VJLkq/KQrMG+razxjjiAwEQSJOFr325m1gsi0pEsTQVdCg8ig8uZp28SwJ56xDzrlLEn/abPZ1VJFA3GK6C+i9+14ZhSEqDlhvhP5kM5vJHxv9A6dqfxJjjxGDtSp+24QMiZKXL26noEP2bXK8WWtRY4zfDwWEzuGu2N1szJ0A3EYg524kP+moXdYlEVWlA2kpIPrtbJiCRh3KLwt3gRew4i7N5iWN6ZQTbVELEQ7Ke/+ZJara9gZlxqfVhGPSfYGW0M4vEXbFFdry3PHRfqDz2lfM1OSFgDP1WgXHogTzxYq0+fV62XQscAIaJStlXurhMft+WlhHTVwOEZFTDiP3DFBQ3/MjuGMgM5x7C/dtkOCbxa1R9qAfK+Qzov4PufGeO9drgX0wTnO8mfcsBo1Fp5kn9Ue0l0NkwACvKACuCbbhuUXB/rggx5d1Rz55OgNFZ7GuXB9qxW2uwer0hq99d0RQ+2jqv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVJGcC92VFJuN2lkbVBwTGdOMDJSRTRoY3Z3bXkxUzd1R1VoY1dFNWQ0eUlN?=
 =?utf-8?B?ZWpKQjZ5eUlzRW5tdUx5Ymo4S2NJODZEeEJKTkFibThpR0hvem8zK21FR3E2?=
 =?utf-8?B?WC9lanAvQ0E2RytBQlNkd1NYV1AwSVlicVNGVURpVkV6ZFIySUZIY01aWXd3?=
 =?utf-8?B?cFB2a2lZSHZRUER1U2ZPaFY1OUpnaXlVbzRVc1hMc29TeUl2bnNWenkzc1E5?=
 =?utf-8?B?ZGdJNllIR1dIVHViV3dIYS9PcE9SZEhuM3VrWFptQVozUm5CYi9TTlBURE4z?=
 =?utf-8?B?aGQrOTcvZGQ1TStlampYWnRvVXptNmJUT1pFbXZmZWZFT2xRbWFRdk5BVDhz?=
 =?utf-8?B?TEQrclZKMWJtajlJaEFseVJyTDBRV0lyTENseGpMU21TUXdnRFZsYUhUbW1I?=
 =?utf-8?B?YmhPcVAzVm82RUJ6S2pqa0RDSTVNdWNaOGo1S2lIdnZOR2t2Y1ZQWjV5bno4?=
 =?utf-8?B?OUxreDNLQTJqYmxDcmlKZlBiZElJTnNZU2ovbmZwNm1oeHBWdnI2dnEyMHcx?=
 =?utf-8?B?ajBWbFh0ZTM0R3pITVJEc1QvZi9aVzQwWExEeWxqam9EY2YwZFZNWFE4ZXJF?=
 =?utf-8?B?eGlvSUt6L1hsaWU5TlA3SWFFYUljOU8wSFBQTXdRUjVJS3BjU1RxQldSakxv?=
 =?utf-8?B?M3JTblFzb3lGMEIwM2Q1Ly9CcE1VSUtYNDdJR2l1MHpGeUZZbEhNUUlZbG5h?=
 =?utf-8?B?aGY5azVnU1N3MFVnd1ZQNC9VZWE3WXVkZTVoMmE5ZUpOZGkxbUM2eVdrZFhX?=
 =?utf-8?B?WDZxMlhyMVo5MXZ3SVdKV1BZVzRDanRPL0FKTXhIdko2VmNVQ2UxN0Y4UjJE?=
 =?utf-8?B?RmVzbWlBMllMcmpKVkRNRnljMU5WYjFxZCtyWE5RbURKV2lhZDlYeXVoY2Q5?=
 =?utf-8?B?aWU3U3QyN1ZiY0pGTFUrVlNuMmFhTDJ3QWlHUmFGRzhWVnowcEZVeDFJYTcw?=
 =?utf-8?B?OVNtN0xjVW12eHlxRlNydmJSWmhWblZCOHptUDU0QkgvT2RsQXovZHU0Q0NU?=
 =?utf-8?B?d1lJWUZETU9reUppMk1EM1gvN2FjNm9qdjBCRDBVR1pmcXNQeEhtUzd6anF5?=
 =?utf-8?B?aG9WUjlxUGppTG9oK2lSaUdCS3ZSNEI5cDEwNnMrMjBzTnMyT3Y4UnF2ZWx1?=
 =?utf-8?B?M3FrT1VueVNzMUZaaVpoVHVXL3NpaC9yTEJrb0x4WEk2SVJaeDh5b3pTMWJK?=
 =?utf-8?B?a2RnekFpRi9DZUVCS3pHMFVaRWdVM21tNTVlWDdORVh3K2JVc1p4L25yU2RU?=
 =?utf-8?B?SE1RVXFiU2RKQzMwUFNqVVg2dkcwQ1ErZUEzRmcxc2k2NndOcmNuZ1ArODB0?=
 =?utf-8?B?cnhHbUp6d05lK0g1RjlNTUo5dm9zUWdRTTJIZTIxZzFvbTNySnVscWMzSlQr?=
 =?utf-8?B?TXJ0WnhZYTNUMzdzSVg1anVLVmoyZjlTeXgyYmxzVFJmeVVyTGVuZEh5RXRS?=
 =?utf-8?B?MEVsWVZaRXBuMzErcFlEUjJnVlpsUHdZNHRCZDdQSU9RcGhXSUtxZTM5K1pO?=
 =?utf-8?B?ajRaVll2ZHhYSlgyYURiOVA0Wlo4QzJnbkFHK3Vrd1NiL09xaFVUb2UyT1RZ?=
 =?utf-8?B?VHdob0pjY2hEVU5VNzV3VThROWtjWUYyN21iditkMXNlN2I1VDhCbzRVOEpw?=
 =?utf-8?B?L1ZwVDQxbko0NkI5YkJmNnQxdlEwVk1DbkRDejJsTG5xbEdpY0Z4c2tnbXU0?=
 =?utf-8?B?S25YWGJscjN1Q2crNElUa2pIcVVpM2Jsb25xWlgvUFZBZnhTT2J5WjBKclNM?=
 =?utf-8?B?aTZlU1l5YWd4V2MvV2hjbDJESzAvVVY3ejU2Yk9UbHJ5ZnRQeHVSUWgydWh4?=
 =?utf-8?B?NDAyQjhrSUtPYmJVSUU4VW1GaDY5Uk5FTjRMOXdwaElWY2Rxc1cwRForZDVG?=
 =?utf-8?B?UDVrRjNOdWQzWDc3SHdkMERIeFprYVd1VmdHeDBCeWYrdmE0US9vTG1VUFg5?=
 =?utf-8?B?NStXdmFXWm0vR09PSEtlZDBvK1NNQjNnbGNQQnUwT3hoTUN5OVdzaXloWlZU?=
 =?utf-8?B?L0xUQXlvK0NZSHVQWHZkcHVtNDlqMm14RlJzdWZhNVhoUnBHaWcyUDNyMW9v?=
 =?utf-8?B?c3RmVUVQOU1lajA4RGJiNUlqT21zWXpON3RPY2lIQlI3L284dUpkaDZNMkZU?=
 =?utf-8?B?RjJpOHIrVmxLYTR0ekNXeXZpb0lLMXNzYmJjTStnNTZFSytjQ214TC9MOGVR?=
 =?utf-8?B?clZ4Uk1uL2IxSFM5OEpGaXdhOXZ4MjFLVGUzYUcyM1VvR1JpbnRmY3c3aVNB?=
 =?utf-8?B?aHlZTXRTaUV6djFlQnFuMHU5dVJZRHA4c1dWNEh2dVJwZXFMeW9neXByeHZ5?=
 =?utf-8?B?SFhsaXBYbTF3cGo0NUJFcncvTW1iZTNPTDc2dVhuWDh3Vy9MdDVaZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69b25a5-94c3-4db2-e6cf-08de957c452d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:36:50.3108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6Y0IzNkuhjESDiG73CwQDL2yiwjmFSvp7eLYi5cW5tLDsfUl/r5qPYQyw+ov9ppKLp+A9gL0cem9DeETclHjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7228

Hi Krzysztof,
Thanks for review.

On 2/9/2026 9:14 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 09/02/2026 06:48, Chuan Liu via B4 Relay wrote:
>> From: Chuan Liu <chuan.liu@amlogic.com>
>>
>> Add dt-binding documentation for standardized model clock control units
>> in A9 SoC family.
>>
>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>> ---
>>   .../bindings/clock/amlogic,a9-model-ccu.yaml       | 435 +++++++++++++++++++++
>>   1 file changed, 435 insertions(+)
> 
> Brief review, you still have to read basic guidelines to not repeat the
> basic mistakes.
> 
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a9-model-ccu.yaml b/Documentation/devicetree/bindings/clock/amlogic,a9-model-ccu.yaml
>> new file mode 100644
>> index 000000000000..56c5cbe1b246
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,a9-model-ccu.yaml
>> @@ -0,0 +1,435 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2026 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/amlogic,a9-model-ccu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic A9 Family Standardized Model Clock Control Unit
>> +
>> +maintainers:
>> +  - Chuan Liu <chuan.liu@amlogic.com>
>> +
>> +description:
>> +  The clock tree within the A9 is composed of numerous instances of these
>> +  standardized model CCU (Clock Control Units).
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
> 
> Drop
> 
>> +          - const: amlogic,a9-composite-ccu
>> +        description: Supports clock source selection, frequency division, and
>> +                     clock gating.
> 
> This is just one big enum. You can add comments if you insist...

Thanks for pointing out. I'll refer to this approach for future comments 
if necessary:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/samsung,exynos5433-clock.yaml?h=v7.0-rc7#n26

> 
> 
>> +      - items:
>> +          - const: amlogic,a9-composite-ccu-mult
>> +        description: Some modules have multiple input clocks and contain
>> +                     multiple composite-ccus internally.
>> +      - items:
>> +          - const: amlogic,a9-noglitch-ccu
>> +        description: Provides the same functionality as composite-ccu but
>> +                     includes glitch suppression during frequency transitions.
>> +      - items:
>> +          - const: amlogic,a9-noglitch-ccu-mult
>> +        description: Some modules have multiple input clocks and contain
>> +                     multiple noglitch-ccus internally.
>> +      - items:
>> +          - const: amlogic,a9-sysbus-ccu
>> +        description: Consists of multiple gating arrays, commonly used for
>> +                     Amlogic's sys_clk and axi_clk.
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 16
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 16
>> +
>> +  clock-output-names:
>> +    minItems: 1
>> +    # The sysbus-ccu of A9 supports up to 128 gates
>> +    maxItems: 128
>> +
>> +  '#clock-cells':
>> +    description:
>> +      The clock controller of a module may contain one or more CCU(s). When a
>> +      clock controller has multiple CCUs, an index is required to specify a
>> +      particular CCU within the clock controller.
> 
> Drop
> 
>> +    oneOf:
>> +      - const: 0
>> +        description: Single clock output, no specifier needed
>> +      - const: 1
>> +        description: Multiple clocks, index selects specific output
> 
> Drop all descriptions. That's enum. Do not explain usu how DT works.
> 
>> +
>> +  amlogic,clock-max-frequency:
> 
> Drop property. So many wrong things here... First, start from basic
> guidelines like talks or docs in kernel and understand the suffixes.
> 
> Second not a DT property.
> 

Thanks for pointing out. Martin also helped me explain the reasons in 
detail. Thanks again.

>> +    description: |
>> +      Each clock's maximum output frequency is constrained during hardware
>> +      design to ensure proper timing requirements for the clock network. If the
>> +      clock frequency configured exceeds this design limit, it can lead to
>> +      abnormal behavior in modules relying on that clock and may even cause
>> +      cross-talk that affects other modules.
>> +
>> +      In the driver, this property is parsed, and interface functions from the
> 
> Why would we care about driver?
> 
> This is binding, we talk about hardware.
> 
> 
>> +      CCF are called to enforce the clock's maximum frequency, preventing
>> +      potential issues caused by excessive clock frequency configurations.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +
>> +  amlogic,reg-layout:
> 
> No, drop. Compatible defines it.
> 
>> +    description:
>> +      These standardized model CCUs require register configuration for their
>> +      clock functions. This property node describes the register layout
>> +      parameters for each model's CCU.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +
>> +allOf:

[...]

>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: amlogic,a9-noglitch-ccu-mult
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 1
> 
> Why?

noglitch-ccu processes the input clock and outputs it, so it needs to 
have at least one input clock.

> 
>> +          items:
>> +            - description: input clock source 0
>> +            - description: input clock source 1 (optional)
> 
> Drop optional. Don't repeat constraints in free form text.
> 
>> +            - description: input clock source 2 (optional)
>> +            - description: input clock source 3 (optional)
>> +            - description: input clock source 4 (optional)
>> +            - description: input clock source 5 (optional)
>> +            - description: input clock source 6 (optional)
>> +            - description: input clock source 7 (optional)
>> +        clock-names:
>> +          minItems: 1
>> +          items:
>> +            - const: clkin0
>> +            - const: clkin1
>> +            - const: clkin2
>> +            - const: clkin3
>> +            - const: clkin4
>> +            - const: clkin5
>> +            - const: clkin6
>> +            - const: clkin7
>> +        amlogic,reg-layout:
>> +          description: |
>> +            composite-ccu contains one register layout parameters:
>> +              * register offset
>> +      required:
>> +        - amlogic,reg-layout
>> +        - clock-names
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: amlogic,a9-sysbus-ccu
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 1
>> +          description: input clock of sysbus-ccu
> 
> list the items with description instead.
> 
>> +        amlogic,reg-layout:
>> +          description: |
>> +            composite-ccu contains two register layout parameters:
>> +              * register offset
>> +              * bit offset
>> +      required:
>> +        - amlogic,reg-layout
> 
> This is huge and amount of ifs is clearly suggesting you combined way
> too much into one file.
> 

I'll try to split large blocks of if statements like this into separate 
.yaml files. Thanks for your suggestion.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-output-names
>> +  - "#clock-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    clk_dummy: clock-dummy {
>> +        compatible = "fixed-clock";
>> +        #clock-cells = <0>;
>> +        clock-frequency = <0>;
>> +        clock-output-names = "dummy";
>> +        status = "disabled";
>> +    };
> 
> Not relevant, drop entire node.
> 
>> +
>> +    apb {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        clock-controller@350 {
>> +            compatible = "amlogic,a9-composite-ccu";
>> +            reg = <0x0 0x350 0x0 0x4>;
>> +            #clock-cells = <0>;
>> +            amlogic,clock-max-frequency = <50000000>;
>> +            amlogic,reg-layout = <0x0 0  7>;
>> +            clock-output-names = "sar_adc";
>> +            clocks = <&xtal_24m>,
>> +                     <&scmi_clk 17>;
>> +            clock-names = "clkin0", "clkin1";
>> +        };
>> +
>> +        clock-controller@290 {
>> +            compatible = "amlogic,a9-composite-ccu-mult";
>> +            reg = <0x0 0x290 0x0 0x8>;
>> +            #clock-cells = <1>;
>> +            amlogic,clock-max-frequency = <250000000>,
>> +                                          <250000000>,
>> +                                          <1200000000>;
>> +            amlogic,reg-layout = <0x0 0  7>,
>> +                                 <0x0 16 7>,
>> +                                 <0x4 0  7>;
>> +            clock-output-names = "sd_emmc_a",
>> +                                 "sd_emmc_b",
>> +                                 "sd_emmc_c";
>> +            clocks = <&xtal_24m>,
>> +                     <&scmi_clk 6>,
>> +                     <&scmi_clk 10>;
>> +            clock-names = "clkin0",
>> +                          "clkin1",
>> +                          "clkin2";
>> +        };
> 
> One or two are enough. Drop the rest.
> 

I have no objections to the comments here or the earlier ones I haven't 
replied to. To avoid taking up more of your time, I didn't reply one by 
one here. Thanks again.

>>
> 
> 
> Best regards,
> Krzysztof

-- 
Best regards,
Chuan

