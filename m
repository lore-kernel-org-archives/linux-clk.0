Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023119.outbound.protection.outlook.com [52.101.127.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2063E3DD864;
	Wed, 13 May 2026 08:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778662268; cv=fail; b=fdEndTS8i6i7iEgMid7iA3BBCigDYeDNfdT98bzMKFuKHYm5kG4mJ2NuV2ngornhs8h5uaUSUxzD9aoWFCY6txmuE8HgX4t0P3t5snJXCFiDe9xKoUeQFvBHVRwrLUWj8l0JSQFd64U7fTUEdd8iX/ShAUQY1eAFNjBoXQOoknk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778662268; c=relaxed/simple;
	bh=J3xgd1WeVZ7216kjt2heDyXtQuVAZWChXPG6++gKDdg=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RUGVGUrUTrvWodFZVNtxxbcDyhu/ry1Mq+mqEByMkhk0odw+I9rFbXehsCHam8AT19/zHHbLvAP3qXNZwSMj5rjrcvt857/W5iQbyhqoq3UJAj/yYKt51QBIYZxqEbOAlFGz7LBEECOJHTknrdpnUeh9h2KhqIJRZlAyxhaJEOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=neV+CQx2; arc=fail smtp.client-ip=52.101.127.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="neV+CQx2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5CZPwOZNOluNrmOftsfr27BfloJaXQo0Cn9+j29QvmjS43wg/oo1Gtop0eccFZ8Bqy99JOlb42jLbmEiWaPYmPsM8d4tWXDm3MiztcnuZSxG9+5ArgTBr4wUXkTeNhEW+ArSX3QQKY4Ac5FB4YsOlMaPrqwEVAk2IJUWTQoleFOHYDuldEtV0KjDVDkK6divNlVCurWukdF9h67APwaGiVk0wHggZfhA0v/ip0tIzO45GOUnOx7JHN2HbmopVkzGi73Oj43Ye0WcPme4sid/smO7BNoyctaHJ72SV9s4T/b1/fV3gnxLEIA2sRfYDMo9WipMTcskVc81Gq02m7bng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHz2ZP/Yj/LVP4hC0jUYTBaLqWIPQwgf4nCmR7VfxG0=;
 b=jkX2v94LJFt9o8frhvB0XzvZgulstSlepXDB7JDVcVgcxWEntUAC1pdImH7smCt34+q2AkblF2OlF1DM51WA21+eoFTdZ3mk7SI/z+UISMM8AgpEHUs9Pe0B8rJJMiu97Y7KFsHmqShVEl2i2sPAwTB3lRRW1htN3lmeG+x8xILvb/ilEBDA8gck120MKRJnLWEGMRA2Eu4tcDgwZJxIxE6k6kPIJfSXZsTqD11bufS0zVXHN2Fz6/V0Qw2E+sApumEI4duHmnPuAPhRv3a3SLYaQO+AALxJ0wC8qa0y22NV7RRuUj4CQVnYT1zCnnyIazvBT3vJGno0vJXTJvEmkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHz2ZP/Yj/LVP4hC0jUYTBaLqWIPQwgf4nCmR7VfxG0=;
 b=neV+CQx2oxY1jYIkiUnpaicSxSrVuHsOg+aReKuy5YCINx34w4GYfFaLluBXfcJLUp+QVpwWJD32GRDlPn5Pb3BChJjn/exCyYYB2YNnHQ6p0OYsIEUN8h1Rrl+GFxjbpmGzINUqf4UMFDlJRPPzR2aD8qxz4mEHXo4emb6ZHlXkN29ty1SI/QMJqXJQMWksbRyf4UbAqlKJs0sC8p6YO48QcB6HdQ8gLzvlGB4dJclLlgcPVWQ4K8bcqeNGhMNcr/MXxT2Aknn26fV7AUIu2YkqmM2HQWcxn/6ILOOrulgXOTPZR09HSl4LJglY+ZTTqKm5tqxCKFOKzOVJ0wGhbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEZPR03MB7702.apcprd03.prod.outlook.com (2603:1096:101:10d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 08:51:02 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0025.012; Wed, 13 May 2026
 08:51:02 +0000
Message-ID: <00d8ed18-f753-405a-9ba4-e044129bf33a@amlogic.com>
Date: Wed, 13 May 2026 16:50:57 +0800
User-Agent: Mozilla Thunderbird
From: Jian Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH 09/10] clk: amlogic: Add A9 peripherals clock controller
 driver
To: Brian Masney <bmasney@redhat.com>
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
 <20260511-b4-a9_clk-v1-9-41cb4071b7c9@amlogic.com>
 <agH4_gClJW8CVV75@redhat.com>
In-Reply-To: <agH4_gClJW8CVV75@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0182.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::12) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEZPR03MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c2b986-5668-46ef-e45a-08deb0ccc2c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hVPB+NcR/8jv68X8xZa+dwAPyqqCCGTLODwCR67vyXm8o5lKVK2bgF7t0oeOy9vpjRUPKKixsKzlQ38Wb9NnW2JRGNm39U5746GcHfRWF75DMfxJjR2ctHJVcHmJ2gKyLpGMOdHrkOJTp2QYtb2JTIjmE/d1bcIJrVb8iZ7en/uqk3vpNleic3OFYQNumXhrueP+VeEJ6bNa4DUL/05C3NOSGirq8MerwRhg1M2wwob5GsHrgnOaSbtuIulp3prBYZOO2stWEofoq045SG4ae6MlMB3npKKHXwVEpMcDkH7aVg6G7emwswwOYNm9h2kekiDntPmmVFIm+PhYjcJbi+wlRRTJEFJbYWbPNJsz8m1QY3qLLhW2BjJAww0wkyfuREPzOXdHKJbhPy9gRJ8hVOCIRnx3lbRL9b4nKPBRoPdSPR1drnKfj9DV5E/5KT7Nb37g4Kh1+CAV/j44fA7kMTB8UgxFvzJci+ORDj3JsEMU7+9yVLEo7ZGBVkGPR0Q0GHa0CPe5pWwR5uryAX2aBqpsFRfVWrn1u/HqL5vsZqRGHIAqLaSsl4B+pnKd6A4NLL2IcPlZwdODbU7eL7RkTD5B2DT5I6t+NTiXGDRzfjx+VKwoeGLsAmrZIJfJmg9gKL0GwelNaVvUdKRlLdNtt/ubRZZuLWxmU/zx9JJXTRw8ZuD3Z3yN7khSfIHcRfVM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnpCcC8veUY3QThJMG01bEFIQ2s2azNlNk9pbEVldURndmZwZkpvNGRqa2lX?=
 =?utf-8?B?T213WGpJY213aFl6M1NWcjBaRExMVldFY3kyWW5wM3h5YkZ6OHdSWVAybi85?=
 =?utf-8?B?TGh5WWljRTdqQ0htaE4zdXFNdU50b1VPeUZGL0FrUjVqeFpjM2hRMzdtZVBu?=
 =?utf-8?B?OU9MVFpIeGswdXdlT1d2K3JpN1NmTWtOamRHSktSbkxnWllhU2ljVndsenRX?=
 =?utf-8?B?QzB1WDg0N0hMdVg2OHNTRVR4TnI3MlpUdWNVSlZkbFIwMmo5WEtUdjhQWm4y?=
 =?utf-8?B?VGZlSjNNRkJ3VFZXMmwxZERXME56RlZQZDZVWFc4TDlDaW1YTTVnNmdFQWd5?=
 =?utf-8?B?SXIxaktDdVc4bGdqR3NCRmdvcFdMNnJOUjduT2REelNyYk1vYmovTjhpZzNS?=
 =?utf-8?B?dk1GeUVHK08rbTBvemhQZ09MeGF0R2FJYjBhZ0dWRFc0STV6R0xtTWVLSTNv?=
 =?utf-8?B?d29VVGNEQVdqbEhKVGo2bUVMMVBVbVNKblpHM0FpbXVLRFBXalRjWGJQc1lG?=
 =?utf-8?B?VTB6NkhTemJBU2dNVWhmeitXV0RyZGEvUjIzT1FYTTEvY2FQOW1BcjJUZ3Jy?=
 =?utf-8?B?eWh6T21uWjJQUC9SZE4wZWhlNThEcmFOcWg3L2tTS1ZWRXRRWDRXY3BkZHpB?=
 =?utf-8?B?VEdRQkxIdlRlY2pycjJnRlk2TFVFMkZzSmRJVnpLcGpIK2VuOE4rVDBwVmRW?=
 =?utf-8?B?WXlVanZUV3ZHbmtRZjUyZHJWckZMMzR1amtvYmNJVEZud1pXeVE0TENWRXlp?=
 =?utf-8?B?V2tVeTgrenRnVGhEMDEzRlJFRTJncFJmaGQ5YWRMSFM2aTl2LzNZbFgvY0pN?=
 =?utf-8?B?TGREV1dYZjgrMFkwdUFGcGVxL0R5VEJsdXF1Z05UUXl2UVdUZkxJZ2MvbTk3?=
 =?utf-8?B?bHRzWG5scUZyVGVwYjB0WCtUazFERVJyanNCUDU3MU00NkwveGhDMXgyRHFp?=
 =?utf-8?B?M054VjdGb0lTU2VzbWg1ZUtocXZKRnpUbmtmVzAyOUF1V05WcGxxTmdGeUFX?=
 =?utf-8?B?Q1ltVW04bm5nRy9LMldtNVBkVmF4dDBhc0c1UWdNS0w0MDRIWms1YlVwLzdR?=
 =?utf-8?B?VWpSZ3gwTEhDNFMrMmtXbms1SG84SkFvR2c5MXBuYWplU1Voa1d3TGpjZCtF?=
 =?utf-8?B?UFpHK0hIRWwyME1KRTVkQ0E0amhIN1FkTlY1ZXJCYWxxZStsYW1WRGZ1SWhR?=
 =?utf-8?B?emk0MGlnaFBxaS83dE0rV2ZpQTJubXBJdzBsZUY0bU9FQm8ybmwrK0VjSExI?=
 =?utf-8?B?dTFGWUt0RVV3UzhKL1dHb1NzNVF0TjYzSHN4QkxQcS9qeGJmZ2dKZ2Z3M2RC?=
 =?utf-8?B?YWhFS2JsWEtuQVovTEZuYkkrWnhGaWJVRUp1WjJXa0xOaFNBZUhiYS9KZG5r?=
 =?utf-8?B?LzIrUWRZYU1oMk5yVGV5blFqTi9nL2NWaGc2SVNUL3hBNFNLbmZJazVBNmZx?=
 =?utf-8?B?a2k0MHZLK2RmREZvVm1CY1FoS3JNMzJ0SkdHdTBZTDZPRXJtMWUvVUQzcE1B?=
 =?utf-8?B?Mk9mcE4xSmMzcVQ0bis2TEpydWZ0ekZhTjdlV2ZHSUdQNnpIcFZzN3MwenNo?=
 =?utf-8?B?eGxHVEZsK01sbkZhTEFsVEhlT2hjdU5GcEMybXcrUWFrYnZ3TTMxc1JVUUdZ?=
 =?utf-8?B?U3hwOCsycnlQZVlLcllmOGQ3b1RhZXl2QnBSWU1hbXM3L1VSV05yRjBIUWsy?=
 =?utf-8?B?V2hpR1ZZRUFRNnJsSm1kYS9tZmpzSEhBQkFlT0NhNDlDVlREVkF3WmxHRVZI?=
 =?utf-8?B?MDl6enlqcEZWWXRwS3JQeFdUdzVGQ0xXUTZQdEI4Mm9PU3hHLzM5TkFvelFK?=
 =?utf-8?B?QXYzWkdGRzlqdTBQYUgra1kzOUJWUU5YV2tGRmMxa3ZHSkkxeXc4S0hCdEgr?=
 =?utf-8?B?K2xjdmhJYlZQOFRFcERKclF2VTZMLzVhckdzRUg3czkwNWJ0OFdmOVAyZExT?=
 =?utf-8?B?ZjJ1RDV5dEZsdkd5NUp2RDdrUTlueU53dmZCRzJJK05ka2grVGFaVU1Tamcw?=
 =?utf-8?B?cXNCUU50SDlLMm8yWHNuZ3BzUXUwWkdDVisva0hlZFdnSFlWN2NyS1ZONzBu?=
 =?utf-8?B?MEw0K05hR2lGTlAzRXE4NU9KZzJzT1RLVFRwU0srbDNjczgzcFlNbVZOeVJI?=
 =?utf-8?B?M0ZLR3puTFR6eXJRV3huMnJsajZkbFF1SkYyMWZYUnlEYjdtaFJtck5Wb2Vl?=
 =?utf-8?B?b3FPSUx4M3dZVEJiMFZkLzNRSjNQK29BTTB4dTJaZmo2MjdQWGdmV0FKMUNZ?=
 =?utf-8?B?MWUrNTVzSGdvY3NTWENzTTN5b3BZODJkaDBMRFN3V3g4TG5ZY2k4OVl3UFNt?=
 =?utf-8?B?YjBBWjBQbjd3bWRrTGFmUFN1aE1mWGM3Tk5YYThyMXFZZWJyZzA2UT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c2b986-5668-46ef-e45a-08deb0ccc2c1
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 08:51:02.2616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ci+4SUTKvG+XLdz5P5bk+hmrRI2mnPRnv6NXDRA3Y7ZPEZa8KKzuwHkF6LS6PqbSR8KCFuOJhaRCRJd80nBZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7702

On 5/11/2026 11:42 PM, Brian Masney wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Jian,
>
> On Mon, May 11, 2026 at 08:47:31PM +0800, Jian Hu via B4 Relay wrote:
>> From: Jian Hu <jian.hu@amlogic.com>
>>
>> Add the peripherals clock controller driver for the Amlogic A9 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/Kconfig          |   15 +
>>   drivers/clk/meson/Makefile         |    1 +
>>   drivers/clk/meson/a9-peripherals.c | 2317 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 2333 insertions(+)
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index 3549e67d6988..48a15a5e1323 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -145,6 +145,21 @@ config COMMON_CLK_A9_PLL
>>          device, AKA A9. PLLs are required by most peripheral to operate.
>>          Say Y if you want A9 PLL clock controller to work.
>>
>> +config COMMON_CLK_A9_PERIPHERALS
>> +     tristate "Amlogic A9 SoC peripherals clock controller support"
>> +     depends on ARM64
> depends on ARM64 || COMPILE_TEST


Ok, I will add COMPILE_TEST in the next version.

>> +     default ARCH_MESON
>> +     select COMMON_CLK_MESON_REGMAP
>> +     select COMMON_CLK_MESON_CLKC_UTILS
>> +     select COMMON_CLK_MESON_DUALDIV
>> +     select COMMON_CLK_MESON_VID_PLL_DIV
>> +     imply COMMON_CLK_SCMI
>> +     imply COMMON_CLK_A9_PLL
>> +     help
>> +       Support for the peripherals clock controller on Amlogic A311Y3 based
>> +       device, AKA A9. Peripherals are required by most peripheral to operate.
>> +       Say Y if you want A9 peripherals clock controller to work.
>> +
>>   config COMMON_CLK_C3_PLL
>>        tristate "Amlogic C3 PLL clock controller"
>>        depends on ARM64
>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>> index 77636033061f..2b5b67b14efc 100644
>> --- a/drivers/clk/meson/Makefile
>> +++ b/drivers/clk/meson/Makefile
>> @@ -20,6 +20,7 @@ obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>>   obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>>   obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
>>   obj-$(CONFIG_COMMON_CLK_A9_PLL) += a9-pll.o
>> +obj-$(CONFIG_COMMON_CLK_A9_PERIPHERALS) += a9-peripherals.o
>>   obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>>   obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>>   obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
>> diff --git a/drivers/clk/meson/a9-peripherals.c b/drivers/clk/meson/a9-peripherals.c
>> new file mode 100644
>> index 000000000000..338a91c473ea
>> --- /dev/null
>> +++ b/drivers/clk/meson/a9-peripherals.c
>> @@ -0,0 +1,2317 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>> +#include <dt-bindings/clock/amlogic,a9-peripherals-clkc.h>
>> +#include "clk-regmap.h"
>> +#include "clk-dualdiv.h"
>> +#include "vid-pll-div.h"
>> +#include "meson-clkc-utils.h"
> Sort the headers.


Ok, I will place them in order.

After updated:

#include <dt-bindings/clock/amlogic,a9-peripherals-clkc.h>
#include <linux/clk-provider.h>
#include <linux/platform_device.h>
#include "clk-regmap.h"
#include "clk-dualdiv.h"
#include "meson-clkc-utils.h"
#include "vid-pll-div.h"

[......]
>> +static const struct clk_parent_data a9_nna_parents[] = {
>> +     { .fw_name = "xtal", },
>> +     { .fw_name = "fdiv2p5", },
>> +     { .fw_name = "fdiv4", },
>> +     { .fw_name = "fdiv3", },
>> +     { .fw_name = "fdiv5", },
>> +     { .fw_name = "fdiv2", },
>> +     { .fw_name = "gp2", },
>> +     { .fw_name = "hifi", }
> hifi isn't in the dt bindings. Should this be hifi0 and/or hifi1?


It should be hifi0，I will fix it in the next version.

Thank you for pointing it out.

[......]
>> +
>> +static struct clk_regmap a9_sc = {
>> +     .data = &(struct clk_regmap_div_data) {
>> +             .offset = SC_CLK_CTRL,
>> +             .shift = 16,
>> +             .width = 4,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "sc",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a9_sc_pre.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
> You can use CLK_HW_INIT_HWS() here.
>
> Brian


Ok, I will use CLK_HW_INIT_HWS instead, and the same below.


Best regards,

Jian


