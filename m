Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA552D9EED;
	Fri,  8 May 2026 17:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778260080; cv=fail; b=DvFw2W6O5v0AHNKDk4I66QJgvAtGx7+VbMa8mM2cxoi4X3NfhPI5aUSokvBrqrn0SOD7cPfGDxsNi3vg2D47gic4q1wTVwh66XwDeaL7QvL5ew4leeUdYmioKwGvtSn5I6Z5DlqIWnD34hGVn780OrgNT5VeLX19iRQbfkqEPMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778260080; c=relaxed/simple;
	bh=s/tiZbVjqAZ/QvgDRVWyMv9dfN4ARsTAB0TunsIH8kY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRgM2i+eMroBoJmpv0/ifOvTG6Hxtb0Kogkmn2EXA56GVqWfMox2WsJ7ScqWakAc0NwHh2TyCLpFrx9BrKCJfBb0CkM7hWvwETYeFOfta3vLNN/ritfzAeLQFnlm8m7aPsCPWUZ+wUGC+cE1msLp5zEVsm1dG8x80hU6bLpQrLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=We/QBqpI; arc=fail smtp.client-ip=40.107.209.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="We/QBqpI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGlltZ1QUKoXB205WDhss/zwfR/K69ge4iDOnYuzqMw+EtV9AdF9J7yc6/022t5RHgdAon8V/1gmtbBM4bDxZZ0lk9cwe3qrgRwmsgh92kO3RuWQMX2nrYlCwLHAC5WhLOShZs7m4VHHVsdANSMplDkGJ7NEprhVu47l8ljpCk9osUbDnMAp1wRQOINPZ6egseZhweEuZ0kHoCmUB2r1uZ6I7RCBwHOtMNs1SkOAkuAmijoB7YjSeJGJiWGnMuV8w1EnoosIPiU85YmwyqtG9QDhmlewUX/rsgZKcD6qR2EMz+TNYkJ85ZHqvKE3gyjkba+6EgHF9dxW7ODcr0GbwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFW53CjZNduCy0Q+hc3yAmFJBHYv3Pp7ej1eBLfdZoE=;
 b=SYZzq3MfF/wMLCyv20a6hLidIv8kX/zozH6o87e6bIWCanEd7INOeYpa00ROYdNokVP7xiDWuyIlH099smYK03LrIQ4erqFjTN1/1V17+jjjL5FnVOulO3Q+7iF1Cwzoe2tpkEck4uJegcBGD6wK7fWpfNwjkH/yTaW+NVVODVKu46dZdJTGVPEq/Cu0cEigUb2zq5HhquVIwEOiNb4IgJJhfV7SC7Tk2K0mgZMwkodiItbmYOej67pNtv/YdBp9+z2Tp4yV9ULuJTuD+MDeaj91U68Rw6oNExcm/tWt7zuUY77XNAS1VpokydWdAe7UcpwnR8E+45S4MFiOpQawow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=208suo.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFW53CjZNduCy0Q+hc3yAmFJBHYv3Pp7ej1eBLfdZoE=;
 b=We/QBqpImQ/j3CtvRJ1QGbrU+IDT8P82PL/YC730bM2dQRrRmRpbiO4JvoEbvHOWr2in6q2g6p+hf5efdsnMLHskc/X4shde6JWM1UIiICmV09V2jAN77k5WUNaIx4G9l7lWB/8ai303yFuXrNUePJwd6xH0wALWwM/7QOtYY7E=
Received: from DS7PR03CA0038.namprd03.prod.outlook.com (2603:10b6:5:3b5::13)
 by BN0PR10MB4966.namprd10.prod.outlook.com (2603:10b6:408:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 17:07:55 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::a1) by DS7PR03CA0038.outlook.office365.com
 (2603:10b6:5:3b5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Fri,
 8 May 2026 17:07:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 17:07:54 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 12:07:51 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 12:07:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 12:07:51 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648H7p501807045;
	Fri, 8 May 2026 12:07:51 -0500
Date: Fri, 8 May 2026 12:07:51 -0500
From: Nishanth Menon <nm@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Santosh Shilimkar
	<ssantosh@kernel.org>, Tero Kristo <kristo@kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Jing Yangyang
	<jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>, kernel test robot
	<lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>, David Yang
	<davidcomponentone@gmail.com>, Jing Yangyang <cgel.zte@gmail.com>, Ran Sun
	<sunran001@208suo.com>
Subject: Re: [PATCH] clk: keystone: sci-clk: fix application of sizeof to
 pointer
Message-ID: <20260508170751.3kfpuuoivad6lsjy@prominent>
References: <20260508152321.3683799-1-nm@ti.com>
 <003e3057-971b-4b6b-8645-787d76de2387@ti.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <003e3057-971b-4b6b-8645-787d76de2387@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|BN0PR10MB4966:EE_
X-MS-Office365-Filtering-Correlation-Id: e96997db-7d90-4ff2-226d-08dead245849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|22122799003|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	K+6ne4Onn/p5p/EbPzNPW1u9N+GatI/+3TqCswmXgCdAO43AIuUL53vEmcJkWAWbADQd67EaZcb0Is9R/tjoFSdknpxwO1a8sQeM3nMqKLbCkHSfrhEz1V7xzRHJHFJTK99+K6HfEwEzcDMDtrrlDDzOXtuQWqCQJX5gi71fNTTd/ysu+koRuuhrPsDQ2wASfnKfhSai8x1Rwy/sZ8bSEdLMIfQg3Rueljne6ntb/HVFcBmtyfIUDCeeH2Mr5TfBx37NZNyaYiqtyFRFCq7qmjVRpL5hcOpwjhL8pEWgxcCnMjoxDYPgntetJn4I8cJKfgFuJPrUNuLDOfmep1wacE8SniCim3tZ7zTDJwbW1t1Bi07rFxp84yfm4CJQ0MiyfobEpXgr5JKKgc80Pfvb7CNScJgnteFg9R59ZliQs5i+NmW0T/BbbWEq3tkIbswIhzrnVLEM7zdYAempwyzmVa22AgJbSmQ2J3iE4ReocoK4BcMpNX0DfVKPcdZmVaLePXxGIMAP9AAc+kIde4I8pbtn2PZXfUvDTV2Znh8IIXKAFS4pB+0JAa9iVJIT2Xrv+vFiQ3UVWGR+Pxm8fXdm1Ao0xigkflJYT7FxPPIXb3ET6e0H4u4U96XmZU44or55sLGhfzIqaFOwglb531pEsFY8ohl1NkNEIX7/ERafgYUZgn066IEMwesf7nTDu5YO
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(22122799003)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8pTZfnICYAueE3+6n2j6MbsgYHHIbf/yCIHPRYOpI4UQ4uZLDBP6Xae7UMzcNKrAf7wXfV9FV1gHFVhSJeQNxLbhvwvlhccFVkpmO8LYRJGCwDSBbp28uFU6r5msnknrHCdmVCEIHQIHLUI8Gutp15tfktzOJ6mTcuYUFBAJZIADwvLa9Uze1U50BeVGsmvcFWre8wVnzq6/9Zn3Dx7OTJ7/w+8Mi3q4T439+OMzRbu/XDOvlsRbRtNLWWVGDh+uDcpDBYnYHN6hDs+d1KjnJvTI1yIbMZ5RWmC5y5Aa3/Px9li28l+wl50PVzTUt0B2PKM3uhC6C7baPcNc2Vp16w1rPKko0IpvlQcx7y8+7W8qFUoh7SW2v3XKXVoXqp49vrRb3SFWtOrZ6shPOc7svFVPxmt77bH0EjERzYtxWQSazYh39U4RhkoLGho3pMd0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 17:07:54.3771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e96997db-7d90-4ff2-226d-08dead245849
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4966

On 11:59-20260508, Andrew Davis wrote:

[...]
> >   - Functionality: No impact (on Linux architectures), thus no Fixes/Stable tag.
> 
> Not sure what "on Linux architectures" means here, this should be true for any
> sane system, right? You are going from the sizeof(pointer-to-pointer) to the
> sizeof(pointer), both should be equal. This is just to be more technically

Yep (also why i put it in diffstat notes ;) ) - any sane system
(which is what we support in Linux ;) ) - though C standard does'nt
explicitly call that out from what I could gather, it is practically
what all systems tend to do. i had the extreme paranoia about this
and got claude[1] to check it out using clang.. Results match the
expectation.

> correct and silence a Coccinelle warning. Anyway,

Yep, That is all this is.. patches keep popping up every few years.

> 
> Reviewed-by: Andrew Davis <afd@ti.com>
> 

Thanks.
[1] https://gist.githubusercontent.com/nmenon/afa9ac915e189334f048c177f16fe54f/raw/ccd08843ff7193090f9fbdca3f5c76d0a4366c85/quick%2520check%2520with%2520clang

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
