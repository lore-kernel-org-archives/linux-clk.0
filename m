Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010048.outbound.protection.outlook.com [52.101.201.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F253B2FE9;
	Fri,  4 Sep 2026 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515413; cv=fail; b=h3VkaUPeJXaTVHZq71FCXttOZOYDsEXOkVmFQJeErF9X/3lxxW06Gz/UcB+1Do46p3qinozqvujv0gnvSWwCMGsLhBv50b7jWziWia9DcnhASZKQQjRm0CdRNVrlkeaqmK5FsnQy2OkfZ9qVO/1jykgNofX1LSqBR6nXDtAzhPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515413; c=relaxed/simple;
	bh=0w041yuh+08AJNPQCs/MXGlaisIKhY91xX0cvwbIH0A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u+KMDJZ1qT69QpZxAGzgVq4eMyz6L5RGiNtsEV9I3TQ09Yw3gP7XVHPD4EGIcOtf3la5oI4eLMKWUPKIfGmlKE+Z5W7Cms2OhNaZ7AsoGlrJV2V36UsAiF//Vh95wNYapFWlLnNoxcbk54qec1WFWmRotVN77WLqx8POQ6UQVfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=N9We7qT9; arc=fail smtp.client-ip=52.101.201.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="N9We7qT9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHCA57k7ymy9p76kMeJGZQn3kCKGcXDVWgPcM0Q55WhpnI4gxnRkIjrlWyfcBEoXqeVaiZuSO3+qBX81CLMVqINI7XPIVpJV9E69MoSW0WOfzGtII9QoL/W9winMWQtwgZUE/TvooreiQpJ646kZdRlXLlZMNFcd6Drui7zi6JzO0Eo+27evvrM0IoJ8lCize5YeWdhk0sLg74jrh7U1XcSQ/ZOzvsemX7Pfams8lwvOmQDmRpQyNuGJpPpG+AK4gPTKv1iILin7is1mH8HxzzXRKIqA3RWnXuFEN4BNcMxYNr4cKjm5fspvq+oPQ4nQK2TN/MHHpDmeR4Rn0dp+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/g1IQpDncpByO6xFq5EGyock/kPrjUyGETRUxm4QuuY=;
 b=Xz+vpnqYPNqARzo4ZQKiptHna75NigJaSvtssyDlyrm8uqgx/dHq1u8GeMY03GMamCz6KFyFCFVlB0oZFSz8o/FLg6NxH7ood9oSHS1YbNTuzDZAiJaep6tPYyPv4vW9pb5ShYliwf3P1CylmyUl3KQx2WvBabuoe1SXeyNA5yXUo/1rPBkoADjoOT12+kx5HNLJHVwFQW3uvQUAXBPZu3xM9QVy7haDkHhISrnBsB9l/kpYYv0bFV4+Xu0RZkDtfJdqLRRuumZ40Xnglh9X0z7n0oDH8keTT4I2GhPj9bD2VORc9JhlvY16sZrwsq7JuyXjVh4MPORPDt0l7EwoQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/g1IQpDncpByO6xFq5EGyock/kPrjUyGETRUxm4QuuY=;
 b=N9We7qT9Vap6oH1NoYYG6/CU/m6FNE6bAB84zIlKgg047IvPIIalon0niufp1GtKgjkmM8iSFghvAggw6Eq5KoM4hf+MFd5O4ZdgnOudxJlzDNlN2l0TsEH9V9gK01NLvOwFdm4B3VB1y8zKXuO02KmifS0B0c48u2o7eF8xxnoi6EhlRz5QBct+tpd/p09shtu84qxpmjG6D4ixBAlFkuwdSOxt0O9Llwmdv7+XStISuaeoDxec64+AyorQ6gpfQc/ev/At4+/JWgBlMLSnLTUpFtRpT7U/al2EaGAiAcjpsVcf9JndvVGucNB6wzNiI0wywjd5Kv+AMrnUgH7iYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by MW4PR03MB6867.namprd03.prod.outlook.com (2603:10b6:303:1b7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 09:50:06 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:50:05 +0000
Message-ID: <165fc53f-2218-4582-8b89-43f2ce7500f7@altera.com>
Date: Fri, 4 Sep 2026 17:49:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: altera: move Agilex72 DT and use altr
 prefix
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Lothar Rubusch <l.rubusch@gmail.com>, Ng Tze Yee <tzeyee.ng@altera.com>,
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Brian Masney <bmasney@redhat.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1786006669.git.evon.chiam@altera.com>
 <a3de82b47b6b7638159d19c87da1e99e93fe2e7e.1786006669.git.evon.chiam@altera.com>
 <cd16fb78-551e-4630-83d6-a44a68e2e411@kernel.org>
Content-Language: en-US
From: "Chiam, Evon" <evon.chiam@altera.com>
In-Reply-To: <cd16fb78-551e-4630-83d6-a44a68e2e411@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|MW4PR03MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: c47a0698-38bc-45a1-8c73-08df0a69e614
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|18002099003|22082099003|55112099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	IK8HTVxDyop/sYO3nLt+2I1nrFvG6x6V/3HV4xwozmrWzs09m8S7KVF++1cpVxQSC/ebgtL8VzEogUmGO/3YmW8NtQQrpA7xNWZrREMmH+4U4sFVS2DePBMF1xjMwIIHKmTHAGcjxISjs6QpqDMMQNVmBm+XZIJ4DZKY5O98cf8l/ykrLkMGvmdtemb/7Hxtg5CW1uHGFXyZPtYtDB5x6ocQmj1Qe+BHrdxKQiWazpwlKHUQd4JMsozCb57VRpPcxQS6g0aF4OjqtZ21FXbSZz98/uIOmHUEnwcw6wqKNR+Up7Vcw35CKgFSa09IND5dOuVqxEFflf18hkSBazGRDdxdUWawk9eu4QZr8VgkuIKqYM3RMFefRE+VVDOrvMfBbf2iUFcIGpbtHmCXr5qWPhxoIOZEvhRx/DqIxQW46+/iJgbzOKtyEq+h7m26eFKn1XqZOu6QyZQ1RFeLv3lTNk8OuPEzCHFX8JtFvlEE+DBGS4UtgSMVUotepgcDqvhgR+IxtBQ/z+ysFdx7YvnhWcjVc5F0TJFSekguTZzS7t5RV4o4Bbc9wCtE+n4gJacKW2+XNYKzydw8wEOZps+Y9b0OM2EBAtv/FdTKlDnj/v2BvR4T1Nkxz12bZbOZNuHlt/Ga4KlNG93NKCneA23xc6/P30vb2qQ/g6NzQjEGiro=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(18002099003)(22082099003)(55112099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEFaTHZTcWQvL1U3U1BqWVFSbzVIcS9IWDdRQkw0UGIwT1lUT0hYcmVUcmgw?=
 =?utf-8?B?Q2pGS05VTzVVTTNFbmFBQ0llb1RKQ3VnR2pZVERWUTF3THorSmR1dHRwRFlp?=
 =?utf-8?B?c1hyMWFTYlQwU0dMUXNQQmFweFR5VURaSytuN2pQWnZ2dGd0K1R2VWhEZ09I?=
 =?utf-8?B?RTFpRllRVWJwOGgzdm1NdGU1RHEzV0dKTmJQclBKYUFLajZZVkxOUDZVcm93?=
 =?utf-8?B?Nk11SWFjWWNEZFMzVjY2NDFUZXc3K21vcEtQdm9Zbk1zbWc4SVdHTGtnNFpo?=
 =?utf-8?B?dFpteTRTU2ZXM1MvTGRoQkl2ZWRLbDhGaUxhZ1h4d2tGWlJFRGpZZndvbnFt?=
 =?utf-8?B?QzBkNFBNN2tOWENSRDYyWWUvL0JENHIyTG02YXE5QU9PL3d1ZU5IbW52V3Zw?=
 =?utf-8?B?NEl5ckNid2tjVlJmTGo2emJXWmZ1TmpIQ2VHL3JXR2IybGUzN2o4WUJtREsv?=
 =?utf-8?B?NjlVVjllclAydWdQQWRGZHhPU1ZDUEFma01CWVVKMVQ4QW0wTVNxTkZiK2Vq?=
 =?utf-8?B?REFEczhwUlUwcSs5ZHlTRVg0WXBTcEdIT1pLVXhIdklUd0dySDRURk5Zb09n?=
 =?utf-8?B?SWlScHAwS2lUY21VWU1BenpOOXpuVFd1dkVyS3BYQVh6Y2VxejZMaHBGazJZ?=
 =?utf-8?B?Z0pXcjgvR3pDcFVMRTRRRm53SjdnNzRBbFl2cXFqU2tsU3ZCVXRVTzBHeUsw?=
 =?utf-8?B?am1LN3FLYXR4M2FkR1dmcGJmWTZHTjhQKys2WVhkZkdudzhFSlJDdEdnSWtR?=
 =?utf-8?B?WTJDdzZXczBTWFNPSzZtekcrSldTOU9DM0lYNVhCazdjd3ZlejZWN0l6OSti?=
 =?utf-8?B?OVMrYmpUckFtMTBsYlBNTlVKM05qbHpPSDUzY2dEaFFKcXdNdXVKU2s4eUd4?=
 =?utf-8?B?RWd0NjdkSkRQYVZoSFdpa2xoZUo2MnhHenA3OW9oNHFtcDdsZ2NPMjQxdE9y?=
 =?utf-8?B?UWhpTnNuYkhLNFVhaVQzclVxdWxwWHlqUi9ybWxkaGcrSDVUb29jbGJ6TUp1?=
 =?utf-8?B?SEJsZ0xBRXl3SktuNEQxdVNvWkpSeU5NbEkvcy9xWGpLcWNtb2ozM3l5SVNR?=
 =?utf-8?B?YTVTRkRDWFNuUWdQRmYwZWxQUVJMWWxpQ29ndVEva2tVVlI4Mi85NjJCUlBh?=
 =?utf-8?B?Y2JJNWJFQkZTRlhyQ0IvR2ZxQU52MTU4SmpQcmllRmRyZ1J4VHlYQU9GWWxQ?=
 =?utf-8?B?YVdPR0poVnZDeUFpbGU5N0lFTjY3RTR5dmh6RkczNEYzSmliSlNoVzFiZmNu?=
 =?utf-8?B?b3hXWnhobDY3czFOdEluNTZoLzMzWEhFMFd2bmZDa0xlUzZVRGxnTlgrdUd2?=
 =?utf-8?B?RjRFQ0dRMXBtNm1FZjAvYmNna1dQK3EyM09BV25SSlY1eUtkR0ZxY1NLdFlC?=
 =?utf-8?B?cldXSjF5R1BDNEZkbmljYlVSd0x6bU1MRjhoc3ZoS3Yvb2JqZVZBeEFBN0lm?=
 =?utf-8?B?TVFCTmFQWmpSM2VJdWFIVHBUMjgrVDhrOW1VUHJjTWE2NG5VUWZZQTk0TXlU?=
 =?utf-8?B?Y0VnOXZWcG5mekhGU0dlUnoxc2dIakUwUTlBUDU5aHE2YnhQSGRhY2VtelZj?=
 =?utf-8?B?WURvMFRwTnpSY3QvNlVYRGgzS3hXNDZ2UGM0Tk9BV2JYdVRlTHJqWTd1WDBo?=
 =?utf-8?B?MlE0RWVRd1d3bkZUTVN2V0ZaWFFWYmtSM3pFVURvVFoydUlTNmhrZWtLRkNu?=
 =?utf-8?B?QVNCU2VRZVcxMFBXSkN5K0FQaXFhYkNxN3VsVnRTQnJRYkRaeVhqd0JOSlVS?=
 =?utf-8?B?bFdhbXhrK1RPV0FCcG1vYkl5SXRSMzMxSjFaSHVsdzBISVhzdXFHR25JK1Qv?=
 =?utf-8?B?TWZTcXZMOFJVUmVPejU5QXYxeHRkTUtSZDR6L3BzTkNxZHp3UU11Q3Vvelpm?=
 =?utf-8?B?K1h1QWVheXRpekQ2L2xKSXRMUjVsZCtXRDRzOExOaFJuQ0E5RmFreUNSUE1r?=
 =?utf-8?B?em8ycTNzYmQ5MjRlR3ZRUkJoNFk5YndHVEU0RWN1RkM1ZGp2c3dPNnVDYWc0?=
 =?utf-8?B?eWlLcUJsTlZ0QXVvelJLR3lLejNLcXBvN0RYNE93RDRhM0o2SmxySFBDRkJH?=
 =?utf-8?B?Y2FYcmRDZXZtVGxqSGZVRlk2WkVmaTc5aExINEFRK1BIekc4ZjVMTlFPWlky?=
 =?utf-8?B?YUNxMHc4VkZFMnJpQjVJWmRKQWR5MVRnYTFZMUUrYWwzYzJucEpJS0tpQ1lk?=
 =?utf-8?B?alRyeGVBNU1IZnRmdWtrTWxMZnpYRmFZV0RwbjkrQlBJWGYxNmdnZVQxMEZ4?=
 =?utf-8?B?L2VCZnpSVDhsdGlVanMzSUJ3aXZWSUJ1Vm1aRUVoVmk0L2REM1E0Vjhqb3dn?=
 =?utf-8?B?SVJ1YWtEY0FXTlpCaGpxRFQxZ1d4ZVZydE1oY0crVitKMmJ1enZZZz09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c47a0698-38bc-45a1-8c73-08df0a69e614
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:50:05.9122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOT5Ml7BMToFGCcjwUEAYfmgVtyxEQWgQ/zUVl3ogWQZInfrle7LjqJg7x5Rjbg8r7id+55EH3YcuuZcW1ngeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6867

Hi Krzysztof,

Please find my replies inline below.

On 18/8/2026 4:27 pm, Krzysztof Kozlowski wrote:
> On 06/08/2026 11:25, evon.chiam@altera.com wrote:
>> From: "Chiam, Evon" <evon.chiam@altera.com>
>>
>> Move the Agilex72 SoC and SoCDK device trees from dts/intel to
>> dts/altera. Update the board and SoC compatible strings to use
>> the "altr" vendor.
>>
>> Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
>> ---
>>   arch/arm64/boot/dts/altera/Makefile                            | 3 ++-
>>   arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72.dtsi    | 2 +-
>>   .../boot/dts/{intel => altera}/socfpga_agilex72_socdk.dts      | 2 +-
>>   arch/arm64/boot/dts/intel/Makefile                             | 1 -
>>   4 files changed, 4 insertions(+), 4 deletions(-)
>>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72.dtsi (98%)
>>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72_socdk.dts (84%)
> 
> Everything there is altera, except Keembay, so moving only one file is
> quite a confusion.
> 
> Feel free to move ALL altera files (or none as this is just a churn),
> but you should keep dtbs_install unaffected (as not broken).
> 
> 
Will drop the Agilex72-only DTS move from this series in v2. Moving only 
one file is confusing, as you noted. I will send a separate series to 
move all SoCFPGA DTS files from dts/intel to dts/altera, while keeping 
dtbs_install unaffected.

>>
>> diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
>> index 540bb5ae746b..a1a9ccba5334 100644
>> --- a/arch/arm64/boot/dts/altera/Makefile
>> +++ b/arch/arm64/boot/dts/altera/Makefile
>> @@ -1,5 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>> -dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_stratix10_socdk.dtb \
>> +dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex72_socdk.dtb \
>> +				socfpga_stratix10_socdk.dtb \
>>   				socfpga_stratix10_socdk_emmc.dtb \
>>   				socfpga_stratix10_socdk_nand.dtb \
>>   				socfpga_stratix10_swvp.dtb
>> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
>> similarity index 98%
>> rename from arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
>> rename to arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
>> index c29c2afcaab7..354c775f577b 100644
>> --- a/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
>> +++ b/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
>> @@ -7,7 +7,7 @@
>>   #include <dt-bindings/interrupt-controller/irq.h>
>>   
>>   / {
>> -	compatible = "intel,socfpga-agilex72";
>> +	compatible = "altr,socfpga-agilex72";
> 
> And this is not fine. You are stuck with what you added, especially that
> you added it recently and this was conscious choice of using "intel"
> instead of "altr".
> 
Agreed — I'll keep the existing compatible strings and drop the change 
in v2.

> Best regards,
> Krzysztof


Thanks and best regards,
Evon
