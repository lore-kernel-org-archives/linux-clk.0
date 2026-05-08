Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010044.outbound.protection.outlook.com [52.101.193.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5C33F787F;
	Fri,  8 May 2026 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778259560; cv=fail; b=gT954Q4Pf9rNbJOBPz7CgkZAl6QokqwNU/SRsDNsk7WV9U/j/F4uIJmE7SaOSYW5WQggUdqzvTbSmGwzedcYdv7yqfdHDemjMvoiMisVPW/HJmq6485sCTneYt4TaaYOCGsofFjXAInC1AjW/1bp3irsOdhg9OVM6gRpYeZN9oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778259560; c=relaxed/simple;
	bh=VRhdBrbkKp/lqMAooeaJVoD06GobO9687qCpwcH85ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FlnRP7lRWP9oI9bYeCM0DnqOcbSyOnjR9dYgyON6WWpLmUJTD5OweyqywkwfK9uODpr7n2J5OJUxSf3FCSpPEZQKBY+4LcQfG67dvItrJCiIZDJ7llpwuvAIrMjNtfirlI1Wo57OwPgaPBQ9SyhpJS0Orfw8gG3G5fLVxgGJedM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IL0PRxKr; arc=fail smtp.client-ip=52.101.193.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IL0PRxKr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkpcSzgSwUGKm8YUVO2Rs+niNWANIm7vbMd1oxtCUM2TvubF61cHV/uYj2WoUjnY+IWTXQ1fm/TmBoPibkH4kQG4jdGSsVFgKL75fmhbD+PbsvqyM8kGZ8+IM4tTcRXc2FhhtKEVXqK2ycrZ+C5kln9hUZ+BpYsFwWd3cfQl9g0bgG67N4MFpOCFzT5eN/9XvDdDAVwP7yR39lQAUrtlqHa2VNP4FukA4FYGxi3d3taitAwDauueCsIx5p/ELyJxlNpKXhxg3C8l0XVT7BLmw2XNnibtL1EanZVf6xijuTP95Kcw5qM+iDIZfhnJT8NfbRDjTsZTjm4UaNq7cqUltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yFyZr2+sBfK/Gih/91ZF5j7L4ncEmrCv3w61SdtFVE=;
 b=EJ5l2wONltMv/UW2ExNoFkBOht5ZczkT7wKh5ewfveijK+wTVqpdJ1i1Um5MX+M0nb4T86ubj77pCagHii8y9ogRGEXp/3wv8HV7WvBsofZs2zUO8hvuVVkyyyHwcfoN5ZqOLR5K8LHBqmv4oG4RoC5bYbRTL9mR0b1AlOMnjn/S7+UpCrs8Mnc3+QFUlGowB6fJjw/IO6dWOFGE1ByKIKgJkvdU6QbWWmiwWaDQnSb1GXT9uKR/VScWXbln6zmqF5c14oS3OSC2tg1ERZCVUF8y0YlVmpP6qWi3UV+0fZUa+RHv9r1A1uuCKZRkMEpvAnQ9yIKePp4MRic1m4j6zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=208suo.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yFyZr2+sBfK/Gih/91ZF5j7L4ncEmrCv3w61SdtFVE=;
 b=IL0PRxKrtKreuPOQY9qeqYE+m/x0AQTLeKDMQ3qp9Vm8Qt0hBnS+clRF6gf4Bbc3zWblTqv/h6Gu7NvaZktepMeZ6QwQkYx9V0GizaWHYgBFbRvkIVDoj3u0HlnxRzg275Bbzy5yvZueKIPUUP0Rxj+XmkwBqDlqJRBCOWUINSc=
Received: from BN9PR03CA0773.namprd03.prod.outlook.com (2603:10b6:408:13a::28)
 by SJ0PR10MB5720.namprd10.prod.outlook.com (2603:10b6:a03:3ef::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 8 May
 2026 16:59:14 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:13a:cafe::11) by BN9PR03CA0773.outlook.office365.com
 (2603:10b6:408:13a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 16:59:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 16:59:12 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 11:59:12 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 11:59:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 11:59:12 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648GxBuJ1785509;
	Fri, 8 May 2026 11:59:11 -0500
Message-ID: <003e3057-971b-4b6b-8645-787d76de2387@ti.com>
Date: Fri, 8 May 2026 11:59:11 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: keystone: sci-clk: fix application of sizeof to
 pointer
To: Nishanth Menon <nm@ti.com>, Brian Masney <bmasney@redhat.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	"Santosh Shilimkar" <ssantosh@kernel.org>, Tero Kristo <kristo@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Jing Yangyang
	<jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>, kernel test robot
	<lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>, David Yang
	<davidcomponentone@gmail.com>, Jing Yangyang <cgel.zte@gmail.com>, Ran Sun
	<sunran001@208suo.com>
References: <20260508152321.3683799-1-nm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260508152321.3683799-1-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|SJ0PR10MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: e54e38c9-3c0b-4951-9736-08dead232178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	T0hYxj8eaCpvAxBdmtKtp4HbDkGqywA/Fx1dG+ybdDQPZjh7oP5ZZ322sn5wQra+EMwbVFOzaq9ZRbhWNtUFMCJF6XUcCs6KVIfHeg4NFTvTuFInDyQZkCGmklwN/d1QofFzvT/3md5yl1mqAXpKTgeybOWH6Scw7VmsOkPqlZ1g/QhTovaWMV9GEh/hN0dt00yRRzyorPOFIqdYi5lg540TKswnl5tF4B18D0Sb5ZnN9WJv/iJDMEKxKbTTSZaefTt7sBfmX0HOWoJ9OAstq1bLQ8t9LL+R7nnQSisP3DVoa7y7BpR6I2I0Vh6hUfE0XTm+ictBf6BRgc8UIgnZDSdINCoXWexMOkri/g4sKOiPjxaz+NFHQXyF1Hx4bZR9W8LohyGirXuzDy1zyxuzscDoAL2Mxd9v8U2jyvE8zDRsbzh40i9cNmk+o/zPqlHfs25c4xvegQc88hDNc879mtdP2rMThGBza12+ri467ekDka5nOSfvOvDim28erMkgQj7QB/EnIXgcv+7Y+zbF8AvwSj8vp6Rd5lYI8K0i2XblZOTD3ndEuDHDs2ILV3MsuPvssPezAEaeFdoNaA/D7jHYVEs5nQxxgP+F48YFmYv+J7jHcX3FtvunhLPDxsaZvyGotQF5aRJ095V8SNQsBWZkxi3sKo9zFqUlR3euaRBZ8HlXHo4sviRcqCTG7dJT
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C1kWvby/wOvZqCUC2DWH5jSC4LA0pPemcxCec6j6xLwb385AWg0wmWoj+NZnu8OP7z4SSCFLhDUQx9sZLoFCpvF7djPah1QcNPtAbiChEnk+QKKPvCiPmUrSFz2N8HnoqCmGqOfWv7MgMlK2r2kUpXKPEctuEhnDLdg/LRoMLhlVJBMgpIQQrOb98O7d1bQsUU70dI28kdRIbIakchxmHv3IzxyVmeWYlpMA4FyD65zywOi5fQhAoda3TJeQMfG2L5jAk2M5anIQEGQH1lrUD6pIrOJ91RkOI4T66OtNcye5XDU4DCioNm9gd+XOHUuKb42PpYfv1zYmbF8Bph86e6iBDvFyQE9PUjdX0NamYrA0fhd0L3vwxERT8XANI8zHrhDLAUtFP1xUInurbtcsDy+ZPHjeVn5huycFpC8NXmF+ynPgNi11c4nZ20GYBi+/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 16:59:12.8935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e54e38c9-3c0b-4951-9736-08dead232178
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5720

On 5/8/26 10:23 AM, Nishanth Menon wrote:
> From: Jing Yangyang <jing.yangyang@zte.com.cn>
> 
> Coccinelle (scripts/coccinelle/misc/noderef.cocci) reports:
> 
>    drivers/clk/keystone/sci-clk.c:391:8-14: ERROR: application of
>    sizeof to pointer
> 
> provider->clocks is an array of struct sci_clk *, so bsearch()
> expects the size of each element (struct sci_clk *). However,
> sizeof(clk) evaluates to the size of a pointer-to-pointer.
> 
> Use sizeof(*clk) to pass the correct element size.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Closes: https://lore.kernel.org/all/84a6ba16686347099a3dab2e5161a930e792eb6e.1629198281.git.jing.yangyang@zte.com.cn/
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/all/202512040525.zrHSDl5h-lkp@intel.com/
> Link: https://lore.kernel.org/linux-clk/20211012021931.176727-1-davidcomponentone@gmail.com/
> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
> Signed-off-by: David Yang <davidcomponentone@gmail.com>
> [nm@ti.com: Improved commit message]
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> Cc: Jing Yangyang <cgel.zte@gmail.com>
> Cc: Ran Sun <sunran001@208suo.com>
> 
>   - Functionality: No impact (on Linux architectures), thus no Fixes/Stable tag.

Not sure what "on Linux architectures" means here, this should be true for any
sane system, right? You are going from the sizeof(pointer-to-pointer) to the
sizeof(pointer), both should be equal. This is just to be more technically
correct and silence a Coccinelle warning. Anyway,

Reviewed-by: Andrew Davis <afd@ti.com>

>   - History: This patch has long-standing history; I have attributed it to the
>    earliest valid author found during a recent scrub.
>   - Reports: Retained chronological attribution even where public reports (Zeal
>    Robot) are unavailable.
>   - Checkpatch: Acknowledging minor warning regarding tag ordering (Reported-by
>    / Closes sequence); chosen to maintain link integrity for automated tools.
>   - Testing: Verified on available K3 SoCs against 2026-05-07:
>    https://gist.github.com/nmenon/afa9ac915e189334f048c177f16fe54f
> 
>   drivers/clk/keystone/sci-clk.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
> index 9d5071223f4c..2fc1f050779b 100644
> --- a/drivers/clk/keystone/sci-clk.c
> +++ b/drivers/clk/keystone/sci-clk.c
> @@ -388,7 +388,7 @@ static struct clk_hw *sci_clk_get(struct of_phandle_args *clkspec, void *data)
>   	key.clk_id = clkspec->args[1];
>   
>   	clk = bsearch(&key, provider->clocks, provider->num_clocks,
> -		      sizeof(clk), _cmp_sci_clk);
> +		      sizeof(*clk), _cmp_sci_clk);
>   
>   	if (!clk)
>   		return ERR_PTR(-ENODEV);

