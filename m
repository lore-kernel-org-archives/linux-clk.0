Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022089.outbound.protection.outlook.com [40.107.75.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA663E3C5A;
	Mon, 15 Jun 2026 11:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781522727; cv=fail; b=hnS6DbGUJjTrobfPynkvSN/LM/P1h4P+CUkSqMNnHhwvhpX+Dor0wTFqZ/79C/ASeDDyg5wlHOaQ5qgdKOCIMCvbfKI+C5Q9i6BHxpbsZZv4lhnVmv0b/aU/cWj+h4HxwHNrY5nte5karB/1EeUZI+vEAafMorIHje3oy4IsorQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781522727; c=relaxed/simple;
	bh=jju6of34wQ916oK0iZpKoGkU3ThQwr+x/2g1Rm63kSc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bMsXq1GoVq0OSJAwUHz+Gu1RV2xd+9QfDjap7rdGwkof7RDh717lUvsNwFDMnPMQaLRkGrmKkkZN1uBqjuWd9/ZLkRSv4oYNcDJullCZyYPMVnKc4DTRl6cKnk7KDc36dzg+FCZ2/wPZxZ96MnE9tApnBiZ8upnuujh2FLvpYbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Fs3qBuZT; arc=fail smtp.client-ip=40.107.75.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Fs3qBuZT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEActk8KZSFmE/O5pAYKzhGKsho4rtaTh2I88bBfdMH2YS6PeBXYyJJM3L53mlK6LcsA39lpnTIQqCdpLnpzHcE4I6c/KrFIoXTcocNkti22XFC/RULgrbCXvAn7I9/pJ0tVOcv83ABMTgfW8E3Mrf+UdHbrnYAxMLlhxdvsDI2G5rdlcAD7BOnlatW25VEno0H623JMR1zcmyh2n3vp81EDhlpn0ua9KPv1NATbshzLvW/dmgjvbFvVX1aWemW2rGMclkidd/sz7Wx3ozS7FJrv6YDtDw/TU913t6cuOHD3u/T4ge3OECeZNpoOgzEBoHtMM9NWutRrr8rLNKY4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPxmpHnb24cxkCq6I23Sx4IjYKhbQfEmDMfwX5QGklE=;
 b=eNofwHvCizkjiXw7aU+ob23W0UABA6e7vbMHKSUhD0T3HAEOJkrDZL9BEy5Zll00QQ428gzl1SJL7S3Cy6GzcJsXyMCRGTtA1EQ6FAze5NliABUYp9/9E3tHeq9Qzd74vir6YB86JnCuRrhdc7TTSJHvxOzvgF9mtJl3ywWM8aqFGNe8LWnQVUpvSSrKXBJdOMhRr0sHTv9JnsDLxqe2GC97P89hMD+2zx4SLO9hkai7Bf5NlX3vINffEVlB5rptnc3zCWZiu1o5fidiGa43+SN1MtKxaaPLGSjXFB9SBVBeonz+XpajKjJyUzlnPehrCsGMvqiUxitO9M7ET8376g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPxmpHnb24cxkCq6I23Sx4IjYKhbQfEmDMfwX5QGklE=;
 b=Fs3qBuZTIJbQYS2S8nsUIodFSDw2/yht9sleqti9d5oPzGxl3ZNj3E2vlzxVULpSvG9AHmIlBzvXFeGcyQOMdwhB09ENEXNOK61RnFd47BDj6zzzQSKTj1Iow2KW3DY6yziRYvbMbb5gnVWVj6jKMYx5tvcop3xbgWXmd2iUmLo72VENC+Iz53YaAcN1hXKztFiUmIBmR2EsM6VVO2dzzPzFFrRV2dKVyK3/WMASPAQ0uK94du9Fx8ZqTt2XMFVXI+yfxRJ6JfGYyPuaat5zdmoGsJERciJzHW3R5pkhwcqQqq2aXa+PjADhPfaOh9vXJzXP/5FxwAS2+jhTynrV3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEZPR03MB8710.apcprd03.prod.outlook.com (2603:1096:101:234::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 15 Jun
 2026 11:25:22 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0139.009; Mon, 15 Jun 2026
 11:25:22 +0000
Message-ID: <bfe92bbe-5325-4497-b79f-10c7a6e1ed5b@amlogic.com>
Date: Mon, 15 Jun 2026 19:25:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] clk: amlogic: Add A9 peripherals clock controller
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
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260610-a9_peripherals-v3-0-d07a78085f71@amlogic.com>
 <20260610-a9_peripherals-v3-2-d07a78085f71@amlogic.com>
 <1jecieftme.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jecieftme.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEZPR03MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 410d5bf7-95f1-471c-4439-08decad0ca10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|11063799006|4143699003|56012099006|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NScyRDXGWR9/nDuBkdheMNY1Pme1sFO/bprvonqHknnRYbFjUmj6g2EIbLyLoZ0IG2DSbjrqLbCZ/4kYwPAbLQyHDZv/L/Znn3sHP0bBhTlhEgNx7lwF/UtnAYHPLXpoXcSyILViQ6AgLlh3D4VMCtNI/cxrP/cR2D2AZ+CjtvRYtb/OMNwYSf8DYZWy0TDcGfXVC2sf+4AT/uIh1org+vgkgc6080t+ouXl61+QFIz3KSOGWCmkXZAu4JnudD4FaIXuLmrba28JLtQXtHOVUpoY1l0lcKb3NMaCexvBNjC7/j7BCeeBlLOiQMwHQwLdzfG/EAtxuYjBHYBDh3wCDnKt5s1gWFf0usSxSsGl9pQv1IjXRKSn7aCeViIQfZ7MEcQS6VM5rj0MMIGKebcfMpKD575d4e4oqAySy5CmO+t6IJMXfmxseasZIcR6cwhgTJKijY3nUqc97djv/oSCAHYamXMyIDVxQ6t+TkbjPH46OHLbtnRbHPMPyPVQ+mtMWXvFLS8wIQmtMofRAr8h5VikflSpSmdqtnmi9RC4Ekw8PmD7prwLquaw8v6r6qkit4k1vm96j6EsChcdars3r2uvpoT8CMAjyEb6hvGB4Qz+HP9o1SEiyu9mNKlB2qumlifBk+vc59rJRhQann+SFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(11063799006)(4143699003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmRGLzBRbGJ1aTYyVUs2ZGxlTllDUCtzdm9pcUJXenA5U0U5RmFNRzZvMnpw?=
 =?utf-8?B?R3d3TXFtQlhjNk56RkltN1Y1Z3ZYTmZvbEc1OHpXcmhvV2RTMUM3VFlsR2li?=
 =?utf-8?B?Ukx1eEx3R1NuSEYxKzdzZGkvdkE3ZWNPc0VZUy9ad3dvNkttZGd1dDFib3JO?=
 =?utf-8?B?SE5ScER0eCtnQjc5cStnaTEwOVJJbVI3NjJkQVRDcXIySXkrVk1zdnpRYWVY?=
 =?utf-8?B?WDV3VlBxdUZUZmVtek1CSldSNEo0clNMQnNPamJYTjUvdzlSc01kNjRsU2h0?=
 =?utf-8?B?MGZuQU1GcGk3QzR3Nk5QZldqaXBmR3Q2NFdUL2tUSURtR1ppb0lydzAzck1T?=
 =?utf-8?B?aWU4N3hXR05ZekNpbkpqV2RxZWE3VGpQM2JOU3N1SEdUZU1wcnVVUXNDZHdO?=
 =?utf-8?B?VDNHMWhpUlk0eTgydHkzMWFTVkdKdmZEMVgvZCsxT3V4MVp5VVYybjluakhZ?=
 =?utf-8?B?eUJuTEkvUHg1VWxJNVhnTGZTbHVMM3l0V0psMGxPTnErV1JlK1V0UnFrMXVT?=
 =?utf-8?B?VWttQldyZjM4RG1sb3pyWFFlZWg2TUVyZW5aSXp1YVFVWHI2cWlqVi9YMXIv?=
 =?utf-8?B?RmNhellqaUxuU1ZxWGhodUUxYVAxTmVSTUJHUTdzZEl5c2tZUU01a2JoVzB2?=
 =?utf-8?B?c0FPejRGVFlkeTJwdHJQK0VvQmZCVTVlQUhCVE0yK1FWT2lkTGtHMGl2NmJM?=
 =?utf-8?B?QUg1NndYdXJvV2M4bHZNWmVkSWwySFFlOXVRS2phdlBwZDBUaEtESnZ0L25N?=
 =?utf-8?B?ZGZSamZ1OFVLdk50N2ZHOHlOZzdncUpVdm5HbWFUZkhhSVJIOHV0Uzh1U3dR?=
 =?utf-8?B?SUdTM1M3c2k4STdjWkdpWERwTGZNRE9qNXNKMmtWU0VaRzFENG5SREc2SkhC?=
 =?utf-8?B?R1UyQ0Evc1VSQ3lHNVZVam5mQ2Y0djJrd01vMklyVHU3bmpRdDk2MDFhNE96?=
 =?utf-8?B?OFhoenZuaGd1cEZ6OFAzaWJ4OFRvdTNtaWdxd1c4V3lxdnIrbFQxZG14NzNj?=
 =?utf-8?B?alVJdDRCOG92QkNCUWErSlQ2Q21VTjVua25SOTJaVEJxVm55TEZXa09Gcksz?=
 =?utf-8?B?SUFjMm9HczhoL1o5QVlmU3V3emdjb21ueFpaY20yUDhvUkRWTnp2ck9BMFBX?=
 =?utf-8?B?TXZlS1V0bUxRRE96M0VWZG05TXZ2WGJVcktiWkJpN3BJQlF4eVA4Y3Z5RVFW?=
 =?utf-8?B?eG4weXhKT0ZEbmpudTBBcXovT0FXUG53c3NIemxqN2dnaUZSUVpJeXNwWWNG?=
 =?utf-8?B?QWE4dGJEdmpsdUpER0VLSTVLem44ZHlBajlUdG1idXZGMmpRWUg5ZUxDZ25m?=
 =?utf-8?B?aFo2aElqKzF0bHZHZWRsaUxsd0d0WjI4dHc1Qm9PRmRPTnM4eGc0bEJNRytu?=
 =?utf-8?B?UjgraU9kWklHUDhsT1VUREVWK1p2UE01bElpUTBvdXVJYVBQd3dZVitmbXFJ?=
 =?utf-8?B?MlkyRDNGRkF2cWhCRkJHZmxUVkh1RDFJZ3NsTG9xV0hUdHFFWGhrSGlnRS9P?=
 =?utf-8?B?bC9LbUJITFJvSWxvUjR2ZjhCZWJ6cUZGQ1B5UHB6RTRyZk85b0k5bzU1b20x?=
 =?utf-8?B?SVpnemNQTklGVDRUWmgrazVhSHJ4QkJZVi9FbUdXVmZVMGdKbzRlS05tSW5u?=
 =?utf-8?B?RjEzMGZFSXZWVHNvOFZuQllDMmJrVnlWUGNpSW0wcnpaRTAzcCtsZmVZY1hD?=
 =?utf-8?B?cmdMeHBsZ3BoRVhBRnJNYTJuTGVWcU81MVlEQ3VsNi9JVEpOZ1pybE5ueFR5?=
 =?utf-8?B?TVNZcG96cTZyTDJWd2haUmNmbmNqL1c4MzFDZlpUVjFOTms0UTk0R2M3UVRw?=
 =?utf-8?B?RER3ZEJHS0s4MHZ0cDBSTG0vaVVPeWw0MFZBSlRVdlgwbmtMd1FxaTlGaHMx?=
 =?utf-8?B?Vkc5Q2dNc0FPeGhPSXU2OXJPOEhWMjROZTk1aUJseU04eDdZLzBOL1YrcHJs?=
 =?utf-8?B?bFVGR0pISFQxY0FyN2NWL0Y4NlFGK2xoU1FvYlFqTGpNUHpmUFRqeDRmOW5G?=
 =?utf-8?B?eEVBdmVleWovaTJRWlMzTTIxSFBnUkNreVNVaDFvcXdLVHNwdmEyYkcyTDNx?=
 =?utf-8?B?YTVjV05sUlBVWWp0d3F1V2d1bG1FNytyMUN4eDlSbURFblRoQnliTVpBSEdV?=
 =?utf-8?B?RDBMUTN1SzYrc3ZWWVlWNDhhNS9FY3ZYeFlEcmNJNlRIZFFMNnhQUFpZZW0z?=
 =?utf-8?B?U0RUU2Z5YjNQMndsbkJMSGZ6bzhwSWFlMGdiWk5aOVlHK1B2biswazBRdFha?=
 =?utf-8?B?R0JtamdJWDdFMTRqbHhvQTFzT0U2dnE2ZnRjYlF0L1JmUmpnWXdGQ2RPWkhM?=
 =?utf-8?B?T3kvbXdaZCtEd0ROc3IvOUxCMjF0aklPNWcxelBibENpTkwzM0pYQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410d5bf7-95f1-471c-4439-08decad0ca10
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 11:25:22.6586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zcs1U/pB3iRLZurlibxyLkygIZrM6eXo6z5UmQFrsGkWv9y+AGEdRRhT/Ed7flyOu2/6ZoA+vn9tNNqExhT2KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8710


On 6/10/2026 8:49 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On mer. 10 juin 2026 at 16:14, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>
>> From: Jian Hu <jian.hu@amlogic.com>
>>
>> Add the peripherals clock controller driver for the Amlogic A9 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/Kconfig          |   15 +
>>   drivers/clk/meson/Makefile         |    1 +
>>   drivers/clk/meson/a9-peripherals.c | 1925 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 1941 insertions(+)
>>

[ ... ]

>> +
>> +/* Channel 6 is unconnected. */
>> +static u32 a9_glb_parents_val_table[] = { 0, 1, 2, 3, 4, 5, 7 };
>> +static struct clk_regmap a9_dspa;
> What is this ?


The peripheral clock definitions are ordered by register offset.

dspa is one of the parents of the glb clock, while the dsp clock 
registers are located after the GLB clock registers.

Since glb references a9_dspa before its full definition appears, the 
declaration

static struct clk_regmap a9_dspa;

is added as a forward declaration to satisfy the compiler.


Would it make sense to relax the register-offset ordering in this case?

By defining the DSP clock before the GLB clock, we could remove the 
forward declaration of a9_dspa.

>> +
>> +static const struct clk_parent_data a9_glb_parents[] = {
>> +     { .fw_name = "xtal", },
>> +     { .hw = &a9_dspa.hw },
>> +     { .fw_name = "fdiv3", },
>> +     { .fw_name = "fdiv4", },
>> +     { .fw_name = "fdiv5", },
>> +     { .hw = &a9_isp.hw },
>> +     { .fw_name = "rtc", }
>> +};
>> +
>> +static A9_COMP_SEL(glb, GLB_CLK_CTRL, 9, 0x7, a9_glb_parents,
>> +                a9_glb_parents_val_table);
>> +static A9_COMP_DIV(glb, GLB_CLK_CTRL, 0, 7);
>> +static A9_COMP_GATE(glb, GLB_CLK_CTRL, 8, 0);
>> +
>> +static struct clk_regmap a9_usb_48m_dualdiv_in = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = USB_CLK_CTRL,
>> +             .bit_idx = 31,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("usb_48m_dualdiv_in", &a9_usb_48m_pre.hw,
>> +                               &clk_regmap_gate_ops, 0),
> Same comment as on the AO controller


Ok, I will drop CLK_HW_INIT*, and apply the same change to the other 
clock definitions.


[ ... ]

>> +
>> +/* Channel 3 is unconnected. */
> You meant 3rd I guess but this is misleading and confusing with the
> table bellow. Channel 2 would be more appropriate I think, since those
> are 0-based.


You are right,  The 3rd channel is unconnected.  I will fix it in the 
next version.

>> +static u32 a9_can_pe_parents_val_table[] = { 0, 1, 3 };
>> +static const struct clk_parent_data a9_can_pe_parents[] = {
>> +     { .fw_name = "sys", },
>> +     { .fw_name = "xtal", },
>> +     { .fw_name = "fdiv5", }
>> +};
>> +


[ ... ]

>> +
>> +/*
>> + * Channel 3(ddr_dpll_pt_clk) is manged by the DDR module;
>> + * channel 12(msr_clk) is manged by clock measures module.
>> + * channel 16(audio_dac1_clk) is manged by audio module.
> Some why can't you expose those then ? gen clk is used for debugging
> AFAIK. The clock above are worth debugging I think
>
> Please be consistent with the CaSing.


For channel 3 (ddr_dpll_pt_clk), it is sourced from the DDR PLL clock 
controller rather than
this clock controller. I will expose it in the DT.

For channel 12 (msr_clk), it depends on the clock measurement 
configuration.
The measurement source must first be selected through freq_ctrl[20:26], and
only then does msr_clk become meaningful. In practice.
It is not a real clock but an output of the measurement logic, so it can 
not be exposed as a clock.

https://elixir.bootlin.com/linux/v7.1-rc7/source/drivers/soc/amlogic/meson-clk-measure.c#L809

For channel 16 (audio_dac1_clk), I confirmed with the clock hardware 
designer that
it is actually unconnected. It looks like there is an error in the 
documentation.

I'll also fix the casing to keep it consistent throughout the comments.
>> + * Channel 10, 11, 13, 14 are not connected.
>> + */
>> +static u32 a9_gen_parents_val_table[] = { 0, 1, 2, 4, 5, 6, 7, 8, 9, 15, 17, 18,
>> +                                       19, 20, 21, 22, 23, 24, 25, 26};
>> +static struct clk_regmap a9_vid_pll;
>> +
>> +static const struct clk_parent_data a9_gen_parents[] = {
>> +     { .fw_name = "xtal" },
>> +     { .fw_name = "rtc" },
>> +     { .fw_name = "sysplldiv16" },
>> +     { .hw = &a9_vid_pll.hw },
>> +     { .fw_name = "gp0" },
>> +     { .fw_name = "hifi1" },
>> +     { .fw_name = "hifi0" },
>> +     { .fw_name = "gp1" },
>> +     { .fw_name = "gp2" },
>> +     { .fw_name = "dsudiv16" },
>> +     { .fw_name = "cpudiv16" },
>> +     { .fw_name = "a78div16" },
>> +     { .fw_name = "fdiv2" },
>> +     { .fw_name = "fdiv2p5" },
>> +     { .fw_name = "fdiv3" },
>> +     { .fw_name = "fdiv4" },
>> +     { .fw_name = "fdiv5" },
>> +     { .fw_name = "fdiv7" },
>> +     { .fw_name = "mclk0" },
>> +     { .fw_name = "mclk1" }
>> +};
>> +
>> +static A9_COMP_SEL(gen, GEN_CLK_CTRL, 12, 0x1f, a9_gen_parents,
>> +                a9_gen_parents_val_table);
>> +static A9_COMP_DIV(gen, GEN_CLK_CTRL, 0, 11);
>> +static A9_COMP_GATE(gen, GEN_CLK_CTRL, 11, 0);
>> +


[ ... ]

>> +
>> +static struct clk_regmap a9_enc, a9_enc1;
> What is this again ?? and please come up with better names.


Same as the previous dspa clock declaration.

enc stands for encoder. I'll rename a9_enc to a9_encoder0 and a9_enc1 to 
a9_encoder1 in the next version.

>> +
>> +static const struct clk_parent_data a9_vid_lock_parents[] = {
>> +     { .fw_name = "xtal", },
>> +     { .hw = &a9_enc.hw },
>> +     { .hw = &a9_enc1.hw }
>> +};
>> +
>> +static A9_COMP_SEL(vid_lock, VID_LOCK_CLK_CTRL, 9, 0x7, a9_vid_lock_parents,
>> +                NULL);
>> +static A9_COMP_DIV(vid_lock, VID_LOCK_CLK_CTRL, 0, 7);
>> +static A9_COMP_GATE(vid_lock, VID_LOCK_CLK_CTRL, 8, 0);
>> +
>> +static const struct clk_parent_data a9_vdin_meas_parents[] = {
>> +     { .fw_name = "xtal", },
>> +     { .fw_name = "fdiv4", },
>> +     { .fw_name = "fdiv3", },
>> +     { .fw_name = "fdiv5", }
>> +};
>> +
>> +static A9_COMP_SEL(vdin_meas, VDIN_MEAS_CLK_CTRL, 9, 0x7, a9_vdin_meas_parents,
>> +                NULL);
>> +static A9_COMP_DIV(vdin_meas, VDIN_MEAS_CLK_CTRL, 0, 7);
>> +static A9_COMP_GATE(vdin_meas, VDIN_MEAS_CLK_CTRL, 8, 0);
>> +
>> +static struct clk_regmap a9_vid_pll_div = {
>> +     .data = &(struct meson_vid_pll_div_data){
>> +             .val = {
>> +                     .reg_off = VID_PLL_CLK_DIV,
>> +                     .shift   = 0,
>> +                     .width   = 15,
>> +             },
>> +             .sel = {
>> +                     .reg_off = VID_PLL_CLK_DIV,
>> +                     .shift   = 16,
>> +                     .width   = 2,
>> +             },
>> +     },
>> +     .hw.init = CLK_HW_INIT_FW_NAME("vid_pll_div", "hdmiout2",
>> +                                    &meson_vid_pll_div_ro_ops, 0),
>> +};
>> +
>> +static struct clk_regmap a9_vid_pll_sel = {
>> +     .data = &(struct clk_regmap_mux_data){
>> +             .offset = VID_PLL_CLK_DIV,
>> +             .mask = 0x1,
>> +             .shift = 18,
>> +     },
>> +     .hw.init = CLK_HW_INIT_PARENTS_DATA("vid_pll_sel",
>> +                     ((const struct clk_parent_data []) {
>> +                             { .hw = &a9_vid_pll_div.hw },
>> +                             { .fw_name = "hdmiout2" }
>> +                     }), &clk_regmap_mux_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vid_pll = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VID_PLL_CLK_DIV,
>> +             .bit_idx = 19,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vid_pll", &a9_vid_pll_sel.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vid_pll_vclk = {
>> +     .data = &(struct clk_regmap_mux_data){
>> +             .offset = HDMI_CLK_CTRL,
>> +             .mask = 0x1,
>> +             .shift = 15,
>> +     },
>> +     .hw.init = CLK_HW_INIT_PARENTS_DATA("vid_pll_vclk",
>> +                     ((const struct clk_parent_data []) {
>> +                             { .hw = &a9_vid_pll.hw },
>> +                             { .fw_name = "hdmipix" }
>> +                     }), &clk_regmap_mux_ops, 0),
>> +};
>> +
>> +static const struct clk_parent_data a9_vclk_parents[] = {
>> +     { .hw = &a9_vid_pll_vclk.hw },
>> +     { .fw_name = "pix0", },
>> +     { .fw_name = "vid1", },
>> +     { .fw_name = "pix1", },
>> +     { .fw_name = "fdiv3", },
>> +     { .fw_name = "fdiv4", },
>> +     { .fw_name = "fdiv5", },
>> +     { .fw_name = "vid2", }
>> +};
>> +
>> +static struct clk_regmap a9_vclk_sel = {
>> +     .data = &(struct clk_regmap_mux_data){
>> +             .offset = VID_CLK_CTRL,
>> +             .mask = 0x7,
>> +             .shift = 16,
>> +     },
>> +     .hw.init = CLK_HW_INIT_PARENTS_DATA("vclk_sel", a9_vclk_parents,
>> +                     &clk_regmap_mux_ops, 0),
>> +};
>> +
>> +static struct clk_regmap a9_vclk_in = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VID_CLK_DIV,
>> +             .bit_idx = 16,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk_in", &a9_vclk_sel.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vclk_div = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = VID_CLK_DIV,
>> +             .shift = 0,
>> +             .width = 8,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk_div", &a9_vclk_in.hw,
>> +                               &clk_regmap_divider_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vclk = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VID_CLK_CTRL,
>> +             .bit_idx = 19,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk", &a9_vclk_div.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vclk_div1_en = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VID_CLK_CTRL,
>> +             .bit_idx = 0,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk_div1_en", &a9_vclk.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vclk_div2_en = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VID_CLK_CTRL,
>> +             .bit_idx = 1,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk_div2_en", &a9_vclk.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
> Looks to me all this div_en / div repeating pattern would be easier to review
> with tiny macro .


Good point.

I tried to reduce the repeated div_en/div pattern using a helper macro.

It keeps the relationship between gate and fixed-factor clock more 
compact and easier to review.

After using the helper macro, the div_en/div code can be simplified to 
the following:

#define A9_VCLK(_name, _reg, _bit, _div, _parent)        \
struct clk_regmap a9_##_name##_en = {      \
         .data = &(struct clk_regmap_gate_data){          \
                 .offset = _reg,      \
                 .bit_idx = _bit,       \
         },       \
         .hw.init = &(struct clk_init_data) {           \
                 .name = #_name "_en",      \
                 .ops = &clk_regmap_gate_ops,           \
                 .parent_hws = (const struct clk_hw *[]) { _parent },    \
                 .num_parents = 1,      \
                 .flags = CLK_SET_RATE_PARENT,      \
         },       \
};       \
       \
struct clk_fixed_factor a9_##_name = {       \
         .mult = 1,       \
         .div = _div,       \
         .hw.init = &(struct clk_init_data){          \
                 .name = #_name,      \
                 .ops = &clk_fixed_factor_ops,          \
                 .parent_hws = (const struct clk_hw *[]) {      \
                         &a9_##_name##_en.hw          \
                 },       \
                 .num_parents = 1,      \
                 .flags = CLK_SET_RATE_PARENT,      \
         },       \
};       \

static A9_VCLK(vclk_div2, VID_CLK_CTRL, 1, 2, &a9_vclk.hw);
static A9_VCLK(vclk_div4, VID_CLK_CTRL, 2, 4, &a9_vclk.hw);
static A9_VCLK(vclk_div6, VID_CLK_CTRL, 3, 6, &a9_vclk.hw);
static A9_VCLK(vclk_div6, VID_CLK_CTRL, 4, 12, &a9_vclk.hw);
static A9_VCLK(vclk2_div2, VIID_CLK_CTRL, 1, 2, &a9_vclk2.hw);
static A9_VCLK(vclk2_div4, VIID_CLK_CTRL, 2, 4, &a9_vclk2.hw);
static A9_VCLK(vclk2_div6, VIID_CLK_CTRL, 3, 6, &a9_vclk2.hw);
static A9_VCLK(vclk2_div6, VIID_CLK_CTRL, 4, 12, &a9_vclk2.hw);


If you think splitting it further into separate helper macros would 
improve readability.

I can do that as well.

>> +
>> +static struct clk_fixed_factor a9_vclk_div2 = {
>> +     .mult = 1,
>> +     .div = 2,
>> +     .hw.init = CLK_HW_INIT_HW("vclk_div2", &a9_vclk_div2_en.hw,
>> +                               &clk_fixed_factor_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vclk_div4_en = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VID_CLK_CTRL,
>> +             .bit_idx = 2,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk_div4_en", &a9_vclk.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_fixed_factor a9_vclk_div4 = {
>> +     .mult = 1,
>> +     .div = 4,
>> +     .hw.init = CLK_HW_INIT_HW("vclk_div4", &a9_vclk_div4_en.hw,
>> +                               &clk_fixed_factor_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vclk_div6_en = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VID_CLK_CTRL,
>> +             .bit_idx = 3,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk_div6_en", &a9_vclk.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_fixed_factor a9_vclk_div6 = {
>> +     .mult = 1,
>> +     .div = 6,
>> +     .hw.init = CLK_HW_INIT_HW("vclk_div6", &a9_vclk_div6_en.hw,
>> +                               &clk_fixed_factor_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vclk_div12_en = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VID_CLK_CTRL,
>> +             .bit_idx = 4,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk_div12_en", &a9_vclk.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_fixed_factor a9_vclk_div12 = {
>> +     .mult = 1,
>> +     .div = 12,
>> +     .hw.init = CLK_HW_INIT_HW("vclk_div12", &a9_vclk_div12_en.hw,
>> +                               &clk_fixed_factor_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vclk2_sel = {
>> +     .data = &(struct clk_regmap_mux_data){
>> +             .offset = VIID_CLK_CTRL,
>> +             .mask = 0x7,
>> +             .shift = 16,
>> +     },
>> +     .hw.init = CLK_HW_INIT_PARENTS_DATA("vclk2_sel", a9_vclk_parents,
>> +                     &clk_regmap_mux_ops, 0),
>> +};
>> +
>> +static struct clk_regmap a9_vclk2_in = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VIID_CLK_DIV,
>> +             .bit_idx = 16,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk2_in", &a9_vclk2_sel.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vclk2_div = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = VIID_CLK_DIV,
>> +             .shift = 0,
>> +             .width = 8,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk2_div", &a9_vclk2_in.hw,
>> +                               &clk_regmap_divider_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vclk2 = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VIID_CLK_CTRL,
>> +             .bit_idx = 19,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk2", &a9_vclk2_div.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vclk2_div1_en = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VIID_CLK_CTRL,
>> +             .bit_idx = 0,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk2_div1_en", &a9_vclk2.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vclk2_div2_en = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VIID_CLK_CTRL,
>> +             .bit_idx = 1,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk2_div2_en", &a9_vclk2.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_fixed_factor a9_vclk2_div2 = {
>> +     .mult = 1,
>> +     .div = 2,
>> +     .hw.init = CLK_HW_INIT_HW("vclk2_div2", &a9_vclk2_div2_en.hw,
>> +                               &clk_fixed_factor_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vclk2_div4_en = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VIID_CLK_CTRL,
>> +             .bit_idx = 2,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk2_div4_en", &a9_vclk2.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_fixed_factor a9_vclk2_div4 = {
>> +     .mult = 1,
>> +     .div = 4,
>> +     .hw.init = CLK_HW_INIT_HW("vclk2_div4", &a9_vclk2_div4_en.hw,
>> +                               &clk_fixed_factor_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vclk2_div6_en = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VIID_CLK_CTRL,
>> +             .bit_idx = 3,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk2_div6_en", &a9_vclk2.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_fixed_factor a9_vclk2_div6 = {
>> +     .mult = 1,
>> +     .div = 6,
>> +     .hw.init = CLK_HW_INIT_HW("vclk2_div6", &a9_vclk2_div6_en.hw,
>> +                               &clk_fixed_factor_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_vclk2_div12_en = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VIID_CLK_CTRL,
>> +             .bit_idx = 4,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vclk2_div12_en", &a9_vclk2.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_fixed_factor a9_vclk2_div12 = {
>> +     .mult = 1,
>> +     .div = 12,
>> +     .hw.init = CLK_HW_INIT_HW("vclk2_div12", &a9_vclk2_div12_en.hw,
>> +                               &clk_fixed_factor_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +/* Channel 5, 6 and 7 are unconnected */
>> +static u32 a9_vid_parents_val_table[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
>> +static const struct clk_hw *a9_vid_parents[] = {
>> +     &a9_vclk_div1_en.hw,
>> +     &a9_vclk_div2.hw,
>> +     &a9_vclk_div4.hw,
>> +     &a9_vclk_div6.hw,
>> +     &a9_vclk_div12.hw,
>> +     &a9_vclk2_div1_en.hw,
>> +     &a9_vclk2_div2.hw,
>> +     &a9_vclk2_div4.hw,
>> +     &a9_vclk2_div6.hw,
>> +     &a9_vclk2_div12.hw
>> +};
>> +
>> +static struct clk_regmap a9_vdac_sel = {
>> +     .data = &(struct clk_regmap_mux_data){
>> +             .offset = VIID_CLK_DIV,
>> +             .mask = 0xf,
>> +             .shift = 28,
>> +             .table = a9_vid_parents_val_table,
>> +     },
>> +     .hw.init = CLK_HW_INIT_PARENTS_HW("vdac_sel", a9_vid_parents
>> +                     , &clk_regmap_mux_ops, 0),
>> +};
>> +
>> +static struct clk_regmap a9_vdac = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VID_CLK_CTRL2,
>> +             .bit_idx = 4,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("vdac", &a9_vdac_sel.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static struct clk_regmap a9_enc_sel = {
> Should this be enc0 then ? for consistency ?
> Same applies to similar instance (it is the same discussion we already
> had on the T7 I believe)


Yes, that makes sense.

I'll rename them to a9_encoder0 and a9_encoder1 for consistency, and 
I'll check for other similar instances as well.

>> +     .data = &(struct clk_regmap_mux_data){
>> +             .offset = VIID_CLK_DIV,
>> +             .mask = 0xf,
>> +             .shift = 12,
>> +             .table = a9_vid_parents_val_table,
>> +     },
>> +     .hw.init = CLK_HW_INIT_PARENTS_HW("enc_sel", a9_vid_parents
>> +                     , &clk_regmap_mux_ops, 0),
>> +};
>> +
>> +static struct clk_regmap a9_enc = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = VID_CLK_CTRL2,
>> +             .bit_idx = 10,
>> +     },
>> +     .hw.init = CLK_HW_INIT_HW("enc", &a9_enc_sel.hw,
>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>> +};
>> +


[ ... ]

> --
> Jerome


--

Jian

