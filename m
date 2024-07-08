Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2061.outbound.protection.outlook.com [40.92.103.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C375413ACC
	for <linux-clk@vger.kernel.org>; Mon,  8 Jul 2024 07:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720422493; cv=fail; b=Wh7p1BHfa+6Ov+GzsmKKKKzieEg1mlvRXv32uib9KmSKLIx0HJoVvGo/mdKw3Dgj+nqtRjffkU9bNRthGv6Wu0ve2zB/43+nkkrisL4UD7eEKcl10V1MkvuFzMzdUGdWTNMyoCn7tAbefqykVuBWT9oAmkmzJBqM+hfdnyjJKtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720422493; c=relaxed/simple;
	bh=zpLG0lCXjE3GxEcMgzxrQTIbveuF2udlLohs004AUBw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oi72gz9FSc7RHf4fIB4S5KUcTuLOSNQOljOoOJzcbo9LwUNLPpqe8f330pRRegB24cajo+GchTSXK5u4x5Sg+ofxHoOFiEiV9s6xjgewt0CZMZSgzmT7FvAFVcQ3WFlq96q5K1gqsaF2dPA877TjAhsMjXUvAJmimfsGmaE2ufg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=IDkK2nxQ; arc=fail smtp.client-ip=40.92.103.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="IDkK2nxQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGja6fHqmBIgPRVU/2K9JxRBQ+Pg+8/uzT2Lx9Lxtzw9Uh3ahgEx2mtMUj5l2ddKtI2raFztTyZevekZJGWJn+5QI+mnbQIv7800DaHoiXflSyxRT0uGqpGMAZBnCa7wYeGBwFLVDbNuEUb7G8b9R5Qpop7DrLxnYNCnSACpg3wXvgYYq0hBesVc5S4bMWXCaJ5BeGPxoKpFrTynOeFi4X/ScTGYRPThAxWBvD+scm0vy4XHPXrO/MarPfWnwj/wB8KvP6wjjO/VlZj8v/bWiOJXfmJ0/cmfVgCGZK2jbzD7oeDZPF3DkEx8zzPmaMtAxV4z8xymgCsW9quDPhFTqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fdWm+fa2tkDIgkj8ofGkHPYwGVRjfPe36uXqgE5yNQ=;
 b=n0wYfYxpSsS8w/DfmcwwhSpdfPVtqLweaP1adObLGeKw2yfF3ERYXIknjta0l6HnqFIlYeZwOge7glF4fA2FsyuapjU9OSpTMcwEd2jZKJGnKKowCFFdpQ072hitCCSNfUH3XbUGgcQVE0KiUJvYuMGoKJWT7SJBcNv78N/9NbgQu++VvlyFel7AxxZESrqHf5jgRbe9yR2h2xAbUSela97cEkU/ozhgLJSoeB708cCggDmasqPzogFlT5UJY+usFYS3P692yj9nZeyiIo0M6vwbMIm8s5P8hG88wUWNbej2KpXZJ6f5iMCe4axXkomtmiCEKMFi4XxjKF515zpF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fdWm+fa2tkDIgkj8ofGkHPYwGVRjfPe36uXqgE5yNQ=;
 b=IDkK2nxQmTCsKPnaUPOlqI9zBuMr8CHWBVMwVMAW0jYV7B9wcUORrS4qzC5lTpzExsUyBim2jAcYaou2RzaUm+y/D7vJM2lYZQqjXYwscgTDnzQnsYCDjC1Uve9yqsvQuWu502+LotYTu3zAxEyDYOs8ZHaqTZHwRPGFx+TWyB7Uu6I59MQ4tVqYkETG54Fz7Ry/gFcXTS/IaSmqSJZ9L8gdIbexMLTC5J6ceFEcPOi5VAvXPdqSJZKvN0/gh8KCg8XaNZvIsycDhU+2FHKZjD4XDjV9ObleWYZhLjorRl1VQ8tD3S+qviE1oZM3jdLitlqI9rJxXBga4yqmsat5/Q==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB0082.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 07:08:05 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 07:08:05 +0000
Message-ID:
 <MA0P287MB2822A84857D59A4A3445C422FEDA2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 8 Jul 2024 15:08:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk/sophgo: Using BUG() instead of unreachable() in
 mmux_get_parent_id()
To: Li Qiang <liqiang01@kylinos.cn>, mturquette@baylibre.com,
 sboyd@kernel.org, inochiama@outlook.com
Cc: linux-clk@vger.kernel.org
References: <MA0P287MB2822A3AD8FA3BDA01F54BF45FEDF2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240708042701.80846-1-liqiang01@kylinos.cn>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240708042701.80846-1-liqiang01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [btYx18/qwJbqvO+4tWFALrWfntMJ1OVJ]
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <e2cf0684-b3a9-4fe3-9a31-a881442149ac@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB0082:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd4122e-89f8-4923-f788-08dc9f1cb68d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799003|8060799006|4302099013|3412199025|440099028|1602099012;
X-Microsoft-Antispam-Message-Info:
	ocJm9iSYG8/wvXVxVd7Ix2payKg71Cll0DGNkNui4oH4Li2Vv3QBl5gEeDujC5KoFC6FIZAYqV9spqfudQYiKtDtWehtrTX0KRcq/CYCFtSdr+QPHr936m3o8WuH/jf7aFPUHtMOu1jRmxYOtQG4Jmwx/W7S79bNtaiKDxh9i9aKcONq5AD3rbZ7ScHWNMRE+PAC/GFsD9JzVVSTNsm7BalBzB2wVnp9DIqDKIP3cbFfJpCsgcS8KI5Niq9ilH3yAdw+ApMXkxVOAwR3F8gnJW+Y7yUVeYkINRCdOWL/MtIFV6oY0Jcnz6i7eg18HCJeBjl9TJRDFGDeDin8gCPvqtuQKJ2IIzG9SstvGsHuJf354hWcfBzaOWpmd+hhT943Ck3wbMugoSSXNe4NJ1jqusike8PaJyYZhk5y3YdNAhObLm4euQ9udId8J7SEQbkt1dJkAmwrRVBZ1hvwr1MLh5Eb59ATXUOHDnovW8U8LYI6nWD3pH6Vv0BZkI54lVQz2Y6BMqlxkPtUszSumQsQ9bbBjHo1RB7Gq9oC/nuTPxqEfEjOpdEG05ah5dTquQpU3hRi96syu3mO8Vp6CJx9yoODm18HS4Ne4lnstiytzpBCAKAxahYw5jKdA6MM8iGHm5KGvATZ+gH5c0wQ/Z9EUbpCn6U6/VcHFvy0sRn0h4dN/kZkQcnC4f+WvrDzp/4HKnTLqwbtBEKRfXH1yUu59tOvxw6q0Kf5PfVbMS4Jg7vSu5N7OH+uk9q6/EieYIgyneM1E6aKMs748S4zfA7lcQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTFEYWVveU9Bb1JQRTE2bFBVaXk3dW5KMzJrZmtobUhiSkFtSERWM01VUU41?=
 =?utf-8?B?b1Y1NjcvZk1GV2gzdWF4bDRUQWRySG5jV1pJRzQvdXZYMVRCMkNPMkhZYzBk?=
 =?utf-8?B?ZlZxdXdPRzF6aXdnNmtpdE5NVlFBb3hPb2VnYzZISDJjVWErM0ozRVFGSFh1?=
 =?utf-8?B?VktMZnFnRHpMaWJXM2FZUExvSThFMGJsRVltaElwZ1FYWHBzMlJ4bEZLa2Nx?=
 =?utf-8?B?YkhoeUhUcUdSYVFBWlYweG9QbW0vQmtMNjJEY3owV2dWeEMwQi82SjVKdHZB?=
 =?utf-8?B?Uk1WRDg4VjNwSDg3b2Eya29MM0hlRnZsTktZcy84WGR1SWFwdU9sLzlOUWFH?=
 =?utf-8?B?WkszdHQ1RDFMREpBYVRna0l2SDhhOWx0SCtyRmZ3STYwNFVDUE5DeEpoeGE0?=
 =?utf-8?B?UnR1RHBLZGFOU3pTUWtiNXV0U2lnVWs0NnB0K2tha0NHWUROaUtmbSs1VnR6?=
 =?utf-8?B?Ri9PUldQWjBQOStNeFVNM1JTSytBV1loRGtzbllKcXhqWFo3QmMva2xEVDZo?=
 =?utf-8?B?V1Rnd2VCUzVjT0FadWwrMkdlSWNsSWJuMlNyWm80NnF1UzlUMXljaGVVSkNO?=
 =?utf-8?B?V2liaHV4SFl2bHlGT0NUK1NjdWVRSzloZTF3VngyZ3hVTUdEbitOK05Oa3F0?=
 =?utf-8?B?RE1YRFhldHFyaFkrb3dDcTBOWEpRU3BDRFdGSXJHKzludjJ6TEoxdjV5SjN5?=
 =?utf-8?B?MS91dWdEM1pGVVc3eVNnL0pHTE5tMWlnQjFpWHh1VVBXckZRMDJZLzhXV0FB?=
 =?utf-8?B?WHJkeEo1aXhER1BDSHhPS2lyREJRQjY5c1hpMGs4QW9IQlpaK2hzcXl5WFcx?=
 =?utf-8?B?SGRoUkNXUXVJWU5xYXpPNTRGbHpUaU04WVJQWGN0V1FTVSt0OUUvamttbkNl?=
 =?utf-8?B?SnBmVUFmSXFCM1NBVnJuZkpnLzIyNnpZT0Q3b2lMV2xOcWlmeGUybTVyYU9Y?=
 =?utf-8?B?cG42dFhsT0lyNEpUMGNrbk5RMzN4dlJtRmFFZDdCdmhTMzZ6dlR0RCswbEJF?=
 =?utf-8?B?L0pYOEREZXd1Z28vSWVzUjhSakVuL3FsM21saVdCeXg5MExOSjVtcWhFNTBD?=
 =?utf-8?B?TGw5UnVpZUo1NkdlR3FmaTM3dUc0eWYxLzVUYkcrT2srS0Z6dGhkc1B0anJ0?=
 =?utf-8?B?VVVaUlhBVUYwdUF0SFhpUHFyd3VzN3JwK0ZPeWVLUW5xUE5ZblduOVVnTXZF?=
 =?utf-8?B?c0F0NytGOTFDSEZUd1Qzanp1UU05UlFXR1dsQWdVdWxrSmszalhsU2tOVUlB?=
 =?utf-8?B?cFB0QnV3ZFRCRDRmeTVObXVVV0I2MUEyMW9KQ3R2VWRMdVY1dXpJc2hJR0ti?=
 =?utf-8?B?TjcvWEdXV2FISnJqK3JBZmhZbk5weTVBZjhMamdGZFU3NDBWSENWenlzemdO?=
 =?utf-8?B?OXlMNVFzaHhQOFQ0Q0FWa0dHVWpZN2xIZXRQbVVpaFpRTmMyVkRtcFp0S2Vp?=
 =?utf-8?B?eGxUUXYyNWNkZDh0dE4zTXRPNE5kZTJVUmJUWTVHcW9UL254dVJTWkZIQTVs?=
 =?utf-8?B?ZlJZNzNZYkpuZDNQYktpMm9ZWkJqdzlCZ0F2NDlIL0VIbWoxMUdDWUp2OW9C?=
 =?utf-8?B?d0lLakJkMFZMTHNtbC9KaGcwVW9VdmZoM1RDOGZaNFUxUjNmODcyQVkyNXJ2?=
 =?utf-8?B?UkQyMmUvc2JGL0x0ak1LWjhxMTBtWHNoVkxBT1FTeS9uU2RKNUtkY2hnZTky?=
 =?utf-8?Q?2Wp9BLCmc+GVcq2OaMJ5?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd4122e-89f8-4923-f788-08dc9f1cb68d
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 07:08:05.3303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0082

You may need a cover email to describe the changes and with patch email 
replied to it. See an example FYI: 
https://lore.kernel.org/linux-riscv/20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com/

And this should be the second version and you have to updated the title 
of the cover email to add "v2", and describes the changes from last one.

`git format-patch -1 --cover-letter --thread --base=xxxx -v 2 -o ..` 
should help you.

See 
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#the-canonical-patch-format


On 2024/7/8 12:27, Li Qiang wrote:
> In general it's a good idea to avoid using bare unreachable() because it
> introduces undefined behavior in compiled code. but it caused a compilation warning,
> Using BUG() instead of unreachable() to resolve compilation warnings.
>
> Fixes the following warnings:
>      drivers/clk/sophgo/clk-cv18xx-ip.o: warning: objtool: mmux_round_rate() falls through to next function bypass_div_round_rate()
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
