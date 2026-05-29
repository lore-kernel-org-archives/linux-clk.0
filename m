Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023135.outbound.protection.outlook.com [52.101.127.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98033AE199;
	Fri, 29 May 2026 07:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780038514; cv=fail; b=eGcknC6XIKyjxy0trv5DzL0BApmCr69M6R0FWLPH6CjSg8fWD8kNv+NSuRtgChikrqV5L3amFCzm0gkl4XyV1RbkPRKu7SAhWgzUVTqYossIJ0C11BI4Lwb58hv2J77JQIfHlY59s50u1sPuw4Nc5mxnMdLssPRSMpiDSnEpxYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780038514; c=relaxed/simple;
	bh=BqFkuZP8v9YmNZGABphMyOJGL1kW7L36Cqaxi6Fu52E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Va4z/YK69Es9lvx9GGCTV3d654+M2T9TUxHJKZGfCG8A6gtHJpTi4WBHGT3eaZ+l//1BZwk7Yy0bTqLTtW1cvRNs8t4+fy1iIFtF3RFKkl6t3YXR7i3vWpoM89XPecDCU9CkrSe+aHL0pi1dAcruHTEaCdhR1ZXxFRkKWpeiGSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=pPPYAZwP; arc=fail smtp.client-ip=52.101.127.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="pPPYAZwP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQCh+gBR02Fv2G44zffSueGSXDww/ptNDHusPheDb7CM49KZAKBeqmrR11zSl0ag5VIeTQLKG080Stfr6Z/I0ErDo+8Ioz93TCDjD8DiTU2Mn+Z5UErSGSGUviLEjTBZ6h7oIZ5wIIMp584zXgsROjmsNAeS1OF6nnWiCrLuCBconKRcUJ5jvaiKURfQmEmXFrLOWT+NpU2bDMjlpXG4A9vvjGtkhe1RNq4NuI3SyVDIlH459Fmz0/xk3ilLSqP9wuJcPskcyLudPuAag2RvCzdUG0KaDqWTpfv8IUrksQxT0B799hN9ixdBXLDPiGZpDCqqw0DIk1aYRzwEuXRCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFSm8Us7aSF7c0Xc/oXoM3gz2FtlbLVX1oeJyqwiUj8=;
 b=gaI1TTcxIvrnYM0/bNa4ljxSr2U9jMCGSh0G3zb4B/OOuTlRFDDHZnojMfeYSCfzhcar/oIeQ+n8Sz62Nhq5gT7M91fpDTkPfAEEZhBhTjYQdkoQS3xeWT8HjeENhfaW/N6Yjvxe8bZ62vQYEuqYY6MQybTetoMY/ab2nvROb/hlBj/q2ed6q9WEZw7zYmA/1iQOT5yghrscIKsJ+dW04PYB2mmUoD6FZ0Tn6Gh42bFDmqJpg3jHjMHHLJ6iqp2nh2OcJaNetmdhjppPaIGj8/IXs4rknvpfDWLybOOWNmy6yDFpR38VdKI5c1ABEZ6cDr8EpPbIZMt3Av8e3rqDeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFSm8Us7aSF7c0Xc/oXoM3gz2FtlbLVX1oeJyqwiUj8=;
 b=pPPYAZwPGpAcZV65F9uY7Cqm9hZATYtZsHX8gBx0fjJE6X6CMdGqWM84LY/j2pm6ZQK/wHsCYKOIRjSxOgcuAJMUrs/U7uo9TESZCf3XHfDo1tnogBYsObQNumhOvzCv02PipbdcRg24ZYmwCbOsVTSWlPCd2XCwXjt7L8spDDpDqtimW25YhZvuLcHNJ/K4quyvC+fFZU67yxN2Cf3g4x8/IA5PFsII299OOFqgGp3iLdRUpOxGcrZjmPsMogFs3sH6zvzwFhikLmQfG1r2rY38hRqL3nPRwFDJwJcpvGKpx3wro1Y9j3aYQMoVfCDbeDS8WeVGb+m51wXJfu1JJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TY0PR03MB6984.apcprd03.prod.outlook.com (2603:1096:400:274::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 07:08:26 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0092.002; Fri, 29 May 2026
 07:08:26 +0000
Message-ID: <c9c4945f-cdfc-4382-b8ca-71b69d91deb4@amlogic.com>
Date: Fri, 29 May 2026 15:08:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
 <1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
 <8d89b669-e72e-4663-9596-999a12922d32@amlogic.com>
 <1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
 <3fda1592-f7d0-4e86-8615-602804673414@amlogic.com>
 <1ja4tm5pb3.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1ja4tm5pb3.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0029.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::16) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TY0PR03MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 563c27a3-066a-4cb3-d701-08debd511433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|18002099003|5023799004|3023799007|6133799003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ck773FP7eF7nR/IlP7gRvRyCP2j2KfMtxFFzlGCqOZ3tmgCOikuSdWX39j8lQlCm69VMTiQeBZFrx46fnm8ysDqy8noVvnw6VCaWPwmHYovfhx1/BzRDH7j/YoDLNcC03Accct+YoiqHMDcm/Rhjp6Q77fEUJUskiMR8csKds1kEQADpFXNjZYdprCpFZXO1wgu569VLwTDq1annz1DAsCgH8JlRnh1jyEu4ek+p+yWyf/n1XcvQtK3cscidoXG04udRzZvTum5qzVq05eZA1IiQS/DtgJlk4SYUNsNszpooYV92LKsA+hJrdmtmpJschqJr/0VOC3PpDnSy2aQLnKzLBHqVWzJfy2cdZZLM8kyM2atdq1j4DoMwY6c3QdbLwUktaW3iLSCYb9PLcsmfoZSrmGURiwwjnKqHiiCflAc4GhB2UHzdIrFfOvVJ59//QhDJFR6MBUhWlnPpIH4hAckbEMDD2mMXxdgznKq7LsaQCv+2dr25Z5YM6XudPJvosVTLix0t888iXGin6XcAGmxwNy6DpqbAqPDtuKvrrDcXm+Cd7AGdusZqS6+P6s66BtduMyzaD8m1QsNAw4ISdMFXZ85gIPnCb9Wyw75plYMjfp0EBbyds+M46RfUPTZvhOkv0Bhas1YTrAjiMDggsD08I3bguksdaPYpb+xPBwpmFdGzDGVyZ7QiVLUks2ft
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(18002099003)(5023799004)(3023799007)(6133799003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTZ6UXk2c2VKRU5ZVnRqSElXcG83TEhpbGNtTktmU0MvbVBOdGgrRnY5RHJG?=
 =?utf-8?B?T09NL3hXMFhTOXZCOXFmWDM2Yms1bnhESUdtYVJhM2FDRDE0QnRRZHJ3THNN?=
 =?utf-8?B?UkNJZGNudmVqc1RabTZZUkU4MHdjTXRPdmtqV25EV1k2S1FjVEoydnNJREhp?=
 =?utf-8?B?eHBTUllKTFJib3F3V1hibXV2WUtwTnE3V2oxNHhwVFBYd3NTb2taL2RZR0Yv?=
 =?utf-8?B?SEk1SFZDc0pLcE1QTThSaVBqMG1kVVlPUW8yQ3JBTmRtcDdHQlpDeUF6dlVP?=
 =?utf-8?B?dXFacDJhbk1uVHVGcGJmNE4rUEtWcmRoOXNHUDdPR1c1eTF2T25wYU5UMUho?=
 =?utf-8?B?ei9ORzdjR3RMc3M5YXVnbDhoQmUwNDB4Y3lRVTU3a3hNWTdxSVB0RHlsZjRG?=
 =?utf-8?B?dHFRaS9IM1o0UE81ZkxxOE1GQUt1Zk9MOVpyOVh5K1UwWW0ybHZzUngxN000?=
 =?utf-8?B?VVNGWG5DU2lDbkNlUHZMelUvMWFjM2FmT2JEWnNhRTg1ZDBpSzZ1c0FsWjZT?=
 =?utf-8?B?OHgyNGFoN2hqNkQ2ajNFbU9DU1IzK0xaWFZ2eEo0R1lCay9DUE42YWs5ZElW?=
 =?utf-8?B?MzdFeEd0cWx3aTB0ZlVzOFNOR01xMks0dmF6N2tvRHRIS2ZXcDRscitDTDFZ?=
 =?utf-8?B?WTlRMmVNcHRCNWNkZUh4SHQ4dDNYSjQrUXY5SENCajMvUHo2RGdMdU9kWjJ2?=
 =?utf-8?B?TTFLSUpZT0h3VmtlaW8vbzFzdHJMTk54M2RxcWo2dzRVRklsT0xZVzV5YTRs?=
 =?utf-8?B?cm9UQlJUUmUvYTBkRjFsdktvMnRyemRId2plTXJlcjZ0OFc3THVwc3lBVlV2?=
 =?utf-8?B?UmZRaDRpcjZsMzFTc3VnSFJPUXM2d3FHaE5GWXNPdkp0b25BYzVKWXhLUDRi?=
 =?utf-8?B?T0IzbW1nSXpJVWRsQ0t4MUM5aFlSWEticlgzUFpTbk9MbHlzcmVYNjNQRkMy?=
 =?utf-8?B?TjlVZzBGeWhZaHUyVmoyMTE3M3BHNWpoa1FkZmdEaDd0MGxBUnRTTW4rTHZx?=
 =?utf-8?B?MzVOM2drK2tEOXltMHJBRGVycWhKSHJTelBFRkw1NEFTTEFxRVhxUmJhTDhL?=
 =?utf-8?B?T2hLYW1CZ2pucExtSGQ1V0c2cEtVeTNDR3lldUNQQXMrcG5paE4wVFo1eE92?=
 =?utf-8?B?U1RSZ0hlS0VSK3lybXRIZzVlM1Qvb01lOHFTcmNRdHZSNEVQeU5GbTlLd1F1?=
 =?utf-8?B?V25kaVhUMUhtQjY2UGFVVWF6amc0dytYSitHRm1qd3A0eXhkdkgwaHZLK2JR?=
 =?utf-8?B?UitWdzJXT2Q3aS9mcG91N3A0VStJUE1ZRy9OT0FkSkpzNEZIMDNrMU04b09N?=
 =?utf-8?B?Nm01ei9hRGxSeDRUWUt2cTZFMk1Ub2ZNZVkxeGx6L2luUHp1Mm9ncFEveWlG?=
 =?utf-8?B?djdEcFBkVk55R05QRFlrWmZTUmlGMW90OVRnVkRIcG5kdGU3WnUwdldpdy95?=
 =?utf-8?B?SHNiRGtZWTl5K2JYTDRyNWg5MjhSME1aY1NQOFI0bDVmVlZBeFRRc3FENWRR?=
 =?utf-8?B?ODNQck05MThxVVFYeStVZ2s5Y09WOHR6VExaM2VudnVjUmN3ajRZL0VRZWlH?=
 =?utf-8?B?RlZKb0M2YXp0eTdXVWIxbW0xSFNmVkpmYkRFM0QzNEZGSFk5OHk1TUhyRG1k?=
 =?utf-8?B?V3d5ckZnT0VDcHNCVHhGSGlPcitqMjA3ckt2T05xWVdPSWNFaFJOdXU1NFFY?=
 =?utf-8?B?UGFPVmY4enJhVWtlcWdLNCtPUkd4Q25hbG5qVVdMR2hxRzExMGMwT1dBL1lU?=
 =?utf-8?B?NTFsYkgxaWJZbytDQ3JsaXdsdHB5Nkdlb3NIbzlaUnJCYVExdmVmUndtcm1X?=
 =?utf-8?B?S1hNYnYyVDRJMFVGUjRWVjRwSnM2SXFvN3l1ZGJTMVdwL01XbUZobk5XM1Zl?=
 =?utf-8?B?MEt2b3FnWlZBN3NNMDROUUhQWTdmSm5EZDZIbEYzQWZpMHFOV3VWdGo3R1ox?=
 =?utf-8?B?Q3E2SXhhR0VsaklLMkNWbTA4MmJSekFBTEZrUmN6VmJTdTBwOFZ3aG00WWd3?=
 =?utf-8?B?NTFCK0xiUHZ1cGdKa3BSYVRVM2FTU1EwNlRNd29zOXFlRmtmdENUclQrSmJY?=
 =?utf-8?B?azlRUnNEL2N3VGhqaXFhV0hiNGJhcXNyVjhhbDgxa0IxZDVtUjFwMW01K2Nl?=
 =?utf-8?B?QkFzUzlHR29HTjVrNWRNbHdlaEhCY09PaUs3MkdCenAxMm43VW44R3NvenlX?=
 =?utf-8?B?eTEvd3dvMXJ0RlQ3SlBycEtCTnZuZVlHdEg4S0hzVzc4Y0VUTk1aNkFxTnd5?=
 =?utf-8?B?YzNVRnFXMGFDT09EdDRCK3lmN21SY3lZT29WVmNLZ1gvaDQ5c2IwazFtK1lr?=
 =?utf-8?B?WGhSc3J1b1JxUFMveDhjb1N4REtRTmIvL2xTeHhtYTB5YUV5WWhLZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 563c27a3-066a-4cb3-d701-08debd511433
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 07:08:26.4701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvQBjGitRpFkIZMOEEKzHvlWAgOTEbRUy++2rEbCkBErrsZUza/+M3HnSTKzO0rOlkWKebtAXBzo6Yj7foosdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6984

On 5/26/2026 8:27 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On mar. 26 mai 2026 at 17:58, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> On 5/20/2026 3:35 PM, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On mer. 20 mai 2026 at 13:47, Jian Hu <jian.hu@amlogic.com> wrote:
>>>
>>>> On 5/14/2026 11:11 PM, Jerome Brunet wrote:
>>>>> [ EXTERNAL EMAIL ]
>>>>>
>>>>> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>>>>>
>>>>>> From: Jian Hu <jian.hu@amlogic.com>
>>>>>>
>>>>>> The A9 PLL pre-divider uses a division factor of 2^n to ensure a clock
>>>>>> duty cycle of 50% after predivision.
>>>>>>
>>>>>> Add flag 'CLK_MESON_PLL_N_POWER_OF_TWO' to indicate that the PLL
>>>>>> pre-divider division factor is 2^n.
>>>>> I understand what you are doing here but I have to ask why this can't be
>>>>> implemented with independent dividers that already supports power of 2 ?
>>>> If we use independent dividers, the n member would have to be removed from
>>>> meson_clk_pll_data.
>>>>
>>>> However, n is referenced 35 times in clk-pll.c, which means we would need
>>>> to modify all
>>>> related logic across the file. This would be a relatively large
>>>> change.
>>> Yes
>>>
>>>> Moreover, for all Amlogic chips, the n divider is an indispensable part of
>>>> the DCO clock.
>>> There is hardly a justification here
>>>
>>>> The difference between SoC generations is as follows:
>>>>       Previous SoCs PLL: n = 1, 2, 3, 4... (linear divider)
>>>>       A9 SoC PLL:            n = 2^0, 2^1, 2^2, 2^3, 2^4... (power-of-two
>>>> divider)
>>> Yes that was fairly obvious
>>>
>>>> Therefore, splitting out the n divider from the DCO clock might not be a
>>>> good design choice.
>>> I'm not sure I agree and you've only stated your point of view without
>>> providing any technical justification here.
>>>
>>>   From the datasheets of the different SoC we have, the documented
>>> limitation is always the DCO output rate range. Nothing related to n (or
>>> m, or the mult-range for that matter). This is a legacy problem, we
>>> started with monolithic driver and slowly simplified it.
>>>
>>> As far as I can see now, reworking the PLL driver to be a simple
>>> multiplier driver with range output rate constraint could actually be
>>> simpler than the current code. I would also make simpler to accomodate
>>> differences such as the one presented here.
>>>
>>> Unless you can provide technical reasons why going in this direction
>>> would be incorrect, that's where I'd prefer to go.
>>>
>>>> [...]
>>>>
>>>> Best regards,
>>>>
>>>> Jian
>>> --
>>> Jerome
>>
>> I agree that having an independent N divider would simplify the PLL rate
>> calculation.
>>
>> A separate pre-divider for N is technically possible, but there are some
>> hardware constraints that need to be considered:
>>
>> N = 1 is the preferred operating mode except a few fixed-frequency PLLs.
>> Larger N values reduce the PLL phase detector frequency, which may
>> negatively impact
>> jitter performance and overall PLL stability.
> Understood. You could really make a difference by going deeper and
> explaining what those constraints are, especially since you ask question
> internally at Amlogic.
>
> At the moment what is documented is a range regarding the output rate of
> the PLLs. A PLL is made of a pre-divider and fractional multiplier.
> and you are saying that for the multiplier to work and lock, there is
> actually a constraint the input rate too.
>
> If you can discuss with your HW team and clarify what the constraints
> really are, that would help to better model the PLL. In then more likely
> for us to figure out the best way to drive it.


I have discussed with the HW PLL team. And here is the discussion results:

When N increases by a factor of X, the PLL bandwidth decreases by a 
factor of X,
deviating from the default optimal bandwidth, which leads to a decrease in
clock performance and affects the stability of clock-dependent modules 
in the chip.

>
>> Because of this, we cannot guarantee stable system operation when arbitrary
>> larger
>> N values are used.
>>
>> Some PLLs require non-1 N values to generate specific fixed output
>> frequencies because
>> the target rate cannot be achieved with N = 1 while keeping the PLL while
>> keeping the
>> PLL within its valid operating range. So N is designed to have other values
>> ​​to
>> satisfy this requirement.
> Again it seems like the constraints we are using are not the real
> limitation, just by-products, which the situation unclear.


When N=3, this type of PLL is designed with the optimal bandwidth based 
on N=3.

>> For example, the AXG PCIe PLL uses N = 3 to generate the required 100 MHz
>> output frequency,
>> since the target frequency cannot be achieved with N = 1.
>>
> PCIe is a topic in itself. It uses different ops for historic reasons though
> I suspect, with proper constraints, it would not really need to.


PCIe has a strict protocol that must be followed. It is also a highly 
sensitive block
with hundreds of complex and stringent lab test requirements.

The PCIe PLL lock sequence needs to fully follow the Amlogic HW team's 
released demo code.
>> Additionally, is the refactored pre-divider N implemented as a separate
>> patchset,
>> independent from the A9 PLL changes?
> I could be seen as a pre-requisite.


Understood.

>>
>> Best regards,
>>
>>
>> Jian
> --
> Jerome


Best regards,


Jian

