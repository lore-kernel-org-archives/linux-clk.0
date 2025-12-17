Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012018.outbound.protection.outlook.com [52.101.48.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3905D285041;
	Wed, 17 Dec 2025 06:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765951663; cv=fail; b=Hq4POI/IS1XsQtAdzPzPM0avya29PBBWO3UXgDDSrtA2qCVvJi/ntbxizCgxMyUOUhHbMKfdXs14HiyaL5ZgW+eUY1wGGzLOQuWBs0E6A8EPaiLwkH/UBXp1aCTvia9Ss3alUvG38W1N8oHo3P6B5dXx6OMFvslP7bfq3hFtLJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765951663; c=relaxed/simple;
	bh=1TTDlC/xjS/ZyDCEx59qrVhAISGKJNz1hxxw0/cZ054=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXkdS70n9GsHJ2pTHmd4Lz2ypHm1exe5gueOTrW7dfH66ZsgnbLxJF1Zak6LLv6u5Hj21uTJ56dNQVD0EnX9+9ChAjWgKLCCus0uwetPwQV2WplZHAXxhPokifdf9mF/wq0QtJRDeiPaLFL2kqmT6V5K+GrIfFRrPzrUZzZfBUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WuCzC+A9; arc=fail smtp.client-ip=52.101.48.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WuCzC+A9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+It8XEvZGfk72wjJO3I4ZOjazPK+8+ZRx/lrc0k9hmSbgg0TK8ygVLsWHTwDNhB1gfYy6XQEWIqRle7ZSzK34oByh347mokG+R7uBPPxtUVO6K6c332TY83f8YU9YceOgrqeBnGf23AnOc19jckli9QZvj9WQsqFXSY0kVlhCkghzA7mGD0iU2QrYSEuEL+zqT9eV+HkB1PMFv1ge1qoMjB2FKUS0pomAPExPWXgLbKFTCxkWbTcUb8qTvRYMeLXqKsNqfZm/aRPvfwipijJ1YMQysDmUXqt8Hc2OUFW9MBDFJWtIZ5zJ/vvRk4wLBiVuc1iSp3WkbMX9ZQKva3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mT6Ob3T+Hck0GCaspJsG1WWYg+sT0c5Mv7HfatwQa4I=;
 b=eBbUSSSF76S9qPjXBKe5yTSpD0A3HtlwyGNFxs0J7usUBl9WLLPOU4fTeTAamyJm115C0Tm1cjiz1IV+Zv5FJ7j/SI3dXcVC/EuCkcnatBDu3NsIUgZXu29y9fjD48vrONmGYSaf3SIADa82vzoSifhmKAip7wJD9H/Edp7igyTrW9lh52eUUfulOGrmIGn9hujfb5vDg83+QH9ZhewU7lLNHdE46aluFxFppnW40nUNRi5sR3GJ1YD9FZFjw6saaeC4Ju/VIQwExMgT0elXqcf+AviwxIwp7VyMiYEnkwNKfWqjpXvG3fF5TH59HarkyfMNmrL+qxtImH7Nkmu9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mT6Ob3T+Hck0GCaspJsG1WWYg+sT0c5Mv7HfatwQa4I=;
 b=WuCzC+A9bsjkS4AZf8e5rcjiE2ukWI25KEztSOb5NOgfPJFUvBJ2iOubJgtp7DIkuNx7L1fGkpVtlVbCfNjMLcWC7YarC6/5FcTN+rQ9kE40rQG/Mpf1O1aafwg90neF95qcQDw0U7jcck43KPuzrafSo6FDT+nEaIwC7As18fE=
Received: from SJ0PR03CA0186.namprd03.prod.outlook.com (2603:10b6:a03:2ef::11)
 by PH8PR10MB6478.namprd10.prod.outlook.com (2603:10b6:510:22e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 06:07:39 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::bb) by SJ0PR03CA0186.outlook.office365.com
 (2603:10b6:a03:2ef::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 06:07:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 06:07:37 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 00:07:29 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 00:07:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Dec 2025 00:07:28 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BH67RnZ1055914;
	Wed, 17 Dec 2025 00:07:28 -0600
Date: Wed, 17 Dec 2025 11:37:27 +0530
From: Dhruva Gole <d-gole@ti.com>
To: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Gregory CLEMENT
	<gregory.clement@bootlin.com>, <richard.genoud@bootlin.com>, Udit Kumar
	<u-kumar1@ti.com>, Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar
	<a-kumar2@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] firmware: ti_sci: restore clock context during
 resume in BOARDCFG_MANAGED mode
Message-ID: <20251217060727.idneboxj7kwslie2@lcpd911>
References: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
 <20251205-ti-sci-jacinto-s2r-restore-irq-v3-4-d06963974ad4@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-4-d06963974ad4@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|PH8PR10MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: b2f40a9d-5fe2-4b82-e7c5-08de3d329459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zcwQ6esRMnRqMEJaAPvzgGHLzUwBLiPMAaP+JuEWMW5wKK/57mSPl1AWGFEt?=
 =?us-ascii?Q?VaSVsOp6WnQ8nPbkTfHcfUkqwT1dbpRxJgYxlibKpyvTZBatlA45yCFip7Ad?=
 =?us-ascii?Q?BEWL1oYIIwWC5JvJidGiLcarznykIvo7pFdsL+GeaaNNrckRtnqv1vJvwkui?=
 =?us-ascii?Q?6Jg97iypLUNA5xKOlW2UOzSR0ajDmNDbHrJ8/u+NFhX/ndvPnp/cpxcvrh4Y?=
 =?us-ascii?Q?2kvgu102abW1wz5wa2cFEA0qf5V9cAoGfNCYadQ07ecYZgmZyc6il9A1zRIf?=
 =?us-ascii?Q?iq5mWjMJL4acg/EdI6bjGP7C9X4dF1wS/QiFPwxWimwz9ol59j+MxsUV1a+V?=
 =?us-ascii?Q?sWyQPDaQkw6d6lrUtDNiZ5z7M6UEcSAcsYRG6seVJ+gC5831jnKsT+Qzgc9I?=
 =?us-ascii?Q?4Od94jmC5Z3VWYbyeRHyf//ZAzGDcDvzqdLlMcF4ZN/NgSzQHMT30K4sCAcF?=
 =?us-ascii?Q?QTSoONmKzengS/SnCDkeBCTCxabidwq2+nQSoUaLDSTFXs4uYnon/sT99KFr?=
 =?us-ascii?Q?WVMSJcOdLlbU/gaExZmD0KCIDTUJ4SxTbsJuSblNDg/ZXYMqD36JO36hnb/E?=
 =?us-ascii?Q?rTEzUp25ILfwVdZfcZDBeUCeZgtQGWkKf55vj4PfxT+CGrk8ufsZ1FxCJ6nC?=
 =?us-ascii?Q?rg4w53/npSAwuG8wX15x2irR+F/yVSpEm0ybBk7DSmuLjdiH0BDOn+YUCq4Q?=
 =?us-ascii?Q?dAZ4dc5Go4WG8zcB2v2BXT1U4xs049T60Gj0DXjbkTMKRA/7AnvR+d5/Egux?=
 =?us-ascii?Q?/fhFbck1Z/3fAdwVBLgJEjElJcXiXTh3VGjVWkeO4zyE6f/sRuNaIRMzcCRj?=
 =?us-ascii?Q?3AUqzaqISG7lEphJ6v+ETjiMHw0qILit6XpAKU+oHDWiPJ+GH9Jn7xhxN9+3?=
 =?us-ascii?Q?/prUqIdNMm2Bwo62mx+1+pAEe4ey+1Po+TyoxFSgi4tf5IYYfEJtxgVMhTV9?=
 =?us-ascii?Q?Ng67HrLw3IkfDFwjSKHuis/An/9KgkPc10m/qJ3I+5Kwag+R+cBZCjUF+K2w?=
 =?us-ascii?Q?RSZ80bixGPwzqAbN+rDcmUWmDjflq+psEokSEtSWMO9ddNWp6jJIZORhAK76?=
 =?us-ascii?Q?YoX3lYlobCeQ126V0ZIqqoUgmEQgf1nmS9e632Ho4YjvPs31KraReQBKdEfL?=
 =?us-ascii?Q?9CizSsKJZcwVszw6lWDtpYimaN9C9gtmW3lcngcovkXi7jUuwLaSsbqSOzIT?=
 =?us-ascii?Q?9owu4IN7bciCzNrb3xXU0xRAN1661HaRtSmJ+WRV3oKxwdPfImtfaxygwtMF?=
 =?us-ascii?Q?VS/8EIcefMgIqaU0mgMdX4zRirT7ZJqbXfacBGYYrguKcof9GtOoqPhXMUjK?=
 =?us-ascii?Q?MG1lCvDYE2309DC+FiWcvxLPUjHtsLkKrAcCLiG2nbpHgA1TVBmfLM890xv8?=
 =?us-ascii?Q?b/wHD4vcLYsrgKWNn00mIBYAY5B7TsUE0LYXFfHe9LZlyWI9guJ/ldstoDa0?=
 =?us-ascii?Q?nzp3XfUqFnFT1856w4ibzswElQp6vXmrgtbv0kxvtW1G2d+CLg6WVNs2eEnW?=
 =?us-ascii?Q?98Q5ZTentEHwkjGHPLAzHsMzb5zZ2rKI/uaURdkQzMuP+Rad16pIpH691y6g?=
 =?us-ascii?Q?GCpIFPEaMo8m994/IsA=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 06:07:37.8773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f40a9d-5fe2-4b82-e7c5-08de3d329459
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6478

On Dec 05, 2025 at 15:28:26 +0100, Thomas Richard (TI.com) wrote:
> In BOARDCFG_MANAGED mode, the firmware cannot restore the clock rates and
> the clock parents. This responsibility is therefore delegated to the ti_sci
> driver, which uses clk_restore_context() to trigger the context_restore()
> operation for all registered clocks, including those managed by the sci-clk
> driver. The sci-clk driver implements the context_restore() operation to
> ensure rates and clock parents are correctly restored.
> 
> Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
> ---
>  drivers/firmware/ti_sci.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index 8d94745376e2a..6ef687e481c49 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -9,6 +9,7 @@
>  #define pr_fmt(fmt) "%s: " fmt, __func__
>  
>  #include <linux/bitmap.h>
> +#include <linux/clk.h>
>  #include <linux/cpu.h>
>  #include <linux/debugfs.h>
>  #include <linux/export.h>
> @@ -3980,6 +3981,8 @@ static int ti_sci_resume_noirq(struct device *dev)
>  				if (ret)
>  					return ret;
>  			}
> +
> +			clk_restore_context();

Here as well, make it conditional to only BOARDCFG_MANAGED. Other
platforms/ firmwares have lived without this for a while now, and it's
evident that we don't always need this.

Thinking more about this, I think we're over using this BOARDCFG_MANAGED
mode a bit much. We should really just come up with new FW caps for
this, one for clk_restore , other for the previous IRQ restore patch.

That's the only way I can see this scaling. In future if we ever need
more devices that may actually be BOARDCFG_MANAGED, but don't need the
IRQ or clock restoration then the current approach won't work.

MODE should only be passed in the prepare_sleep, where it makes sense.
Using it for anything else just does not feel clean to me.

Thoughts?

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
