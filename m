Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022074.outbound.protection.outlook.com [40.107.75.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94BF305686;
	Wed, 20 May 2026 03:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779247018; cv=fail; b=Cl1jxUz+QTWGGNzqrJOhj3f+s2DnPY2TI4eedBbCfXfOiCVuFmC8RdgcWZJOJ17pFlaMkgfmUUTWL783Et/vadX5BAMwNWQqKH0uzRHg5rMhp5aOhndQmsN32wZMpZXjvZQ1zZEUxXJjpyQEU4ZXFLlv+YxUfXa8tsLYsQNrUt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779247018; c=relaxed/simple;
	bh=y+wrTDPXSQrwwKIjetPGdTn15UdStmrLdjx5yIEOSwk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sCGxPpKER3TFYm3XKLHrjEXX1jFnOHUnKFK5I8DgkHVZZhU1RGoQqWpzC7zG3UI4xpm933BTuUaujelcNOsvYxxdmS9v6FTWxv9ZKYURRcBXne/krXQ47k/BuXlkAbPwGPbS6iMv9icUGAfKeKXm1YUKUWrVNQiY6oxeNJcwlPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=NIeXDBUs; arc=fail smtp.client-ip=40.107.75.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="NIeXDBUs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsLZ3v3GlhMcc6qVIUPHbPv/wZ+98Oodaz8VbOssDfyaVXhvK4lDA7q2+dqvxttAe6J2SxfXbCMqDCk795AvO9OyWYdiqp/A3va5eUR4TQp/7jiV9NHl/RkTeUG+nHFk7G/uQfsl6XAIVCZCnLWg+L3uM0ziOi61c/4qrya5NQ0VBMyOxxGktKJh387N76BxAAmMKxXwYxX1OovIySeTAIFtNsacHrgQWtUQQvFrWupyOvfrp0WYi/+rz+5abObGA/Supsf+0siPMI01VGsyeuji7/Dgcdd3ORpT1IO9im98NJ/yy/sQ28P8pawewUwhw9Qox4tutB87CL5enn/KqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+/0/paUgtXrjIkMBmLPOXrwFXUICv6TZ+qjnS+1pow=;
 b=fvP3AHxz4d0CVUI2wW6Bsp6J/hNGcfApFWM5tzGntos82HyjD58B6EpnnmGM1tODlfd2vMrR6+1rV+wUAfsro732elOYNI51pMP1QQuYo0YQBDwAtdRkjSNjkomPcHTBxpE1zfRLHewGoLhS1BC6ulrW6weaFboETaU2Q4f1EW98qqlsfYO6WgLINc1axkTYLpxOXGt+LedDGGnDehxkv3knsHWEH9/SF6wHyWkcqaHFsIBp9QK+o07Bri80D8tv16l7XgO88Zzm+0I9y0HaHAgjoSYmUp22T4LljxJdwrmmojVKuOkBSLzCH9jwF4koCh/2icQ+R4Z7YWogHJI6tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+/0/paUgtXrjIkMBmLPOXrwFXUICv6TZ+qjnS+1pow=;
 b=NIeXDBUst4CU8TJvEDjvTJLpCDnDOng4/86igGjAF59OkEQxZAgOKPzuZc77JUIJx9uKJnH8HM5PnXS3NVzpx/Ebh0W2QvL34r92vLbtj/Y4kP+HwLPMpgkwVeTyt/86nvKan8J5nZcEE8i5LrIzv8+f3oJD15IVrGAPKjlhCZT2cgAkBsn7GdBgEejYL+SGaBktjOwUPjEknHhgQTt9VcVjbEs6MOjmQyCkixOP0bwxfPenno0Ie48RjYv47xJH1rFPdDqX1Z8YeZqvpYJdoNa6T2YCuFXTSGd3BfXTNlK/RDJhhFlwwwLjlh52yE/ylrC8VvhW08+kjf6x9r36vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEZPR03MB7659.apcprd03.prod.outlook.com (2603:1096:101:126::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.15; Wed, 20 May
 2026 03:16:53 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0048.010; Wed, 20 May 2026
 03:16:53 +0000
Message-ID: <609d9fb6-13e3-4105-bbab-19744b73fd82@amlogic.com>
Date: Wed, 20 May 2026 11:16:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] dt-bindings: clock: Add Amlogic A9 peripherals
 clock controller
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
 <20260511-b4-a9_clk-v1-3-41cb4071b7c9@amlogic.com>
 <1jbjei6k75.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jbjei6k75.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0044.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::7) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEZPR03MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4b6816-806a-44aa-f91c-08deb61e3d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|4143699003|18002099003|22082099003|56012099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	PEZzwJnuFLtC4EEXd8qIO2sRbsUdtpQsk96zC3weccLlMxQMr3xrHjLxQbNhIerAHv5zRid0LmVeH4oFWGsW33IaCA6x+pKgfnT7dmVRQaLpbEUZESNsZUu85X+tIIuoxfQBxXqUuxxPHDJec7b8jpjmVifB4eJyb3Xor8YVJ2wfi+qlL8nl27O4PCuoyY82yVLsixffkQwsCjtDZuw3Py1O3k7jUX8vHxJYzTZlvfphEKBMoRZAZjgt6a+glHAFi1+Tv2vt4D1DTS4ottzbrhqv58dL08DKlOND8vIh0tMj2XwcClPmqFOafuv2WbFS1G52VcK5AguwntgcOeYFsXZw84FzM/6PwjK6fJzmpO6lg/U09pAZY73iGs5uw3vVPDb4bmdIzqHgo0XjN4JpN1iSp9L+xFW4Rnx/oZZ7fRBNZDBMGbcW8PfuEfG9SQXdUNah8+DOusFfHwdGAlrbQfXUBg02DV9+uhzOIzxU0v6VlcoviZAyOrhVOJU7M7o57HDZZCHi2g2My6renKw/udUXaXLgYebW8JYnNzfo/HEAKRbx/pfZ5Wcuch6K0TvVs3eELsdOcAU50FNti6eZ4eQVjtPX5PoMFt4U6RS4TktfGE1m/JKQN5nDlpr4XdoQVbYoMPKbmhBLQ8i0iJirPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(4143699003)(18002099003)(22082099003)(56012099003)(11063799006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHdGc01tTFFQeDhUbFFKbXY4d1lKbnNwRXVqV1Zvb2l3UE9LQ09lbzRKK1ly?=
 =?utf-8?B?eE0yWVN1MnA2SU5UQWlES2lxcXVBZWtpcWNzZHgvWjV6bGpKS2hDMVV4UjJO?=
 =?utf-8?B?U1JGeU1LdTErdEluWVBsUzVKSmNtUm91TW9SR09kemVLYWdOeG5ZVW1lZFVr?=
 =?utf-8?B?dU02NlVuR21OYjhoVENUdHJ6aHlhYXlyQ0h6OTlIV1F6VTdvZklPUVlqNGl4?=
 =?utf-8?B?SW1iSnZja1M5SjFRUnNLQnI3Z3hBRlhLU3J2cHhOK2FGTk9tT0Z5YTM3RUZR?=
 =?utf-8?B?RmRKcE8vTVVVc0dxaTBNZFpZNXRybjh2enpoUU9YRzZVR1BIaEJxYS93Zkd3?=
 =?utf-8?B?bGNOQTQyVmZDYWYzMGlycUwrY1NtSmt4ODdoeitqNGUxYlpUcVhmZi9Ja3NU?=
 =?utf-8?B?aVVNSkgwMWJWM3Yrb0FQZkNTNTN6S0lIREI5VE5UelVjTmlhMDZtYVhmdXlI?=
 =?utf-8?B?cGVwVXBXSHFhdUZ2TVJXR014a3RqRWM1cGlkYnRlTFBsZ3l6L0NYRDY4ZzRz?=
 =?utf-8?B?eDdOdVI2ZlByWHlJMHpHemRrOVdyRnplbzdVTk0rM2ZpMlZjOWoxVGhpYVEr?=
 =?utf-8?B?RzQ4VDZDQlFWanFyT0FiS2g0Y2l5cjVPekdUR3VSYXMyckZhQVYzeTRjdWc3?=
 =?utf-8?B?SS9VbW5zYko5YkhHY0lsV3B6cmZVV1U2cmFPbU5sbVMyZGIzb1ZWR2VyaEFt?=
 =?utf-8?B?N3RmL2pFN2V1bEcwNHBWeFQ5RmliYVF2cm9iSE5ZZWNjUjZ3SkRFSzEyaWJM?=
 =?utf-8?B?Q2NLSndmVzJBcm5ERDkzSjB6NlJ0WkJQL1ZaVzFVV0ZJVm54U0s4UmVYcXlj?=
 =?utf-8?B?d2VKTUYwSHIyMW00dllsdXlzSGFSS3lEb1JtdHNmV0JUaW93TGdoNm40RS9D?=
 =?utf-8?B?ZnMzcWREYjFtWHRSbGFMRzRZaXRyY0lIL2dYSnUxbjVvSWlZREJOR1ZObU1Z?=
 =?utf-8?B?a0s2STFKQ0FIdXUrTkU1LzdaK09zd3pIYTJWRWV3ZU9MRDZiK2RTeWNtVUg4?=
 =?utf-8?B?Zlc1eGkvNDNjbzBOTnZuN1orb2RCWFhXa3lCMHJ6a0tka0pJZkRTNXJMZExX?=
 =?utf-8?B?SmxTYVNpRGR5MHpnTnhZb1MyMENnenErMXVXZEwyb2hCQ1o0dlNzd2lvc1gx?=
 =?utf-8?B?eEZHVXV0WmhZL2VmbmJld0FlQkpvL3pURDdaUU44RFBoMGRrZ0pEUzJqQWZB?=
 =?utf-8?B?Wk5DTjZmSkdvZEV2Zmo4ekNXUDE2NlVLQlJlbk1scDRianNmUDlXdG1JT2hS?=
 =?utf-8?B?ZElWbU5KZHQvNVdYdktEUUk2R01yUFBLcGlHM1pUaWY3VG9nQnhRZW1PR0Uz?=
 =?utf-8?B?Q1NzVXBETDhzclJtdml3R0xTRmhpRGJqNDl2VFdaaVNtOGh6ODBjS25xODhL?=
 =?utf-8?B?L2hZNUJ0QWg2RWRKcjI2WTFHSlMyaVUwbGhQK20yZWc0anFlRDZYcFVhWmM1?=
 =?utf-8?B?Nm5CVzdUVDgzeENuc1JvazJlVXdCNGR3R0xKWjNXZGNpaXVqbC9Id2x0Mm5U?=
 =?utf-8?B?QlFHSSszdnFaL01ocVFtOWNFd0V0aFdFRkNTcGlWdWRYWHNzcmFXUjZJZnFo?=
 =?utf-8?B?UTdWRi9LcG1pQjc0Vko4UVRMQTdWZE8wTSszT2FFVVhTaDl6bWZOd3RhdVdt?=
 =?utf-8?B?NUdiRXlNbnRiZTk1cUFsY0J0M0RkMTBmSjVzQXpiRlVpaTRmNk5kVFJtcFJz?=
 =?utf-8?B?RlQ1dHZRS1Rkb242OElwMjhGREhsUVFUMTR6Zy9SeVRITkg1V3J6eS9pYWRi?=
 =?utf-8?B?b3Y1aFZzZmNhbGYxYTQwNkxoVDFEYitob0lXQjBXZ1pmNkpqRXZlRGlVK0tD?=
 =?utf-8?B?T1VBcHJIL0FNUWVIR2dZTXRhL3VqemVxMTNYbWk4MkxUajhTVzd6VDhJcVgy?=
 =?utf-8?B?SGNScCtmTzAvMWE5S2ZUZlc5SzhiRHJnQmpIOUd5RFVGSUpneUQwMW45Q1RY?=
 =?utf-8?B?VmVrWkxnd3h3YXlXVXpyUi81R0Q0eVNvWWkrRll5dk1uTHN2bUlabDVyczRQ?=
 =?utf-8?B?dlVxM0krbHExYzFQT1RrNE5iN281ak1IdklRTUVreEg3OGw3YVd0b1hLVExm?=
 =?utf-8?B?WmFsNlVXbjBFcGN5WVhvU1AvNGFkMkJIZjVGN3VYcWo2dlVSSEpPWFY3SjU5?=
 =?utf-8?B?VEI0elk1RUhINFd0VXQ0dkI0VTdMQW03Q0tUUG9lbHZvSTlCS2l0cWs3Znpm?=
 =?utf-8?B?SDl1bDlMQitSaTdtbUNVaE1Hb0dCU1ZxMFlHRTlxQUQrcWprL3NzRTcxTWVp?=
 =?utf-8?B?YW5DQTJLQUg3TEZmVWcxckxhRXh5Zjkvb1Aza3JIQlZLTHFyZGJjaUZPcVhs?=
 =?utf-8?B?WENMaGxkVVFFZlc1WUJZdXFCTnNwaFkvUnBMRjRUOG53QTl0cE5BQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4b6816-806a-44aa-f91c-08deb61e3d91
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 03:16:53.3587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uj/eoDRM03vzVdsulYqxtDM2/3uUGvxPo7m/behhhFOIWB0pBarIXKCZJ67/Nfub53kGtizw/K4RW90sKyrEmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7659

Hi Jerome,

Thanks for your review.

On 5/15/2026 12:15 AM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>
>> From: Jian Hu <jian.hu@amlogic.com>
>>
>> Add the peripherals clock controller dt-bindings for the Amlogic A9
>> SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   .../clock/amlogic,a9-peripherals-clkc.yaml         | 150 +++++++++
>>   .../clock/amlogic,a9-peripherals-clkc.h            | 352 +++++++++++++++++++++
>>   2 files changed, 502 insertions(+)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/clock/amlogic,a9-peripherals-clkc.yaml
>> b/Documentation/devicetree/bindings/clock/amlogic,a9-peripherals-clkc.yaml
>> new file mode 100644
>> index 000000000000..97e2c44d8630
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,a9-peripherals-clkc.yaml
>> @@ -0,0 +1,150 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2026 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/amlogic,a9-peripherals-clkc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic A9 Series Peripherals Clock Controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +  - Jian Hu <jian.hu@amlogic.com>
>> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: amlogic,a9-peripherals-clkc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  clocks:
>> +    minItems: 20
>> +    items:
>> +      - description: input oscillator
>> +      - description: input fclk div 2
>> +      - description: input fclk div 3
>> +      - description: input fclk div 4
>> +      - description: input fclk div 5
>> +      - description: input fclk div 7
>> +      - description: input fclk div 2p5
>> +      - description: input sys clk
>> +      - description: input gp1 pll
>> +      - description: input gp2 pll
>> +      - description: input sys pll div 16
>> +      - description: input cpu clk div 16
>> +      - description: input a78 clk div 16
>> +      - description: input dsu clk div 16
>> +      - description: input rtc clk
>> +      - description: input gp0 pll
>> +      - description: input hifi0 pll
>> +      - description: input hifi1 pll
>> +      - description: input mclk0 pll
>> +      - description: input mclk1 pll
>> +      - description: input video1 pll (optional)
>> +      - description: input video2 pll (optional)
>> +      - description: input hdmi out2 clk (optional)
>> +      - description: input hdmi pixel clk (optional)
>> +      - description: input pixel0 pll (optional)
>> +      - description: input pixel1 pll (optional)
>> +      - description: input usb2 drd clk (optional)
> Why are those optional ? they seem internal to the SoC.
> If so, they don't have a reason to be optional


Yes , these clocks are sourced from other analog modules and will be 
added in the future.

I will remove the optional in the next version.

>> +      - description: external input rmii oscillator (optional)
>> +
[...]
> --
> Jerome

Best regards,

Jian

