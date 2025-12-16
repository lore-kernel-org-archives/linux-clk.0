Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012030.outbound.protection.outlook.com [40.107.209.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CCB244661;
	Tue, 16 Dec 2025 02:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765853744; cv=fail; b=ZJEYX1SxLIX18M4DRBJ1jfzWAD/S7Q6eFNuzl7IqFZM1OTX/PX33ZuaISbx8oxrg1Vt2trgRn3GcqlUewpMDvbENgSkXE1ROh5HjIdmQopiFOFLkjDyTNgOSVGXpqnj0Ib4v5ukkZHrfgYyl7gssPyfegPNh7N5gytF7Lo13uvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765853744; c=relaxed/simple;
	bh=r/KIGWp3ZZAd22WF1DmIfonQMNk+9dbQYgevJtLfKWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j8Xn4NeGoWk+A8rRT4l0fjs+IKBTV/R+zRGhkBvrm7ZcmkLNxGumC+g09vlvh07Ws9Pr8FqdASe5zpKkjjPrfiHAlamO01n+Hp7MOG3pqS2HFkrJ5tntH5AQ9B70germ/6waZFpSzYtFSWV4wqor7O8OlFS4eciYrtIBU+UWI9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dOT+9l7c; arc=fail smtp.client-ip=40.107.209.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dOT+9l7c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rG/qvKZnprj/SwupiXL0tqH1SHo9q77YQpKMFLRRsU13X8/r8f42LLHuLBtwaDtzHAkDLs28JfbleP6rrH9CTh2Fkhs41n8U2nA1y7zokXYuwNJ3Yr87Oc/Uxdn4BJhf9VFuel2+pXoZygiVyjf6JqJV0rkKz/rbT9QlN4Vk2E4vFgHKyVT5Bkci9fywaOVEcEGLZI3d1bEXaVNtSa96rVqMGs8jHPdf8kVZOh3hDNovMFSSDq2BCBtGbTb+Yo5tXoGXrx5uy0gkGp9HaOnpU32TP2vrYB0j1ax64+Spf8DuA9KqRAn5G3+/9iz4CDYODsO84Nv2ERChrQox4TwSqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0sjYByRB2otD7JdRoE+nj/02SbgDuWZ/AomPomhtug=;
 b=VFgMLjSe5SGJmaSdML96KoEsO3ZdiVhgQdqQ4jgMGijxIImn3w4agPHdhqP22fV5LPQCJHm87BpBjdpLHHxgq6Rm+If0egsT8u6/3Oh+Obr2gttzBNHhdY5qdOYBZ6SnaOF3ysL9E8XvdoRYFp6lK5nZr+fjaBf6FQ1rCoZUSITTluxfrp+4BsdK0B8eR+Gmnp6MmfiYLwBSsZn9ucV8FCsTcm1ZSH83Lc8igsh5bEwf19gvxXdq6feS8Xp63xHM54xQok90fUiLIjJxvdqfmuUz9dW9s3Q2DwJd7ZerLEmDkb7TaiydiOLq+Ap/CIG+r2cTtLPxycOltvYFMsUXaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0sjYByRB2otD7JdRoE+nj/02SbgDuWZ/AomPomhtug=;
 b=dOT+9l7csKXq7CBpGDjZ17oxbqut7W6kGehqIFO0Em4arIzWuwpAOrY/DEmKdgG0nNteZjp+CR3qHZG0zmEmVM/AxfV0dY6O4rnOlMNlVYid6845ItWGy4NEshwyDKsOTAzhZiPe7OgYimgb5UpgZMY/oM6OhNdYvaaxiFDByxE=
Received: from PH7PR17CA0051.namprd17.prod.outlook.com (2603:10b6:510:325::14)
 by IA1PR10MB6145.namprd10.prod.outlook.com (2603:10b6:208:3ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 02:55:39 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:510:325:cafe::95) by PH7PR17CA0051.outlook.office365.com
 (2603:10b6:510:325::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 02:55:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 02:55:37 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 20:55:33 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 20:55:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 20:55:33 -0600
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BG2tT0v3418535;
	Mon, 15 Dec 2025 20:55:30 -0600
Message-ID: <a12c3825-a80e-491f-a862-9cd5151a5f73@ti.com>
Date: Tue, 16 Dec 2025 08:25:28 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] clk: keystone: sci-clk: add restore_context()
 operation
To: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>,
	<richard.genoud@bootlin.com>, Prasanth Mantena <p-mantena@ti.com>, "Abhash
 Kumar" <a-kumar2@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
 <20251205-ti-sci-jacinto-s2r-restore-irq-v3-3-d06963974ad4@bootlin.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-3-d06963974ad4@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|IA1PR10MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: d412b941-af16-4b00-41ff-08de3c4e975c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnpBajFuU3NIQ3BvbUlkLzNHRGk3cnJKYlhGNHE0eFFUNy9HQy90UlpLZnpO?=
 =?utf-8?B?akpRV0VjSytBQ2k5OUtVQ2JaODhFUUhMY1RMbGNxVnpRcmo5Rjh2YVRpRnoy?=
 =?utf-8?B?RUl3T3ppVjdITkdiSWFjSitTdUVMZythWGV1ZkpHbHhZVUFqdDYzWFYvR1Ur?=
 =?utf-8?B?VHptNzBLY1d4ZjBYL3lnM1N0MG9oSmExMWI1ai85S3NBbml6MnY3TW50YVFH?=
 =?utf-8?B?TW5rUHJDZXp0Ny9IaTUyY0FZRjhwVURGY1d0eGQwMDdJcE55d1M2UFY4ajVu?=
 =?utf-8?B?cFRYRFhoZGsxY0JkYUV5eXFMWUJObGkxRXhPUkdkRloyL1ZiOE9rM1FpalBC?=
 =?utf-8?B?dlBKbEk3OWo2VnNJZnh1Y2RLeGJJTDZkREw3dy9DaHRQeVFJaXM1RDFWb3VK?=
 =?utf-8?B?N2JscitVWWQ0UHpMa0svWU1ISDNtTk5mMHNpWHJZS1dhNDBDaGpKZVB6L1dU?=
 =?utf-8?B?aGM0OUZFT0VLaHJqL1o1QTRkdks4dXRPaDAwVW5EWVdDZm5rbFlyQVFqQy92?=
 =?utf-8?B?djNUVFMvaGRycFY0QXhSNzFobnNsRlJKeGhWM0JnZ05UYlkxSVUra08zY2cx?=
 =?utf-8?B?Vk1NdlJLcmZQWm9MOHg4U2U3NlZwZmJTR2JLbzdOTFF6eUpmOW53UngrT2VC?=
 =?utf-8?B?WVI2bGgzeVZKNUdBK3doTnRUVkMyVGdIbW12RWFwcjg3TlRpVGs0RVozWWs4?=
 =?utf-8?B?em1vT09lTldPNjJMU2pyUDNtMEd5SnZjb1RhTzBBeUFmVTBoR3FZVWp6SHJY?=
 =?utf-8?B?QjlXNzNzZ25YeWxwSjlEVGhCS21XYng2akhKdjBYRnUxY0g1NlhUZVQ3SWEz?=
 =?utf-8?B?dXNLbEtZeitTa0I0SHQxRmJXdWhhL2JMSmgxUjhFV3lRQkw3RmNhK3BPcGJ2?=
 =?utf-8?B?MXpjaHdlaUxtU2krMmZLaDZqcVNYWHU4Skdnb04rSTkvcURDaGhhMFVpaE1a?=
 =?utf-8?B?TDR2ZnByRVJKNk5GOEdYUFdGSTdXckJBQ2c1TkJjeHNWS0h2S1B1akYxdCtu?=
 =?utf-8?B?U0QzT0Q1YmM3Um5oTjdVV0lLVzlIMzI0aHhhM2RKbnNuWE9PTjdDY1BOVlRy?=
 =?utf-8?B?aWk3OStCc1R2dlY4WE1rSGZMNkRBOFFURXd3eEdtU2JpMW4xS09JRUIrQVlI?=
 =?utf-8?B?dFdjOTBBM0FhbGR6YkxlRGU0SytOS3NXdk5NK3FPS1lFMTVKUzRlT1p2djdx?=
 =?utf-8?B?cUV6U0EyZ1V6L2E1N1hpRUlPWGR3K3krNEh1Qkdsc1kvN05DWkJhQTFuNUpl?=
 =?utf-8?B?UHhKNWZ6WE02aVg1bklHU0RxUG1INjd0UEJwcWJYSFc5YVpGaUpwUnl4TE5w?=
 =?utf-8?B?UnJma1daVG9aREJKaGN2K1NUenAyUW9kRERzRVA3RUQvYlhwRm1QVDhaalg1?=
 =?utf-8?B?TjE5aGh5aHlOQWNLZy9hK0tFdCtwellicnFqUG1NdExnWE4vQmVCYzV3bUp4?=
 =?utf-8?B?dUxLdWx5NTVJdFNSWTk0bnhsam9SSFZoc3JxSlBYOUt4bjROYi9QOVNJbTN2?=
 =?utf-8?B?UHdKV3hsYTFkcVRlYkZXV0podXd1amFpY20rWC9aeUNtL1ZHUkJQc1h6dGxu?=
 =?utf-8?B?U1ZwRDJ6aUc0UlB4dmxHTWVRMkpweGJ4dDNyWU5EUzViM2NBZ2x5VlIxVWhs?=
 =?utf-8?B?Vnp2ZWRtdWtQL010aDFMWUJ2MURvUkNhdDVXdnM2eFAyU3Y5bGxNLzFSSUsv?=
 =?utf-8?B?NVNwbFZsdkJLOE1jUGFkWTZONDJhMVZRYi9NR0ptdVNYNFc4MElRUlNESHB5?=
 =?utf-8?B?dDZ4Uk81K2VuellsUndxRkh3VVUzMW9Nbk9xcjRzKzVadmlIV2NEcm42bFpG?=
 =?utf-8?B?MXZOK1M3OVhkY1BPL2lmOWlLK1Q4ZUtiWGI0dGNUbzBtRms2VlhraW5RNFNu?=
 =?utf-8?B?NHNQaENpYkI4Q2RDeEx3Z2hNcUhubm5ZeGFPOTBaUmo1S1pLbHRhdE5kdzk4?=
 =?utf-8?B?L0l1Nk5DQWs1eVFDSFZxL2ZhRHZyTjdrTEdDRWVEYzEybHVmSmJxbXNmTkRa?=
 =?utf-8?B?SjZTdmFPam9tY1hiRHdEUWhlUnNKRjRuejZaUWtnMlgxZzRManlIUGRHdS9h?=
 =?utf-8?B?SGdGekljZXJuQzlVUmt3SlBxMEttaDVKamw5K2Mrb2pKeWZxcTduTmkzenNy?=
 =?utf-8?Q?h8X8=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:55:37.7034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d412b941-af16-4b00-41ff-08de3c4e975c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6145


On 12/5/2025 7:58 PM, Thomas Richard (TI.com) wrote:
> Implement the restore_context() operation to restore the clock rate and the
> clock parent state. The clock rate is saved in sci_clk struct during
> set_rate() operation. The parent index is saved in sci_clk struct during
> set_parent() operation. During clock registration, the core retrieves each
> clock’s parent using get_parent() operation to ensure the internal clock
> tree reflects the actual hardware state, including any configurations made
> by the bootloader. So we also save the parent index in get_parent().
>
> Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
> ---
>   drivers/clk/keystone/sci-clk.c | 42 ++++++++++++++++++++++++++++++++++--------
>   1 file changed, 34 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
> index 9d5071223f4cb..428050a05de31 100644
> --- a/drivers/clk/keystone/sci-clk.c
> +++ b/drivers/clk/keystone/sci-clk.c
> @@ -47,6 +47,8 @@ struct sci_clk_provider {
>    * @node:	 Link for handling clocks probed via DT
>    * @cached_req:	 Cached requested freq for determine rate calls
>    * @cached_res:	 Cached result freq for determine rate calls
> + * @parent_id:	 Parent index for this clock
> + * @rate:	 Clock rate
>    */
>   struct sci_clk {
>   	struct clk_hw hw;
> @@ -58,6 +60,8 @@ struct sci_clk {
>   	struct list_head node;
>   	unsigned long cached_req;
>   	unsigned long cached_res;
> +	u8 parent_id;
> +	unsigned long rate;
>   };
>   
>   #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
> @@ -210,10 +214,16 @@ static int sci_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>   			    unsigned long parent_rate)
>   {
>   	struct sci_clk *clk = to_sci_clk(hw);
> +	int ret;
> +
> +	ret = clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
> +					   clk->clk_id, rate / 10 * 9, rate,
> +					   rate / 10 * 11);
>   
> -	return clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
> -					    clk->clk_id, rate / 10 * 9, rate,
> -					    rate / 10 * 11);
> +	if (!ret)
> +		clk->rate = rate;
> +
> +	return ret;
>   }
>   
>   /**
> @@ -237,9 +247,9 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>   		return 0;
>   	}
>   
> -	parent_id = parent_id - clk->clk_id - 1;
> +	clk->parent_id = (u8)(parent_id - clk->clk_id - 1);
>   
> -	return (u8)parent_id;
> +	return clk->parent_id;
>   }
>   
>   /**
> @@ -252,12 +262,27 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>   static int sci_clk_set_parent(struct clk_hw *hw, u8 index)
>   {
>   	struct sci_clk *clk = to_sci_clk(hw);
> +	int ret;
>   
>   	clk->cached_req = 0;
>   
> -	return clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
> -					      clk->clk_id,
> -					      index + 1 + clk->clk_id);
> +	ret = clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
> +					     clk->clk_id,
> +					     index + 1 + clk->clk_id);
> +	if (!ret)
> +		clk->parent_id = index;
> +
> +	return ret;
> +}
> +
> +static void sci_clk_restore_context(struct clk_hw *hw)
> +{
> +	struct sci_clk *clk = to_sci_clk(hw);
> +
> +	sci_clk_set_parent(hw, clk->parent_id);
> +
> +	if (clk->rate)
> +		sci_clk_set_rate(hw, clk->rate, 0);


Mostly looks ok ,  Please add some warning prints in case of resume path 
either of

sci_clk_set_parent/sci_clk_set_rate returned failure


>   }
>   
>   static const struct clk_ops sci_clk_ops = {
> @@ -269,6 +294,7 @@ static const struct clk_ops sci_clk_ops = {
>   	.set_rate = sci_clk_set_rate,
>   	.get_parent = sci_clk_get_parent,
>   	.set_parent = sci_clk_set_parent,
> +	.restore_context = sci_clk_restore_context,
>   };
>   
>   /**
>
