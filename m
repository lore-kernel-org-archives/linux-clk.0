Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022106.outbound.protection.outlook.com [52.101.126.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9C53BBFAD;
	Wed, 17 Jun 2026 07:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679732; cv=fail; b=oRyu+G5hIoidcNsbNiMMBnX8vSKFRSVRA3QBWTArIpX5/rLXGMtYxpDhCHt66RzP8h3fwukS0Tw8LZsz7GVo3jztDvC7/kgnC9hxf26DL3LsOTYXBz0CYHBk5/mou+w/wttHaYgBFUb5PVYOk/LLxaFHdjZkg5bRwJZ3HHmFiFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679732; c=relaxed/simple;
	bh=EdBNrrmXkkZB0o0wUL5DBAUW1x+aqyXQxnBDMdKPx/w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kq7dAmUTrduF2I/1kGu2cSYNAaF4bcH5c70HXu/hl9OxZ0QAuoh0izY2g1r0qp3XFYQmAJJ7YrD6YwvD6z3gC012Ckx7L1q21t6Xsiqval1V8ulayU0mKbDmmHN7HU8eFHN3hRA0MQMjWi4Eo4uct89+jNg/h4SsPFitHr7woqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=HTeLl7TL; arc=fail smtp.client-ip=52.101.126.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="HTeLl7TL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CoyUbx/fkhQj/14Mmz5+qV1HazT/clydswVU4O1ML2wfSCBIUrIZJDiEhNN6dz2WnD4IbQbtE3ygoQF42xzQFX1GV2TkqslxPd1EsFMckcHFCXtsUaO4/ziJoX86dnbzPM5P0g03Jfte70ZZ56pi/b6eXDQME+PShIkRN4wch7aOYw3KTNA+rwWIwmMrq79xB6BMUJ3UgWtuGNQ7pYA3Q6pKNDEYYuBFuepFsJyAqaSglV+ODKYoysNzp4Lmmhr9Z7kLGkGR4MHr15SOAUXJrQCX+n/sXYPIW6LR20l3kGIXXyc1Zia+YjvHA203LJ3zpGZ9RkqIqB3sY5pC9Io90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HShn31XLEablCPZH6CzJSEnyKOXtHPRbe9Bpl83ccBQ=;
 b=esAADhkAhLNKeP9s4QkpeL2W/6C3RXz/ZcGqyIoHcqGdLg++Pv+ssUQc85Y+BoT8Hg65UNhAGusJ6rWMwQWuaHJYyYb7fZFKzxgfFM7qpicTkwneNsBjZ6/Cvs67O4MnDm4bdrTErq2abylf/0VEhbwMWjXGRXHQK0v03iU4SCtMG2F2S8gYVsiv/TXxYJM/C7yVTPlcr6/op0LPkRrYrruuId7eyJllplKxD+FWzxOyF8CtmAeo/GS1aEwYCdVPZuUtASj0hHyt2M61QPi4UCZVrtHUEQ4RbVB+/v/4gVKP/mnhwN4qXNca/FzgjP3yXrV7qQ7owViZKAph22xwqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HShn31XLEablCPZH6CzJSEnyKOXtHPRbe9Bpl83ccBQ=;
 b=HTeLl7TLQq+kCB96rAzq0fnU2rvr1owCZrsluGwR4qIGbxJHUy/tzd9MxkX01LRxAjFjYgENLyLKo6iKfTqXaANwFlWrDJkdaYXtMQ2IJHs51qPd9prYZWDcEx4lCqkGWEic6sb/OmSYf/2xcPykPrA6rYg/BTGJBF71fZMNw1EZ8aKCsIigUuIvd3lDe+W7EoHjOMYsTnQkLaQgUXS+cH818ptkVdLbGyRxsNnDx2cGpso+Xa11XA4qPSGFcP5SSuIO45SqiA91gWhldqfLg+BkiSjqPWrfmYLHaPkL8xP2082vcwl1nsyfilttyQ2RZ97yQ2IO9ykYShF/mYOFQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TY1PPFA212DEADA.apcprd03.prod.outlook.com (2603:1096:408::a63) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 07:02:05 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 07:02:05 +0000
Message-ID: <478d00eb-58ad-4af6-a55f-b2af6749c22c@amlogic.com>
Date: Wed, 17 Jun 2026 15:02:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] clk: amlogic: Add A9 peripherals clock controller
 driver
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
References: <20260610-a9_peripherals-v3-0-d07a78085f71@amlogic.com>
 <20260610-a9_peripherals-v3-2-d07a78085f71@amlogic.com>
 <1jecieftme.fsf@starbuckisacylon.baylibre.com>
 <bfe92bbe-5325-4497-b79f-10c7a6e1ed5b@amlogic.com>
 <1j7bo0dm0z.fsf@starbuckisacylon.baylibre.com>
 <5601fe65-777b-4db0-a6e5-8d2cdcde7e53@amlogic.com>
 <1jpl1qdisp.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jpl1qdisp.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI3PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:295::18) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TY1PPFA212DEADA:EE_
X-MS-Office365-Filtering-Correlation-Id: b4767827-ec02-48c6-d65d-08decc3e56d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	pAZKpNlNj7LxTxMnPVQAELSELYPbBsfSDB1oxgHR6YcN5Mi8GKxP92VoRz74tX+6TYeE+ZCeWRStI76Gk9IwVrpqajcT2c9jAbKpYKBPvhpARxNttU8sXjDwq+9puqHyTiRx5TqeEP8pw3c9am8Y73FUL1iQgYqk50dk4EQdjnQlCE5ihb8GR3XCmwVojumc3ICLPuho6rrsnHOsRA2aGq+hRbR2CSSPZWpBFDhW5wmHIq6k3Wn0l779CL6DrO+X03oKeKuo8Vj/6dR9Cps4QCbAgNUzPPhNjtugIEHtSiD0+8CDZYRKgVIVnd8Nd+ao2XpWKzp4BXh/QErgZjBbgOQu3ohxt5gkmgFLVKxwVJYOni/NWZbcNRa/Z7f6q2nYq6ixou47yiAR3/ctKTQr1fufcp6s+gF5BT+LG4f7hg7rRaWJd9E8QxNiNjBl1g2RdLPZV/AMQYvlWFRCJUn7M+6tpaqNXfAuGkDF7QIBl3pAnWfPYQWqlFVi7eM8eRB2u/E9bNo2TB7bfYn0HXjrphmUZGuTGLLGDw2VD9T9I94DB6c/q4pOpJp6WCFgtGQ6sMKn4JzmiGYQKu8Q2p6laUuSwdGk56K9YlL/q/RdZ5D3n34Y2ncYMWyhycxHo6308ti9kFTzVP4l2ur8jPd2R3m68H2Veyd8KyujZmsN18ra7eFbN/6uw4vfs5LgRSuS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE5zdlhwVzc3NWNTWktQWC9iZ01ob1Z0QTBjVzlFZFVJV21ES2Jqc050YVJI?=
 =?utf-8?B?V2k1dU5UcTB0Tjhyb3U0Z1FLa2lLZW5pMkhheHhtQkVJd1RwYTR6Y2l4czhY?=
 =?utf-8?B?d3BPZmJKK2tZTzdCdFFPVlJGV0MySDlycW1zR0Y5MzBHa2xxWTc3eFdSaTFY?=
 =?utf-8?B?N0FVcGprTHphME1ZbDNzSDh4d0JXcWh5YmhOcmlwL1d4NTVlaHlmVUxYb3FZ?=
 =?utf-8?B?UDVEZkpJQkdpa28vb2taMVM0M3VObWpuSW5BWktmWFlGYzhYV2swaFZRQ0ow?=
 =?utf-8?B?WVNKRzFWby9BVnlmZWR0RnUveWFxbG1pdTBMUi96V1czNFFpNlllY1Z2UVJJ?=
 =?utf-8?B?TUw1ZnQzSmkxZEZNNEFLYnVmZzhIZXBPUTkrdURVZTl5WHFYaHUwNmIvT05K?=
 =?utf-8?B?dDVWQ1E0ZDdhb2htdmk0L0xqOTJTYng5RE9Fb3haMXoyMlBOdEtzcnBRUG1J?=
 =?utf-8?B?c1Z6OHhEMTQrSW5KdmNSNUpYWVY3aVFUZWt0elduM2tJQlRHWEtvT2QzRngz?=
 =?utf-8?B?UjBTOG5VZzd1aGpXUjJKRzdMd0pHNkt6bEFwTm5FWnFsMEFDU2VuU2VpVjk1?=
 =?utf-8?B?ZmdNN1FIN3NtWG5ocmRDZDUvOC9UMktLQ3hUMjlISHpsQWVyMmxscFkrZUJy?=
 =?utf-8?B?MnM1eHo2S3BraFA4NnN2aUpNN0I2SmJ2TElPNUI1azVoN3ZKY0sxZHJHYjVs?=
 =?utf-8?B?Q2V6OWQrWlBpYnJjVytwNG90SzJldVJkOWpQcFNLK3UveUtKbDR5a01OV3E1?=
 =?utf-8?B?WXpvM2FJVWJmQTZFWHcyUG9UWGkybHllcm1pbkhaaXFLamd5Rnp1NU5CbHdH?=
 =?utf-8?B?OXA3Z2FQNjFWemM4WVQvM0ZIZWVOemNLYTNZK2ZORE1PWWhvNHFwVnhYMW9Z?=
 =?utf-8?B?Qm5DWGpCYjB3QXhNS0lGZytjbW5wbkZsbHBrUmphaXVoWE1LY3d0enlaa3c5?=
 =?utf-8?B?UFBEbi9XeDJvMXJHYnltSEI2dkE4MnVaRmNTNTZURG4zaGVLVVBabUhzWUZ1?=
 =?utf-8?B?VlJ0MlZPVjRXeVdEbnNIcUg2c2lTYXFQVDhlVmlUUXhIMkFKR3hZOWpmcGRu?=
 =?utf-8?B?VVM2Zm44OUU3V1FhWDBHTWExaTZwY0xmeTAyYWZQeVp3YWlMaU04SEtvQncx?=
 =?utf-8?B?R1dLN0xWVWU5R21ENmtyNW1RbnFoS3RmR3B1MXEwcXplV2dRb1lhZGdncDgr?=
 =?utf-8?B?dkNELy81WEFVQ0FyaCtocUtJTGxFNndxQzNJUDhpQWgxMENsOFpDM3Uxa3VW?=
 =?utf-8?B?VWtsdzlPekhkeEJRdEVITEJEaUNRK2NjMDM5QWdoZTJXT21NMXVmbHVxMGJY?=
 =?utf-8?B?a0xvaU55SFJHNzNGcEF3N0h6azVyM0UzaDlidzFEdUpxaDJ5YXRKNWRSRWMw?=
 =?utf-8?B?WXdkNmVMR0I3eGpCdVV0Q1hwSFRPZEtoemdhYUdWajRnWkppY3JMNlIrQmdu?=
 =?utf-8?B?YkY3S0JEOW1TblZxL0tKVXVWVWhpZGlhWlpSNzVNVDZ5cC9wTlJncHBWQmZ5?=
 =?utf-8?B?TWhhZUt6MWs4WFlUbnU2UFd2dU5veXc1TEhqU2F0SjdRbFM2a3JaUkNxMC9r?=
 =?utf-8?B?L0hCSHNXNGpkRXFnSU1PK3FlQjBEUm5NZC9QZXFqdTIrUUNVaEJ4bzBKOExP?=
 =?utf-8?B?T0FnOFRwNTdQRzVRYjZnaXZ0NGEvVU5aaTNKSkNzRTJaN2xkaXJGbTkxSzhH?=
 =?utf-8?B?M1JwN0J3dFR0cS9PNENjQW5qUEdtWVN2K3QwaDdBdjR5UWc4TXlHTzlPVTlk?=
 =?utf-8?B?U0x4allnK0ZRZXBiY3dFQ2FSem1ncU4xQUJid2RWUENUMGJTUStFSkJleU8r?=
 =?utf-8?B?dmNCYWhSQ3Y1TS84UlB5OVduZG00OWRCaUpnN09xQWFBMEQyalN1aWxIT3dn?=
 =?utf-8?B?MUxRcXhjdnA4MGprZHE5U0tlME53dkkvZEo5am9iUHNYOWJaZzJrZW1wMnhK?=
 =?utf-8?B?T0toajZNbUhQeDF4L083em5xc3FJaThucXdqRmh2U0RvcmR6aHcvMGRDbUVI?=
 =?utf-8?B?bGZKNmQ0VjYrYkM5YkRqcmFJL0JUdnRtWlQ5dHJENnZSVkRsK2VwQTRzZFZB?=
 =?utf-8?B?R0pscEVwdThQWTRsZzNyOUl2WHR0RFBxQnJyZHpuVjdPaWdvSHJwcmozTkhY?=
 =?utf-8?B?aE5FUzB4THpMQUw0Q1liNnhpRVByVnhPMks5SENYcjJzbnpEcU1qaS9PK09k?=
 =?utf-8?B?eW5HODdaVVhnV3phWnJZbEdnYUUvaDFIdkdHOTcvQkZTY1Z6djVndk1PaWY4?=
 =?utf-8?B?Y3NkQy9DT05iL2hiV1pra0REMDVEMzdCcXBGbDYzdmF5TEFxWW1kYitKVlZI?=
 =?utf-8?B?bll3VUR5a2ZMZWU4amZHZjdUdmo2a2dMUnliOU94L1VEZXFFcDFGQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4767827-ec02-48c6-d65d-08decc3e56d3
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 07:02:05.2234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEKzWIglpkO7MWUopGL/2LFZM0vPmbtpJ43oA7oTE3FHr6MZDj43E/3+dXBH6/4SF7mXq/NaIaA2FZNnEYCRZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFA212DEADA


On 6/16/2026 3:51 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On mar. 16 juin 2026 at 14:12, Jian Hu <jian.hu@amlogic.com> wrote:
>
>
>>>> If you think splitting it further into separate helper macros would improve
>>>> readability.
>>> One clock per macro please. Hidding 2 declaration is recipe for
>>> disaster. For ex, here the first one is static, the 2nd is not
>>
>> I'll split it into separate helper macros so that each macro expands to a
>> single clock definition.
>>
>> They are defined as follows: (Excluding struct clk_regmap)
>>
>> #define A9_VCLK_GATE(_name, _reg, _bit,  _parent)        \
>>          .data = &(struct clk_regmap_gate_data){          \
>>                  .offset = _reg,      \
>>                  .bit_idx = _bit,       \
>>          },       \
>>          .hw.init = &(struct clk_init_data) {           \
>>                  .name = #_name "_en",      \
>>                  .ops = &clk_regmap_gate_ops,           \
>>                  .parent_hws = (const struct clk_hw *[]) { _parent },    \
>>                  .num_parents = 1,      \
>>                  .flags = CLK_SET_RATE_PARENT,      \
>>          },
>>
>> #define A9_VCLK_DIV(_name, _reg, _div)       \
>>
>>      ....
>>
>> static struct clk_regmap a9_vclk_div2_en = {
>>          A9_VCLK_GATE(vclk_div2, VID_CLK_CTRL, 1, &a9_vclk.hw),
>> };
>>
>>
>> static struct clk_regmap a9_vclk_div2 = {
>>          A9_VCLK_DIV(vclk_div2, VID_CLK_CTRL, 2),
>> };
>>
>> My understanding is that you would prefer helper macros to cover only the
>> repeated initializer fields,
>> while keeping the actual clock declarations explicit.
> I do not have a definitive preference over this but I do want things to be
> consistent, at least within the driver, globaly whenever possible.
>
> Look at the other macros you have already defined in your driver and do
> the same thing, including the way you declare the variable. Apart from
> this, it seems fine.


Understood.

I'll align the new helper macros with the style already used in this driver.

>> If that's not what you had in mind, please let me know.
>>>> I can do that as well.
>>>>
> --
> Jerome

--

Jian

