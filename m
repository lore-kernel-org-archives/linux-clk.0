Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010028.outbound.protection.outlook.com [40.93.198.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18624328B62;
	Thu,  9 Apr 2026 23:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775778648; cv=fail; b=PCQ1nR8lNUmpBC4y9T1UsjOinn9xL/vT611o/19iVVnffK94rIAHIMFIdH2m9esinxQxZGscCfAnqYlHTiZZP0x0kFVoRSJZ7f8daqALqR0okl+pioRj+jVhNvvMF761kFXNjZdi6tjIx2dNEvwA+IkkyCOHeFU3ug2ARR3OCNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775778648; c=relaxed/simple;
	bh=Gq814uc2xoiE418q1o0Uk/5xPkwz4dgjBYV1E4Np2gE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Umn5m+JveZ9j2j2/ldiBAafKr5Px5Zus6UJYTFI0SI2fGTXQmT3m6lgoLZ+ZVneQr4j4BN4kkSF/mzU2juxuCBjLiBFDmqd5UIc+cH5U2QqW53Vkg9hm4V6MiLANmko69oKLmsYiXwM8m3saKFK9YN4Tv5OX+z3OZbJGlZOvB6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vh+Bs+lI; arc=fail smtp.client-ip=40.93.198.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vh+Bs+lI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7GEbXR7yfqLimCPCmPXnWZ/ulaUh1H/Y/Ot+h6tjYtsd1OKWMGWQCkH4yBYEsGv6kTrh1rxadXSsPprelwfxKFu2O+opzIy31hw55xfoUQxYANlndkwohdSb85wFJcJp7hWK0VFPdBX1LCNGJY+nKbpWXg/fW3NqusRln5Ro6nT2FnQn3mGsSliOAMKQrX/cPXj2baRR3/CYJ6DCr1Ko2XdBM/xvooL/04vl2tef2EX+2lXqIYF6CVKn4IGkyu9XrD6gwfLyXA4aK9RYAhaOtiA1BhelwujzyKFoCgY/DkKQ7L2HP5oaWflyf9eaeQoBxMIGaxzrC64wZzeziNElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfZ0a62nC8gi8r2vWXeQZFxyBKPoswQZVK9G6AlCBrU=;
 b=LlDvb2XrmurERgdCQq8sEV/FImNpZkjkz82LMzaUw6SiOIKMi6lQjx/p4Wj+Fcygw3Pk5CGRHmNxkLu0S3N3LrLUWHS+dm+6xtX21lVdcLxYrr6qJUj+p0HImLuIbkh9Wzlhd5caFRIvZbURAqzQFsmagJN2Dr6fda1yXJ3rLrKRqi3lDiDVdQHY6q7wLKcxgW1Tc8jIA4NsRSfZzXJP6bHOrTllBO2+wP8ePc2R5uBAIdAMOUclS8kCdE9DfO2U/5kfKB4vUYP6dEtnVoFV11bFZhXEJWU9aAids1SuHMeBEiZqtezUFayXNb3BhZKfG2G/QhZH42a2yirCTW5jrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfZ0a62nC8gi8r2vWXeQZFxyBKPoswQZVK9G6AlCBrU=;
 b=vh+Bs+lIBZy5utb1FJSxbgQKw5yMV7gDlwKijoHfO3wh9vHYoYaBiB+jcWNKeKCkpAFwJ7ucyelZ6q9X6UZuvP8scsZIB8ccYgioXneVYNo1pU0JGmZ2MVjyKmmhu0tEJq0FYwDWz+sQcAbaGHmFOkc8M7cRZTE8Wr7v9pLgr9g=
Received: from PH7P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::16)
 by MN6PR10MB7424.namprd10.prod.outlook.com (2603:10b6:208:473::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 23:50:44 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::c9) by PH7P222CA0014.outlook.office365.com
 (2603:10b6:510:33a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 23:50:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 23:50:42 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 18:50:42 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 18:50:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 18:50:42 -0500
Received: from [128.247.81.196] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 639NofbG3411243;
	Thu, 9 Apr 2026 18:50:42 -0500
Message-ID: <68f2dd55-ed2f-468f-9b64-6907668d532f@ti.com>
Date: Thu, 9 Apr 2026 18:50:41 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode
 for Jacinto family
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>,
	<richard.genoud@bootlin.com>, Udit Kumar <u-kumar1@ti.com>, Prasanth Mantena
	<p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Dhruva Gole
	<d-gole@ti.com>
References: <20260407-ti-sci-jacinto-s2r-restore-irq-v5-0-97b28f2d93f9@bootlin.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20260407-ti-sci-jacinto-s2r-restore-irq-v5-0-97b28f2d93f9@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|MN6PR10MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 33782074-4943-4d4f-a2cc-08de9692cfb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	E9A6qfe6/euCzePj4sB/rwEsyM34ZCvOj6XwH6f03S5m+iQI3nUwuakdpkEfx3/FL5sFXeElDRsnZ3sY1rokIn3we9s246HNu4+djRXZUkN3gFz7U53jCysgNvrpyXZM3vYFYvQX2rbEG0MPvHpctwXPyIZWCWkw8s9UeVK1A2gXDfAScGFF+3TLAotsaZy08Y4RmVdmqAfwYuBcmkXKu71j3fxtqDn+OA9wYZN6MGAu9sA6pgHPlQAvxkM+T2E4vGovhzH7xm5/1VuPt8te7/vBzR5D7NJUXN3g8ZGP9tkEEQQIXIzytB/AWfdmeiqsgep8rxJpqdHuGtOo0TbnN/c6UDBFYTVg+85ZmB5drSTEH7MP1E0fObnRv/800z/R5fwEPdmHs/96HvMInIwMm+A7xKvTAAkJKYAxKul57sYRTmB16IlovATLKR3NslVHP1Yb6djv+RS6ZvaVqgkHIkkCgI1Hh+F6peCl95ayj/tQyQykWLjVXPFHj2MW+9WORqOPCilu1eHXnwyGbHGPd7FIE5gxo0FuRSyyWgwIrfsZl0iNe/mp56tX4QSnrOlOPIgJdzlfO5QJuePXawYuTzJ+5PP1b54QYKp1CYuK7LvmeqpCMpUr/pcUuUNNEmB8rCNDypJEX8oQXTlXvN835SwxKqYL0uu9dUnv530FML+6zs+wP/GkCoHnDJQRBBvCCniE9jjtR8sYPBPESFatmeZOH5W+CVu/JrjpHIa0bTa9SclfwZRaVoUyR5a5sWLnq7neb+Xl6MQA+Ar3a/TWbQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MT1Fj93a9oDX+wxs67W6jMZ/mNmW2rJX/QmBeHn9/Z/tODRiT9P26tUGYUbeIp9QFmZAHfAtAmdyyU/is3cdWgLd8MppCX2qvtbi/wlE/EyzdVPXSSAU4KBE3IhQVM5MlDgBk2MKxNHgkv/PCAPdzT3k6D7ZlmQDzVBhhUsKhODXddLKILvKGg6a2zGOGpIAjM0tfLq8ny1Io70a9cY5axA1jXzbrHTWSi56PyDhNR9DpcnLqrgCLCA466T/Fhzr9bMLJHFNi1GzsidoUJHyI1+8d3uJ7QYGjwSC4xhoyo/fZd044h67lHbHOsQuGYZCRtt5Uqwk6oR4CJkWem7CMgKSYeU+0TAJ1rdBHsMwECEHse7YMTSzDpdRqVnH37l//+3VACJYS7o4gL/It5/zEtYt7g02jB84jLQE5SLHSOlXfDJSaZssWF/9nji6MG4a
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 23:50:42.6890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33782074-4943-4d4f-a2cc-08de9692cfb4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7424

On 4/7/26 09:25, Thomas Richard (TI) wrote:
> This is the 5th iteration of this series. Nothing new, I just rebased on
> v7.0-rc7, added Dhruva's RB tags, and use kzalloc_obj() in Patch 2.
> 
> Best Regards,
> Thomas
> 
> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>

For the series,

Reviewed-by: Kendall Willis <k-willis@ti.com>

> ---
> Changes in v5:
> - rebase on v7.0-rc7.
> - add Dhruva's RB tag.
> - use kzalloc_obj() in ti_sci driver.
> - Link to v4: https://lore.kernel.org/r/20260204-ti-sci-jacinto-s2r-restore-irq-v4-0-67820af39eac@bootlin.com
> 
> Changes in v4:
> - rebase on linux-next next-20260202.
> - fix BOARDCFG_MANAGED value.
> - add MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST firmware capability.
> - add MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST firmware capability.
> - Link to v3: https://lore.kernel.org/r/20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com
> 
> Changes in v3:
> - rebased on linux-next
> - sci-clk: context_restore() operation restores also rate.
> - Link to v2: https://lore.kernel.org/r/20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com
> 
> Changes in v2:
> - ti_sci: use hlist to store IRQs.
> - sci-clk: add context_restore operation
> - ti_sci: restore clock parents during resume
> - Link to v1: https://lore.kernel.org/r/20251017-ti-sci-jacinto-s2r-restore-irq-v1-0-34d4339d247a@bootlin.com
> 
> ---
> Thomas Richard (TI) (4):
>        firmware: ti_sci: add BOARDCFG_MANAGED mode support
>        firmware: ti_sci: add support for restoring IRQs during resume
>        clk: keystone: sci-clk: add restore_context() operation
>        firmware: ti_sci: add support for restoring clock context during resume
> 
>   drivers/clk/keystone/sci-clk.c |  42 +++++++++--
>   drivers/firmware/ti_sci.c      | 164 ++++++++++++++++++++++++++++++++++++++---
>   drivers/firmware/ti_sci.h      |   6 ++
>   3 files changed, 192 insertions(+), 20 deletions(-)
> ---
> base-commit: d843b67129e266054d8fa2e41e270a9f779381bd
> change-id: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c
> 
> Best regards,

