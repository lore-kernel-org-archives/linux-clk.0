Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010035.outbound.protection.outlook.com [52.101.193.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314CA2BE029;
	Mon,  9 Feb 2026 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770630724; cv=fail; b=kvzl2ww4X3oEiNEX7HI5D+tc9lhFYhIkF2CVsaE5Ym7djAzr7cVY/KeGJIcy6VUvJuOG55d17AKju0xFW+jbBbOp6FomGiA+DLvXvRZGQDWT987P2AsTK8EXzZcMSwVPH6qQfbw/O/ZEHei1Q7AhFcoYhPlZqjZB/uhUAJTSrds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770630724; c=relaxed/simple;
	bh=DJvpAtPhWq79G3iQDvvvw96Z03Wt4r1zfsvUG84rj3A=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksMli7JK/bjLKF2jkASnBXAW3Z77W2mNqT1f9MN4JNC1AORrDFQTJNSAI9xIJsiiwKkeBTQFiIRhaoThII6vg7dnTD1AvITQG8Wnwx+A6rJJmr4o6UuWoYPfTunxIWJqyjNP8ks27uSJ7jK/o9CtUCfWVdfZVcDQqzOK5px2hMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vBrj9xU/; arc=fail smtp.client-ip=52.101.193.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vBrj9xU/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1MhaOWBtezKSZyPBCM8XmMhgsucqn7XraJm1jYW1QdQ4rGO9H1A4fjO7dMo6vJKefmH3uqwm6+C6p5lUTZSn/EqiF6XvxcOSjaIJgu0Gm1S1WE9K6DUnslLjzUoAIuqabRbaneGzWT7LKv0txS6w3NG2Os5eBzN9Y4oEmxJdYvm9zqjwe6LicLj2OHSiFEBQ9YnHSA4G0zjwaFAQ1zzXVkZ9MKkfSqBw/AMuya3SrUJqMU1NlDfXpAbx0Nt6/GhpdtbERE42MprLy8D1XRxnlFYXKsIljoS3ltYkQQSs/1IJTYFAv5rBQVeQXYVVfQa4wz2tiVdJ0V3pMIpmIPxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9tSNfXbkHDJDx9DGTazJ+MYx2zanc+f9ia4eIVktNo=;
 b=gU3WnDWaD44Va+0MDT0cJr9FXawWUNxgvVbtTTxvlRd38ldKc5EQqN1SPYekWZuuD8Rr//o+g/Hqg9l3HDQ/sMw70NptG0Uh0dhVMB/qfKa2MInEnEkb/EKugrQRJx84SzA9+Q0v3kdbhJiD0KVj3Ixg46R2ene9380v0BgQOWE6McsY1u5noCFKzKZ0hiovnnk4FHmSt21ykF3+nAtiCdo4vr1Kr5LTMyL4SfCTKKfMPmonh8TvvJjFrkQdxjhontfz8/AGTMihQ3Xc2J2Xd+EXFIoeWnkbr5gsGxDlsy0zguRif2JSvCQOdDRlCJdk5Fg1PI0bbowoLDZUYygv9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9tSNfXbkHDJDx9DGTazJ+MYx2zanc+f9ia4eIVktNo=;
 b=vBrj9xU/bZMWVjgKZhFxSJIp5xBODWwhoWkvfxliRrJ04vshMIoA/xMrq97mtWfzkwcfIpUyruuppTMtoW0FIKIaR52v5K2xFBirz1hIBPvedGU3851/VPDdRDZ/weF+CRW8rJ0/DA6AutJYj/ybOYP+bc9oLSUNnlLWwrbdEk4=
Received: from CH2PR08CA0014.namprd08.prod.outlook.com (2603:10b6:610:5a::24)
 by SA6PR10MB8014.namprd10.prod.outlook.com (2603:10b6:806:445::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Mon, 9 Feb
 2026 09:52:02 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::50) by CH2PR08CA0014.outlook.office365.com
 (2603:10b6:610:5a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 09:52:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 09:52:01 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 03:52:01 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 03:52:01 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 03:52:01 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6199q0Na1785445;
	Mon, 9 Feb 2026 03:52:00 -0600
Date: Mon, 9 Feb 2026 15:21:59 +0530
From: Dhruva Gole <d-gole@ti.com>
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Gregory CLEMENT
	<gregory.clement@bootlin.com>, <richard.genoud@bootlin.com>, Udit Kumar
	<u-kumar1@ti.com>, Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar
	<a-kumar2@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode
 for Jacinto family
Message-ID: <20260209095159.pfcthh5a4yo4q2em@lcpd911>
References: <20260204-ti-sci-jacinto-s2r-restore-irq-v4-0-67820af39eac@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260204-ti-sci-jacinto-s2r-restore-irq-v4-0-67820af39eac@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|SA6PR10MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: eeba6a2b-22c0-4eea-c8b8-08de67c0dfd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bYU2Aoypn/rLGqwX1469clo0Fh04NS4Tw660fWK8XuDwaD0aEEroJomRXoyj?=
 =?us-ascii?Q?lCjO395PAEhUUzYkG50ZMpX2PQyAF4PJ5NT4TJigG862nahAVFsE7zvmf/Rb?=
 =?us-ascii?Q?OUX7XjXN2UdzvjAgoyZPPuah3z8aBS7RCoUzTzlXR+8CFJFEegr9iI1B6FcI?=
 =?us-ascii?Q?dYueZG28k5/v3EZdb9vVx06qzxguflMk9pqccMbjiZLDyyUHA//a4nc+Epwx?=
 =?us-ascii?Q?z4PyCvl84DTD71TL1W3iDdqqveUXW7CYKaLowjVUljgD9vm6Lre7GUJTsgMW?=
 =?us-ascii?Q?LXTP809grGxPz2WWwF2pY4AivBoctrJNzJTpHHzM/jU6qdLcFoYTq2w2tDBi?=
 =?us-ascii?Q?tnsW4haZ5XsfgR5ReXN9jfVvvfe1zTP8kFmSh9760xU2jVD5lXsn8WLNFcIq?=
 =?us-ascii?Q?BDNaDH3LKDThL5UQmw9ERZR2pdiEiMg7MWZ4ATPGIcYQJuMkBnV2ELz2x2/y?=
 =?us-ascii?Q?F7thB53f4NwRQsDJaagrrtVUBK5UHgHg33MIkncwkv2wyG2IvnBVdxdigBz1?=
 =?us-ascii?Q?xMHw3Cz2FyuK+vZ9qGmySTmKdbLr9YXqc0dhtn+BlH4RRtKNGMOxn2MoMYKB?=
 =?us-ascii?Q?Eeq33Y/BX6JhpsCZPoXM0/h0N0OYR11gB/aR52IQPoo6tWrEVrgmEsqpgC1a?=
 =?us-ascii?Q?1kruDoh+ROsHUmEwZIIe/T3LbNHcVAXWL2PC/qOLi6HPI3PiJI34fUC2x5DR?=
 =?us-ascii?Q?YB7pInFJy00+yHOaBZV9TXRNexJ6y3pvWNisg6Ugokt4Zxi+NXZCL3MPSsez?=
 =?us-ascii?Q?ebfI2wvtqf/3/eSiuNLMcd2O8rPtKYHPkBMSTeKdOnS93JoUffJgdWBL+vOu?=
 =?us-ascii?Q?OFRuAKkrEYhi/HKR/+ylj1RLg3HV4vWv5GJwfKl/iT/hdM1lKj+L8Isp5WH+?=
 =?us-ascii?Q?v9dZTKuHe9NIFz7jOR4Kw1gdwmpJP3XdrYyKsvh5mMlnKYc4lUWDa82LGRYg?=
 =?us-ascii?Q?AdpGh+88U42N7uEBzv4qJcRfS7SLbaKSkiAuUH3D6KBByQWLzL+FH7fdHaAT?=
 =?us-ascii?Q?XJ1cPdiSLWT4DSuWV1c00lh7Utq3Bpa+JQIyfv0PKKcj2TlT5nywPYBh5jZ7?=
 =?us-ascii?Q?5t8b+C9DlLd9RCwUTlChEu4OXRQYFR59H6vwTbOPDlPMXZty23VC+oWoenTR?=
 =?us-ascii?Q?oiFg4ylaYc8+gW0cqYkClgPpxHg7W8W8Fnm2HC6VRLgaq3LfK5aS26TsDbYW?=
 =?us-ascii?Q?UziDFxCmpJr0qpisKZathWqQ+sEr7S/yn5ApKOB/S1enXOtzJexyj2MpVObo?=
 =?us-ascii?Q?4xkyI64F/NPJAdEIXPYvSK2zlFyda9WtFRhJatQHAta+bMAnRq1//ZHD2swY?=
 =?us-ascii?Q?HRVKttW3ehI8GNI5HKsAG4u6Ug46ugM8Ew2AOxk1y29nKLf829lPJFuSklTm?=
 =?us-ascii?Q?iZW9bBF6JJZMtLAq+Djf1Jb6ezO9+O1zOyxYID0WhWigihcsdZ0EhWv7W9e8?=
 =?us-ascii?Q?TvX2lbnfSMPP68acUgS3P5TvYgSVFC/E1lrEDM2whQOJLYU8+6k3ZBI4IST4?=
 =?us-ascii?Q?mPEtY4/qjI8oSMNeYzcLbJASfm5McqwNREdZE6XgtLL9xuQ4KLIcBmQ/Nv0n?=
 =?us-ascii?Q?Hq3/nE+XEQxl2Fp/aAnAstjbaBEjKd5WNXsGBKiCL3PWgqv+qN1pg1m4hzkA?=
 =?us-ascii?Q?8hYkQu/JOlo4aB7tVx/N0w8ZjQrNEw7B9vLtWwpo8VLu2FByOjBHqVwxPyVo?=
 =?us-ascii?Q?l8vtAQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l1SZ7bWdbZ40FYIQf52uQQNZbN02fzAUuQDPMlh+9lcDnubSSMxsjnmBE8GfPFTAFsF8SXZDPT2N8nHP+Wf2qOjvEbaJ5GV/E5iLSOFe3fXVyQplSSg7mGZOtFvnOTqxvxZXgU+cpybUtO+jzrhFwHERM6wyTpbqPrT9lClEAORYEDUbJYP3dNlSY6jNsfYzg2Mk3PsUn0uyA2Eap4jwgb5grGzYExf9oCb2CCzh3kH1Yb+GT2+Cmpip7EwjE7J23bo4hr0xtPb7AgAqDGaw8Yxh2Mhpwr/FhPZfnk8UOZsfKE+S1aCQ1txkRzImmZg4TGkwxfDAOcraU9LAaNc0IXh/q0ENPqHT8Dd8Idfb/gndAV/nM83YWRnIGf8/CGIJSc2b6CxUczx+3A5iTbBQ/DZmPYLcVjcgkUGWzCnIHsyUSryy4p0bucSXQj4i6KDU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:52:01.9047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeba6a2b-22c0-4eea-c8b8-08de67c0dfd8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8014

On Feb 04, 2026 at 16:03:37 +0100, Thomas Richard (TI) wrote:
> The fourth iteration of this series adds support for two new firmware
> capabilities:
> - MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST: Indicates that DM-Firmware is not
>   able to restore IRQ context during resume after suspend-to-ram.
> - MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST: Indicates that DM-Firmware is not
>   able to restore clock context (rate and parent configuration) during
>   resume after suspend-to-ram.
> 
> Now, ti_sci driver determines whether to restore IRQs based on the
> MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST capability rather than the
> BOARDCFG_MANAGED mode. The same logic applies to the clock context.
> 
> Both J784s4 and J7200 platforms support these new capabilities. A
> corresponding pull request has been submitted on DM-Firmware side to
> define and enable these capabilities.
> 
> The value for the BOARDCFG_MANAGED mode has also been fixed.
> 
> Public documentation for BOARDCFG_MANAGED mode and these new capabilities
> is currently unavailable. I will update the series with relevant
> documentation references as soon as they become available.
> 
> I rebased the series on linux-next next-20260202.
> 
> Best Regards,
> Thomas
> 
> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
> ---
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
>       firmware: ti_sci: add BOARDCFG_MANAGED mode support
>       firmware: ti_sci: add support for restoring IRQs during resume
>       clk: keystone: sci-clk: add restore_context() operation
>       firmware: ti_sci: add support for restoring clock context during resume

The series looks good to me, just checking if maintainer prefers the 2/4
PATCH on IRQ restore to be split up. IMO similar to how you've split up
the clk restore support and then actually restored clk context in
another patch, you can do similar split up for IRQ.
No strong opinions from my side though.

Reviewed-by: Dhruva Gole <d-gole@ti.com>

> 
>  drivers/clk/keystone/sci-clk.c |  42 +++++++++--
>  drivers/firmware/ti_sci.c      | 164 ++++++++++++++++++++++++++++++++++++++---
>  drivers/firmware/ti_sci.h      |   6 ++
>  3 files changed, 192 insertions(+), 20 deletions(-)
> ---
> base-commit: c6fb8985458d675f32a22788f30afcba754b6d78
> change-id: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c
> 
> Best regards,
> -- 
> Thomas Richard (TI) <thomas.richard@bootlin.com>
> 
> 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
