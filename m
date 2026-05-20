Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022094.outbound.protection.outlook.com [40.107.75.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5CC29CE1;
	Wed, 20 May 2026 07:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779262635; cv=fail; b=RI6XO4w7PnWfDOsJ15Rmwg3x6OKE0afgVa5g04ZyaGsFzvij7V/qd4qM4Olsz5rHwBJ+ptjWC//mxEH0j3vY64Tee68iOjGBBGAkHLmjmWXVV1F0vT3cXD0vc9lCBuY/+Nx2uuRyYSXm4CUS4ZzCgKFh53+zp3MP85m0eGCZb4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779262635; c=relaxed/simple;
	bh=aMIHdSnRoF6hXzSr9C+ImO/3hYK6SUeBghJwIsaVjvY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ntap5nbgK+KulEdWyTdAphccb2jXmJon+a3DWZUbqO5qBVLhr6o2ng7FXlGdHJ5OJvV1/ac+G6NYt/doFzeE5ICBZTKuy8FMElN0ranYPwg1Bsw4wagFt7XNhlfz2CobShNDd67cchH7GU5PhA/hcDBJFWmFdnFVnKFAQi4uePI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=AuY91k7Z; arc=fail smtp.client-ip=40.107.75.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="AuY91k7Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaOu4sI5ObbOXuk/n5b0kE0UJlLKCYiAsEb3tDC1XVhoBO3csKIo517w6opPjk6LX2BfSHRmLLisvDYktMU1wAb0gsmts6ajNlngzc3UV3TIwbq/rpJo/QxyXyLRteXU5TH/WWQsZAo23XD2S7YHFMmDnexcNL+pMnPrzR4ZnZ0Jx+TDz3lo0WHJ8qMW9O3pB4psDb9wFs7pFU+BYtwpB2BMr6SRIoqjrqXV6eI4n3uRGBJi3hk86rO8FPYUds1ppY5S613Tle8cFZ4u5aL7buuAGF+BUCg/aY/wL9Hdgm4cMDflSiIiHjS7zAW24wd58oWD/YHQW4ejd8yQsJKgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/qIRjPDpfzLr4hZrp2fNAf3CbPfp8oO9u889Ze4v9c=;
 b=JMayNzS7bLA3B7BqwHVNjoTet01N44UFNdj5a/oI2AI0BVrq4DBR4A5+M4uA6G5NF4mpwZXyYgU8XZ0A0bKkJVY43VKJ8TQKX1ObT4GZ1/V9iCGv5P2S/sAOpMNpHhBdsmwcBPrmEjGz02f7NDS7TYtgHL/WKwQtA3TMj/s9ugAnQYAPhFIPlezsKtCRuInfqZ8+1BiwArLSqdl5hw3CsH89j5+z6qqpj441cntU+TV6/8SoqSOsDGxccTuVGI1C4xgxlKg3tmxgE77KRwr4EGX3YNRSlWxvKjq2smy6/ouVhc50KLLfvtEInzwvp+vyR1YJja5tVfz/zzXDljp9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/qIRjPDpfzLr4hZrp2fNAf3CbPfp8oO9u889Ze4v9c=;
 b=AuY91k7ZKd677+DPvk6slYH72nnoY++BF28peuXuwHSyrjbRt8XzMO84CsUGiBsZXWdBtFAF/CItdTA6wi20gMnpZvcQKlZtcTYUUJLJBDoHcJly4rtML/89zWe/E3YGfTSO7WPjRVI3UEx+/ODt8L+g9NWFvWbdk7d9o3wSfOObjAXR390J9/hzmc0kHX+q04gm/pXijR9rCMtJUUWcqV0/M23jSiyDhE2K3UW41EKe0hBuYEdgcU0kxv4Dsfi3efh6/4tK9VmfJqjBDLuc/FuqQ9CTrlK2IIdTFnB16pxgi3qoNIxWtLcPaw6uYp4gzKdoOzwfxf/lRChSNU38lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEYPR03MB9779.apcprd03.prod.outlook.com (2603:1096:101:304::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.15; Wed, 20 May
 2026 07:37:10 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0048.010; Wed, 20 May 2026
 07:37:10 +0000
Message-ID: <5b6ce98a-f27e-4777-8a86-99a7facbefd0@amlogic.com>
Date: Wed, 20 May 2026 15:37:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] clk: amlogic: Add A9 AO clock controller driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-10-41cb4071b7c9@amlogic.com>
 <1j33zu6jnl.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1j33zu6jnl.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0134.apcprd02.prod.outlook.com
 (2603:1096:4:188::14) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEYPR03MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: 55de78c3-635f-4701-684a-08deb6429a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|18002099003|22082099003|56012099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	YODbFUsd2fFaGk9P8k8kQ+vQlyp3N8RDvLwQBeHaw6zKBT662DF2IELuCFVYRb94nOiPWNcbMh5c76CzQzYBgcHXac3yPqp91bMtKv+T1bKOY08PGr2dweuOuDyY0lagyLQNbtvxsM2t37vj9WYgwWqnCGQ8TE6z59rybsjA0FTfLJy4DuuZDY/Cz1hI0vcsdMzEXmNWpAZC8z3Za/xP+4yPOwlEixfMfuYl8uOEK8CAOKEZD0gb+MH6HXDf7/xm3bY7nqd2kKLbX9/avhAy3xFEa/7UZiUI3gndgSfMuONgt9P73bl6PBNKJIeOzfg3namBhX2pPQv5KVKEhU0LdaBPqNpyVqdNNzbJFYBwMHAfSequbLk6+YP7asGRBN++skm/4Pdvfw37VbsFn3QNfFrOj0ALqB9X+vIpcQ9esYgBD7wckPk5MirY67DDfAHFn/JMlqyC0yOWzQBLpzMAZel+Nc58BlLYD3haDT1FU+0/zLqSm4NmEBuS85WB6UC0r4L+J1TkCsrUub31AX/HXMysL9O0PZySf951f/PcuqWQnQZRAi7Hu9m4SfhrXBEUleCvsJ2hkkj5ju6PnUE2ypzU9j5E5HrS8nZq7GaK8Ulw3JWigmEJLiatKKlNVYE1qSkX/gFOEyhILO250fGnbFRZP6FdP6LTUGB85IIo02GIUgki8PWSHO5QNgSIA+4X
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(18002099003)(22082099003)(56012099003)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlFzNG0zQjJTWlVrK05oNnN2NEcxWmdjVEJqczlqNVNwN0Y2NE9iU0xvVlhR?=
 =?utf-8?B?eTZaMmI3L3FXUGlyNDlFN2F6VWRZV1JPVVZ3UkJST1RlTEVEeTcreW9Odnlt?=
 =?utf-8?B?aUpaakcxWW5ibkVRQlNQaG0xcENYZjRuSEdjblVlYkZIWjhJT2dCbXFFUzk3?=
 =?utf-8?B?SFI5UGx5QU90S1gwSG5BZmtKTkpEekJTTXZ2alBIRjJBK1ppS3R2SGpVWDAr?=
 =?utf-8?B?SVdNdUIyRVlJUEplR3QwTjdVTWNhc3pWWjM5ZGdkTnI4TWlNVWd6OCtYUWtH?=
 =?utf-8?B?OWluTXNtM2JoOEF1NkZXQnJreTB2Ni9UWTFvaGZYVVlhYlBya0Y4ZWpvYWVZ?=
 =?utf-8?B?MzJMVXVJanhKckYzeUFDazVNUjBJZVd2MjZtRjJvSVordkNIZFlXRWJSQVNh?=
 =?utf-8?B?Y2QvVDBLVWw0cnc3Q3B4TTc2enZPRVFTQVZTaGVuVUJ3RjEyc1VKanhkRWtW?=
 =?utf-8?B?TkVHamhIQTVlYlVTU2d2bUxDY2Q2SDRaOWxHNTFxYmVWNmhCR2V1R1Zwbndw?=
 =?utf-8?B?RnowTHZQKzROamgvblRCKzFQaXo5Zi91dTAyVVpZcTNLNk4zVGk1STRnaTNo?=
 =?utf-8?B?d1VtTUNrcVlzZXdBekx1S2ErOU45MzNvSk1sQkJpRUFPelYvck1GSk9MbEw0?=
 =?utf-8?B?Rlh1ZGxhbGJzN1ptZXEzc2F2dFFaRmtIZUFNbGlrczBzdHpVNmhacUJwaWFF?=
 =?utf-8?B?RXR3WFMzM3l1T3BQMi9pdW1IMUFQa0NzeExleTJJNDlEUC9SbDZrL1NXTnli?=
 =?utf-8?B?SVlMUHVXdXdDdG11Z2gvK2ZiV1RiQklhcHI4dWFYbkY0VldKMDMwc0x6M29Z?=
 =?utf-8?B?T3lsRTF5T215T3NxQXZZNmV0M0dTQ3gxYUdJYjByN1lzM2NkWnVoYzJvL1d5?=
 =?utf-8?B?V2p1THNLS3QvNFhsSFZhN0l1cGlteUNTc3JkTmZjR25oaVNPOHJFVG44WWZj?=
 =?utf-8?B?VGNWL3puUE0zZ2dWZ1B0T1lOOWNEVlcrdExlT2VuYXlTTWJKWVJjeEwwa0xN?=
 =?utf-8?B?Zkw0RGQ4V3hvWlRZeDhnSHR3Z09lT3hiSE0wM3BWRENJaitYcU4rR09uRU5F?=
 =?utf-8?B?R2pqaWNjWC9Pa3JvVVJxbFpWQUt4WVFOL3hEZTNVZDUrdmRjcExhWWJGOW52?=
 =?utf-8?B?U0ZIdlNOWXFWOWc4ZlluYnliWjZMbkYvajB5QmMzRFNYMGtnK0MwY1hMNjlw?=
 =?utf-8?B?bnVaVi8xVmNISW14ZkxHdW9zZHNwRXV2WVBOUGllSUgrR0JNTDVLZzlsTkJE?=
 =?utf-8?B?V3pMRHJrbjZwbUVUVnFpQmZsNDNZTXdZSkV0aVFQR2xrQVNOQTJsSlhEamp0?=
 =?utf-8?B?ek1OY1pmNXlscHVGSEZWNjVSZmljSFR2ZkIxcDF3dHVkSFpwa1BIUHhuNTZD?=
 =?utf-8?B?bHpTaVJ2Mkk2aHIyQ05iQkxJdHJqeC9kVjVTZW9oc1JwWkdxTnRTaUhNYklz?=
 =?utf-8?B?YlhOMVZpQW1idXpRa29zUkVoTDR5NVBPMkovZURFa3g1bGVWcFpuZEVNUGh5?=
 =?utf-8?B?UVpGc0JZeEx1WEhadlJVbk13bkozVkJhT2ttcmpWNEtycytmN29sZ1BRL08x?=
 =?utf-8?B?cEdENEZXL0lIUU01MVRRK29rcFZmbld6enM5QkxMSWlmaDFKODJsdGsreE4v?=
 =?utf-8?B?OTkramw2MVZ5ejF0dmREekZBYnlrR3VCYk1UMzFGbmdUaW1xY0RoNFJDcUE4?=
 =?utf-8?B?LzdPUkZmTnM4d20xWSs3aFkzMTFiN29EanRDNnUveUNvYjJNelN0SGNYd2Rq?=
 =?utf-8?B?a2xnY1lSZEZtZ1huUXJTUlZLK0NZR2sxc0x5S0txYjByYXJ5MzFVaWxHZmlS?=
 =?utf-8?B?cm5DR3E0ZFdFcHVURU9UWFdCYlhWbDYyQjZleEhtV2F2ayt6Y3I2QlUvQ3Jw?=
 =?utf-8?B?QVF3d043L0JlT3dJVklwWmg0eW1aZVRGc3p4R0xLYlJlNDlLNUxOOXEvWTJD?=
 =?utf-8?B?bHM5d2VoR2Z6TWZ5ckJoTEhraVRjUzdObkJnZzN6bkxRU29SaWJiV2pYRElB?=
 =?utf-8?B?OUNCdS9kWWQ2NlRwYS9ycjFYRU9IUXZreHlEK0RkUENEcXhrSER3ZlJYTkpV?=
 =?utf-8?B?a0tPV2FFeHRMQzd6TW1RZ1BPN3dJMzdyemREa2JQOHMzKzFMaFhCWjZmWGRs?=
 =?utf-8?B?VWY5MmFPSkl4dkRrajluNjZNNW9NN2dUWHFWNVBiWUozL04vU09HRFgycWlX?=
 =?utf-8?B?OGRCck1kN29pbGNqMW00b3JaQWJjYzdrUkxlODhiRXZrUFA3Vks1WVJOR3Zk?=
 =?utf-8?B?R29wZDdwOG8xbUlpRTNKTzBQT1YwU01BS09MampIUjBiU2hDOSs0TDlzeXBT?=
 =?utf-8?B?ZXpWOEhoQkw2d1ozM1RhcVRZMFFodFd1UzV4eHdOOEtTN29LK0VyQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55de78c3-635f-4701-684a-08deb6429a28
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:37:10.4990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LstMUwwz3341tPohn/8/Jw55/M9zqBB/ldGw3zBx6+lgwajJNX1s0mbWNPn0FG705tI+xH0x69yy/UC0nvcFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB9779

On 5/15/2026 12:27 AM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>
>> From: Jian Hu <jian.hu@amlogic.com>
>>
>> Add the Always-on clock controller driver for the Amlogic A9 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/Makefile   |   2 +-
>>   drivers/clk/meson/a9-aoclk.c | 494 +++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 495 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>> index 2b5b67b14efc..91af609ce815 100644
>> --- a/drivers/clk/meson/Makefile
>> +++ b/drivers/clk/meson/Makefile
>> @@ -20,7 +20,7 @@ obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>>   obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>>   obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
>>   obj-$(CONFIG_COMMON_CLK_A9_PLL) += a9-pll.o
>> -obj-$(CONFIG_COMMON_CLK_A9_PERIPHERALS) += a9-peripherals.o
>> +obj-$(CONFIG_COMMON_CLK_A9_PERIPHERALS) += a9-peripherals.o a9-aoclk.o
>>   obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>>   obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>>   obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
>> diff --git a/drivers/clk/meson/a9-aoclk.c b/drivers/clk/meson/a9-aoclk.c
>> new file mode 100644
>> index 000000000000..3c42eaf585d2
>> --- /dev/null
>> +++ b/drivers/clk/meson/a9-aoclk.c
>> @@ -0,0 +1,494 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>> +#include <dt-bindings/clock/amlogic,a9-aoclkc.h>
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
>> +     MESON_COMP_SEL(a9_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
>                         a9_ao_ ?
>

Ok, I will replace it with the prefix a9_ao_


[...]


Best regards,

Jian

