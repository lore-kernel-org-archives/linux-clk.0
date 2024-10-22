Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2035.outbound.protection.outlook.com [40.92.102.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D194A35
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 00:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729556311; cv=fail; b=iYxo16FOvql19cFu2RdIRyea178wslPd+G7dLO99m7zH3mWTkklpTDlSfFLrvXYCoY6MuZBV8ix4GW782g8njQhycshfPLpPzI+zIjNBYuFpRu1KjQANDfiyj5zmTSNNWpuhGkvolm2oKV6Gs04vjqwgYXWUpxULMLb2MSEFkXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729556311; c=relaxed/simple;
	bh=ReXN9aYZQB3xxD+oq1DY4g//AYWiZ0DqeeTNd61tV3U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tpEo0KVqCjHVlUxhHVz6E89rA+l1q7cFHceDeshWpl1618m/McaaomXgz2o6EjbQrgpjEokPhOZvkXC9DXuai7T2O2BhYSi1KTBWvQHBQogIXVVsYLCfhHhImOG/iX92I7t8SL9OApNqE3u5bk43/awkkQIRoqOHeKhcl1px9fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=MGCMf4S8; arc=fail smtp.client-ip=40.92.102.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="MGCMf4S8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YL09Rt0c4kkTYPZHx71V5vdweNfs/um+dZAhbnO123ol7wsAQDpExd4zGgMEhMEg5oYGfKBl5qRwPFBLXFL2iJ9t2WUYu7srb7HI83BhMgpB13doDqj/NtrY65fqgQKyV+0U6GKrmSx+LDF1YtMEHAG/MKdQ3DdBE/zDOV34ViYs2ilPZq6n67+1lfeQs8peM7nvwin6+kzRU9VdFXO8A8j/7UZEEDttwBg91Hsj9lflXbD701Br2XqJJ/FTjxjlmr/LHyJe8+zREjwskCnEhO6aLkqFX7EL9+bPN83P0rUlAKDnFDtXpR5/jfz9K54VXuvuwN73MAymDyid+zRyqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ua1XxT2nWDaN4HvDXo4ruEBXFnm7+Yj7uKRcudPLDO4=;
 b=xRR4ke5YcHPSxExHCnfXG2K1lAS6zEmRlPFXqWsRjV+jYOrjm8QyIcA4yuu7jvOoxWPs/w2eZYbcRuJkuGLO2jh/KkatlfceIFovPthD7b7DYeeC/qlOdBZxjgj1jqyqknRPLt7gnofTCPKSx3PGdi/xKe7f2Qfq9zeRKyz3fUU1XL9sKY3GNl7T0fq4C3UCn0/scw7S6VyNHRkoVEWpoVcMfdlirIETqVryNrj8BkGTDGeJZenLMlOBEcH5RoiwFXv5GycjwmXMaIU03rMYyfNiak6ZXRNEaNALo+gaP95UiVzpwm2uVBqj0v9Pj1QHX69KZlHja2RgqNFlm3tKvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ua1XxT2nWDaN4HvDXo4ruEBXFnm7+Yj7uKRcudPLDO4=;
 b=MGCMf4S8uFnCjV/ERjbOQeeGbHhhtmWUF4ETNlR0Ow1xpZQfFx/i9uwzbqATLGcwN3sAuIUlZFljrH7k5dB8P8l2NR5bniApVxh2CfFBEVYVsJYFgoTJXKIk9ilvXhW19z2HjRcl4Yjb1XE5FbXdtxiTwFJXnQbLLQn0iUTo3XZG3CZJrRafdg1e+yDhiYRsiGEux9UtxvPX8sjOxbU+4MhyKxzx9/HMOP2Kly3aQzhsI/ewmzxsT7R0LsOhyOfbfM4b6QXY2+z0+cgoMw0RYmBPvFkjiHt4q2gIVjhldpyNQqGsUH5iQxVA56YqkK88UxbfwfPhps/Pn07ZJYez5A==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB0803.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 00:18:15 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 00:18:15 +0000
Message-ID:
 <MA0P287MB2822F16B15C5980C28950C6EFE4C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 22 Oct 2024 08:18:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: sophgo: Cast an operand to u64 to prevent potential
 unsigned long overflow on 32-bit machine in sg2042_pll_recalc_rate()
To: Gax-c <zichenxie0106@gmail.com>, mturquette@baylibre.com,
 sboyd@kernel.org, inochiama@outlook.com, dan.carpenter@linaro.org,
 nathan@kernel.org
Cc: linux-clk@vger.kernel.org, zzjas98@gmail.com, chenyuan0y@gmail.com
References: <20241021205101.13416-1-zichenxie0106@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20241021205101.13416-1-zichenxie0106@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <130e09f1-b24b-4cc8-ab13-d698b51df1c0@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB0803:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca1f53e-293d-419b-dfc8-08dcf22f05de
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|15080799006|7092599003|5072599009|6090799003|19110799003|461199028|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	Dd6CnJFDXkX5/KCIXtib3wc0dhvvaaVvRnnk365stv4YMy8koal0Knlyc//F5SQR2POuxDq01P031IEHwUzV5ntEdvtQ2pGos3gQXAhDjTB+vbEhI67O0xAF3dgjxpYouw2kQ0V07W/QL+Zor/lm0Meqgvjs+41AGR8LnOUylo4vrqmG1uK7zu00TVZnvUGRNUMtXKR21ktJPd5eVjKwsesqG5y63Ozrcgm1YDaUZTa512uqi57Dua/GjS6y5SNLZykHvowPvD2wT4ZIDVEHr80/8ZlQoJmydZ0mXIjSL1dX4x6pk7OOt46ntaCaszMoYqYDnWTlR/VBLWtYpRxBFQTFOBl+jrzH0NBo8JqUEY3MjxJ5o+R0DCMXOUmzBPSIBSDqZS8B4qqcHHffSZH4Q890Wfi+9fDXSm4mYPyR0v+Kou0s5cLr4WhGV5SYDRJfTlj9feTrxOQCiQ6WgdzogRQzNHFH/x77hU2/0dj8dK/Hr7AglVCE4/VaYhSdoNCcm4Dd3HON+0rteXzhwfhYSjNH4TsD8+uAzOrxj2bzDQu9+D5dxNw4FmtpWqFVCU3A3CLohESsjmiQSwCIjPzfdfz5NkuP1CB2NKzI+8nNp54SCYGGecC97JIJ0vfb+CIWejkWox7pihggf/Roq/iq6EiZlv4fIgLUpipKyrfekP5z3TSot2vsYfQYF1WJ/poxPQkc+FwBhSCiaD35D4HUmznAsrCnJYPSub5IGGwW+KuT7/e/c8Ge4vLt9gPxvBNHKBDJzDASy8sW3gcaFjeelA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDJFSThtWDhyRy9IdDUrVnpTaUtpL0YzRHhoQVIrWkhlRmFSSm9HTTE4Mll4?=
 =?utf-8?B?aWE4TXZvdWV5QVdBZ2dhM0dLdkErdy9lYmVwVE5HRTdsVnRSazZrc0srbWdP?=
 =?utf-8?B?djMzU0VmOG8ySWVObFVRVnV4V2FUWjJrMER6UFl5MzlOTzBiMDhVTlJQc1Zx?=
 =?utf-8?B?Nm5VWm9mTnF4dEV0Rjd5d3N4NzFFVEhGU2NpeWVhSGkxUVlUWitMUCtoU3pw?=
 =?utf-8?B?R2tVaHpibE51b0ZuTUZiVS8vaTF2blllNzJsQXZOaHYvRGJobEhzSTFPS1VF?=
 =?utf-8?B?QUs0M25KYURmbngxejFrTUZBMkNTczJ3QVFqOUlGNzByV0k1M0F1UHhsbGVm?=
 =?utf-8?B?TjZabHhkNzQ3dUo0Qy85ekoyVEdOMFRmdzB5WE9ZMGFBRENRdmhXOEh6YXcr?=
 =?utf-8?B?NENzNVN6VVNydTd5emJNN0F5TnVwTWlCRnhueHhBcThSZG5Temo5TzI0N210?=
 =?utf-8?B?MkY0YkFhZnc3c0RxK3cxZkdXR2U5OHg4S1pTUk13TTNiNXpoS1BGVFVWVk5B?=
 =?utf-8?B?QjVKYk1NZjhCaWpMM09yZ1owa1JWUlJHM2NvZEV3Rlk1V2V3SDVlTGM1MnNq?=
 =?utf-8?B?cGRwdTlxU3l1a2ZnM3ViOXpTMGVmL3huUlNhY1JrdDBjV0NrU0kxQk1OczJG?=
 =?utf-8?B?NmswMGxuVWRBbjYyOXgyQkd2WUpFWWhNdW9iYmZhNysxbVhGdWpWSjB6aHk5?=
 =?utf-8?B?bWZHcXpFN0tPdVZGYzhXUXhDUXlYbVZ1N1RhVUFtRDlXSVZCRWlrUnUyenFS?=
 =?utf-8?B?d1JXWW5DR0hvNG9PL0hOVSt2TDFCUXJSNi9md0luNHNqdnFRTUM3R0RyS2pj?=
 =?utf-8?B?TG5LT1laTTNka3hjVVlxa2FOU2d4ZDQ3QncyanIvSm56T1lyY1A3a1A3cERs?=
 =?utf-8?B?aHVNcVR2V3NyWjNIeTNaQzdyTUFWd3AzYSthVjhna3AxUEQ0SENOWEh2L25t?=
 =?utf-8?B?TExDcUlkSnNZWi9PdFRlMC9LZU5XUWk5TEw4UFdiQW03cWN0b1lseE1vODF6?=
 =?utf-8?B?NFJDZXJkTVkzTWltRDUvNWJjbHd4QTFvQktGamVOVG0wMWMxQUNHOWhYSEly?=
 =?utf-8?B?ZU04YXlLblZlek5LWFlDaHpnNHFRblIwdmxyTEN1dTJwN3pvYWhGbXdpN0lN?=
 =?utf-8?B?c2ZVZml5NWFyN0ZQMXl1enoxMmNDWitiTDFyay9YNHUrVnBSOWJRNTNrVXVR?=
 =?utf-8?B?cllBY0pyM1dSUnRtZXc3VlFET0dBUHRCM3NRVHJiK3VlQjc0cmJ1NmZHV1lP?=
 =?utf-8?B?MTVoR09mRnRTSW5oc0hEbHlSRkRYQWM4ZDg4T0JWZmo5SDBiUmhCTFdvbzhr?=
 =?utf-8?B?bHp3OHJCb2ZkVjR6REN3U21rWkhVTTA0RmVmaWV0RUxqeUx3NXcrdXg2Q2tV?=
 =?utf-8?B?NUJ2dHYvSmFGb2ZzbzhOTWl6SUROVDBNWmQ5QWhBUERTbW5rc3hscDhWTWo5?=
 =?utf-8?B?d3JUbjNzbFgrdi84VldBUUVoVkdRT3l1M1laZGZzVkcyY2k1Y2hEcHZFdEth?=
 =?utf-8?B?Qkw5cEduVHIzTi81aUx0bWhpcGc2ZXE2T0FobGE1VmVoeGZzbXhSbFhXZk9n?=
 =?utf-8?B?dlc4K2NGM1BuMFhBa1AzTjlLRlNDR3FYbkg1OWlxMUErZVoxVHpQSHV1eEd5?=
 =?utf-8?B?T3BUMkVLS3lvYkZNdXBLbzZlYm1PRG5Qam1xbHNlcTdNREl5K2RtOUhoeFZr?=
 =?utf-8?Q?KiJ0T9R10w/B31APGrjN?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca1f53e-293d-419b-dfc8-08dcf22f05de
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 00:18:15.7704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0803


On 2024/10/22 4:51, Gax-c wrote:
> From: Zichen Xie <zichenxie0106@gmail.com>
>
> This was found by a static analyzer.
> There may be a potential integer overflow issue in
> sg2042_pll_recalc_rate(). numerator is defined as u64 while
> parent_rate is defined as unsigned long and ctrl_table.fbdiv
> is defined as unsigned int. On 32-bit machine, the result of
> the calculation will be limited to "u32" without correct casting.
> Integer overflow may occur on high-performance systems.
> For the same reason, adding a cast to denominator could be better.
> So, we recommend adding an extra cast to prevent potential
> integer overflow.
>
> Fixes: 48cf7e01386e ("clk: sophgo: Add SG2042 clock driver")
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> ---
>   drivers/clk/sophgo/clk-sg2042-pll.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
> index ff9deeef509b..e0f92f7a21bd 100644
> --- a/drivers/clk/sophgo/clk-sg2042-pll.c
> +++ b/drivers/clk/sophgo/clk-sg2042-pll.c
> @@ -153,8 +153,8 @@ static unsigned long sg2042_pll_recalc_rate(unsigned int reg_value,
>   
>   	sg2042_pll_ctrl_decode(reg_value, &ctrl_table);
>   
> -	numerator = parent_rate * ctrl_table.fbdiv;
> -	denominator = ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
> +	numerator = (u64)parent_rate * ctrl_table.fbdiv;
> +	denominator = (u64)ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
>   	do_div(numerator, denominator);
>   	return numerator;
>   }

LGTM, thanks.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>


