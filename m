Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011030.outbound.protection.outlook.com [52.101.52.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8033D0C0B;
	Wed,  3 Jun 2026 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780502455; cv=fail; b=su3FucLpu4I9jK/3tr2yByYY7dVj0gboDCARE/zzsvzV3d1Bk8S8NJvJKNibhHjY05yBd/HNfSy6vy0FnMhhEZG1Gc3XOnliK1VqNf1JkZt/hm62hsd/gWuldOiwdznufgj5vcEEcPu9+uzwU3bU9GXeejyUmtvUGtU8c1Wysy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780502455; c=relaxed/simple;
	bh=XTJ6Dzy9KhW7Rk/DOY2+FI4DvLI8gfffjn3m/hTarVg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttcCkidF4s6eSPDYdLySInjWzj1P3itLW3G7so/v1/o+93msDYOt8E82pPVfAV11Lukxayu3mtOF589CQxJMqziB+Fq2aDfAxy1u7MHiCMoT+KZX+mHz/d0aKK0sctD66IjfxKdQCFXxaLbEOFtlU9q7DZTKYATJlqFumScYJ4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UIG8MSPS; arc=fail smtp.client-ip=52.101.52.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UIG8MSPS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4lGyn1TZUocQBjppMp5WaGAF8Alz77j6a3n0oWOUSGWqnMinMv+lT7InrAzqihdk73y8SYHKz0bGBUCrVO1MqIZglXwsa+Ak0XLm4tqdJSo7ong4IKyjW8wJJW+eDGjyLoXXTzw16uuL2EYigZQANdnBGUsoj1gnhBRWgALL0BsTxAEiv+tmfxK7Om3h6qy0VU2tp1nMpAzpj6PTiutGlA8NnHdofYeaAKgvGMTk4uLZLDW8HG6b6/oNFA37FXTngol/4Q19QODsCkWboQdgNKdYWsttsI9bBqZMIuqulo6bT0Tm5n9/u0QqOPQXDI/AacoXvd9bUPdyfFmCZgyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCK/BW3J71SgpnFE5QPnk2kR+1iP5v1udNsZWnPnFD8=;
 b=n1RHM5FQCifRmaVwjHO85NBnb5E3z8+FOE+MfsaG/url6V0q+rHr6KOXyD1W8ubyFNkYtwhiLRUtwEHGHQj2fCwYR1nADhzslurrfgW3GvT2Oe7/unjYDf1OlpvXZDTlC46Q0Y1jA6ORgAi11qh4sWVWoFbI4k76AEwhOzGmxZWLpM71ojJlVcR6yfLF8gxhdQYoszOQwAD1rPCgHktGARThBKPEs0O68ZItk1jK9c98VxGibkDKRwU+/FwEcp0LfsBRjF7lTsm7qxY8L8yg9qaMJRUrJj0LF/urXA6FJdNsqHVFAuttvoV+0M76cVgf2fr0q3VxfMBm2NBajQrRlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=redhat.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCK/BW3J71SgpnFE5QPnk2kR+1iP5v1udNsZWnPnFD8=;
 b=UIG8MSPSBPYDxUknCggYl7OJkBAo3NxAYLf74Xl80ylg1lJLqtMwYHJqAZkgTdp78kl3kITrHsJIMU6u8UPGH9xN2lxiAzc1cib1zM1VV2NWFahzJddxbm+7UwTNvqNpa/pQteINhIDyND2CZsZR4z5VQN/U4lPpryRtId8Jpfo=
Received: from MW4PR03CA0166.namprd03.prod.outlook.com (2603:10b6:303:8d::21)
 by CO6PR10MB5789.namprd10.prod.outlook.com (2603:10b6:303:140::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 16:00:51 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:303:8d:cafe::6) by MW4PR03CA0166.outlook.office365.com
 (2603:10b6:303:8d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 16:00:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 16:00:51 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 11:00:35 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 11:00:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 11:00:34 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653G0Y2A2063177;
	Wed, 3 Jun 2026 11:00:34 -0500
Date: Wed, 3 Jun 2026 11:00:34 -0500
From: Nishanth Menon <nm@ti.com>
To: Stephen Boyd <sboyd@kernel.org>
CC: <a-christidis@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Michael Walle
	<mwalle@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Randolph Sapp
	<rs@ti.com>, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v2] clk: keystone: don't cache clock rate
Message-ID: <20260603160034.fbemt5n6pqyrmwke@strode>
References: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
 <agHpYnkCgGfZp2-E@redhat.com>
 <20260512104848.4axgjeto6i7ejvli@retorted>
 <agM-VB-ToGFNphfu@redhat.com>
 <20260512171604.5ntgq65bmedb7jpc@stinger>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260512171604.5ntgq65bmedb7jpc@stinger>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|CO6PR10MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: 811e468e-b61f-44c1-3af3-08dec1894926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|7416014|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CstvOpx6KEBPkcMIIfjgCWU6UrOUybbDClXoSaImpKFjKSnJPwqjccIImqnH+zPnw5RqFrYKv8pySSftuaQSrxffo9hMypLPnFcskTVePWTVBC+5UORo+e8UH2LK7Co6e8ZZBlmt7jjXflPkzcnj/zQvA/bq3ZJeqrnEh1VmIrV6aibKbOjcL5ndtdcYqXzz8rZLOGjZmdN8islYyAFEzry1WGSzdAYQLA0AwlDfX+nFl21iDx4DcHD34g98M83MRrcZKB8zcExJoKkd6e/YR7rV3ElAC07DcI5r2jetjc7LkYi3jWKwk7JWIQpk0krYhyRTAxaUUyZpxqzH6YdJrWChRHh0/5HJTf//dEqzdNgVssm9E7w5R18AMlxxsqP59aEsX7N9vZwxAqOLnJ1v2ea90uUyq6imKdSOODBihgCw1EAV0sxu9de0KJYc3G+5Uzr/9zajDQ1mmsy4rrrEr8UIN9oJdhL3WMbsE8prjNIAlwNdB/wsIgBOhOu5MRP1T7ZENjKcg7/IaEk9drZQ+pt8cTyjzQFiPfJAbLdHQid3vXhUVipsisxpvfKFea3i8xDUstTy6N2NcsmHjfO4dD4BC5h5nvushL1FbEqLhOV0xX3iGV6IJE+54nhmCmURzYdLLj6O5JBIakjLUHGAziqKCG0iiw+Hbn0AkpIU/sjaIvEzHc12vOHBsnRYYgfoOLyfRbXqtDePItgoB+GpxQYoB+tUXIQWCE1QJRg1uFY=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(7416014)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gphL3X0vWm2+Z5eAvrqokeddJbNgQJQzhTjUANcCm9siOx57VEQQPzsLF0/ou7wAHPBY+gK330zrEu+41yMGSmuz5UDygaNU+suM9lIPWAM5mx1nZ7/rpNBBUZicm11EPiq7krAj3Ja1gnr2h9jLSuJjevGT8Na7ujZvimSBsdDOtP34T76Xcdf2HcvzKb5uEptwUzFO74qELedBzjAyVGhb26s55tdwoaQ4T2l5NroZgcTubfa3azumTa8w5pItI8RW9Hgevh81Xm1xQjyEVEsIznnQTHJHEn4TrxlIjm+RHaWMG34CtC3APBvwk3sxbbi2AXzBC4Z5lVN1+qaCQw9nEUmTYqbe/ZGSITqtipxetIWk82ddP8VE62C8/6xKqQvo8GX6YIqpXQIc5DAYvxhVbJtEAaIDM35DRdLHl2w+gEcegfY/HjETCOhgPWvP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 16:00:51.3826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 811e468e-b61f-44c1-3af3-08dec1894926
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5789

On 12:16-20260512, Nishanth Menon wrote:
> On 10:51-20260512, Brian Masney wrote:
> > Hi Nishanth,
> > > Could you clarify if I need to take it via my tree to arnd or if this
> > > patch will go via the clk tree?
> > 
> > Sorry, I'm not sure what Stephen prefers here. An argument could be made
> > for either approach. I would just go with whatever you have done in the
> > past.
> 
> Thanks Brian for the review.
> 
> This usually will go via Stephen. Will wait, just trying to make sure
> there is no change in expectations (given this patch missed a window).
> 

Stephen, I'd like to clarify: would you pick this patch up directly,
or would like me to send you a PR after collecting sci_clk patches? I am
OK with either, would prefer to not have wrong expectations.

I see two patches pending to be queued:
* this one
* https://lore.kernel.org/linux-arm-kernel/20260512110028.2999471-1-nm@ti.com/

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
