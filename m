Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012036.outbound.protection.outlook.com [40.107.200.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B68A3DEFF0;
	Mon,  3 Aug 2026 09:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785749344; cv=fail; b=oTk7gJMH56OoNlnDiln46cdK0kFlRPSkjO7fiYhtaOtnnLd+U7LypL8RBOJcXkio2v9LacjgvaORzOxCy6oTN5j89O74j/RxlbJ8GuDLkCO9cdRne4okY6/OXWxrlKEsCSx0USJpL9rTWsmIFjp8/jMemgKsS6MJsaV9wr2xXyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785749344; c=relaxed/simple;
	bh=Tl5bIpDX4VdOb7AsvR6Yn2PI9d88+AZ3304bEnyAaBc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rmnMGwUAzuKSzyD6vCXU8JXPbY15FcgkQVxja+ztQiRfS8kFdtGSH+jGqYfEeJkXVtQbynhVmB/S1tXYQeI1qdtYqzJHfUcERR/CknesYSohtIjnuklq/EzVKe3hKmm65Xs+w7fQMmnV+fB5tGtSu7CziydJ63sg9SEN3S01jSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vUOtb5rT; arc=fail smtp.client-ip=40.107.200.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vUOtb5rT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAyIG0OLddniQ56oXvvJXZevGQAdZTueIpKByAP3WhbG/lu3r1zY/vMMG249hGDA0CR5QSweDQp8y0t5CmtxAhiwcl4T/wwzs8La9nKD5j8yqqYzETE80ZHk3BrNS/wG5umlAlwBXXTrO4mvfITbo+C6BXfsq4NFj0hTWVwUVnK+FB3c8GQexUZXlsRIoMqUIxssniLp9EX3HXTn1I381T1+JwUXx8p4b7i8SbfjwdSVLwZAIA/N9nZWM7hX7s+Plv1NJVN/0/0aPT2+u4RsL7lY1RHdOBvJB7X/LVYdqltq848QoXUZ1Qf/luh+bUswk1kDDnOF+qH9kqDBctiTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXbSqLuY7iMbt8+GoRFZopqY2aQcqy6zlnTcRYUOnzg=;
 b=tMaf79yfulY4I2Qmu4Fopxo2nUY60fErr2btEt64/ybCa7/Gj2LfMQApkHk7VHriobkHpLhBItlqf157TNgl/2TNOifJWDW7mi30kuVS4hSyPQpqP1BxbhGP8UdLbEeB4yrPD2dH1XS8y09wBjIcS04DpUHAOQ92RG6TUWzl6nHGis3FWozIDv3JUxhpJHVx+3yPbdnTEuAYR8L5F0KMMn4ujY0V6+edmig6Y+Wl+93xEbwBf5hUomUzykFwe3lUKXcmtBGJIKmuUhHNYZplyV0fba87dJb2C5MIGYlC596CbzUcP+tK2lwIX0E9FJDhiFOd2B96cTJPq4JUf1s2gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXbSqLuY7iMbt8+GoRFZopqY2aQcqy6zlnTcRYUOnzg=;
 b=vUOtb5rTNVOdMpIxwRA5FkdmA0fklccAs7BIsEQl0rSevlrXcuBc4ilzeIPLt/ACb+4FqpHmRKeceHiWWgvhzykV4n3kxp4zNRR5aVvpQ/OMxhmeKTt8CjaQZ4pHh/fcgZXTORAMoCrDhO3n4737lglSufcL5qQSXQ9cB95X+Hg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CY8PR12MB7243.namprd12.prod.outlook.com (2603:10b6:930:58::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 09:28:48 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 09:28:47 +0000
Message-ID: <8a02a57b-0a52-43a3-83a2-3b7e79c9c8dc@amd.com>
Date: Mon, 3 Aug 2026 11:28:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: zynq: pll: Fix kernel-doc after determine_rate()
 conversion
To: Babanpreet Singh <bbnpreetsingh@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260803063126.7-1-bbnpreetsingh@gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260803063126.7-1-bbnpreetsingh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:334::22) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CY8PR12MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c7c512-7a34-40ae-fb9f-08def1419f10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|11063799006|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	rIxfFR4ZBxo/cYGAIK9of7zVrUbOp6XfnKOSo/hKsb/z7jC7npKAR99q0tgYab14PZtoRcuC6dhqmuTgjQNczRUvZjjrQpYOfMM6VwURLDsnubOrrMgIsdRq0FAhsNZTh/jvagTxf4eZiW1zIzsxztJ07ckF8v9WDUzFYE39qPW17TCRlR/HCx3tTps/ptyZdYhGDPs3wyXJr9Db2vm+zpkJUwMvAN3zHfHYefJnSQDVmGV3bt+pdp+sh3cCz46MLk+ZuzucxO5TjNuhWmQ7j6GFJMtXqPw0BIpg/GZyLAwRK8TGSwSqHzU//41Z5WepJq70gowuwUhWuTSHTsCD1atzdiU4u02QhEHXqeTPYgvyn2a8gyOZo9/sOHito1iXEGEg8NH/G0e7hSs1K5y8r9vO5uKF0NfUeRjjb7kcabAhsz0+yIsRRuL/tgSNJeefMmSPb/jpVZsFog4wYQp8NNwvGwly0uMRet69cC+0cr1ExIJW4W55N3OUcVKun970RhqQowUr6JzpC6nWxzoxP8iRJyt9pU/26E1iM9BezsT2IeoN9wTaIa8VGTHdRjSj0ZWMTrIq/R3PE1qGOPGymf8m/2eyOcDTSFd9a9buXmSw9jMEEKO7J2ZIYhKWZ7ONLaRs2dZE2aB1F6nAsPz5WXxLoEJHwwzN/IGY6UPzCeg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L09nbDBIQ3cyKzRXOWcwdUplSGZ6ZkxYbUZpbUhXWGdJUktYeDhFQ05TVWxq?=
 =?utf-8?B?SXJSc1VacVJpYkdtcVZycEIzTGNkaTVIZzIzazAzazdkZWJlRjlHaWNCbnAr?=
 =?utf-8?B?cUl4Q2JhbWlFY3l3N2dBUHQwbUFqWktOTmFYSHBnellDTTR2REFlTEpmZm5U?=
 =?utf-8?B?Z0Z4R0c2SDltWnpJV2ZuTEhiWk01bkNLNlJZNytFaVNmMEx6b0oxWGtNWnBL?=
 =?utf-8?B?MXdWYUxHVCtJcTgwZGFjWVkycHZhSmpiWTYyRGI4cjJZZm1RR08vRlVpODJi?=
 =?utf-8?B?N1V3MXRQbnZ0K1NDU0JPSVJKQ2xybEpHelI0TVU3dEV1N3h0Ym9XOUk1K1NI?=
 =?utf-8?B?WGlaeVdnbG5TUXhCQ2RnTjZITlpndFpmckN3UHRrK2hzTUxsRTZDV08xckFN?=
 =?utf-8?B?WmlCN0N4Vm5KWjg0RWl3NzM3amljMmtTM29Gd1RybU1pOHhIcFlyNjhNSlBv?=
 =?utf-8?B?Vk1sS0QybmM3L2pEaUxyaHkzTFl4OEs5Wk4xMFpSNzJOdGQxcXkyODY3aEVh?=
 =?utf-8?B?aHRzNzlmOTNaNnQxZE0rbWlCL3FCV1dkZFB3R0lRUzl4S21lNmQ2SnlCcTZD?=
 =?utf-8?B?NVZFRkU2bnN0QXhXY3VhMGhjd1ZTQmtGT0NwWUdzenFiYXZEdVUycUJQWkRD?=
 =?utf-8?B?OXRNVFVtS21MNE1paWhpWVBqbUEvUHJ1UUxTNUZlZ1RmV1Vyc0xUdDZQenZ0?=
 =?utf-8?B?Y29JVUZOR2Z0ZVZtV2NDeVlvRmtpNXJQaGN4cUZvMDl2dnMwNUcxU0lUSWcz?=
 =?utf-8?B?dHBrYW15Qks5TmFyT2RyWk5JN0hVTFgva0h0U0JEUW8wWVM0T0Q5cENac2dD?=
 =?utf-8?B?dmo3NUtpczNwQjdjTGUyZThXRVJCSjhoMlJJay9ibXp2Y21VcjlHRVVsYWlN?=
 =?utf-8?B?RUt6enp0TEtUSHVDQlZ5WDVVUjZsOWVMMmNxOVRnalMrUEQxOTJvZms5NnZq?=
 =?utf-8?B?UmFYcjlqcXNCbkFFWFNOV3poSXpIalJEUnFoY3FWb0Jub1hGS0F3Z0RoSDVN?=
 =?utf-8?B?d3pyL1ExWHBxTE5FeXVJS0ZKT1k2ZGxDT2J6RXpETk5TTGkyMitlanFtZDND?=
 =?utf-8?B?THBiL1VoNE42WC9HU1YrdkZNVEorS3FKTGloVGorRy9UTXZGdnFFYlR6L0Na?=
 =?utf-8?B?RW1nd2syRzQ3dnEraTNrc1YzQnBrazVjcmhhbnhoVVdNcS9oYzN0cW5kaVlz?=
 =?utf-8?B?Qk45UzNKOXRzYlBCVnQ4RjZYc2ZsUXQvaVd4eDR3eDBJKzd6eGtZREdNMmlX?=
 =?utf-8?B?bUZpbC9wdEVkYTY0OE5LT2pSVThqVEVCZkJOUWNpbDdEbFFLYTkzQi9nWS92?=
 =?utf-8?B?VVE5a2ZoL2dJbEJudkw2U0FCTVVCRDQycEo3K3dCbVRiMmE0MVB2YUdhQkNo?=
 =?utf-8?B?MTJyS2xhOWxOSnoyK3dhakpUcUpJQlVMTmN1SnpidlhiUGxJRkkvajY1Y0tv?=
 =?utf-8?B?b29KZk92MzBJOWJycmdPWEpqTFVDa1g3Z3NCSkg4NE1LZ2tma0h1bE5wZ1Ez?=
 =?utf-8?B?TnpZUStxa1BNODZlTXVWazI3d3RXK3JmZHIrc3gvZUlaeFl6R2tZYWI0THAz?=
 =?utf-8?B?WlRFNzdma1FYUkVwTWtCTGJMTkQzdjdwSU5RUmtwdkdiYVZPMjV6ZE9OdmFN?=
 =?utf-8?B?eUdiWHp3V25GKy91Sjk1b3JoYzlmNS9GdTUvcVQwQ2Mzb3BCdzhPZ2E4L241?=
 =?utf-8?B?THFDaUpTOGZKdXhTSENKODk1cXk4NDVNL2l1b1hFL2lhT1RiTmgwaHNBMnV5?=
 =?utf-8?B?cWFUSkJYMG9hQy93Y1RBSjNxVTFRbGdRZHRIbndEc3NuSDVUZDRwRTBzbnZx?=
 =?utf-8?B?cUllaEw4eDJzMlR0RHpka3diTFppdVlhOGQwall2THF2WVhCTTR2SzFZYS8v?=
 =?utf-8?B?MEtKT0hZeUF1ZVBMdEs5ckJXTnRJK3VPbjJRUGZZNjhzWHFvOXJES29heU5k?=
 =?utf-8?B?aHVRLzJ0SlpVL1VEQmtNSUNkemNIczVIZDllQmNremZGeGloUnRYMUxPNytV?=
 =?utf-8?B?b1JLakVuYUFDcGIvZ2Frbks5b3dwckw4aFhMay9nRTNwQmNQYUVXNVlVMHZM?=
 =?utf-8?B?MHMrSXAxVmo3eXhKY25kVldTVUpjcGZCM290Z29JKzNVcnVWb2NVQTRsUTBH?=
 =?utf-8?B?ZmNFM1FHSFNHaTNCdHFaZFRUZjBDdThLZFR5RzBXT1BjRkp3Ry9rVWM1WTRy?=
 =?utf-8?B?TjQ0VHpDN0toZ2ZtdGI0ZnlQMUd4OFRoN3FXd0R3TGwvSFdXU3docEdxS3FU?=
 =?utf-8?B?VndBS0FnTUlpaGdZNTBqUzM1U1huaXdLb1VDSTZzaVZFWFUwc1dqRzM0Um9n?=
 =?utf-8?B?S0NiMnlHWGVRYTdrVmp3RVNGUkxZWC9QV1dvQWljSXhqWVZJY2lBdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c7c512-7a34-40ae-fb9f-08def1419f10
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 09:28:47.8179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZuMSI8nQpK95WFBQRu1/DOPcwhcLWreI0ewSGFBCXtMTk3Ky7igDTsHy8fwO9VD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7243



On 8/3/26 08:31, Babanpreet Singh wrote:
> Commit 1547747b55d5 ("clk: zynq: pll: convert from round_rate() to
> determine_rate()") replaced zynq_pll_round_rate() with
> zynq_pll_determine_rate() but left its kernel-doc block behind, so the
> block still names the old function and documents the removed @rate and
> @prate parameters instead of @req.
> 
> Retitle the block and describe @req. The Return: line described a
> frequency and referenced the removed @rate; the function returns 0
> unconditionally and the rounded rate comes back in @req.
> 
> No functional changes.
> 
> Assisted-by: Claude:claude-opus-5 [kernel-doc]
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---
> Changes in v2:
> - Say "Return: 0 always" instead of "Return: 0 on success". The function
>    has no failure path, so there is no success case to distinguish
>    (Michal Simek).
> - Rebased on v7.2-rc6; the file is unchanged, so the diff is the same
>    apart from that line.
> 
> v1: https://lore.kernel.org/all/20260802013252.7-1-bbnpreetsingh@gmail.com/
> 
>   drivers/clk/zynq/pll.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/zynq/pll.c b/drivers/clk/zynq/pll.c
> index 44c6093783641..fe90b50e1545d 100644
> --- a/drivers/clk/zynq/pll.c
> +++ b/drivers/clk/zynq/pll.c
> @@ -42,11 +42,11 @@ struct zynq_pll {
>   #define PLL_FBDIV_MAX	66
>   
>   /**
> - * zynq_pll_round_rate() - Round a clock frequency
> + * zynq_pll_determine_rate() - Round a clock frequency
>    * @hw:		Handle between common and hardware-specific interfaces
> - * @rate:	Desired clock frequency
> - * @prate:	Clock frequency of parent clock
> - * Return:	frequency closest to @rate the hardware can generate.
> + * @req:	Clock rate request, updated with the frequency closest to the
> + *		requested one that the hardware can generate
> + * Return:	0 always
>    */
>   static int zynq_pll_determine_rate(struct clk_hw *hw,
>   				   struct clk_rate_request *req)

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
