Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2015.outbound.protection.outlook.com [40.92.103.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5E139E
	for <linux-clk@vger.kernel.org>; Fri,  5 Jul 2024 00:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720139293; cv=fail; b=Wb7axN/w38fVQeM/+9g3hJgIm4shWOj1+z+EV17RGpX1rIYRwOnnnuN4ADP1wkRrzlAmRWOMxwxE/r7QSPjN1SMOJ+3t/aXUdrCw+Ebb4Wc4j016DqnHvKSmXf5cnwERsUtDedvGDE2wSgXlknDSMArorDerkkgOWvh0htelRXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720139293; c=relaxed/simple;
	bh=Fu7KADpQSHiHV4CwT7gTca+fD/ZdLoe12pq8ImXhRt8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eLe+x9XpTxQ4P4wJPJvk6uOJbf06TCxm/VSn9PCgn6QK7u7s5mKFhN4Vmrv5jCkmjGK8WeBLqSzEfroAecZ5BDA42dHXyKxhZnj1YMJ8pl9SiA81TANo0d/omyzRPBo8Hvz6cPICPl4y/O6rdc8Gzv4T2MRwvrQzLCZLgawnFZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=s/Yf51Op; arc=fail smtp.client-ip=40.92.103.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="s/Yf51Op"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xyaw13p+7WmdSPpDdWgwi0Jyt/QNyjlWKboG6XISMQ7WReUjNK/lNDE6ZQphOoK9TYid0whKbS0iuiFsh1mc8rYWk7K9a0cafId0/64F6uwc8moDzp9eWX7cxuTJA7YPIvkaoBZt4o+1DkmhCaOKZYWQyHrMtge49nmoICYVHTKy8wq7d47CV7BgdxaePjrEs34ZePJRUew1wtqCbybV5M/VM+ycGPfo9n4EAYfYnpRPjqE9WXhKLxtOS/IRr172Ms+ZV1q/MO8Z1dDhDepx+tGCzHhzA5jlKQelMpbfpQOnNlgmAm2YztV1FuPp/VH0FaK9MsZKADa2dynQwP2WRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JC+6U897gfvIv/yr7ldc6PDNa7Hn0cMdLACtANo2Ai4=;
 b=inc+H7mHXDBJzil2OSNlBYfIryMxX53E6zgaFn8h5AyqFuhHlNp6Iaa7oby6/k2HZJ8B0UtYKH2VFZqRCtQ/B8pO9hwPGV+pALK3X1I9MypYfu+7sOwZOGOlP63Ks+0fAYv0OM9pzoMG7u5G5SyA7Zl/gsFhyQIc9cZDrW1tAItgslGMGR0sXkxdtRt8nNQ7S5TMxx3V8T+99lilyL6lfPqudpvKyJxiqyfsnPpy40fzQ704KTsmRXnK2U8RLJLZZRG9byeUiTJIGG/rKc+dj4dXH/d1lYa52YmYtf1TorIYFGHkmDSimjD5mzfZds+YwGZh+iAgcRmIkRaDBbZP9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JC+6U897gfvIv/yr7ldc6PDNa7Hn0cMdLACtANo2Ai4=;
 b=s/Yf51OpccVVWpWWQrD0/gd1q6oaygzKSTCiKq6eDhXV/hjaRb300XPodVMGWiNG+uOnouWZP7m8TTmU8kUClwOeYEnRbxmS0ysIoQ8RpN5Q28K/qRhZF7ayqmPRL0iSyWt5q4uiO6PCoWjahF0Z18KAbDe1LA6o95nIb5P2oUhF2SBag+V600QstLcdTpK71g+BQJ15w7IaNUaOfbu/zOU7QzREHWlKoFQ8H0Fq24AcppqdpSH2lVwMUGcuCEF2HYocb7KTXg5ael7NbHL+YHe7JUAWSOZc+fvf1V8aj60pSmr4Cqoo8ljCXrrK0DVNlI6pvVej7p7oPpJ+NHsI4g==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB0601.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:163::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Fri, 5 Jul
 2024 00:28:05 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 00:28:05 +0000
Message-ID:
 <MA0P287MB2822A3AD8FA3BDA01F54BF45FEDF2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 5 Jul 2024 08:27:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk/sophgo: Using BUG() instead of unreachable() in
 mmux_get_parent_id()
To: Li Qiang <liqiang01@kylinos.cn>, mturquette@baylibre.com,
 sboyd@kernel.org, inochiama@outlook.com
Cc: linux-clk@vger.kernel.org
References: <20240704073558.117894-1-liqiang01@kylinos.cn>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240704073558.117894-1-liqiang01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [4A1UYkQ/lkRf4UtwzpHdVTQ7PcIFXEiz]
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <2e1dd2ef-5bd8-4b63-8f37-ae047022dc4b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB0601:EE_
X-MS-Office365-Filtering-Correlation-Id: 324a2299-9e7e-48a2-49bd-08dc9c89564d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|461199028|3412199025|4302099013|440099028|1602099012;
X-Microsoft-Antispam-Message-Info:
	J9p1tPy3piBY3SCcOni1pEMc00Rhvdi5fcaR/P9zHGiLSVjiaq0ZwApzPux/xxqrJg8zC3JuBMiHbXWnRBMg+suMBAi/DsKbb5zxjqT8o2Y9+jYMM53AKszz/pghGT68ypxQeXnaqhKpKieM165Yk1NCbSUENQ9DXRWHUFaS9rpvBmMhBSTj/Qf3qcVt38lBKiy5XJNBHyaJ9XeeEZBkFESzBzCFq4XSulMKsmtex3hbLzJVSiI9qu7qV7ZotiJFbtHgcV44B5WUMPrEtu7MCtszlg9LJHq9Z/GtEHfiGWhhmFYE/Jtv6CNjIL9zT6I6QGR6RnK0x0m2KGtQkb3AEx2SY96BUHe4CLkKdse0Pc0MIIwAkO8Gv+yRVJllmTA6O5AHIEuEtHe/SlHavhZLh0hKOK/7aB4gBP8oUrk0Uczi7S/f4hPMAy3D6kNcJEP+pjnnTnXfVOCrHwUuz/3aSMh/qRj3pXkmRWNra+VNWsB8GN7U0+Gr1qQ1H+KpZQAJM3r6kli2PcDHbNuByGK14LiVsN7PhIKP19SPHXNsS5OrB7vSJBHIHledkgRlRj+l4b/UK/85I0RDsieo1nIpPj8V7I0Bwswxu8LJYFseaHwVGmeapYOpcfMxxAOcRzPu+ZGNzpCk5Y+SIT/rdqWxWQq6pUIB1yA/A2vtm1DzNqpQ2pM+QYt7ZV52TAdx8sfkDgMPXlMSlxTLhA/lnd1JW6X7LjFcQ70G+6BE2YRHfzD3OV7pvFZn3Tj50Eod5hF3Z/pP40Z36/VffbRdFG7BnA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGFBYW1ZbDF6TEtJMTNuTlQxQ01DUFplU2dwYU5JSmtuSUZrR3RFWTR1cTdW?=
 =?utf-8?B?bEVhWm1vWXphc0s3d1Rtc3JkaDdVaHo1SFQwd0N1WVduWjNZTE43UkZRZ0Ru?=
 =?utf-8?B?V25QdEYvU21HNjFsTkpZUURnSEZya1NnY0FVblpETmFPYkxNMysyaUx4NkZq?=
 =?utf-8?B?d3BlTXZveVZNQzhoQ3hqZ0lDTTREcDdWeTFqM0pHT3hkc2tJRkEwaTZySktV?=
 =?utf-8?B?OHZzVHowRXJocytBZnJ1U1JqL0lDZy9JYmt6elhnMkJXbG1YQ0xYL1ErbmVG?=
 =?utf-8?B?cy9JcnlCaks4WTh0MnJFczFJQXRwcllaL0NJMC8vUHJoR1FHZGVOVXhnODFC?=
 =?utf-8?B?REFJQjE3T2JKb1NEUE9HZDdNT0ZMWTFjTEpsOTR4TVdiT1dERWZ0ZDkybWRZ?=
 =?utf-8?B?aHdsb25RQ1dTbytuekR0V1R3T3BVbU1QNWFQdzJmRE1ESlJYMlB6dThSeE8z?=
 =?utf-8?B?Y0VJVnhmdldUMXJ0RzBEZlBVczJxZ2xuWTZ3T01KaERLMUxXTjkrb1lPNzJF?=
 =?utf-8?B?VkNsU3VJdlNvL2hoYUJlSmYreXpLaXJySi92SjNSdUpoU2oxWk1QTkJidmcv?=
 =?utf-8?B?dm5YZFVTYm1odjRjMmxkRTlGYUxXMlQ5MkE0SUlMWXdZbnNoOW1xNEVJRkpj?=
 =?utf-8?B?YlBLUGh1MkZicmVLb3RLTTRWWGUxblBSRndVZVI4TzMwQ1ZIeVBpQVRJRllz?=
 =?utf-8?B?K0pWNFMyKzRLV3BBUVhjTUtOQ0lXeVdudjhWUzgwbkRCa0lZQ2dsMS90TUxl?=
 =?utf-8?B?NnZsWkdiWGZFejQ3TXgxNjR5SEJOa1RSQlpXQ2h3QzZmbW9ZckszS0Z4R2dD?=
 =?utf-8?B?YXRPNFlseVpYdWNzbUpnbCtMYktWWThTZndnaXpvSTN5SHJRSnZjUVdFQm43?=
 =?utf-8?B?M0ZYS2FWQlpCcWQ5c0pLUGVQczBUcmdTRXJKeXFKaklCNDQ1dktqa0VrQm1N?=
 =?utf-8?B?WHVjV1Fxdm1KQUx1dk0wdFFwa040WENjdGZZOHBJaHB5U2VrYzU1a1ZnSS9x?=
 =?utf-8?B?czlNV3ltYytKWDE0a1ZOYm51VmZPOGlneEVwejN6ZnJYMS8vc3I3NUdsWXhS?=
 =?utf-8?B?b1hNUFFsaktrR0VjNVJodnRwQ2JiK0czN2JVaUdTcFN3ZGpad2xwK1dwT1ZS?=
 =?utf-8?B?VHJURW1XTzRsZUhSOHhNdnZzRjQwODZ3b1kwOHZNV1ZzQW1sdjRneUtENTA1?=
 =?utf-8?B?KzQ2VllaU2xONTVmeTF4bysva0Z5NjhDU2kzckhvOHBJYllBN1lleHI1b1dE?=
 =?utf-8?B?VlkyaCtYeGU1Snk0cm5jZmNKQmRzckZLVGhpb2IvTks0VHhNdUlQWmRGc216?=
 =?utf-8?B?MG5MTy9kcDQ2WHVHOHZnMmhzWXh1V0M3M1VYS1ZsclNhb2Z3Wk1pZG5Wa2RM?=
 =?utf-8?B?UDhEYW55UXFGaUpBYUdtMXpZZmVsTGpINWM0cUR4WHVRNyswbTRQMWlLVHpv?=
 =?utf-8?B?MFNXTzFuZlZMZGZtdlJMWllQV3IwTGRhdGxDWHZyT2NLUnRQWmpwWktLS0Fq?=
 =?utf-8?B?bVdNRDFPYzFKQXNrenEvVWpyempxQTBXazEzNnVjNk1kYWxERDVUTElERXJn?=
 =?utf-8?B?eGRSZHJJQTRxZmNVMSt6YndMNGpHNjNLSFowUFhyVENNOUIzUjFMSWZNVWFO?=
 =?utf-8?B?K3UwVndzZFNLUGUxbGRaN3FaNUVvNlZXTXpFKzJtdmxvK0laT0NzemtjOHor?=
 =?utf-8?Q?9VIyVbP7IPq9Ug3zGwjO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324a2299-9e7e-48a2-49bd-08dc9c89564d
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 00:28:05.4570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0601


On 2024/7/4 15:35, Li Qiang wrote:
> In general it's a good idea to avoid using bare unreachable() because it
> introduces undefined behavior in compiled code. but it caused a compilation warning,
> Using BUG() instead of unreachable() to resolve compilation warnings.
>
> Fixes the following warnings:
>      drivers/clk/sophgo/clk-cv18xx-ip.o: warning: objtool: mmux_round_rate() falls through to next function bypass_div_round_rate()
>
> Signed-off-by: Li Qiang <liqiang01@kylinos.cn>

If your patch fixes  bug in a specific commit, please use the 'Fixes:' tag.

See 
https://docs.kernel.org/process/submitting-patches.html#submittingpatches, 
google "fixes"

And an example: 
https://lore.kernel.org/all/SEYPR01MB4221943C7B101DD2318DA0D3D7CE2@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/

> ---
>   drivers/clk/sophgo/clk-cv18xx-ip.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sophgo/clk-cv18xx-ip.c b/drivers/clk/sophgo/clk-cv18xx-ip.c
> index 805f561725ae..b186e64d4813 100644
> --- a/drivers/clk/sophgo/clk-cv18xx-ip.c
> +++ b/drivers/clk/sophgo/clk-cv18xx-ip.c
> @@ -613,7 +613,7 @@ static u8 mmux_get_parent_id(struct cv1800_clk_mmux *mmux)
>   			return i;
>   	}
>   
> -	unreachable();
> +	BUG();
>   }
>   
>   static int mmux_enable(struct clk_hw *hw)
