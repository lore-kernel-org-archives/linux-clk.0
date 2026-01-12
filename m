Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010006.outbound.protection.outlook.com [52.103.68.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C39222566;
	Mon, 12 Jan 2026 02:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768186656; cv=fail; b=RwrK+i59nFdZ6CuxZywuIRcZLaPM1rFmX+B7aPg3ggL0vW1gf/VqofkQ253BTH4x0b4DojQMbzF3grWJQVZov/Ohm9h1qe/CdPUs8vkdwpdd8f6mmFp/fx2mUkcBxH3hSIV569A+beS4eq3D61SBTQkw1Kvofpcy+ItNfr5BmkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768186656; c=relaxed/simple;
	bh=F9fBSD8CWFxDS+US6D+FYiE1fjRcSY8H0JofGWwxeYM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XK99KVawIyq4N9zcOkOYqZdtycaUnjbbPuHgD+MxUs1fIu6iHbjwqEqIu+QqupIKys0LzSYY5wOPW8CSQnVws2eBx6QaW0ZmIIqPwjjn7ieC9/BtuHXq2DuIPpU8CbqdT60wzCQ3saibhzAJ09LTS6eaKNYHmwSbPg08ey9cNVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=th+21Joq; arc=fail smtp.client-ip=52.103.68.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="th+21Joq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJa1qqMs6PuQRZK2SjTsFDlwYhSIky8WwqDt2hzCx/L8p17rM/MWbpr1FPlIDmMAtnLdtEMJ8rW52aTyAlOaPOI9xgrSJgY2bqK7Rb128Rn5evyr7ZbJCl8a0TpvRYzc1/D33xBxYi8yguNaLojxP/HvEwUmsj2fDiGDez7M4amDWCHdEBxN6dcgtygficrT0KUGzey3J9tEdekpUrnDK8EE4HKGJJi2O8IzGB0n8d53LidD6fd8H5W9ZjXU2Yxx/jJ/IROYODv/CXonWqLrReFakxMju2FuzyKAbs/7WMfGRrVP0bzjx6MQMNYsqN72tS7D8YsoBjbZbuJB/En+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rF0t0Z5Go7XhNyYUG9Lb0KNTElrh/cYZTNYTNj0HekM=;
 b=AGDhrvhjC9/F6oCrwYykeHHJQIPlzTIsQxJWgLkUfqb9YzZzVXg3G9/HixvqYAtVHo/DQ45VTvnPHFHUt9tNxC/DeXJTeCbQKcS0DoR6SMTSpv1jjRFNyb5KhhbjM2oyTqQNCrqbPRaCwGRFTyke/cNnXwSYbi69kNu2gRx8Bl+i2MAH2/k088wLnte5nEOkD+46Rr7FXb27T8nu8n9UgtiOdUct2OOt6d6NBOFPIgoJ7cP3BUiq4lQz47mZ5P7r7vkyZxH08UBqeU871kS1qnRbpUfri0mQF5rPB44XOgrIcmPEccC4L1PItK9+zvS3q54KVomSO4gy+qL9dezTfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rF0t0Z5Go7XhNyYUG9Lb0KNTElrh/cYZTNYTNj0HekM=;
 b=th+21JoqSRkRvKuA34TWP3Tzf90JRFrCLP16Rd09KTwH0V+iiER29wXRF9uXNDXd2skqjkH8MGhjjiiz26PB2shMl7av2hXz0VYgixbQ/aIhSaxTSmk1Bkyh3tNqp85vyf8StKSvNHh58clb5G7TPcR7wEJvAtFH09QQpLFs5pgFJU5wt0gVl6iV0MpKgAyB3nRTxTiFPETbLv9cDpChf9aHnWxJ6GemWhM3NN9az/1NvMFWxUKKe9LipefGV/P7sBwpU1fMFXAnF5KzdwwkDtY1v8ERjjfGI2mQv9wcHBrq0m/d/UQUp2STGF6HFWP085kB0DxaA3y0ITXiyT0hdQ==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN0PR01MB8695.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Mon, 12 Jan
 2026 02:57:25 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 02:57:25 +0000
Message-ID:
 <MA5PR01MB1250095A65211598BF17058E5FE81A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 12 Jan 2026 10:57:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/27] clk: sophgo: sg2042-clkgen: convert from
 divider_round_rate() to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-17-535a3ed73bf3@redhat.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-17-535a3ed73bf3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0190.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::11) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <1d8465ed-2f81-4afb-ad03-fac400fe6172@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN0PR01MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: c93aa856-174b-4d7a-6de5-08de51864f26
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|461199028|19110799012|8060799015|6090799003|23021999003|8022599003|41001999006|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1l1OEJNdU80dXU0blhrSk5tUXVOajhyWkkvMjN2RFlLejBZaW9NbmY3a3NQ?=
 =?utf-8?B?VSt6MUMwVE8wendtRjNpbkZ6bzBaY3Avd2ZTcGIwcFNJdTZVYU5JWUxiMjBa?=
 =?utf-8?B?Mm52cW5hYlJXUTRtV3hTV0tPU2pXSFY2UXBrZGZKaEdBS1B0eGpmVWY2VXR2?=
 =?utf-8?B?bXFjZ1NtL3U3WU5qamVSQ0VMZFl6QnFyU0wxWDFuVllkbUNTdWFYVkQ1ajlQ?=
 =?utf-8?B?bElTV2FMcnc2eXlCeGREUGFmOTJSUVZkRjJDOFpyWEtVM0x5THJYOW5YbUhn?=
 =?utf-8?B?cGJTK3I3NVJJM1VTRWFGUi9QVzNyWUJNTlk4Yjl3c1dpeHZPeWorTU5qbWdi?=
 =?utf-8?B?MTMzZTNmbUxPTTNvZVA3NmlSNis2SWk0UjJBVEsycUxPdFdneWU1V0hLVk5Y?=
 =?utf-8?B?STdIeWV2UEJUK1RhWFo2ZVZRL3k4WXlXZXBBY2tXUUxEK242dU5pMlFLcXlY?=
 =?utf-8?B?UjVtYXZXZElQK1I4SEpJQVQ1aFJKd21aWS9UWnROTzdqLzFQNVZCaGF4U2pv?=
 =?utf-8?B?VUdHVGordndmaWFVZXdwRERhZ2htTzRaSFBKT1FvT0YxZkRUN3hiU09mMy9h?=
 =?utf-8?B?U0NFVDE5SHppNTRtTHFoMURzNzhSZVIyT0JTSjIza3QrVHNnZHVIL0F1NFpC?=
 =?utf-8?B?UDlyN1I1aHZWK0hGUDRSK0hBLzBIeGtoMldjdXRjc1JiaURkUU9YUHZnZUVQ?=
 =?utf-8?B?SHlNMjZzSk03Qi8rY1UvbmI3czk3NGVQUjRxYktLQXVWYlNYVThBb3A1aS9q?=
 =?utf-8?B?QWVudmpiMFduSS9meUcwSnE2VGIrRHl4a2xaZTl6bG5uaXhZYXVSSTdyZ1NE?=
 =?utf-8?B?ZE1JWFd0T3lyMjdmTElCeWJxZVY1b09ZQTlOYXFjcEZnL0ZEekNSMkY0QWdn?=
 =?utf-8?B?UnpwM09YRitTdVVkRWpRclRBNW5GTjRVdGJVT0tOdDg1NVdGbCt0NS8zUEJo?=
 =?utf-8?B?ZGlTZ0svTXRjb3ZjdSsxRnIwcTVsSGQzZ2xEQnVuU044Rml5Q0Q2eGxQOWZG?=
 =?utf-8?B?RmtFcEYyd3lHYmpRVkxpS282NnNITllVRFQ2T05IRzlnZDg2Y3dFbmk0OXpw?=
 =?utf-8?B?SjY1Y1NQSWRwRHVqVkpuNnBheE1YRVU5RkZVZEVmTG1PWlZlZzNqUFhUa1pW?=
 =?utf-8?B?QWt5U0FuSHdxaDRrdkx4NkFYaVlEbWhFVnpRVlVialMvYnZyOW5zbVZyMWlY?=
 =?utf-8?B?RjVrSEJTSW1QUklGSHFQcnlvMmo4T3FDNGUyR2lxUjI3bmpZeWU4QmlaaTdK?=
 =?utf-8?B?RlZiRlpKTzFqcDExUjl2YjF1MU9MdVZOeldHOHZxd3ZCZFl2OFJWbTJZTFpH?=
 =?utf-8?B?NjhNK0dPeWpJd3FMZk44WnNFTHIya0s5cHEvRFdxbXQ3MGdSNkFRRHgwanE5?=
 =?utf-8?B?eU9wN3hZd1JQOFA2elg1Y2FqNmtNZWNTYy9KZm4vZXZwOUZuN0g4WFdtdERE?=
 =?utf-8?B?T2p5SFBVa1BLbDQ3N284SkE5U05zTFpmdGZYdWNXSlFtN05QWFhlRTRpZjlo?=
 =?utf-8?B?dFZSamtINFEvVXRMQzNBRTFUeGhsSG5RU3JoSGN3UGR1TC9MVjVmQlJYNzli?=
 =?utf-8?B?RWFUY2V1aWVzT0YzWVRwTy9uTlpUS2x0SnZzOXVjUlBJYVY2Q1hMNFJTTzlL?=
 =?utf-8?B?VE5DL29NRG1maVZRNHRUUVZ5YTlwYnc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVBsYWRTMGNDa01haXlaWkFBTXo2bVpVd0VaTlZSMU1pSW9nSXJIZ3ZMSlE4?=
 =?utf-8?B?RkRFNGQ2eUJUU3lXaHgyNjlIV3pIdndJUjkwODY1anNwdTNRL0c5MGc5MVN6?=
 =?utf-8?B?RnZxVWJlWjhURS9CbDRxVy92NUhqQzloYm95NTFXVzE3ajlJVWg0R3ZRdXJk?=
 =?utf-8?B?MzJmQzNETlFXU1NHeUg0bDNWWE1jbnFjc0w5Yy9MY3NlRTBqZHdqeXZ5d09H?=
 =?utf-8?B?Ty82czlRSk5kYTI1R2UxOFUzT0ZiMEhyY3NpeG5pWmtNWHJTcFNOMlNuOGNH?=
 =?utf-8?B?TWE2L0EwZVFUSHhYbTBoeEF6TSswekpLNk5FQ09XSFRVd0FBOU44aTBhYWcy?=
 =?utf-8?B?THJ1bGtNR1hWOTF4UlFXVTRCU2liY0k3bmNUaC84RURxMHRZUUlYK05JVnRu?=
 =?utf-8?B?WXdkOXZBdmluU1hlMFZHMDdJdXRQdEI1RmdvNGE4MFhSU1FMRWVEcUVOTE9i?=
 =?utf-8?B?RkdjOEEyVUdKVnBTajRJUU4zWlV1b1ZobXZuR1gyVjVQQWNOL3AwQXU4dFpy?=
 =?utf-8?B?YVVCMmxOaDR3NWJSa2VMeDFXTVBweE5VZWxlbWlJUy9MLzkzQW9qZ09aQUFx?=
 =?utf-8?B?Sm1jNGVsTE5FNU9lazBFRk55clArNWxJdktpclh0MWJBNDk1WnQyRzE5SVcv?=
 =?utf-8?B?Z1k1TFJXbGF2SDNWYVhTeTRTaU1jbDBlQmZ5WnBQeG1CajRKQnUxbUFYdmtz?=
 =?utf-8?B?RG50U3laM0EzVVY1U2srbHVBOFdUUVpyQjViNjA0NHp1ZFNmSG94eXFDSUdl?=
 =?utf-8?B?NkdDUU5QbHphYmp4L0EwUWYvL1VYVWhON24wUTV6VmVyaFM4WnkzcXpocFJF?=
 =?utf-8?B?L3ZHNGZLTU1vaUFoWHJBYVFJWndVRWhLMG51NUtQbGVTeWUxQXlsNTNvQ1h2?=
 =?utf-8?B?Nm5QSGlVd0FDRHBtQkJ6RnBzRHpnQVd5TVlHd1lmUGYwNll5T3hCSC9DMGRT?=
 =?utf-8?B?NjJhaHJ0ZkJKcjVFeUY4akZSem5YeXZ5bmdkOVVxYTBrL3Z0Z29yM3RidlFk?=
 =?utf-8?B?RHMvMHJ1WTd5VDY3Sk10QU1YejIrR0IyU1E4WDJsZm1XaFFyWkRjUE5nQk5O?=
 =?utf-8?B?akF1NG1WNUM1NDY4RHEyWlJKVDJ2MURaY0lLSUxzSi9saXp5elpzWTZrNmVh?=
 =?utf-8?B?ZFBNOEg4MmdPUndrQkc3Qmdya2pZcFRkQUhZRXBUZzBDUnVjclovcnlEd09M?=
 =?utf-8?B?OG93NUEwUjRUOHN1MWZpZmdybHV4Y0lONEM2b1A0a1B2T1dRWWVGRVlaMjBT?=
 =?utf-8?B?VVRVM3BKS2tpREdtN21aeHNpOW1WMElGSFo0U3JRNjB0SWRCTXdtTjc5MVhQ?=
 =?utf-8?B?K01tdlZZanlWVWNtWForSVYvcEpPVXhlM1B5d1RmNm85R2NieTFKUXl3cWJa?=
 =?utf-8?B?Z3lFTTJCckNlQ0d1ZUxkU3JtRS9jSm41NHkrRDhlN2dZOGZCaUViU29ZNUta?=
 =?utf-8?B?ZmYrTDF6QjM2Y3hKSnpINjgxSjlsZ1piTlFCNCtJWTBFQXA4Q1FrQUZ0UWpJ?=
 =?utf-8?B?L0NxZE5vZmxBWERJaEhBWDNobmRmSHVyUThrUFVTWU8zaktBV0VEQkRtVTlT?=
 =?utf-8?B?ekEyN3BXOU1DSTU0QWJJekVuZjRKdmU3MmFHWExtR01SVkI4SVkzS1pxZU1O?=
 =?utf-8?B?c3ptU2orbEYrN2lRM0pmZmpyOUJSL3g1SnE0Zjdvdng5UG45UWhiWXNvMHdX?=
 =?utf-8?B?cDE5cHV4KzQrNlJTbXVHUDNjc3d3ZWRlYWZJdjVIZnV5Z2F3RkRXZXJkL0pm?=
 =?utf-8?B?d202UUNDK3RCdkhlVW91N1prcXdKRnhOcGhvRzk1eUtEa0Y3QTNONS9Ndk9E?=
 =?utf-8?B?N1dSSi9NMmR2ekk5ZmpZM3oxeXhHelFLc3loQURUamhXbXBVUlRoY1d1QURs?=
 =?utf-8?B?bUczZ3dKdkIvdURQNzk1bFJRajVkcjRtSVhBVFdlSEg2ZW9GWnEyWndvaHZL?=
 =?utf-8?Q?JQSTUcAVGZQce7VKt3idZgDbEP1y7T3v?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c93aa856-174b-4d7a-6de5-08de51864f26
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 02:57:25.4781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB8695


On 1/9/2026 5:16 AM, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
>
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
>
>      req->rate = divider_round_rate(...)
>
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
>
> Note that this commit also removes a debugging message that's not really
> needed.
>
> Fixes: 9a3b6993613d ("clk: sophgo: sg2042-clkgen: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
>
> ---
> To: Chen Wang <unicorn_wang@outlook.com>
> To: Inochi Amaoto <inochiama@gmail.com>
> Cc: sophgo@lists.linux.dev
> ---
>   drivers/clk/sophgo/clk-sg2042-clkgen.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> index 683661b71787c9e5428b168502f6fbb30ea9f7da..9725ac4e050a4e6afd3fd50241fbd2fc105a31ca 100644
> --- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
> +++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> @@ -180,7 +180,6 @@ static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
>   					     struct clk_rate_request *req)
>   {
>   	struct sg2042_divider_clock *divider = to_sg2042_clk_divider(hw);
> -	unsigned long ret_rate;
>   	u32 bestdiv;
>   
>   	/* if read only, just return current value */
> @@ -191,17 +190,13 @@ static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
>   			bestdiv = readl(divider->reg) >> divider->shift;
>   			bestdiv &= clk_div_mask(divider->width);
>   		}
> -		ret_rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
> -	} else {
> -		ret_rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, NULL,
> -					      divider->width, divider->div_flags);
> -	}
> +		req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
>   
> -	pr_debug("--> %s: divider_round_rate: val = %ld\n",
> -		 clk_hw_get_name(hw), ret_rate);
> -	req->rate = ret_rate;
> +		return 0;
> +	}
>   
> -	return 0;
> +	return divider_determine_rate(hw, req, NULL, divider->width,
> +				      divider->div_flags);
>   }
>   
>   static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
Tested-by: Chen Wang <unicorn_wang@outlook.com>

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

BTW: I have a question about the base-commit on which your patch series 
is based. Could you please tell me where I can find this base-commit? 
I'm asking this because I found that for the changes in [25/27] 
phy-j721e-wiz, if I'm based on the latest upstream master, I can't 
successfully apply this patch.

So, in my testing, I'm based on 6.19-rc1 and haven't picked [25/27].

Thanks,

Chen


