Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023105.outbound.protection.outlook.com [40.107.44.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8727441760;
	Wed,  8 Apr 2026 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658758; cv=fail; b=izj4SsSZV2eSIpUKr06CfUPVeDyUgxTHSyE6zgLKvqwT4+HL4M3052TyeOBtlZy4d0mcUeArBgy44altZDD6vJag3GPVJ4aSth7crtlZ0zna1OReu+4daKumJT1dLDR55ThmzQLtJQoXrxXAOsB4SJQ4DNlAStfAA3xmQx/7MFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658758; c=relaxed/simple;
	bh=Lc1liOYEdutc5t/wEBwmIgR34TeiGtyb2sr5mkj/Ojk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gxq/Cph4JilnVFeeNYFomIUubrnti/5KjmhFESaTdCoafsjbLqAnATBHGqn6a9iNcqZ4sJTISLJsfoDCMNbn/+f6eCHhJZwC8w03BIWA2PXP0AyEKOR2cN9X3+ajJ+aSnoNJUDtK+YHVEujGDE0OHxgHRzjJrcIS2A5QNCeVODk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=B0lQEHHm; arc=fail smtp.client-ip=40.107.44.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="B0lQEHHm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pj56mhMC5AtGSnuYAprcBuBgUnZ5H6+OGnUzoiu/ekpY0WkMzfo/csicP+Fcp96A8uPa6HIowh+V/cZzt9kuoUOokz8a1i7xn1awy12CgAsydLoHey3gSa7tfdNdW66Dhd4I1Cep2ou0v4srg2JSsBAl6das6fUvi8GAOlgoEOL2OG43jYQYu7iFZ6NbiHzPLAXOCnCxNOl0LaaZHSCCyfYVMXmFM/le7VvYLJQj47nIPrQHmT29vkDaCJinx9DiCZbkB+b1D1sf/gOosQ+POelD30WbIHQECNIvY9/b0AQmqTqIByZxwauhuLHA847ac0zwS0QlYRzuInjaISRjlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpjcHFd0bYYdcqsDxF9aC3At2UjOBN9Xd7JUk1a2S1s=;
 b=h0v9hTGSkOsH/KUkUfOlX/AG/lzLsEKiObynu59ry+gEoQy5auXwjl1v44NqpD11lGx1bsEUqziJklo6HwbzwUfgfNld3uY3GUrlS31qcKQjzHc28MZ8lOSFRm4hwykZAfgMkWQq72+uzWVknnkUNXugsEEO0NT+N5/JPdfPZAy9EqdXlspSWzIbBEtR6hwyV9yIljvoxhQMIp9GXF6UrVm8vtNDYkNJIP3496i3kTOnO3ASqbBuP6aMn0bSorZlkC4Etx0tMWDWOliD3B8CtIID9mK8LLov77wSdQQo5CPfqgtn5SLjx9ehIQppQ92B07RcCRTCmLSR3ZkYTW83qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpjcHFd0bYYdcqsDxF9aC3At2UjOBN9Xd7JUk1a2S1s=;
 b=B0lQEHHm0PI72E4WoX0BxMQ6Nk/OI9lxcnIfWLDMDqYCULitWoGMvvd7dIcAK9myIiBuNi2vqNq65x6eEc2GMIU7nnDcPne9/fWvRE9a58c73u5n7Ci22Cldx+mznmlRx5KDaH2RCOYLfA8JL+wUsmCjW7g9YLXOGl94bqpBaVtWMnKLMShbtyUqZ1Pe+pzymXhTDSdGY5NcaVU6CdeDPEHNcfsQL9AcNr64hGKKEraLqLbA8seceNq369k2E/pKOYjF9a6An+FPfed6zH8MbJKhZb4d8CmHSo049GEEYxZXDsdfbniPvBHEpW4kx4CAGY21B0NlUPzUFI+0WegntA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYZPR03MB7228.apcprd03.prod.outlook.com (2603:1096:400:343::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 14:32:30 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 14:32:30 +0000
Message-ID: <76ef272c-e09a-400e-b381-82d7f29760ca@amlogic.com>
Date: Wed, 8 Apr 2026 22:32:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] clk: amlogic: Add basic clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
 <20260209-a9_clock_driver-v1-4-a9198dc03d2a@amlogic.com>
 <89cc0724-32a8-4da5-8070-c128cafcfc82@kernel.org>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <89cc0724-32a8-4da5-8070-c128cafcfc82@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0020.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::10) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYZPR03MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: 32db6b1e-b977-4cef-33e2-08de957baa22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aq1+lHKUYSUp+klm5XiEjpkRnH9zBHI0d+Sv7MMl4AlHQ0WMSeUHWXdduHFryPsUAUgQgBv3UN3jdbVQHv5446Qch2AphpIF6gRkL8Iu2x9hHdX6FOV4wKECWfakZe/cbtF8V9xD29ZeopXL2zPUHpax1aLqKKVQyVo5iEFcUB9hfnVS6sVOfMGAczz17oGOV3+JpjO4it11yYi3LRZxCNdg11bVzeoPZm2/CNBRZU+Z+k6lGUGE95A9GQfajdJHqafZgA8Y3f/p3ptXNci8yie856av2DMA5XWqUKAFnRAzJ+QvA2gGR39+IOx20kgq8hSY0mzW/Z7lYfe1YzHhXN/8Znl0dkXZ+ZRA/SSywDb+/3pdG/wsjkq2R2uxQpfVmmvM/70QBvKIh3EI3bdrN98YBC8A9EpiEmep8iPUJaTsRqjaEkPutxhmpVaeIZPGpnZ5r0464moOp8PFey3xpaf8yKAAbriB9QvoNcQg3mCMEWRl4+3ruPCiuJ+ocxtXAW8LmgyOWNMvqk42Py56weQekfHedUEaUziNISx643cuy9/93GkEBS7Sznydl0wjUz2qdi0dmyiS0TxU7jnLK7gHxQEAjXnU9N1zp5ZQqhqEk54OBztUNe4hJVuBaY/5IWGw+z/KjjUkO1Td40EKUlrcHSsedlPIvVVwBBXZAYpEszM8op0dUJZUzdIrxJSV2m6u4hLLfIqtqxGrAH0ZAvOWXXVT8/r3Aozy6b5A9m4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWlWMEY1Y3hRdmhzUHVnbXZMYThXb21pQmxodSs1REx3Zk84ZFFvenFEYjJj?=
 =?utf-8?B?MExqc055cUhNeVdtSERMc3NzRGQ3NTNTMHNOQStWY0l6VVI1K1hyaUQ3NDZS?=
 =?utf-8?B?Q3pVK1dibUhKb0p1bkpvWXZVRFkyRWwyY3lUWjAzMXNYTFZobnA4MGdXdkN3?=
 =?utf-8?B?TXdRb3RLQlVlejVCaGVFOThIWXRSQ0srSE1ualdrQ09mbmVuaitUeDg1bCtY?=
 =?utf-8?B?M285dU5YbmR2YXN6eS9HL2N2bEpQaUExZ3UzaFE3MWhvVGpMYUJKbHFEWXE0?=
 =?utf-8?B?SWErMWVmb05tRzk5WXRyTkF6cFRETUkrVUFibjlod0ozc2VuaFJuendtK1ox?=
 =?utf-8?B?MWRnRi9IV0txREFLVDhUcmU2SVo4MnNCWnhQRlNtejFQRDgybGdOWFoxUmFw?=
 =?utf-8?B?clhWdU9MK01XdVpDY29tYVRMZDVwbWdIeTg5Sjgrd3I0SGtkMnk1YnZEazdw?=
 =?utf-8?B?d0RRZGFseS9aVkVsVVBCc3Bha2hGUXFhNC9DcGNnaEcrTjNyQW13cUtUSUFl?=
 =?utf-8?B?c0hzUlFWUENyNlFES3lqZWRKWHNUaUNEQ2xUNXJXYTlqUWZCTXdnWTRMNDQv?=
 =?utf-8?B?aDhmS1lPb1BRRXR3ZGNCT1dZc2ltdVdOc1Rka1lTNkZvVFNReTVLQzJHZmU5?=
 =?utf-8?B?QmlDTEtQY2cvU1RUeHVRd3IwcE8rb2ZFUXkwOXV0eHdZWnlabTh1V3pUa0NP?=
 =?utf-8?B?cndqYm1kcUJDNzF3Y3ZFYUkyN3hoUk45UFo3aU8rM1pnaHZUY2tlSHJIMjJn?=
 =?utf-8?B?OU1sV1l0Z29jeVNBMHFUd0tIUUhZMlRzb0NtbE9hTGpWMmtCN05QWlp0NTFr?=
 =?utf-8?B?bU9QdXlUdGxwY3d0b2RFMDBHTXNSK0FCQ0ZwZFpOTjI4TXlFZU9WM0FMUmtl?=
 =?utf-8?B?OWhqRVBWcFZmWXJGNjVtRCtXY1k2QW9URmxpOEI3b3FiZXNqTmdZMTVQdHd4?=
 =?utf-8?B?Q3dUMmNlUUZEeGk4TWlRQm5Qc0g0T1VrUU1JRzRwTmpSUlhTcWFtc0hOdXdF?=
 =?utf-8?B?MTRRYWhUTWVxbnlwMXFpaGtLT3Y0UnFpdUNDcmhQeEJLZ3NNYXFCejZwbVR6?=
 =?utf-8?B?QUxPMnpNbnRTRk04OTR2SHExTzBPZ3lndEZweTFjSWhLYUgrdkJRWEZ1UDRS?=
 =?utf-8?B?SXgybWpPV2cxUHU5MkFBamxuTTY5SGg0S1lwL0tmWEZvdGc5aUJrSnc4RXJH?=
 =?utf-8?B?bEtTWlZsOFRJbHpRSWUwaXA3bFN1b2hSbWZ5VGsxN1E4L0M4NkhscFlKaFAv?=
 =?utf-8?B?cndpL0k1a1JodjMxRUhxQ2pXbEN0Wk9aVklsbXp2V3ZvNm9jeFBFclFEcnpR?=
 =?utf-8?B?US9hazRvZEZKYmZDUmd0Qm9XRHEzQVBPVG5UY1prQklKOFdOU0pYRWMyaEtu?=
 =?utf-8?B?VXUxT0hEUzc1SURZeEh3azlueHNRVmxOZ3l6ZE9rYVNnOVJEa1h4SWo2ak0r?=
 =?utf-8?B?T1VTZEVObTNDZVJ6RWFSWGpXL0p1YUt1d0pJdXU0UWt5VGpBcHBFM2lCQUs1?=
 =?utf-8?B?bzlzUlAxMHRVT0Ftdi9EdzhBR1pVa3RHNENrSzNDOTZISzR4MnptTHl0SVlZ?=
 =?utf-8?B?ZnBrc2hJVDMxZExLVVVZZlo0dFU1dC84Wm0rd0dUNzdHWjRRd0ExYnBSdlpi?=
 =?utf-8?B?NzBnZnNmRUVwcUNBZDR4b1ZVYlVXTVMvamlVYXhDSDhvMDVDV2xZMjNsTDdv?=
 =?utf-8?B?cDIyQU9KSmI4TGJVdC9FUVoyZ0dBaVJzRDcrZFAxdjA0K05OZXl2Z2FrSERr?=
 =?utf-8?B?Y2g4eXM4b2xSeGJ3LzRpSXk1Smo2ZkpCRmovazgwM1NpNnRkNE9yUWM4QnNF?=
 =?utf-8?B?R0x3MmZMSytOYitCNmZDcm5rWEN3YWhwTVU4WnV4L2JiZ1QwalU0ZlRqcG14?=
 =?utf-8?B?M3ZJZVUrWDVmUW1aYlFUTTdsNmRUR3JoS3Qyc1JqQVNHVGx6Z1ZqMDR1TzBX?=
 =?utf-8?B?bjFJaFVBSm1LdlVqYW83WThoUDVvd2lIVzN2OStBbTlmY3RjbmZQd2FxaEYx?=
 =?utf-8?B?NEpEU0luVVp5TmxaVTlKQU1wN0d2ay8wUjlmc1dNZUNBL1l0bGdERUZjN1ZE?=
 =?utf-8?B?c3FoUHdWVlBHNWsveDl6eHZYZHoxVGRGb0pWblhnd2JMM2wxWHJXZGltY2RQ?=
 =?utf-8?B?MWhSN0hWSzd3enh1OHlZd0RjQXQ0OVh1bFJ0bGlsQ1d5S1FnL291SWlOc05J?=
 =?utf-8?B?eFlJSkFGNWUxcUVXa0FMWldBdndCbnIzdVR3OWp1M3hvMlRlcStCeHpOMnVI?=
 =?utf-8?B?NkZtZVErc3NJS012NFZHaWlFcEZEbm1kU0x6WEZmbU1LcFRIYmsvWEp1VEln?=
 =?utf-8?B?K0w0cTRwNVVadHFQbjZZMHpab0dRYUp2UmYraTJldTdDdkFOTGdrQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32db6b1e-b977-4cef-33e2-08de957baa22
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:32:30.3677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mc21J3to0Szd8pZ7gOksjG+5+hmQN+V+OaUxu0wH5DXbAr1lQAFvxBp4cQNjnoiA1/uTckxtwoANRUKVGMpS8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7228

Hi Krzysztof (& ALL),
Thanks for review.

On 2/9/2026 9:17 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 09/02/2026 06:48, Chuan Liu via B4 Relay wrote:
>> From: Chuan Liu <chuan.liu@amlogic.com>
>>
>> Implement core clock driver for Amlogic SoC platforms, supporting
> 
> So how did all existing Amlogic SoC platforms work so far without basic
> clock driver? Really, how?
> 
> You are suppose to grow existing code, not add your completely new
> "basic" driver just because you have it that way in downstream.
> 

Firstly, apologies for the delayed response. I had intended to 
consolidate the V1 review feedback and come back with a clearer plan for 
V2 changes. In the meantime, Martin has provided many detailed and 
valuable suggestions - much appreciated.

The original goal of optimizing the HW based on A9 and introducing a new 
clock driver is to reduce unnecessary complexity in the driver. On A9, 
we optimized the Clock/PLL controller HW to simplify driver performance, 
complexity, memory footprint, and reusability. Improvements on the HW 
side can also help drive corresponding enhancements in the driver:
    - Performance: Encapsulates sub-clock functions, reducing call paths
    - Complexity: Standardized register bits eliminate a large number of
bit definitions (~1/3 of original code is defined register bit [1])
    - Memory: Object-oriented design avoids copy/paste for repeated clocks
    - Reusability: Same controller works across SoCs without driver
changes (or with minimal changes)

The old meson driver required compromises to unify legacy controller
characteristics and driver styles. On A9, we want a fresh start.

> Best regards,
> Krzysztof

-- 
Best regards,
Chuan

