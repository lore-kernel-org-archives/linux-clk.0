Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023129.outbound.protection.outlook.com [52.101.127.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834A03E9C35;
	Fri, 22 May 2026 11:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450300; cv=fail; b=H81eUV5vGP+HrVk1eWtu+1nmrKsbDlVtM89PK3BLE2smwy3rffy3kvjqCL5QH4+XsRbHfhhHJ4q9ohU4fChR/JA+BJbrIFUAh644/F2RG+CBoaTMmQy96BszI4WM8g8R1mujl0xZzOeLtY8aLCPpgg1z7oZir+gFmJkxIUQBI/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450300; c=relaxed/simple;
	bh=IJBsUCgc7Px8TlC+q5G2+clbketmmqHLdD3EMpnCSFY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uHjxy7pFs5QhnlP1K7lcYb1qwsIVYKshWLlcq3Ir/A8xH4cWGqBL2zexgIb5L0R/ny8CPm9huOb/w6RbPw1L4VvKxmQy9hNntPzaoFglGJpfVjwaVpEEsY7SfV5kvzZU3wx6TT23IijpBg4ar5hL+6Y2DS+c+cEVZ9Cjpdg4efM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=kpH02bnO; arc=fail smtp.client-ip=52.101.127.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="kpH02bnO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGU4JaGvkAC6s32c0rFVreVBuTKD2GreK7MgrP0hxyhohj5F7aA8Jk9uFyyA/ueqNICHhg4Ogk3FECTstZkBeqv69tTtU2IA0jjTdi1s99AvsBpauPNKSdAPGVkfEHBMlxHpU19n4UxDNJpealUQuMaJSEy8J4XY2bCELklXcfd33hl754s+fdDz2HCUGKeA7tgjrYQERRxyRjtUR7XB/3xJv3gRYGi6Tq2a2fu2B8hY7bXvsjiKAdROg/MJE/8VABtdfg1dvp5BbkyV4p3Th/iz444nhtMoJux6Ws0GwIq3p2lf9KpbFtlmWh+gZDTqZoC7DY0UhtjsgtQaVE8f3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tdQC0Bt65JnQr9aYisnmrIEEtfADpkbf1pSjfQh6/c=;
 b=LbIrKE6o8Zeu6ccjS61JciVCAGzSkVrBNlTA+GhbLdIt0FPlLNHLM2ZgPaQUQ2cZ202/EqAoc9bVRWy8wG+B5ai2/nFVQlxspdb7DGMtlmvT4AJiVtlRLXolTGc60/dQTt9NQG6fAoV/7AyZkOeU5l2rinuyFdBMuepZmcHpweoumN/LZsNyTPBywvfW7bM4G/rlhv3qsLQSHEzd4hQnJCkhOO2A6tNV/x74khHX6XRdjoOIPMKWI+2oE15oEpM60u3Md9Yvp2N2ag8H9/q/o3WllF5GMCyKUAt0fVd3WyJgM+OUQdJTxp9B/+3S81keNst+ak2y5a21WRAj9tuR6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tdQC0Bt65JnQr9aYisnmrIEEtfADpkbf1pSjfQh6/c=;
 b=kpH02bnOn+nROgNfA040Cq+HI1BZRn5v5v3sM/SYWdBLM+recdIJWBgZW0bFwDZBW9FlgyjGwAZfBS1Q0yA01O+q5LG8VAUFQbPzOx/+FkfTvdYhrLNfk/B469SfUdYKhHLgLzPJAepbJu+sm39ZNqPHfskoDLZ6bm6hkI3v18UjTt0gqTic7ZXxp1ErWTIqurK//IoKHiWrIlZ9nyIfCvIaI5r56ox7gB5EJvSRdEc0fpE7SiI/JrXNjZxTfhjzR9WO1DQ0hpEXkxn2syDO0WKBu0+5hVehcnYpkteFvTSd5jBT96lt4RRrKBQJpLXUsmA6OC1wtncLC9bXKW6Nsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEYPR03MB7191.apcprd03.prod.outlook.com (2603:1096:101:d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.7; Fri, 22 May 2026
 11:44:47 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0071.005; Fri, 22 May 2026
 11:44:47 +0000
Message-ID: <86d0e5f0-f1be-4fa9-aad9-c498e2740e95@amlogic.com>
Date: Fri, 22 May 2026 19:44:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] dt-bindings: clock: Add Amlogic A9 PLL clock
 controller
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
 <20260511-b4-a9_clk-v1-2-41cb4071b7c9@amlogic.com>
 <20260515-subtle-sepia-tuatara-cfee3d@quoll>
 <40e83bed-e7a0-4c66-806c-c2988c5d0f33@amlogic.com>
 <7c458070-a56a-4d49-89fc-efeb388beffc@kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <7c458070-a56a-4d49-89fc-efeb388beffc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEYPR03MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f50ac5-e2b9-4496-a251-08deb7f7868b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|56012099003|18002099003|4143699003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	EqaQvtPL2PpKpT1LEVXXqjLlY6wzH4W8c/E39YOXxJU+wvhzOT/vgCIYqzYCQn++ZMGw4l5XvO3LjtZr+8QAxmwYK0RzC34mLj+CT1SxSI1aPaUOCLsZBKtBM8NWYFh/2TVFk4qoRMcgVcYLLvFtstIJ7hPH5sxTF3R3W6qs5sQNsQEE6oZoSMU/hav38a//CmZR8hgiMQEvfjMDQpQ/Kf3JiM8PErleBLaDJYWueP5yrUIwi5e53E+Ofn/K3cpzqjLf43p0QZft6hilruxC5v18bPEiU96Z57b9mPnoTTcv+hbsN5awDlh75StlX5XKIQ2szowvzgkibvnJElZT7zdQ5Jxc4RBnTinoVUk4nK7+OPMXm2zeHV5599RQDHJ4+wIS5ibmj6ee7E/dzQsCOs3GULUm010s8ghguAt7sSP/teVSYiCAyL94Np0GJ1cp6WIqE0cekxBa8ZnTWyQg+ywLmTaZMw++0Dm3H2dKojTnh+5+Frt4FqXwWH7oW7yMCm968gffvz1BEk3UlDHONkbBJNdzZEoOcyP6FhSLxe5iZGjho13Y+0sVNYBMl1rFdv1nlu5/6qFcd8P0/f3Lei1CUvz2vi5OXbgFK9Asm5irlYbAv4Ujovr8zJWHnZeq4xUGtveboA+dXY/NdSeYxw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(56012099003)(18002099003)(4143699003)(11063799006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c05OQ3lxWGZPU25JYkFsSlN0dWNzMFE4cWhUY2NJR080bnhPS0dnUFhaT1Vq?=
 =?utf-8?B?aUZnS2V5U3VYUHhsaStmUk5NZmlXRTBDMWFmS3hGN1k3NUtyRmtzbkdhbEtN?=
 =?utf-8?B?VTdvYkVYWVpHSzhKVlI5SnZTdnI5V1Z0a1B1azVSOHpBaGZhRno2cytkelVo?=
 =?utf-8?B?aUNrTGkySWxObjFBb2kyN2lMNit6d2dlc3hPdHpIUWZONDhidko5djRYWVhQ?=
 =?utf-8?B?UytkamNaVnlLSFdLQlhvekVOSkJubHFqZzNpTEYwWFIySnJqUEczdVhqYSsy?=
 =?utf-8?B?QVNKVmJBaUJqU2FTUCtNWUFRQ0ZkMTFxVUZmck4zRVgySEQ1UjFseUpYMGVx?=
 =?utf-8?B?TFZHZi9EUFFhQk10N1p6RCtyWDNNQjNwemVHNmo2d2xlVEY0WFpwTkZQeW9B?=
 =?utf-8?B?VklNdmllRUQ0RHFYNmRoN0NkUEcrZ3hzQXNaU3hjenV4MXBFNlBBV3pnMk11?=
 =?utf-8?B?L0JHSTFWSXUweDVuejhESWZETXQrUjJKam9ZU1lrcXFmc0dZS1FxdHdFR3Jz?=
 =?utf-8?B?cVRoa0ZGR0E1MmllOVBwZTA2NjdHcW13ZTE5cVZTZG5SZHNHNVBES0FhZWZu?=
 =?utf-8?B?MElrMGw0QkZyamc1elMyK3dwUjZ5NVZhdHlBb3JwdVg2NVNobmFSaTNwQkQ1?=
 =?utf-8?B?OGthdDlYY1ZGSFlhYjVXeWdlSlBlc2l2azBWYnd1NHBnYlJQc280bHpuL1RU?=
 =?utf-8?B?aVVSODZLTVBNdEs3WVovWWIyWEZGcjNmTHFseVNIRFhPQ3FaS3Q1S1V2dkE5?=
 =?utf-8?B?R2JhSldQV1dNK3NBbWtVb2dmUHlPZWNEVDJOdGlFQ21uTEVpSkR6MFRBbmVN?=
 =?utf-8?B?dUZKUmZ5cTk2RmFFWlQ5cjFUZmlaWGtnVjdMWjNtbjJHQnBBdS9TMEZEZ1Rh?=
 =?utf-8?B?Q081YnlKTEpheVJ1K2U4cVBaYXNPVWJTQS9wSWY2WXN0Y2lyK0J1U0l3eWhq?=
 =?utf-8?B?UFlsMTJGZGowVk8yWk1hcm92ZnBmU1Y1RUQ1V3pEY3RRdTljZGozWjhlWG5W?=
 =?utf-8?B?cXNUQzBzaTk4UnExWTN2RUlCb0JLemhWdkpOcHdHUE91WTV2YmdIYXoySjNs?=
 =?utf-8?B?dTFDdWVpT3hhYlVUcnJ6QTl5MHhwQzNSbDFkdEl3ZWQwaGpHRkxmVkQvWTUy?=
 =?utf-8?B?UW5ZNyszODh2b3d5dmh1ZFJRYVdqSFpkNGM3dDI1dzJZT00wdnRxaUlaSjhu?=
 =?utf-8?B?citEMEdOQng2ZjJiaDZMTTFTWE56N3ROV1hVLy9MdEpLelFxZ0g5VjZTOXRR?=
 =?utf-8?B?MHQ1dmloL3F3T2tMRHFHMjFFRjd2NFBGNmcrbG5FVnRmT3o4YWpyS2pRN3ov?=
 =?utf-8?B?aFY1MHg5UE53NWlBcnBZZG9TdGVQcWFQWmxVRFkxNHV3VFZDUUI3b2FJMzVZ?=
 =?utf-8?B?NjlLOEhCbnA3MVRIMVg0UUlpbGxsbS95UlZaTHZibnRQWnZ1Ti9sbFhrbWdK?=
 =?utf-8?B?QjB0NDdMMlNHcGFLZ25zVndhNlZJUDBERVZHa2RWbDFWa00reGRNNk9HTWM0?=
 =?utf-8?B?ZURTYjBjVmVCSENYdk1lTDdMdnVrcHZrZGRxV2o1U1lYWVkzd04rTGhONTBB?=
 =?utf-8?B?SGZmK3AxMitrblEyY3ZiY2JEcW15ZUs2VHlHemt5L2FhQ3hzMDZLWjNteU9m?=
 =?utf-8?B?NHdCbmx0WUZhSm1NQk12ZXZ1cE1VMkxyY0VvbDFsWngrRnRENHg4OG1xL0Ji?=
 =?utf-8?B?YkQra3k0NVpSa1dnUlppNHpvTEZhQllDMktiM0s4LzJzTGx3R0dkK1k2VVRW?=
 =?utf-8?B?S0tsQmM4OFIxdW9nSTNxZGNFMENSQVhxcmhXREJaVTIrVktBYUVWODNSbVBK?=
 =?utf-8?B?MjJiM1NKSlJ6Yk5DRGFUbGZ0TWh5bmFHZWowM21FSmRPTGgySE40TTVsSG5z?=
 =?utf-8?B?WXNFZE5tRmV3RlZQWU8wOGp1dGg0LzhwQ3VrRmlWeGcxMGNaSFJXS0VHajJW?=
 =?utf-8?B?RXlXb0g4eEFhdE1iYTQrR1I4VzlCZld1ckp3dXZxdklpUmlNRXIyVlZ1TWtm?=
 =?utf-8?B?aXo4Y3c1aXJNNlVhZ2tpalVCVVUrek1FMDNyNUVIaGxOeXN4T0VPYTlmeEtB?=
 =?utf-8?B?ZUxIUjhCSnJ1aTN0YlVEenRGVjl5QmhNR2xOZ3pUbzc4ZFZUZEt4RHltSVdu?=
 =?utf-8?B?RGlwNjNmd2N2V0FXbDdQZkNINVFRMlhIbHBxKzNKQlJGS0FUTXp5R1ZUWEx2?=
 =?utf-8?B?b1Q0OXBVcjBFdkEwbHpLNm9oMmVoVTBlSm00TjlZRlZPVHNIOUFZb3R4b3pI?=
 =?utf-8?B?cHpBTlNxVU5KUms4Z0xDRE1mdVFZOTdnM3BXQkpSZ1VWbitwV0x6MHNmdGVR?=
 =?utf-8?B?T0dpd0NNRU1WbHhraFZleFVNdm9IZ244M2x3T1FOMGlSM3pVSVhrdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f50ac5-e2b9-4496-a251-08deb7f7868b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 11:44:47.6565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUI/sgEjDPlP2u+lKbmORO9K9ojv2sQXRgz/MTrVaupciGS3ai9gcf6AJQTOL1POtHty7DB1KqdWiynSXFe4zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7191

On 5/22/2026 5:16 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On 22/05/2026 08:20, Jian Hu wrote:
>> Hi Krzysztof,
>>
>> Thanks for your review.
>>
>> On 5/15/2026 4:09 PM, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Mon, May 11, 2026 at 08:47:24PM +0800, Jian Hu wrote:
>>>> Add the PLL clock controller dt-bindings for the Amlogic A9 SoC family.
>>>>
>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>> ---
>>>>    .../bindings/clock/amlogic,a9-pll-clkc.yaml        | 110 +++++++++++++++++++++
>>>>    include/dt-bindings/clock/amlogic,a9-pll-clkc.h    |  55 +++++++++++
>>>>    2 files changed, 165 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml
>>>> new file mode 100644
>>>> index 000000000000..4ee6013ba1a1
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml
>>>> @@ -0,0 +1,110 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +# Copyright (C) 2026 Amlogic, Inc. All rights reserved
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/clock/amlogic,a9-pll-clkc.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Amlogic A9 Series PLL Clock Controller
>>>> +
>>>> +maintainers:
>>>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>>>> +  - Jerome Brunet <jbrunet@baylibre.com>
>>>> +  - Jian Hu <jian.hu@amlogic.com>
>>>> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - amlogic,a9-gp0-pll
>>>> +      - amlogic,a9-hifi0-pll
>>>> +      - amlogic,a9-hifi1-pll
>>>> +      - amlogic,a9-mclk0-pll
>>>> +      - amlogic,a9-mclk1-pll
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  '#clock-cells':
>>>> +    const: 1
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: pll input oscillator gate
>>>> +      - description: fixed input clock source for mclk_sel_0
>>>> +      - description: u3p2pll input clock source for mclk_sel_0 (optional)
>>> Second clock is also optional. Drop "(optional)" comment, just
>>> confusing.
>>
>> GP0 has only one parent clock, while MCLK has three.
>>
>> The second and third parent entries of GP0 are vacant,
>>
>> so they need to be marked optional.
>>
>> I will add the optional property for the second clock in the next revision.
> How? Read the previous feedback...
>
> Best regards,
> Krzysztof


My apologies, I misunderstood your previous comment.
I will drop "(optional)" from the clock descriptions.

It will be updated as:
   clocks:
     items:
       - description: pll input oscillator gate
       - description: fixed input clock source for mclk_sel_0
       - description: u3p2pll input clock source for mclk_sel_0


Best regards,

Jian

