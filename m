Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022074.outbound.protection.outlook.com [40.107.75.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B9533F363;
	Tue, 10 Mar 2026 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128541; cv=fail; b=UfocHy7oel/9kJ9qJV5mADnbFkaCPN9eYMXTZ1SANa2to1Br9KGvCdmaFwEc2c7WhfZrx+1wRA41S7Yng29lahhJiQVxRfzYe/Vj0Mg1+9MVDxQRlN5gIr+LikN9lAntan9OKOvVFuY2s7w1OR89YOYvl2LxmuaTpemrbFrF1Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128541; c=relaxed/simple;
	bh=SG3/vTl5WtDL0nZ4VrnJSPcmo0gLgww5oZ8sZNVW3qg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HWyfcfKFQwU7VDpd40FLKl8b6HqwUzENvHTRSetwwHQnuwKPOYwI4ERxv3FKKRyldGe8eT7LkD1XfPOdWqQuKQLExWqaAlm+WEk+XtdiUcsTAoiapag+AfoY5FRqS5UFyakWS0mGBT85lDT4zr95jRPMpZ+7sNazqYHNDaK80C4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=xRbvYZZt; arc=fail smtp.client-ip=40.107.75.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="xRbvYZZt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfG2IW4GtsFGXcT49FdqpYp1646/8qWc17aB4SDqg9Y5Kw1ufX57dnuDmkUEaQ36mEeNxPwii8H+vtbJ72LWIR/Wn7NvuCZqJpWxn+LCkkVp8hSZiFgBsFnsGbgXO0UOZ6h0P6PvtHIVI1FSffrT4o5WABScOzHgRcA6yBVukI1qFgh6dI3HJ3YO+8fd4WTQvlZVt0AhpJC6UQFnoCYXZni5ddWMTyCxoj4eOO5eODPkOF3i06Q0Y3nt8ngIVk5Ti4wjqcesA76MhLsdv0XRsMMgso31XoFxTtSkh2z4xM7ECDF36feqdb8du/65twmET7t/jfF7KOyxzDeoQhiiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGDNInPBjaoJpZiHZ2mHlNGfsOzx0bF6uHg5FVl81Wg=;
 b=MqtQ3RLtLFl4H/1Ii4/rmsxVC0kUTUT7Eq7IwBx4cn0mxCsgNccecw2bFz7GZhm+fnTFWiqYtMmW/Cb0UctAI/8zVjY9r4P0p9/ibLaObZ76rzI8yu4HXNfJAF89SzNXOm3B6YU7mZXV/Epfw3g9BPtNYEscdXf/lvflfNWQQgZj2O50/Xcc2oKxbqWGpOn5Pbelm0mlKAfEhYZt/c+2p5Rsev1sobcrxOSJP5djqDh+WL6/5e3h5GGdwI61hyWhzuyd0n8ccbG29jnNcOgNpJojlD3Xufm8T2+MZYv7LB5jOiN1lfgM0zGE9zEA+mb0QyL/Gqvx9+cLej3d0aMH5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGDNInPBjaoJpZiHZ2mHlNGfsOzx0bF6uHg5FVl81Wg=;
 b=xRbvYZZtn5gmgAJkxEf8a+R3LMErYTe1yw7FTxOBi10cOX/dkLyZ+Rk7D5GrLF6tSwsSlwZd98TP+uAfiKqDNrDqQ7w+yt+9zzOE5PC/AVzLRjSOfcAhM1TXPUnKzXUrQ9ShBztkCdt2uR4imbRdljCA9JOkfaqhpNCWOKa0H6VJeUGdHTdL1iU3wNbJpYMrMgheXoj7Q+LYziwD4h4aJLhFbZHpnhiWanlHXyrK6VSycT4hOwxON9drjiLefQpuEOf1vn+xRrTwgXfwba482T5d3ux6rC79iE1S0rWl9Ma5fjCsSVONLHsebB5zFU+GVBnFWxkN3/mrthgKulwJLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SI2PR03MB6758.apcprd03.prod.outlook.com (2603:1096:4:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Tue, 10 Mar
 2026 07:42:11 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 07:42:11 +0000
Message-ID: <1b8d4e13-0365-45e9-baa8-975595153ad5@amlogic.com>
Date: Tue, 10 Mar 2026 15:42:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3
 parent clock
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-3-jian.hu@amlogic.com>
 <1j4imubqcb.fsf@starbuckisacylon.baylibre.com>
 <20260306-artichoke-parakeet-of-innovation-af5b36@quoll>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260306-artichoke-parakeet-of-innovation-af5b36@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0103.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::13) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SI2PR03MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc80ade-992c-48a3-dec9-08de7e788a3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	yulGF/X+46WFs302nQ3cjWGmDUwT//+njDSJU26731eBxfT9Hbz74HV6/SUgPdB80EQG/fYMO3hxfDa8UU2ajHJutGF2eRXDeZG/+5P0bZuYuTmVz3lc82d6Ph81UV/jqxo4q9BVnsY8mnxnfMhaBcZKhIT+HlHKE3Eff/7NiGbGq1zIPIb+z5yI/8axtsf1Uzl7c57Y7uS8noQfsv9UM2l+5sagScTRTy2MOTukBEc6JqCTi6l2DGsAQl4TMrY+qKMeuI03p37jSShaC3JMTXI11oFSBsZSvwbxUIPkwxgECrKEoehb053oAbSLqOV7PD9KnDj8cwP6+UOzBxCtsFTACBzKls56jVcq0tgfn5kJkKRCItKhNNPvDICIW8M7CWz1nYYqcL1Kyz3ZDNtRLsw2gvggw7AdIcbMRn/6d93NRydl1FotqmYd5BRZqdHO2GRHlJeVTXsDNBq+86m6ynxRBQvJYqUw5x/nlocppmTS3t53f7pPCk2j8pWfQPlniJKEHUyqtG+iKJvLCgHAqpb7ZPZjtLGUKdxyRp4bUQxWoUAz2PJSMwKSQRN0yn47n2+lfCTaFxk9yWk1rNykbzeknG5YANlSOHZZ5/jCL5GqMWfNpaA1Odg2fSuqgztRwfPsUdMxmEzq/dQIJiXCJgHLrsa9XBmLaSM9FPnbsqY9jN+60uVStcVdiLyNgob1ul/sE4nMqv4+fk/mQTmVQfu6Iiah2pjDPZf5PodI05g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGtvWDdMNHhIaVpiblp5aHR5Z0RTQVh0WVErdlhDUFpiaDV6dkNVV3B5a2hC?=
 =?utf-8?B?MVVBSnRtN3ZlNERHZ2Y5VGxmMExIcWlIQ0VzTTZYank1R0hCcTQ2SldCSFJD?=
 =?utf-8?B?OHNpMU9rYXp3MU9wd28rZ09RckorZG4xaEU4dG5YdmdRM2VaUjJaY09yTS96?=
 =?utf-8?B?Z1h4UjNEeU9PVDJsdmlObkM0UTFaMGdtOHJCU3I5SWZmTGVCY0hkU3Q3UWdB?=
 =?utf-8?B?d2NGQzhUaXFQcWh0Ti8vdXdqeVFiKy9wKzl6Q25XVndqN2FlNE44eXpFaXMx?=
 =?utf-8?B?cVFKQlkvczV0U0VQQ2FDZ0ZkOCtIYXBZdGw3b1VTWWFscUs0RStBWDk2dWd1?=
 =?utf-8?B?cGx0V09XMU1RMkFxUThhcDNtYUc1aTcrLzZsRXJmSVdTbHZTV3M4MWlqL0kr?=
 =?utf-8?B?bmxrWXFtaTJLUHY4bVAzNkxzcDVmYVdhN1VDUDFiZ1FieFU3QTVuSnFNQUQ0?=
 =?utf-8?B?Z09nOUt3MU4yTTRkOWpXNHo5bDBVTjRxLytqcE5JTWJEMWNSK2lkL2hGeHN1?=
 =?utf-8?B?d3h5a1FuVjhkMzN2U3ZXaFNSR3BBRmdFQzRhT1UyeElJaVg3THZJbTFoeWRU?=
 =?utf-8?B?aURvT3F6ckFWVGU1TC9YZmdXd1V2Skw1OFBRUVZySWxSUkFhalliUWpZNHVE?=
 =?utf-8?B?bHhQOGJqMmZMNk5scVhHbDJLelFqYVlDb2J5L2xPS2JzaUhlQUtMREU0UGxs?=
 =?utf-8?B?REhkbGNQNlF0MDBGdDNyMzNZNGI4czBBUE16RnVKWHg2M0F0M2J5Z0VqWWxY?=
 =?utf-8?B?bE5SV1gxRUxRSExrQmQ2WkJaT09RbW8rMHNiVmdjUVZCVVFFR2trbjZhb3Jt?=
 =?utf-8?B?b290eXVqclU3em55bExDSEpma2phVHJHcmpSS0I4UlZHN28vKzgzRTlGWmli?=
 =?utf-8?B?MVo2eWw0RXlJbk1UOWsrb3RRSVNuS3drSlBuMjRZM0NxSU5LU2ZHUlZMVm94?=
 =?utf-8?B?QzBJOTFHZklWV2hrSTVmTVRjRjFwUEZBWkpNeG1kTTlocThKU2JTM25pS3Vz?=
 =?utf-8?B?SHdraUZSLzFydkFJbnF4M2JuZmNVTmZzUHZvUXlZMEF1UkFrek55OGMwblpk?=
 =?utf-8?B?cEdLcVM0RVlCVlZSTkwrWFFzZFlwQy9MUnpHUE9oUWM0YjFQWVQ2M21EY3k5?=
 =?utf-8?B?QVRveEg4dVc5Q0NPNUtMZm5GUlQ5Zyt6T0JmSWhzR2xHeW04c2hvNmZIRGFZ?=
 =?utf-8?B?WGRuUFVuNG9wKy9wandaYlp6NldtR25KZktwZDJyeFJZZDhRRFJUamdvMGd6?=
 =?utf-8?B?TzAwaU16QXVMN2xRVTRLbzdIL2NMTVJIcGNDYm1EOEJINmhTRGtpZWtkM2hk?=
 =?utf-8?B?VzhQSmdUWk94NWl1dVE0c0FYcXR2RTJkQ2FFRjF3bmo5cDZxUCtWRGN4NzVN?=
 =?utf-8?B?eEwyQWtnR290Z0xRV3VRVHdiNUhKeThIbEdLUkZoVGFJcS9mb0J5Q0V3RTFh?=
 =?utf-8?B?aXVpWnowQ2h2VHlHZS9uQmdCNnMrTHRBajR4Unl4SE52MHUwQzlybHBxNW1X?=
 =?utf-8?B?OE5qcTUwNlZEZFM1OFpRWVN0SEwvd2N4b1RDQ2ZVV1hPaDU5OTJDM20zNm9n?=
 =?utf-8?B?bzRjSjVtbmFvS05PS0JwOXdHYmQzejhrQXlLSHpLd1diRDF5aHJGQU1YMzA3?=
 =?utf-8?B?MVhYWUNXdElnY0JmTEg1eXgzSGVMSU5kRmd3MjVQMTZTQ0ZjTG85OTNJelBJ?=
 =?utf-8?B?eFloS1RpN0NBWFRJUXdlcmk5ZDJaTllnZGdNZmVoOHFNTi84TDNmZDFmS0ZI?=
 =?utf-8?B?cWdRR2VGTTk1LzhZN0hEdnRocW8yRTY3cXhtd0NyOEpBelBESnk2RDNaWnh6?=
 =?utf-8?B?NW9SSkdrc2tTRXJzcDRrKzVRcTJyZ1NZcGM1TzNoQXVzb0VFV0JHUEVHTkwv?=
 =?utf-8?B?dCthd3BVZS8zUkZvS1J5SVhxUGZBTkpuRWJ3OVJ6VU9EdUdDZFJLeGhjSjdU?=
 =?utf-8?B?eVlSOXI0RjI0TlY4b1U4WVNGNTJweDdObWU4ZW5KTjdpaEEyckQycDRJNDdw?=
 =?utf-8?B?c1NQN2hyc0ltNnE2WkxwT0RYL1ZnNUFQeXZJdnlzbzlBdjh3ZENpc3p2ODhs?=
 =?utf-8?B?YVhFb3JGVHF2VlJPQUU5ZW00cGN6dGE5R1VldytGaTBUckVXblRmM2hZT3V3?=
 =?utf-8?B?UjFjcXFCalhhZXhiQ1lDWlhZWnFwdkg1NUdUR0gzSkZtWXNrK0ZVeTdNdFFo?=
 =?utf-8?B?TUxKbWc2MjV3TklEdS9YM2NZVW1kbGlwNlNqSloyWHI2YWoyQmxlYXpYTzk5?=
 =?utf-8?B?L1VUWEljUERWM1lVT3FxOVdoMFFoTjI1RnJXL2xlUmE0Q05DcWZyQXB2S3Z4?=
 =?utf-8?B?a0doYW5HbzVZcHhsSWxlcnJtNTJkeXhncGFnQS9rbjRzZldtaUVwdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc80ade-992c-48a3-dec9-08de7e788a3e
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 07:42:11.5569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbDYg8T+MJGdyTFpQtYg2jRQzGrasT3VRBbQVVGVAQVDWqwb7arMvRi28Yv4jPe9hlvRkqLnLvfx23VhC/LzKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6758


On 3/6/2026 4:14 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On Thu, Mar 05, 2026 at 10:03:32AM +0100, Jerome Brunet wrote:
>> On jeu. 05 mars 2026 at 15:43, Jian Hu <jian.hu@amlogic.com> wrote:
>>
>>> The mpll3 clock is a valid parent clock for sd_emmc and mipi_isp on
>>> the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
>>> Add it to enable proper clock parent configuration for these peripherals.
>> ... but this changes the index of the clocks after this mpll3, and those
>> index are supposed to be stable if I'm not mistaken.
>>
>> It is indeed more convenient to have the optional clocks at the end
>> as it avoids writing multiple <0> in DT when we do not have them.
>>
>> At the very least, your commit description should say that this change
>> will not break any existing DT because these bindings are not used yet.
>>
>> I leave it to the DT folks to say if the change is OK in such case.
> Based on commit msg it is not OK, that's why we ask about explaining
> true problem and actual impact, IOW whether this did not work in the
> first place and authors did not bother to test it...


Thank you for the clarification and explanation.

mpll3 is one of the clock sources for sd_emmc, and this use case was 
indeed not verified in the initial version.

mpll3 is typically used by the audio module and is one of the required 
clock sources for the audio clock driver.

In practice, sd_emmc does not use mpll3.
During testing, only the other clock sources of sd_emmc were verified: 
fdivx, gp0, hifi.
I apologize for this oversight.

Even though sd_emmc does not use mpll3, the clock driver should still 
support it as a valid clock source.

Additionally, I have confirmed that all required clock sources are 
defined in the T7 peripheral device tree.

I will update the commit message to state that this change does not 
affect the ABI.
> Best regards,
> Krzysztof
>
