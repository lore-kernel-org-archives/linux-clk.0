Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013039.outbound.protection.outlook.com [40.93.196.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C853EDE75;
	Tue, 26 May 2026 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796340; cv=fail; b=fduqlzVli7aIpav71AcgdsIJltwh2wYAz3/qu0x+76TCYGVr+jkFhh+521swu8sk9+pKO99mm4BhR7Yq3RgJsSIguPVbe33Da4coOrh8Ug4SEcOzine1Io+UH+ajmi7Tldi8ri2XATRTUxlaz1y78kPWeebarPpdIGdpg5xiunQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796340; c=relaxed/simple;
	bh=ggYwfge0nK+761axfNXJ3FjWZLyQ6YUYPNdIl3DKeaQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=npBArju8zb4K7eQxUOLg4feMZmqN479IGtLjxFRqZdzNZ9aZVxSs60F+7btMY5OAjJdbGxmYmDTIOejy/+LojWAFasDs2w7UOmMu/IKS++fpuXN016EGiyF7eKOo3k6GfI+weagPBB6OZUHm4f0yIYHQAEkRlhhdfeZb4q8rX+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pjWM2fFf; arc=fail smtp.client-ip=40.93.196.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pjWM2fFf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ToJc4Arwa/Sd5FO6Y9G3icd8Rcp+hhXhhTs2ZolJ7a12DE0C0laD66MGspNraNjGE/EhOXhFxPBjR18YmXzyr4Jj9FkC+HzN9ogYuhEcK0XCUaaw36H66L12YFcxVua0qJ9M6XGQRpWxu9sS2YWOC88lBQ2s0nVuSmnbi8WwkqEkF+Zky4NvVvl5wQUNM37ccCFUFpDMwMlBImTMeWnjFUi8mgzkLyMKjpiqL1MNSiUwPpDgnAqmmL2M4LCS1OXoCB0WkTbcxwX6/RHmYC+MhV4+TZi+v5FyTe4PCCK8bSQF8Fx2HvnPrkwr41n6RJYiaib8+t+3wo86yMKYHgDB2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2F6sf0/S81egmwvSWsSPKQ/FlZ5Tu4PPXjAwNhBijU=;
 b=Seg0xWqmIZ2Ecd/KJeMPx2fYjyb2YCPKj0A7jtgapxhu9xTC5QWHb7dxx3q15v/dkqRGNTCHp1WIZuW+Af6C33MUzvSOtLB2sOQtEXIEhl3ekpfogBOTvlxXZ29yGgvyS7phBFKjLPxPGfYe/yTbnLKjjXX24Fpq6TDbDzoEveUmbsgCZgkjH4ZWbZMusZeMuLJ2feb5W5LxneuaY7t112SANPOOv0Q6vXxV/O+JIY/LUGc4PzpyI0CnJJsNE4e6NrrinsKe+B/iqVtvVHXo23iuxY0L+fjsBpVJveZ4S+h6kdP9IA0p/zYrKVkXZkIMPxXXUGUDZNXVdWLDeh1Y6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2F6sf0/S81egmwvSWsSPKQ/FlZ5Tu4PPXjAwNhBijU=;
 b=pjWM2fFf3/vQoqU6cif/UdH7LuDmEF1XNtaUf5QC9e5taTZ+x315eLZueyckGHQrSYQwdedzdXFYfsMpkFNOtWodvzmwH++qreOASrn2SGdZwIMdWAfA6AmtAA4ClFgKhuTL0ZjCbRFXNK7Ell5z7KqQqe4YSFFegbTcMLVjeO8=
Received: from MN2PR06CA0007.namprd06.prod.outlook.com (2603:10b6:208:23d::12)
 by CYXPR10MB7899.namprd10.prod.outlook.com (2603:10b6:930:df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 11:52:08 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::6) by MN2PR06CA0007.outlook.office365.com
 (2603:10b6:208:23d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 11:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 11:52:07 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 06:52:07 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 06:52:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 26 May 2026 06:52:07 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64QBq7XT815577;
	Tue, 26 May 2026 06:52:07 -0500
From: Nishanth Menon <nm@ti.com>
To: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, "Thomas Richard (TI)"
	<thomas.richard@bootlin.com>
CC: Nishanth Menon <nm@ti.com>, Gregory CLEMENT <gregory.clement@bootlin.com>,
	<richard.genoud@bootlin.com>, Udit Kumar <u-kumar1@ti.com>, Abhash Kumar
	<a-kumar2@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, Kendall Willis
	<k-willis@ti.com>
Subject: Re: [PATCH v9 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode for Jacinto family
Date: Tue, 26 May 2026 06:52:06 -0500
Message-ID: <177979630821.2038855.1091375399579983370.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260519-ti-sci-jacinto-s2r-restore-irq-v9-0-c550a8ae0f31@bootlin.com>
References: <20260519-ti-sci-jacinto-s2r-restore-irq-v9-0-c550a8ae0f31@bootlin.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|CYXPR10MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0d6627-e105-4128-b1e2-08debb1d36c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	M+E3bdHz3OBlesat3OfLqenBxuG47cp3mPhqUTSF6g4BQzrRGy9z7Yd5vCTzeEmj8e5qROvWmljNhlo24UjGT31H47orXOBxO8Z3nJRlbVBKJg1l9r87Zk82/aHSr4rl69rG5daWXY+TPjwUJGMV4Hz/1iDj6wnfqOvGwZA1a60I9cUgUfl7Imoreg2zuBs3OJfG1N9mtGgHaSDTBVCyK1wNsUBUF9WHzr4hLNU+M2MmiMTxAx37PuCN5i3rPFJWrILfaeAdJnA60ippAOlbIzy+e9p38qmaAEUQE4isCOQvyicAozibO2SqEUZ/4JEBUlT2EACg9nKWnNeo4oCTFopIMmKhGMSDge1dsaKTVlstuFuOw30/uDCVOlYLrKXpQCGWNEgz2X6GbKeAsPRyWb3F9/7Jj1+B0lx2ZNdvVsQZz3w7NzeINa7jIM+ablKgUpKqg1cQBRlU7R3D00zrfXAwXLhrtS8via5vRZVD9bgnzYBxhpLkIhOby9eFvHkkMmmaZ+/xr7DmxynBaON3K2NGTbRuqSA/N3k0wv/iqJqg2UJzRwGIQoeiiGp/Qh5QIPigMpl+JZ4//uI5uBb9JhKb0+ckHda85VgK+lbXMx5h/4MAvkFz3GxFxPtdDzJtt/MrZN5o+ijfNz3jJeTDu5biXKz8DKvZgeX/o1lgve4qBQa1GL8KO20OuEJoHNsacaYNXMcw33HU9quWFEFefDmIDzCaHkKIeK/Qeb4FpIE=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b9fZqmeaFf1DFdoocU/zHB7XzkZJ/9Z1CVdriNCm2YLuGBchk8o0r/2/8m0h2tSJJ0UgedDvLF6exqQJM5FUvScptcF2VyTO7VFiXZXpG9n5vV18tlNsX6UB5PCg0Pkh5IFp7pQBlRNuPxWWj/2IfNb8ueoHQOLIHc+BYH2NXj/MprzvXRFekD+25GZIkGPD6NAYXDqqGKJ4NUg8irA2gfeKvXW18rVHC/oZVM/C710x5mY5ZhNSPYKQAh8cPapvhUAyuJ6GssmUXEG8Fd39WB7YMcJHK3G05Q1AjiQc+wfITtNS47+3NwB+VjWrbXXtgGmFgivibwL35KtySDze4CG6jY9l2G7jC4j6CKEqrb+wsPeMmgXma9o16R6RNg163/VjId2L8QaLFrVWTdSR/tD1wc0Z8ayBi71fB05Jhgz+SrlD8agD7g530MMa9XIU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 11:52:07.9049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0d6627-e105-4128-b1e2-08debb1d36c2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7899

Hi Thomas Richard (TI),

On Tue, 19 May 2026 17:06:55 +0200, Thomas Richard (TI) wrote:
> This is the 9th iteration of this series. The only change is that now the
> irq_lock mutex is used unconditionally in set_irq() and free_irq(). It
> makes the code easier, and prevents coccinelle warnings.
> 
> Best Regards,
> Thomas
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/4] firmware: ti_sci: add BOARDCFG_MANAGED mode support
      commit: e9f06763b9b88cb1338ef8a3f113b0fb94d714dd
[2/4] firmware: ti_sci: add support for restoring IRQs during resume
      commit: 703b341fdd875c2d9c30a835021689e5a430a39a
[3/4] clk: keystone: sci-clk: add restore_context() operation
      commit: 3c5912373340cb79db6585f0fcd8107198d4933d
[4/4] firmware: ti_sci: add support for restoring clock context during resume
      commit: dc51f820bd32415445655aa6e3af9011b9e3e0f3

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

