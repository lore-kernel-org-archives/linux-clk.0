Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2091.outbound.protection.outlook.com [40.107.215.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF891F8699;
	Fri, 17 Jan 2025 08:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101676; cv=fail; b=dkStmVMkphgG45MrheLLzsbp/NXHGfbWcRYIpaQcDrj1MGb52JArYfSJZ4g486G5+74tAyak30vKULnsnRcKe/DFvMix1dbC8sWtQr3GRJMDX4lhMwUrtYLo+6PAKNJmXzfaQINsY+b5p6AFYo3hi5vvINZyJ6w4sLMd1r2tYPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101676; c=relaxed/simple;
	bh=QcFpMTKsFM/EuwS0CB2mEorAaLmSGAIHZYAqNX2ZzwM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nqq+lDRRIF201jTqCMIl9jHpp/Lf2Ip/1IUYDgseUAkjGfZrWb/7I1KnOLVW17i4HpGsMvzCyzhF/66s8zHyCWauEpYaj3Xsse1zC1kxLPmn6cc+Fp7E8bRqaO1lQLnv1ag+dFjePdGMM2sTHUs6u0fcj40YqvL9rlUEwXe1QjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=GBarq1Vz; arc=fail smtp.client-ip=40.107.215.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="GBarq1Vz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlbvH3xdIGF16tw8DbbrtTkzzrokjl8vfTRYH8xgOqQiSQ4/enxvmSnnLaWngGwH3TDUJbze+DCd3ZIhjPx1Q8nyHiXI37+50Iy1oGTxDv+nWDedPZVaz3StMQkatgRv2O/dsCLUo9uCunQLzspJTix1GNyw5hFgaesMKBIfJFlYMfkXPhLtuuzLJ561gC5vxZaXgVy4CXOchluDi4I+r0TBa/Mdxq8qmFnFHHAw3e4MJhH/Gg9BGI/55rl3uK9T0aWOdUO4Q40VRw3PsvjcAPxM184r2lwRkZdouqj/HMBjxllc6+ylrVY5QGcstzw7qPw8/pbTBNBK6lOm6cH5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=px5PE0i/CIFts+ZmwyzRpSbvZIIVcymCY0QY9Wd+oBI=;
 b=sl8W6FmwRxCenxqnvA20yuLsUItjFRKq0UU/rJ2ej8mAxtaCzyJxe7ed3zTIPMa0FxJSJ/mdVvsGjZo4gWDTB4v3PmZ+Hy0geDV1+DefJMDq6O9OZEOi/Ijilylyw7/VPPQ76feeWBve+dsOAr5qw6XDl8yhatfzsDChCNjbC1x3zGnE6VJeUMPtX+gRvv6r/Tjik/9sN4VG/dIQm/X7YGJhJB6RXuLVuQE8Ul1tKnFkTJ0SYWew+lfB7ZB+bHrpgc7GX+vnunvl1Aac1zuKyeys8LqAoWVo17GXnC5fAoi4QQVaCxHfYIgJSKFANMtWYLwX42x2qrFXYmzX8YwWAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=px5PE0i/CIFts+ZmwyzRpSbvZIIVcymCY0QY9Wd+oBI=;
 b=GBarq1VztISmLD9Hm3XW5pdS5B/FIQXgZx8/31Kb4DIUffqGODi+Aa8fefibAR3b0g81sdjfE5q18xIvnRgYb2bQSJjyt4R5xfvsHJ0sN1jrgf4uSUnJWiWDQa8a1yLCaTLhE0hrqMD0Kv9t0JXBpYFYm4FhAvHluBTPLywPtHoi+ZMNB9K5AsYSZzDmTCIjND5Ng88X1C44Xo4JXmOdNyaC1TEPUN1GKjNIbdNCCjIbcnXQg9OOYAGNhQLx9yMPgfvku4e8h+tURH+xIzmKJad3QRPB+dQfwp0QMA2HBIvFVMcXC6vDsKMVFVB4sImQVXVpU+s+HQruIBMrWVK4ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYSPR03MB8590.apcprd03.prod.outlook.com (2603:1096:405:88::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 08:14:30 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%6]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 08:14:30 +0000
Message-ID: <dc89a609-5b2b-4cf0-a40d-6c3597d7536b@amlogic.com>
Date: Fri, 17 Jan 2025 16:14:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] clk: meson: t7: add support for the T7 SoC PLL
 clock
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20250108094025.2664201-1-jian.hu@amlogic.com>
 <20250108094025.2664201-5-jian.hu@amlogic.com>
 <1jy0ze7fne.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jy0ze7fne.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::22)
 To KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYSPR03MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f6f3b1-d64d-4902-6a7e-08dd36cef7a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTdpbW5xUWZvUW9wOGpnNmNlL1NCQTVuVis1UStRV2pONnAySkg0ZUJJa1A2?=
 =?utf-8?B?OTllcEhsckNBMjcxWEkyOFRnNXcrVERoelVuMnl2UkFiU1B3THk4WkoxVkpH?=
 =?utf-8?B?a3JzbU41ODdRUzhieEdIU2FHWjU5VHlvQkVFQXFNS0IrRTNkajJicDZhc2dG?=
 =?utf-8?B?WnREZURRZFA5ZzgreGp5MWVWZHFncVo1dHhhK0MvT2xBV1JmYWxsTktKWFQx?=
 =?utf-8?B?dFNnWlRpaVpCNEJPRnBsQnh2OEduZVFWQW5ockdVYVZFaDk0TWxwOUFSTlY5?=
 =?utf-8?B?MURsc1VGWHNaeHRzOEVuaU9QME5mTFhkQ2JPTk84eXFscm9qcVJIRE9BeHFQ?=
 =?utf-8?B?VXRFY1MxQ0lkYXhQMkVjbWF3Y05hajJUcWZRcGtJclFiUCtkSG8vTDA3cnZp?=
 =?utf-8?B?RUxyNzJXeWNVWkdrQlVpNFo5WUszcVR5SG5iMkM3WUxnQXBJc1hXckpYdG1X?=
 =?utf-8?B?cVJtcHZuM2NKSHZlTTZpa1hta20vckozOGduY1YvUEs3MUFsNnc4cDRmUFBG?=
 =?utf-8?B?V2pLeHlOS3cxaUJUS011UVJvRDJHU2xIR21VU3BRYS80MERBclZYd2pjbFJZ?=
 =?utf-8?B?YVBIQWlwdkJ4Wk9QcTRReVA1VVFQNkUvRFRZQS81eU1PTGRVSGRpMGw0Sm9R?=
 =?utf-8?B?OE9GSFhyNjRpc0NTTDJLMFJQRVo3Y0N1Sng4TXRZNkYxSEEyazBvUTIwYUow?=
 =?utf-8?B?dUVOSWs3YkNQMTQ1MTBLNFYvZ1VJbGxHaXdMNnBPWGNPNTlSTDRmYVYwQzMx?=
 =?utf-8?B?K1V0WWdkLzdNVDI3cExoOGFoQ2c0VytYZS9qaUhxSFA5bjBLcGgxZ0kreE40?=
 =?utf-8?B?S3k0VzdCekFObFJrL05DZmwrMjFiNzkwSHF0bGp0QmhNbWlHY2s0V0dWYUU1?=
 =?utf-8?B?L0RmYXM3RzhMVDM4ZzdsT05FaDJ0c1VjNTJFdEdEbHRxZm5wWVpmZHNrYTFN?=
 =?utf-8?B?ZFU0dkRIL2dKakxxdERvTmtNVytFQnVNV0xuMGRlOEZ6eG14dWMxWjNmRlpC?=
 =?utf-8?B?Ulc4UHZnRjF5WkwwNGVkOFE0eVJYcEp2MmRpZjg4RlJDSStWelNEb0VkaDls?=
 =?utf-8?B?anIwQ2ZjbGJGY212RGdKWEdnMjNscHU0djB1TDh2SWVZa0lHNVQrejY4RGR3?=
 =?utf-8?B?dnNmRWYwYjlKelhla0FvVk1tOXhmeW9YSG9MUlJZZWxLcHNMSGk4amREOXBJ?=
 =?utf-8?B?ZUlQODJRQmJEb2FCMTE2RmtzOUlSaGtOQXhJSHo5MmxuSVdGNWF4UVlRTHhB?=
 =?utf-8?B?ampja0lFU0pDT1VnWlJ3ZzBCMktjMkVxZzk5RWh4RGhCakdNcldMU1pKcmlm?=
 =?utf-8?B?T055QnN6YytrQXYzVzRHaWhYYWVyZFBQaFdLU3AxOUhDK2pPZjFHbVdRWlI1?=
 =?utf-8?B?RjBCUFhNdzVudFBOelZpWnpJNW9BbDY0Ykd3dFROa0l6anErNkVKT2V0eGk1?=
 =?utf-8?B?cXNnRjM0S29hWnZwM0x2R3NqOXBEeDA0RHNmd0hGa3QrWXcrb1NoZGYrOTdL?=
 =?utf-8?B?VHFrcXN2c3RVRGRueWdBRmk5Tk1ycFFLNURYY1JvYkFtVkIyZnViZXU4cXlt?=
 =?utf-8?B?WlBsMlJVZCtNVTBzVm93N3AwL3draUUzRnY3blJlU0FZejJtZUdlWHhPaUZT?=
 =?utf-8?B?cUNqQTlmTGhUeS9teEwremMrU08ySkZPcWpoamxZKzdrRDdyUmVVNVlGVERx?=
 =?utf-8?B?WXFoSUszV3BEekYxcFBJWGZydWpZQXM4ckVxY2FzRWpDTVBCYVN6dVBpNHBW?=
 =?utf-8?B?eng5SitKZm9Jb2ZISUE2aVRmcXlSbEVkQmNCVlQ1NlNhOUNUMUZ0VFU1bS9B?=
 =?utf-8?B?Zks2M1NMYnhOanJpUDVoT3ZBdy9oRXNwQzEwNnpGaTZsaDRiTGFpZW80SXM1?=
 =?utf-8?Q?KkXegCrkfVuDG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2NLZHZMVVJPQWFUczFVeExsM0hZamdsRVBhZGtabkhCK050ak9HUEN6Unp0?=
 =?utf-8?B?MVZYNmhpZ3I4c3Bmc21sZzFXejR2Y2J6SElqK1BsQ1pDcjh6eHVSUVZUWW4w?=
 =?utf-8?B?VDlpeDdUVnN5b2RFT3ZvU3VxWUVJVG1IdFpWbXlLeFhGRE5iK2RjZi83MVdH?=
 =?utf-8?B?YkhVVTFleDFvaXNJdngxMXU5TnZHVTIyZG9GSTdVL2ZJRVROKzMzTjhXQ2xL?=
 =?utf-8?B?cksvVVYzNzRxTzhpNVFBR3J0ZEFINXhIU2JnbHFZRDl3VEp6UHhvdUhwU3Mw?=
 =?utf-8?B?WkJ6cjhWcW1GdFlmWTlodG12N3R5MXlIcG9lb0hDU2V1Q0RzTThXbi9BN1pF?=
 =?utf-8?B?TmJzTUVIS1lOclY2bm5IT3BvNzA1L1NsVmtHcEd0MVRGWCtvWXBmUmxaQisx?=
 =?utf-8?B?a1hHbjdmNlQzZDUvRnB0S2l0QWhIUkxocFBkcGE3N0p5ZTgvdWNKZ3lVMlhp?=
 =?utf-8?B?QXdkUE1EenJwUG1OOTBFalczNVBRUFRWN3pHL041QnNVZkptMmM2TGkvY1F4?=
 =?utf-8?B?VmJETkhFNWYrdEE0U0lkc3k2ZHlXWFlsb2JOdDNkQkdYNmFvQ3VHMWdKQ0tJ?=
 =?utf-8?B?RlkxK3Q1UEp4bHlraDBvVDZmWDRYaDJOdGlWTUpxMGZuSUZWcDF0S2JXVitk?=
 =?utf-8?B?Q2ZZTFZmNjFpZlRrQXRkZkJwTkIzN3pYakJCbFZEbjZsaklwTzMzdzcrN3N1?=
 =?utf-8?B?TExUOHorQ0pPU2pHWEE5UGNIcUZEMHV4SXgzYUREajlNcTZkNkJKNnFmN0Yr?=
 =?utf-8?B?N1Vic3VsenVPVm41US9yb0xjS04rcXk4NW55MS9kaUNITHEyRnBsT2dFVUh6?=
 =?utf-8?B?bFZ6WDQ3cUx1Q2s3WUp2eFh0OGQzNENUakdWNGpKVDN2OHhxNjFoaFdaSDdS?=
 =?utf-8?B?NnVTdlFnU1VlKytrS3VoKzBYWFNOUWtYTkxVSWdJamd4UkxLaGhuVlRZQVdB?=
 =?utf-8?B?dGRrS2FBUmhVdVZ3NlBSdGRaYTFoTEJDK3c3WXRaVzZoclg0bVQ5Z1puSktV?=
 =?utf-8?B?dklmRWFmWnBwZ3EvMTl0TkpZMm9QUkVzY1EyMWpuWHVUb01uTm1HUVNUbGZS?=
 =?utf-8?B?czlBa21Zb20xNGIyU0NsN0h5M1NIK2Fpc2xGT244eUJtZExNbHNlOW1wd2xm?=
 =?utf-8?B?bGFFc2l0R0ZTbjFQL2xYQ1RjQ2dieUl6VXNjRGRwMVhKVTZ5Z045ZGUwR1ZW?=
 =?utf-8?B?cjhYTHFpYzBtTS9wZzVkQ1F6TGRoRldLelo4a0wxSHhoeXA3RjkvOXR0NU5W?=
 =?utf-8?B?VmpTTTNYUHpTVnM0SmVjdUcrK2lJaW45K3hadjByTTRXVlNGNWdxczYwSlla?=
 =?utf-8?B?SFhQTjJIaUw4SEdSSjBwTUc1eXBsdE0rcG5pRlFQdEdpMitrdjNzWHYvbFBt?=
 =?utf-8?B?R0trSW8xc0RxdTNremt4dWhwSUN4SUhrOVVaY2N0Um4rVnJiUmhpcjAybThu?=
 =?utf-8?B?SkJLemJxZ3FUcWFpajArQnR6dS9GZGJoR00zYTNWM2Rzb1lhaDFuRi9FWmVZ?=
 =?utf-8?B?RkkzR2JsMGZ5c0hldis3YkV6RXQ2cHhqUjFvbW1hRnlRRnBxSWRnTnkwc0t3?=
 =?utf-8?B?RDBiNWJBYVZEdnZjN053OEF5TVJnR3NsUHFDazNOQStsVG9DOStjTTJybjZX?=
 =?utf-8?B?cG45ZlZHY1JRY0F4OGJqZ3RETEJqTDFvOUtkKytYVWtrNEcxN2J5Sk5iQ2FH?=
 =?utf-8?B?eWlVcEFNOHdBaUp5dUh1dmJvL0tiTURWUktvd0x5U3ZoTE9FU2haYXhxY1RZ?=
 =?utf-8?B?Z0NoV3BMeVNnZU1BNmMrTk1CZkh6VWM4bmFjbjl2Y2h0V1QxdjEzMTEvWlJs?=
 =?utf-8?B?aEVpR3M4bEhudTAvaHl3b0JuNDh2dWFpSnZ1RlJjTWxDT3A2QXJDR1p5QVgw?=
 =?utf-8?B?Zkh1eFMzdVFkVFQ0cDJ4RGpHeDNPTmkreVhkb085clY5clJjbHBibTUvRG45?=
 =?utf-8?B?STBNR01kaVZJaHJhdGVyMm5weW9HdDBjUnYvK21rOC8wb29XcjBBc1Z3R0I1?=
 =?utf-8?B?RjZDZVI3YUk2a1Z6STNJT2phNFNxTWkyRHNGOXhwUGdlUkhBNUR4aFUxblNY?=
 =?utf-8?B?QmR6a2xKQ1ByK0RCd21VOXlhclNuN1NGQWl1MThwVkRvdGJtbkYxVEdjM2Fk?=
 =?utf-8?Q?peOnrXf4PU8ommCbLRq1ipwds?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f6f3b1-d64d-4902-6a7e-08dd36cef7a6
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 08:14:30.3357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHPHU5bL/yMIS59zf1OgtDLRpfHOii2Syc7CiTlJ1MDlETiMVMpGjU9rP9TjG8xqMQrmR0+uu6utTmmBqEHkng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8590


On 2025/1/14 2:05, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Wed 08 Jan 2025 at 17:40, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> Add PLL clock controller driver for the Amlogic T7 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/Kconfig  |   14 +
>>   drivers/clk/meson/Makefile |    1 +
>>   drivers/clk/meson/t7-pll.c | 1193 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 1208 insertions(+)
>>   create mode 100644 drivers/clk/meson/t7-pll.c
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index 78f648c9c97d..6878b035a7ac 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -201,4 +201,18 @@ config COMMON_CLK_S4_PERIPHERALS
>>        help
>>          Support for the peripherals clock controller on Amlogic S805X2 and S905Y4
>>          devices, AKA S4. Say Y if you want S4 peripherals clock controller to work.
>> +
>> +config COMMON_CLK_T7_PLL
>> +     tristate "Amlogic T7 SoC PLL controller support"
>> +     depends on ARM64
>> +     default y
>> +     select COMMON_CLK_MESON_REGMAP
>> +     select COMMON_CLK_MESON_CLKC_UTILS
>> +     select COMMON_CLK_MESON_PLL
>> +     imply COMMON_CLK_SCMI
>> +     help
>> +       Support for the PLL clock controller on Amlogic A311D2 based
>> +       device, AKA T7. PLLs are required by most peripheral to operate
>> +       Say Y if you are a T7 based device.
>> +
>>   endmenu
>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>> index bc56a47931c1..646257694c34 100644
>> --- a/drivers/clk/meson/Makefile
>> +++ b/drivers/clk/meson/Makefile
>> @@ -27,3 +27,4 @@ obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
>>   obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
>>   obj-$(CONFIG_COMMON_CLK_S4_PLL) += s4-pll.o
>>   obj-$(CONFIG_COMMON_CLK_S4_PERIPHERALS) += s4-peripherals.o
>> +obj-$(CONFIG_COMMON_CLK_T7_PLL) += t7-pll.o
>> diff --git a/drivers/clk/meson/t7-pll.c b/drivers/clk/meson/t7-pll.c
>> new file mode 100644
>> index 000000000000..a6113b7dfe11
>> --- /dev/null
>> +++ b/drivers/clk/meson/t7-pll.c
>> @@ -0,0 +1,1193 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>> + * Author: Jian Hu <jian.hu@amlogic.com>
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>> +#include "clk-regmap.h"
>> +#include "clk-pll.h"
>> +#include "clk-mpll.h"
>> +#include "meson-clkc-utils.h"
>> +#include "meson-eeclk.h"
>> +#include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
>> +
>> +#define ANACTRL_GP0PLL_CTRL0         0x00
>> +#define ANACTRL_GP0PLL_CTRL1         0x04
>> +#define ANACTRL_GP0PLL_CTRL2         0x08
>> +#define ANACTRL_GP0PLL_CTRL3         0x0c
>> +#define ANACTRL_GP0PLL_CTRL4         0x10
>> +#define ANACTRL_GP0PLL_CTRL5         0x14
>> +#define ANACTRL_GP0PLL_CTRL6         0x18
>> +#define ANACTRL_GP0PLL_STS           0x1c
>> +
>> +#define ANACTRL_GP1PLL_CTRL0         0x00
>> +#define ANACTRL_GP1PLL_CTRL1         0x04
>> +#define ANACTRL_GP1PLL_CTRL2         0x08
>> +#define ANACTRL_GP1PLL_CTRL3         0x0c
>> +#define ANACTRL_GP1PLL_STS           0x1c
>> +
>> +#define ANACTRL_HIFIPLL_CTRL0                0x00
>> +#define ANACTRL_HIFIPLL_CTRL1                0x04
>> +#define ANACTRL_HIFIPLL_CTRL2                0x08
>> +#define ANACTRL_HIFIPLL_CTRL3                0x0c
>> +#define ANACTRL_HIFIPLL_CTRL4                0x10
>> +#define ANACTRL_HIFIPLL_CTRL5                0x14
>> +#define ANACTRL_HIFIPLL_CTRL6                0x18
>> +#define ANACTRL_HIFIPLL_STS          0x1c
>> +
>> +#define ANACTRL_PCIEPLL_CTRL0                0x00
>> +#define ANACTRL_PCIEPLL_CTRL1                0x04
>> +#define ANACTRL_PCIEPLL_CTRL2                0x08
>> +#define ANACTRL_PCIEPLL_CTRL3                0x0c
>> +#define ANACTRL_PCIEPLL_CTRL4                0x10
>> +#define ANACTRL_PCIEPLL_CTRL5                0x14
>> +#define ANACTRL_PCIEPLL_STS          0x18
>> +
>> +#define ANACTRL_MPLL_CTRL0           0x00
>> +#define ANACTRL_MPLL_CTRL1           0x04
>> +#define ANACTRL_MPLL_CTRL2           0x08
>> +#define ANACTRL_MPLL_CTRL3           0x0c
>> +#define ANACTRL_MPLL_CTRL4           0x10
>> +#define ANACTRL_MPLL_CTRL5           0x14
>> +#define ANACTRL_MPLL_CTRL6           0x18
>> +#define ANACTRL_MPLL_CTRL7           0x1c
>> +#define ANACTRL_MPLL_CTRL8           0x20
>> +#define ANACTRL_MPLL_STS             0x24
>> +
>> +#define ANACTRL_HDMIPLL_CTRL0                0x00
>> +#define ANACTRL_HDMIPLL_CTRL1                0x04
>> +#define ANACTRL_HDMIPLL_CTRL2                0x08
>> +#define ANACTRL_HDMIPLL_CTRL3                0x0c
>> +#define ANACTRL_HDMIPLL_CTRL4                0x10
>> +#define ANACTRL_HDMIPLL_CTRL5                0x14
>> +#define ANACTRL_HDMIPLL_CTRL6                0x18
>> +#define ANACTRL_HDMIPLL_STS          0x1c
>> +
>> +#define ANACTRL_MCLK_PLL_CNTL0               0x00
>> +#define ANACTRL_MCLK_PLL_CNTL1               0x04
>> +#define ANACTRL_MCLK_PLL_CNTL2               0x08
>> +#define ANACTRL_MCLK_PLL_CNTL3               0x0c
>> +#define ANACTRL_MCLK_PLL_CNTL4               0x10
>> +#define ANACTRL_MCLK_PLL_STS         0x14
>> +
>> +static const struct pll_mult_range media_pll_mult_range = {
>> +     .min = 125,
>> +     .max = 250,
>> +};
>  From now on I expect naming to be more predictable.
> This is part of an ongoing clean-up to be able to more easily share
> common part between SoC. The convention will be based on what's
> the most the rest of drivers/clk/meson to minimize the alignnment diff
>
> In the general, clk names, ID name and variable as much as possible,
> variables soc id prefixed


Agreed with you.

>> +
>> +static const struct reg_sequence gp0_init_regs[] = {
> t7_gp0_pll_init_regs


Ok.

>
>> +     { .reg = ANACTRL_GP0PLL_CTRL1,  .def = 0x00000000 },
>> +     { .reg = ANACTRL_GP0PLL_CTRL2,  .def = 0x00000000 },
>> +     { .reg = ANACTRL_GP0PLL_CTRL3,  .def = 0x48681c00 },
>> +     { .reg = ANACTRL_GP0PLL_CTRL4,  .def = 0x88770290 },
>> +     { .reg = ANACTRL_GP0PLL_CTRL5,  .def = 0x3927200a },
>> +     { .reg = ANACTRL_GP0PLL_CTRL6,  .def = 0x56540000 },
>> +};
>> +
>> +static struct clk_regmap gp0_pll_dco = {
> t7_gp0_pll_dco


Ok.

>
>> +     .data = &(struct meson_clk_pll_data){
>> +             .en = {
>> +                     .reg_off = ANACTRL_GP0PLL_CTRL0,
>> +                     .shift   = 28,
>> +                     .width   = 1,
>> +             },
>> +             .m = {
>> +                     .reg_off = ANACTRL_GP0PLL_CTRL0,
>> +                     .shift   = 0,
>> +                     .width   = 8,
>> +             },
>> +             .n = {
>> +                     .reg_off = ANACTRL_GP0PLL_CTRL0,
>> +                     .shift   = 10,
>> +                     .width   = 5,
>> +             },
>> +             .l = {
>> +                     .reg_off = ANACTRL_GP0PLL_STS,
>> +                     .shift   = 31,
>> +                     .width   = 1,
>> +             },
>> +             .rst = {
>> +                     .reg_off = ANACTRL_GP0PLL_CTRL0,
>> +                     .shift   = 29,
>> +                     .width   = 1,
>> +             },
>> +             .range = &media_pll_mult_range,
>> +             .init_regs = gp0_init_regs,
>> +             .init_count = ARRAY_SIZE(gp0_init_regs),
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "gp0_pll_dco",
>> +             .ops = &meson_clk_pll_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "input",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap gp0_pll = {
> t7_gp0_pll ... and so on.


Ok, I will add t7_ prefix for the varibles and names.


Also apply for t7-peripherals.c.

>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = ANACTRL_GP0PLL_CTRL0,
>> +             .shift = 16,
>> +             .width = 3,
>> +             .flags = CLK_DIVIDER_POWER_OF_TWO,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "gp0_pll",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &gp0_pll_dco.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> ......
>> +
>> +static struct clk_hw *t7_gp0_hw_clks[] = {
>> +     [CLKID_GP0_PLL_DCO]             = &gp0_pll_dco.hw,
>> +     [CLKID_GP0_PLL]                 = &gp0_pll.hw,
>> +};
>> +
>> +static struct clk_hw *t7_gp1_hw_clks[] = {
>> +     [CLKID_GP1_PLL_DCO]             = &gp1_pll_dco.hw,
>> +     [CLKID_GP0_PLL]                 = &gp1_pll.hw,
>                  ^
> This won't go well ...


Ok,  I will fix it in next verion.

> ......
> --
> Jerome
