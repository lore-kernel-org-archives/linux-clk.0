Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023084.outbound.protection.outlook.com [52.101.127.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4417139185A;
	Tue, 23 Jun 2026 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782198494; cv=fail; b=mhVum4G4AXu5+Q/2sAHFdK0IT0CikoUp+qd0QFLeQYntizQWz4cJpte/m96QCmZ3EvaUpS1DVEPJFFXGMgjjWHPHu7syJiaUY2yi2CFLTpxuwmwBXWE9NTqQnvq5xz/R5hyY9IkhEehsD14/jm7fMp6QVSnq69XoLnnUsa+Cwhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782198494; c=relaxed/simple;
	bh=LSi/Y1PplLXncuUgkwLLhHeiSqRUsZxPukpfPyX5hJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZL3IlxN1i18OwAjkv2F/M+B/mTJp5r0clAYZmK7PUVZNpyYBjPMYWyzbeViXfPxv4g2bhSAtjU/84YCiIaBGpMK0iRVxX66zSaaOIjecbIB0XDrA6ufCEnPa1S1X74lTWTMqkYpvvWxA+krAcxVA3nmAwJ0yKT13BMn0PkyoRNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iM+SOfKWG9QXSOrXBM68vZo0pjxj5eNeUtkOqbCCd+iL5WxRmpxs8eGpnHX/vfZvdCLrVXsD9JjIsIf9k4GXev+ZQObB9wLZo9bueaDuAoLg8LghGFyZqah6ku/1MMXjkwFU1NhHpPY4Aszpnm0jpwWw6kFEpn/wkYMYv26ZWiriZlWNgx4CnR9DX8n/YiCeXbWXPxiuEzR6g1PS218snPnUjWfUs7KuVhgjuXiG/7kngJ5TpfBMd3QX/sC2Sd6k7naowNj5pFdX4COgWhETUQG/WwtmBBks76RSLRKv1yoAwCzHeC7YcrqWZYO/8lbovRTwPPBSLQap1WnD6qycvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAfrcbMrvI6q3Bn+oU3CfBZyBPs702WILdAGZFQm7Cg=;
 b=VOWo7hRXguHk7mX1iKLvaJEZnUl0/6l0M7tXGmhWn/NIxX/c32BzqpAUx3IyEDjAK42HBiJK+0vKwzQSnIUyQKXkXv8DQIVwumU/ULLX75EcqPjElNZS9v+oFCJBWywZO/vpshkBwbEJq1Syy186Y9UnbNmXpAvs9g6yI2G7huCknGEqmS277xrroSROeDumBo1edBrihaQwosozp/L4PELvZ1wgMuAgCbkdPQJlVLHuhqIzpLCoDUww0A2bEUdkR4T1zKqgL/XzYPxAO/7G/yrVQrYmwnBqlaNV0k0mhV/nFSCCvx6SPs1QfJa96RDTUzUW6w7YRPXvXsJ/qAX1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUZP153CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::9) by
 SEZPR06MB5521.apcprd06.prod.outlook.com (2603:1096:101:a5::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.13; Tue, 23 Jun 2026 07:08:10 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:301:c2:cafe::30) by PUZP153CA0003.outlook.office365.com
 (2603:1096:301:c2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.4 via Frontend Transport; Tue, 23
 Jun 2026 07:08:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 07:08:08 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 55F8440E7F93;
	Tue, 23 Jun 2026 15:08:07 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v6 0/4] Add Cix Sky1 AUDSS clock and reset support
Date: Tue, 23 Jun 2026 15:08:01 +0800
Message-ID: <20260623070805.211019-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|SEZPR06MB5521:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b37b307b-817e-465e-24a1-08ded0f62e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|7416014|1800799024|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	ZSGkg8oVmgBsBklITIxIAZL3MbkQvn2u6y1cZVfJgR7amaUe6RcxY30gC+2DfRb/Qa9wX7beiEUMtd59JJGNs/GDTpStYyWf2c/wvnvpDBxfv8PeMdildC5Fp6J2Fdd/ZwbJcQWZWNIZEmf/vP9vvUZajBvBJ9qP3LkFb8UcicLei6QXkdfYlP5I90s4lOKyRmS9UbdT55xA+bRajjRATFOfv2Tmri1374ucIdyEoCvDL/3WLud4ViGejtHgl0ErIOI6brlUQ6/vBF66VrSmX1vwZSLiuUFy5T8CMd0yfZ69joY+rFmsGTk8I9tVWWofALU9kym5Ndbvz3o8+hMKE8gWobYLetiqVMpWBPaeBUAty9GDsNg8VCQDWWVPlImnT2f4/fjLcG4lpzQ05+Q+EQls/3xEv09qTmr7xW0rzw33CSy+2Y8Kh3okjKX0BMy0rF/G2TcQ9gfJy/9acwa0OaqOGcB5sj7T/TGaZWdXyrq2b/xftyJoQ5q/7Ql5gKN126UEohcxiNVMP6IRgj2beVLy9IzN6bvltJNFqCn2yAD5d09M7jzCOcHl59xb6j/tLkhcUHF+EIpFTRAS4MfHxAs2cNPOZcuThq+3OpFzZk5uZ6tud2sMd2IT5ZD8YON09vZDG99zSj+9senr/xyUhJDdwFdbkajfsDkJAumt3TZH2N/lSFxeWi9OQcypNe3Rw7WzGYSYnjpBcU9rwjxJFQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(7416014)(1800799024)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D2/4XbvdE4fEGmxePe/JDxLOeJaz7DcontwV3rm5HxLx4tBjIm8ZmHBICFSQ/RbKXbSQJ9hgPq3YRSGcs5MdRqFfF77b5M4g4yNerUc8IYxr8TiyIh5kUNaCe6HRZeRXmWZY8H9c0Y/61CuVO8Y4hCP2DRTvr8U061BXrekyS7DEtysOhs9mDcHDsHHC7vlnTh9bpfFqBOVG9r+G7zzyms/buTW/Zc3Db4PonjtCIFWt3bvGXFGgb8ZNGny/tFPUZukPV1dTKEqnEi5m6tGg1u6EU4POJhsH8FV4Lg19nII83FovcYicLvvYwH+9GnQgKH4fCknELf3AejC7u6Bd/5uNWyzgvAQZymf/K4DnREsVDuwQg9ItbSi/6lUyn4PUC+cUwWHcoOsJ2yJ49/8PEuYCsDQeMuCVZ5Jy2i0UX/cmFoyND7W1s7TaPUZr6eUQ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 07:08:08.9059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b37b307b-817e-465e-24a1-08ded0f62e76
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5521

From: Joakim Zhang <joakim.zhang@cixtech.com>

The Cix Sky1 Audio Subsystem (AUDSS) groups audio-related blocks such as
HDA, I2S, DSP, DMA, mailboxes, watchdog and timer behind one Clock and
Reset Unit (CRU). The CRU is a single MMIO register block that provides
clock muxing, gating and block-level software reset lines for those
peripherals.

Clock and reset support are submitted in one series because they belong
to the same hardware block and share one devicetree node
(cix,sky1-audss-cru). The binding, clock indices and reset indices are
defined together; the clock driver maps the CRU and instantiates the
reset controller as an auxiliary driver on that node. Splitting clk and
reset across separate series would leave neither side self-contained: the
DTS node needs both providers, and the reset driver has no standalone
probe path without the clock driver.

---
ChangeLogs:
v5->v6:
  * rename dt-bindings headers to cix,sky1-audss-cru.h to match compatible
  * drop status = "okay" from audss_cru node in sky1.dtsi

v4->v5:
  * refactor the driver, using platform_driver for clk and auxiliary_driver
    for reset.

v3->v4:
  * move both power domain and resets into parset node (audss_cru)
  * remove "simple-mfd", and change to populate the child node
  * cix,sky1-audss.h -> cix,sky1-audss-clock.h

v2->v3:
  * clk part:
    * devm_reset_control_get()->devm_reset_control_get_exclusive()
    * assert noc reset from suspend
    * clock parents changes from 6 to 4, and rename the clock names,
      explain more about this: confirm with our designer, In fact,
      there are 6 clock sources going into the audio subsystem. audio_clk1
      and audio_clk3 are redundant in design and are not actually needed
      in practice, so they are not shown here.
    * refine clocks and clock-names property
    * add detailed description of clocks
    * drop parent node from clk binding
    * drop define AUDSS_MAX_CLKS
  * reset part:
    * rename reset signal macro, remove _N
    * drop SKY1_AUDSS_SW_RESET_NUM
    * switching to compatible-style of defining subnodes in parent schema

v1->v2:
  * remove audss_rst device node since it doesn't has resource, and
    move to reset-sky1.c driver.
  * remove hda related which would be sent after this patch set accepted
  * soc componnet is okay by default from dtsi
  * fix for audss clk driver:
    * remove "comment "Clock options for Cixtech audss:""
    * add select MFD_SYSCON
    * move lock and clk_data into struct sky1_audss_clks_priv
    * const char *name -> const char * const * name
    * remove CLK_GET_RATE_NOCACHE
    * divicer -> divider
    * Reverse Christmas tree order
    * return reg ? 1 : 0; -> return !!reg;
    * return ERR_CAST(hw); -> return hw;
    * of_device_get_match_data(dev) -> device_get_match_data()
    * add lock from runtime_suspend/resume
  * loop to more mailing lists

Joakim Zhang (4):
  dt-bindings: soc: cix: add sky1 audss cru controller
  clk: cix: add sky1 audss clock controller
  reset: cix: add sky1 audss auxiliary reset driver
  arm64: dts: cix: sky1: add audss cru

 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  |   92 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             |   18 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/cix/Kconfig                       |   16 +
 drivers/clk/cix/Makefile                      |    3 +
 drivers/clk/cix/clk-sky1-audss.c              | 1201 +++++++++++++++++
 drivers/reset/Kconfig                         |   14 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-sky1-audss.c              |  192 +++
 .../dt-bindings/clock/cix,sky1-audss-cru.h    |   60 +
 .../dt-bindings/reset/cix,sky1-audss-cru.h    |   25 +
 12 files changed, 1624 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c
 create mode 100644 drivers/reset/reset-sky1-audss.c
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-cru.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-cru.h

-- 
2.50.1

