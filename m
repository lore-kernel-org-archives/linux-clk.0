Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023127.outbound.protection.outlook.com [52.101.127.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C8538239E;
	Wed,  4 Mar 2026 09:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615674; cv=fail; b=TE4cP2oG7TPNLwSQp3ZFhsEYpxQAVbYTFkcXsIvmgJVnLjcDDcIfQxzQimw1/9SEskYBL7U9Os3uwMBgNT2LyzY3O9HC86rv6I33X2ZUHcS2u9gJW+yhkDzsTXW8xotK44j9Co7KcCpXIpA3hbnlj+A2DHjMQ5v/MVTlIyjyCk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615674; c=relaxed/simple;
	bh=K7nz0y3X4Jy6JiD7xtl3Zie1uQ2AfxmOBnuCYGBf1sM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dHlCzTIRXbYHs/jfIQvxYhaYsOp9lzhMVBrUMynCmJ9bdwDqw23LqD3wQ8xuaTlBffO4L9Vwopudh5w80rSSWUb1ahQ4kRLvAKI+QPq+HHKNQPT+4K9pn2jPKloLz1C5i6/i/4zAoIjgjQY+5HkOUTe3GdaEnxXPKwaajcthXDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=RPlBcROB; arc=fail smtp.client-ip=52.101.127.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="RPlBcROB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I56lGeLBBVvbDeXfhybf4BsrzYgQq3YHUcHUqf/x+iy6XpK611agcleekaVYb7hfshUQenI9rGdxFIwM66ERR4pgjiLnYGH58sqDRRgTxuhAPoXSdTzh1SJgL2+PCRXO+7SkdIyFg9kiAU0DRqHyL0AdiMJqkv83rnzTMrz73eGp+SyDQSmWIHg13MMcFSSVELUipCqHXLCNPkyVCYDIZKWxi5qJYDF+uJwHHAkaat9g3/91jNXwV/7yVayISTxSp2CxWYU9+qnfIEaOPtKkByKBNsrbKREieV646HcSjLV3V0Egn6zoB/G50dLubh5wqOrOC3I962Zpd4GufVx1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO41IAPOPgq9lTBxGf1ydShl/mwQosMNs0ooydr7wNM=;
 b=f8oRSij4mvsn12WkyRGnwdmjkXla2+A89fPfL7306RKRqdW2ljEmHQmRlU2CNOX+mcswXEFRoAWDmuLGbPmos2ewIDXYQL/hQMHDd3phFoN5iKVRzOa6TmYnCY/O1IQpOquujKRoRG8f9qCTVBhKyHg1C9YUeG9H9PCP5yRMgHN3fjSLcS+nkqM696PGbnPsryy9qyicTBPD1aTtgRx0li6fD4PTmf7BFim4mKnv+0dL/LBLQP929uhb/pEEBhYce1DShVD3rfZtUzgot0Cu1onB8xt+En9AOXjWtc8ABlGdKMEZc2udX0dc279dUXpfmPKovLd5Wq5WGa6ZKY18FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO41IAPOPgq9lTBxGf1ydShl/mwQosMNs0ooydr7wNM=;
 b=RPlBcROBJZmUqFauzmVQyc5KwTYvy5Khqw2jecyysBZEWw5XQuXULnAVoa8OtAqv6JZ/Bnx/Wjntas4qlS9pb7x5dkZ5kbJum/F/sYoQb43b5EVDmW+DvR8YpGVxDlJ88+3VmBxkJbA+iePlNZYLafAUlmQ4yBhJ/FEoOMHztYP9CJpZJRWn/vmHzGOVLn4eMmjWXc/+JgHNakuEMES9AHn1ClZ2fFnTGjQGTcu6JnHuX9Zsy3Njjltyl5gXd2lCZdJ68WGpU/p7nsNBxyDgr6cFtkRif+xV9aTs6jGBiN2bdHssv2rSwfdRQeGzlE/7vmRiTphLHK31/SzRCQ1ZiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEYPR03MB9536.apcprd03.prod.outlook.com (2603:1096:101:2f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 09:14:30 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 09:14:30 +0000
Message-ID: <900911d8-c2de-4e37-babb-6371b753456a@amlogic.com>
Date: Wed, 4 Mar 2026 17:14:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drivers: clk: meson: Add Amlogic T7 fix pll support
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
 <1j4ine6i6a.fsf@starbuckisacylon.baylibre.com>
 <941c5dac-afcc-4d93-926e-9acb3cf1a930@aliel.fr>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <941c5dac-afcc-4d93-926e-9acb3cf1a930@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEYPR03MB9536:EE_
X-MS-Office365-Filtering-Correlation-Id: b58a6dbf-aef0-400a-802c-08de79ce7107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	N3xs0D7NlGCqTOIn3ueTfGUirtztYPW61iMFYscSMS7pahpzkYbYV1+YGNJkojrZB5hN5VRZFdF2tYcxgckSf0Eec0355KefHpRWxkLZdGsUs1JiF0+1/HEPJM5UNPlMqjOG9l/a61emWUiqr22aL0O7wtwPerjjzYQEMdzZosme2DJeGnN1+VwMZ7ll9q3yu2qZsoys7qjp6ugWs7BQJQtS5x8wRo6degztcGWS1BWvnHBLhIBMK+d8amWOw9pyfgZAyi3SrwJ++9SaQuahgtJzmpyK1Fy4eEyfhIA4iz4dUgtzW7yOhAX0pyYb+gnGW0RB1Lf4TtFBEQoSIoKcT5PxjsZwc+ox3O6n+W29d9dwCSaOQYS38dToFWpiGE5I/Ha3lY9/uUM11wiConedajUdbQRLikgkzfKOmkf1fZbUJMaEb3WtDbZDXRmyA8gRA3dAw63eY4TzZ6/SACpYqA4DYF3FmWo1MD3OUnzQcEh+twO92P9pz/gXKx41gktuNLVaI1V5QCyRX9vu10coKrFwwu5qVF0wIj5a7OU8yoIet8X+L3mej24fMPnoD8abhJnSQjKdSxWaVRYQvX28mU/dijSqPUMUk5xKOxAj3WphdJZnN2HM71+d0P78zSNCpSElaWVfGr3Z6X6zVf8cfVCL/93f7rczwz3ixwR4JqoqF3P7VT43M5sh5laawEw77Ou0EyJfh5qmIthMGz9BZKHC2X28HRsn4jIxtfmQFp8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZitHaVNPVHdydEVvWFAzay9nR29oZ0wxQVNoZTQ0a0dTQk9ueHVZQzFGTzBk?=
 =?utf-8?B?b3A2clRTQ2ZqNlFnZDduNHkvdk9hemtSMWlmMlFOd3I1Mzk4QzgrVzM0bmti?=
 =?utf-8?B?UEQ4alk3cHBuTitOaFY4bXNLWVZSQ1ZqRDJpdU5venRKRkJKQlVHa2Qrcy9E?=
 =?utf-8?B?RkdzSXgrZkY3UFdVSlZtd0NCZHNuN21vS1JzMjJkREdEVm80L1VOR1FDVVRa?=
 =?utf-8?B?Mzk0TU9GRm0yM1Jpek5PbEI3YVB1WFM2SHhNZGIxQ1h5OERPL0M4R09FYTNn?=
 =?utf-8?B?MzhXSTIxaldxdFc1UTEwcllVV0pHT2s4NU5TK3Jnbk5abE9EYVVLZ0pUMFJX?=
 =?utf-8?B?RWhkcUNvYUVPd2ZEUFMwREpJNzFud3Y2TWJicXFXcFR4cHc1WWh3RWtqWStj?=
 =?utf-8?B?WndRRXRlaktzSTZCNzRHK0xka0VxcEYzNEZFTkQzbzBCL0oyd1VSRjEybDZs?=
 =?utf-8?B?WjFVQitWSnNERnIrdE1jU1pCcm02em1pbnkwdGJNVkFENjVjU0Q4SDU4Zmlr?=
 =?utf-8?B?ZFcxcWc5NXUxOUFFejZlcTBqN1cwV1NTTFM2WXg5UmxPS2ZGUitwUTFFaTBr?=
 =?utf-8?B?UndGeVVxc0VFZEJqL3Y4TS94eUJkRVgzNG9IVGVqV2JQcUJvanF4SjJGcFlF?=
 =?utf-8?B?a0E2K2tKcGpLY0xhdkYzQzRuQm8wWlVIYVJZVVFiV1RKT2NGTzJ1ZUJkRFlM?=
 =?utf-8?B?Zm8zWHdjVjBzR0czeWZwdFZMZ0FoQnB4eG11aDhnY2dnUTYvUmxQaVBKMkVZ?=
 =?utf-8?B?MkdiUUZURmZ1cnNVL0xMUDZZQW9SbGxLVmVNQlAxYzQ2RDRuUE9odUl2anYv?=
 =?utf-8?B?NXlqcVVialp3c2ZYdkxXaC9rdTVRL0UzUHdKVTMxZUJaSkdXeHlzZitzK2h5?=
 =?utf-8?B?WGtOUXowTURHL3ZBaEtxdlM3a2VBRnQ3ZUUreVczQSt6RDhjdkdtYzRaenN6?=
 =?utf-8?B?SDNHYy9ERzQ3VllXejhxN1VFSmhpRTJCQUp6SktjUWtZUHpYYzBucUdJeTRG?=
 =?utf-8?B?NFQyc3ZDaWoxRnhmbk1CTkFiN2toNlZqR3pUNTZ1NGdTR2dVaFBJcC9jWnhR?=
 =?utf-8?B?UU5YTTA4MHRxam9YU3QwNGNrOEZ5ZEI3bmY2M0ZQSS8zaWFJOGhnUWJCVWlm?=
 =?utf-8?B?N3N0aGs5UU51Y2tvL2xOUGhMSzZWZ2RvNU03Y2RKbVErSFhqZnZDK1hmSFpi?=
 =?utf-8?B?SXBDMmhNU295S3VqMXZqRFc1TVplcnMxeXhsd0kvK1dkVUZQckNoRVdVVkI3?=
 =?utf-8?B?Rkk0bDBpOUZHS1V2cHl4V1E5S2s1MXhNRzRKTFFuMGs5aWE2T2R3ZHV0Vjh5?=
 =?utf-8?B?TyszWGhMVlNPMFI3anVnVUdxTWNqWmM5OVVHSndoT0x6cXVhQlNDejc3TGlN?=
 =?utf-8?B?a0hZclZkbUR1RmZrTGl6L1ZPUkc4WWhrcS9GN00vanFwaEtRbTFQaTMzNVRn?=
 =?utf-8?B?OG5vcElvTi9iSDNhMVp3WUVjZkg3ODFNd0MyS3AxRzI3bDY3ZzAvM2ZNeUdE?=
 =?utf-8?B?ZlZjckdQaXpnemVDT1dhU00yYU1WSUNFZW05NnV5WmZTUm5uM3p0RmgrT3F2?=
 =?utf-8?B?NU95OVpTNU1rQXo1YjVUQmxBM2Nxd2hTS2xzS1hPRWVQSThNKzRHck5JOG1n?=
 =?utf-8?B?N0pjdXRvb09zV0xOYUFqVmgyS3hydzhIZ3BnWGl1N2YvS3FRRURqbllOSFNr?=
 =?utf-8?B?ZUJTRlFJVS9BalI1NDhiS0ZtNkJKdGtuS1Q4VkRsbXBzb3hzZThhNDBGSzJh?=
 =?utf-8?B?Q2MwdENiRjh3NTdEME1CNUd5VGdIcER1cEpNaUlQUThpN2QxK25XdG9GNW9S?=
 =?utf-8?B?NnN2d2JwWW5NTlNnTll3TjBIQUJrTHd1R2FzRjl0cmRKSWVLWm40K0k5dXVE?=
 =?utf-8?B?YXh3SC93S1A3RVZGSTJNYjlHV2V2T0F1elBscnB2MXRCbWVUWXBHTHVQWDBI?=
 =?utf-8?B?Z1hjUHZ0N2hXTmhKdWhlSGlYN01PYnYzUG1sYzlhd3Y0d0d2YkhTbDh0ZzU4?=
 =?utf-8?B?OHZpRmhxcjZITXpyT0VqRzN4UG8vK2FDenE1WmRTSklTZDJjSmFEakxhSDdi?=
 =?utf-8?B?VUIyN2N2akFpTWFNUmp1VHFnVVdRV0FZTWNHWGJRZEQrZVlTTFVBOXNoZjdj?=
 =?utf-8?B?MCtWUGdSTC96azRzdDBUS0R3STZVTmxyWFVWaHQ4R0FTdHVuRHltMkdYd29i?=
 =?utf-8?B?MHJBWkZDVVN5a2NzcUl3NzNCcTZESVpac0NraDU0ZVVRcWo5U213anpXL2tT?=
 =?utf-8?B?YmlWNmVubmlMcGMrdlZlZEJyWmJ2WWJWcGJSMGFtZ1VrT1d3U1BaTXZFUUZl?=
 =?utf-8?B?eVFKUUNWQXlycVpna1RWTC8vYThYaXJMYTM1YWRhNE1ITGU4eHREQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b58a6dbf-aef0-400a-802c-08de79ce7107
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 09:14:30.1047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVLQ/dPpxyXsZlXU9wFY9kt4zRQaJVCJcOicKP2z+pu5YMVkb89VBjdExJaYwp5l+RLILnx5WRvCaHnuw8fdyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB9536


On 2/26/2026 10:30 PM, Ronald Claveau wrote:
> [ EXTERNAL EMAIL ]
>
> On 2/18/26 7:05 PM, Jerome Brunet wrote:
>> On mer. 18 févr. 2026 at 11:17, Ronald Claveau <linux-kernel-dev@aliel.fr> wrote:
>>
>>> Add PLL for the clock controller of the Amlogic T7 SoC family.
>>>
>> As Krzysztof pointed out, a series like this needs a cover letter to explain
>> what you are trying to acheive overall, and proper threading.
>>
>> The description above is too vague.
>>
> Indeed, I will do that for the next one.
>
>>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>> ---
>>>   drivers/clk/meson/t7-pll.c | 257 +++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 257 insertions(+)
>>>
>>> diff --git a/drivers/clk/meson/t7-pll.c b/drivers/clk/meson/t7-pll.c
>>> index 0a622f45fa36..3dd3aca50b7c 100644
>>> --- a/drivers/clk/meson/t7-pll.c
>>> +++ b/drivers/clk/meson/t7-pll.c
>>> @@ -71,6 +71,15 @@
>>>   #define MCLK_PLL_CNTL4              0x10
>>>   #define MCLK_PLL_STS                0x14
>>>
>>> +#define FPLL_CTRL0          0x00
>>> +#define FPLL_CTRL1          0x04
>>> +#define FPLL_CTRL2          0x08
>>> +#define FPLL_CTRL3          0x0c
>>> +#define FPLL_CTRL4          0x10
>>> +#define FPLL_CTRL5          0x14
>>> +#define FPLL_CTRL6          0x18
>>> +#define FPLL_STS            0x1c
>> The PLL you are adding is described in the datasheet as the MPLL. FPLL
>> is nowhere to be found. Prefer using names that relate to the
>> documentation.
>>
>> If you must make a name up, you need to have a very good reason and to
>> explain it.
>>
>> Still from the public documentation, this PLL belong in the same device as
>> MPLL0, MPLL1, etc ... BUT, I remember correctly the T7 initial
>> submission, the fixed PLL and fdivs are supposed to be provided through
>> SCMI clocks. Have you checked that ?
>>
> Yes, I read the initial submission, and I tried first with scmi-smc and
> scmi-mailbox, but with no success.
> I will try it again and ask khadas team for more information related to
> this.


The fixed pll and sys clocks registers cannot be accessed in kernel, so 
these clocks are

implemented in the Bootloader BL31.


Please ask the Khadas team to contact Amlogic for the latest Bootloader 
version, then you can use

the fixed pll and fdivs SCMI clocks defined in 
include/dt-bindings/clock/amlogic,t7,scmi.h.

Reference:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/dt-bindings/clock/amlogic,t7-scmi.h


>>> +
>>>   static const struct pll_mult_range t7_media_pll_mult_range = {
>>>       .min = 125,
>>>       .max = 250,
>>> @@ -1047,6 +1056,253 @@ static const struct meson_clkc_data t7_mclk_data = {
>>>       },
>>>   };
>>>
[...]
>
> --
> Best regards,
> Ronald
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
