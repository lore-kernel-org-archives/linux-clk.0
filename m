Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011046.outbound.protection.outlook.com [52.101.62.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E28D3ACA7B;
	Thu,  4 Jun 2026 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780541998; cv=fail; b=IbN/bY/IrCJgmgQfHlmQWZZvzk0MBOuvAocaDxX0CsaOapMantraUH6tkYGj/Ssa0LfIVL2hTmQCBYVD1tjb0Tt19t9LSggX+khoVjMrvoWLGyT8Yloyha1jnswSNAn354WK3x2WSt523Mxc3pM3i6MWAfCPvTI9tQzioEcIMSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780541998; c=relaxed/simple;
	bh=RPNDXyC4u9Qi6uv9vsrZcVcJkSVUpbg14riRmAKHzkI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T1LURVr/VGK70WucfbFV9BEwFDsxFKKFRVvX6I0JZmNbzMU8pOX9D7scvYBxJFkQ+qNshgtPQGv37kKRvqrvp2swPf3A9+vL4POfgxRAW8IAK7JSYXekmbpfomTI/wgv3O6D/UUtSGP7O9tjtes9O/qrAdH2rV5zNQ9kZppVvCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iPZji8L7; arc=fail smtp.client-ip=52.101.62.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iPZji8L7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6v+1j9SCybp9J3k8YceyGljRd13c+B3RJFifB9mVIFbz2nCbfRKkPR0CijePxGto8gbrWj9m6hYBoHEt7oqXU7lbuq+/Mp/kO8jVcwK4C9TTmk2/qdFyD90LlJMgB0ra79AKuLEJc30h8GlTrJ9vNNGFW9h/4DUdlbcnmhX9lNRZJhTJe8VxDa65nnditP7EvefTb1fnIsY30n+wE8+UcetooFnzRJ0Tg2pzUDlJPURjzwrw8KoJHUTD8gIgwvAtN3pjDbyYfkGiDQJo271UJJoWRcvxO6osCiOj8LLY5kMap0gbiFmaKz3w974z0QTJXb5rGNcCY5yKcDRKSlerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNuYLe2xhnryTOJStniaJ/BdYj6YhTSCOwTct5r4Dgs=;
 b=EG4tWNhvOFzMlNI9SmS97Cg4YRFecrPd3ZusXONc0o3O98r1TVjqDDLPzqnSpS58eaaSEyUHxyWmWYfMiI9j/k6rotsh2TkQDPwDIouMrl/pmTHMWrUqHgKlWKmPf1mOW6PRot9a9xgg6M4KWMsr5miqEUl+O8dhS0Ei8EC85O/FK/Pd3yx0QSeWwp018CK5/9l0UuYwLbzXcI5oOTGL+EAyH/b68XjeNunx4rES9E1Yb30ojXNue4CP3/s4L8RaoSi/uqSrmbWAM5Se4jXNABGSMnS1Fy3tjBxbXJuDDh2JkaQn0MW5AYq98hGDFjQmNHuKB7Omu+WrMtQsIi4x2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNuYLe2xhnryTOJStniaJ/BdYj6YhTSCOwTct5r4Dgs=;
 b=iPZji8L7puOaY18Lh/FHTZI3+OwLFV+czZdIyh+MRVEhnSHFg3AWwhnq45Ym6jgM4387oUGfDw5Ns5bTIxL8bzZQdzm96qDDoJa1AsX+gX1Q/F7KgrXlMkVbcOF7w/QkTnJlyddDOuDSdrFojkYR2zlMFLh35+pgdBB2t/7xdE0=
Received: from BN9PR03CA0555.namprd03.prod.outlook.com (2603:10b6:408:138::20)
 by LV3PR10MB8177.namprd10.prod.outlook.com (2603:10b6:408:289::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 02:59:54 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:138:cafe::35) by BN9PR03CA0555.outlook.office365.com
 (2603:10b6:408:138::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Thu, 4
 Jun 2026 02:59:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Thu, 4 Jun 2026 02:59:52 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 21:59:31 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 21:59:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 21:59:31 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6542xVI42511473;
	Wed, 3 Jun 2026 21:59:31 -0500
From: Nishanth Menon <nm@ti.com>
To: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, <a-christidis@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Michael Walle
	<mwalle@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Randolph Sapp
	<rs@ti.com>
Subject: Re: [PATCH v2] clk: keystone: don't cache clock rate
Date: Wed, 3 Jun 2026 21:59:30 -0500
Message-ID: <178054194985.3283937.10940582422296013848.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
References: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|LV3PR10MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c35577f-a275-4308-e867-08dec1e559b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|376014|1800799024|82310400026|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GC5uongJ6rxLF9AEGkcFZTCqMSFFrqBGkD9xSOMHLVmzvYpxTtK/5iUme0OuH0KyDHd4BNvwBZ5wOScFcXIAgXahkd5f5Zsc3bzAEZZPzZVgILpJl/EWx1RKU9kK6xMaTuyPf8YHOGDlrbenYJt2eis7Gj9rL4Ba+0PlZFEbX9KzdIc1bUyjkrTKMSc9WN/gC3OICdVRq3OHpIM8sUqijN1eyA7/LhIGE/xR390V4o4PAOIDUl0rI/EzhESMaePc91WeFhKbrm6dYVe7LA6nGkC9SGdkNk0n4OiCqQvqo1Am+yZOsOmJmc0JjheEJYwhx6b27j0sZ+7NxLez5UZatJ4u1luv2SkHADvh3nI0s8+DLdifB9KNHKye5+uPb2Svl+IgT8BJdX8tbWVf1AUdiDfuKyoUaMus+S4jC1BSoVMfwBWQlP6XqvvqMZj9k7KtOk6HSl/DyU4oCzIK+deZBn4WqqY3lJFAwAMeFEB0jHXhCCvEJ6YMukIzYrsJgndgBW5QhLMY8h/PU5QJ/AOWWQBj7yd3Lvo4rcwfrfTPakcFuBbYODNXCFvacHmRT5fmEYpITUtN3UidvNdPoOtOXeDMXv4dq0p0pxtAFp+2nwImz2xKoS+NaPzDshp0/56gGopSeNp3sw4l0UxJnzTfduiM+OClu6rWF5/SQYxbXTeOipmTcfIf2Z5wL9/3418CE6d2w6uYGzmfvZenPtKjghTNbIo9u9p7eP7IhiZI/rw=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+XFnjOPN10H9R/Mq7LZcnJ5THFIm7TN6AhL08UZ77r9McPOV0ModRYZm6wHvbhl7OiU/alqy+OaKy6sG0Mvxb8jptqpzwdUtCDLxxk2lAL8A/sdQmaP56rmzh4Jzg6ymlLDEE9nkR/bg6l9i4vbBVe7dqEZY4Fz7Cgu2JWmltm0YnrEXDSd4fSL9UB3CGyzPLyKiJD1Lk65OeiswLWmHc+pBaF1f5RyHiS/KDo/F4ZyKVcHUMg2MQ7yabpjfnbd4+T67IEokaTbg3O09gxCH01aRRxWMy+hbSMVRgiyNBU9ARngqPNOQODW+XecTLpzUf6doOzoJwDFrkCu3FvBC2RRfPWLO60CTM4L8HmIMCYkyJMVbu7aSlKwOBuZu7EmmWxzOv9Ib3uy2o0lEBdm59cmtSRindJtTyt7TEu/kGme8dhHsm5U3NG2yozOzoQih
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:59:52.8368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c35577f-a275-4308-e867-08dec1e559b0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8177

Hi a-christidis@ti.com,

On Thu, 07 May 2026 11:09:34 -0500, a-christidis@ti.com wrote:
> The TISCI firmware will return 0 if the clock or consumer is not
> enabled although there is a stored value in the firmware. IOW a call to
> set rate will work but at get rate will always return 0 if the clock is
> disabled.
> The clk framework will try to cache the clock rate when it's requested
> by a consumer. If the clock or consumer is not enabled at that point,
> the cached value is 0, which is wrong. Thus, disable the cache
> altogether.
> 
> [...]

I have applied the following to branch ti-k3-sci-clk-next on [1].
Thank you!

[1/1] clk: keystone: don't cache clock rate
      commit: a80b32a140c8612bbaed27009c383d43304db6d5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

