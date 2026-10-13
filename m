Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010001.outbound.protection.outlook.com [52.101.193.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E524B0488;
	Tue, 13 Oct 2026 06:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872559; cv=fail; b=EWbG6CI0Iys7z01XaLTcoBmT1tzsmkThgBKMVFJs2ZlD38YxLpJQMoGWs3Lrp51AH/NQ90G5UOr00jdpNKYu4xQC4+P8P4WVVSr3iU3dnV8Pu7E8QUqQWcRvK6bfK1QBMGV7Npx5DEYQTY+SF1w08PEmm3qyDx47pDYGyyomuT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872559; c=relaxed/simple;
	bh=fvhR4seOdNVRaCE7lASaSn5RKyynwfWgOerekccgOto=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pg2GK8Ym+QReL9l4rJryla1UzD1bTS2M8cBpCKOAwGUk2Zp4yV7GOP9PPXpCTqQ/SQnUm1QRc+156e+gf3JfMwKGBVuezb0furve5ZQug7Hg90/PwrYNvQzuXHxbwCXdM4DU/gLYHRbJNi0H8gj7ze33b5UPckhD1Cy2VwkKNsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=IvRjNTi7; arc=fail smtp.client-ip=52.101.193.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="IvRjNTi7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsZODIGZA7IaCHYuUzqHqoO9LCP+JDTXfo7Z04WMswK40t1afRTJ++S7yqTxYymn7urakExfrOJ7hTy77lvJPPB3e8yEcN7LfKuD7gxE2W0qdDZwYGEdyWL2UcZcq1rivwnkyexlgQ9BONe3fOidKDMUHI0rmkzhQj1t+OP9hy0Fxh2N8Deq2teg12Zz1iUZSec7k92cKBLmHtIVJlXN/a+zH+9HRWGulD8tZkpS2APQvgME0Llszhg67qFMQRO6Vc1wd4QJkAPgp9wRqn5QErUoDVAiETTSKbWyIeQploH3raQDzw/tdvHW4J5pHuOSiu1c3lcc8AkOnVpfcTZOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqlcHnz/EaGNkx4FMk3LaMZGiT+b1IdEzDSi+gKX0oY=;
 b=MgLcXJoay6wApKL29jHw5Am5fBgH3j6kZt0LDaLcas6w7qpCdrQSj9BpE8Dfaqy3q87jRJkN9xOfuBR98Lc8GQxKrzfszkaCeqs6ZMylBTxxXP89VvUs7fKh4guUwQU3k/mUTiwtcoXX8NB8rcaoM6pOR044GjO8rj+BY92+8A8IjHd4FB1qcpglpHiNvTZxE2KBr+8KW1S4BuL9cswCzFCi22YNLfq6CEJeuvbI3QA9eJ1k8mmkXZ5nddUzs5I9QwGfapmxYoII8aAZXoO87Euu87rr5g1vMnITBVX9xkzEOp25+ZGN5Kr9+RIANMm16RDoJkmlULab/lprxt3viQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqlcHnz/EaGNkx4FMk3LaMZGiT+b1IdEzDSi+gKX0oY=;
 b=IvRjNTi7Q4S/k/T3RRcQ50HjfeP50xpTi+6h+8YNV0PTGYbtiEA5uMp9PViFidLdbVQEGmFUrOD0mmuNMjDOBTvjbgR9B6fPsx6CFvYh0AEaXoOeNZaBTSCKmfrtNiJKcRObY3b9DikOcjNQQvMSzlE0lh3qBvNF6J1tPjQ1tumawzSkXautbVsxU1QmBH3jLFDOGWDLD2wDRSFLsrPM0mC1z0WEFt19w+Ig8OGaTuSxKNRusXRGpybqhhYooqD7fb2XdsIS+JT0JbA3vJlogDxkJ9DzKBP/yKjYEVpiJ3unLRebW/svYEeOl9LO1h7i6+rF+nI02MYnCQSlUEg9cg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by PH4PPFF50C802AD.namprd03.prod.outlook.com (2603:10b6:518:1::61b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 06:22:36 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 06:22:36 +0000
Message-ID: <6076b13f-d068-44f5-8791-cf3dbcb2cae7@altera.com>
Date: Tue, 13 Oct 2026 14:22:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: socfpga: agilex: register the SP timer clocks
 early
To: Dinh Nguyen <dinguyen@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1790935401.git.adrian.ho.yin.ng@altera.com>
 <b0214433cf10ebc094c6685f60a12abe58860523.1790935401.git.adrian.ho.yin.ng@altera.com>
 <5b7d5543-5608-40fa-be5d-92600c2c9e70@kernel.org>
Content-Language: en-US
From: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <5b7d5543-5608-40fa-be5d-92600c2c9e70@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: JH0PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::14) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|PH4PPFF50C802AD:EE_
X-MS-Office365-Filtering-Correlation-Id: 1af9922f-f46e-4185-948e-08df28f25f68
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	ChWZt1E0CWJWswRNkd0YN7Zszm51L8+FQzMv4ugDIoCb/mKEKYCDPO+m0u3hkDiTt9pqiacI7g5h8uFOBhxl9hR+mwwEdrLFehoYrtmiczTq6TAHMG2K6Vc3dsAA0Cu7okouGQ6JcIG/ITsDaX/qbVmSnijHpnzjZINRjoIt1PCHaDHTJ0yRJIml5LnzdKhB39HZY/4KSomhGWU469gTFw8M1q/r6u5CcSALeeDl8FjqtqxBvvuSMFJdSD21YZcLKsEKXULtJLJ9O+/B8mIzoLA2nzVKh9esvBnOgU5Gq9hkos0OJniKsJr/SFASJrPp29Y8JgThShIKvgOdN9pPhnG9aDj4nBBoOVxC4NhWJyX3ZnXMjUTS9/j6xGxpaeKzzJZnqdDe7TM0kTybL25qr7V5E3w/mVKj0Ijxv4H7LX/yf2dZzzy91VEsP6pjN6m2zGEziFVtaf4wuTUqHxvTm5CyIsKvnog6l1iHy7OxRJGgwfYdNdPPNRPlZwQRN2W7tZU/7Zkhe4/caVfnBrpSFLnhvGUJxsURrQAuYfUz69cA4NDriOdOD9t5/FsYUJlE6o0C8ml2pZ1OrjUMytqF+A/AbsDIbPk+hruTiCwiNBgHWKIZDu2QrB9/EN+TMKn3lWBhQPeP0PMP9zpfN5icA+QEN/5xB0OELbj5zlQUz0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXNlbkxxSnd3NDQ4YlZHUmxhK1NjcjBsejVFSzhSb2kzdWF3S25tSDIreVZt?=
 =?utf-8?B?clVuSm5wQkJab1p2VUJja2xIZkh5OTY5TTVCWWM3UjR2U3dCOVk1eW5ZZlJM?=
 =?utf-8?B?eDViRS9CRmFrcHVNWWZPU0ovekZsRWlzdVhCVjZOSGlPZ1lFMTluQ2w0VFdC?=
 =?utf-8?B?WlNqcnRHamdzeWlWd2tGUE5KRmhSdUFORDRXUm1aMXpiN1ZPWitSSHJIMHVx?=
 =?utf-8?B?OUF0d2x5K2pGNkp0L0tqNkV5cGgzNFltd1ZVSXhYeFc4TnZuOHNMaWplbU5w?=
 =?utf-8?B?Ly9RMVJKbUc5N0lMQkdISXJhc0hzZDBoTWFjWU5yVzVqSWs2MmlIRTRBT2Nx?=
 =?utf-8?B?UWpDVjBsTVdMTURQcDhNWkVtYmpEVS8yV0ZFNGtEVGZTZXV2a2dEM0pBMnhC?=
 =?utf-8?B?azRXM0c4NzdwSlBKeTlOT3J1alA2dnRROGpmTlgxZFNsalE5NThpNzVNZWlQ?=
 =?utf-8?B?TEI2VkdraFIzVVhZclNFbmJkQkVQWFp0Ny9hU2h2MVJxTkxKNThDQ0E4Vmtl?=
 =?utf-8?B?WHBYZ1hoM0JzL1d1V014VldDOE4xaktRK3pCelBneTROd0gvWGdZOUZ3S0JX?=
 =?utf-8?B?b1Y3RjczOFhYemU1TC9JUEpFbGNoMGRlV2VwVlhzSUdJNUovdTJ0bTNFVEVH?=
 =?utf-8?B?VmEzT3o4d0FWRlZtakxTY1kwRklVTklNSllsdEhXU1RnL1N5dVhCUUlZdGR1?=
 =?utf-8?B?dlpmZm5VYU9CWCt6YnhQbWVJUEVVQzhSZ0JpMDF4SUpOMXhpQm1PYU1WOVNJ?=
 =?utf-8?B?dmVUWU4rWWI3blJvdjl3K0daVEd5V003SFRQckJQTUUxTE5hQ3VuN0EwbTZX?=
 =?utf-8?B?eTZMMWhqRTBuMjE1OWJKL0M5YXV4MWFoNGRvN1VNaW1wdWlJckFURHZPZHBJ?=
 =?utf-8?B?VkFJQm5zd3ArRkJVcWlBSGx5WFNLRGZKODhoenQyV2NvUkFMdVdNUzRNYWhU?=
 =?utf-8?B?ZHdSODgySzBXSFBGaFYyV0U0ekhocHFSajU2TXE3MFhoNWhZc1JVemtkMzZF?=
 =?utf-8?B?SXRJRHVlZmZPVUxHeHVzbTN5TEQ0aFlZTDlXM3h6bGpmdnpYeXB6VHM3bGdF?=
 =?utf-8?B?NEM5TitMdCt3cGd4Z09oOHEvUmlKcHl5ZXhJV0lUMDZNbWJINW83NWtRMEpM?=
 =?utf-8?B?bXM3aDJGK3JaZisxRDY3WFgxc0ZYQyt1RllTaStERUJ5TVB1WEEwaDJQeDdL?=
 =?utf-8?B?SURpZ0x2WkhEUjZBS0NEdnFBZFlmaWRTNlNpMlpPUCsya1RaL2JUTDBaVTZJ?=
 =?utf-8?B?d2syYnBLWWRjM3JVamdqcDNVaGVZaGJrSXRKa3FacENuT2ZhVE8xUklvbkk4?=
 =?utf-8?B?QXhNWnRZc1ZpeFkxL1Z0clJPWEg4RmRxc3NHTWVyMnV0ZmJEa2FLY0NMSlIx?=
 =?utf-8?B?NEF2VDgrWlprdCswM3RaMFArc1VWVGtJck8vckpZU1lRdHFwYUdXU3B4VUFB?=
 =?utf-8?B?cVZsSmhDWGp5bld1Y20zWm9zTEtpSTZJSEt4cHN0VkFiUUt0M090T2ZETWhh?=
 =?utf-8?B?RzU0cjBMUzVFVXFyRU1WNHNxVmJ5ckdzeFJEZlVZRGJZdXhyMDlSZU5Lenpz?=
 =?utf-8?B?UEVQM0VrZkkvM09jVHZ6SHVNejRwUDRva1E0dER1MGdVcnJXRHRvNlRJS0JZ?=
 =?utf-8?B?eno0M2tGM1l4aVAyb2Q1U3hRZEdKdlo2K2FVSHVUWGNaLzE1Vlk4d24zRmlM?=
 =?utf-8?B?ZWdVai9YeWtHK2x0dE4rMjA5eUtPaGd4SFVZbmYyRUhjZWp2SlRsOUV5VTlp?=
 =?utf-8?B?a25VRksyUkorT3k4YXlzTjFEZnlhR3kzQ1JHRytIWXE1V1d4eDdrU1lOREtO?=
 =?utf-8?B?M2JhQXIxNHErMnQ4QjdQR2lDZXRvT3paTlIyWmo0U3F1amVkZ2toaFNOUjh6?=
 =?utf-8?B?M2JVSk1XOGxkc3Bob0JJZkVSQXdEVHVKK3dTakVNY2ZrUFZMMWNwK09pYVJH?=
 =?utf-8?B?aU5HODdIdFVlbWpjNHJOeldtZEVxVFlUWFNVclFvN2VBU0NkYmxMQTFlSEY1?=
 =?utf-8?B?NkRvdkptZnNWRStqc1R6NmtHRzFWSmQ4a2JLZ2RUZjlta2lIZ1RIeW5wMklT?=
 =?utf-8?B?ZGx1SmNRYVA1TnczRzVXQUJvZUhqdWhBSkptOEk4Q0RPQ1Qxalk1eVBLQXlz?=
 =?utf-8?B?bGM4elRoRERscXNIQ21OcERFOWRLUGFDYW5xcC9rTHN2TXlSTlB0RXorYTlV?=
 =?utf-8?B?ZzlXVTdoYzhyMkYwSVhSMGVhZUVhbGhxeFN6QjUzMkRDWWFQTlh4RGoyMG9T?=
 =?utf-8?B?MUViTmNRUFl4aW5iaHZsYkxEelMrK05JYnVqdWFTUEdlR1dSWnlhL0lUbGUv?=
 =?utf-8?B?WnB4NmkwSVZnb1VlaDJhV1krOFdObXZMTnFyaUpyWVVmTSt2b0piOVlneDVS?=
 =?utf-8?Q?8t0dvTU8frZAPdkY=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af9922f-f46e-4185-948e-08df28f25f68
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 06:22:36.1133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acGbNZY5YARx30q4OMJxoJBXu10Z6Ff4JRyKAvaudfABkTotgp9KMG/ytNRaTrnUQUVjVeE8SJ6o9NjbRpuZ05ctmJBdIsRljPq/XDPruAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH4PPFF50C802AD


On 10/13/2026 5:53 AM, Dinh Nguyen wrote:
>
>
> On 10/2/26 05:22, Adrian Ng Ho Yin wrote:
>> The DW APB timers are probed through TIMER_OF_DECLARE() from time_init()
>> and cannot defer, but the clock manager is a platform driver registered
>> at core_initcall(). The timer's clk_get() therefore fails and the timer
>> is never brought up.
>>
>> Register only l4_sp_clk and its parents (boot_clk, main_pll, periph_pll,
>> main_pll_c1, peri_pll_c1 and noc_free_clk) from of_clk_init() using
>> CLK_OF_DECLARE_DRIVER(), with every other clock left as -EPROBE_DEFER.
>> The remaining clocks are still registered when the platform driver
>> probes, which reuses the early provider.
>>
>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>> ---
>>   drivers/clk/socfpga/clk-agilex.c | 222 +++++++++++++++++++++++--------
>>   1 file changed, 169 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/clk/socfpga/clk-agilex.c 
>> b/drivers/clk/socfpga/clk-agilex.c
>> index 2bdea1997b5e..91a80b7b1886 100644
>> --- a/drivers/clk/socfpga/clk-agilex.c
>> +++ b/drivers/clk/socfpga/clk-agilex.c
>> @@ -4,7 +4,9 @@
>>    */
>>   #include <linux/slab.h>
>>   #include <linux/clk-provider.h>
>> +#include <linux/io.h>
>
> WHy do you need this include? Comment applies to all 3 patches.
> The rest looks good to me.

Hi Dinh,

Thanks for the review.
The include line was left over from the v1 submission. I'll drop it in V3.

Thank You

Adrian

>
> Dinh
