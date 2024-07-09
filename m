Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2041.outbound.protection.outlook.com [40.92.103.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D60213D880
	for <linux-clk@vger.kernel.org>; Tue,  9 Jul 2024 07:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720510105; cv=fail; b=tJbRs8iLAU9TiI5t5RhqqrQDu0WeALQXAmXqCANigxfYhuslC1KMM3gTYYXhVGjr7FgxkpgNaoG4vdtEh90TrtRpnv7XGIgtMVvK+nGIFLFKLjP6Jvj0gZxnuhFGvG3kUuMxJCZ03zVLi8zvhC7SIh1wMkPlO+uG3ORqfNAEN0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720510105; c=relaxed/simple;
	bh=GyRRZh7J4fJIbttSJqwYOm2+HjKYDpxtwNOGe81mNxA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FImRonayvmDfuM+Qp335JuSPzp3y67n90H3vFEW73jB2McjXYeedTVSpFsSQGs0NMEqdxOCJ4PznXEdM9XUZSXIglAQIP1JzvxiXAVFXu6bGvLiXuXbaDRFMKF8kYfem5+m5CcXhKSGi1IMJADmCMnIcUmQelHATPdZAch+MBac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=MUF/7prB; arc=fail smtp.client-ip=40.92.103.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="MUF/7prB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnMXZ66ELIvDGJ7D25zyshLXGeO3zfDsvq4xjM2nFqjQn3Pw40noS5VRx7Z2VppDAbToPoKMMsQn+Et6gnpWkVG+baFXQ4nwCxGLLmI/WeZ4kGrkZrGL/hLEGRna+XWv2Jj2cq5bvRKTr3xrOmgxm2fGMFU9JwN9h3xgfm6Kplqr7MTgRkHzY8tISeqnJLC2w6HK3LApBy2I4l7TWEPNVVsX0NRMqC0iJVa4JiEGReaBOFMlNvTuy0bOWv3nW5FO3KRc26fbUmPir1pHXopXjcc7/DBL250FJ4nHNQVrHnAFWwmOY0659Ii7VtlblcnAlrIH9A2Ppw9skOOnanVfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzl8THP0oBtp/1T9lvyxtKRAKVs4LUHsKzpH0w0iVQg=;
 b=P5XAr3AZy0CvK1KY45jGVFDc3J/Zkd7cgJ4RV9EWYHHdBt70DbGwx1719X1B4lmnxXIEjgFJcMMIEkoODikz2dZjgUxEQQnaI3DOVcbNoZK0BhIs3eUmRUOYgNc4h+kGA6TBl6FPMoG61xGuHaTKvDl5vIW67wtNkacOfrd5BeFkNh30kEHirOwtlFBPD8tT4NXxCBZEoi1U/+GtBjYDR9NtmIZn658Vg2vgA5lPkPQMsujojsRGM0MI7ce7EexwW6P7gPJT4mqxsoGXtrkyEYaDRCxXwgjA98gUEmzHsv2ezt/FxoiNmq88EKBwWb0QDGUhv0bEvbIcnfFOMY+Uwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzl8THP0oBtp/1T9lvyxtKRAKVs4LUHsKzpH0w0iVQg=;
 b=MUF/7prB8aG4TresuSpwBR0ntM7pnMO+SLJuQWIT2JrHyPOe4Spu372Iah7wdhfKld07DhjLEQZABoTxiN79nXov3Fx4pq/ulSORGWGbW90T2/Ap34sIeX6nPDqvUBIZw1CdyxCDh6AqbZoLBdIU3GpXME/90q2zynv86aSXqRP7jMks8h2m9Pdr8Eor467ofItNuGLwiONYEFvs3I8J3Xp2oimwaPGzBK3E7w+jNRx1BKDvIeu8jU8QdURWLKxxTmOIiKEI8aMDa/OqdfOYuUY2k7XW9SyKLLKO10cwPE7+SdJN5tt0Zf3cLUr3Nfk2JMfLXAKbnih6769z2HANfw==
Received: from PN1P287MB2818.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:214::7)
 by MA0P287MB1274.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:105::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Tue, 9 Jul
 2024 07:28:18 +0000
Received: from PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
 ([fe80::5a8a:9e40:a4e8:3e2d]) by PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
 ([fe80::5a8a:9e40:a4e8:3e2d%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 07:28:18 +0000
Message-ID:
 <PN1P287MB2818DC45A84EBF2BBD96EDE7FEDB2@PN1P287MB2818.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 9 Jul 2024 15:28:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] clk/sophgo: Using BUG() instead of unreachable()
 in mmux_get_parent_id()
To: Li Qiang <liqiang01@kylinos.cn>, mturquette@baylibre.com,
 sboyd@kernel.org, inochiama@outlook.com
Cc: linux-clk@vger.kernel.org
References: <cover.1720506143.git.liqiang01@kylinos.cn>
 <c8e66d51f880127549e2a3e623be6787f62b310d.1720506143.git.liqiang01@kylinos.cn>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <c8e66d51f880127549e2a3e623be6787f62b310d.1720506143.git.liqiang01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [Y4A2TcqWnOUam5uBemp2f8rGFUNq5RoB]
X-ClientProxiedBy: SG3P274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::22)
 To PN1P287MB2818.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:214::7)
X-Microsoft-Original-Message-ID:
 <86f3fbca-8d8d-4085-bf77-42481e18c1c9@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN1P287MB2818:EE_|MA0P287MB1274:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c3eb0a-f982-4248-ec1d-08dc9fe8b401
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|19110799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	70NWkj92YsrJNdJXb0xDw8gwR2ORL6q+sNfiUNjXgc4xVwhDuxXEoL93pQ1RjOUXIH431a1giNqdCR2h7NBWWsplq6GnrXK3egp0qICKCOTAsRoiZIhyP7kLlbqGcu1HALRZj14e4xI4GCIzqHZJqvBOeGcuk9FbkuqawQ3uSodlf3kOfBaIp3isDhQjcksi74h+W3aOfAFOBXIDGhsCbN5ri67NJvaygeYXgK8FerlZDwtakeE5nyP20WjgOlsaf9I4ZZPfwXk9LpJf5a11PWxJdfa4L061bGiZRTtSDsOmHWoAmn7zQ06hJ4Vi90jMloWpWpZINp8u6hj2PLH1wntfHBpZeDLp/+e8lAhIa2ELk79UvHkjySSzPip+32Eb93fzd4A4Z3FuTeOco5e/Wln5TcGug2uvwO+zdym4vVM28kzpWwSnuE8rxWZRiU0ZLtQ1z84Qy5nIx3zvrLjGy7Vo0J7xniRaKDtTJbqARWhLvmRLUb3Bk7J3V8muuXfxkcPq8ePr2f6EUimdnxkD3Dxra0GqqG6cBqzkJif67kg0Zr4MvEa88RaKx0mtVfvDQkofX/iuPckS07x9j/pJzxJ4aGarTAzSNw8s/gOSzQXm2Su5QR/sRGMGmv13AfOTxOnNhSKTC4I8aD5fVlOgug==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkdjVm1iQXJkeDBrYlBkeWNXVGlEL0hTRi9pcXA3YTBvclNxeHNkYzBtbFRF?=
 =?utf-8?B?OUEvdllhN1ZhTk56WVR4WFNkQk1JMThKQzBpY2cvSUF6ZzVSU0JiR1BZcUpY?=
 =?utf-8?B?MHNNZzFVNmpZYTc2RXRZLzJoTDNxb2VGUlQ4T1dOMTdFbE1lZ013bmtXWTF3?=
 =?utf-8?B?c3ZSdEFjbkprQmdVcWpIVkFaeWpDUTltWlBuT0kyMDB1bTRTS2ZvQytBNkFN?=
 =?utf-8?B?dXNXOXRjWjkzdGRqRThUVFl0aW94ZGxIaWpXMVljR2FqTW9pWE0wcEVWalRP?=
 =?utf-8?B?SE1VZVJNUUkvbEdKTFZWdFJMb0tKL0pKaEw4SVdzT1J3TDM1V2VtTEhLdWZ2?=
 =?utf-8?B?Zld2b1MwUnNjTlFoRlJaeWoyaVFNK3hBR1g5RjVMZDRuUlN0cFVkaGw5ME1J?=
 =?utf-8?B?K240SmxIWjFoZ29YbGtTZDMrTVR0MVdFMThRclpkbmlCWml2T0RrZEJIa05L?=
 =?utf-8?B?M1V0NGs2WDlVQmhhdU1kNG9xL2NKMklvcktNMEJ1ckFtOTFQaHJ5SFJQMllM?=
 =?utf-8?B?TmV4Y3h6Y0kyQjJia2luTHVacW5HNUxRMTFxSjkwN2RjQzZ3OHVRM0ZucHll?=
 =?utf-8?B?RjhXRU5VQ294bGFkdWY2T3dKRWZGVU9JQkFZYlRIaFRaVDM0RUk3SmVncnUv?=
 =?utf-8?B?SGw5QzVrV0U5WkJ4Q1AvaGVHbWtxWWhKbTdWUUJxdHkvd1FqTHdNcW5zNGts?=
 =?utf-8?B?Qm1GU2VZdGhkWXFST3ZCR2pxVGt0ZUtydktDMmFtU2NmN3NnMXVMN0NVM1pF?=
 =?utf-8?B?QnFJUlZDNHpybkVEeDllSUZpa1hMS21hT0NVTFV2SXAzTGdjL2ExdjVvbWJW?=
 =?utf-8?B?NG1TcWpBV29JaUlGelhzN0drQjdrZW90Z3Z5R0swTUJ2UXhQSlB5Zmh1R3dz?=
 =?utf-8?B?S0FvRzRYTXQwVjE4Wm8wTk0vb1BLdGFZTEtaa2xtTndBaGhtcENML0lzSU1s?=
 =?utf-8?B?a0ZaS25rUHNRT2hMNllSQWZkVlUyMjRHM2tKV0p5dXNuUENmMVp4N1JVa2My?=
 =?utf-8?B?ZFRPVjlRZUU2UWNHKzYwbktqT2x0aHpxSExCU2QzUzJKRUJjVFI2MWt4QU15?=
 =?utf-8?B?c2R1VUhhUjE4TzdCMnAxZjJ3dHA2bHhWaStyUVRSSUVZR3haeVQ5SGEwZ2t5?=
 =?utf-8?B?R0wwMlhEc2VQQllzblZtNHZjMzFhejRaUHBiei9zVUd4bFRaQ1JjU0tpVm5I?=
 =?utf-8?B?d1BnS2l3TzVSYXA0a1ZiNGJQVXdFT25LNlNCOVlPZG5JL2JmbFVkdFVGd25n?=
 =?utf-8?B?QVc1cUR4eFYyRmJMQWtHdE5RU2Y3RW15bGJKSFBUaU1jUFlHMnZnbEdlN0wv?=
 =?utf-8?B?a1VoMHVZVkVlMi9oRklKSEtaVW1VQlpBY2F2WnJaU2kvYmtxTnpVS1UvSjhM?=
 =?utf-8?B?Q1JuOEwwdE5YSGQ2VTY0VCtzZndSYWE5eFRaNFFRRTlOeWdvdnZkKzN4WDJG?=
 =?utf-8?B?UEd5K0dyK2RoVGk0WU5OTHNyKzFGek85U1BDb2QwaUUxQm83aVJqSlFOUEpq?=
 =?utf-8?B?UVF5OXZ5WmdMdjVTMGd6SzFPY0toaitwWTdGbmdISnN6QXpJeHJDREhYQUNo?=
 =?utf-8?B?YlZHMWRKTkJGcjB1SG85SDFpZVFUMHdwZmhxdzFBeEU2SVlYMTdNYXVEdE9Q?=
 =?utf-8?B?MmJlTnQyUnFHa3RlZy9oZ2Y5dFg4TmRMbFRjeG9tUGtSd3AwVU1TMHEvL2Rn?=
 =?utf-8?Q?0VjONF3mPoW07HzWnLl4?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c3eb0a-f982-4248-ec1d-08dc9fe8b401
X-MS-Exchange-CrossTenant-AuthSource: PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 07:28:18.3045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1274


On 2024/7/9 14:36, Li Qiang wrote:
> In general it's a good idea to avoid using bare unreachable() because it
> introduces undefined behavior in compiled code. but it caused a compilation warning,
> Using BUG() instead of unreachable() to resolve compilation warnings.
>
> Fixes the following warnings:
>      drivers/clk/sophgo/clk-cv18xx-ip.o: warning: objtool: mmux_round_rate() falls through to next function bypass_div_round_rate()

I tried to build this drivers/clk/sophgo/clk-cv18xx-ip.c but don't see 
the warning. I'm using make W=1 with gcc 13.2.0

What's the meaning of this warning message and how to reproduce this?

>
> Fixes: 80fd61ec46124 ("clk: sophgo: Add clock support for CV1800 SoC")
> Signed-off-by: Li Qiang <liqiang01@kylinos.cn>
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
