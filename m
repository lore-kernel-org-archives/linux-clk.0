Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011007.outbound.protection.outlook.com [52.101.62.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9402443A88;
	Wed,  2 Sep 2026 10:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344830; cv=fail; b=copRLmLtVr8zKsPWv3iQ4svG7190DzYH/alkbQZdYPraZLs0+CGqSoBHu6DZiD9ma9KGbx0iprqJjMewLrRQmkC4nl/ycO7+CUgJyq5Vlq5+THUGU4i2WSH/HIah92YwuWgZ+FiHf09PH65DPUr2YlutruA7pAFEGOfEYn+33v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344830; c=relaxed/simple;
	bh=x8PD7fSHjvfI7IQ+AF3pyDzBKxrWltWCwm/dK2nZk8Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tIdu6hqawZ3BveAwEeXwBY3lstPz60awCWox/ePXD362RbPaEJLGLBhFc3XcqHEa75ml1xmaV5VZW1HVFY2P/S+EojMGlAPH/+RXZClS7xGX64hyGAOsF7Py34s5mK3G7t8ghalJe4kWJHho6FlRWrN94yu64I0agcPkKNmn3h8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=RnyUvohM; arc=fail smtp.client-ip=52.101.62.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="RnyUvohM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhV1v68zwZiS7J8B+2lEi6hHtVzIw7chm+JKyQtiyMxH+pBSrIvNyjgiIMGGJsm07JP/1bfGuFHOhOCN/VjGLjGzVnLnFUu/Sa71+qQL4N2mXViuiV7bmiCMAlTJsvTI8SuBbgUqBI87VICulxy76Aj3yGRDH0v9nvDFYYkghI1327tA0XUa60OP7SNu0eb+lR0HkWSy/hjCMT9+N6uja9n9eUQrB6NBAaL/ytaS7ViRj4B9paplFpuJRkWlXrmtx4KV3pQxypD3TMv+vALEyWsi26kCgSP/3dvHRScB9RNqo31Yy2rYOUaybrWp9EDWtJUty6Emq6d5pPFVJzwUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/5g186tZK4joJ/jJvxA3zA+OV+Bi+FRFWXgmNz2JYw=;
 b=S1pLCxZJ9o2vISJpLEV0n+JAPoWKk22V0hsfkDIRMzIkYIdS55a4qmKs3xqB9McLReoUVCQkhfFiG5YnyLwC3Wj8ITMXjvhnm2BYl+XWTsLuyNghACzrCyly1jdGvWrm68NNBRS/NXlmQWJYUWRrOCGZa+hZWisEN+Sofc5pT8rDVCOEA1LMDz1z+g37syPcyBxmCnQ6F0B3WzcDmM5tYYW5fVBsciuoTHlnaxgEk1IA4JIhRyKRT3Z3veKZzjYFScEnbc6b3zLlSF6zdOST1HQmnCmxucd9i/Bj/YQ0fbXBV+uOxUcE7ULbIkavhB/BOqvI6FHHn6LFGIsjBDR4ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/5g186tZK4joJ/jJvxA3zA+OV+Bi+FRFWXgmNz2JYw=;
 b=RnyUvohMI1oV1g6Kfde3IesCjH/XfN2sWmJCZ7N4MTsylg8N+WxdzbW3OFSfzyY7zUwp5hNUPAUlh3f6rN1BsEk157VdA8p4b5TyvSavV907liDMgjbfnl+lnyFWEk303ZjrF2DdP/XoDKUFLWBuvBgNVkD2RCvlme4K5gx4aMXJpHtlL2xzsf+1ueNBO4invvavFJSbBZygPRfIiPDWM+oa8XyCs83ecb9L8lc6CyFaW8kw0SU+fyldoSWvr+vBOBTdq1KX46AiPikbvHtiC7sygXgCTfnznDelZdHh2wSsJPQxdtB57wHqlkPEEDJgXSa8ZiryrVAGZY7Dpjm3zA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by IA1PR03MB8216.namprd03.prod.outlook.com (2603:10b6:208:5b2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 10:26:59 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 10:26:59 +0000
Message-ID: <2653e469-f1cd-4b8b-8876-0422d8f1ed88@altera.com>
Date: Wed, 2 Sep 2026 18:26:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: socfpga: agilex72: add clock manager driver for
 Agilex72
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lothar Rubusch <l.rubusch@gmail.com>,
 Ng Tze Yee <tzeyee.ng@altera.com>,
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1786006669.git.evon.chiam@altera.com>
 <97675c0efd40a9407b6b1a1941cc73b73dd45d39.1786006669.git.evon.chiam@altera.com>
 <anoNlNlJlGyv1Mli@redhat.com>
Content-Language: en-US
From: "Chiam, Evon" <evon.chiam@altera.com>
In-Reply-To: <anoNlNlJlGyv1Mli@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:a03:255::33) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|IA1PR03MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 8645bd06-7da6-40a5-bfff-08df08dcb83d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|366016|376014|55112099003|22082099003|18002099003|3023799007|56012099006|10067099003|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	AqLPf6lnguhjAdjwM2LbQh5f3xOUXw5qLw2KlN1JM0VmaJ4llUC+E1U5Mgxe7QI0usQVN1ZtngKsCvw23WdC26cUyp9Q4NNmyPB3pUf60IkVsFCj36m/yqdxYhFgRTI6BLlQ8dUrZGJan83lS96t4gW3T5uUpuffXA9V3oV6G5nu86Vv/HXNesqQf9q2/6dOMxiGY5/aXddw9m24tkT5rxw0TSSVBVkleLMkBl8mk65MpO5o7sFweG/vNSH94PnOWyEDwqai7V+JiBLe5jLIoLWTLYOyIMMOZy65cfbLQkxFLcmbL5MecseiCggvSKTlYr+szjyiwvOB1l4FxO/G0AlDCfXRXdnfxeChM5Fn3kfccWCj/cC8ccYJ5Sz/xp9nOZie0x1iSD/YKmJ+kiNN7Kukou2o/law4ARfj+/iNs6GTyJjzdu/smJV2JctgRAVxGfDwv0GXOd1v2HEsT6d+ZCDUnSwk6VEP1AyR7qo/8loE1yAp+CiLO7iAqIeB7NwRn+B/YoqA9oaOiPEXUyrx3B8VQw82S6zFbm016h2ij8m6xkFPnrgPqFww7IfRC+CUq7akTARHMJJDHbUwrYDYz2tt6ic4XACzKU5dXixFHcdJo5ZxrCtPCvMDbQzdBJcS5xdR+pGmf3e1hxC5rDo0Gy4vOfTEV/RSQOUufu1HYE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(366016)(376014)(55112099003)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003)(6133799003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDNtMXdRMzM3b0lCbHNnbTJnRGkwb29BTHUzU0dHSEhqY0FDRExmMUtTSEdX?=
 =?utf-8?B?YkYxN1dFbW83VUJDdU5mR3dFMEpKbGF6djVRNi91L09ZVzZRbmhyZy9QQlpv?=
 =?utf-8?B?UWhWdmt4Zk1xeDFBRVZMWCtjU1FLQTNWWXBTT1dmTTZFckswQUI2aFdzYVpu?=
 =?utf-8?B?Rm1WdTRzb1dRKzhhYzluUzVXMCtPSEVZNGtFWGRmR040VlJpTjdaQ2dxT2I3?=
 =?utf-8?B?UUFtZkdvenRaN1VBVlNKZFVreFRBaHhrVFhxMWZsV2dTYmVlV29ETnpNb200?=
 =?utf-8?B?dUJqT3FqQnBwVzNOWEVoUitGQ3Y0UDJtdjFaL3o0am1oTDcrNHBocTU4VDBo?=
 =?utf-8?B?UFRUazYxelR2UC9Hb3VwQm95SmVTWkhLSzBpK01FUXFPRXhJWEFHNCsyQ3B3?=
 =?utf-8?B?U3pyaVB2bTgzelpDR05TUU1IQVBWcXFhZ1IweTJkMkNTV1hlMjc1QThKTjl0?=
 =?utf-8?B?VE83bmRtUFVMTDA4VWhKYS9KZkw1TVlJMUNVaWxnTWgrYTZ5OGtBYW16WFdC?=
 =?utf-8?B?a1g3aHVsbUZKbnNCZUcwcldXMkFWMGlXamdHVXgwR2w1Nis1VEZzUWVtNVdC?=
 =?utf-8?B?ODc3NGtYY1BhMmxjRjNiQ3MvQ29BSEpUZms5Ukl2S3hncFBTNGhla2RBR2tT?=
 =?utf-8?B?L0pTUEN5QTlQckkzWmF0K1ViWHhxTDk1WXlmQS95TTgvWG1qalpNYXQwOGFn?=
 =?utf-8?B?d2NlTFJ4cFFwR3ovRHdYd2FBZnVCa1F0Q2NDYjJPUWZCUDdIVUN1WlZWYTdk?=
 =?utf-8?B?YmZ6dFZadGtCWGtySG9oQUxET1lHVnQ1VU9tWVI1elEvSUVYRlNuYTBqTk8v?=
 =?utf-8?B?R0lBWUZ1Y29xSk1YK0ZZYTc4MU4vcERsNXplb0xvTnhXcmhENU16S3VwM29B?=
 =?utf-8?B?UFE0V1I2K0ZVODVoeEc4NUlUdHBzT3NqMGhqUENSeWtOaG5uZ2FTSmtjRzZr?=
 =?utf-8?B?RndNcDd4UUY5cDlkOHJtUVg4M3o5TmlMZ1JpZ3BiWUsycHpSMjRBTFJpMTY3?=
 =?utf-8?B?WG10RkEzZndIeDdhd3JyQ0NxV0ladHhGeHYrYXhoQTJvS3BPcUJuMTRjS3Z5?=
 =?utf-8?B?ckRvWGVlM2RKOUovNHNjK09CWGkwSkp2cmVLbCtqT3BHMENoeEVBRFoxSzZC?=
 =?utf-8?B?ckJaOS9BNkpyOUE2L1hYSXZDMXZUY09wN3c0WW0rYTNTWFdBS0RNOUtBLzdh?=
 =?utf-8?B?M2E1cGk0Z1Bqa1VJczR4aHF4eXJlNnVnM29mQWkyOWxwRXYzRVI1bFdyaUsr?=
 =?utf-8?B?OEw1cjB6aUk0a2lFQTNicHFOZFFFNE1SWE15Z3ZnV0FLVktGOThjWnk0bmdC?=
 =?utf-8?B?K1JRZXFLelZpcHkzcDBUN09FZ0ZhRnJlRU5YZlVFZ0pCM2FTT2hlbDZwTFEv?=
 =?utf-8?B?RU03L2U0NjFsbnNYbFNzd0JWNmRvT0NMaXBWVnViK0RnYy9IeUxIcnJ6Tndl?=
 =?utf-8?B?UjJ2aTMyMnhSZFlyRlhnZ1pkTnJtcW1URElUTkdVZDV5Qk1lM1hTM1FhWFcr?=
 =?utf-8?B?TU81SkxPNjNmeWZMcDIrc2ZLb054VWNNMUg3bnY5bXJCZUNZV0N5d0hJcWFh?=
 =?utf-8?B?aUNaaS96MHRyU3lUaWhWdXAySGpXSjdBV1FXdjlqWGRTYlBzV0dyV1ovclNH?=
 =?utf-8?B?UUwrcTNISHZiY3d1aVdRS1NWSVBwbnNOZ2RwZS9YdWlRSHR5ak9RdTJ1Q3Ay?=
 =?utf-8?B?SWhJMmEwdVNYUEhCaXd2dTBxaWdOM0I4SmRzSmllUkVZU2c3K2RsQjdPZlVE?=
 =?utf-8?B?M3VQa0JCNzRkQy9TV2d1QmNOQitpZytqQkJJc2RlbU9yYnoxTHVIRjlUVWR4?=
 =?utf-8?B?Q0J0QW9VWnRBNlJlY2FGQmp6SEhhT3NadE9xNUxyeCthbTNJRXBvaTlST2Nz?=
 =?utf-8?B?ZWNaZkt5RjJYeDF6Ykl6UEJFdDlBSUtELzdQT2hwTVAyeEJJSlY3SngvazFi?=
 =?utf-8?B?Tnk5K1BWbkNXNVZHRG1RSS82cGZEVkY2QmhQL0d6Z2RxWkhiZFVxd1FVbGJu?=
 =?utf-8?B?MGZoc3NLZEZQUWNSbjNWVG1raFIwM3JpL3RvMWRNSXloOU1tdUYzQUdneTdq?=
 =?utf-8?B?N2JTWlRpVEN6TGFHZjN0ZFMxY1VpVmN6Um1QbCtGWktDWkFrT1ZEVzVKQUoy?=
 =?utf-8?B?YXdwVW4rdDVYemk1c0FZL1hNU01ZMUNscit4WXN3UFFFckxqTVpneFJlQzB5?=
 =?utf-8?B?KzlRNG9kNi85dCtVVlhTSmZ5Qy9zTE1aN1l3Nm1jM0cwdjk1N0hhZjZiMnpS?=
 =?utf-8?B?SFlmMUlGRTI0Q3hEVUxabXdzdkkyeGVvKzBoemtaWkxvTitJRkVYY0JxcHR5?=
 =?utf-8?B?WWptMDZpcGdSbDJsL0pmNDJqRVpjOWF6TjNPUThQbVArcG1LeHJCUT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8645bd06-7da6-40a5-bfff-08df08dcb83d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 10:26:59.0129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFFvTU0gob4xGn+3eFGHk6Er1HtL6q6qjL8G7FrCxl0wz05WF++88eb0ZUrXSChehenylgSI0+fXY30BEUMbDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8216

Hi Brian,

Please find my replies inline below.

On 11/8/2026 1:42 am, Brian Masney wrote:
> Hi Evon,
> 
> I just did a quick scan and this isn't a thorough review.
> 
> On Thu, Aug 06, 2026 at 05:25:03PM +0800, evon.chiam@altera.com wrote:
>> From: "Chiam, Evon" <evon.chiam@altera.com>
>>
>> Add new Clock manager driver to support new Altera Agilex72 platform
>>
>> Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
>> ---
>>   MAINTAINERS                        |    5 +
>>   drivers/clk/socfpga/Kconfig        |    3 +-
>>   drivers/clk/socfpga/Makefile       |    2 +-
>>   drivers/clk/socfpga/clk-agilex72.c | 1181 ++++++++++++++++++++++++++++
>>   drivers/clk/socfpga/clk-agilex72.h |   91 +++
>>   5 files changed, 1280 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/clk/socfpga/clk-agilex72.c
>>   create mode 100644 drivers/clk/socfpga/clk-agilex72.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 15011f5752a9..1b850dc3d6b6 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3581,6 +3581,11 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
>>   F:	drivers/media/platform/samsung/s5p-mfc/
>>   
>> +ARM/SOCFPGA AGILEX72 CLOCK DRIVER
>> +M:	Chiam, Evon <evon.chiam@altera.com>
>> +S:	Maintained
>> +F:	drivers/clk/socfpga/clk-agilex72.[ch]
>> +
>>   ARM/SOCFPGA ARCHITECTURE
>>   M:	Dinh Nguyen <dinguyen@kernel.org>
>>   S:	Maintained
>> diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
>> index d88277e2a898..40cac9428fbe 100644
>> --- a/drivers/clk/socfpga/Kconfig
>> +++ b/drivers/clk/socfpga/Kconfig
>> @@ -13,7 +13,8 @@ config CLK_INTEL_SOCFPGA32
>>   	default ARM && ARCH_INTEL_SOCFPGA
>>   
>>   config CLK_INTEL_SOCFPGA64
>> -	bool "Intel Stratix / Agilex / N5X / Agilex5 clock controller support" if COMPILE_TEST && (!ARM64 || !ARCH_INTEL_SOCFPGA)
>> +	bool "Intel Stratix / Agilex / N5X / Agilex5 / Agilex72 clock controller support" \
>> +		if COMPILE_TEST && (!ARM64 || !ARCH_INTEL_SOCFPGA)
>>   	default ARM64 && ARCH_INTEL_SOCFPGA
>>   
>>   endif # CLK_INTEL_SOCFPGA
>> diff --git a/drivers/clk/socfpga/Makefile b/drivers/clk/socfpga/Makefile
>> index a1ea2b988eaf..97af3dfdbbad 100644
>> --- a/drivers/clk/socfpga/Makefile
>> +++ b/drivers/clk/socfpga/Makefile
>> @@ -3,4 +3,4 @@ obj-$(CONFIG_CLK_INTEL_SOCFPGA32) += clk.o clk-gate.o clk-pll.o clk-periph.o \
>>   				     clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
>>   obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-s10.o \
>>   				     clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o \
>> -				     clk-agilex.o clk-agilex5.o
>> +				     clk-agilex.o clk-agilex5.o clk-agilex72.o
>> diff --git a/drivers/clk/socfpga/clk-agilex72.c b/drivers/clk/socfpga/clk-agilex72.c
>> new file mode 100644
>> index 000000000000..e350d8a9bb4d
>> --- /dev/null
>> +++ b/drivers/clk/socfpga/clk-agilex72.c
>> @@ -0,0 +1,1181 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2026, Altera Corporation
>> + */
>> +#include <linux/slab.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/io.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/string.h>
>> +#include <dt-bindings/clock/altr,agilex72-clkmgr.h>
>> +#include "clk-agilex72.h"
>> +
>> +#define EMAC_BYPASS_OFFSET          0x10
>> +#define CLK_MGR_FREE_SHIFT          16
>> +#define CLK_MGR_FREE_MASK           0x7
>> +#define PERI_CLK_CNT_DIV_WIDTH      11
>> +#define BOOTCLKSRC_MASK             0x2000000
>> +#define BOOTCLKSRC_SHIFT            25
>> +#define SOCFPGA_PLL_POWER           0
>> +#define BOOT_CLK                    "boot_clk"
>> +#define CLK_MGR_PLL_CLK_SRC_SHIFT   27
>> +#define CLK_MGR_PLL_CLK_SRC_MASK    0x3
>> +#define PLL_RATE_REG_OFFSET         0x4
>> +#define PLL_CR_N_HI_MASK            0xFF
>> +#define PLL_CR_N_LO_MASK            0x1FE00
>> +#define PLL_CR_N_LO_SHIFT           9
>> +#define PLL_CRHI_M_MASK             0x1FF00000
>> +#define PLL_CRHI_M_SHIFT            20
>> +#define PLL_CR_C_MASK               0xFF
>> +#define PLL_CR_BYPASS_DIV_MASK      0x100
>> +#define PLL_FRACT_DIV_REG_OFFSET    0x5c
>> +#define PLL_CR_FRACT_DIV_MASK       0xFFFFFF
>> +
>> +static bool agilex72_gate_is_emac(const char *name);
>> +static u8 agilex72_parent_index(const char * const *parents,
>> +				size_t num_parents, const char *parent_name);
>> +static unsigned long agilex72_boot_clk_recalc_rate(struct clk_hw *hwclk,
>> +						   unsigned long parent_rate);
>> +static unsigned long agilex72_clk_pll_recalc_rate(struct clk_hw *hwclk,
>> +						  unsigned long parent_rate);
>> +static unsigned long agilex72_peri_c_clk_recalc_rate(struct clk_hw *hwclk,
>> +						     unsigned long parent_rate);
>> +static unsigned long
>> +agilex72_clk_peri_cnt_clk_recalc_rate(struct clk_hw *hwclk,
>> +				      unsigned long parent_rate);
>> +static unsigned long agilex72_gate_clk_recalc_rate(struct clk_hw *hwclk,
>> +						   unsigned long parent_rate);
>> +static u8 agilex72_boot_get_parent(struct clk_hw *hwclk);
>> +static u8 agilex72_clk_pll_get_parent(struct clk_hw *hwclk);
>> +static u8 agilex72_peri_c_clk_get_parent(struct clk_hw *hwclk);
>> +static u8 agilex72_clk_periclk_get_parent(struct clk_hw *hwclk);
>> +static u8 agilex72_gate_get_parent(struct clk_hw *hwclk);
> 
> Don't use the forward declaration... just define the functions before
> they are needed and in the right order.
> 
Will fix this in v2.
>> +
>> +/* External parent clocks come from DT via fw_name */
>> +static const char * const boot_pll_parents[] = {
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +};
>> +
>> +static const char * const gppll0_clk_parents[] = {
>> +	"osc1",
>> +	"cb-intosc-div10-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const gppll1_clk_parents[] = {
>> +	"osc1",
>> +	"cb-intosc-div10-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const gppll2_clk_parents[] = {
>> +	"osc1",
>> +	"cb-intosc-div10-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +/* Core free muxes */
>> +static const char * const comp0_free_mux[] = {
>> +	"gppll1-c0",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const core2_free_mux[] = {
>> +	"gppll2-c0",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const core3_free_mux[] = {
>> +	"gppll2-c1",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const dsu_free_mux[] = {
>> +	"gppll1-c1",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const ccu_free_mux[] = {
>> +	"gppll0-c0",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const hsp_noc_free_mux[] = {
>> +	"gppll0-c0",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const lsp_noc_free_mux[] = {
>> +	"gppll0-c1",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const trace_free_mux[] = {
>> +	"gppll0-c2",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const emaca_free_mux[] = {
>> +	"gppll0-c0",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const emacb_free_mux[] = {
>> +	"gppll0-c0",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const emac_ptp_free_mux[] = {
>> +	"gppll0-c0",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const gpio_db_free_mux[] = {
>> +	"gppll0-c1",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const usb31_free_mux[] = {
>> +	"gppll0-c0",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const s2f_user0_free_mux[] = {
>> +	"gppll0-c1",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const s2f_user1_free_mux[] = {
>> +	"gppll0-c1",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const xspi_phy_clk_mux[] = {
>> +	"gppll0-c3",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +static const char * const memdevice_phy_clk_mux[] = {
>> +	"gppll0-c3",
>> +	"osc1",
>> +	"cb-intosc-div2-clk",
>> +	"f2s-free-clk",
>> +};
>> +
>> +/* Secondary muxes between free_clk and boot_clk */
>> +static const char * const comp0_mux[] = {
>> +	"comp0_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const core2_mux[] = {
>> +	"core2_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const core3_mux[] = {
>> +	"core3_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const mpu_mux[] = {
>> +	"dsu_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const ccu_mux[] = {
>> +	"ccu_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const hsp_noc_mux[] = {
>> +	"hsp_noc_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const lsp_noc_mux[] = {
>> +	"lsp_noc_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const cs_at_mux[] = {
>> +	"lsp_noc_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const cs_pdbg_mux[] = {
>> +	"lsp_noc_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const cs_trace_mux[] = {
>> +	"trace_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const emac_mux[] = {
>> +	"emaca_div_clk",
>> +	"emacb_div_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const emac_ptp_mux[] = {
>> +	"emac_ptp_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const gpio_db_mux[] = {
>> +	"gpio_db_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const usb31_mux[] = {
>> +	"usb31_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const s2f_user0_mux[] = {
>> +	"s2f_user0_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const s2f_user1_mux[] = {
>> +	"s2f_user1_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const xspi_mux[] = {
>> +	"xspi_phy_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const char * const memdevice_phy_mux[] = {
>> +	"memdevice_phy_free_clk",
>> +	BOOT_CLK,
>> +};
>> +
>> +static const struct agilex72_pll_clock pll_clks[] = {
>> +	{
>> +		.id = AGILEX72_BOOT_CLK,
>> +		.name = BOOT_CLK,
>> +		.parent_names = boot_pll_parents,
>> +		.num_parents = ARRAY_SIZE(boot_pll_parents),
>> +		.offset = 0x4,
>> +	},
>> +	{
>> +		.id = AGILEX72_GPPLL0_CLK,
>> +		.name = "gppll0",
>> +		.parent_names = gppll0_clk_parents,
>> +		.num_parents = ARRAY_SIZE(gppll0_clk_parents),
>> +		.offset = 0x160,
>> +	},
>> +	{
>> +		.id = AGILEX72_GPPLL1_CLK,
>> +		.name = "gppll1",
>> +		.parent_names = gppll1_clk_parents,
>> +		.num_parents = ARRAY_SIZE(gppll1_clk_parents),
>> +		.offset = 0x80,
>> +	},
>> +	{
>> +		.id = AGILEX72_GPPLL2_CLK,
>> +		.name = "gppll2",
>> +		.parent_names = gppll2_clk_parents,
>> +		.num_parents = ARRAY_SIZE(gppll2_clk_parents),
>> +		.offset = 0x60,
>> +	},
>> +};
>> +
>> +static const struct agilex72_perip_c_clock main_perip_c_clks[] = {
>> +	{ AGILEX72_GPPLL0_C0_CLK,
>> +	  "gppll0-c0", "gppll0", 1, 0x24, 23,  0, 8, 8 },
>> +	{ AGILEX72_GPPLL0_C1_CLK,
>> +	  "gppll0-c1", "gppll0", 1, 0x28, 14, 23, 8, 8 },
>> +	{ AGILEX72_GPPLL0_C2_CLK,
>> +	  "gppll0-c2", "gppll0", 1, 0x2c,  0,  9, 8, 8 },
>> +	{ AGILEX72_GPPLL0_C3_CLK,
>> +	  "gppll0-c3", "gppll0", 1, 0x30,  0,  9, 8, 8 },
>> +	{ AGILEX72_GPPLL0_C4_CLK,
>> +	  "gppll0-c4", "gppll0", 1, 0x38,  0,  9, 8, 8 },
>> +	{ AGILEX72_GPPLL0_C5_CLK,
>> +	  "gppll0-c5", "gppll0", 1, 0x3c,  0,  9, 8, 8 },
>> +	{ AGILEX72_GPPLL0_C6_CLK,
>> +	  "gppll0-c6", "gppll0", 1, 0x40,  0,  9, 8, 8 },
>> +	{ AGILEX72_GPPLL1_C0_CLK,
>> +	  "gppll1-c0", "gppll1", 1, 0x24, 23,  0, 8, 8 },
>> +	{ AGILEX72_GPPLL1_C1_CLK,
>> +	  "gppll1-c1", "gppll1", 1, 0x28, 14, 23, 8, 8 },
>> +	{ AGILEX72_GPPLL2_C0_CLK,
>> +	  "gppll2-c0", "gppll2", 1, 0x24, 23,  0, 8, 8 },
>> +	{ AGILEX72_GPPLL2_C1_CLK,
>> +	  "gppll2-c1", "gppll2", 1, 0x28, 14, 23, 8, 8 },
>> +};
>> +
>> +/* Non-SW clock-gated enabled clocks */
>> +static const struct agilex72_perip_cnt_clock main_perip_cnt_clks[] = {
>> +	{ AGILEX72_COMP0_FREE_CLK, "comp0_free_clk",
>> +	  comp0_free_mux, ARRAY_SIZE(comp0_free_mux), 0xbc },
>> +	{ AGILEX72_CORE2_FREE_CLK, "core2_free_clk",
>> +	  core2_free_mux, ARRAY_SIZE(core2_free_mux), 0xb8 },
>> +	{ AGILEX72_CORE3_FREE_CLK, "core3_free_clk",
>> +	  core3_free_mux, ARRAY_SIZE(core3_free_mux), 0xb4 },
>> +	{ AGILEX72_DSU_FREE_CLK, "dsu_free_clk",
>> +	  dsu_free_mux, ARRAY_SIZE(dsu_free_mux), 0xc0 },
>> +	{ AGILEX72_CCU_FREE_CLK, "ccu_free_clk",
>> +	  ccu_free_mux, ARRAY_SIZE(ccu_free_mux), 0xc4 },
>> +	{ AGILEX72_HSP_NOC_FREE_CLK, "hsp_noc_free_clk",
>> +	  hsp_noc_free_mux, ARRAY_SIZE(hsp_noc_free_mux), 0x104 },
>> +	{ AGILEX72_LSP_NOC_FREE_CLK, "lsp_noc_free_clk",
>> +	  lsp_noc_free_mux, ARRAY_SIZE(lsp_noc_free_mux), 0x108 },
>> +	{ AGILEX72_TRACE_FREE_CLK, "trace_free_clk",
>> +	  trace_free_mux, ARRAY_SIZE(trace_free_mux), 0x144 },
>> +	{ AGILEX72_EMAC_A_FREE_CLK, "emaca_free_clk",
>> +	  emaca_free_mux, ARRAY_SIZE(emaca_free_mux), 0x128 },
>> +	{ AGILEX72_EMAC_B_FREE_CLK, "emacb_free_clk",
>> +	  emacb_free_mux, ARRAY_SIZE(emacb_free_mux), 0x12c },
>> +	{ AGILEX72_EMAC_PTP_FREE_CLK, "emac_ptp_free_clk",
>> +	  emac_ptp_free_mux, ARRAY_SIZE(emac_ptp_free_mux), 0x130 },
>> +	{ AGILEX72_GPIO_DB_FREE_CLK, "gpio_db_free_clk",
>> +	  gpio_db_free_mux, ARRAY_SIZE(gpio_db_free_mux), 0x134 },
>> +	{ AGILEX72_USB31_FREE_CLK, "usb31_free_clk",
>> +	  usb31_free_mux, ARRAY_SIZE(usb31_free_mux), 0x140 },
>> +	{ AGILEX72_S2F_USER0_FREE_CLK, "s2f_user0_free_clk",
>> +	  s2f_user0_free_mux, ARRAY_SIZE(s2f_user0_free_mux), 0x138 },
>> +	{ AGILEX72_S2F_USER1_FREE_CLK, "s2f_user1_free_clk",
>> +	  s2f_user1_free_mux, ARRAY_SIZE(s2f_user1_free_mux), 0x13c },
>> +	{ AGILEX72_XSPI_PHY_FREE_CLK, "xspi_phy_free_clk",
>> +	  xspi_phy_clk_mux, ARRAY_SIZE(xspi_phy_clk_mux), 0x154 },
>> +	{ AGILEX72_MEMDEVICE_PHY_FREE_CLK, "memdevice_phy_free_clk",
>> +	  memdevice_phy_clk_mux, ARRAY_SIZE(memdevice_phy_clk_mux), 0x148 },
>> +};
>> +
>> +static const char * const hsp_mp_clk_parent[] = { "hsp_mp_clk" };
>> +static const char * const lsp_main_parent[] = { "lsp_main_clk" };
>> +static const char * const lsp_mp_parent[] = { "lsp_mp_clk" };
>> +static const char * const lsp_sp_parent[] = { "lsp_sp_clk" };
>> +static const char * const usb31_bus_clk_early_parents[] = { "hsp_main_clk" };
>> +static const char * const emaca_div_parents[] = { "emaca_free_clk" };
>> +static const char * const emacb_div_parents[] = { "emacb_free_clk" };
>> +
>> +/* SW Clock gate enabled clocks */
>> +static const struct agilex72_gate_clock gate_clks[] = {
>> +	{ AGILEX72_COMP0_CLK, "comp0_clk", comp0_mux,
>> +	  ARRAY_SIZE(comp0_mux), 0x30, 8, 0, 0, 0, 0x3c, 5, 0 },
>> +	{ AGILEX72_CORE2_CLK, "core2_clk", core2_mux,
>> +	  ARRAY_SIZE(core2_mux), 0x30, 10, 0, 0, 0, 0x3c, 10, 0 },
>> +	{ AGILEX72_CORE3_CLK, "core3_clk", core3_mux,
>> +	  ARRAY_SIZE(core3_mux), 0x30, 11, 0, 0, 0, 0x3c, 11, 0 },
>> +	{ AGILEX72_MPU_CLK, "mpu_clk", mpu_mux,
>> +	  ARRAY_SIZE(mpu_mux), 0x30, 7, 0, 0, 0, 0x3c, 4, 0 },
>> +	{ AGILEX72_CCU_CLK, "ccu_clk", ccu_mux,
>> +	  ARRAY_SIZE(ccu_mux), 0x30, 6, 0, 0, 0, 0x3c, 3, 0 },
>> +	{ AGILEX72_APU_SYS_FREE_CLK, "apu_sys_free_clk", ccu_mux,
>> +	  ARRAY_SIZE(ccu_mux), 0, 0, 0x50, 22, 2, 0x3c, 3, 0 },
>> +	{ AGILEX72_HSP_SYS_FREE_CLK, "hsp_sys_free_clk", hsp_noc_mux,
>> +	  ARRAY_SIZE(hsp_noc_mux), 0, 0, 0x10c, 8, 2, 0xf0, 9, 0 },
>> +	{ AGILEX72_HSP_MAIN_FREE_CLK, "hsp_main_free_clk", hsp_noc_mux,
>> +	  ARRAY_SIZE(hsp_noc_mux), 0, 0, 0, 0, 0, 0xf0, 9, 0 },
>> +	{ AGILEX72_HSP_MAIN_CLK, "hsp_main_clk", hsp_noc_mux,
>> +	  ARRAY_SIZE(hsp_noc_mux), 0xe0, 1, 0, 0, 0, 0xf0, 9, 0 },
>> +	{ AGILEX72_HSP_MP_CLK, "hsp_mp_clk", hsp_noc_mux,
>> +	  ARRAY_SIZE(hsp_noc_mux), 0xe0, 2, 0x10c, 10, 2, 0xf0, 9, 0 },
>> +	{ AGILEX72_HSP_SP_CLK, "hsp_sp_clk", hsp_noc_mux,
>> +	  ARRAY_SIZE(hsp_noc_mux), 0xe0, 3, 0x10c, 12, 2, 0xf0, 9, 0 },
>> +	{ AGILEX72_USB2OTG_HCLK, "usb2otg_hclk", hsp_mp_clk_parent,
>> +	  1, 0xe0, 0, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_LSP_SYS_FREE_CLK, "lsp_sys_free_clk", lsp_noc_mux,
>> +	  ARRAY_SIZE(lsp_noc_mux), 0, 0, 0x10c, 2, 2, 0xf0, 9, 0 },
>> +	{ AGILEX72_LSP_MAIN_FREE_CLK, "lsp_main_free_clk", lsp_noc_mux,
>> +	  ARRAY_SIZE(lsp_noc_mux), 0xe0, 0, 0, 0, 0, 0xf0, 9, 0 },
>> +	{ AGILEX72_LSP_MAIN_CLK, "lsp_main_clk", lsp_noc_mux,
>> +	  ARRAY_SIZE(lsp_noc_mux), 0xe0, 1, 0, 0, 0, 0xf0, 9, 0 },
>> +	{ AGILEX72_LSP_MP_CLK, "lsp_mp_clk", lsp_noc_mux,
>> +	  ARRAY_SIZE(lsp_noc_mux), 0xe0, 2, 0x10c, 4, 2, 0xf0, 9, 0 },
>> +	{ AGILEX72_LSP_SP_CLK, "lsp_sp_clk", lsp_noc_mux,
>> +	  ARRAY_SIZE(lsp_noc_mux), 0xe0, 3, 0x10c, 6, 2, 0xf0, 9, 0 },
>> +	{ AGILEX72_SPIM_0_CLK, "spim_0_clk", lsp_main_parent,
>> +	  1, 0xd0, 11, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_SPIM_1_CLK, "spim_1_clk", lsp_main_parent,
>> +	  1, 0xd0, 12, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_SPIS_0_CLK, "spis_0_clk", lsp_main_parent,
>> +	  1, 0xd0, 13, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_SPIS_1_CLK, "spis_1_clk", lsp_main_parent,
>> +	  1, 0xd0, 14, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_DMA_0_CORE_CLK, "dma_0_core_clk", lsp_main_parent,
>> +	  1, 0xd0, 15, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_DMA_0_HS_CLK, "dma_0_hs_clk", lsp_mp_parent,
>> +	  1, 0xd0, 15, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_DMA_1_CORE_CLK, "dma_1_core_clk", lsp_main_parent,
>> +	  1, 0xd0, 16, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_DMA_1_HS_CLK, "dma_1_hs_clk", lsp_mp_parent,
>> +	  1, 0xd0, 16, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_I3C_0_CORE_CLK, "i3c_0_core_clk", lsp_mp_parent,
>> +	  1, 0xd0, 22, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_I3C_1_CORE_CLK, "i3c_1_core_clk", lsp_mp_parent,
>> +	  1, 0xd0, 23, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_I2C_0_PCLK, "i2c_0_pclk", lsp_sp_parent,
>> +	  1, 0xd0, 17, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_I2C_1_PCLK, "i2c_1_pclk", lsp_sp_parent,
>> +	  1, 0xd0, 18, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_I2C_EMAC0_PCLK, "i2c_emac0_pclk", lsp_sp_parent,
>> +	  1, 0xd0, 19, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_I2C_EMAC1_PCLK, "i2c_emac1_pclk", lsp_sp_parent,
>> +	  1, 0xd0, 20, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_I2C_EMAC2_PCLK, "i2c_emac2_pclk", lsp_sp_parent,
>> +	  1, 0xd0, 21, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_UART_0_PCLK, "uart_0_pclk", lsp_sp_parent,
>> +	  1, 0xd0, 23, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_UART_1_PCLK, "uart_1_pclk", lsp_sp_parent,
>> +	  1, 0xd0, 24, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_UART_2_PCLK, "uart_2_pclk", lsp_sp_parent,
>> +	  1, 0xd0, 25, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_SPTIMER_0_PCLK, "sptimer_0_pclk", lsp_sp_parent,
>> +	  1, 0xd0, 29, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_SPTIMER_1_PCLK, "sptimer_1_pclk", lsp_sp_parent,
>> +	  1, 0xd0, 30, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_CS_AT_CLK, "cs_at_clk", cs_at_mux,
>> +	  ARRAY_SIZE(cs_at_mux), 0xe0, 4, 0x10c, 24, 2, 0xf0, 9, 0 },
>> +	{ AGILEX72_CS_PDBG_CLK, "cs_pdbg_clk", cs_pdbg_mux,
>> +	  ARRAY_SIZE(cs_pdbg_mux), 0xe0, 4, 0x10c, 28, 2, 0xf0, 9, 0 },
>> +	{ AGILEX72_CS_TRACE_CLK, "cs_trace_clk", cs_trace_mux,
>> +	  ARRAY_SIZE(cs_trace_mux), 0xe0, 4, 0x10c, 26, 2, 0xf0, 10, 0 },
>> +	{ AGILEX72_EMACA_DIV_CLK, "emaca_div_clk", emaca_div_parents,
>> +	  1, 0, 0, 0x118, 8, 2, 0, 0, 0 },
>> +	{ AGILEX72_EMACB_DIV_CLK, "emacb_div_clk", emacb_div_parents,
>> +	  1, 0, 0, 0x118, 10, 2, 0, 0, 0 },
>> +	{ AGILEX72_EMAC0_CLK, "emac0_clk", emac_mux,
>> +	  ARRAY_SIZE(emac_mux), 0xd0, 0, 0, 0, 0, 0x100, 26, 0 },
>> +	{ AGILEX72_EMAC1_CLK, "emac1_clk", emac_mux,
>> +	  ARRAY_SIZE(emac_mux), 0xd0, 1, 0, 0, 0, 0x100, 27, 0 },
>> +	{ AGILEX72_EMAC2_CLK, "emac2_clk", emac_mux,
>> +	  ARRAY_SIZE(emac_mux), 0xd0, 2, 0, 0, 0, 0x100, 28, 0 },
>> +	{ AGILEX72_EMAC_PTP_CLK, "emac_ptp_clk", emac_ptp_mux,
>> +	  ARRAY_SIZE(emac_ptp_mux), 0xd0, 3, 0, 0, 0, 0xf0, 2, 0 },
>> +	{ AGILEX72_GPIO_DB_CLK, "gpio_db_clk", gpio_db_mux,
>> +	  ARRAY_SIZE(gpio_db_mux), 0xd0, 4, 0x114, 0, 16, 0xf0, 3, 1 },
>> +	{ AGILEX72_USB31_SUSPEND_CLK, "usb31_suspend_clk", usb31_mux,
>> +	  ARRAY_SIZE(usb31_mux), 0xe0, 7, 0x118, 12, 6, 0xf0, 7, 1 },
>> +	{ AGILEX72_USB31_BUS_CLK_EARLY, "usb31_bus_clk_early",
>> +	  usb31_bus_clk_early_parents, 1, 0xe0, 7, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_S2F_USER0_CLK, "s2f_user0_clk", s2f_user0_mux,
>> +	  ARRAY_SIZE(s2f_user0_mux), 0xd0, 27, 0, 0, 0, 0xf0, 4, 0 },
>> +	{ AGILEX72_S2F_USER1_CLK, "s2f_user1_clk", s2f_user1_mux,
>> +	  ARRAY_SIZE(s2f_user1_mux), 0xd0, 28, 0, 0, 0, 0xf0, 5, 0 },
>> +	{ AGILEX72_XSPI_PCLK, "xspi_pclk", lsp_mp_parent,
>> +	  1, 0xd0, 9, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_XSPI_CLK, "xspi_clk", xspi_mux,
>> +	  ARRAY_SIZE(xspi_mux), 0xd0, 9, 0x110, 8, 2, 0xf0, 14, 0 },
>> +	{ AGILEX72_XSPI_PHY_CLK, "xspi_phy_clk", xspi_mux,
>> +	  ARRAY_SIZE(xspi_mux), 0xd0, 9, 0x110, 8, 2, 0xf0, 14, 0 },
>> +	{ AGILEX72_SDMMC0_SDPHY_REG_CLK, "sdmmc0_sdphy_reg_clk",
>> +	  lsp_mp_parent, 1, 0xd0, 5, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_SDMMC1_SDPHY_REG_CLK, "sdmmc1_sdphy_reg_clk",
>> +	  lsp_mp_parent, 1, 0xd0, 7, 0, 0, 0, 0, 0, 0 },
>> +	{ AGILEX72_SDMMC0_SDMCLK, "sdmmc0_sdmclk", memdevice_phy_mux,
>> +	  ARRAY_SIZE(memdevice_phy_mux), 0xd0, 5, 0x110, 4, 2, 0xf0, 15, 0 },
>> +	{ AGILEX72_SDMMC1_SDMCLK, "sdmmc1_sdmclk", memdevice_phy_mux,
>> +	  ARRAY_SIZE(memdevice_phy_mux), 0xd0, 7, 0x110, 6, 2, 0xf0, 15, 0 },
>> +	{ AGILEX72_SDMMC0_PHY_CLK, "sdmmc0_phy_clk", memdevice_phy_mux,
>> +	  ARRAY_SIZE(memdevice_phy_mux), 0xd0, 5, 0x110, 4, 2, 0xf0, 15, 0 },
>> +	{ AGILEX72_SDMMC1_PHY_CLK, "sdmmc1_phy_clk", memdevice_phy_mux,
>> +	  ARRAY_SIZE(memdevice_phy_mux), 0xd0, 7, 0x110, 6, 2, 0xf0, 15, 0 },
>> +};
>> +
>> +static const struct clk_ops clk_boot_ops = {
>> +	.recalc_rate = agilex72_boot_clk_recalc_rate,
>> +	.get_parent = agilex72_boot_get_parent,
>> +};
>> +
>> +static const struct clk_ops clk_gppll_ops = {
>> +	.recalc_rate = agilex72_clk_pll_recalc_rate,
>> +	.get_parent = agilex72_clk_pll_get_parent,
>> +};
>> +
>> +static const struct clk_ops peri_c_clk_ops = {
>> +	.recalc_rate = agilex72_peri_c_clk_recalc_rate,
>> +	.get_parent = agilex72_peri_c_clk_get_parent,
>> +};
>> +
>> +static const struct clk_ops peri_cnt_clk_ops = {
>> +	.recalc_rate = agilex72_clk_peri_cnt_clk_recalc_rate,
>> +	.get_parent = agilex72_clk_periclk_get_parent,
>> +};
>> +
>> +static const struct clk_ops gateclk_ops = {
>> +	.recalc_rate = agilex72_gate_clk_recalc_rate,
>> +	.get_parent  = agilex72_gate_get_parent,
>> +};
> 
> Since this is a gate, should enable/disable be implemented?
> 
Will be implementing enable/disable in v2.
>> +
>> +static bool agilex72_gate_is_emac(const char *name)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(gate_clks); i++) {
>> +		switch (gate_clks[i].id) {
>> +		case AGILEX72_EMAC0_CLK:
>> +		case AGILEX72_EMAC1_CLK:
>> +		case AGILEX72_EMAC2_CLK:
>> +			if (strcmp(name, gate_clks[i].name) == 0)
>> +				return true;
>> +			break;
>> +		default:
>> +			break;
>> +		}
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static u8 agilex72_parent_index(const char * const *parents,
>> +				size_t num_parents, const char *parent_name)
>> +{
>> +	for (size_t i = 0; i < num_parents; i++) {
>> +		if (strcmp(parents[i], parent_name) == 0)
>> +			return (u8)i;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static unsigned long agilex72_boot_clk_recalc_rate(struct clk_hw *hwclk,
>> +						   unsigned long parent_rate)
>> +{
>> +	return parent_rate;
>> +}
>> +
>> +static unsigned long agilex72_clk_pll_recalc_rate(struct clk_hw *hwclk,
>> +						  unsigned long parent_rate)
>> +{
>> +	struct agilex72_pll *socfpgaclk =
>> +		container_of(hwclk, struct agilex72_pll, hw.hw);
>> +	unsigned long long vco_freq;
>> +	u32 reg, cr_n_hi, cr_n_lo, crhi_m, n_div, cr_fract_div_ratio;
>> +	bool bypass;
>> +
>> +	reg = readl(socfpgaclk->pll_base + PLL_RATE_REG_OFFSET);
>> +	bypass = (reg & PLL_CR_BYPASS_DIV_MASK);
>> +
>> +	cr_n_hi = reg & PLL_CR_N_HI_MASK;
>> +	cr_n_lo = (reg & PLL_CR_N_LO_MASK) >> PLL_CR_N_LO_SHIFT;
>> +	crhi_m  = (reg & PLL_CRHI_M_MASK)  >> PLL_CRHI_M_SHIFT;
>> +
>> +	reg = readl(socfpgaclk->pll_base + PLL_FRACT_DIV_REG_OFFSET);
>> +	cr_fract_div_ratio = reg & PLL_CR_FRACT_DIV_MASK;
>> +
>> +	/* 0 represents the value 256. */
>> +	if (!cr_n_hi)
>> +		cr_n_hi = 256;
>> +	if (!cr_n_lo)
>> +		cr_n_lo = 256;
>> +
>> +	n_div = bypass ? 1 : cr_n_lo + cr_n_hi;
>> +
>> +	/* bypass: vco = parent_rate * (crhi_m + cr_fract_div_ratio / 2^24) / 1
>> +	 * normal: vco = parent_rate * (crhi_m + cr_fract_div_ratio / 2^24) / n_div
>> +	 * Rearranged to avoid floating point:
>> +	 *   num = parent_rate * (crhi_m * 2^24 + cr_fract_div_ratio)
>> +	 *   vco = num / (n_div * 2^24)
>> +	 */
>> +	vco_freq  = (unsigned long long)parent_rate *
>> +		    (((unsigned long long)crhi_m << 24) + cr_fract_div_ratio);
>> +	vco_freq /= (unsigned long long)n_div << 24;
>> +	return (unsigned long)vco_freq;
>> +}
>> +
>> +static unsigned long agilex72_peri_c_clk_recalc_rate(struct clk_hw *hwclk,
>> +						     unsigned long parent_rate)
>> +{
>> +	struct agilex72_periph_clk *socfpgaclk =
>> +		container_of(hwclk, struct agilex72_periph_clk, hw.hw);
>> +	u32 reg, crhi_c, crlo_c, c_div;
>> +	bool bypass;
>> +
>> +	reg    = readl(socfpgaclk->div_reg);
>> +	bypass = (reg >> socfpgaclk->div_hi_shift) & PLL_CR_BYPASS_DIV_MASK;
>> +
>> +	crlo_c = (reg >> socfpgaclk->div_lo_shift) & PLL_CR_C_MASK;
>> +	crhi_c = (reg >> socfpgaclk->div_hi_shift) & PLL_CR_C_MASK;
>> +
>> +	/* 0 represents the value 256. */
>> +	if (!crhi_c)
>> +		crhi_c = 256;
>> +	if (!crlo_c)
>> +		crlo_c = 256;
>> +
>> +	c_div = bypass ? 1 : crhi_c + crlo_c;
>> +
>> +	return parent_rate / c_div;
>> +}
>> +
>> +static unsigned long
>> +agilex72_clk_peri_cnt_clk_recalc_rate(struct clk_hw *hwclk,
>> +				      unsigned long parent_rate)
>> +{
>> +	struct agilex72_periph_clk *socfpgaclk;
>> +	unsigned long div;
>> +
>> +	socfpgaclk = container_of(hwclk, struct agilex72_periph_clk, hw.hw);
>> +	div = readl(socfpgaclk->hw.reg);
>> +	div &= GENMASK(PERI_CLK_CNT_DIV_WIDTH - 1, 0);
>> +	div += 1;  /* actual divisor is field_value + 1 */
>> +
>> +	return parent_rate / div;
>> +}
>> +
>> +static unsigned long agilex72_gate_clk_recalc_rate(struct clk_hw *hwclk,
>> +						   unsigned long parent_rate)
>> +{
>> +	struct agilex72_gate_clk *socfpgaclk = container_of(hwclk,
>> +		struct agilex72_gate_clk, hw.hw);
>> +	u32 div = 1, val;
>> +
>> +	if (socfpgaclk->div_reg) {
>> +		val = readl(socfpgaclk->div_reg) >> socfpgaclk->div_shift;
>> +		val &= GENMASK(socfpgaclk->div_width - 1, 0);
>> +		if (socfpgaclk->div_linear)
>> +			div = val + 1;      /* linear encoding: field_value + 1 */
>> +		else
>> +			div = (1 << val);   /* log2 encoding: 2^field_value */
>> +	}
>> +	return parent_rate / div;
>> +}
>> +
>> +static u8 agilex72_boot_get_parent(struct clk_hw *hwclk)
>> +{
>> +	struct agilex72_pll *socfpgaclk = container_of(hwclk,
>> +		struct agilex72_pll, hw.hw);
>> +	u32 pll_src;
>> +	u8 parent;
>> +
>> +	pll_src = readl(socfpgaclk->hw.reg);
>> +	parent = (pll_src & BOOTCLKSRC_MASK) >> BOOTCLKSRC_SHIFT;
>> +	return parent;
>> +}
>> +
>> +static u8 agilex72_clk_pll_get_parent(struct clk_hw *hwclk)
>> +{
>> +	struct agilex72_pll *socfpgaclk =
>> +		container_of(hwclk, struct agilex72_pll, hw.hw);
>> +	u32 pll_src;
>> +	u8 parent;
>> +
>> +	pll_src = readl(socfpgaclk->hw.reg);
>> +	parent = (pll_src >> CLK_MGR_PLL_CLK_SRC_SHIFT) &
>> +		 CLK_MGR_PLL_CLK_SRC_MASK;
>> +	return parent;
>> +}
>> +
>> +static u8 agilex72_peri_c_clk_get_parent(struct clk_hw *hwclk)
>> +{
>> +	/* Peripheral C clocks (GPPLL output clocks) have a single fixed parent
>> +	 * (the GPPLL itself), so the parent index is always 0.
>> +	 */
>> +	return 0;
>> +}
>> +
>> +static u8 agilex72_clk_periclk_get_parent(struct clk_hw *hwclk)
>> +{
>> +	struct agilex72_periph_clk *socfpgaclk;
>> +	u32 clk_src;
>> +	u8 parent = 0;
>> +
>> +	socfpgaclk = container_of(hwclk, struct agilex72_periph_clk, hw.hw);
>> +
>> +	if (socfpgaclk->hw.reg) {
>> +		clk_src = readl(socfpgaclk->hw.reg);
>> +		parent = (clk_src >> CLK_MGR_FREE_SHIFT) & CLK_MGR_FREE_MASK;
>> +	}
>> +	return parent;
>> +}
>> +
>> +static u8 agilex72_gate_get_parent(struct clk_hw *hwclk)
>> +{
>> +	struct agilex72_gate_clk *socfpgaclk =
>> +		container_of(hwclk, struct agilex72_gate_clk, hw.hw);
>> +	void __iomem *bypass_reg = socfpgaclk->bypass_reg;
>> +	u32 mask, bypass_val, second_bypass;
>> +	u8 parent = 0;
>> +	const char *name = clk_hw_get_name(hwclk);
>> +
>> +	if (!bypass_reg)
>> +		return parent;
>> +
>> +	mask = (0x1 << socfpgaclk->bypass_shift);
>> +	bypass_val = readl(bypass_reg);
>> +	parent = ((bypass_val & mask) >> socfpgaclk->bypass_shift);
>> +
>> +	if (agilex72_gate_is_emac(name)) {
>> +		/*
>> +		 * EMAC clocks have a second bypass layer in a register
>> +		 * EMAC_BYPASS_OFFSET bytes below the main bypass register:
>> +		 *   bit 0: emaca path is bypassed to boot_clk (only when primary
>> +		 *          parent selects emaca, i.e. parent == 0)
>> +		 *   bit 1: emacb path is bypassed to boot_clk (only when primary
>> +		 *          parent selects emacb, i.e. parent == 1)
>> +		 */
>> +		u8 bootclk_bypass =
>> +			agilex72_parent_index(emac_mux, ARRAY_SIZE(emac_mux),
>> +					      "boot_clk");
>> +		/*
>> +		 * The second EMAC bypass register is always EMAC_BYPASS_OFFSET (0x10)
>> +		 * below the primary bypass register. For all EMAC clocks the primary
>> +		 * bypass_reg is regbase+0x100, so this gives regbase+0xf0 which is
>> +		 * within the mapped clkmgr window.
>> +		 */
>> +		second_bypass = readl(bypass_reg - EMAC_BYPASS_OFFSET);
>> +		if (second_bypass & 0x1)
>> +			if (parent == 0) /* only applicable if parent is emaca */
>> +				parent = bootclk_bypass;
>> +
>> +		if (second_bypass & 0x2)
>> +			if (parent == 1) /* only applicable if parent is emacb */
>> +				parent = bootclk_bypass;
>> +	}
>> +
>> +	return parent;
>> +}
>> +
>> +static struct clk_hw *
>> +agilex72_register_pll(const struct agilex72_pll_clock *clks,
>> +		      void __iomem *base, void __iomem *pll_base)
>> +{
>> +	struct clk_hw *hw_clk;
>> +	struct agilex72_pll *pll_clk;
>> +	struct clk_init_data init;
> 
> This is uninitialized.
> 
> struct clk_init_data init = {};
> 
Will fix this in v2.

>> +	const char *name = clks->name;
>> +	int ret;
>> +
>> +	pll_clk = kzalloc_obj(*pll_clk);
>> +	if (!pll_clk)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	if (strcmp(name, BOOT_CLK) == 0) {
>> +		init.ops = &clk_boot_ops;
>> +	} else {
>> +		pll_clk->pll_base = pll_base;
>> +		init.ops = &clk_gppll_ops;
>> +	}
>> +
>> +	pll_clk->hw.reg = base + clks->offset;
>> +
>> +	init.name = name;
>> +	init.flags = 0;
>> +	init.num_parents = clks->num_parents;
>> +	init.parent_names = clks->parent_names;
> 
> parent_names is deprecated. Use parent_data instead.
> 
Will update to use parent_data in v2.

>> +	pll_clk->hw.hw.init = &init;
>> +	pll_clk->hw.bit_idx = SOCFPGA_PLL_POWER;
>> +	hw_clk = &pll_clk->hw.hw;
>> +
>> +	ret = clk_hw_register(NULL, hw_clk);
> 
> Use devm_ variants throughout where possible.
> 
Will update to use devm_ variants in v2.

>> +	if (ret) {
>> +		kfree(pll_clk);
>> +		return ERR_PTR(ret);
>> +	}
>> +	return hw_clk;
>> +}
>> +
>> +static struct clk_hw *
>> +agilex72_register_periph(const struct agilex72_perip_c_clock *clks,
>> +			 void __iomem *pll_base)
>> +{
>> +	struct agilex72_periph_clk *periph_clk;
>> +	struct clk_init_data init;
>> +	const char *name = clks->name;
>> +	struct clk_hw *hw_clk;
>> +	int ret;
>> +
>> +	periph_clk = kzalloc_obj(*periph_clk);
>> +	if (!periph_clk)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	periph_clk->div_lo_shift = clks->div_lo_shift;
>> +	periph_clk->div_hi_shift = clks->div_hi_shift;
>> +	periph_clk->div_reg = pll_base + clks->div_offset;
>> +	periph_clk->hw.reg  = pll_base;
>> +
>> +	init.name = name;
>> +	init.ops = &peri_c_clk_ops;
>> +	init.flags = 0;
>> +
>> +	init.num_parents = clks->num_parents;
>> +	init.parent_names = &clks->parent_name;
>> +
>> +	periph_clk->hw.hw.init = &init;
>> +	hw_clk = &periph_clk->hw.hw;
>> +
>> +	ret = clk_hw_register(NULL, hw_clk);
>> +	if (ret) {
>> +		kfree(periph_clk);
>> +		return ERR_PTR(ret);
>> +	}
>> +	return hw_clk;
>> +}
>> +
>> +static struct clk_hw *
>> +agilex72_register_cnt_periph(const struct agilex72_perip_cnt_clock *clks,
>> +			     void __iomem *regbase)
>> +{
>> +	struct clk_hw *hw_clk;
>> +	struct agilex72_periph_clk *periph_clk;
>> +	struct clk_init_data init;
>> +	const char *name = clks->name;
>> +	int ret;
>> +
>> +	periph_clk = kzalloc_obj(*periph_clk);
>> +	if (!periph_clk)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	periph_clk->hw.reg = regbase + clks->offset;
>> +
>> +	init.name = name;
>> +	init.ops = &peri_cnt_clk_ops;
>> +	init.flags = 0;
>> +	init.num_parents = clks->num_parents;
>> +	init.parent_names = clks->parent_names;
>> +	periph_clk->hw.hw.init = &init;
>> +	hw_clk = &periph_clk->hw.hw;
>> +
>> +	ret = clk_hw_register(NULL, hw_clk);
>> +	if (ret) {
>> +		kfree(periph_clk);
>> +		return ERR_PTR(ret);
>> +	}
>> +	return hw_clk;
>> +}
>> +
>> +static struct clk_hw *
>> +agilex72_register_gate(const struct agilex72_gate_clock *clks,
>> +		       void __iomem *regbase)
>> +{
>> +	struct clk_hw *hw_clk;
>> +	struct agilex72_gate_clk *socfpga_clk;
>> +	struct clk_init_data init;
>> +	int ret;
>> +
>> +	socfpga_clk = kzalloc_obj(*socfpga_clk);
>> +	if (!socfpga_clk)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	socfpga_clk->hw.reg = regbase + clks->gate_reg;
>> +	socfpga_clk->hw.bit_idx = clks->gate_idx;
>> +
>> +	socfpga_clk->div_linear = clks->div_linear;
>> +
>> +	if (clks->div_reg)
>> +		socfpga_clk->div_reg = regbase + clks->div_reg;
>> +	else
>> +		socfpga_clk->div_reg = NULL;
>> +
>> +	socfpga_clk->div_width = clks->div_width;
>> +	socfpga_clk->div_shift = clks->div_offset;
>> +
>> +	if (clks->bypass_reg)
>> +		socfpga_clk->bypass_reg = regbase + clks->bypass_reg;
>> +	else
>> +		socfpga_clk->bypass_reg = NULL;
>> +	socfpga_clk->bypass_shift = clks->bypass_shift;
>> +
>> +	init.ops = &gateclk_ops;
>> +
>> +	init.name        = clks->name;
>> +	init.flags       = 0;
>> +	init.num_parents = clks->num_parents;
>> +	init.parent_names = clks->parent_names;
>> +	socfpga_clk->hw.hw.init = &init;
>> +
>> +	hw_clk = &socfpga_clk->hw.hw;
>> +
>> +	ret = clk_hw_register(NULL, &socfpga_clk->hw.hw);
>> +	if (ret) {
>> +		kfree(socfpga_clk);
>> +		return ERR_PTR(ret);
>> +	}
>> +	return hw_clk;
>> +}
>> +
>> +static int
>> +agilex72_clk_register_cnt_perip(const struct agilex72_perip_cnt_clock *clks,
>> +				int nums, struct agilex72_clock_data *data)
>> +{
>> +	struct clk_hw *hw_clk;
>> +	void __iomem *base = data->base[0];
>> +	int i;
>> +
>> +	for (i = 0; i < nums; i++) {
>> +		if (WARN_ON(clks[i].id >= data->clk_data.num)) {
>> +			pr_err("%s: clock %s id %u out of range (max %u)\n",
>> +			       __func__, clks[i].name, clks[i].id,
>> +			       data->clk_data.num);
>> +			continue;
>> +		}
>> +		hw_clk = agilex72_register_cnt_periph(&clks[i], base);
>> +		if (IS_ERR(hw_clk)) {
>> +			pr_err("%s: failed to register clock %s\n", __func__,
>> +			       clks[i].name);
>> +			continue;
>> +		}
>> +		data->clk_data.hws[clks[i].id] = hw_clk;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int agilex72_clk_register_gate(const struct agilex72_gate_clock *clks,
>> +				      int nums, struct agilex72_clock_data *data)
>> +{
>> +	struct clk_hw *hw_clk;
>> +	void __iomem *base = data->base[0];
>> +	int i;
>> +
>> +	for (i = 0; i < nums; i++) {
>> +		if (WARN_ON(clks[i].id >= data->clk_data.num)) {
>> +			pr_err("%s: clock %s id %u out of range (max %u)\n",
>> +			       __func__, clks[i].name, clks[i].id,
>> +			       data->clk_data.num);
>> +			continue;
>> +		}
>> +		hw_clk = agilex72_register_gate(&clks[i], base);
>> +		if (IS_ERR(hw_clk)) {
>> +			pr_err("%s: failed to register clock %s\n", __func__,
>> +			       clks[i].name);
>> +			continue;
>> +		}
>> +		data->clk_data.hws[clks[i].id] = hw_clk;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Return the MMIO base address of the GPPLL whose DT resource name matches
>> + * @name. The names "gppll0", "gppll1", "gppll2" are the resource names used
>> + * in the device tree and map directly to base[1..3] as ioremapped in probe.
>> + * Returns NULL for any clock that has no dedicated PLL register block
>> + * (e.g. BOOT_CLK, which reuses the main clkmgr window via base[0]).
>> + */
>> +static void __iomem *agilex72_pll_get_regbase(const char *name,
>> +					      void __iomem * const *base)
>> +{
>> +	if (!strcmp(name, "gppll0"))
>> +		return base[1]; /* gppll0 DT resource */
>> +	if (!strcmp(name, "gppll1"))
>> +		return base[2]; /* gppll1 DT resource */
>> +	if (!strcmp(name, "gppll2"))
>> +		return base[3]; /* gppll2 DT resource */
>> +	return NULL;
>> +}
>> +
>> +static int
>> +agilex72_clk_register_c_perip(const struct agilex72_perip_c_clock *clks,
>> +			      int nums, struct agilex72_clock_data *data)
>> +{
>> +	struct clk_hw *hw_clk;
>> +	int i;
>> +
>> +	for (i = 0; i < nums; i++) {
>> +		if (WARN_ON(clks[i].id >= data->clk_data.num)) {
>> +			pr_err("%s: clock %s id %u out of range (max %u)\n",
>> +			       __func__, clks[i].name, clks[i].id,
>> +			       data->clk_data.num);
>> +			continue;
>> +		}
>> +
>> +		/*
>> +		 * clks[i].parent_name holds the name of the parent GPPLL
>> +		 * (e.g. "gppll0"), which matches the DT resource name and
>> +		 * therefore the correct MMIO base.
>> +		 */
>> +		void __iomem *pll_base =
>> +			agilex72_pll_get_regbase(clks[i].parent_name, data->base);
>> +
>> +		if (!pll_base) {
>> +			pr_err("%s: no PLL base for clock %s (parent '%s')\n",
>> +			       __func__, clks[i].name, clks[i].parent_name);
>> +			continue;
>> +		}
>> +		hw_clk = agilex72_register_periph(&clks[i], pll_base);
>> +		if (IS_ERR(hw_clk)) {
>> +			pr_err("%s: failed to register clock %s\n", __func__,
>> +			       clks[i].name);
>> +			continue;
>> +		}
>> +		data->clk_data.hws[clks[i].id] = hw_clk;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int agilex72_clk_register_pll(const struct agilex72_pll_clock *clks,
>> +				     int nums, struct agilex72_clock_data *data)
>> +{
>> +	struct clk_hw *hw_clk;
>> +	int i;
>> +
>> +	for (i = 0; i < nums; i++) {
>> +		if (WARN_ON(clks[i].id >= data->clk_data.num)) {
>> +			pr_err("%s: clock %s id %u out of range (max %u)\n",
>> +			       __func__, clks[i].name, clks[i].id,
>> +			       data->clk_data.num);
>> +			continue;
>> +		}
>> +
>> +		/* clks[i].name matches the DT resource name for PLL clocks */
>> +		void __iomem *pll_base =
>> +			agilex72_pll_get_regbase(clks[i].name, data->base);
>> +
>> +		hw_clk = agilex72_register_pll(&clks[i],
>> +					       data->base[0], pll_base);
>> +		if (IS_ERR(hw_clk)) {
>> +			pr_err("%s: failed to register clock %s\n", __func__,
>> +			       clks[i].name);
>> +			continue;
>> +		}
>> +		data->clk_data.hws[clks[i].id] = hw_clk;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int agilex72_clkmgr_init(struct platform_device *pdev)
>> +{
>> +	struct device_node *np = pdev->dev.of_node;
>> +	struct device *dev = &pdev->dev;
>> +	struct agilex72_clock_data *clk_data;
>> +	void __iomem *base[4];
>> +	int i, num_clks;
>> +
>> +	base[0] = devm_platform_ioremap_resource_byname(pdev, "clkmgr");
>> +	if (IS_ERR(base[0]))
>> +		return PTR_ERR(base[0]);
>> +
>> +	base[1] = devm_platform_ioremap_resource_byname(pdev, "gppll0");
>> +	if (IS_ERR(base[1]))
>> +		return PTR_ERR(base[1]);
>> +
>> +	base[2] = devm_platform_ioremap_resource_byname(pdev, "gppll1");
>> +	if (IS_ERR(base[2]))
>> +		return PTR_ERR(base[2]);
>> +
>> +	base[3] = devm_platform_ioremap_resource_byname(pdev, "gppll2");
>> +	if (IS_ERR(base[3]))
>> +		return PTR_ERR(base[3]);
>> +
>> +	num_clks = AGILEX72_NUM_CLKS;
>> +
>> +	clk_data = devm_kzalloc(dev,
>> +				struct_size(clk_data, clk_data.hws, num_clks),
>> +				GFP_KERNEL);
>> +	if (!clk_data)
>> +		return -ENOMEM;
>> +
>> +	clk_data->base[0] = base[0];
>> +	clk_data->base[1] = base[1];
>> +	clk_data->base[2] = base[2];
>> +	clk_data->base[3] = base[3];
>> +	clk_data->clk_data.num = num_clks;
>> +
>> +	for (i = 0; i < num_clks; i++)
>> +		clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
>> +
>> +	/*
>> +	 * Registration order matters: each layer depends on the previous.
>> +	 *   1. PLLs
>> +	 *   2. C-peripheral clocks (GPPLL output clocks)
>> +	 *   3. Cnt-peripheral clocks
>> +	 *   4. Gate clocks
>> +	 */
>> +	agilex72_clk_register_pll(pll_clks, ARRAY_SIZE(pll_clks),
>> +				  clk_data);
>> +
>> +	agilex72_clk_register_c_perip(main_perip_c_clks,
>> +				      ARRAY_SIZE(main_perip_c_clks),
>> +					  clk_data);
>> +
>> +	agilex72_clk_register_cnt_perip(main_perip_cnt_clks,
>> +					ARRAY_SIZE(main_perip_cnt_clks),
>> +					    clk_data);
>> +
>> +	agilex72_clk_register_gate(gate_clks,
>> +				   ARRAY_SIZE(gate_clks), clk_data);
>> +
>> +	/*
>> +	 * usb31_ref_clk is a 1:1 alias of usb31_suspend_clk. The DWC3
>> +	 * controller uses the same source for both its suspend and reference
>> +	 * clock inputs on this SoC. Register it as a fixed-factor (passthrough)
>> +	 * clock so that enabling it propagates to the parent gate without
>> +	 * touching any gate register of its own.
>> +	 */
>> +	clk_data->clk_data.hws[AGILEX72_USB31_REF_CLK] =
>> +		devm_clk_hw_register_fixed_factor(dev, "usb31_ref_clk",
>> +						  "usb31_suspend_clk", 0, 1, 1);
>> +	if (IS_ERR(clk_data->clk_data.hws[AGILEX72_USB31_REF_CLK]))
>> +		return dev_err_probe(dev,
>> +			PTR_ERR(clk_data->clk_data.hws[AGILEX72_USB31_REF_CLK]),
>> +			"failed to register clock usb31_ref_clk\n");
>> +
>> +	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
>> +	return 0;
>> +}
>> +
>> +static int agilex72_clkmgr_probe(struct platform_device *pdev)
>> +{
>> +	int (*probe_func)(struct platform_device *init_func);
>> +
>> +	probe_func = of_device_get_match_data(&pdev->dev);
>> +	if (!probe_func)
>> +		return -ENODEV;
>> +	return probe_func(pdev);
>> +}
>> +
>> +static const struct of_device_id agilex72_clkmgr_match_table[] = {
>> +	{ .compatible = "altr,agilex72-clkmgr",
>> +	  .data = agilex72_clkmgr_init },
>> +	{}
>> +};
>> +
>> +static struct platform_driver agilex72_clkmgr_driver = {
>> +	.probe		= agilex72_clkmgr_probe,
>> +	.driver		= {
>> +		.name	= "agilex72-clkmgr",
>> +		.suppress_bind_attrs = true,
>> +		.of_match_table = agilex72_clkmgr_match_table,
>> +	},
>> +};
>> +
>> +static int __init agilex72_clk_init(void)
>> +{
>> +	return platform_driver_register(&agilex72_clkmgr_driver);
>> +}
>> +core_initcall(agilex72_clk_init);
> 
> Are there specific clocks that require core_initcall()? Can this just
> use module_platform_driver()?
> 
No, there is no clocks that require core_initcall(). This also follows 
the existing socfpga clkmgr drivers (clk-s10.c, clk-agilex.c, 
clk-agilex5.c), which all register at core_initcall() so the provider is 
up before UART/timer consumers probe.

> Brian

Regards,
Evon

