Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012049.outbound.protection.outlook.com [52.101.48.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA1A4ADD8F
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 06:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872490; cv=fail; b=imqOOS5Saa/P5RfEgBv/0D/EA27Y7Jvx/H10Lx9JU5Gqz6jRoYoEw1z/Z1s/WIFBCokZsqxYVGo9yjEqQCGNZAe2p5vVGCBE34Q6n91Hz6R2hdnGuWB64L2GINMln0SpuBv+dq+TeR4Zt/NEEUZQJqu5wzD/uDazXXkBWx25k0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872490; c=relaxed/simple;
	bh=c8aX8w7xNBGwrS7bVuTlyhOHOqKoFFUamYe2O/NwBjU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f8oiejnzsSesaErewp+4lEiksbKQxFdorwzlRmJAOKSqcoixG5ux5L80WB/X46/qbrjPWhzT9KcpFkKL0DLH+GNOw8tNiMPVpPRWwEbR4y5MJw/Ztvflu4nsMWMf2OfReLAOCpqMkg89n5CnMIObNTDgD4Tu8k5Bh9wc5BOcQm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=EAME+iKH; arc=fail smtp.client-ip=52.101.48.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="EAME+iKH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thD3TDGCZ32WGAZU7CFBoBdnzh8Wp+eorXDhpD/e+aZgiVXoPvN/iqiexY9xv/T1vWPGgQdiVkc5gSn+MTnqPrZp5sKCzst+GvMDfr8KVJgJvAjEu/hbuW2ZbRo616RHGmIkAP6wPC1Kh8HrpZX3KwjkxqAsUflcNSRc/IVaPua0Fi3fYeH2rT3Thx8QSys6q9cEIU9X7S2NvYbKpEIReuSNaeXzXqPPswXGbW1YopshtadABpf9W89L2/kCvdwpO9YgJeIVlTbrubWolFGAm9MA5VA/LDSQCqIoX/TQoXVwTs8yuBSRDSLArjuwIHuA1hHGZulEruxoc8aAPD+CvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0tuVx3eVc4x5A0PWxso8qf+qncEU0kPeNfh35davpo=;
 b=ps47oUyGqrvj4E13+8vgrl0QFJcL4D6LstGizj8mO4HqUt3pjWd8FeFw50EqEiHQXE7vuL4K4fc6C7OXjcwdP/vyDvL7W2AM4yhAVjc/ftLBtux7FUN/JjfP9bx7C79gXvR2iYBGEETozEYXQhkFey2rfXBWoQ8JbltGLqB6Hv+/Ygk0kAMierD2htomWxjIsPHWqiaKBxXfiRKw/C2rn45iFcqgtI/bzPX9QC1JnYrqUg7tw2+w0yKwVqQBfotbOT5BJZ8XSftvqSrQYYdvA4kJTH5Rn8prC0T3siI3Zm8Wo6XXgDCHqFOyxldEAHUzZ+0GqVQq5j7DV+csl3KYiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0tuVx3eVc4x5A0PWxso8qf+qncEU0kPeNfh35davpo=;
 b=EAME+iKHIeN3hPYVnn5S49X3/vJ/JKz/bej2XNcnMqcDENsy05UIWnIgSAIeLB6WCSZ7GlL6YMW1X+OmQ4qjWXL+FY0XkX0/Iw3Zqyk4MMmDk2PlmgnV49+ZMj118YdoSBFyjhYwnXehdFcoKf/y3FPir52KB1du+a8xzNsKWw8938KDrJwN/sUICGNHTHoVNn/rZooY1U9B2dnD3w+xCMWcumgeXXful3mjsF9m8SsKcxuT3yL00TC7PRrJZFcmLzy7QX0cMqlhgASGVf3rDKuyVqJx3LSF4e57uhw3RW65o6R1Zfv6722PzjeW/Cipn6Mu1hnxuEdR1gb16f8Rog==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by PH4PPFF50C802AD.namprd03.prod.outlook.com (2603:10b6:518:1::61b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 06:21:26 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 06:21:26 +0000
Message-ID: <c4d34400-8a6a-4979-b100-eddf981d4f1d@altera.com>
Date: Tue, 13 Oct 2026 14:21:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] clk: socfpga: stratix10: register the SP timer
 clocks early
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org
References: <cover.1790935401.git.adrian.ho.yin.ng@altera.com>
 <3164e6dcf09ca68c2ff9537b0f96aefcc793366a.1790935401.git.adrian.ho.yin.ng@altera.com>
 <20261002103518.AD0531F000FF@smtp.kernel.org>
Content-Language: en-US
From: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <20261002103518.AD0531F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JH0PR01CA0072.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::16) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|PH4PPFF50C802AD:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca8429b-7fef-4d93-db0d-08df28f235bb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|55112099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	aqz+iIUnKSst4zqPqNzJohT/eezULDeZcuEBt9JO2+5mFlf+KGQKx3ZTAyXvZeYY+qQhhP40xbFYllppM/m5viar0H4UjoNwovkHa3e0HcSa/ON37Rr7X1V7JZ1oqR+DXhIoOKWzg+dd2MgI3kpWBs6DQYbsNn3Uf0PZMB4RPu+VB0RUCR2ms/nvjiTlyJpjHOQ3+x293uvtDfJ4G4i+Kk33qa5hL6uB0sIDbeX0+VecT4L7NrLdmRbDtk3ggH4J2bPVdwc/32ONFHpk2pmCcRm1L1+D+JoA6qeKLpWy0CJKhuznFSg/wnqooW/fc17KiZNDikr+nh3DK1SO8BeVCSTA+qpMkXIXeUShfiKHU7b2IbnCg4ywf1A5tUlKFKs3W1XKVa3Z2wk/O0j5fUATr5FWAVR1qSvPNzFIiIXKEC2bEnAfx6wnlL0pZyN2jURHQNArVVb4Aarls99dJoMNEAnLp7WNTA3WrhB2cjp8DNBFR1Hx2zmv5OTJ9Oe57FnVZYzXVL57XPt2OpsFUpqBOzNgcD2lg3vXuHdktHMWCoMFqCACMlLDPKW9YR7rjzdlrnT65Dc01TIJxZG+Pv41KbPIbFoi1Y4wxMgtab8IbciWzhTiV36UmMe/7j7sNKwefhwAU77Dc/u59XwQwKVfgyNnyTgGWxmSH/cCWbRvyT8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(55112099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzFMZ0VxcDFFcjN6Wll3S01DRjNhcnJPWXg4bWFrWVZpRXdqSVN4VnNiQ29G?=
 =?utf-8?B?NC9jNWlPRmtGTDU3T0NTSEV6OWVvS0lLQUw4TDl0bDJKNnN4RnQvN0kweGpN?=
 =?utf-8?B?bktYdzgvQklkR2FOQitHS254Wk54L2cvK3E3VW9pNUdtL21pQjc0QU5Fakk0?=
 =?utf-8?B?MFMzV1lWNkJpdWZRTnNUeGtsMnA4U3haaGhoSVhYSHNhdWFIZEN6NnAyYVU2?=
 =?utf-8?B?dCtWZEU0OENueTFxcmIxbVRkSzBQbXpucEU2UXNoR1cyd2FtTkhhVlBtKzFq?=
 =?utf-8?B?R0ltY0dHc294aHVSTFRTV0dmYTZlK0txbitPSm1nY01OSjBETExJdVB4L3g1?=
 =?utf-8?B?T01HZy9oaE93Z0JNclZtVjQ4MHNQZmlzbFlTN2s5RVJhV29pZDQyTVEwazFn?=
 =?utf-8?B?dmNNcHBqU1ZpSmJVV0VnMko0dU50eFVqakgzaDhrR1M2cHlRUVViejZYWnJz?=
 =?utf-8?B?cXo4RnN5Ym5LV3BSWXFXSVdTTDRQWnZ3aUxac3N1a2ZnTUNibStZSUhZanJm?=
 =?utf-8?B?dHF6TzJmVWdlUkxTTGFubHBLV1h6RnNYVkxsTVQ2VzljMytPWityRzFCeXZS?=
 =?utf-8?B?Q1pPdERjN1I3MGFWZHJ0eW5BMzZzeEs2UzZkV3ExUXJlK1laNHlVSmJsWWRK?=
 =?utf-8?B?Y1RzNUdQRGJVd1QzQXZHRzlxZDlnKzZ3Kzl0dERuUzV1T0QxUWJvaFVrMkFZ?=
 =?utf-8?B?YzhpbERMVWRUNkFYd1EzYlljc0d6NWtuenhkSzYzOHU1Z2ZVY2JpWVR6alY5?=
 =?utf-8?B?VDZ4bFVYcjRyK1BhVFRYb2Iwc2VCMkM0T3d6bzAwaHdqeForRXpOTnh4MzJF?=
 =?utf-8?B?eVhnd3RGZWFpZEVJSUZpRW42YzRKNUlTYTE2RTdrSEZLR1FxRCs2K1d5bTMv?=
 =?utf-8?B?SVB5YnFPa0N1cnFRdDhrSlpPaGQzUFI4cVN6dmgvQnRDa0k0Nnl5Wm9yTUlG?=
 =?utf-8?B?TVRSeEl3dTdoSEltNUFPd1VNSEo1RDhDdDgyWWpPclF2R2xHRTVTQ3EwWkpN?=
 =?utf-8?B?NWY3dHZ1bEJrczR6bGd3aGZZTlh5THdZUkxHZXpqWVJpeGwwWWZzM0RTaTFN?=
 =?utf-8?B?ekRWSGREaTdBS0xkbVlKRDBIeUxQZDZLWlFHS1g1eGJmUENob3RNZS9OeDNR?=
 =?utf-8?B?M1ZUNncrd3BtK2grMk41Z3BkSThWV1JBUERMcEFVZzBQS1o1SGtmWlZia1d6?=
 =?utf-8?B?eGJKUVpvb00vMWpYZUJsaXpXLzVKbHJuTThKN20xVS9XZ21CTGdUZFNtVkIx?=
 =?utf-8?B?eUZyUG1hTERKaEFNTlBiMjE3ZkNFLzNYdS9MdVZhdlJIQW1vRllSY05SM2lR?=
 =?utf-8?B?d3U0eHpLVlBYbi9ET0R5ME56UTNIa0dZRUZEMXcyaWRESDN3dmNZMmIvVDUv?=
 =?utf-8?B?b0pwSEdMb1g2WDZUOFlzUHNqOXN2UVhlWjljQ24zRFR3bjgzTjltNEtTRGlu?=
 =?utf-8?B?RzM3WGxMQ1h6c3lrVHZOdlZZUTloNjA2MVQ0dGNKd3BjVFJZZkVkUDRmTUFj?=
 =?utf-8?B?bDQrY1pVa2lkbVBlUGZ2d2QrcDExU2NzZ2JpeWo1NUpCYnRzS3hGMlhRT3RV?=
 =?utf-8?B?RzJiQ0d1V2NlWlYrNUhndUJkcS9nZUJEYnJxUDVyU0k4ekVXeW9ZWnBua3hD?=
 =?utf-8?B?Kzg0bmVtV2p2OGJZMFhERFAveGJYajIyVGErRDIxb0ltL3lWVmxzM0ozYjJD?=
 =?utf-8?B?QzIrZCt4aUpiUmxzMnN3d0oxUkhyYWJDQ0drNGxGWUtoU0I1REhCZCtFQUVn?=
 =?utf-8?B?c2dCQm5Cc3VvaTRXOXkyOVptaTNFVVcwcmNXWnArY1RDRXo2TG5ITFZ3UVBU?=
 =?utf-8?B?OENkRzVnRWdjL3JOWVNWVE5yblVHQlNPN2dic3EzNmhLS3VhRzJtR0Rydmhi?=
 =?utf-8?B?S2ErTVhOaXhEWVFUbGZmaCtOTDdiZ2IxaFNsbmJDZHdpajB5N2pFci9pekl2?=
 =?utf-8?B?T3k0ZHpRNXZzSUFjaGxKQjB3VWE4ZW9adm1ET2s0Wkh4QjdSSVJOaTl5WnVt?=
 =?utf-8?B?RFVoamduRWFLeEZ4WDZpQ2lyaFZWRDgyVXVSZU5VZEo2cHgxZXZMTUNsckM4?=
 =?utf-8?B?dC9GTll2VTB1cmh4NFdMNzlzVGRsZW56RElRSmhvSFNIUlY4dERPTWlGWjFi?=
 =?utf-8?B?cENuaDVBOFE3c0lmQ3JISlI4RktmVE5wb2FsQ1lONC9TaWQreWZuTUE5dW9N?=
 =?utf-8?B?UC9IQ29hOHVpR0ZkQXVYNU8rRFRIV25XTllMNGhQTW5LekMwQVdjcThwRERi?=
 =?utf-8?B?RUtiRGVVbmNQM0lwWW5JcjBhanJRYlZPS3MvZjZUcWFoQ0gySHhBcTFwMXVQ?=
 =?utf-8?B?UlBEbXFxZDNuK2N3blFoZUIwZHowUmwzWG5xRGtNSUQwRkt4bWp5SW9yZGlt?=
 =?utf-8?Q?gwD25vfPqf5MGjsw=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca8429b-7fef-4d93-db0d-08df28f235bb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 06:21:26.0198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FI3WGC5zXrDY0YnL276TUZs9faETITv41yRd4SUN9U+FOZdSQb9nJyDmchaxEhdFcR2793TputQ3SiIgwpi7Z1meN/DJnumvzrvB9n9WNvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH4PPFF50C802AD


On 10/2/2026 6:35 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] clk: socfpga: use-after-free of unmapped IO memory on probe failure
> - [Medium] clk: socfpga: memory leak of clk_data on probe error
> - [Medium] clk: socfpga: incomplete early init rollback causes fatal registration conflicts
> --
>
> commit 68e80ef968cd718473fa02d4989427b8a0ddd324
> Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>
> clk: socfpga: stratix10: register the SP timer clocks early
>
> The patch registers the SP timer clocks early using CLK_OF_DECLARE_DRIVER()
> to prevent probe deferral, while deferring the remaining clocks to the
> platform driver probe.
>
>> diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
>> index b4bf4e2d38e16..7eae2dfa408d5 100644
>> --- a/drivers/clk/socfpga/clk-s10.c
>> +++ b/drivers/clk/socfpga/clk-s10.c
> [ ... ]
>
>> +static struct stratix10_clock_data *s10_clk_data_alloc(void __iomem *base)
>> +{
>> +	struct stratix10_clock_data *clk_data;
>> +	int i;
>> +
>> +	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, STRATIX10_NUM_CLKS),
>> +			   GFP_KERNEL);
>> +	if (!clk_data)
>> +		return NULL;
> [ ... ]
>
>> +static void __init s10_clkmgr_early_init(struct device_node *np)
>>   {
> [ ... ]
>
>> +	s10_clk_register_early(clk_data);
>>   
>> -	for (i = 0; i < num_clks; i++)
>> -		clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
>> +	if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data)) {
>> +		pr_err("%s: failed to add clock provider\n", __func__);
>> +		return;
>> +	}
> [Severity: Medium]
> If of_clk_add_hw_provider() fails here, does it leave the globally registered
> early clocks active but without a provider?
>
> Since s10_clk_data is left as NULL, won't the fallback probe s10_clkmgr_init()
> attempt to re-register the early clocks via s10_clk_register_early()? Could
> this cause a fatal name collision (-EEXIST) in the clock framework and
> permanently deprive downstream consumers of the early clocks?
>
>> -	s10_clk_register_pll(s10_pll_clks, ARRAY_SIZE(s10_pll_clks), clk_data);
>> +	s10_clk_data = clk_data;
>> +}
>> +
>> +CLK_OF_DECLARE_DRIVER(stratix10_clkmgr, "intel,stratix10-clkmgr",
>> +		      s10_clkmgr_early_init);
>> +
>> +static int s10_clkmgr_init(struct platform_device *pdev)
>> +{
>> +	struct stratix10_clock_data *clk_data = s10_clk_data;
>> +	void __iomem *base;
>> +	int i;
>> +
>> +	if (!clk_data) {
>> +		base = devm_platform_ioremap_resource(pdev, 0);
>> +		if (IS_ERR(base)) {
>> +			pr_err("%s: failed to map clock registers\n", __func__);
>> +			return PTR_ERR(base);
>> +		}
>> +
>> +		clk_data = s10_clk_data_alloc(base);
>> +		if (!clk_data)
>> +			return -ENOMEM;
>> +
>> +		s10_clk_register_early(clk_data);
>> +	}
> [ ... ]
>
>> -	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
>> -	return 0;
>> +	for (i = 0; i < STRATIX10_NUM_CLKS; i++)
>> +		if (clk_data->clk_data.hws[i] == ERR_PTR(-EPROBE_DEFER))
>> +			clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
>> +
>> +	if (clk_data == s10_clk_data)
>> +		return 0;
>> +
>> +	return of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
>> +				      &clk_data->clk_data);
>>   }
> [Severity: Medium]
> If of_clk_add_hw_provider() fails here and propagates the error directly, does
> it leak the clk_data allocation?
>
> Since clk_data is now allocated with kzalloc() in s10_clk_data_alloc()
> instead of devm_kzalloc(), bypassing explicit cleanup on this error path
> appears to permanently leak the memory.
>
> [Severity: High]
> Does propagating the error from of_clk_add_hw_provider() also cause a
> use-after-free on unmapped IO memory?
>
> If the fallback probe mapped base using devm_platform_ioremap_resource(), a
> probe failure will trigger devres cleanup and automatically unmap base.
> However, since the clocks were registered without being tied to devres in
> s10_clk_register_early(), they remain globally active and hold pointers to the
> now unmapped IO memory.
>
> Could any subsequent access by the clock framework to these clocks dereference
> the unmapped memory and lead to a kernel panic?
Addressed in V3.
