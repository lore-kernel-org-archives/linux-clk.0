Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023098.outbound.protection.outlook.com [40.107.44.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6870C3101C8;
	Thu, 11 Jun 2026 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180665; cv=fail; b=HyULIOfqfZP5IBZ5m6Kdx/KST0dvZiH1xMFJ9EkMgo+FEtiItxZ5JcxhEAGeLhOcR5fBV4CscoZpv/xAxcvoBsb5NG/oTA3pOQ31/dPVtoiHWmCWLQhJC9XB9RJiQNYBde8uTd1xIS1qVcgqI5AG1xO92Ycw/z6/S825Z4P/4iE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180665; c=relaxed/simple;
	bh=33eftjoWr1HmC1K49cs1Or5QNqvQ+X29rnWfofp9KSY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bvwP/gxJ9fAW7TKigaq4RfNpcHoNl812611nUGGJNrV7GxDhYU5y6Fc+Co3M3+FrqcSNwJCw2lbNC3Sf7uWEEtW98jCdhj43gWTAeDfpalrSk/nwHPwKvAEGCHJ/Trp8vijh9RJYjvYLj1Z+NHbtJw4+k52Wxe8tvhJX5o/vuxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=tz/VK9ld; arc=fail smtp.client-ip=40.107.44.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="tz/VK9ld"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxAU9IwQXvp5Ys0G54/LEfUV5CxNycDZTyYYOLg4luzKKyqkE58QmroslY+I0q54VDDL/HvYVzAtkhzRrO3Z8rIYqkmYiYtFrvZlgdB8RtIvWp9DeJfIvIkdprt+KXtZlfJAvHFGQN4sMw3RuKtqZSvW2TknlXdL/JDdlZBoDO6Qf/ISWAW1l9+1thPJNsrLgBEtMoe0Jo6n+OD2CxVPc/uVyoYMQryl5lq+k6ITO7k69a8kejkzGPdouaELBT16e9nKpA5jacgOa+B1n7vHmyfXh18jXjp9f1e6gxwNgxjspqn/YA/EeydFJXnb1JDUznCqpXAtwqa3AQXiKAp3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhGDCjAWy/q6T0ZlT9HJuh/vhMZaMi5uLWwNNYjZy4w=;
 b=Wf1PabQmUKlH6AuWhWH/yRC1/QTCzU3Vr3BR47AgYueYVNuyZ/sMHq6BTggUFuZleQdoiUScjhjBWVUYl5R7t018HaMfE+f90NYJHz0zNsnf8q3KvlqqSi0uB4r0i56kC+iU4jO92V3Y5GRHlxtkHaCnyHbBrpsXtGUKL09oiWmWRyauXB25RmhmsAjoLoqJV2xFd7hdXA5zjNLGOtg+AlSoPZyz6VdDZQY7AljbZpxQ2DICNiEPDxHRAe8IhqkkOtKf7WQggif1G+er8d2FQ6YSn37m0Fau1/Du4vlVgk9z7Eat/0Vw8CzkRwbCH4iWRWPq9GE9byCuNwNASOKAQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhGDCjAWy/q6T0ZlT9HJuh/vhMZaMi5uLWwNNYjZy4w=;
 b=tz/VK9ldea2FINxGuafvGD05pRIUUuztSqeA4dietsicY6yvYuK4LIYSM6QCUXdeG/y/VIqvw6kU0WvlxB46uTHcifu79Mvo7OlnARXnO3yEzjLPD1ORbIuM6c+xLTOhMkoV8RJWZC1S7lCisLY5BgkMbzr/PvOLPz8L+IkW9rhV9Mm9y3ldcojPJiie07Oy0wnXE24x+61RL8k9c1LuIkqmeJMjI/+9EueqY49gK0OUZBhTgsLGpK9+SN9fmNz6F47N3J7jfvT+iQjkqWyo/GGKW7guVDvGqZJfI6c2vqZ8YnupyJGkba0YMVCBeBgkede/EdZN6nBPvmdgfJ8aGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEZPR03MB6786.apcprd03.prod.outlook.com (2603:1096:101:66::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 12:24:18 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 12:24:18 +0000
Message-ID: <ed5527db-944f-429a-bb7f-d371085e0ea1@amlogic.com>
Date: Thu, 11 Jun 2026 20:24:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: amlogic: Add A9 AO clock controller driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com>
 <20260603-a9_aoclk-v2-2-f47ea616ee78@amlogic.com>
 <1j7bofd7dr.fsf@starbuckisacylon.baylibre.com>
 <67fcf9bc-0ac7-4812-aa7c-4d42d8f1c162@amlogic.com>
 <1jpl1yfunu.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jpl1yfunu.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI3PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:295::15) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEZPR03MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0d5e0f-1675-4287-ae74-08dec7b45b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ySZ4Uxg0RnpUONHXPGm0gNGPxXzglK+UFYjUUi2Qm6HoYkaDGFdHTuFwoTlnUJEaUgN8yGAJ/Ojtzg1JiLbWZKGtRO+447jhO1ZD11A/AQw1OngRkklLYbR/JN16glgTv8tskqnc8o+QIwivlCikk3MWSPwOvs4so3knw7UmhdquEgjsU4D9uAOl8+TpAb/06rQLVSxc2uK8qTG8YV03tCXwvUoubZCxY9Pt825/8UPbzcpNHC2a8yQ9AJhktJ+sQy0PZjTZ/km0Ua2S10ux2Xn/pvyy+ewvp6BzG0m+Usdniq8wiEdTAZEaUC2RVzazbH0W/eiz857r9oOO1uSSZxveXbV8+LHOWT2DxrtkmSgm0Jl3Dxi+dwf6e3xrcD57+7AzoP65K0aKPVu5fQ+yIW6nfYr3Z1jCKovLQXHiuYgMJ8cWI0axc6f9+9t6EfUYuqN6O4tc8cY/cQVkijSLLzTMTn0Py4E7n/K7qEBJSmRMYlBqH26454fJqcpUmVMSOto+clW2MzYQJWA+tRFIC5/xXgliWknJge+7fQsX1wgep+4sHiVeKLDJM88Tnb8fdsRh8KaRj32O+5uj6kHri7P8/kZEbh0bDMqhd9D/KBwxRFDiKDVPCxDCdWJrlgkNwE8+/9nBg9vpf/1fY66MWbzatbjyLsrcjVcUn6+Q0ioxx4yrYSf0jqFg7K/OzSG8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bndYWEdhRUZ4RXRGaUFaenJqWTlJMU5YU1lONlFGWVlrZnd6Z1ZmUFdQbmdr?=
 =?utf-8?B?ZGdHWitCQVE0dGVaNmZCL2kwQXhUNlVSVzhEM0k5YWZONnpDL1Bic1FsRmN3?=
 =?utf-8?B?NmdkbHJtb0NPbm5sbG5FVGU0WDkrbnhHZUd3UGVlWStVK2VrZDJkVzNBd3JF?=
 =?utf-8?B?SlpoanNiYkUySmExQUFCbDNFSG44aXVIVGk2c05KVEhTaGg3dEN1akJsSmx1?=
 =?utf-8?B?djZ1ZFQ1aE1yMmhwUHh0elJiOTc5Mkt2bkUvcG1lMzdtYnNsY3ZzUncyMDN6?=
 =?utf-8?B?MlYvQlpUbytwNXlvNXRrRlVHby95ME5LNzJzMHI5UjJIRExBQlppdGczeFRl?=
 =?utf-8?B?ODEwalZWSk1KYkZ5OHI0WEYzN1pieVdFWitrd1Z6eE16OHd0ajZwdDFLN0k5?=
 =?utf-8?B?NVlTRzlvSHRBUGdOaXJDaTk2eXp1bkhqWXN4YzlBNFIweSsrRk1GdXNpVXpC?=
 =?utf-8?B?Unp6Wmo0ajJMVHI3bFIyZVViUTFhMTR1RTZiVWtKdG43dVZQUVBXbnYrZElW?=
 =?utf-8?B?czhobk43WjdyWHhSTnh1S1hhcXRNc093RXBKc1pTdVo0a2wxMzUyb0lrQ3FD?=
 =?utf-8?B?SUhtY3NpcWpLVjJ2SzJ1dENoeXVjcmdVcWZQL2hZQXRra0JsWjEwY0pFcEFi?=
 =?utf-8?B?dS92QURIYno4c2V3UHd6Mm5ZVktDSEFvK1hSM2RnYm95ckwweWNXKzc5cHNL?=
 =?utf-8?B?RHpNOGR4Nzh3cmlxMTZHTlhNS0I4M0NxMUYzTE5MYjY5a25tQmFlMVd4OFRn?=
 =?utf-8?B?Ynk1U3RkMGxab2l1bW91djNJWkVOTC9LQU1Ub0VYbmZyMmk1UlFQK3FyT3Ni?=
 =?utf-8?B?SnFzcThyaDVCS09mOWgwcEhXK3l3MGtmQXE4L1luTk1CVHdMbzlXRTlkc0Mr?=
 =?utf-8?B?cjdKcHFwS0tCSitnVnloVlhCaWVKZEpaYUZVaHFkeHd0NW91dmxDejF3Qmp5?=
 =?utf-8?B?N2JhOHNQUmsxejlhZW1aWmxEcUFlTXNEUWtIK256WjNYbVZSY0kwTHhzRzlE?=
 =?utf-8?B?b212cG9ESDdhQS9GWmI0TXo4b2prT2FBMVlVYlc1Vm4yaWFUOFQwcWp6STJG?=
 =?utf-8?B?cit0U3NLd1JOcWtnM3Azc2hPTUtJS3M3T0ozakY4bzFTWStHNzBudkdvS2cv?=
 =?utf-8?B?TWJScDlOWVBLaFhDOVA2b1BWVnZKUzhjTFkzSFd3bDZWTXI5NFhGemc3UzRv?=
 =?utf-8?B?Vit2KzEvczFaQUQ4bFQ2YWxqMlFhOVBxWk45TnBBK3hJb2FkQ1B3Y1lJdnlR?=
 =?utf-8?B?NmcrVEY4U0gyTzZxZXNicG83a0I5SW96Z2NnaGtyYnBVdHBFVGJaSUkvcWVK?=
 =?utf-8?B?b3lRVVhtbzNqMjFpQzMybWs0RzRtMkVZQ1FtZnNRUjdwUW90YUFUUkY2RHU2?=
 =?utf-8?B?WUVra0JFeW54cGJ1dWhlSnpBcDlncDdPOGhyQzZod2RWK0J6b09RUlpzMEFQ?=
 =?utf-8?B?Q0tPeVhGejFKcHlBMzdVUTNDd2RadWtTcjVHTmFUWnVsekI0K3l3TU8yNFY4?=
 =?utf-8?B?cjFLUHFBNmFYckJ1VUFkT1kwZ29qVEJOY1BDSElJdmNRc1VSL3FZamNabGxr?=
 =?utf-8?B?Z0lhMGx0R3lrb2wrQkpJeWNpd0pXeGVZT1d0Zm54bElqZ3JGMEMxUGRHSStE?=
 =?utf-8?B?eEpmU3VwYUluUHFiWk84WHFsSlBNOWp3RHNPaElieTNDQ2pqM1hGZUpvdHFX?=
 =?utf-8?B?c0MwSTFLbS9UTnBQMTBxd3RHZ1FUU0xlUXhkVjJNbEtvMDIzMnIrenlYaXVi?=
 =?utf-8?B?V2dHcFUyYWYybHVYbkhvSzZncVYzVkU2TzY0STZtbktjYnR1TFNNditJWlVE?=
 =?utf-8?B?SHpWektOblJ4NURmbjdxYktxdFppdWtic0pxMS9tYUpKU2RVQzFQUGpUbW5F?=
 =?utf-8?B?NHN3U1ZiUFdnYVEzREZqQUVaL253alJYYkQ4VDU5ZkxuY1JFWFNwMmU3VjJw?=
 =?utf-8?B?L2VIejlHZWo5cTRheUQ1MFdIRndYL3ZSZ083eGJiUmVpTjVMMkQzbTdweG5r?=
 =?utf-8?B?b0YzR2xub2k3RUdkVk5CVVpaZWpZZStOa0F6RjJYc2RabkdPa2dsUDE5S0Fr?=
 =?utf-8?B?TWVzNUlCRXQyazl3emE5TWVhZWZNRm1yUWdYVUJBeVgzVnErbnpQK1JJQTV4?=
 =?utf-8?B?QXltMjVQSGpja1VHZHBhM2FmN3lxSkV4bENyNS9iQldnVHR2LzdRZWdJcG9N?=
 =?utf-8?B?azFubUI1M1ZUS1NiOU5Mb2RRTXFjNUFRRVQ5KzFGU2JMZ1RRcDVRa1hNMTV6?=
 =?utf-8?B?dHJydmFFZGV0ckw5QTd5eVV6V2FZNW9PR054dmxvYXEvNjY1NnZnam5pdkJ1?=
 =?utf-8?B?c09RNDdrU1BuWmRyaDlwSkphT0pTWXZrWTJUWkRMcW16cGFBcndhdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0d5e0f-1675-4287-ae74-08dec7b45b96
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 12:24:17.9186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izuJ4N/AQNXMHbgzDthDxj6PGot2g4LvXp0uE3PMfCt3V26yBZBdqEh0qwBCVsnde1uTfkcEok6j1Lsbr63onQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6786

On 6/10/2026 8:26 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On mer. 10 juin 2026 at 12:18, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> Hi Jerome,
>>
>> Thanks for your review
>>
>> On 6/3/2026 10:29 PM, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Wed 03 Jun 2026 at 20:17, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>>>
>>>> From: Jian Hu <jian.hu@amlogic.com>
>>>>
>>>> Add the Always-on clock controller driver for the Amlogic A9 SoC family.
>>>>
>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>> ---
>>>>    drivers/clk/meson/Kconfig    |  13 ++
>>>>    drivers/clk/meson/Makefile   |   1 +
>>>>    drivers/clk/meson/a9-aoclk.c | 419 +++++++++++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 433 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>>>> index cf8cf3f9e4ee..625e6788b940 100644
>>>> --- a/drivers/clk/meson/Kconfig
>>>> +++ b/drivers/clk/meson/Kconfig
>>>> @@ -132,6 +132,19 @@ config COMMON_CLK_A1_PERIPHERALS
>>>>           device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>>>>           controller to work.
>>>>
>>>> +config COMMON_CLK_A9_AO
>>>> +     tristate "Amlogic A9 SoC AO clock controller support"
>>>> +     depends on ARM64
>>>> +     default ARCH_MESON || COMPILE_TEST
>>>> +     select COMMON_CLK_MESON_REGMAP
>>>> +     select COMMON_CLK_MESON_CLKC_UTILS
>>>> +     select COMMON_CLK_MESON_DUALDIV
>>>> +     imply COMMON_CLK_SCMI
>>>> +     help
>>>> +       Support for the AO clock controller on Amlogic A311Y3 based
>>>> +       device, AKA A9.
>>>> +       Say Y if you want A9 AO clock controller to work.
>>>> +
>>>>    config COMMON_CLK_C3_PLL
>>>>         tristate "Amlogic C3 PLL clock controller"
>>>>         depends on ARM64
>>>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>>>> index c6719694a242..f89d027c282c 100644
>>>> --- a/drivers/clk/meson/Makefile
>>>> +++ b/drivers/clk/meson/Makefile
>>>> @@ -19,6 +19,7 @@ obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
>>>>    obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>>>>    obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>>>>    obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
>>>> +obj-$(CONFIG_COMMON_CLK_A9_AO) += a9-aoclk.o
>>>>    obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>>>>    obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>>>>    obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
>>>> diff --git a/drivers/clk/meson/a9-aoclk.c b/drivers/clk/meson/a9-aoclk.c
>>>> new file mode 100644
>>>> index 000000000000..b7b3ca231a42
>>>> --- /dev/null
>>>> +++ b/drivers/clk/meson/a9-aoclk.c
>>>> @@ -0,0 +1,419 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>>>> +/*
>>>> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
>>>> + */
>>>> +
>>>> +#include <dt-bindings/clock/amlogic,a9-aoclkc.h>
>>>> +#include <linux/clk-provider.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include "clk-regmap.h"
>>>> +#include "clk-dualdiv.h"
>>>> +#include "meson-clkc-utils.h"
>>>> +
>>>> +#define AO_OSCIN_CTRL                        0x00
>>>> +#define AO_SYS_CLK0                  0x04
>>>> +#define AO_PWM_CLK_A_CTRL            0x1c
>>>> +#define AO_PWM_CLK_B_CTRL            0x20
>>>> +#define AO_PWM_CLK_C_CTRL            0x24
>>>> +#define AO_PWM_CLK_D_CTRL            0x28
>>>> +#define AO_PWM_CLK_E_CTRL            0x2c
>>>> +#define AO_PWM_CLK_F_CTRL            0x30
>>>> +#define AO_PWM_CLK_G_CTRL            0x34
>>>> +#define AO_CEC_CTRL0                 0x38
>>>> +#define AO_CEC_CTRL1                 0x3c
>>>> +#define AO_RTC_BY_OSCIN_CTRL0                0x50
>>>> +#define AO_RTC_BY_OSCIN_CTRL1                0x54
>>>> +
>>>> +#define A9_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
>>>> +     MESON_COMP_SEL(a9_ao_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
>>>> +
>>>> +#define A9_COMP_DIV(_name, _reg, _shift, _width) \
>>>> +     MESON_COMP_DIV(a9_ao_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
>>>> +
>>>> +#define A9_COMP_GATE(_name, _reg, _bit) \
>>>> +     MESON_COMP_GATE(a9_ao_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
>>>> +
>>>> +static struct clk_regmap a9_ao_xtal_in = {
>>>> +     .data = &(struct clk_regmap_gate_data){
>>>> +             .offset = AO_OSCIN_CTRL,
>>>> +             .bit_idx = 3,
>>>> +     },
>>>> +     /*
>>>> +      * It may be ao_sys's parent clock, its child clocks mark
>>>> +      * CLK_IS_CRITICAL, So mark CLK_IS_CRITICAL for it.
>>>> +      */
>>> I don't really get what you mean ... Could you rephrase ?
>>
>> The AO sys gate clock chain may be:
>>
>> ao_xtal_in->ao_xtal->ao_sys-> AO sys gate clocks
>>
>> "ao_xtal_in" is part of the parent chain of the AO sys gate clocks.
>>
>> Some of its downstream clocks are marked with CLK_IS_CRITICAL. To ensure
>> those clocks remain functional, ao_xtal_in must not be disabled and is
>> therefore marked as CLK_IS_CRITICAL as well.
> If any of the downstream clocks are critical and marked as such, there is not
> need to mark this one as well.
>
> You should only mark the clocks that are actually critical with the flag
> and let CCF figure out the dependencies.


Thanks for the clarification.


Understood. CCF already keeps the parent clocks of critical clocks enabled
during __clk_core_init(), so the CLK_IS_CRITICAL flag is not needed here.
I'll drop it in the next revision.

>>
>> I will rephrase it like this in the next version:
>>
>>          /*
>>           * ao_sys can select different clock sources. One possible clock
>> path is:
>>           *      ao_xtal_in->ao_xtal->ao_sys-> ao sys gate clocks
>>           *
>>           * ao_xtal_in is in the parent chain of AO sys gate clocks.
>>           * Since some downstream clocks are marked CLK_IS_CRITICAL,
>>           * ao_xtal_in must remain enabled and is therefore marked
>>           * CLK_IS_CRITICAL as well.
>>           */
>>
>>>> +     .hw.init = CLK_HW_INIT_FW_NAME("ao_xtal_in", "xtal",
>>>> +                                    &clk_regmap_gate_ops, CLK_IS_CRITICAL),
>>> I'm honestly not sure about this. It is correct, sure and the macro exist to be
>>> used but ... It does not really help readability here, does it ?
>>>
>>> (I know that was a feedback you've got on v1)
>>>
>>> Other than that, this looks good to me.
>>>
>> Ok, I will use the original clk_init_data for this one.
> Well my comment applies to whole thing really.
>
> There are surely ways in which the macro but the way we statically
> declare things, it adds a level of indirection that makes things harder
> to review IMO.


Understood. The same reasoning applies to the PLL and peripheral clock 
controllers too.

I'll switch back to the explicit clk_init_data initialization and drop
CLK_HW_INIT_FW_NAME in the next revision.

>>
>> [ ... ]
>>
>>> --
>>> Jerome
> --
> Jerome

--

Jian


