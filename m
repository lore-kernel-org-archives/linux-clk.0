Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022102.outbound.protection.outlook.com [40.107.75.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB672D877A;
	Thu, 11 Jun 2026 13:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182892; cv=fail; b=rfDYzwNqM15whSnoQRMB6K9ReuKmVT3BOOIpW6qkGMtByncMNN+O+wwE3fFs2EMUJl+/1SFy1wiGvAY2VYtlhDJ2yq5uSO8FzaiIb75TMNzn8RPyol5GjwKTGKCvnIe9YmEPnhygZpN8CyQUoZwEqNwgudf4TDHyFrqtZlrJqjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182892; c=relaxed/simple;
	bh=8GwUkL1+ylgTW7jxRFi41WjgiMeAX3MdFyyhfTU2loc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nfj2CTfeCBiwfcfZpMelu3o0zLanUOb4imSS2/XRzBFw7sBIQoa9x+Tku2WLy9gAGQifuajJJ/0HCdyMApWhcVWCBNuV08o+LJB24Wk5KiTIu9PbxxP7oJFkDpznxwGPZM/C/iOBj5QkOqtbbrOy5Z/Hc7bieQ/6uOtbLhEPHcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=TgKlWuNl; arc=fail smtp.client-ip=40.107.75.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="TgKlWuNl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mn1xvC9rnZwQ4ygOT4KZTPfotkwJTNmkjfvpOlaTyEPII41zAwDPIHhFf71Zn/hlRuum+Go55iST5qSHxQRilnrn8dydb9OPMKAFgPiuyjGc7SOnY/5BsiwaqPUV18i3ZZEg5DP1JBVAPP2CSK3g3oj5XrHiYpkIDPvBSOPNLXOGHOI4vPLlV1a2WVJddwaWHaUiZy8vADL/VX8e4QYtC8c5as3FRvCILjbz+836AMuJon5A85IEUTqAMZlDFFo9WzJeZK3kCn8pUT3s5dDJ87mtmC4I1kseitjbIKGiZBTFpVAjZyjjJ2ScB6NuBtLct6HTE0MGVYL9rgK7vPIv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpNtlxvQGODKLu9j5qUP0DZZNGnBdgnZlbYhhWyo8WE=;
 b=bMcUHdJafY90TjXaeCv6ybHcwWv26EC+neU9aOP6Sz/EidOlkld7nmFcHSaz8sJrTOwSzMigPnalg2+PTPrnMGq4CGCQoFgelmw+VyDFPyiy07Tk9Mo5LM+Xs6A109PlCkZvquIvImUl0jwb0Z7NSjBUgtigm/vWfwT0zYcHJORlCvVJZL0E/Rj6GisRYvOcKBrYS5WLI+Sn3ar4Za398MSIyi1I2/Jp0gBqfsO71huXsN3XIBT0A16yJTCcdG046U/CcH+Mj08NUt/j1lKmt2tQQtR5cUiEW51xvboFDJoxBf/Z7Z93NbrwvWx1g5seSCDOxT4x5lFwY4j/OC086Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpNtlxvQGODKLu9j5qUP0DZZNGnBdgnZlbYhhWyo8WE=;
 b=TgKlWuNl/On/ZGiHdH8nIXeMbTzmHhzwa0lZYh0xSDv3oQAx1/laCD7Edc1JFNkyovcKQ1JA8BEvF2WKzs3+l1gBP1787IxpmiFb6hHiSouNwL5Jd7bPGucAM2td4rZbv2IW/ZIT96HGUHI4etBOGixWJLa/g38ie014FD9ihIzXRaVSi4wt+TETZD/4SF50G3hBQEw3K1KTg0AJaihgHe8tJoqq4T4KABYIshj7vnNq7k0Efwh0jsbUjgs1ccho6SQw2ovRFuILpAnRFPNlF5L3mEbenutucSrY2Ey7gmXO1FrrEKnazcjITm+NhlHSzc7oBHKic7ycQIOj1AE3mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEYPR03MB8429.apcprd03.prod.outlook.com (2603:1096:101:20c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 13:01:24 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 13:01:24 +0000
Message-ID: <01324552-3de7-4e0d-8fcb-eafd974a1d71@amlogic.com>
Date: Thu, 11 Jun 2026 21:01:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] clk: amlogic: Add A9 AO clock controller driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260610-a9_aoclk-v3-0-b7592d6c31e2@amlogic.com>
 <20260610-a9_aoclk-v3-2-b7592d6c31e2@amlogic.com>
 <1jjys6fuhz.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jjys6fuhz.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEYPR03MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7aabb7-7b62-403b-aa9d-08dec7b98ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|18002099003|22082099003|6133799003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	RDjzcMd9lFHehlDq151XeLnOW7qlSR41fBWGzgyHDSyWL2TOmScqXpdM9lfcdl7R35kM0u8XBCjYZWhlnxB8CnhcYhMzJG0kcTjhf/9q7jTu083lLul8qFTFpzABRY07mjAw5UesFb8fqHYwue0bHprdfegjTy4LBhzHN6s+bg92qanPxrAaKI2nwnQxnrXeNgIal+aJ0HH30ejpT09rA6RKGO6pxDHgHhEfU6AD3hzHScYEQp7uuB3gIuEDgMy6aJlLSkKU0dkyvNgaoSJeM9Ti+HHeGThaJ5WEyqgSRnHiLjDC7ZtLdlfXBohoOlWU8zoCB0JSXuimoQfbPLH0+2r8YioipFqy22PUXyzIuGD400ZioZ5hi3uAPgNfO9jXQ9k+2X60+N1fojVtg/w6jDuWFJDIH+8SkQTRKcMdNI43AfaiHnQvmD0sOZHVSYMJ8LNn4VbsuvVOnzFuel45CBFTfKZPivO/oXzi0v6Xnz7JvpigeFyHzOfOItGPIhrc/V1+MrsOfqgpB7/+EktxnN92JmjIoXChF4IqKoCCJUiE25TRZg6g97vFwr6Wm7L1ZciRYyLgPT7VXUDoyCOV/wPamjeIrjFHR4jZQ68jMHYZILOaFoEY+S3oCQ3sxOM3SFwpo34HpJTLGvcpDx9pQWM2jduJOO7OVDnXAxGGf5Qn0wnhynDU6s+kEM4gFGI0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWcyd3d4WGpsTHpUUldvSTZlcnZlZDFIcThzbWcrNThIYlkwL2lRUXgxQTcz?=
 =?utf-8?B?akNxSmppRkVmLzAxcmhIRURpbmNoZFRDWmdsUUFkK2xTYmJ4aHpiOVpTMVNr?=
 =?utf-8?B?R3RoVTVOY1RSSlVLeDJKeWNST2dHMEtpcVk5OEVISEk3OG10ejBJbEV0eWVT?=
 =?utf-8?B?NW1uWEF1VCtRT29HQjROd0dkaG5LcGlLNGJCVGVib0dqZzBkVGhrZitaeU1s?=
 =?utf-8?B?SWdBVFZGaEtLZCtGNFF5a1gvV0dIM0NrYnJYcTVPN3MzYzM5cDRjMlgxTFR5?=
 =?utf-8?B?VklNSExZbnFZQmVnaWJveXEyTmpBK000Rzc2SVZrQnJQTW5sRjZ6ZTIwK1Qx?=
 =?utf-8?B?TGcrUlpBcC9pSHMzTVZSQ2pMdWVybTdYUDg5ZWR3Z2tSYmsrVDc2bWZGNkMr?=
 =?utf-8?B?QTBCTzhrYlVTQlBUaWY5OXZDTWRRMXdENmdQNHFBWGp5R1ZWUEhlSE5UbWZ0?=
 =?utf-8?B?YldNVjV1UzhYVUh0R2cxdWI5cDJzUDd2U0dKVlJENmI1M1NSWGlOMG96L0lJ?=
 =?utf-8?B?T2poR2RPMVk2Y3hBZXZ0cGNET0NRYjhlaElYSldPVVVQb0tuZ21rZ3JiMzM0?=
 =?utf-8?B?SDc0R3N1Qk00UmZPNFhqMlM3ZVpvVkxlbzlCeGFaTm14bSsvN0c3SUJ0Mzg4?=
 =?utf-8?B?YVUva2VYa0pTWU82OFNJRm9NMlhXaGR6V1FJUlhMVklvUkw5cnlVQ0Y0a0Z1?=
 =?utf-8?B?bndzRHgzTXBQbVEyOEhCb2wwSXdxY1BnK0VwVTRSOU5jNmt5VkovL290cSsy?=
 =?utf-8?B?YVorZ3hSeExMaWRaYWI0amE3NVlBNmg2aGdRL0xLa25WMitqZFF2cFFkVzNZ?=
 =?utf-8?B?VExGR3FxdG9kaHRmeE5jZENXczdVQ0c3TzVXZjJzTWZTRC9xOVdWSjJ1a1Vz?=
 =?utf-8?B?VkJzNlFtUVJ3RzMxZDZTUVBFekltTmJmcmROZUNQbHlNa2xKZFVEY0dzOFJX?=
 =?utf-8?B?V2hubm1YSFZRVUJtWHpRVVlYRWZUYzZIMTVNSUZhUllWa0VmTjBmaWNPbisr?=
 =?utf-8?B?ODZRWnF5dGJCY2hBOWxKLzk1dXM3VFdING5iWXZmNHRhWkxNYWZpZCtsTW9a?=
 =?utf-8?B?U1J1YlBhWHJoRjYrT2YxbU9hSTJqUWxhclRpbHpCNVpCRGRheFZ6Z2tMQVIx?=
 =?utf-8?B?UVdwdjQ3cWF2RStCTHdScU9UNUhQekpVdEp5dVlyeWZKeVQrano4ekVqc0VD?=
 =?utf-8?B?dGMvaXQ4aHd1ZFgvWmN0K2pwbnJYRHVWbzQ0NWFicEo0b2t1bXVHVnJPb1Iw?=
 =?utf-8?B?bXRGTUxKbENCbldObnFtMlg0dFRkN3NpanBVVExZNFRVYWV5WEloM2JXdVhE?=
 =?utf-8?B?a3NMcFdCU3gvRjV0Tm9qdVF2M1RzYTZyTXc5d3RGbXlOTUF5V1FpVGsrS2E4?=
 =?utf-8?B?Tnk1d1hiRis2YUxlVkJTQS9peEp5YUl0eFZNSXl1TjEwaEFtYVJZaVVEemJN?=
 =?utf-8?B?VWVhYkVkYjNOMWJRa1lVenVZTkZxc1I3NklEN0x0b2Nhd2lIdHV1ckw3d3Vp?=
 =?utf-8?B?S0MreFhkQjNrSzBxMUVLckNEVit6cjZRU0ZVSWg5MXRNeXQ1RW4wcktVaER1?=
 =?utf-8?B?WFJ2K0hiN294cmxDMUVXbUVVaHZnY2diOEJyNUltSDFOUUJteXFOWlVzZk9K?=
 =?utf-8?B?NDMwa0xPaHRCSDhCOHlWU3J5SVQ1Q2NCWFJjSUtqbFkvOGs5L0RjUmg1L0d1?=
 =?utf-8?B?azY5bXlSYm5tS1k0cGkzTEd5QU0wZFdkNGVhUVVoMURFenRaYjZHeDRXMUNj?=
 =?utf-8?B?bFR3TjVDVE8reGxUem40UVQrNy9PS2N1SlR6WG5lOUFkTm5ScTlTUzBBZTYz?=
 =?utf-8?B?SDYvT1h3elk5dE92YUV4Zld0dlBReFZRRlJuUXI0VFZhSmlSbHoyY0xrd2s2?=
 =?utf-8?B?SitSb2dsUk42cU9rZ3ZyUy9menI1N1BlOEhjOTBHcDhXN0FFT2J1T1pKYU45?=
 =?utf-8?B?bjYyMk5La3hJRTViSU1hM280UVBqYUZqWXBDSFk4MGo1V1l5NnRyNmVWOUg3?=
 =?utf-8?B?TjFvQU8zV1dMa2pzQnRYaWhVdGRRR2R6Q0F4Snl4VHdZS2RjSUtnZWhhdnp0?=
 =?utf-8?B?eXZPRUdyS05lZUI0eGRtYTlJaFNveXU1YzRNak5Fb0NOUUtoeGtwVHdGVzV0?=
 =?utf-8?B?SDdXMTIzaStSZS9EU0R1WkhvR25temRycCt0TVBDekdLOFk1SWJhYkNDR1lD?=
 =?utf-8?B?bXRHWWVYZ1JzTDA2MW1BTjJOSTliaVBmaU1wMnFWd3lTSW9Xb1VTOEJvZ05w?=
 =?utf-8?B?ZjlBTE9XYUg5NEtUdkMwQi8rZkp2QUh5REdBVEoyMXFwaFJSS0t1ZERjcVlr?=
 =?utf-8?B?TEtiaktOdnhtRlNCMlVFQjhpN1VvNkhYZExWbENiSXd3NVR4R3ZKdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7aabb7-7b62-403b-aa9d-08dec7b98ac1
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 13:01:24.5293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ca5xgnAA00D2V6qujyYjPB8beI3yhnT47sO2rKEtUEf+KmD8PQfbXGZJjHQ+UdQEGUwvYMeOYBB1Y+dEdEtfkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8429

On 6/10/2026 8:30 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On mer. 10 juin 2026 at 16:23, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>
>> From: Jian Hu <jian.hu@amlogic.com>
>>
>> Add the Always-on clock controller driver for the Amlogic A9 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/Kconfig    |  13 ++
>>   drivers/clk/meson/Makefile   |   1 +
>>   drivers/clk/meson/a9-aoclk.c | 431 +++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 445 insertions(+)
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index cf8cf3f9e4ee..b71299898197 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -132,6 +132,19 @@ config COMMON_CLK_A1_PERIPHERALS
>>          device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>>          controller to work.
>>
>> +config COMMON_CLK_A9_AO
>> +     tristate "Amlogic A9 SoC AO clock controller support"
>> +     depends on ARM64 || COMPILE_TEST
>> +     default ARCH_MESON
>> +     select COMMON_CLK_MESON_REGMAP
>> +     select COMMON_CLK_MESON_CLKC_UTILS
>> +     select COMMON_CLK_MESON_DUALDIV
>> +     imply COMMON_CLK_SCMI
>> +     help
>> +       Support for the AO clock controller on Amlogic A311Y3 based
>> +       device, AKA A9.
>> +       Say Y if you want A9 AO clock controller to work.
>> +
>>   config COMMON_CLK_C3_PLL
>>        tristate "Amlogic C3 PLL clock controller"
>>        depends on ARM64
>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>> index c6719694a242..f89d027c282c 100644
>> --- a/drivers/clk/meson/Makefile
>> +++ b/drivers/clk/meson/Makefile
>> @@ -19,6 +19,7 @@ obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
>>   obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>>   obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>>   obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
>> +obj-$(CONFIG_COMMON_CLK_A9_AO) += a9-aoclk.o
>>   obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>>   obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>>   obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
>> diff --git a/drivers/clk/meson/a9-aoclk.c b/drivers/clk/meson/a9-aoclk.c
>> new file mode 100644
>> index 000000000000..dd9fd8d24702
>> --- /dev/null
>> +++ b/drivers/clk/meson/a9-aoclk.c
>> @@ -0,0 +1,431 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <dt-bindings/clock/amlogic,a9-aoclkc.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>> +#include "clk-regmap.h"
>> +#include "clk-dualdiv.h"
>> +#include "meson-clkc-utils.h"
>> +
>> +#define AO_OSCIN_CTRL                        0x00
>> +#define AO_SYS_CLK0                  0x04
>> +#define AO_PWM_CLK_A_CTRL            0x1c
>> +#define AO_PWM_CLK_B_CTRL            0x20
>> +#define AO_PWM_CLK_C_CTRL            0x24
>> +#define AO_PWM_CLK_D_CTRL            0x28
>> +#define AO_PWM_CLK_E_CTRL            0x2c
>> +#define AO_PWM_CLK_F_CTRL            0x30
>> +#define AO_PWM_CLK_G_CTRL            0x34
>> +#define AO_CEC_CTRL0                 0x38
>> +#define AO_CEC_CTRL1                 0x3c
>> +#define AO_RTC_BY_OSCIN_CTRL0                0x50
>> +#define AO_RTC_BY_OSCIN_CTRL1                0x54
>> +
>> +#define A9_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
>> +     MESON_COMP_SEL(a9_ao_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
>> +
>> +#define A9_COMP_DIV(_name, _reg, _shift, _width) \
>> +     MESON_COMP_DIV(a9_ao_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
>> +
>> +#define A9_COMP_GATE(_name, _reg, _bit) \
>> +     MESON_COMP_GATE(a9_ao_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
>> +
>> +static struct clk_regmap a9_ao_xtal_in = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = AO_OSCIN_CTRL,
>> +             .bit_idx = 3,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "ao_xtal_in",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "xtal",
>> +             },
>> +             .num_parents = 1,
>> +             /*
>> +              * ao_sys can select different clock sources. One possible clock path is:
>> +              *   ao_xtal_in->ao_xtal->ao_sys-> ao sys gate clocks
>> +              *
>> +              * ao_xtal_in is in the parent chain of AO sys gate clocks.
>> +              * Since some downstream clocks are marked CLK_IS_CRITICAL,
>> +              * ao_xtal_in must remain enabled and is therefore marked
>> +              * CLK_IS_CRITICAL as well.
>> +              */
>> +             .flags = CLK_IS_CRITICAL,
> Please allow some time for me to reply before reposting.
> See my answer on v2.
>

Sorry for reposting too quickly.

I'll allow more time for review feedback before sending the next revision.

I've seen your reply on v2 and will drop this flag in the next revision.

>> +     },
>> +};
>> +
>> +static struct clk_regmap a9_ao_xtal = {
>> +     .data = &(struct clk_regmap_mux_data) {
>> +             .offset = AO_OSCIN_CTRL,
>> +             .mask = 0x1,
>> +             .shift = 0,
>> +     },
>> +     /* ext_32k is from external PAD, do not automatically reparent */
>> +     .hw.init = CLK_HW_INIT_PARENTS_DATA("ao_xtal",
>> +                     ((const struct clk_parent_data []) {
>> +                             { .hw = &a9_ao_xtal_in.hw },
>> +                             { .fw_name = "ext_32k" }
>> +                     }), &clk_regmap_mux_ops, CLK_SET_RATE_NO_REPARENT),
> I hope my view on this is clear as well.
> Let me know if it isn't
>

Understood. I will drop all CLK_HW_INIT* macros and revert to explicit
struct clk_init_data initializers for the A9 clock controllers.


[ ... ]

> --
> Jerome


--

Jian

