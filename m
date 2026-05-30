Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023098.outbound.protection.outlook.com [40.107.44.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E906C318B85;
	Sat, 30 May 2026 02:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780107415; cv=fail; b=OiQesa7LvdNAjzG1lZRmJ8Ywl65yTm4c+zs6rnIzqcYzaa59O6b58AgVFnWsZz3dQxYA+YpzElvGso4fFMiTopgn+GiqpTnh1G9Fcyf4c9nZnoIM08hZPMvkyabYFbNZCP8AhvMNwHx7VWKKlxipTBdzvmnlBk8ugaZ4P3vZEZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780107415; c=relaxed/simple;
	bh=DNhW6r9Fr0NqxEfUWy2RLlBDDlH1pgc2dTKQMDbgQZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qPMePKTITqvxsCtfd1gYydHLtq9T8FDVBzUOMa62Tw+rTxueQsc08mZP44wug4zADCJc2KEr+wF2uBTuo/uqhI4Mg63EwLG79h6zWpG0q2PEAm3BdxUvi4is/WEIprhPlBsXgFd0FnskQJwFpwVxne71T9jn+w0cMeZP/lK7Kkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oszo8WyiN1PvKDB0aXtdvM8EZKu7GcDxsvhRzYTUm25E76WFqY4R0R08MLGSMXzG+vsBOAyTugmQWp0svMNHd0V3F1irb9bdrpWe+zmyC9Ioeb5LqVdLdL1WAjm6LN6Fs1hPDY4Y1PzYdGvRVHL0O+/UI5p30cu1YUD5KHEXoTa+A4GTu4N2FulO8zX3gagLc025hq80AUxyUPDg44BI/NVSlVx0MtMXQRozwjOL/0gy+np3qUvIyOOOLZ48lsn/eJtpJNU189JY/KikEmN8JG7RPJRHbbT9cfXWIS014+DmkLgD8lzHGOsUh3QmebKtxdMbiyd4EFhuLY1TmyAJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2G8W66/bqE2R7HYhZwGjmkdKd/23cDNeNaP9YJAdOQ=;
 b=m7obg2+AQgnZP/NEPngGoAKzTtVS5zci2br8IDKaqVIPMhcW/kAT2UPzwrle/+qiGBiBVy1stJCATCuwAxKR8KR56s3pvpA1FP2Jbewiq0SqdxoLDivicyAq6ScGTkURzf0vsffyORsAaZV7AH5bqFac5Is/ndfYEc4bb5rcxHi9suwu70uRcIWk0WwzVGwbf12Kq1y6+lBPJDIBT4rYLZ+RmhMQF0JgPjp0YIu3N2o0Ib5y69iZvUa8GiC+bCDKcc8RNl8l2q/5eM6GXikK0sod7rU720ap0V7gDiIX7PegOAiy09oiy1tBGSXtmpyKSD2ncQxAAeDUMfU2TiOS6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0080.apcprd02.prod.outlook.com (2603:1096:300:5c::20)
 by TYUPR06MB6175.apcprd06.prod.outlook.com (2603:1096:400:35f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 02:16:49 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:300:5c:cafe::19) by PS2PR02CA0080.outlook.office365.com
 (2603:1096:300:5c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.15 via Frontend Transport; Sat, 30
 May 2026 02:16:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Sat, 30 May 2026 02:16:48 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E2A824084269;
	Sat, 30 May 2026 10:16:46 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v1 0/7] Add Cix Sky1 AUDSS clock and reset support
Date: Sat, 30 May 2026 10:16:35 +0800
Message-ID: <20260530021642.64059-1-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|TYUPR06MB6175:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d1d332eb-b64c-403a-c628-08debdf1818c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Lb8+hp4ubBPzbT1LaDZrtW3XL2apEgmhCpdMLhNelMAI30UQP1IlKTcZ875QWa5SSAaiqI91xEMCp5OdQAcJNnIo/jrViHLvFLB6vz4rjn978nQqY73I2CrrVm+neRyvwhWgohVfrLhShYIrI/b1Y4/IF436UV4fAZoOg2LvnoeENXt3sVNdZqOoF+kYUfqAz36bOpKex+gjV1mntCShQ0zWIDzDZvQNOv8I+XcaDSUw1I41A7e2ZKxobJOBF7ZntSGOjY2JbVgn299KtmYbuhQIxN9wex4nqt1pP1h8JHn0frMfem7mLDyp2LyVkRJivybvwBeiNEsbrdc+FM0IGwcIjuFL1zGWg4go9kQJzMM+GJxtgbzKDntV3LfEsXcz9jJBqFR00wI53eqwI9yVyKZIZoOmt34z4Y3TRai/mpcGpC0YXs3XhiONEAWOFbpNgEJEk4r7AFYizjf1RbgSaPp6/da4U+3eDX9/C87QWqyxZZNf/A8JzdFS2XL5TrkHeNahSneM+qUDOayi2W0W3eKcY5iwVKBA/elBsFcoY3GrysE9w5CmkNQEzG9qmK8nERdUewoXbpNz6fx6mviCK0Fik2fqv5U5Or4phIO4akk0zpUcCA8KkJuO/o3cKPyFSM3uCj+Pg6ixTnV54bCII7ETUOe+dijmafg9WBWFPdJU9SJM0JxqA3vzUCza+WIxD0EIg/vkfBAR2+NZwVuRSFTZl9+UHcS+RHmSkYfCcZ4=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R/pro7nu9kiMD2x1kOEyc8zZCgAAc8ideCFtkoLZN4RINGlDH07/ZDbwGV+Xi7OVfsk8YmTdm9d0I3iWDWgxepW0LfVOm0CU32b4ObFE0ZhUcV3sMKNTIoCciqcp5REx3XhLj/SdBi0/mXc7kvgqLTya6R7pHiJzzyknmaHPicsaOow4wwmZ0tDnmYeZ74NGbOe8JtCD/JQMi6wXPmyNxmlEVa0/MTF8Qsn9ulz7kIjgzNnR6ne4Bob4GwdZ6dBSLrKfl1qg7Oog96hySA/jnxlPzcyOuuF9Ih+YlZUz6SBR2hMJnD8M+dIZlDLNk7tHh9kmw4uhEUwhortnEyeopI6CP0McYz4GHA2eDL4tnapj2w1fEKsFllQ153jnHICf/2gjL0FHtA5IiNbJ3J52lMkup7uCBhpeL+cDic+GKJXwkcgr6Htw75MxU93q5Qdn
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 02:16:48.8868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d332eb-b64c-403a-c628-08debdf1818c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6175

From: Joakim Zhang <joakim.zhang@cixtech.com>

This series adds devicetree bindings, clock/reset drivers, and board
description for the Cix Sky1 Audio Subsystem (AUDSS).

The AUDSS groups audio-related peripherals (HDA, I2S, DSP-related clocks,
DMA, mailboxes, watchdog, timer, etc.) behind a single Clock and Reset Unit
(CRU) register block. Board software obtains the CRU MMIO range through a
cix,sky1-audss-cru syscon/MFD parent; clock mux/divider/gate and software
reset control are implemented as child providers that share the parent
regmap.

* Patch 1 describes the CRU parent (cix,sky1-audss-cru) and how clock and
  reset child nodes hang off it.
* Patches 2-3 add the AUDSS clock binding, clock IDs, and the
  cix,sky1-audss-clock driver.
* Patches 4-5 add the AUDSS reset binding, reset IDs, and the
  cix,sky1-audss-reset driver.
* Patch 6 extends the existing cix,sky1-ipbloq-hda binding so boards can
  supply a reserved memory-region for HDA DMA buffers.
* Patch 7 wires the AUDSS nodes into sky1.dtsi and enables clock, reset, and
  HDA on the Radxa Orion O6 reference board.

Joakim Zhang (7):
  dt-bindings: soc: cix,sky1-audss-cru: add audss cru system controller
  dt-bindings: clock: cix,sky1-audss-clock: add audss clock controller
  clk: cix: add sky1 audss clock controller
  dt-bindings: reset: cix,sky1-audss-reset: add aduss reset controller
  reset: cix: add sky1 audss reset controller
  dt-bindings: sound: cix,sky1-ipbloq-hda: add hda dma memory-region
  arm64: dts: cix: sky1: add audss device nodes

 .../bindings/clock/cix,sky1-audss-clock.yaml  |   86 ++
 .../bindings/reset/cix,sky1-audss-reset.yaml  |   50 +
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  |   72 ++
 .../bindings/sound/cix,sky1-ipbloq-hda.yaml   |    6 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |   34 +
 arch/arm64/boot/dts/cix/sky1.dtsi             |   56 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/cix/Kconfig                       |   17 +
 drivers/clk/cix/Makefile                      |    3 +
 drivers/clk/cix/clk-sky1-audss.c              | 1123 +++++++++++++++++
 drivers/reset/Kconfig                         |   10 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-sky1-audss.c              |  172 +++
 include/dt-bindings/clock/sky1-audss.h        |   64 +
 include/dt-bindings/reset/sky1-reset-audss.h  |   29 +
 16 files changed, 1725 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/cix,sky1-audss-reset.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c
 create mode 100644 drivers/reset/reset-sky1-audss.c
 create mode 100644 include/dt-bindings/clock/sky1-audss.h
 create mode 100644 include/dt-bindings/reset/sky1-reset-audss.h

-- 
2.50.1

