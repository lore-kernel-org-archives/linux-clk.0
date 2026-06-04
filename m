Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012070.outbound.protection.outlook.com [40.93.195.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3713AC0D8;
	Thu,  4 Jun 2026 02:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780541994; cv=fail; b=kimsg+gYv/kWlcsXwY3/u+6RkQ6J3Z3srWu13LUr6qyPRtPag4UVpvDNmB7jw5gEOA9JehfhPapdKsah4d90/d+mQ2f7P5gwW/EZFm+FKZbWGMhvyhFJnDXlHZvcBGSHmqKLNlqcdA5H86xjokYyrN1NyoZuGj43ONFzEnanPk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780541994; c=relaxed/simple;
	bh=AZa4e5fZq5WPJF//m6L3wVdP7MZ8qu1ZOFvLf7Pg7nA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q9fNpLCT8WnFeDJDGC/7GSpSnHs/2dBG7WxW80yEvmaxPYfl3vERYU5qG70mlgu+z+nEP2ionRgcvlcshPp5taVecB7hp36n5L9OHk9AF80+AZqUWIR3J0El3plM3NQSteVy1oewW1XR4XafJvZ6n8Mb4U8lI7dXnjWsMKEqwUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=htPY2YJ7; arc=fail smtp.client-ip=40.93.195.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="htPY2YJ7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJlFVNPaL02C7Kipt1yokKqSCmurQBjkqH9pY5lrXvtdnb86WVxovA03ceKT3TgXfDVJ9xxou7BjyqbpBoDlJ2D2CmllWHmiMnHIzrccAp/Oo4l0X9HTjkYiy22/KEDTl+DIce/AL0UcfVbNjVtxrZoxsod3QbM26n6u8WDImAhQpTDd0Xr5yIF/c6Ds6p5VhTdEmqyeNYmNf1DaDLmeapOrGc0Ui4dpIcKc04Hs0clW4+Vw0f7ViMzu3UPJ5J9SxZMH3Pfqniqvwpl2VsIkDtnD4HvqwrZ19bECErgcX8f+Wpkbrkfji88vkMghqd34j/9nb8lRogwTM+YtKE4rTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkGdM0ZxnZ/jHt/jgs4+yDRqyX2IqJOxUtW4WiKgUc8=;
 b=Wa+PTrEOyuCj2Q8zrg91uOMlXtxCPqyfkphjSQEk/fxR/BelbAlKqjMk5R3mm08xFZoVeXYBqWVCIPdjpZ8GdkO8KUOVSS95ctT2DMz9/41WfVwr6xbyAq4F8KGXWwnmjSmJxZpZsWqjsHjZ3+giz/dN09ZPvAXERAYEKK3iCs2eyPIYAEs2JkhDG206j1TpGOrm/bw9Wchy+Bnoqn7hfP5gjQEO5UnHxqB1mHb/lMJ7c/8sRU1NRc/CfEYvcsgAn53URbso0PiGNP1OC449BOjYFWL1R+GLZ2Loevckb11wPkaIE5DARLDflCHjja6a8Y6VPNmm3oKlsHoY75wTyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkGdM0ZxnZ/jHt/jgs4+yDRqyX2IqJOxUtW4WiKgUc8=;
 b=htPY2YJ7uH8zRomQS6JSUBGvtWjT0qPHeyE6DQpQaxhmF9SVy7KZ7nyiO/TxyGJOsqW99vgnQkG1+6thqdZFDNdHXIscY4rTPQEGspDzz6hy/A1jF/nRIsEXkIqDQtSwjCL1ivNknPBAjxF35Y3Q1JTy8OFGwL/oPi2DIhEPcMM=
Received: from SA1P222CA0086.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::27)
 by PH7PR10MB6529.namprd10.prod.outlook.com (2603:10b6:510:200::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 02:59:49 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:35e:cafe::4f) by SA1P222CA0086.outlook.office365.com
 (2603:10b6:806:35e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 02:59:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 02:59:49 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 21:59:48 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 21:59:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 21:59:47 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6542xlQt2511727;
	Wed, 3 Jun 2026 21:59:47 -0500
From: Nishanth Menon <nm@ti.com>
To: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>
CC: Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <kristo@kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <afd@ti.com>, <sozdayvek@gmail.com>,
	Jing Yangyang <jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
	kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>,
	David Yang <davidcomponentone@gmail.com>
Subject: Re: [PATCH V2] clk: keystone: sci-clk: fix application of sizeof to pointer
Date: Wed, 3 Jun 2026 21:59:46 -0500
Message-ID: <178054198138.3284805.13246866960992297195.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260512110028.2999471-1-nm@ti.com>
References: <20260512110028.2999471-1-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|PH7PR10MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: fc1e7ea4-cb50-440d-fdc8-08dec1e5579c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	TVwPjJVM/qT1TXbpVVjybvsI1/ws/Ppcvvml/9+otb6oYomDXA3pqw7fRfaGFMhrDMMsf+VIKRBlLsdptDZufnOcgRYRfLstyas7khEkZ/2DdiudrHvMjzRqRf/XdYDeaAdhQfCMFkwiQGHop9B7SOJ98fuhEG4TnTFUkcVol+sQl/ht0TyRvZXOCuoY7Dg87P6iDS+zfgDrKl/SZ6P3wRvEhhAA4yWvB0Ni6breJn1FiQn4GUR0Dc5EGlZR1yuVT+k8XscimJirNcvbI5q4LejGO+Rvfk4XbLMGqtVbD/B240I5507XCEoFsw7DUDXB2lp8kiNxj2H65lF1rRT51d+b0F5T3BFkjchWvNrrvGM3w21xLWqokViVSrglmB0A1+XaP9+SBY2CiyJVJplkXCBWHau0vnwE5VnpAQma9Jel4nGvtYtlBwiGQAkXbee6rPFs+nZYwnMZ6Hb/5UlzuYzB5hrF/x50p6dkIBkP8OQyRuz0nmx7/NgEPyiwmR/32aZUUbUiwoUdvSQGwtoIHJG4jWgs1zKNudMBjpF+X4d2obdlfkjjA0nT9IqmTsEzgvSFgiQ/QIoK/bF5nwsXYYtcr1fAR3AaAkywUcyH1/pgCEqfvRMYnL9z61V/+MrVzFu/XpXAVeC9VmC3UY07XKSTVklrsLGTfJ3xODtgJSN/xXABlOyFFDObtyiF6VVVm+kSNRFgyb67geC/IalLWyTRMt6eNV1YEOoPkHPci0k=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WaaDVZfpVvFSqKHJOt/e2MRx65yPOOG0muGUdjUn+Cr4fgfi/5sS2Q/cHERZAifNvjNHdOczWIr+3htEcDFdJrmS4xjNQv+uS3OK89eWtRlBDmDJdU6QJlFNgBAeEmnf1fVNU8krWLFrkoZy1ReTgYWXnQF4D2Um89rjQQR9YooJydle9/5lyZXf9E05JSz8dazfHGIbbwprcgD0hTmaX6d9Z097LEP2FqHVDnfMTvawlqmT7c8h2RbDXJCNwy0GP/waIF7nPjnupe52JJhqOf6UepSCDoWXkMQar0mpoXsISstgYDYWHSB4ZNAJbInrvrq3WWlQaOyYR2IWfXw9r7XbofcpQ21p1I+gN30sjN6NV8JxeM8zA+jU/aw64cs5bj8QVBHJa3BW9ceMbr8H4bwgMFAiAq0d1NqgnxWZwLUQVo6W08SzOD7QUIfiYgUz
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:59:49.4060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1e7ea4-cb50-440d-fdc8-08dec1e5579c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6529

Hi Nishanth Menon,

On Tue, 12 May 2026 06:00:28 -0500, Nishanth Menon wrote:
> Coccinelle (scripts/coccinelle/misc/noderef.cocci) reports:
> 
>   drivers/clk/keystone/sci-clk.c:391:8-14: ERROR: application of
>   sizeof to pointer
> 
> In sci_clk_get(), 'clk' is declared as 'struct sci_clk **', so
> sizeof(clk) is sizeof(struct sci_clk **) which is the size of a
> pointer rather than the size of an array element. provider->clocks
> is an array of 'struct sci_clk *', so the canonical size argument
> to bsearch() is sizeof(*clk) (i.e. sizeof(struct sci_clk *)).
> 
> [...]

I have applied the following to branch ti-k3-sci-clk-next on [1].
Thank you!

[1/1] clk: keystone: sci-clk: fix application of sizeof to pointer
      commit: 2b0123e4a9257fa2933d13d1bca9ac36467efac1

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

