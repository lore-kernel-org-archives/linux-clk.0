Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023119.outbound.protection.outlook.com [40.107.44.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4FF3D3332;
	Tue, 26 May 2026 10:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789909; cv=fail; b=IL/s4SgA9+ebRdDP2dFpdulvzLoPdtsWhCmYvniZHBhJmAov120hzZJwr154aRTa4mVAtvkabw2ns/tfGPqD7u2VKWlhBHlDLwsLAvOiEiK0tZ5hzVMhdMidbqPosZ+GAlLZgtpxQdHPsZAU2LLDNpR/EEs6/rwSiMNdTlUTHqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789909; c=relaxed/simple;
	bh=gIMCloW4Iv7eJU31+gV98mhwv+QKn7LZEYg/VKuzVEM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y2fRRf2X2Wxjy4WpO/sHEcnfYWiorIqsJLsToqkFUf9u+oKEyJDtMsJFlaO6b+GwM4k7/dRADCgLW4QGkP5cJN9/uNKqn4V4yU/opvmYQ+1HQu9pmUvJyuHsR/SiHNh51NU6p7M8y50x5qeWpH4Fq6sGKht/tST2v4F2Bxdvjw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Mmt65k0S; arc=fail smtp.client-ip=40.107.44.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Mmt65k0S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGPj9DHHKzMD00YbZ+2b6/j7nsIXlGKJO11SbOAHK9PJ1vq0dZsiNYYBTysRoYpvjpHosFux9NH0H9114hI59DThr2Qz+YFh9J+1hxlsEcTnMfNdXeRF/FJNoG/huHs67KryMm9EVz7m8Kx6tbH/EurEPAB2rJTpYYFcjtt4NCZpGMvTk2BGsLz+WQm1GcRwoxb4/vBFklLwiFezxKjfcFikW18aXiulR6iq45P8PHSoXGWM/gUWvAjc62Fi0jdZlQNuHeO4wM0MwrRB+Ib1aITomvvZ61mY4ESxVINFBGQbAzu/HlsDHBuQZ2Z47EtCqlLac+ZsqVXWEEaktwynwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dx/aHakB5b67ZP7m5mxnQWU93moPDO1qqwjeqSIbUsk=;
 b=AKYmFdeKX5Ds3tN73fsupiNd1BryEMleNdJzzbq2Whe95AFgPHSAbl0Ffflq4lt+QwYZ4PQf/4S2UpQd0iSQUhAtVPCPsysj41PXp8ZByiY9JtFNNYDU1fcSipOcrJoipH0u6JSvZQ5MbZ+p5kJWo4JmpWRJ2ReARi4IppbdK5bnjk76z3agh4xQiXgB0UZyZFgkwkrstQW6Rmo8i8xi0A0jnxwMX4mKInFDquGALFClVI9mGDO9tKIIaCTvx5XgnDh65s9u7ihJ0Hv5Hdk7Kh5Pg++Ov9AfBjAyh6ETm4er+FUj61Otb0IUFy1Pj8C8H6tHiezwWN5SAvuYMqqgDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dx/aHakB5b67ZP7m5mxnQWU93moPDO1qqwjeqSIbUsk=;
 b=Mmt65k0Sz4820ht85axiYq9NHQeOZgxGKJtrtRiy/oEIEmAFzgKGTUyz1O9xJfhRDtZ5jm9ZGy4doMZYYTTdrijntp2ApO5FJoMWrZJCrP3VG8ISqcw8zvNr1NHrYBx0b0CBauA/hExJCaU3UU0JUUG+NBP9r00iCDoEfO4LnXJn4f/Ri/Z60mGFRNltPsUOT0M1DysP56pk0dBmVW1NXBAKkdBVycB1c+kO4AP0dspPcLddAJZJdnwM74TLRjkGwXfNWPNz4es4jnPwcQnjXdlboeH6OodJa6RoyUuWEUt0etmYpcrnJYe/KyUoFXn9u9t+Q3m7iqd3hCoSazxVgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KL1PR03MB8305.apcprd03.prod.outlook.com (2603:1096:820:115::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.7; Tue, 26 May 2026
 10:05:03 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0071.005; Tue, 26 May 2026
 10:05:03 +0000
Message-ID: <13da0733-32cf-4923-a923-21e517d1594a@amlogic.com>
Date: Tue, 26 May 2026 18:05:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Add support for A9 family clock controller
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
 <1jldd662x1.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jldd662x1.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0131.apcprd02.prod.outlook.com
 (2603:1096:4:188::6) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|KL1PR03MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c58434d-9a35-481b-39ff-08debb0e4177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|22082099003|56012099003|18002099003|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	AApCtd6baxP5EGPCeI2wgy5pVHQslXvU2ESYImQ/hWCXXUyfN8E6g6Li9go+QZryxWerNYEyh3xNrZAnCV5cXNn5GJdXEVg3bJUtPoWKGdZfmYPsU+188bdWF75cNzdbbTRy9oRqDdQZalD4mg33r9t4prbR2vl/Jcfe2qdAMGyfXdKf5pE/n0NuIHpa0oETHWuvNwnbpV6ebj+ipobQ+U22llieWXnsiOjOOYZKkM9he5GdKHPce9zYRTzU0gTkaitV0D8pLdgNApU+fYGTxgVE0gi3snj6jBt7IhZEUcZgr6UpareB3ip2DimZiCMBedyo0uOLbzQknkupwaeYQpKP8LFFt/OEHgOxf/iv0q0Q0A5t7sqBuwCKAR6EX0Lh40OEdLzuFVwCUuFTVS74lChVB6d49HAqR8SxS+00LHR672+vXSiRoInOSfL/szx9zTadPfLmf99uLgt22410dG3+joT5VI3n1QDvSrsPVtXjvJquEFJYV34gjpx8VCpstsCOtqUA5xR2skELa+W9JGP0VsGPV9kPaUH7ZqXVa6s2mKBnxhTjqBOJ+zouUHrTuo0iWDkGOy1ASwEl95jJ+GiaxG6DSIUIKXPrx1wa4y2prYhNLFCTfzi1gMEeknvjSi03ScDA7JEpcwdmaADs5rhGPmJ1O8Jzhkq2HhySEIKUOOSrUcNb6gPzVzhQA/Iv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(22082099003)(56012099003)(18002099003)(6133799003)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGRKWXBPY2M4dHRSVGRwWUpSbFppK2FvL040NU5UOXBCb3Jrek1XV0pUdXpZ?=
 =?utf-8?B?TUdYeUQzNGs1WGtVKzFiZWZUUWdUZUtzVmdnTHMrcGsxUDJkdjZ2NU9HYnp6?=
 =?utf-8?B?V3JFOW91U0xLK1FKRXI0blVXZ201TUNmenRGckFtQ3RXN0NycUhwS29QazVo?=
 =?utf-8?B?Uk1HK041cCtjbVZEMlpuclRZM2RDWTBtdk1jck9QM28wS2RoN0R5RFhlY1Qx?=
 =?utf-8?B?K1gveVEyYnJrM3RMQm5aU0FReXo5emI2ODF6ek5FY2RwY09Mdkl4eEF0b1ha?=
 =?utf-8?B?WGlFbWtLU3MzOS9Nbnc0UGxFOHRkME1URHhPRklRVGIyVHUyNTBGNmgzYURw?=
 =?utf-8?B?MzUzcmVLeHJkNXp0Q2hVWXFlNkpFYk1VR0w4ajNrejNCUzlsQU1rK1BoUmNM?=
 =?utf-8?B?SUVGUkZ0Uk1weXBTTGFDanFGcXpGTCtmejEvSFM0cnAxN2QvU3BtWHNyNmJv?=
 =?utf-8?B?azBrZmh6TURnZWJ1cC9jOUZNR0p3UzVWbHZQUWNoOE9TL3BmRlNaaGt6NzhL?=
 =?utf-8?B?dkxTQjhpdzFIc3Y4NTB6QTdDYUNxWElQNmdQZm44ZzdiZ2dKMTlGU3R6SUt1?=
 =?utf-8?B?RS9HSlhvRXJuQzZNWFlQS01qekxNNGk3OWxPbEVVK05ldzlzZkc5Rk9pVzRr?=
 =?utf-8?B?L0JXTzVoUDloNFhYNDZPUUszTVhJczZIejYrbitsN2hLY1VaUFBwV2FybGZP?=
 =?utf-8?B?ZWdXR0JvQ2lqaTJML1BCSmowOWtCbXJYMFQ0cEp2U2VxajBjU0FoL2NpR1Vm?=
 =?utf-8?B?aW1oRk5qQllteGxkdFpscHpqN1o1WEVWS0x4Rjl2eEpFYXUwVHY4V1RFM0tG?=
 =?utf-8?B?c21CZzcrZm5ZdERsMjBDQ0xlbnZuTXRVVUFER1NGem1uWExoYUo1R3BETmEz?=
 =?utf-8?B?R1Vqb0pKQTdyWEZVOU5QbFlhcHUwelhIK1JJSTNrSEVNTWI5T1JGcjlwdWlN?=
 =?utf-8?B?TUQ1RjRldXM3dGNtVmFZZmd6czJpTXVWVTRwQjRDaGR2a29zSGt5bXV6eE8z?=
 =?utf-8?B?R254a3NaS0Q2aWt3UlE5ZU9pU2lBSDhBaVJOanFOY2FSL1J4WDIyajkrYjA5?=
 =?utf-8?B?Q1piVVpyQzZiUnpMTXF3c01OVi92L3RZVlR2ZnlrL1NVcGh5MjVPTkY4cExi?=
 =?utf-8?B?dHVPK3FtbDNOM25WU3ZIRGFKUWZTd0ZiYVo3WjRKVHhNMGhaNUlpMDl3YkdM?=
 =?utf-8?B?VVIxZWsyd0FyRStQRkJMUkJKUGd3UmZhZFJpR2ZVL0V0UEJQYmNWRU0xMmdt?=
 =?utf-8?B?bmJrWFJCZG5wZGpobS8vUlNua1BiUzM1RmcwczVMa2s5Z2ttaEpiS3pJVUtj?=
 =?utf-8?B?NEgyRm1uSHY5TmM5ckNRWTRETXZyT1hQZUFjdXRneEJWWHBPV2lRbG9STmhH?=
 =?utf-8?B?ZkhaWnZJc1RnTEhCMUVTYTlaOW9GQllzWCt0Z2ZmK2ZIU0RiVHpwWUFpMFJL?=
 =?utf-8?B?VW5NY2llVnZ0U0RRQU1nUldHK041SmtTN1hzdGYycU5uY3BQT1I4eDc5V1BM?=
 =?utf-8?B?TURySmhrTTdMcTlqZEVrNCtHRFBaVElGWXBrV2FhK0tyV2pqU21WemFVQ3NY?=
 =?utf-8?B?Q2k0bkRvb2JPVnNjYmovL1ZWcTNwUFRzTmg4a1dwMi84SlNVNUg1cXcra1ZN?=
 =?utf-8?B?U1kycnFzWW1rQW02d1VaQ0hjc1JidG9hc2RBb0c2NUovZlpXeDNBTDI5SmRY?=
 =?utf-8?B?UVhXN2tWZHRDK00wb2MwdWJNTG8xK0tPZmdIRVJzeDhEMnNvT1NtUEZ2dzkz?=
 =?utf-8?B?NnpWZUVEOTljSXJLU2dZRGRpV2dNaU82RnJKMTBvUERlRFdMUW5RSEo1MkEz?=
 =?utf-8?B?RzM0YnppOCtpVlk5SlhLSWE0NldOQ1EyVWVLMkFBZ1FTOERsZDJxY3BBVmZo?=
 =?utf-8?B?bjRVbmtVbkFJWFQ1OHhVRjR5bnROV3B5YlpsR3JSU1o3MXlVMGlNMGVsVmZY?=
 =?utf-8?B?VE5EbUN3dDBibEpMcmRnT2EwS0o5MTNGRFdNSXhaeFhUVmJlQWpPZXNTYVNL?=
 =?utf-8?B?MExqMkh4dXJ3b2E2aEtBTTdKeTNQRlloa2RHRVY5SzdRTDJhUTRyN1duYVEr?=
 =?utf-8?B?THhBUFRSZHpGMHQwYkhVeFFFUUZnNE4vclR1a1pYbTVUdm13Q2ZkdlFnY3do?=
 =?utf-8?B?RnNNTkg0Sm1McElyYjNaK2k1dUZQREJwcUFjbWVJUnB4YnU2SkNoQWUrMi9M?=
 =?utf-8?B?dHYyakdldUwvUisrM09TNVliTnlJRDVGcFZkdHdOYUZubUFFVGJTWmJoT1V0?=
 =?utf-8?B?STVBK0ViV09wcjFwL1RjVGgvQzIyTHZycjFWdFN5MnFSU0tOWHZqVit1T3Fx?=
 =?utf-8?B?MFNoZmp5Qi85Sy9sL2lkd3BLTHlybWlZV2drbnRLOU5nNG1MbUF5Zz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c58434d-9a35-481b-39ff-08debb0e4177
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 10:05:03.6568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rZl+wUA3ZMmpm5GqFJMwGripan8sfLMhlyEhuHt7flIDW8vKPehyAdFsdxuI0RQ5Nvh/qywZJVttGTa1c7zSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8305

On 5/26/2026 3:33 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>
>> There are 4 clock controllers in A9 SoC:
>> - SCMI clock controller: these clocks are managed by the
>>    Trusted Firmware-A(TF-A) and handled through SCMI.
>> - PLL clock controller.
>> - peripheral clock controller.
>> - AO clock controller.
>>
>> There are reserved register regions placed between individual PLLs, so a
>> separate driver is implemented for each PLL, similar to T7.
>>
>> Compared to previous SoCs PLLs, the A9 PLL controller introduces 4 new features:
>> 1.PLL l_detect signal supports active-high configuration.
>>    Previous A7 and T7 l_detect signals are active-low.
>> 2.PLL reset signal supports active-low configuration.
>>    Previous reset signals are active-high.
>> 3.Support POWER_OF_TWO for the PLL pre-divider N;
>>    the N pre-divider follows the same calculation rule as OD.
>> 4.The PLL input path includes an inherent divide-by-2 divider.
>>
>> Implement the first three features in clk-pll.c (verified on A9 and T7),
>> with no impact to PLL logic on existing SoCs. Add a fixed divide-by-2 to
>> A9 PLL driver for the fourth feature.
>>
>> A9 PLL is composed as follows:
>>
>>                         PLL
>>            +---------------------------------+
>>            |                                 |
>>            |             +--+                |
>>     in/2 >>---[ /2^N ]-->|  |      +-----+   |
>>            |             |  |------| DCO |----->> out
>>            |  +--------->|  |      +--v--+   |
>>            |  |          +--+         |      |
>>            |  |                       |      |
>>            |  +--[ *(M + (F/Fmax) ]<--+      |
>>            |                                 |
>>            +---------------------------------+
>>
>>    out = in / 2  * (m + frac / frac_max) / 2^n
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>> Jian Hu (10):
>>        dt-bindings: clock: Add Amlogic A9 SCMI clock controller
>>        dt-bindings: clock: Add Amlogic A9 PLL clock controller
>>        dt-bindings: clock: Add Amlogic A9 peripherals clock controller
>>        dt-bindings: clock: Add Amlogic A9 AO clock controller
>>        clk: amlogic: PLL l_detect signal supports active-high configuration
>>        clk: amlogic: PLL reset signal supports active-low configuration
>>        clk: amlogic: Support POWER_OF_TWO for PLL pre-divider
>>        clk: amlogic: Add A9 PLL clock controller driver
>>        clk: amlogic: Add A9 peripherals clock controller driver
>>        clk: amlogic: Add A9 AO clock controller driver
>>
>>   .../bindings/clock/amlogic,a9-aoclkc.yaml          |   76 +
>>   .../clock/amlogic,a9-peripherals-clkc.yaml         |  150 ++
>>   .../bindings/clock/amlogic,a9-pll-clkc.yaml        |  110 +
>>   drivers/clk/meson/Kconfig                          |   28 +
>>   drivers/clk/meson/Makefile                         |    2 +
>>   drivers/clk/meson/a9-aoclk.c                       |  494 +++++
>>   drivers/clk/meson/a9-peripherals.c                 | 2317 ++++++++++++++++++++
>>   drivers/clk/meson/a9-pll.c                         |  831 +++++++
>>   drivers/clk/meson/clk-pll.c                        |   79 +-
>>   drivers/clk/meson/clk-pll.h                        |    6 +
>>   include/dt-bindings/clock/amlogic,a9-aoclkc.h      |   76 +
>>   .../clock/amlogic,a9-peripherals-clkc.h            |  352 +++
>>   include/dt-bindings/clock/amlogic,a9-pll-clkc.h    |   55 +
>>   include/dt-bindings/clock/amlogic,a9-scmi-clkc.h   |   51 +
>>   14 files changed, 4609 insertions(+), 18 deletions(-)
> For the next version, please split things up.
> There is no hard dependency between the different controllers. This will
> ease the review.
>
> The PLL controllers are bringing a new contraints in. The global/static
> nature of the controllers is something that has been bothering me for a
> while but there was no real reason to address it so far. Please give me
> some time to think about. Feel free to re-post the other controllers in the
> meantime.


Ok. I will split the series and re-post the SCMI, peripherals, and aoclk

controllers separately.


Best regards,


Jian

>> ---
>> base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
>> change-id: 20260511-b4-a9_clk-67652c1ae56e
>>
>> Best regards,
> --
> Jerome


