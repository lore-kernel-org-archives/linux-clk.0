Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023099.outbound.protection.outlook.com [52.101.127.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09492F0C62;
	Fri, 22 May 2026 06:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430833; cv=fail; b=adcgDc4mftH85UVgFw2pn+BX87GA1WUjk4l7qPGkrgpD+FLBQ9+sWrQ1PW83VVynwgBD450ZjdN4Tiz7wxKn8GF/sDDd5JvEV/5hjke2UBEdB5sDxoCzHwavMmdP6jU0J95YlZYCWl+P2L6EyIViBVfdB8mMUWrNwxDYCXHc5aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430833; c=relaxed/simple;
	bh=cSYarpmOrChuTNgZmxhPoSipiMkJw74ImOirJkDOOCQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pRtj/Ul3gCKFJG0vv1UNYpS0Gci2wuc/eTCfZHJr+ewN7kE0VpK5VI+ruJdOMRG+nZ1idLCf3CjFjWVx8uNoEStvoTs7Ie/ojWKyXFOOe84edDL6WnikcnAaD7SGqlc26DdHZBtQs1TWU6QbhORHwjuctL+oxq9Nz07P6C3gAIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=g7HKZkXz; arc=fail smtp.client-ip=52.101.127.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="g7HKZkXz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aM5HIuMYWwa+heXp56wPjnuIVE8DVKLG0UEf7NFG0i9T75QCWJ6sctZHQkMD5fcKGatOL+SXLoXy44db26R5C1mLFuIERl2HmVfDPPyCAZHjIXV5evqX1OM8T+cwzpgJ4RGpayuCKxAf3gzZ2qqokK+PKQcLI68bVWGfG2/Ur9s0DDIssZPx25pqkaZ2sjRYxhqipfOVK+yAl29JAynDZEzauuhM5Z7GAqoBadm51qHlRYClM/GZvbJYA4KLw1dpJz23jnu1gCOHpMwf82WjlRGn3cAi8FgralxBIxt7UO96YJS89PivInoLhRTYNN52uewvn9OINn5n3FXtX4+MRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmdrL3q9sSe33ImW0k7i2C12M8esmlskvq4pNSC8Wtk=;
 b=RTWDwRw0+cp8B7wCZL90gTUGF7QOcq0cOacZTbUqX7pIRs43lMajMriBRySg3C+xpTG+32gBUDJyMHzrQ/AHBEojIQeUbeM/qG8U3d9jBuFWK5xeaeffikBFMhxnTtKBsEp29AVcMnG5D09fbs6gfFRc20AhLwxophN7iqKFftpWEVLsFACWEw8gaAUJ7/z+T4lR0VTG8L7qLmAQk8J6rXABvmMvgU1rha4IgWxrL0Kd2fslGrL670I7+gA+LuVv6x21w/ejvHzZZp3fOui5R5jjAtboWIYR4+e6/n0pd0syk7c8pBGKKxQe7LiFDnn6obEhSMvJTKvuzoLUOdS/EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmdrL3q9sSe33ImW0k7i2C12M8esmlskvq4pNSC8Wtk=;
 b=g7HKZkXz9WUpQMnEscwft3RoEQmGP+uoxblj4G27Cic23e7hn6TpkAvnfeKr33gQXmapCMizaJkmvbYkSdbmL+dLAcdpAM4XwhtO/9L2YO+AsQlMaFT3GlaoQRhDOk+dLVmIUIQGqcFiejXF3FfCdbqGbX053sQhT+ilcVeiAeIWTeOIy/5rjRflAlqtf/hNf6yuB/5p7uHmau3pPSbAJrORsC3/Zhkms3sHf9ZuOZaj3LDT6HatDjmFWIZqOeh8tw6fM7PbjMGMx3pM6GMHHH8P1VmQ9DmNzfaE6BKUtSNepeX6KJ5LFY/tfbnQeJXEUHZ6Fbc5vMVIFdhyTl9/dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEYPR03MB7923.apcprd03.prod.outlook.com (2603:1096:101:171::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.15; Fri, 22 May
 2026 06:20:24 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0071.005; Fri, 22 May 2026
 06:20:24 +0000
Message-ID: <40e83bed-e7a0-4c66-806c-c2988c5d0f33@amlogic.com>
Date: Fri, 22 May 2026 14:20:20 +0800
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
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260515-subtle-sepia-tuatara-cfee3d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0187.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::12) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEYPR03MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef3193c-6b3d-4bfd-93aa-08deb7ca3555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|4143699003|3023799007|11063799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/fv+TM+c/6p/+8nfrXFFdso3REZQ3UvqeV+bzNzwFUpbiLS1GxW0P4hPZpG5D2/snnn8mpnGk7XVJHCagfJ0+/FTaOHLyDVd1+3NI65rtZ14/6lK139Ltnh6wEGbVNukso8FxtNlynIXOPNkl8hsFG1zyFtTjJ9/JCR7QmeJvz9oRJByGQLjxBHZBnNT4Dwf2A/oTBmErI9fcdOIGAYN4Ez+Cl0/AuaxgEhW/cHSXMQkkxTz7Hs1QNUICnQyNwZJ777MeMFXuBsB/y7sLl1fkkNpeiBHn+BC/rYdXPb9pa1DpiR5z7XWZK6DXBY9OAhv7zA0EYHtsoy7GRWseWyzqQxu8tn8mers6rhij7vN4/G070GrbazLs9+i9Em5zafDleqO402DWY57qGi9Fn0m3rNVurW7s4qEkAOOllb34zo1n8rYsD+nDZb15fqU8c73s0RW0Mla0YjkSOEaeZ8LYBV8cYEsxj+ybCR2ehXmqlBcSntsPYr380TQ27RLHUhgg2Ac4zX3ouy5T3QBUEbGD2Wl3xE5OYLxPJDFXTJc63yN4W5IqBWlx2qAczVfRH8o7HUYQe9NImXNLEce+PAE7vOHW4f+6xcpr9WEdcrcTj+NsLRHEsge8UzkhM0eKzN1b2Bgcfk3KXiyKCHROC8fXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(4143699003)(3023799007)(11063799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmdPN1ZYZUNhTzUxRTk5ak1PWUVpRDBkNWVlWU1INDE0eW1PTXcxckZ2RFFx?=
 =?utf-8?B?eDR6VzgzU1d1RHhtMm1sRlkrN1RpOVRCNGM5VHN5Tm44aktHa3RSWjh0dEpR?=
 =?utf-8?B?RnJsdTFsR0ljM2VON3J2T2FwRWtuUFpNMDhESjFhSHZINzJvRnp0RFN4R3gx?=
 =?utf-8?B?b0JiTHNMc2RwZDlkVEMxV2t4OE13cWRHTTdDdDlDNkYzSGFERWhBSWZvdjBU?=
 =?utf-8?B?b3JLeDRHb3VweTFOZkpobkI0Q1k1OHQ4ZmlKWllVVjFSck1YeDdaYnpudXRH?=
 =?utf-8?B?alA0VXFxVVg3Z01kK0N6UUtxa0VSeVhqeE5kSjQySExrN0thUzhEdWZ4a25o?=
 =?utf-8?B?Y1JnZXdVR0JuOFZaNE1lbmNVSWdVRWNuM1Q5RDZhYVgyMS9BTWU3cmlyL210?=
 =?utf-8?B?VnV4TFJTbUc1by9pRzhZVkZYNVcvWVZGaEdpcUdFOW9rQVY4dTRaNnNjU0Vr?=
 =?utf-8?B?QTBRZXVWNWJJTklWWVBHVVJmNGpQRGUvMGwzQnVFR3NONGxEWm9PWkxXUVRi?=
 =?utf-8?B?TVZqd096SmR4eE9TSDVsemRzTEhlOHBVL2JvZGNucGUvNmhaVnF0Qmg3ZHJh?=
 =?utf-8?B?TDVCZXZKQ3A2L1lTbllHSlZOK0tud3A0a243TmtNc2tJZk9hUkVCVFRaL1A2?=
 =?utf-8?B?V1NtWExwcmkwMHZGRFh6VzUvK3lveVBDVWdOY3VCdmhMU1NTUURoTUx0aU5w?=
 =?utf-8?B?VnJYTjhVQlF6OHc0ODJ2N09lelZRN2lDUURIUUtnYmVrSGozU0syWThrVXB1?=
 =?utf-8?B?aHdvcjJLNmlvVmRxVVBKaFRzdWt5enI0ajFiY3NuY1F6cDhzejh0a0xoSVJN?=
 =?utf-8?B?NVVnYnhoWDEwUHhvUVRrMWI1Q0JaOGlPQnFVMVVQS1dNQzY4UUR4YXQ0MUJj?=
 =?utf-8?B?dnlUNC9XNi9IQ1F5WWtheGwvbXNudmVTdU9NR2Z3U09VSFpzWklkZFBjTHVS?=
 =?utf-8?B?R0lLVE8ybENXZFd6YlpXQThRMWc5dUlSc2k0WGpXYmV1NEF6MytaYjZxalNq?=
 =?utf-8?B?SmpGNTVrbkpEL2tyMUlxYkZHbk5ZdVFOTUNZZEkwUm1LMnVuYzg2eS8rdWo5?=
 =?utf-8?B?cEdaTHEwVEdOV3pBVGdKbDY0Njh5bGFhN2piNDlMUEZ5WE9lL2cvbCtRT3ps?=
 =?utf-8?B?bTBJNWU1a015RVFxVU9ld29QQUtrazBMTWlXNkZYV0tOc3ZqMjFPY1JvQTRB?=
 =?utf-8?B?VW1ySUlyeXVCOW5UMUpmbDVJLzF0cEhPVEdlSW1Cc1MzSjVsenc3MUgxWEp2?=
 =?utf-8?B?cktEenVFdThKNUJYa2MyK2JjOWhLSTdFOVJVb3FLaWx0U1kxTWpiYUlQTVIx?=
 =?utf-8?B?R2FVd2xOS0ZEUlVEZDE1VE9UWVB0YTZvQ2FGbXFjN3NvdlNhbnVHWG1nY0Iz?=
 =?utf-8?B?T2VEQzdLU0hkY3hqT0VVYmEyNHdUNXBNVWlGR29hd3NBcVB6WkppcFY3RXBx?=
 =?utf-8?B?bXpqWXFoUXQ2S2lMaThOVGJoQXFMa01zcGdIcmN6eldlUjlSRkZCcXBUUTBz?=
 =?utf-8?B?UDhlRWtFMEdIZ2ZVRGYwUklud2RWcmFNSmdub0tCakdMY3NBU1cyOWh3N2oz?=
 =?utf-8?B?WXJ4dlV4RUpxV3lQd2ZocTdwQmQwZVVaejc1Z3NFWG5tV3MxNVpoSm1OQXZy?=
 =?utf-8?B?QWZxNlJnV1dCVENLVUFsTXVtckl4TzlHb3JPV3kwdU9CRmx4dHBsanl4a3Va?=
 =?utf-8?B?MjZiT0o0MGVsT0xhNzBobG92RG5POEwvS21QRkhGU2hiWDZkY0NaTlpUK3NC?=
 =?utf-8?B?YjRBSFoyYjVCenFYMFFnVFZqeUtQUzUyS1hraFZ3UU1hNlJxQXZieC9RNmVo?=
 =?utf-8?B?N3g0L2JtckFXRHo0TFQ5NE8zSkZ3VEppclZuWmdLdWw5S0t0by9vTG9telNY?=
 =?utf-8?B?QmdMTkRKSE5XYStPZ3N3bWRmdE1IMXRQamVlUDFySEVSZ0t2Uy9BcGk2YnVB?=
 =?utf-8?B?eXpuV2F4SXJLZURaTFp4OHp6dEJkZ0FLcEk4Wm9Xb056Z3N2bERpeHNZSkVv?=
 =?utf-8?B?YmlzM2FseWxEei9WQXVrempNMDREeXBCSkFxbVg2MkxGUFJzekd6QUoyZHBK?=
 =?utf-8?B?R3JLeDVTamk1MTVQUDZIVTZyWWhJL0cvSVQ0dmJWY0VrL0tMWWxpL2J0WGMw?=
 =?utf-8?B?MndXNXlFZit6TzhQZWVEUHJNV0JIUVZEU1NQTkNFR01LMzVZejRxMnRvT0ZY?=
 =?utf-8?B?ZEp2Wmp2T2RkUHQ1MnlKblNGL1hFR2pRNjh5K2dSTEhTWjgvejQ4RWoxS1RP?=
 =?utf-8?B?VFFyWkN4M0EzaWh0cHh0YzhzLy9GcWFYK3VGN05hSlVFUVNOSVkwL0MxREQw?=
 =?utf-8?B?c3pTUWd5Q3M1OTdORlNvQ1pkMkFoc0tvaVFxOTBhQmozSGZQYTBEdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef3193c-6b3d-4bfd-93aa-08deb7ca3555
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 06:20:24.1805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1450DibaoIQaxAjKY0YKg64MuCUPMoGO6F8AYLNS7wdNQak82DUzcBV3CQg0bhD9FHP442yUxNXr78osE8Y/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7923

Hi Krzysztof,

Thanks for your review.

On 5/15/2026 4:09 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On Mon, May 11, 2026 at 08:47:24PM +0800, Jian Hu wrote:
>> Add the PLL clock controller dt-bindings for the Amlogic A9 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   .../bindings/clock/amlogic,a9-pll-clkc.yaml        | 110 +++++++++++++++++++++
>>   include/dt-bindings/clock/amlogic,a9-pll-clkc.h    |  55 +++++++++++
>>   2 files changed, 165 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml
>> new file mode 100644
>> index 000000000000..4ee6013ba1a1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml
>> @@ -0,0 +1,110 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2026 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/amlogic,a9-pll-clkc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic A9 Series PLL Clock Controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +  - Jian Hu <jian.hu@amlogic.com>
>> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,a9-gp0-pll
>> +      - amlogic,a9-hifi0-pll
>> +      - amlogic,a9-hifi1-pll
>> +      - amlogic,a9-mclk0-pll
>> +      - amlogic,a9-mclk1-pll
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: pll input oscillator gate
>> +      - description: fixed input clock source for mclk_sel_0
>> +      - description: u3p2pll input clock source for mclk_sel_0 (optional)
> Second clock is also optional. Drop "(optional)" comment, just
> confusing.


GP0 has only one parent clock, while MCLK has three.

The second and third parent entries of GP0 are vacant,

so they need to be marked optional.

I will add the optional property for the second clock in the next revision.

>> +    minItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: in0
>> +      - const: in1
>> +      - const: in2
> Pretty pointless names, drop property.


Ok, I will drop them.

    clock-names:
-    items:
-      - const: in0
-      - const: in1
-      - const: in2
      minItems: 1

>> +    minItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - '#clock-cells'
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,a9-mclk0-pll
>> +              - amlogic,a9-mclk1-pll
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 3
> No, minItems instead. maxItems is already 3, so what is the point of
> redefining it?


Ok, I will use minItems instead.

>> +
>> +        clock-names:
>> +          maxItems: 3
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,a9-gp0-pll
>> +              - amlogic,a9-hifi0-pll
>> +              - amlogic,a9-hifi1-pll
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 1
>> +
>> +        clock-names:
>> +          maxItems: 1
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    apb4 {
> soc


Ok, I will rename it to soc.

>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        clock-controller@8200 {
>> +            compatible = "amlogic,a9-gp0-pll";
>> +            reg = <0x0 0x8200 0x0 0x20>;
>> +            #clock-cells = <1>;
>> +            clocks = <&scmi_clk 0>;
>> +            clock-names = "in0";
>> +        };
>> +
>> +        clock-controller@8330 {
>> +            compatible = "amlogic,a9-mclk0-pll";
>> +            reg = <0x0 0x8330 0x0 0x14>;
>> +            #clock-cells = <1>;
>> +            clocks = <&scmi_clk 4>,
>> +                     <&scmi_clk 8>;
>> +            clock-names = "in0", "in1";
> One example is enough, you have exactly the same properties.


Ok, I will drop the second clock node.

>
> Best regards,
> Krzysztof
>
Best regards,

Jian

