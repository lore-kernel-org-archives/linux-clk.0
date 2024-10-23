Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2057.outbound.protection.outlook.com [40.92.102.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789ED10F4
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 00:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729642955; cv=fail; b=KWi1YZfjvUs7QqTQBPPm2OPYN99WPx3r01adDBKBT1e15WpQW6qMpZfzFvZ4NEOL7O0P5AedNROsABy9jEK0scs2cae0Ix6CWY2WlUvwfvqZdGIUk2/PuGpd/EsqFFSZQV7EHzQ5h3DWbPIX8JuET6AEngvH9qIfHu+kNO0gHqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729642955; c=relaxed/simple;
	bh=6KKQG8qWPDW8rMaaKOb82EugeeOUs+VvLM/Z+847jwg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S/cwy8Ho8J7c3UZeCmhkkxKw7d3fS+ypZ5hWk2st0A08zo1wjiGsDvxhFk2JBvWgmywtkp3QZNtxeRx6YkyPtD2vkhN2rnTD6VfYx5PCIvnFU2gGGOtPvSAQwppzz3/yMNI8BDG6ElcCJ4PVTCBEkpgtAes3b9zcIe0llG7i4io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=cXs0N+iJ; arc=fail smtp.client-ip=40.92.102.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="cXs0N+iJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pY9KhS4OmjwwFMxwbYEhp7FfNVovOsksp9p7phNOiGe+iR/5fdMSdo+jxv91e/ZHTtQZf5FN/H7/yfNOZbZP2uTkn4l37LciqjcvNCwfK68j0+jpwgdwS5roA9TObtiUPoCg2jyzvcpfxhcjKb93qSscRSpLkIPpVlJDwyrjODy3WeIZfnpYedtrRUlqx2RusDtf8Ixqn8v28tzWScwGCCySrHNlGO91yQrn7x78wGQYMtTD1HDjYbuyVhlNq5jZ8QJu7elDLgimrJT+E0KXArAO6osKmTQ4pSBICembsqD8mc9glMBdNrCS/yczAPou2Rmw03pLk69pX6HmPK6Csw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sH3Ix16MY3at2oyNIwsFaU+LAWhkGrJz3AySxySrVj0=;
 b=lJYp0P8MQaCimsv0/fQzDJXGGHDOyXvHhWDPCoPAy/74aOm9J1oLlYDCvsHUN5m6bRQlxdS9UP1+fj8mXLbzolhydnISrdmAcWwh9Hwi/WNIiaWAmp1vEwgYz7C6HStA6w+S4Rjo750KySAvTqv5IVCF+AuLabChG7gof6+A+zkYDCUTZVL3GvyHJnOhGtdHisT77qYdU/BnLHwEUT11qMTfulD/WXAEqTk1hWVLHcZ9PTnwqFnCGnZpyhjf7tVIU9KKWJxLND2GjiTWynmjoT4Fp3r4oRwjT4tLeibn6LBXuQdsSW5Dm8Q749uJRpiaM8hbhPb9z92x9PQjbJU5kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sH3Ix16MY3at2oyNIwsFaU+LAWhkGrJz3AySxySrVj0=;
 b=cXs0N+iJf0V8uFpQqlO6mxmKV9uF1IUoqHuBbTGkWQDLKTGaenNkcFiLS2J2KQvR4vkByoUdNa6gbWolCxRfqtePXvG/EOhX3qYmQelgPjgfbEhbmSOZR+//8YeX5HAT0egp8Qe5H3cKVCdT2E6Pifo5h5ofSLysdga9Fu2kmRBYll3U0uF7kSxmaEpHDrK2Qk3j9LsmXqj62OWdYy+DNK8Kh/ndQZttxvdVdwrvwILce+Dvjgvop6yZUL0OxA3FfzMuWQN/A/pvAnnOFfG6pCyJoZvaAcqKIaC92t2aJe4hkrBjlbGGS6d1aiXhT/bbZoHksu+Wy1BjlGGPeTNIuQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB0253.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 00:22:28 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 00:22:28 +0000
Message-ID:
 <MA0P287MB2822688A0BA02538A7272121FE4D2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 23 Oct 2024 08:22:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: sophgo: Cast an operand to u64 to prevent
 potential unsigned long overflow on 32-bit machine in
 sg2042_pll_recalc_rate()
To: Gax-c <zichenxie0106@gmail.com>, mturquette@baylibre.com,
 sboyd@kernel.org, inochiama@outlook.com, nathan@kernel.org,
 dan.carpenter@linaro.org
Cc: linux-clk@vger.kernel.org, zzjas98@gmail.com, chenyuan0y@gmail.com
References: <20241022201244.8992-1-zichenxie0106@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20241022201244.8992-1-zichenxie0106@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::34)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <aea42829-8d9b-49e7-ac96-3eb19d63bbd8@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB0253:EE_
X-MS-Office365-Filtering-Correlation-Id: 0680046f-4861-4324-e69d-08dcf2f8c6b8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|6090799003|5072599009|8060799006|15080799006|7092599003|461199028|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	ZOLxSGGP3caQzsKNHEy3WWXR11KhCQr6E66eAUYiN6FBEb9Vy7TSBrRsoTehaOFK3Bp3r8rf4eAt6X5BiYue7cWk9jSXInXaBRTbtu8YcK4Q+ER2M3IAOqxYWgHbiuFOgZUu6O2gT3r3bRsc4Zct2K7EjHpU8qJAf4jhmJpyeXqcMRn2IwugsMM3RT0gwkZfucdhKZ6Zh8vO1iLSVrxmNdtm/WHiZWLwDLe35975beXUgww9u8Xrtj/3skbJLis92E7Lryf+MoMCKWPQM8/BJ6qXsnPwRtB6JG+1ySA/EY+3TYqFqxexeKxZxc8IcRBZ//5RBVL0sK9ixmU+xrY1w3btLa6NqQ9cucoYZM7jWLkV5GLBCWkAaXTsshb4/kEMZl4iw+MI/g9rZZ11O/82Oalv+uLeQ6Q72wRj6+HU0w9S/In1NH66dXXXFvMA7JZm/3wSqaP2+NLSCKP1ypsQty1lsleb4fE5EvA2ovhfxWrjS1olxGTGCLgPq4EkA5XsnT3t6s10aYefh8TQE6+3p+ljbCS3+7nS1wOw7qNy/wJym8pXF/SZJ/7Le4rqVefSVOSGrbK2S249v/K5JXjW+22Ig/r+ac3ubeoGT4vFUwJ68bEhM/qQo4ZZjsCAtO8B72ofh5xAbIrHGJao1ls2e897ZfVPxP2tquqjzji8IrmnXtG93UCTzGNw/hIwtYa9tBW3XWdhs1Hqfl7i2jxubkD76J6k9HHUny2ANYL/+GoMsVVagN8SO6V6dXVM2tSb0pATUtLzxRAO+wsl5EmZww==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzBQRG12ZGIzVVhyVmdsK0ZTN0VkUFA4VUJzM3ZINUs3R1M3YVZURHFtdk1N?=
 =?utf-8?B?M3AxSVVPQzVtSVhoTVo1cEMvT2RzRjRSZVhWeWthbHh3T1prZFduOGtvdytu?=
 =?utf-8?B?cDBXTjduelRTZGhrWkZPak1JbFMwMHhuUkdMWGVTWi9VSnhZVTd3ZitXL2tZ?=
 =?utf-8?B?Y2kzR2tGRlpiK0xLVDR1ZHcyTWtUNVRlSGZlKzh2NnBrV3RiS0FYSXpya082?=
 =?utf-8?B?TlZVOGlnK3N5RW9saW5XNjRBZXpMQW8yblUrellpTVJXdkpKUzhSdVNNU2JN?=
 =?utf-8?B?QyszTHJncDBLVlIrUTM5aEZqTkpCVTRwVlV5VlcwVjIvb05RU1QwV3ptaEpJ?=
 =?utf-8?B?dVFmQXJpRllJdlVFZDZLWjlobEhyd1RISjZlSXlIVWo3U1l4Y3l1cTNvZmtT?=
 =?utf-8?B?WVIrZjVMM2szYmtuTzhKaVV5OWlOdmxTNDI0SnJ4QVZqRzlIQUJkNkszTEhV?=
 =?utf-8?B?TWdyTVZSSUMvZ2ltc0czcVAxWUh1OG92aDgyM1hibFF0VHBKR3hOTXRIaFlo?=
 =?utf-8?B?UUhEdWkvT1pqNjVhZnZ5djZiSGZLNGpZbmlxWkVMK1Q0KzBjcStzYjJBbXZG?=
 =?utf-8?B?MllWOHJQUkxkWS9QWjNCcE9yenhVdTgzb0NHdUVkNG03dGZHaXdyLzJXd0pQ?=
 =?utf-8?B?TytCcjRIM3FqN0lZWnJZRmQrL0orRTlRaVlENThDeDZtT1BWa1FvUWc1NjNV?=
 =?utf-8?B?Q09zazMvWE16VlRLUndJeDBSVmQyTklpR0wzbVE4L1Q2VW1vc3cyUlNIMENW?=
 =?utf-8?B?ZURHU3B3N1BmcTBBUnJ2RVlmbndGME0vbm1XUzdBVXN0aTFZTHJmQ1l4ZlRi?=
 =?utf-8?B?aHl2dU9neWs5WWVRVndMTDQ4TklHamdhcnBJU1dodndqZjRvUXdmTmxQMEI0?=
 =?utf-8?B?eDFqbUhJZDlHMU9pWll2cTUvRklwOE1ERWhtOXBsOWpjLzU4YU5LajdHeE5r?=
 =?utf-8?B?ZjAyc0tiSDBPSDBFaGlCWUZzUnBuYnVUYlNIV1JQa1gxKzZBbFA4QmNIKytV?=
 =?utf-8?B?V0tTdjJjTUU3Z1RaMmV3S1dhU1FwM2w1YWFRYUl5TFNLdXJVNlpIaklCVkVF?=
 =?utf-8?B?NkFIU2FINjRFYTNEaTdDM0VjUEVXSnV5ZEkwcldLdWNnZklETnZKSkM3dnB0?=
 =?utf-8?B?aFJraEZUWERXd0dhSHM2N3BYYjk0WERjOHJndWZxbkw1RVRJVlF1akdZbUNo?=
 =?utf-8?B?SWFJT292a0pMaXhWR1JNa0pXQkdlcGVRL0M0WmJGNVpadnlMRkUzNktMYW01?=
 =?utf-8?B?eFg1WmVIMGRqbUxxY1V5T2dMemd2dmp1aEt3MDZ2d1pZVmp0Q2R5dmZrdnlB?=
 =?utf-8?B?ak53dGFkOVA2K2ZoQ3BFMXFzMGIzaDlVRUxPSUdNK3VUSXVpMWFtRy9xaDln?=
 =?utf-8?B?V0l2N2hxejVHYk53d2xZN1F1MjRMTGh2NkRDWTlReEJ2RHl4UTNsWjRQRWtL?=
 =?utf-8?B?cU1CS0wvWGlqSlF5MzJlRXF4d09xWU9majlqY3hZT3ZwSWQ1S3VoM1cxSXR0?=
 =?utf-8?B?WjIweElWSGcwNm4zNGp0YndXT3VRQUdVWVlmKzRNcFUzdm1kTm1xQ0NNbnY4?=
 =?utf-8?B?R29PaTBMNGJwOU9sbnYwazBuV3cvbzZEYkxRN01IbG5TZjBYM3dnS0NGNWJY?=
 =?utf-8?B?bzFEZWc4M2tEZEVkUkJ5dHFKTEZnV2tLMUtQTnh1OHJwMDN2VVVLR3paTE91?=
 =?utf-8?Q?t0GqjiK5hkSaK54lDB3T?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0680046f-4861-4324-e69d-08dcf2f8c6b8
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 00:22:28.1862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0253


On 2024/10/23 4:12, Gax-c wrote:
> From: Zichen Xie <zichenxie0106@gmail.com>
>
> This was found by a static analyzer.
> There may be a potential integer overflow issue in
> sg2042_pll_recalc_rate(). numerator is defined as u64 while
> parent_rate is defined as unsigned long and ctrl_table.fbdiv
> is defined as unsigned int. On 32-bit machine, the result of
> the calculation will be limited to "u32" without correct casting.
> Integer overflow may occur on high-performance systems.
> We recommended that we cast the denominator as well but
> Dan Carpenter said that it was a max of 3087 and was not even
> vaguely close to the 4 billion mark needed to overflow a u32.
> So, we only cast the numerator here.
>
> Fixes: 48cf7e01386e ("clk: sophgo: Add SG2042 clock driver")
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Thanks.

> ---
> v2: modified patch to numerator casting only.
> v3: modified wrapping to make it clear.
> ---
>   drivers/clk/sophgo/clk-sg2042-pll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
> index ff9deeef509b..1537f4f05860 100644
> --- a/drivers/clk/sophgo/clk-sg2042-pll.c
> +++ b/drivers/clk/sophgo/clk-sg2042-pll.c
> @@ -153,7 +153,7 @@ static unsigned long sg2042_pll_recalc_rate(unsigned int reg_value,
>   
>   	sg2042_pll_ctrl_decode(reg_value, &ctrl_table);
>   
> -	numerator = parent_rate * ctrl_table.fbdiv;
> +	numerator = (u64)parent_rate * ctrl_table.fbdiv;
>   	denominator = ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
>   	do_div(numerator, denominator);
>   	return numerator;
