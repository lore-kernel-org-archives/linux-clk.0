Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E481470115;
	Mon,  7 Sep 2026 12:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785918; cv=fail; b=sD7F+w7lBU6dtQcGMz24eKjP2rQqhHUP0D3lXww90dapUd/jkv0FehCp2rRqx6wmXcyLRN/lbkQWKjl+93WO5LkqlSCJfrJIKpeeHQr1P3Fy75Qe1ZQy6fz+eCoZVWWK21C9xGfDtKnQgRdM2SdVRET+g0MaQAaAoDV5ZIKlylI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785918; c=relaxed/simple;
	bh=ea+4sJhYepiRr7AYLelG6X7thvHp5pyLMCWcaMVYgbs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cewCeePDtFWQHjqlAEnUqX88LWB/rs6/Lx3KAGVVKhbMZ/O4uJxSmwtAzLzDCCFrXRjV0yFmcTcfh3KTEmBfU/5gTbmgABxbSgJxyX5qIMjJ1gdwZyi5maX3qvOnvpRiv7h8/AhcQZqRQqXpMx/lhQ4zNG7Zyq8Ft1Dncm+U76Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZzypwRQ0; arc=fail smtp.client-ip=52.101.193.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZzypwRQ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNqpWThTNYi3HnLbxs4GiRaWqjexbORmipjHzNjNYo5UmoQ/PpSFNYJtngkt8/iYQ6ipqPxFsHO+Vff/VS2762qxE/j+w80BKZQwFkw447Jp1qzKRiFy8Y+/1fWQPaXYAb8TyFBOgxULl4JTOWZ0xXFjGGZnJDOK0joebVrN3w9HlQvTAAoJjT3uCVVOHoLriRAj8FFJAgwThXAEDPJyiKQg48eXQjO7P4XIOU6TEq7u32hQ1EbakVidjTj/x/j3C98uFPoNBMyaKAdWn1CBv6jLEORbsKsQyBXM0S9xRenl9D1CH102UD/jDv9FGFm7TIhWvulgLN1KM6WreUGGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvlSUb+Jlh2ammfGXQxHT5+Qgd0ENzeVJ77wjOChsf4=;
 b=TWEeJJVN4oOD7Bju4dqK2SC1lV56UBkpZZNqYiyDQv4FilKTH26++gMPsZcx5ypEzjDvZ0hOMyBLh9MZgujKCxLp9GgpY/cFt+NThuyQd4u34rgAd4VRCF5Z9/3Dp4ozOlGFITsK99Sbtxg+vwrBGXTvLmrWRlyYxm9YOvAYoVK7AItDM4aEITVvbUgRxMeuPs4txuRX1m63wdUQRdSMevX+dft16gZeyN6iu3/rkairwK2j17DWuH/mP17k85xvoSNpeNqdNDgFDcM8rPrJVJCb0Uqn6Dv7y6wj8LEnH7OJ6eISRweuB7W/LAJAo5JuQGyC7RP/ps/dLdmlme9KpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvlSUb+Jlh2ammfGXQxHT5+Qgd0ENzeVJ77wjOChsf4=;
 b=ZzypwRQ05kz3lfehFByBSi81lqFCjItxYK1QOAXbb0dUl5jHlp+DMfT1Il5QwYaDpDL5lvUQdXEiLUXstM++jvQv/9xAw74RJVi2UXa6kfIATZn/XN8WhYyEGiNsj2DR/4f9958uwx9rKDN6wOlYZkOllJfA6kkw0RL/9uFH+tY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by MW4PR12MB7286.namprd12.prod.outlook.com (2603:10b6:303:22f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 12:58:24 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 12:58:24 +0000
Message-ID: <6eec3c2f-5fa2-4e8c-a9a5-82b01cc0a8dc@amd.com>
Date: Mon, 7 Sep 2026 14:58:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: zynq: return -ETIMEDOUT if the PLL never locks
To: Linkai Gong <gonglinkai@kylinos.cn>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Kees Cook <kees@kernel.org>, Babanpreet Singh <bbnpreetsingh@gmail.com>,
 Mike Turquette <mturquette@linaro.org>,
 Soren Brinkmann <soren.brinkmann@xilinx.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260901125323.1556551-1-gonglinkai@kylinos.cn>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260901125323.1556551-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|MW4PR12MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: cacecebf-9ad2-4545-b31d-08df0cdfb397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MLt8p9pAHSUxpIWiSzujRj5jWYQ0rIu6F0cDtCk05nagG2ApeaoJangzXjixhqUoKHjJk+pYfUt21xrYnUTI3gCBUoHjAOMPjT7PEWdNH3miC0EazhU0CjZGMn4MbXRe6rLNV7IOxNCL4ViNNTgr1tS2qPHu216misd922EolOYo+iNly8TvCmsmUk0aeQEtCH5rv5qMJaqN+gDIFpk0eWmCA6aLu61M5bFAkuLU+VLLV/aFPlf2aTMVVHyIodUWpzEQNP6+A9FWpyf/PtuiY+N691X81imJZBpzRwQlYqdr0pYLXITYZnjetSg39ANur2DThuDEDf5YnXD/3BcSQVdASdvXkoaIKAkhrfUt6io8baBekeF8IhgLDUi3wWE4fd83Q5/K3JtJDDZSXdgIPSl7pEM2nTj2gI7gvFOj6jIQpMLsRMomOM5cy9HHJwGjjjI+oIZL19YYV8wqFqB2nKvUiVfAvgxYwPCUJlbdhlJwl8DRaI3m+xY0QcXCgo3D4LV9QoqFVCPKkDWCaHPhKokhsUlG6GaVeT6g/eOv7kjRFmGBmCe3H+BbD5+7YPrhyE6QjmcYpKffRsK6Lg3YlGjQVOeI66mgUUHR2uWp/a1eA6MVvzWric0SW/RXwMTj0eg6/UxslEu833CpH20Jk1zh9b0cYaE/2ZNfDoHWUfY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0xsZUpvcWdkaXZCRkt1eFIxUmRncVQwRTRjUFcxaHIvTktFOUdDYTBMeUNS?=
 =?utf-8?B?YkI4bWF0QW03QWMvaDZ5cm5ZdWZrTWtpTWlXMzFnQkdIY1pQMU1OMUdrQlQy?=
 =?utf-8?B?QTJIMW1PRWhRdUcyY0NsVStQS0hZZUExS2FwUGVXZUdYaHpVYUZOTlI4QXN2?=
 =?utf-8?B?NXhScU1QRnM3NHo3N0JUL3ROcDlhekNoZlFiYWNaVGlJUjB6cG9zZk5KTTJV?=
 =?utf-8?B?QnhRU01qWmRiMkM2cUYrZXVZT2JHMGxkMzgvcEc4VFFsUmFrTDU5aklic0k1?=
 =?utf-8?B?ekN3a0R6aUwzL0tjcTdDQkVUZnJ0WXRqYkxoTHJhdFJLMUdGanlnWTQyU0N4?=
 =?utf-8?B?ODJ5cGw2VnFQV0ZkSWdvUXVVUVFHdWE4ODdrZWRXVWlIT1FWc0ptQUdseGsr?=
 =?utf-8?B?SkpoOERNMHJPT2FEV2lCR2doS0gvaWU1b3E3bUhvSVREcmtESzd2WDUrT0xk?=
 =?utf-8?B?TGNsUXpHSzdsc3g4THcrOWtmdDhLR0pBT1VhbWFSdnhkdmE1WVNySmtmOUNY?=
 =?utf-8?B?aDRqZUN0cVl6Q0thNG1vcStTTytBaXVSbHcrdDlsdWhobWJMbEFrbzVsYjBq?=
 =?utf-8?B?a3lKNCtCelJJRmZGdXZ0aXV3emlYZHZRWjBOY1IveUhNOFFqUUlxT2kyRUxW?=
 =?utf-8?B?WkhPelIxdGZiWVZxbTRHN1ZnYnQ2Qkx3MWVzdjJjbk1ReDVDakRiNXAwK1NW?=
 =?utf-8?B?U1RBeURoVS9GbjhRUUprTXQzUFgrNkV4dmVzdW9FellFMzROTk82T1ZOSU9q?=
 =?utf-8?B?TkhrTnYzNm9FdGkrZnBUdTEySEw0MDlhK1Vvb0o4L2pYcmRWT1pQdHBSaGdt?=
 =?utf-8?B?cnlmZTN4N1NYRmZJRHc1NTdjU1V5dy9JcVdhTkJBMXdEci9QWCtBeVlvMEFE?=
 =?utf-8?B?QnJZU3ZUZmVDbm5XbC91ejY2NUlZeFJKTDV4T2JEZ3E4bW04Z0dLaktEWFh2?=
 =?utf-8?B?eElUeS9UeDRrS29XbU9DdzBPc3BBZi8zNFR4enI5cDJCdWNZSnQvblRrY3h6?=
 =?utf-8?B?QWN2c0JXTGJZOEFNNDhMRm11b0tzSytMZ3VNZ3dGeHp5TGNGU1FqTW41ODY5?=
 =?utf-8?B?UzE2QTRlSVltem45WEFVZ3IrY05xTU5laUR3QVBuM2VJT1QyS1V1bmFreWRB?=
 =?utf-8?B?TUlkZjdMenAxVk9DVEhBcStodE1qdEtJWkVoUCtrQVpIRDE2d2V2T2ZvbVBn?=
 =?utf-8?B?YkpEZERDd09yTjVLS2N2TkRWQ1B2bUZZc0Z5Z2FUcWFpUkZhWjVQTWEyaXNE?=
 =?utf-8?B?Y1lkTmpVdHFleXV2QlF0RnNPbmpYemxtaHU2SkdJK3UwSXRNb1ZWTVhhc3FE?=
 =?utf-8?B?NjNiUHNYS2d2R09ObHdoQjR6a2lHcEU0VkZXcFpKK3NQaGROUEw2Z1c3RGhK?=
 =?utf-8?B?U0ZhV01GWWRkNlVacnpkYnJsOTVUZy8zNysyQWlucmxKUnJ4MkFaZjFFelE0?=
 =?utf-8?B?eEhxQi9ySGRKNEJWSEorWXBJaGFwQmU2K2dxY203ZFFTc3VTdldEMFJ3VGdt?=
 =?utf-8?B?S1UwSU5ibVdFWU5UYU1lT3ovdmFXb1JXc0FzWE5zYUd4S2c4MSs0UFJVb25V?=
 =?utf-8?B?UkZZVHpDMjhWR2dDYVp2V3liUDBnSzZCZWhSYXRTZ2d5bUJUaEg0dEU5NGdP?=
 =?utf-8?B?ZERHa3RJWWJsam05V2NNcit1RGhkVGtKaDhDSE9SK2xMU1k3MldRdUhFV2VF?=
 =?utf-8?B?Zk1mZEIzeFFjbkE2bk1UaHhKeEFhVm13dDJ3L0dGS2FWSEx1ZU14V1JVTElB?=
 =?utf-8?B?bGFmSXhRVnJqbTNKSlY1aEpqM2RwTHFyaGwvcWptNlpMMS9mQkRqWEtjV2Jq?=
 =?utf-8?B?b3VUUUFqYzg1bW1GQTV5YmMxVnpKdUJnV3RqZTJiY1JLcVFzUGx2ZlVzSklQ?=
 =?utf-8?B?anpaYy9ra0VLRW9EeHE0R0wxdWIrSnQrUTRHdHdXV3ZhSnU4WlI2RzA5OW5t?=
 =?utf-8?B?NkVwSW5aRXNHVzlDK05vanZxMjBHV3VIYVhobGFOeDI4d2RkMncxTHh5dnJn?=
 =?utf-8?B?SEcrMExnT2MrMFRRT1lwbzRrZGVqMCsycXUzMS9NTURNdnE2QkNnU0cwb0V6?=
 =?utf-8?B?NEQ2T0V2bEhFejJwaFNpbXVuOUNuN3kxSWY2WlY3SjVlVDV6Yk1yVDVrUTIr?=
 =?utf-8?B?c1E4am5IdG03L09VK3ROOWpicWRxMnZjNFRxRm1SQUNjbXVxQ1lUeDNHcmtp?=
 =?utf-8?B?RHFuZWc2WFRrN3dOcVVIanlhbjNuQ3NDRHpELzNqM0piTGVya3kvbE1hTUpn?=
 =?utf-8?B?TnNac21MbW4wSzVDdXoxVGZBTFFjUWJ6ajNTWjJaRVo1cVhZUlR4YzNKOUIw?=
 =?utf-8?B?dUswMmg3ZE0yV3hNM3dCTHVqNzhRVHVUdWt1aW9ERGZDZ3pMTVZLZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cacecebf-9ad2-4545-b31d-08df0cdfb397
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 12:58:24.1360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjtJ0HaHByu3aTneUSbq+sGe0KYfSTuM3wgxog1t6OfGhF41o1Odo/iDRcRnxnkD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7286



On 9/1/26 14:53, Linkai Gong wrote:
> zynq_pll_enable() waits for lock under a spinlock with no
> timeout. Poll with a 1ms bound and return the error.
> 
> Fixes: 3682af46d55f ("clk: zynq: Factor out PLL driver")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---
>   drivers/clk/zynq/pll.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/zynq/pll.c b/drivers/clk/zynq/pll.c
> index 44c609378364..96cf45088ba0 100644
> --- a/drivers/clk/zynq/pll.c
> +++ b/drivers/clk/zynq/pll.c
> @@ -10,6 +10,7 @@
>   #include <linux/clk-provider.h>
>   #include <linux/slab.h>
>   #include <linux/io.h>
> +#include <linux/iopoll.h>
>   
>   /**
>    * struct zynq_pll - pll clock
> @@ -119,6 +120,7 @@ static int zynq_pll_enable(struct clk_hw *hw)
>   	unsigned long flags = 0;
>   	u32 reg;
>   	struct zynq_pll *clk = to_zynq_pll(hw);
> +	int ret;
>   
>   	if (zynq_pll_is_enabled(hw))
>   		return 0;
> @@ -131,12 +133,12 @@ static int zynq_pll_enable(struct clk_hw *hw)
>   	reg = readl(clk->pll_ctrl);
>   	reg &= ~(PLLCTRL_RESET_MASK | PLLCTRL_PWRDWN_MASK);
>   	writel(reg, clk->pll_ctrl);
> -	while (!(readl(clk->pll_status) & (1 << clk->lockbit)))
> -		;
> +	ret = readl_poll_timeout_atomic(clk->pll_status, reg,
> +					reg & (1 << clk->lockbit), 10, 1000);

BIT(clk->lockbit)

And 10 and 1000 are magic values.

Fix itself is fine but I would prefer to explain more why 1ms upper limit was 
used. I don't think it is going to be a problem and 10-1000us is fine. I just 
want to make sure that it will be clear that this value is not coming from any 
TRM but still at least range is aligned with expectation in HW.

Thanks,
Michal

