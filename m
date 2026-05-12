Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012003.outbound.protection.outlook.com [40.107.209.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4AD38E8CE;
	Tue, 12 May 2026 10:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778582937; cv=fail; b=X2IXZ7TNSyELZlgvJYnH9BfXSuJkwDWW1gTMlHe1X69A45fiibEMym0Q2hFL8k9h83g1m08vlD1cpMYt/LtCfK7qL5PBejitSrIjkSkI3ddggFpXEQeh31eQLhqWQ+Xvr809UuFevUvqmiiNWNdzgXRTeJBY3Y/kaxECCacTosg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778582937; c=relaxed/simple;
	bh=/aM5HOkFnOUmLnztOX6TXRFl+VP8lJMUi/1krATF8fM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkKwAWC/kfwdqf8NtPUZ3+TxVlM2rwM3gUArheLpt5PdlG/XurhUuZOKJ4QVoRV22XBq00WHarIyVZ571ppSTBOVHxM9q6Avcwy2Cyq812PhiRFMrxyMsXaUT4KVcPl+jqMfECPbwN9WXj7ge5fDO17iGfL/mprQC37u/gRcak8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=l7hwQokE; arc=fail smtp.client-ip=40.107.209.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="l7hwQokE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcOOoJuowcYF1xSRuRqLLMkdpbr1X3SLABrdiJ4NZAtHSzW6fh8XWL/+sx1VWLwyFSBQnByrMBnGF7Nchch1MLpM5Afng+fKzz1gj+15UY3sOvEd32h0yvQWc1RV53W3Wjc678pD0FsFGc5me8P52ICdA8AWuk7/Zf9FTRDkSCEbzrxhDiedFVM1gSZkDeMeJR/TXIknjY3yBWWwT/N687iEiP42V/k1nsGbAfN6SgU25TvmL1mwIABsibkwnSNMhLxnd0Zbu40d2+djCyqX4pb56lNYqRUSZEDpFxK4c5mqcfNjoGaCRKs2xYwkFRf7WTaV0KS2NkKcJ4GfNcUepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWlcJ2jfSlSy4lXfY8bcEp9v+FLnNY1LWdjJ03R8AY4=;
 b=d8pbDSGJSzguXdJ7XJaVgkqAFH55LUl9fWteB3D/Plwec7B/OxTEQh+wX7GjgSDRqn7y+yb1IWPwME5QtyQWFVpOYiyK0Vmo4OgZil9NsHQbbhCOtpr0GfQ7BS+GZX7ucpf5fVATpdJtj0Y56i8Cx2/JgdTEq7QNLMeS8mwXA1CzSiYZdiqFbQQY1yZU9IK6R+Fsr0JZC9U9rSghd8cMn1U0z/+aaD/pQVM30u6KVGuT6F/yYLFQSylamHIDryNtyWRZXssOR4K6VlzZF3g1tVd/pQvYDKIlsMkSqK5pphyIIYBS2LTTTm3YZg+PF/jjxELRNpSRI5h1ia8DwOIcZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWlcJ2jfSlSy4lXfY8bcEp9v+FLnNY1LWdjJ03R8AY4=;
 b=l7hwQokEIQc1UcV7RQkiXib7OCkWm6DRniLEpbo5O2/vFcdEILYxySSM1JplU+suxMfpiYy5io51tkYtxT+QqEqAKBB+5xneLl0B3T5V6P2+SlzJbPsK85CW31FhnuwUsdG4UtWA81mM2WrbrW12ycZA/ZUmI8oC7rK8kkrYWD0=
Received: from PH1PEPF00013302.namprd07.prod.outlook.com (2603:10b6:518:1::11)
 by PH8PR10MB6551.namprd10.prod.outlook.com (2603:10b6:510:225::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Tue, 12 May
 2026 10:48:49 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2a01:111:f403:f910::1) by PH1PEPF00013302.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 10:48:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 10:48:49 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 05:48:49 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 05:48:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 05:48:48 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CAmmI01283642;
	Tue, 12 May 2026 05:48:48 -0500
Date: Tue, 12 May 2026 05:48:48 -0500
From: Nishanth Menon <nm@ti.com>
To: Brian Masney <bmasney@redhat.com>
CC: <a-christidis@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Michael Walle
	<mwalle@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Randolph Sapp
	<rs@ti.com>
Subject: Re: [PATCH v2] clk: keystone: don't cache clock rate
Message-ID: <20260512104848.4axgjeto6i7ejvli@retorted>
References: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
 <agHpYnkCgGfZp2-E@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <agHpYnkCgGfZp2-E@redhat.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|PH8PR10MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cfb56a9-e116-4db5-0cca-08deb0140cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|82310400026|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KpwDWA17OSro9ObU7nvsaJSmAvVOgZa7usiUHHbnNiFoQirInvvxnSf+2npgWKsAZXeOczNLDk0SMZ6ZT9mK8vM07bXXYy0WKP5SFkvzj+9lRFwDreJLp4M3XTC2gLJj2hwblpO4ksiOyntwC4qAaYwdLaUZcUw2DF3oaXaKHsYJdRbaV274/M1Kj2lii0mitYTGr1O4kBWNzsJs8hUE0GMSlGxJ2QeZTMtp5AcPevDgcDKy81bk+R7WTiK9qrdQ268dbjz8z+DqA9P30gcsnrPH17gJFNxiBBaEB+f66mjm1AZR2Cwy6nRH4fw5yDBHfiGXz4dcd046838ictXfF7hbUdMaCdk4P5PFko9td3nq62xDcbzuzTom28T/JlsvArdBvs/INRL1wr2mZCyCKxYx8biAe4jAEM55EiHz2UkecOI752hIqW94fwmoqhEU4DmQzTBFAQTgYRADRPlfZsG4anMxGWq0mFoRF78bR9EVGm9tsplFfqEPc9NxhLjObEPQcbKA9oHv0Kx2qkrmCDru/Y3mqi0BS77ji8mRy5M56AsEAtpLvsthG+nmv2fXU1epmQZ4fxa33gJwX630vqAWlojdRPKDvTP/G/fNmkSMr/HAhqMmXo9Gknh9TwNg1yq9kAgOmLMKOVU37kMwqSHZOjX4xzO+VPBrt1KX6KVtp55vLs3yLUnwgbuQUU0I9Zvp/lfUdonc1dlQWo2LYeXFNTAoK4H33II4K4iSXN8=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3YYQKtOn5ujAgmOzWRd0z0Czkha4IkoM+i6P2ZBFDDlTzdYesYMrWsher40sjt+nv3gwe4TnUVVFm1M2AngRZKxEgBqQ2JfC2HWsQbKuT+VJ8Qr757EFKT4pODcBdqzJvpmIgvXQZvdavS8cltqNzsKJD/bc4dKfSyMOgEpfnIoWiS0Yfg2+qS7P9K3pgdPLGPSlDyavqX3BxQZfGVMAXKdjjSXa4QkBqbRIqNjqCZdgeNePH+mO/bAC4Q0+rdk8e66Frtn5oc/2qnOBeNdT1iwTzVwBXY2uFrA7qLOMANPj99JQHoqp0aUU1W7H3nOYs5T/8Z/RBlxGBNbp1Mf3dK4h09r2LE2E4eRnE9OGH+m67o20s8xD9CvXavgqj7mpMWb81LCUoJrz/w96tZann18XxG8CrbpIFnyMvGtuM/iGv5i5VLg9PUgwqQwpcY4p
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:48:49.3868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfb56a9-e116-4db5-0cca-08deb0140cdc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6551

On 10:36-20260511, Brian Masney wrote:
> On Thu, May 07, 2026 at 11:09:34AM -0500, a-christidis@ti.com wrote:
> > From: Michael Walle <mwalle@kernel.org>
> > 
> > The TISCI firmware will return 0 if the clock or consumer is not
> > enabled although there is a stored value in the firmware. IOW a call to
> > set rate will work but at get rate will always return 0 if the clock is
> > disabled.
> > The clk framework will try to cache the clock rate when it's requested
> > by a consumer. If the clock or consumer is not enabled at that point,
> > the cached value is 0, which is wrong. Thus, disable the cache
> > altogether.
> > 
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> > Reviewed-by: Randolph Sapp <rs@ti.com>
> > Reviewed-by: Nishanth Menon <nm@ti.com>
> > Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> 

Brian,

Could you clarify if I need to take it via my tree to arnd or if this
patch will go via the clk tree?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
