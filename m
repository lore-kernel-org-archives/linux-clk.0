Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022136.outbound.protection.outlook.com [40.107.75.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085A93932E4;
	Mon, 16 Mar 2026 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773663374; cv=fail; b=UiydG7TvMyswJ+XFDQdDLDw/2VYAi1hlz8uvUIHSMASLkvIODpe90kM8Cv+r9rawAGGD1skiA/mflh6zLHitPi1N9qgbEIzCsqxnVfJ1w8Ob5dpG8+svpKpgFsgMLSX/RSLOBE0SOdrciZrQkVItSR93PLZNDGDEnNdhNuAgRH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773663374; c=relaxed/simple;
	bh=rxoFEr53tm2cDrzZEw0sSo0r+krwWmszxBJlTEuyIo0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RaMjonQ3u0eeKY0YG7NKdeDaHp05YLsR3gcKL/CMkorZae4yf4sd6Cky2JNVZSs5obcDkYVfVqEeZBzdhJQOhwvS7caPVnaXUue/K9GbHjzTgEngJePRNROgR0hLveJampq1WycwG8QcgEQbIN+Sq/BpsoppsUbugocrSkJ/Wuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=C5XXt9pu; arc=fail smtp.client-ip=40.107.75.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="C5XXt9pu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSyG5BWc2+CN+YPwfYlriTMw6wFsjpn9SbhAJH9wixwnaxf5M5pE6CGtYEBhA8pUejiWIsRto2p03PODd//Vx5s97unIEZ/JQZCv328f5M25/FyOuAJOoib/3DFSUA/vX2qti6/lL4D3ZBlBf/85w5BcKTFDL6BA4KrOFHZZuiNCrK3WpIXsvukbMzm+sPEfRD+uwd/Mppts5rOb7AwvNsKTWxWGhi1Bn44t1RABxWEKTFZpwtoKSM7tI1SfnA75DL8nfIsgeN/99E8G8+zYTWZbdNkgCgaLif4pRZ806y1Gd8uM62qa/D9/hRs/+Q+fJtKEjbGwBzSVuADyro5sCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3z4rcOrB6YGJr565JHhaUT67GbFrGi8SwhCQGFJQYI=;
 b=iGV90Lp0b83SKhvbZnnhu46EhKwXS7voMVGIJQjjMJG9+HA0yh3uaQ2KwHfSNRFdxJebFsMwsleYAb/8ysL9ituLbR/82mLGH+ZkHhI2UG5SnG6OrNYcI06GedujHIy9hN1F4MeDviQTHXUD/V5++rxgFaAyi3oacgmHkb298oCaHrlLkWqbw4DXbQotd4+lLhsFL/lsMNq3E0mVI8YswaQOnB5XMQBL0cW1wyggI4q8aEUjRq+bl6fOFC9ipBbaPWrLWYWmd6HOaCRr8TJygHX0U7ND5c9isFqPgIZoP2fX1GC3xKhI+lsi7i3KVN2W2JrEoJc/IaNIeWAFKYOGMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3z4rcOrB6YGJr565JHhaUT67GbFrGi8SwhCQGFJQYI=;
 b=C5XXt9pu6LRuvl3TivHbWSX7/7mWPlNF7ak7/OPFSKXow3X2sA1gXK0GxDN4jqoswpJPxE9oxmFIF2iyfKO63rNoAcCydj/xZKAt7TgulHtg0tZEtQ0Lyy2nS/Zx9j5SRskqXhEaTMMXCF0IH44xTgU2ooQqMJmwTCcPZwWZ1Wr8se55huHc4SmDRGPmCky4mxn8BdNjDU4YzpIi0XyFyTdspyEXNwR9PlG3twpl0ddRWjYFmAto21f5fqSZHZ9MUGQ40zX/+y1JFjN55cNRsUtv2NX4EUHroxwsf1mSspAY5lRpi26IDo5qOROrst7/3GwJ/MGpSS+emF7g4q0PFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEYPR03MB6483.apcprd03.prod.outlook.com (2603:1096:101:53::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 12:16:08 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 12:16:08 +0000
Message-ID: <87003cfb-e08d-4c2d-8289-99bff0704d70@amlogic.com>
Date: Mon, 16 Mar 2026 20:16:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: amlogic: Fix redundant hyphen
 in "amlogic,t7-gp1--pll" string.
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>,
 devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ferass El Hafidi <funderscore@postmarketos.org>
References: <20260313070022.700437-1-jian.hu@amlogic.com>
 <20260313070022.700437-2-jian.hu@amlogic.com>
 <20260314-sweet-amber-griffin-e81371@quoll>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260314-sweet-amber-griffin-e81371@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::19) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEYPR03MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 273684a6-8234-4a80-720f-08de8355cdb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	c8QXnD2ATJjYIthtwJUNtMUdipDqYsn6ZGFxkvCJq1zxyrNX5XKyICY030PbUpUf6VxKsyXBTtcZ9MdTQxoZo2Ev9Njstuzhj+4vcw9cedz45volMHuRKYaNZYLXRCtmcjeD9ztPqmKQUzFION7L7EtoxklZDXlx5n6A1nnKT2ag73wdTQMfriVHjHO1M1Stc6y6HapJ6+lsM8oBpfX5bG2i48PvroAiPq5quSU0OtjCxv/1N2fjkH/gxH0NkRAFL0l/zMV7Otoi1wPD53xHspacxsF3j2fRbDJvYksX5CgLKkWsh9VR+doLzT61oW2D1RJtFWTM68WXb/f61nCWxN50Ee8QvVyFnP/73gnNwYbrXOR04XiIK2l60X76hqDH+6NSHLPqDj2Q7v1If26AvjgKHTHTDdCKkGCSaJd4+ProHvAitzYi5NTTDD4Li//BpM9jHzwNzClr7xSq+uOVLmE81H+MebEcWCk7GhXGu4J25lP61KBAsaBjDKGZsABCfmpfqs2wB16yho4DZM9wzPmbFwjarf3q3UnzgvM5W6Fp9RcEP/cuCq6LX5Y2IX5GfPDR+bnsKGoW35iYQUcXyjzBWePbjamlJoL1pcKRkJFQ0qLsJQMWLUqxNJ/Fs5DFAaZFLslSa+5J8//qfJsw8yLqEt4soirbXevCYGgryg+8ee3UIdyhbylc2nJKoOgDgAgSPAZIogzrDAdxrmklUJA/JWlUx4uqVvmH5LwzAtk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXdZUCtiblc4aUp6bUU0M2tITDNHa0pxdm15cEIyWTd1UlZvSk5RSlJrb1pU?=
 =?utf-8?B?VGVCVURwVG5lM09wYmxBd0JSQ2VDT1Qzbkd3dHVjOXdSaE9UMlVMQzl5WVVZ?=
 =?utf-8?B?K3pLMDA2aTJGOXdUSElaMFpyVi9FcFRnNnVwaWUvWk1kdFFmaUJRN0VXY1gx?=
 =?utf-8?B?eWQ1dWh3ZEFYOXpZYWxqb0lHQnZkWG5keDBuRVdYNHZXa0xGQ1B5UGlkdkFl?=
 =?utf-8?B?dFA2WUx1by9PcFU2b0JXVlJ3MEJGUE54ZHVwaWFKck4zV2hVZlpKRUxCbFFj?=
 =?utf-8?B?bzByQVJBZE5WSEx4QkU0RlJ5akxiNnAwS3JXNGp5U3UrOFJsZnQydEZObnNy?=
 =?utf-8?B?YVRxeFBuZWhvSEhpY3dKWFNNME0yLy9zMmFTdDJudEdyUHhFVjNTeDZ6RFFs?=
 =?utf-8?B?bGtSUnVOTFd3M2N0ekNsNGJ1NkNHZFNnTzdBeERRQkpDWnc4V2hOc0hlWkZq?=
 =?utf-8?B?SWpuYzYxT2IzZEd0TmIxK0ViM2M0K2FqUkZLZ2RRNVl0RHh3RWF5TE9QVnZK?=
 =?utf-8?B?NU1WWXNKWFk0QStQUjZGKzFhM09YYUs3cy9LUWU5WmRzN3pENmFLakRyU3Ri?=
 =?utf-8?B?RkVGSmw4VktlTG5wSWxpZjVJL29RUzY2Wlh6aU1Bek1QKy9VQ3Ezb1dMemZs?=
 =?utf-8?B?ZFgvZ0RpZlA1U3IyVmtSc1JITTk2a3pkTU1WeFJ6eFpPOXFnVmxnRW9nSTlM?=
 =?utf-8?B?OFlMcDdlSkwyK1EwUnh4ZDdheUdESHMwTjNLWHF2R1hFSGJxUjVRdExnYkov?=
 =?utf-8?B?L0MwMWk1WVRZaXZLTDlwLytFWEEzL1lrRDJianI4TGN3S1l1TVhWUWRaaGwz?=
 =?utf-8?B?VlBBWklMUHFucWt3Z1c4aE1KK0xUUldVZWQxbnlXellOTnhZUlE4eE1NeEli?=
 =?utf-8?B?NGpxOTFwUjE0Uk5PRGt2Z3VobStXNnlDZmxlc1Ayb2x5SkpxU2FVZnFuTmRH?=
 =?utf-8?B?S1J3WlV2ZkxnYTYva0NOVjMwc3B0YkVrbjl5NGdsVWh1Lytxdm5hSWxYeTZh?=
 =?utf-8?B?QWpUME5YeUFTOEwzRkloTWVaZVErNDZ6WDNxbzFzVk1QS2kwY0ZMS0w3L0pn?=
 =?utf-8?B?VmlNYzRsNWcvcUgwdGlrTnEyWkxUbVRBc3E0SEpYMUdyMXRtMTJ0QUtVZXpO?=
 =?utf-8?B?OS9BWGxKMGE2bVAxb1B5YmtjNHlodjFzc2E2SlJQWkptak5jS0ppdmVzNXd3?=
 =?utf-8?B?bVRDWHkzN3pUblREWnNkL2FFeE9sbUVUcm1IM0xmK1pDYUlrbEw2cXI2cmxE?=
 =?utf-8?B?M3RDRlNPRW1DaUZSNFZUVm1FeDd4Z043dFd3RHpWZUNxVnZSYVBRZHRsN2Zy?=
 =?utf-8?B?Q1NLZFlYdy8zOUtzVXg0TWZ2WDIyNllPTEprbEVlMytvc2VHK2UzdW1vOUpB?=
 =?utf-8?B?OGc3N2tvczV6Yi83R0ZvcFBCSmYvWTQzM1doTzVIMFkwM1NLL2NaaytEc1Rw?=
 =?utf-8?B?ekNWYmhIR3cramtIb0c5VndVRUhCQ1dBMW9aQnVzbjNucm1IRk5FZmR4cnc2?=
 =?utf-8?B?bzBPeWZNZndWV2N0eUNTaGpaN2pROWgyZVVISWFNSmFVKzk4Q2dqZGpxMTJW?=
 =?utf-8?B?d0RDcGdicTNjbzlrWXYyRmNSeVc0MEZCRWFMUm5tdUtQVnNwY1U4djA1RmxC?=
 =?utf-8?B?WGxCMjJMenk3M2RZQVpUS0xvQ3h4c1hPaFpDdXBjbnpaK1NUR1d3ODExRklo?=
 =?utf-8?B?YkpIb1RMQjkzRlVpNFdkd2NKU3lkZWlaajZGSnVFbzNOcURBTy9ZcHkwR1c4?=
 =?utf-8?B?RkFzQWZBakUzMUY1SnBaUHVCcmhPUStrTDByVWdBQXNDMkJYQXBXTkI3dHpS?=
 =?utf-8?B?amxoYWFzbUI5U2ZNbXY5ZEp6cE9MUEZvQkdJUWc3R3V4d041eTNMUnlycS9x?=
 =?utf-8?B?NDZ0eDVkMTRnSjZMeDlRVUUyZ0RyOWdWbjkzZmxneTYvVDFZdjZ4eXlsVHVi?=
 =?utf-8?B?QU52bVJNdXo1MzZTbWNzMnIyVjU2ak54MTEvNjdLUFRha0tZODNvbzd6WC9m?=
 =?utf-8?B?Vjh0QzQ1T3lYOFNTQXg2c2wwNEhUOVhpOUZOMW5KMWs4eEhpS1BaMmY3c2tx?=
 =?utf-8?B?c3pvQ2JrWmpORzVuRm9IZUsxK3RQR0tQZC83QlRhdm1rRHNQQStZd0kzdGdj?=
 =?utf-8?B?U0dTK1hyS041NWFvOU5sVGF3UkJOQTloem1aTTQzZ2p3alMxY01GSmxNVjIz?=
 =?utf-8?B?ZUlkZHVIdFY5UjdoakM5ZWxUenNEc1RTSG1jSFZsbmZYS1hRQTNjM05ZR2JC?=
 =?utf-8?B?Kzc3M3FqcExpU1oyQytQVTg3RmNXNHZTN010M2lMZ25zRDIrWGJtR0JXcUc3?=
 =?utf-8?B?anZnWHpBMXhqY0dSWGU0TUtRdGJ4bk0rSSsvbm1QQW10Rnl4MDdtdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273684a6-8234-4a80-720f-08de8355cdb7
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 12:16:08.1932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbVA+vr0D7vFcWepQMg167YxxlymEEJ4ree59rmwRc3Fuyz2qVYnlOF8It+4VL2FEBRMBxYGy+T4KhpWxPq3RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6483


On 3/14/2026 5:53 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On Fri, Mar 13, 2026 at 03:00:20PM +0800, Jian Hu wrote:
>> Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
>>
>> Fixes: 5437753728ac ("dt-bindings: clock: add Amlogic T7 PLL clock controller")
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> Incorrect DCO chain. I don't understand what Ronald's SoB is doing here.
> Please read submitting patches document to understand how various tags
> are used in Linux kernel.

Thanks for the your review, my apologies for not clarifying Ronald's 
contribution clearly in the cover letter.


Ronald's "Add EMMC for T7 khadas VIM4" serial patches found it and 
reported it.[1]

His patches intended to enable EMMC DT, but it depends on the T7 Clock 
controller.

It includes the fixed clocks, sys clocks dt-bindings and drivers,  But 
these SCMI clock driver are done in the SCP firmware.[2]


The Amlogic T7 clocks controller DT should be enabled then he can enable 
his work.


I sorted his clock fixing typo patch，submitted together with the fixing 
missing mpll3 patch and T7 clock

controller DT which I have confirmed with him. The third patch depends 
on the second patch.

So I submitted them separately.


His patch also submited some T7 clock controller DT nodes,  I added his 
SoB in the third patch, too.

So Could I add his SoB here or other tags like Co-developed-by for patch 
1 and patch 3?

Also I will document the history in next cover letter.


[1] 
https://patchwork.kernel.org/project/linux-amlogic/patch/20260218101904.35541-1-linux-kernel-dev@aliel.fr/

[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/dt-bindings/clock/amlogic,t7-scmi.h

>
>
> Best regards,
> Krzysztof
>
