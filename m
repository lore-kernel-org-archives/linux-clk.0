Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EE23A4512;
	Tue, 17 Mar 2026 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742263; cv=fail; b=CCE58EygEaj7tNDocEF9c5d8ZC9Bp6uOhy6/snavilcXGVIZ8QtK45ZPqkP0OpB1MhZ9PKZ88An+ChSxBjcmJgwC0hLpwNB1tqpGrlLSXLN4o7aLwscp1WgOIjMQ29iPTRLPsz4CoLPiY46Fx0zRl8zbGzNmKYtrvcwMdIgbQ9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742263; c=relaxed/simple;
	bh=jmWnAq08JGnbkovq5m1EyJq75janSoxfsjTI5OeOgcA=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rNhGRxrRriSAWJuJQOOS5LGfdBHBwW9zR1SK4gahrU8rkDhyN+NMDY4l1JtUNeB7kKphdxbceXRNYfH1LWe0VxfirfO7lFtdGasPsKiwZ5RJEvpCX5fbyZT0YsDEzes8lxu6mUpaeTrY4McWcPSabIh9iid+yM+uXGoZ7GgkL8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DIFqnJ1U; arc=fail smtp.client-ip=52.101.72.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DIFqnJ1U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZlV6tsCbtGpVuPQH+/UMthbjWtNEEvtBW80UkRvECrA8WfURkWdY9iWrBlBJDKfd8ERx9JmcfTLCiWg6vffP2yULbX68LdiwpUM3tC4cNv+4t5rrV0dzICjalfj3g5KSnqK3Yu1gPmB/kZ0Syk98nlhMX81cQIhsI6OgyJ5XJMKqDpffx23at17ZleH3QK0QrQzUOr9c/eA7gLzmWW4OoKwo7lPPoI0LbQr3qLgvvpb44EyxmgGBQyJqHEw4I4faLad3YrVI1XHer6/34zpVuVWPCCBEr+Bzbo1v8Batu9FRPOcsSPIcXwZ7MVQWtJEhJG+r8AHGxFAfRfwTRAuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/j5o67IoqIK5gTFW+0h7syVdF1aVub9W1kj1KroGs3M=;
 b=BWLDpJfKF6AOk251QpIJBvHKrHc1O4K63zdUGedTBL+FAmOr6MrFyfc7qfX7Lc+IUnSZV5E4n8qI83gQxzvnu8Kqz0T3m9Ompa6AwVdUr/l0lFje4XD6Qkl8fR5T1ELj6U92hmx6w6DVQGw/Jwi7p1MUe+qFu22lJqz6BsGtcrTvic+c4P/CMoVjK0UtinFo86xMIlwVaqPeDlsgc0/AlWVi4a8OSWS9KyQ8VxvrffVIpAHeIoYA3nYEw/zQoUc/COifgD/cM3r1e3/SzXM/PtKhCHYEoMbheO5MgorhgHsexvu+rUUsEXcKEEIkH2QK0vHXaj8vOGpcYoFyoeMonA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/j5o67IoqIK5gTFW+0h7syVdF1aVub9W1kj1KroGs3M=;
 b=DIFqnJ1UhM11xPufR1yLRHkTJ4dBpnB33nhJNmI5w+XSBs35xK87AN6YRj+d/FNEV7uFye3q5/IJkPEXvLV1bZbSLlceR2DzqIkQEs6CUlA6LFN/iQd83ulHu/NC45DN9QHEj6eYzmkxr2hcnmj3Vl1t1K0XAH6yGJx8fs7/zfpui3NJqMRZIo/ozPpixcThlkdIwm02mtR671qDPjGE/r2v40QF/6FIOGmZffXWUMhmUwOXAJ8kbeYca+6hfrdPOW5LFirXUPFZGqUS56DEXMRpmnyPSO7zxztVpTskqTsPGyppM7Qvt6bGd4sq4YhSwlWC4MK+Bn6YnLNUCyQMag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DBBPR04MB7867.eurprd04.prod.outlook.com (2603:10a6:10:1e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 10:10:44 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 10:10:44 +0000
Message-ID: <a8101001-b4ee-40d1-95cf-2f62b6181fab@oss.nxp.com>
Date: Tue, 17 Mar 2026 12:13:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] clk: imx: pll14xx: Use unsigned format specifier
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260317093353.964097-1-alexander.stein@ew.tq-group.com>
 <b3d4e63b-1fb5-4db3-a5eb-b0287fda3a02@oss.nxp.com>
Content-Language: en-US
In-Reply-To: <b3d4e63b-1fb5-4db3-a5eb-b0287fda3a02@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0020.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::7) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DBBPR04MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5ff6bc-8f08-43a1-d489-08de840d73a5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gRkpvjqfLWawgNup56xhDGqkdrvOV+d+PRLO8avOmL81JeEKe0a2fazF3VyHTWziRShy5mhdnwvJv3toHCiMoEEbjS2MzajYq43JRnvrUlqUXpA5UBySaJ8ZrmY8vKk53ksvNXD1HYve8Bq1PDhAgZi2Wril3GMpBkvKvNPuWGDBBhQrTe5jzoQK/Bm5IaZAp5DwKCVymGDBzFSe742JXY2DCfNwDxr+Mk5FhgN48GWw1468Kw9VJPoHQpC7lJo1u/8O8F+yj/G45bvf+6lQRLiJvOUJlY2bNrPIwmrzcMSOuemwkx42NwBtc6d8UwpqRkCwrj9uV+UXg606N4DRLbHmEx3cMWIgrXO7r14RyniUL3x4EOj29E6MB0TY7Ds09zehDbxPhLNGHRjvw05GC9B2+ZRgCFgbfCQeRb7Fl0VxypgaVyKcNK2UZ6JJJe6stKHuUqlqLXNvruW5BLbbpx/5g/D95yzCrTlnkNpNA3h9rNxvv2iDAAZwGBZpxnKdgHNwM6MB6SAjhs2YmMA4t7SDLnVncZlr7DMRBAdzLrDJ3F3ezX6NId3B75FWkJt9HWTuOJw6AwEpYapcTJ+YHqmMkR1g/kR4d5i9I7z8yT46zXT9oUYkmR6TA5MUXx5ckSPnp3OV0mrbIe/K6rYg5vAvOUnQuyU51jzfRlZxRstwUNIBmMYJGcjbALnrptAoB1ZORoXQSDGsimEvg89FP0JoY0UB9LZgsI6fEq7T6bM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEVQSGpuMmhOMWRad09JalltSE9XQ1lNYTZvUmh0Q0xZK3JTQm10VW9xa2t2?=
 =?utf-8?B?a2pOS1V4MVBFQ2NldU1UYlM3ZXhackc5ekFZQjFheEFiTUt3TjlKNWd1aE9j?=
 =?utf-8?B?ZjRxcExRdGR2cER1djg5WGlNemY1WTdSTjVlMFZMdTBtK2o1cHVxMkg2L3JF?=
 =?utf-8?B?clVUM1dBN0Y5dnU4ekl3VUxzQitOdU1laHFxclJKZDI0ZVlEUkhMZFRkbDBV?=
 =?utf-8?B?TlNJV1FzbEZjWExKellYWjBqTUVGK05FeWlVcUY0OEwycU9yekgzMlV3a29T?=
 =?utf-8?B?WW1mTjVvN2RlZWVqeTdMWEd5RzdoenhhV2xLS2EwR0tUampTYlczYVFWUDY4?=
 =?utf-8?B?b09ranF6R2tROFlnMnZZYnV6bHI5TWU1SE5kZVVqd2hodjYyeUs5REF0b2Fa?=
 =?utf-8?B?dmVEL2JNVENBMHJURzN5aEx4dzBUcmgzTTFMbVNmREs3R0Z5bWo3N0lNYlgz?=
 =?utf-8?B?V3VORGdsMmdrajY0QnJQUjZ3VlA0dGZzdkhsTzNCaXRlRUU4bFc4b2p0djF3?=
 =?utf-8?B?Vk9ockxoYUFZR3pIeU1adHRqcFcvTkl6Q3FjTXVoNWYvMjdiMHJSWk8rc3gz?=
 =?utf-8?B?d1M1aVJlUUJGRWhya3Q0Y3NQMU5sbklzK1FNZlA0TjZleXB6SzhTczNFUkNI?=
 =?utf-8?B?QVBBd3FTNkJvOTlZa0JmWS9Jc1BwaWl0ZUMySFZvWHUxYTFQd0FKV2dMS3BU?=
 =?utf-8?B?OCtuWXBPVGNyaUREZ0Z6WDVpNjM4RFprZmwxL25ORzU1T2dJZlVsS3Jlc3VT?=
 =?utf-8?B?bEVwaWJRZjUyMDZzZ2xmT1UzMGh1L2Q0c3hPZ3FpT1V6cXc2L0RjZTV2c2xu?=
 =?utf-8?B?dTZ0RW9sVTVxYmw1Rlo5Z0tPdnNsZHVrVFA4T1dHaVNWWjFuRlE2dmltWXpM?=
 =?utf-8?B?NE8wZi9pd29ISUxCYzBWMzJLemExMjI3YkNIOC9lcGxPZjdLVnZLOUh4M0ZP?=
 =?utf-8?B?TjJkN1VHRGlISldQQ0M1Y3prWVJOdTVQTTF2eUNOMjNidmVxaHpuN09KbWR0?=
 =?utf-8?B?S3FmSTV1enc1VWtCdy9nVm1TN3JQTFVNVGQxUjhTVGhkSU92Ui9RSHZYYWtm?=
 =?utf-8?B?OFVWSW9qMjdmRnVrZ29DWWdYUDdmZVpzekxGTm9kdnltTC9pY0drSXpQTExz?=
 =?utf-8?B?aDI5aWIrbkZObmwwOW1ObTc4TC9YV0xvQUZ2NHZBMlN4Mll0VERqUHllUTNW?=
 =?utf-8?B?UU5qUmllQk9TcXRiUDlQcXpYb2ZVY2s5N2VVd3FFSGRpSkgzdnZYbkU4Z2Vq?=
 =?utf-8?B?K1JNM2UxV0hSMkhTcCtVcHpFYmRQbEJDTnFldEJqN1ZGNllvRG92OXFiejRP?=
 =?utf-8?B?MHR0eDZhWW5oUUxyYUZFWlJHcXZPT2JkOEQydGxncSt2ZmRpZHF2WjlsRFdV?=
 =?utf-8?B?a3RBTVBneDk3M05YTEUrRGRjeE5lR0ZaelpRcjlmL0dSN1MzQVF3VHpGcUp1?=
 =?utf-8?B?NlViYUdiOU4yTUZpdkNGR3VoVE1HL0dZaThEZmlYa2hlMWZOS2VhemY2U1Vy?=
 =?utf-8?B?REtkTEdxb2tJTHZtVEZpS3NRbi9lYUNla3ZTTUdsRVVvRjhFMEJubFFMYXpo?=
 =?utf-8?B?c1N1UjVVa2pTSWtodHhUaVVaUVJDaU92aW0vNHJXc2ZzRGg4QVF0amQraitt?=
 =?utf-8?B?KzRxMUhZSTBSVDZLeURQTWZRMkk0SVlIOFBuSEpOM0p3QVI5Ym1WdURaamtQ?=
 =?utf-8?B?WUhXUGlDeVU5NklPVkhwY3l3U3Q0djlXVjRVU0N0aU9BbmRRVnZuRlgwU2N5?=
 =?utf-8?B?UXkvK0h1Wk1IRTRYYlBQakp0dTNKa0Z6ekxlM3RxRG11TnVnS2Zrb0FZTmFD?=
 =?utf-8?B?NmJJWkJ0UVM1NHBNSzgwWHVQY1YrUlZqL3FGVHp1d0ZEVnREU0htRXJpcEJD?=
 =?utf-8?B?ZVF1MmVWUWxCRVgrZUJ2Yk81K2ZFZzRDUnNia1FBU3kzbjBuNWdrY0I1RHB1?=
 =?utf-8?B?RUVKWFp5OVhWY0hNTVhXNEFhMGp0cDJvclI5L1BiOXRmWTJyNlozcEJqeEJ1?=
 =?utf-8?B?SlBZQXRuZ0U1RjI5UlJrM3dNcE1DWCtHQ1ZEK1lyWmZ0N0cyWHd5WDJUNngz?=
 =?utf-8?B?MVlTUStVbkJPVm5YQUNNeE5uV0FpU1FOS1ZjMHlUQWYrTWNjdmJUaWF0WEJI?=
 =?utf-8?B?a3NpN1JrNTN6OU41YUNYSWRFVXd4WW9VemIzOU95NFFFeXNXS25yOUdoUVhY?=
 =?utf-8?B?ampuSzBCOW95TElsSmlOaTd6aURub0lTYmVDb0pUMzZMU0lCWG1JZUMybEF2?=
 =?utf-8?B?RkR4MDc5SDc5WXROTEZ5Y0Q3dFJaS0huNE5qMm5HcVNpN1BSUVRiYWsvU2Vu?=
 =?utf-8?B?akpxL0poN0Y5Mnp2NWt0citMOWRqOTlZUVloY2VhZlNCcnpIWmxqQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5ff6bc-8f08-43a1-d489-08de840d73a5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 10:10:44.5596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSCqt+Ksskgwd0Ye30L79k0Ze2wpkmtB077/+VT4UC07j6+gTaupaBqzs2iOx8wmdKE0MNcv2AAHSSQlf1pPcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7867

On 3/17/26 11:48, Daniel Baluta wrote:
> On 3/17/26 11:33, Alexander Stein wrote:
>> The debug outputs use %d for clock rates resulting in negative clock rate
>> during rate calculation.
>>
>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> ---
>>  drivers/clk/imx/clk-pll14xx.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
>> index 7552aaafc3395..701a7a02235cc 100644
>> --- a/drivers/clk/imx/clk-pll14xx.c
>> +++ b/drivers/clk/imx/clk-pll14xx.c
>> @@ -151,7 +151,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
>>  	/* First try if we can get the desired rate from one of the static entries */
>>  	tt = imx_get_pll_settings(pll, rate);
>>  	if (tt) {
>> -		pr_debug("%s: in=%ld, want=%ld, Using PLL setting from table\n",
>> +		pr_debug("%s: in=%lu, want=%lu, Using PLL setting from table\n",
>>  			 clk_hw_get_name(&pll->hw), prate, rate);
>>  		t->rate = tt->rate;
>>  		t->mdiv = tt->mdiv;
>> @@ -173,7 +173,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
>>  
>>  	if (rate >= rate_min && rate <= rate_max) {
>>  		kdiv = pll1443x_calc_kdiv(mdiv, pdiv, sdiv, rate, prate);
>> -		pr_debug("%s: in=%ld, want=%ld Only adjust kdiv %ld -> %d\n",
>> +		pr_debug("%s: in=%lu, want=%lu Only adjust kdiv %ld -> %d\n",
>>  			 clk_hw_get_name(&pll->hw), prate, rate,
>>  			 FIELD_GET(KDIV_MASK, pll_div_ctl1), kdiv);
>>  		fout = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, prate);
>> @@ -211,7 +211,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
>>  		}
>>  	}
>>  found:
>> -	pr_debug("%s: in=%ld, want=%ld got=%d (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",
>> +	pr_debug("%s: in=%ld, want=%lu got=%u (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",
> Since you are here, I think this should be 'got = %lu' instead of %u.
>
>
Correction, I think that 3rd parameter is OK, first one could go form %ld -> %lu.

-       pr_debug("%s: in=%ld, want=%ld got=%d (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",
+       pr_debug("%s: in=%lu, want=%lu got=%u (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",
                 clk_hw_get_name(&pll->hw), prate, rate, t->rate, t->pdiv, t->sdiv,



