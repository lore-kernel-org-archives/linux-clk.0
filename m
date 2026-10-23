Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.129
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792735216;
	b=h7Hm7WcmmFRTofsTkly07XH5bpIb+HE9dQ/8rC5lmRt3nNO0F9pZAZ5/7z3llQWnFvJo
	 5j4e8Zh/6wjySpAt75kH7DP67VShJMZeR4BgIBC4d2DZTs4GLinV/MIDpDFTTNfPpJYY0
	 InWZ3AoHP1aEIdp2pdFitTUjvQQjIUmGV8M4xmlYnvbiwwRQsxwtmaK+mGy6vYFtwO9Rp
	 V85RJwFDDhCm4uCmvRruM8tg6nfN1e+3NUMKQhKBodFIBQD2kGRqBOk7doVP9B4kgG5V2
	 r7YW2iH7kJJ7+JuO31hOMG/iTTVbyIKChiYTM1MlFawPCroNnRZH6sDBbCCuHdYJiyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792735216;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=VkjrR2JiNkfmtFctw1PqnHWo7oFQMKWk7/6Pl682J9E=;
	b=1DenuJwVvbSm6Jd0MLPANwiZ8W7vzDZdx6FGNbo8c892d/sMBtWr7x2xZgcuXX7gsMcb
	 YcoRNfmFYgy8ldpPNOruWJpadoqsjl8uIoIp2MoiFBboDEL0jQmCS2YaIUL8Uql37DFAx
	 XZFP/B6L8TnkSZo81BGgwSVmOU0DK37BMWNUSJ0oYk1gCtxIz2UEmABlQJZKqz/OXFaOP
	 esfdpXj41nsqwloFhxrvqHLA1RGRlXKxZi89c6pYJQ8KSoxavBrpMFcTGM2RNOuJFvhfi
	 3ZnZItZQI2NVd7KB3f5iG+iULguqArnvaJ/yfyYLPbBo35EO3ga118NdbWYxEzJn40A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b="GfwyE/5V";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.129
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022129.outbound.protection.outlook.com [52.101.126.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3187606A31D;
	Fri, 23 Oct 2026 06:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3187606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=GfwyE/5V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbyQcJ+pOmiJsqOgnjq4HGR8hjY8R3UPyrd8jLgcDn+f1lKWMA2zQCoXmwgGy7FnnK6OSfMHYcYovBEPb+nkJcDpFQcSa+1U43uOs2I9AHbzRJtzm841slswmN+CSpiH2oY4TPGQIepA7ZpezdojYgG+negPjqAN9+3J0bjLpEZrdqWvjkdGwdVHqDB8Kq0Wsboa14pxMKYLLo9t70vmhiOi0jMzjhDMloQSGxKl9VswzErNctC9cgBcXvXlsQoiRMtgVmIq8+12NaUJUrCo84Qo7c8tCkx3Dh2Whj2MFW9k+Oxl9jpF6XHMZjkQmpI5VIwO1/ODnYZzLlTp9YHxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkjrR2JiNkfmtFctw1PqnHWo7oFQMKWk7/6Pl682J9E=;
 b=Vr5vQRz91saWNG2/R47qVfdwLdBPwv6mD2yYIT6ja37M3Fz5NJnS1ALmdW4d/dFk5nBvkIny8amro/wMtTZaMcvAtJUj8zG7xEHxbPI9LoyX41LeZb4cD9Vm5nkK/ACut4hH8dkBI7IKnurs+Usfco6aXkHscJ3D6pF2B7Yno6/CISCGBGiSj0t46UmENm2BC7ke+IqYH8XCMcFTn798+U8UgaRKh8HX8Lmaal48pXU+MuZQUfgugUXjz6GJ127e676y0eTO2LRFHmxaaCXZFYxB/nQeoGR4ypDHIpQoT2Nyn5gEqgw3/Y9xBE5e0JEBhkZFOyuLOIZNB9enopyruw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkjrR2JiNkfmtFctw1PqnHWo7oFQMKWk7/6Pl682J9E=;
 b=GfwyE/5VmDDnu84R0YDWW4Q0JB+nVgJWEPVxt1Aiot5+MU7JmzCayArTKDOjBmtQnsok1Zy6UkP0DSun69wrZeyrtUvqFvOz4mvyNmAqLAMYbLpIyVrP2dFZknKXGUPHFab/Ks7sR1yiIxcqckTdE1/7mT7V+ECIQ2wLL4INPlmfWW43PBGPAAEydQL4FpAOA7XzrA8coG6ef0VIANGXFmbsElAjdBfgYWLqpMJ6qlL5cxEG2EWISGLVdsNOMX8HAnaBvS1WPjcLCe4TQbY0hQFolpySe5kYzJLA33O+xsf1mO0H7/wAAtx13sR13re9PEMUAU9jpJfk5vztWZuZ7g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SI2PR03MB5786.apcprd03.prod.outlook.com (2603:1096:4:150::10)
 by TYSPR03MB7692.apcprd03.prod.outlook.com (2603:1096:400:40e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 06:00:13 +0000
Received: from SI2PR03MB5786.apcprd03.prod.outlook.com
 ([fe80::6f51:1229:dd08:bfc2]) by SI2PR03MB5786.apcprd03.prod.outlook.com
 ([fe80::6f51:1229:dd08:bfc2%6]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 06:00:12 +0000
Message-ID: <6abe6927-71b4-4bbd-8d63-fffcda43f0ec@amlogic.com>
Date: Fri, 23 Oct 2026 14:00:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: meson: s4: fix ENCP clock selection
To: Carlo Caione <ccaione@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
 <20261022-upstream-clk-encp-sel-shift-v1-3-f1b1e10a3d84@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20261022-upstream-clk-encp-sel-shift-v1-3-f1b1e10a3d84@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0037.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::16) To SI2PR03MB5786.apcprd03.prod.outlook.com
 (2603:1096:4:150::10)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR03MB5786:EE_|TYSPR03MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c8e3ac-9eb9-4d42-ffb9-08df30cae6db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|18002099003|22082099003|261022105027099003|261022075727099003|4143699003|11063799006|261009221227099003|261009223027099003|261009220027099003|261009221727099003|261021123027099003|10067099003|261021121427099003|261009223327099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gwzytONEqPCiJthvBnwxIqSbdCfELmx6+KidJMpiiolZVnuUAjQNlY2Ll8etZLnEgnWRX5Ah0Je6StaZKpyDdizRBtqikKc614fdJCIWgeIUGPN31oLE1GReuf7DzQjbePIql/hmgs/MTojz6FhdCyCfqWQeeetB1VUGymz0bvL3ON6PEY8U8OPIkD9Agyx2tD7iaATHu+C1gABxvCifbnJ6tznwCh2xS25w5gIYOuAgEs1wkBWHSAVR6YJzPsRtjwaqaVkQhsO8ZOY9tIkbxXA6CFaQVOz1HlgcOdlqLZblrLchv9PofcPVOvf7hGcO/QEl7jQpD6wnrsfIMkd6MnECOBu2a0g3oINGl9mzqA05QHgRAlrp8FqUCQf/a26xklA8ynpfojE+fP1xWVSvRhdNeuQ+vzUX49xeh1ee2zn80SnxpTw1YYSocmeDMdKlZ9qT9gVPfnirIyUptEJ93LTRxGL8sUOHpy1L4/sHnCaxc0ZQfFNky+/pwZuWswUDshgBgH1pXJisXw3GT5C1pxDAh/HgqK0mQuofb3ymEI6/eUDwGyHg3so0t0jLpQ7b9JuREoB0fHmOUJ7IcW+Hw4zWSG0X6V0OChpPM0mzTanxX881/dGdsslFQPIWHsol
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5786.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(18002099003)(22082099003)(261022105027099003)(261022075727099003)(4143699003)(11063799006)(261009221227099003)(261009223027099003)(261009220027099003)(261009221727099003)(261021123027099003)(10067099003)(261021121427099003)(261009223327099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGtpaUdLNENDcjlTMzRCYjNJY1JwZDZLWTdqTVpqWkgyRy9uRy93YVhCZWVp?=
 =?utf-8?B?YytjQlFjSytqNnJ5b0xTdDNDc0g0N1ppWVdQYmN0VnhXSFlybFdNdVVZT2xu?=
 =?utf-8?B?TkZnK2plMDV4M2xjOVRUeDYxUkpkcU9oZ3htRkI0ZFQwcFFCZEc1ZXZJbWh0?=
 =?utf-8?B?QjJ2QlVwWlJyaXNCUnFGSHNZb0RJQ2R6T2dXejFJUXlRY1ZRektFczV5SmNB?=
 =?utf-8?B?ZExBbXdPVnJxUnluRWhSNE00TXJSd3krTURidVA2c1NWVTMxeGNVdTJnejV0?=
 =?utf-8?B?bGhUeWluWVliMllKMzZHWkh4S3RwUFU1RzhrTnNvOXhGSStwd1NMWHNoeHFU?=
 =?utf-8?B?ZWtOTFg1OUI5N0pzK2QxdWZ1a2xLT1RFRlNpOWRjNXRKN2dtQytmRGg0N0xz?=
 =?utf-8?B?b290WHkrR0JiYWt6QkM4bmFCVWtNL3JSWHl2U0U0TDJFcld4YXBFUXdBSllv?=
 =?utf-8?B?VnVQUkJkY2hlNEIrVDFUajhqYWQvMDE4NkJ4cVpETllnRmFJWHNYbWs1R05l?=
 =?utf-8?B?T1J5Skh0aExZeWg0cXV2ZHhCRlNxaDFSdnpnekhjQmJyZklLcmdGRUlUU1g1?=
 =?utf-8?B?anJNTERMenJiRlRidTJVOFFSQzEyVHVQVzhCWjRWZWdqczdoNElJVzV0cjF3?=
 =?utf-8?B?dHhUQkNnaUV0RjRtdFp1b2ZVb2NmVk9kMUJ5Z0tZTUFUaHQ5YXlCaE1JaUxR?=
 =?utf-8?B?WmtpckVTNnN1dEpidW43MkdQYXZSdU1zKzA2NG9hcjRTSWtjVERkczFWWUJF?=
 =?utf-8?B?V1krN3Q1bVpnUVU3dXFtM1RhS0hOcVY0Z2N6ejJNUnFjc1ZkdVgyNDBFeFIr?=
 =?utf-8?B?TjRUdHpiUjR3SEQ4cm15ZXQ4VjFPWGFodjZ6RWFKM1BiTGlNWjZHQWVWa3Jv?=
 =?utf-8?B?QW5OM0lEbnRIZFhPUkF6UkdNNGFnQmRkMlRDQVhJNnI0dzVxZ3RIUlVhWE01?=
 =?utf-8?B?OWxDQW9lSTlTNWQ2YUdQcndCOCtVeE84blk5djZ0VkU1VHdESFRrV29VSkhK?=
 =?utf-8?B?QkNDUjFqOXdGb3JlRUhRNW5UM016aE10UFczZFZ1WFlHSUt3cmxqM25KY2Ra?=
 =?utf-8?B?c3NYL2VLNWxsTi9NWWh5UGNua2d0b25rMWZ3UTQ1SWk0bE54RXZyVzZCZS9n?=
 =?utf-8?B?TkczZFdQdmsxSStnR3RvQWtKcFlqbXpwUTg3VzluR1MzU2FOMEx6eTkzSGFT?=
 =?utf-8?B?aE1kM2NHN2ZTZE9XK09vWHNkVTVaQzNqWmIwcFZRa1lGeThNQkFKV2RDeUdX?=
 =?utf-8?B?bG1PUThnV1d6WGphNjM3ZGh4WVpxQ0ZZZmJQcHRqU3N1L0c2OGh6b3JYQyt3?=
 =?utf-8?B?cWhLaTA5U3d3ZWprN2hielp5eFVJeVVVdmRKZkx6OVp0dEVJT3RSd05hVmxk?=
 =?utf-8?B?UHAxRldLUGdSTUcxNXFvN3VmSWdRT2Y4SDdkdm5QQWJibkVXcm92YVFXZ2dj?=
 =?utf-8?B?cjdISUVJYVUrWXZRVHFOYnpaSUN2UVl6T1pmLzE5eUZtSlZka3JJbjhadklo?=
 =?utf-8?B?cEFuREFHZzRQSUdBL3pHUzFXQ0I2dXVma1RMOTgxMkpvZFl6bHEwbXlpSFpL?=
 =?utf-8?B?S1dPN0tGcFJKdmhGeVJkRGY3M2xDblZzQjBWQXhrZm9yWGhFRGhBbVh6Qm8z?=
 =?utf-8?B?dTR3c2lnOFZ0ZGpZaXh3eCs1cnJYN2l5c1FJM3FtOXJ2aElPeDJOZFFsc0Vm?=
 =?utf-8?B?ZTBLMGpVQ09mUkhPOFcwcGlwdVp0YXYwQU9tR3VUZlY3bGYyUlRFQjVpVkly?=
 =?utf-8?B?S0w0Mk5rTElyWnhReW1IZ00rNzZ3c01wTlF5bFVsdTJTZGsvdEhZTnpRSnEw?=
 =?utf-8?B?ajB2U0F5WEJLZUp3ZHN6MVlVTUpEK2FPcThZTGorYVFhL3hoWTFUVG5zZmV1?=
 =?utf-8?B?eGZ4WDNaU0dGYW9hVHJxNjh5OURGOXhBZElCcEc1T25yYWtxay9yNTVDZ2xi?=
 =?utf-8?B?U21JOHdsbFF5SFpvdFovNDhvV0N4MEtOdWh2b2dnOEdCNG9vWmtYcStZMmpL?=
 =?utf-8?B?TnlCRVZZcW96d3VRVk5zWURXNHp3azdYeHkrZThZL1lnMTh0TVp1VHlkTTdz?=
 =?utf-8?B?Y2hUSjJMV0lzVE1xM2ZSWUhZUlR3UWQrUjBrS1V3N1NOcUc3aTFnbFhrWThk?=
 =?utf-8?B?ejJDbXJtUWNvWmlLUjl2TkFjWjFHMHVWamFqT3gwaVdGRytZZVNUaTVrQWtB?=
 =?utf-8?B?ZUpiTUZTSTlrZ09sZXpvYVg5SW9NYmR5V1l5bG4wMTdZUC8zQXBHU0VuNHU4?=
 =?utf-8?B?RVdTbHVxUENWc1hMWkdWYnlRRXJkQ0ZraitGYnVnZkw5enFnZ1VZYllqYitp?=
 =?utf-8?B?TmthR0ZWVEpjKzFncGVnajljUjBzUVBjYytyZ0FTb2xCYWg0Q1poUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c8e3ac-9eb9-4d42-ffb9-08df30cae6db
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5786.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:00:12.7467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JalKpffrTA0Ny2unML63SfuUmzrJOQJ2XKbGe3azE4jPJ38fRVwqhlG5+spMm+bcVi5C/ZhWl8BpUEVtmJqLOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7692

Hi Carlo,
     Thanks for the fix.

On 10/23/2026 4:10 AM, Carlo Caione wrote:
> [????????? ccaione@baylibre.com ????????? https://aka.ms/LearnAboutSenderIdentification?????????????]
> 
> [ EXTERNAL EMAIL ]
> 
> The ENCP clock uses ENCT's settings by mistake. Change the selector
> from bits [23:20] to [27:24].

Yes, you are right.

By the way, S4 does not support the ENCT (Encoder for TV Panel) so the 
driver does not define the associated clocks.

> 
> See the S905Y4 datasheet v0.7, Table 7-58.
> 
> Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller")
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>

> ---
>   drivers/clk/meson/s4-peripherals.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index ba41fcd90588..33573eb85927 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -1114,7 +1114,7 @@ static struct clk_regmap s4_cts_encp_sel = {
>          .data = &(struct clk_regmap_mux_data){
>                  .offset = CLKCTRL_VID_CLK_DIV,
>                  .mask = 0xf,
> -               .shift = 20,
> +               .shift = 24,
>                  .table = s4_cts_parents_val_table,
>          },
>          .hw.init = &(struct clk_init_data){
> 
> --
> 2.56.0
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Best regards,
Chuan

