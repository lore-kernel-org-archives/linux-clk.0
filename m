Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022098.outbound.protection.outlook.com [52.101.126.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936413D75BE;
	Tue, 16 Jun 2026 06:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590350; cv=fail; b=VhH3onFyQWpwchqJUkmr9pi6SJVq3L9j/qKz7SpHckCmAetN6SQ1uxp+HHsxEtIPGVS4G0zwFotHiCVMCUC3tLbl/j4Vr7O/hqZi9JTgoFYyWJnwA2qFMd1JrsN4jxl+AXVc9a0UkcTHjDrPIdOF9hmpa9jgrmkBF3ORzggVb1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590350; c=relaxed/simple;
	bh=5YYeS+WFUOK3GTH1My46nGQbrY+vq+dbw1LZHmhQ1ZA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a4HZUBIE5WDBkxQQ3wqSjMAZ8+2MBUpJVq9zx292OFOWhbicYm61aT2nPcOq+NT+jnVZGgAb4hPIUw8Ob+3pcDWrgnMLlOjnlhZ2h8nE3XSil6yE7A1+G7Uu9Qupq8Yq9dWvT9dj3ouJvcnp1jSdgavArU45DsgAOL6TEFFByKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=DC9es54Q; arc=fail smtp.client-ip=52.101.126.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="DC9es54Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krZqORzIA9hiVaRipo57if/3wi9c4l8YvZLL22G6iNC+OYyscgEUZaJfjG2DNS3ch7hSr4VaQ/l/susSJSn7iKgDvzJZMudOd24CgAa9ovT7IpYoVGBqlWa6qVAwbybSnWavURKqZtHCZhIMRSekN9l6DaO7yLlT2F/dFyZvYe95Xp5q37SD7vTm+w2dlRP7Rw/Y0SEJQLdv6t6hktQdzt9OkQr8HRcq0k0e4IGYHtWLsyoIeOrhOxXh6/l8UW+UpOWEpujcj+qG88bRY9AHbbSo+r4G8rQV5S96yh4KfgtXdF0wfXJpQEbdL+aByTE40lwXoloKtS9VoEEVEwI+aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IC1KoUvF73OtWJ/lTWg9nZe3Dxd1TPPs/CEL0ojNFYQ=;
 b=EhuYiXk7oqAmDc+1xRqC4vnMMZaBuxIn9uqmF5ymmf1ajl3f728fxOCZu+28fmgwFwSw5txkQjZpyM4tDEWslb9uCxpm0EfIK3FEKznBxbs/GUr8YMzJ3Mx6KQqY3WjVa7eIzU9AmM7qJivgytBWDPsS44PXvMqDOO+2zP3jTYHuxs45AqNGeHSbIlkyrTPrQt6kd7hL6VBSSSRXpVXwBfY3v06u6+j8N86UFYpDIiiQdozCIkYpQz8CK2WnohdnaoGWtAu1VpJDVOn3//kM4aSzsEoWlGbxJC/6TthcLDJU3qbI+NyC0RpR/aVG6Q6Bpn1zHrTTffgD4sawyR0IiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IC1KoUvF73OtWJ/lTWg9nZe3Dxd1TPPs/CEL0ojNFYQ=;
 b=DC9es54Qzes7h8R4dKDVAhrAQY9n+teFlKPp2P6qBc+H67tvfc95lJIF5itMPdFHMZaBmJ8UzcA0tT7PGMx++Er0RdfnFZC0VuzcGJ2qk9IWO0wsjaualyThJBkrDvusTtQupc/hpakHlT7AAwoayxSK8uzzzYDzPhsqiiWZXTiq35/I5Oe/qaxIlLoXJ2AsUvmU4FIf+nzMxTmKSTeHJmQq9HP9XKHGf/W5xjZegfACV0dWxMB9t0jUN+M0p0vS1GaSbcK83Iu/3JkBh/o+f/LKsBSj95LwAaK3nj0B7MrSPdBgjraK5sLjjjmGTSv9zdo2qYtHFoWXBww94Y2f/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KL1PR03MB8413.apcprd03.prod.outlook.com (2603:1096:820:130::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Tue, 16 Jun
 2026 06:12:24 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0139.009; Tue, 16 Jun 2026
 06:12:24 +0000
Message-ID: <5601fe65-777b-4db0-a6e5-8d2cdcde7e53@amlogic.com>
Date: Tue, 16 Jun 2026 14:12:20 +0800
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
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1j7bo0dm0z.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0180.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ca::11) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|KL1PR03MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: b3403e22-7158-44c9-e7c8-08decb6e3bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|11063799006|56012099006|6133799003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	s0J5WRAdpCQI4IeALV4jhkkTyfsO3QOpcgA3GaLM2eDeI987dsCiVB8HR+yK0pOeJ6wDvfypnjM4p9YhxN78zFTCAEeRZHZpznkesNFYXomOY2qbeJ8xpAYcgPK4oqa0zvz6vYAmS0uGKabqUJchR/DNJzkk0SrUA9qqx4z9YPt2xZZTrI5EndMBVngTFD0U8xU2ZCw19uChIisEaCqCDrEjjTQN5tisks4Ph7pnTzMdDEzlWQpqd3Iq2fq/8Wdgfebd77p6KDs1YajHCn35EJTIrDUyW1gi0/vCpz4kPaVaEuf5VSb6mzTOPFPiEdLKPvCx4NuloWsOWGhjFDgReB3li1iPGmK+B7E1SD9ycPtwc23h81IpsMLsuDCu2Up23x5pVLH+CAYM91/sEy8GnfXI/l7kbDJ0j2H68PbkU5tb2t2tMYQCgTclWYxbAg1ra1y2achNUVX23YDaqfMajJ9CC7V1JED3eUIJ7NXRySvIrJa2wvxkx2HkrifXpl4MAno5JiKsmWQmR158rcC1WcWFgXFhrxKntzhKnrNqxP6P3wppYANDGCZZZt6exDnly8XLEM+4d+mCaHQ3iWOqju80KzNe9an/hk3w6NU1w1k4nZOywRgUZEaZI8Q7RFQCoEyqc5fPhtRJSNUYljW3j7HFbz3PfkvFYqLZ39tkuynz69Emq1hOZZGvq3R6oWTH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(11063799006)(56012099006)(6133799003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzJxSVRGNUhUQmNkNlNoTkZlK2w0eFlMOFJMOVd1SVFYcTIrQzJKc0FlWVBY?=
 =?utf-8?B?czUwNFBVRUtselgxcWhSc2ZnZlV0Ukc0VEtlL2MwMWgwTUI4SVNOL1RtbnBu?=
 =?utf-8?B?ZlNsMUJCbVNxcm9pQ2w1ZmRJaHpMVmFqN3FSRFJUeU5nUVhMTnJ3L2QyYkVH?=
 =?utf-8?B?UEtjcXdwaWdJdExXTVhUMjdxM3R5cjB5K1RFQ1FXVUsyK1dIU29yUDRhSVp2?=
 =?utf-8?B?TlU2eXRQSFVNVzZmSWJYak9pcm1abEJKbFJoSEJBUUQyRWd4R0VXVkNJY3Rj?=
 =?utf-8?B?c2RZaWRSSXFSczJBNmlGQkpJcDh1UjVJcU5MUHI0VDM0dGhYeGtzOVE2OU9O?=
 =?utf-8?B?MXN2L3VKT2ZWM3NZRURzUXllSjhjemxLdUM3bmxjbk43RUFHVnhnTjMwUHRX?=
 =?utf-8?B?Q2c3MTFPakJOSnNOU0dDU0cvbkN5MlUrTERqYlBnUWFTdHlQSXlkMG5vamt1?=
 =?utf-8?B?Wm9GbE1QUHFvNEY3b0JVT3h4SHpyM3Bkc1FHTUZDMVpGS2lwamFhYlJYSW0w?=
 =?utf-8?B?cW5RQ0ZjcUlDeFg3Y3VwRkVFWnRBRXVINVNya1BoajA1T0p5VFlNZlBRZklZ?=
 =?utf-8?B?RmpiNFFnVWNWb29PTm5TcXBkcEFWZjhVVnlJYlhmTDUvR3NYcEpEcGwzb3hp?=
 =?utf-8?B?am9PY3FZL3ZjMzdUQmZCNlgrNVcydGtNN2R2bklkamlLNzdqbUNjY1ZwM0po?=
 =?utf-8?B?M1VPMVQyekJHMWtseDhBeUVaRVMyQ0lJdDQrV0NweFdTZ0hyS0VKcDE4enJZ?=
 =?utf-8?B?MGYwaUJiSU9sWXlERnFvb2pMZmFjQXpEMkpXSWVKMWFBaEk3eWtobGpwR1pr?=
 =?utf-8?B?S25jdHRZZmhDMERCV1UySzViR3Jja2wzNk1CWjdEbXZvNEtJdVRrVU9JQndH?=
 =?utf-8?B?THNOVVhWYnMzSE9wbFpQdGV5ajBaY0NGbjlFN2g5YVl6czZKSXduNEdMT0NO?=
 =?utf-8?B?RFp3cysra3hkVzFrRm9ncWFhOTF6UndteFYvSzB4bWRsNG5ncVNQblNFd2hB?=
 =?utf-8?B?SHRZdWdtVUI1Tm80WC9rSkZESVU0b1o1MnAxT3pGYzNyTFE2aFlSS09OK0tp?=
 =?utf-8?B?VGpyOEZZUGRiZDBNVzNJVWFqUzhzbzBkbzB2bDI0TDhhREZUdFNYU1Z1WlVY?=
 =?utf-8?B?T0hybGlFNi9sTWgvS1RCMDdLOVdVVHRSMHFrdmxtSGtCMXFqczZTeGF6SitZ?=
 =?utf-8?B?dHk1bFhKdUlJT0VEL0VDOTR2d1hGbVpHUDVsc20xekJ1ZGVKRmtVYjNpU0Vv?=
 =?utf-8?B?eGt1TGpKQ0I4YUhJM0RIcTZyaWJZNW4vdzRtdTE2VE9UNUErem10WDBHYjNx?=
 =?utf-8?B?b1hwbUFPaVNpRE5pZGNqKzE3V0VhM1ZNMGdmYWh5aDI2Z2VNa0NpZ2RheURp?=
 =?utf-8?B?eHRVTEhWVUFpdXhVb3FxTjMyMzRQd1gwYWMvMWlPb1E5bFNVQ0hyQkNqYlY3?=
 =?utf-8?B?eHR3c20vNm5tNzExalc2L3RaR2k3MEJDTWY3cTdXcU9EeVVmWHFnSTlTdm81?=
 =?utf-8?B?bEFmSm4wNDBxWG9pMXdRMjA5WW1xNFRqbjZNc0RGWUE0eUUwN29nelYyek5J?=
 =?utf-8?B?YjFBQlhpUFp1QWV3RU9Gd1FhY2Y0d1Q0emRHQjg4N2E0UXRUc3I0K3V2akJp?=
 =?utf-8?B?TndJOFptK0RiWVUwVlRmeWJZc2xnOGhVcisxZ0VKSFF2UldjMk1aMkdLMU9i?=
 =?utf-8?B?R1VoOUVrdmhnMVpVNnJjTlZaQ0taV2hVRWE5cmZ1NUlMdGVXaVVhcWl2TGp0?=
 =?utf-8?B?YU93cTMreTFsMXV5VUZuN1RRVEl1dU1Ub1djdDFXcmw5bmVFejhscHF3VVh3?=
 =?utf-8?B?c2VEc0syS29mbmNQMSt1MnBLQzRPOFkwZm5jNlNCNk9OOGZTMks3a1R1ZG8y?=
 =?utf-8?B?bVIzTjhKRHhSaVFqWmRpcHpQRzJjTit6NXB2TTdRWDU2QW5jR1dCVW84NFN3?=
 =?utf-8?B?aDdCdnByZVV5VTdrRW0yMkNyaDRGd3JIUDFMWUdRZ0RDK2dqZ3dFbzFHRkNy?=
 =?utf-8?B?QjV3ekZHaXE1V21jUXlmQmdrWktMU251eldUMkxCVXFMN0thMUFselRmNkJD?=
 =?utf-8?B?djVKUDVGdlY5UWdqdG9teHphMGlqSWIwaHplY0JvUk5FWGNMaHlVVUk0R2N2?=
 =?utf-8?B?aG5MTVVhd3AzU2hTVzhGUkZxOGxQNmlMZGVCdTBrTDRzRW93WWdvV1FFdjYz?=
 =?utf-8?B?QVh1U0g2b0V1WnNVcXFRTDVNdnhJYUh6ek5makFGVElKUWcwTHQ5RzZ4cm9k?=
 =?utf-8?B?QTFGVElrYThicUV5TWdOTE5rSXozK1RnQmhhQmhBdDk3TVUwMlZyYXhIS2V1?=
 =?utf-8?B?WE1ULzZKS3ZqekkySTJkaXFIeXU3clNKME1GYzNIN05kRHMxV0djZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3403e22-7158-44c9-e7c8-08decb6e3bb6
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:12:24.3300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwlWXhCVAET6VZDyjO3CFUc3I6vVslrrrHmL59r9ZVKYIF4H8WXeFjfE4oq2hlfDj8/oIrlt+fxw3IJh2edh3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8413


On 6/15/2026 8:29 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On lun. 15 juin 2026 at 19:25, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> On 6/10/2026 8:49 PM, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On mer. 10 juin 2026 at 16:14, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>>>
>>>> From: Jian Hu <jian.hu@amlogic.com>
>>>>
>>>> Add the peripherals clock controller driver for the Amlogic A9 SoC family.
>>>>
>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>> ---
>>>>    drivers/clk/meson/Kconfig          |   15 +
>>>>    drivers/clk/meson/Makefile         |    1 +
>>>>    drivers/clk/meson/a9-peripherals.c | 1925 ++++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 1941 insertions(+)
>>>>
>> [ ... ]
>>
>>>> +
>>>> +/* Channel 6 is unconnected. */
>>>> +static u32 a9_glb_parents_val_table[] = { 0, 1, 2, 3, 4, 5, 7 };
>>>> +static struct clk_regmap a9_dspa;
>>> What is this ?
>>
>> The peripheral clock definitions are ordered by register offset.
>>
>> dspa is one of the parents of the glb clock, while the dsp clock registers
>> are located after the GLB clock registers.
>>
>> Since glb references a9_dspa before its full definition appears, the
>> declaration
>>
>> static struct clk_regmap a9_dspa;
>>
>> is added as a forward declaration to satisfy the compiler.
>>
>>
>> Would it make sense to relax the register-offset ordering in this case?
>>
> I don't think we ever enforced such ordering (or any other ordering) in
> the clock driver, so yes please.
>

Understood. I'll reorder the clock definitions accordingly and remove 
the forward declaration

in the next version.

>> By defining the DSP clock before the GLB clock, we could remove the forward
>> declaration of a9_dspa.
> Unless it is absolutely necessary, please avoid forward declaration.
>
> Declare what is needed first, keep related things together and use your.
> best judgement ... IOW, make it easy for me to review ;)


Ok.

>>>> +
>>>> +static const struct clk_parent_data a9_glb_parents[] = {
>>>> +};
> [...]
>
>>>> +
>>>> +static struct clk_regmap a9_vclk_div2_en = {
>>>> +     .data = &(struct clk_regmap_gate_data){
>>>> +             .offset = VID_CLK_CTRL,
>>>> +             .bit_idx = 1,
>>>> +     },
>>>> +     .hw.init = CLK_HW_INIT_HW("vclk_div2_en", &a9_vclk.hw,
>>>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
>>>> +};
>>> Looks to me all this div_en / div repeating pattern would be easier to review
>>> with tiny macro .
>>
>> Good point.
>>
>> I tried to reduce the repeated div_en/div pattern using a helper macro.
>>
>> It keeps the relationship between gate and fixed-factor clock more compact
>> and easier to review.
>>
>> After using the helper macro, the div_en/div code can be simplified to the
>> following:
>>
>> #define A9_VCLK(_name, _reg, _bit, _div, _parent)        \
>> struct clk_regmap a9_##_name##_en = {      \
>                         ^- not strictly necessary, a touch too agressive
>
>
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
>>          },       \
>> };       \
>>        \
>> struct clk_fixed_factor a9_##_name = {       \
>>          .mult = 1,       \
>>          .div = _div,       \
>>          .hw.init = &(struct clk_init_data){          \
>>                  .name = #_name,      \
>>                  .ops = &clk_fixed_factor_ops,          \
>>                  .parent_hws = (const struct clk_hw *[]) {      \
>>                          &a9_##_name##_en.hw          \
>>                  },       \
>>                  .num_parents = 1,      \
>>                  .flags = CLK_SET_RATE_PARENT,      \
>>          },       \
>> };       \
>>
>> static A9_VCLK(vclk_div2, VID_CLK_CTRL, 1, 2, &a9_vclk.hw);
>> static A9_VCLK(vclk_div4, VID_CLK_CTRL, 2, 4, &a9_vclk.hw);
>> static A9_VCLK(vclk_div6, VID_CLK_CTRL, 3, 6, &a9_vclk.hw);
>> static A9_VCLK(vclk_div6, VID_CLK_CTRL, 4, 12, &a9_vclk.hw);
>> static A9_VCLK(vclk2_div2, VIID_CLK_CTRL, 1, 2, &a9_vclk2.hw);
>> static A9_VCLK(vclk2_div4, VIID_CLK_CTRL, 2, 4, &a9_vclk2.hw);
>> static A9_VCLK(vclk2_div6, VIID_CLK_CTRL, 3, 6, &a9_vclk2.hw);
>> static A9_VCLK(vclk2_div6, VIID_CLK_CTRL, 4, 12, &a9_vclk2.hw);
>>
>>
>> If you think splitting it further into separate helper macros would improve
>> readability.
> One clock per macro please. Hidding 2 declaration is recipe for
> disaster. For ex, here the first one is static, the 2nd is not


I'll split it into separate helper macros so that each macro expands to 
a single clock definition.

They are defined as follows: (Excluding struct clk_regmap)

#define A9_VCLK_GATE(_name, _reg, _bit,  _parent)        \
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
         },

#define A9_VCLK_DIV(_name, _reg, _div)       \

     ....

static struct clk_regmap a9_vclk_div2_en = {
         A9_VCLK_GATE(vclk_div2, VID_CLK_CTRL, 1, &a9_vclk.hw),
};


static struct clk_regmap a9_vclk_div2 = {
         A9_VCLK_DIV(vclk_div2, VID_CLK_CTRL, 2),
};

My understanding is that you would prefer helper macros to cover only 
the repeated initializer fields,
while keeping the actual clock declarations explicit.

If that's not what you had in mind, please let me know.
>> I can do that as well.
>>
--

Jian

