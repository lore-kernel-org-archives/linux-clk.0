Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022143.outbound.protection.outlook.com [52.101.126.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0855E2EBDFA;
	Thu,  2 Jul 2026 02:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782959086; cv=fail; b=BzaftKHBPRZ8alOPR9MmSrwmyZ7woyRS7VI1axq5n4J2fIp05FYrmWrPpKRPx+/ddTkokENpd79UE1nSJZzIb4JjWFynoHCp3rgqpEzfuquAD4Kt5ujnp/EcfsUivZNfx0Ve8H61mPf+MsdVQLEfICipIUrq5OUCUPw2IJlCnhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782959086; c=relaxed/simple;
	bh=v5Ihm0VfPh9B3/xTKEzBEw8TdfEY3BBeflOtBOZrpoA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u+GY6NPfYiAyR2iTxAlA3Og77E4Mnz7I8EmqQvEiW8J5T68+xAWwR00sjlbKF1IXugKibtdYYh0T52AhFoEqfZUkWBaE/yiZ6c/C8lbNGiUEZssnq7yFee9fibBMLSxzRmTZXa3MXC4RrnU56dc8Dw+GatWRg1iRH0HBkFNXAEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=getOR5y0; arc=fail smtp.client-ip=52.101.126.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="getOR5y0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QM7hGW0lvoxgMlOASfDg1NTeZ0q51rdR7u6k1sr6+rHuT+kC6WBJU14gtcTj1ho2alxl5yWioTypLBVgZBJ5sRamrzUxJCuJSSHjAo6I0hmQbniTwQyYboQhSf+0m1B8XUbxPSAr1G2jIXL8COrn5QxzhiorTcqzTLsKJrjSuUDVSu1hlLhtzynYIs/pufxyrulbUkHTfDdQAI1Pee1Kt8xpd4171GmJ3npTQpAfMzNU2XDKKSR1o1lGDZdfw61iHljwQKeYODnCf7arpGA34QHkxvLVqA8wN2dzKGBC7w8xm3iK11dXgQHQKnnwYZOR9wPAv7ebV3rBs9LvCn6BQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUMtmtFAOoS0mobbfo/U8vPvsCN33Ueu0H6AZdVSxhQ=;
 b=kEpiQoxfuo2olDSick7PGJpEce6OXU5G9l+Mxkmwqg1mNmH6rtn2E70ohckZAYaisEWVjluusxI5pkS77x+6XIG4l+S5AhR98tw4E+elQpYqK9UboIqYPmrjSSZWvgPrWS/8F1sq44RyKNYXdlhzDDimFaqSiNezbe1/TxB9/NCQ72zlmc0aPNVlQENe4hx35CisWXq8OV7PxiaPwbZOH/aw+qacUUFciuEAccS+ZYEw3QZz3wVgITAbkTR4AYs74dqPDJQvbQkdqyY6AgCHITK4ClqF61q6FUefKa7uWanSPfvSdGA3/nzCc9fXINiDMm+qWVhzWucKtFPy0NW7Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUMtmtFAOoS0mobbfo/U8vPvsCN33Ueu0H6AZdVSxhQ=;
 b=getOR5y08GGIgKRTtLf0JT2jkfPukXgrO9UHHC8ZVyhW2TAsKproc9E/Km+w4Lg4EDLRhsfTurGLju4RQkk9kQE12SBNVgD58Pz4whoGir5H16xNY/SIv52LJWJSZGZqlIoKv5mdL7NawwUAj7O/DJAmlmXWKWC1Tlmaft7Pghdu3mPGpumB7G3VyQVOqnQ0N/O86U8R6KdLL4KmpmrIV6fCugtEd0ZF3aJGxz5ipiFoIJ0vnEHuUprap22vmVXDpBoNJCF6RP8gik+eax0XNTVibWwWV5hAqjsvsv1OB8ZMAEuKAyGKAzH4MbzcVGbKpxpyBzG2cp/jxeEM5zs32A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYPPR03MB9518.apcprd03.prod.outlook.com (2603:1096:405:383::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 02:24:42 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 02:24:42 +0000
Message-ID: <6af3868b-eb1f-4bf4-89f2-98141ff264f7@amlogic.com>
Date: Thu, 2 Jul 2026 10:24:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] clk: amlogic: Add A9 peripherals clock controller
 driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Brian Masney <bmasney@redhat.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260701-a9_peripherals-v6-0-9630f39879e5@amlogic.com>
 <20260701-a9_peripherals-v6-2-9630f39879e5@amlogic.com>
 <1jwlve7m4i.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jwlve7m4i.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0004.APCP153.PROD.OUTLOOK.COM (2603:1096::14) To
 KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYPPR03MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9d134c-6e5f-49cd-484d-08ded7e11316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|22082099003|18002099003|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	NH+SfXTlY8QLjoT/gI5+Neou+A/Ka7MPudVQ42WZksGMJkg1Xw/HtmNX3S2CSKIyye57xDW9XDgu2DEHeXaqv4J0epAG4E0pizB2K/qtG/omFYobWS3WsCfTXO5P52qJLamRTOKfSjDEsTqk7t4y1rkTEQoXjPQN49b6BpYR3CXKnx5tlZm0Eq7u3Zy9qHIDTi80ebZyLYVKKzUOI8pyC/EbVEu/lHCg0bE2BEnCkKQR5x30M9vAIUXfBg3zeHwuGACZwn74ZidYIQZqXyegflo9sW/djdoPSkwhnxaRkAlSUtHBCMEV5wDJbipLmSFHM6Os7XTGxCY6Aqh1LvM21cLkTcC2juaCxpb5ZI4Pt1NTrT6i3EkbulkAxMw3mAT2TBKg/pac/H5AGcnWbgPLxO/RgAyPL/PfEvPC3MkY+39VudzJ5qsccNvWXcHgR/qBtLK6Oyl5x/QmrfWOo+NghgoIgRTA0FGbGFSBKdQMZx6BryePGAzJjCFV3zZiqki/tr06c/PkMGbabRb6imhEYHYgNHCpuQZCH1vpAzHF7/fNL+9vBpwrqBMuKUv7ig2QgpFSWo68tI0HVpKs7FpTywPTsD+iE6Y9qR3Hh3gCS9tw6ZVE8i9UhS56CocLUciXDonlYpVUy3RJTb0hTjIpDu7sHGPv2PLommzOc5isUvc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXdUaFhHaG5EampMd0RVc01qRGtHNUhDck5MQUxhcGtGc044cGkrcm4xOXZP?=
 =?utf-8?B?elhlclJPOWlDQ3A1MWFoM3VrelFNeUJZMVo0UU4xeFNPMnFBOFU2T0JxSkNI?=
 =?utf-8?B?UkVCbWRnOWQzMHN3UUV0SFVUZzhib1ROZUlnVUluWkR4dGx4djYxM1o0TnJi?=
 =?utf-8?B?QStqZXNMeEdiZFQwMlN5bFBwNnlhU0F4N1VlT2xTZjFubDVhNXpBem5wbXh2?=
 =?utf-8?B?ZWZTL3VBTUVYeURtRE1XU1dISi9Bb1RCMGt1U0JzUXMwcndhS01CcWxiSlBO?=
 =?utf-8?B?ejczTjMrSmgwbVRqTFd4SlJvN1VDb0M0N1NOU3k2M3lSR2dvTUpoOUtCRTJu?=
 =?utf-8?B?dVc0cnBkb001c0xHZHAvTDJZancydlU2cExvSFJUS0E1QXB2QmdrMDZQVm9t?=
 =?utf-8?B?czkyVUpHdjBoQzR1bFlIb0lKd2pQdzNXbXh2TzBWVDNqY2QxQnprNDBVTFZO?=
 =?utf-8?B?T1hsNnRaSis3MVlhRDdRM21CTGxIaDZ0ZHl3U2hIZzFwcGtOeWt1NWJVTFcr?=
 =?utf-8?B?TDhrVE0wTE1LTmdjS3ZDNnJKNDZDRVpmaXc2MS9HME9hdzBmRUZ1Mnk3bUVh?=
 =?utf-8?B?enFDOTlxUUtpdVV0VzRJdmpRYlEwYm9tUlFLRHR3Y0JwVEtLOWlsQ3BrcTZI?=
 =?utf-8?B?OElJQXhPQnBua1NqRWRNSUdOU3ZUZXhaN080eDRWR04welZrYnZabkVsSmRJ?=
 =?utf-8?B?c0kzL1lVOGt1NjRJMkY2VDIwRWFVUlcwSDRDa2w0OHJRSlQ5SE96VTFScFF6?=
 =?utf-8?B?bTN0SmpMdDU0N3B0WkMycW02dm1naG8vbHVYdHFyczBhV09iQmczc2hQaGJw?=
 =?utf-8?B?Ulk3M1Z5eGtaODhNOHA2YzZsdFEyYXgyQnByT2l2UkVFektKWWN0K20veWMx?=
 =?utf-8?B?MTY0K0xSVFpETlFScWxLbnBtSWlsL0M2R2t3K1RrdVFRUk5EVlNUOExlemhk?=
 =?utf-8?B?aVA0YzBVQzhROHRtbkQ5WmJNNHNDanBrSHpZbmFSY3crUFlxcDh1RHhuWEtH?=
 =?utf-8?B?RVBxN2ZNMjNsVkJhZ0k2b1R3SDdCQXNIWmc5YXhreXQ5dGpaWkZOMC9wcEZt?=
 =?utf-8?B?bCt6aElydFdqNG13dG56SEdZdWtDWjVOWk1PZmpUQ3dwaGtVRTl1SzJVVmUv?=
 =?utf-8?B?QktlWi93UU1mcWpLWVdiWklyRUpJbEI1MXRFVmRCdHpjUFFOOGxTT2krRVZn?=
 =?utf-8?B?MUNHR3YvOTNzdU1XSFBXOTFoUHJxQzVNcmhYZmtNNEFyb0RLTkl0dW4wY1l6?=
 =?utf-8?B?dGIwUGNuUkZ6WUFqTHhGSVEwb3AwMlBJbWRxdzhla0wwS2psSkFmUUozajMx?=
 =?utf-8?B?WjBKdVp4L0tGNnFNOGtnaU5zVEV5NWQ3TkYrMU9rekdacFRoWHdlMS9EVVha?=
 =?utf-8?B?R0xteU9CRjdVL0J2R1p4S1B6RW8wZ09YbklTUkR1STdRYkl5YnNGaytoNDVU?=
 =?utf-8?B?SXBqN0VNMGNMVmo0RkhhQ3lTTG9OMzUzcS9rek9TK3YrOXh2M0xLM21OaUVS?=
 =?utf-8?B?YzBFOWgzYU9xalZ6SGpXZlMyVGh5emRMWDQ1UWJsUWxkeWF4b3dIS2hlcVhy?=
 =?utf-8?B?WFNuQ1FkVmsrRkdoOVlQNVE5emJjQ2N4WWJXdlJFREQvVWJtc3l6VmZhc2NY?=
 =?utf-8?B?SkZCRVpWMlZrZ2Z2dEVCbVUybnlUZEs3VW1XOFVXS09JZFZVWjFuR0ErWldz?=
 =?utf-8?B?QWJZNlNLbUd4d1J4ZUEvZTJIeGNtejJNNTBBaU42RFJ3OHVJSTVKWUhRaDk2?=
 =?utf-8?B?cG9oa3ZseW5wRkNJNG9sSitvNDBlcnRiUkU2R2hkYVo4MWtUSUNCbzRjMEJO?=
 =?utf-8?B?cjZVQXB6SzFuVURObDU5ZkNLcWJ3OGdUUkpOWWNnTjJJaUpPdE1nK0JNbXJ1?=
 =?utf-8?B?UHhGSWdWREdEYS9qaFZLY1U5K1IrajBzN0UwcFc0QUZ1Z2lFdzVMNyt0UjJv?=
 =?utf-8?B?YVkzQXVUZGFxQmg0dzBEOWpXbUY4TTJycENDdW0zdnRiWGtGWWlrWGJNdEtM?=
 =?utf-8?B?VCs3VmdCK0loVC8rY1lpZzM3SVhnSTBmWjk0MTZsU3JvdHBZZkd1WTB4bzE1?=
 =?utf-8?B?VGJ3VFJrQ3p3dlExVXQzUkZzRlNuY2ZveU5SanZvOFhSOHRSWWdoTnNkY0JV?=
 =?utf-8?B?TFVaMVRLakpnNW1RMEFmaDNyb1RHMXE2N1g3M0NFcmdhNUUyYjl0aE5PTDFo?=
 =?utf-8?B?cUYvOWpVM0QzVE8rNEE5cnBzU3N1ODNoTXBYS1ZKWjA0UHZxU05BQTN3SUFY?=
 =?utf-8?B?NkM2cjVQYkJlR1RUYmtXLzNka1hRREU0V2ExbWZnQ2lhV3pVYUJ0azR5MU9Y?=
 =?utf-8?B?dERnN0loSzE5MldySlZGS0ZZZ3ZFVVlPcHlsQlUyWmc0UGVsRTQrdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9d134c-6e5f-49cd-484d-08ded7e11316
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 02:24:42.2964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqND9mp6mF1gzVcNxFCQbVHDRgFT05k/lM1Bji9Gg1skcFWYWKY/OLjw/sjXxGTVqv5Fy8qkR3Ic2diZOU5X/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9518


On 7/1/2026 11:41 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On mer. 01 juil. 2026 at 16:30, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>
>> From: Jian Hu <jian.hu@amlogic.com>
>>
>> Add the peripherals clock controller driver for the Amlogic A9 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/Kconfig          |   15 +
>>   drivers/clk/meson/Makefile         |    1 +
>>   drivers/clk/meson/a9-peripherals.c | 2089 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 2105 insertions(+)
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index b71299898197..5152868e2ee6 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -132,6 +132,21 @@ config COMMON_CLK_A1_PERIPHERALS
>>          device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>>          controller to work.
>>
>> +config COMMON_CLK_A9_PERIPHERALS
>> +     tristate "Amlogic A9 SoC peripherals clock controller support"
>> +     depends on ARM64 || COMPILE_TEST
>> +     default ARCH_MESON
>> +     select COMMON_CLK_MESON_REGMAP
>> +     select COMMON_CLK_MESON_CLKC_UTILS
>> +     select COMMON_CLK_MESON_DUALDIV
>> +     select COMMON_CLK_MESON_VID_PLL_DIV
>> +     imply COMMON_CLK_SCMI
>> +     imply COMMON_CLK_A9_PLL
> As mentioned by Sashiko, This is problematic because the symbol does
> exist yet. This should be removed for now. It can be added back when
> support for the PLL controllers is added
>
> I'm otherwise happy with this version.
> If it is ok with you, I'll apply it with the line above removed.
>

Yes, that's fine with me.

Please remove the 'imply COMMON_CLK_A9_PLL' line when applying.

Thanks for your review.


[ ... ]

> --
> Jerome

--

Jian

