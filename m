Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023078.outbound.protection.outlook.com [40.107.44.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D563ADBA7;
	Mon, 20 Jul 2026 05:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784524519; cv=fail; b=tlZMPuyzfh9kvc/vGLY4/7dnmyPx+J9iJvy5tIklhvy08BXEspRmUDMGmWoCmrthT1YeXk7bXQTPj/FSHY9ObWZNsQZhm/7bhwdnPbKtrcw5wtNI/M0Qpznay9q0Ql78DFI2cFe2bq+Ub+L3fh51GVcarxSIbYtvkc9Bop3oeIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784524519; c=relaxed/simple;
	bh=Ht/xWr4DrYQGF5vy7ncW8Fny0tAtu4alk5A4bNkcP+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RDNYZUFvxeNhMcRTVYweGCD6PY1LxjciiN/caJqSdY8E+jfj2Xioe3Wm/DpVtNgov0jQX3WkiTk2XwcJm9gdoag+igjzq9xD1fmBrI/iuQCaMJtEJSe/CkLBL+aZIuvNM8LvPJDg2H+J7Ia3XFqEuilDCymnTfr+ZOySHcSkWqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/iuk0wrM5ttrH+B+jlWEiGZuaZJUEj2g1XlQXKmHDo1PzYhX6bKyCbK2p1V5yaTUqCFKZ6Lgs3ANaGdW5O+2KvlMK6gSG5HJ6L2irvzLrS1U3rZ47zMjRyoEpd3AynsWv1hQ4+cWbsDpt1LXyjIp82WEUU6MVyO5XOgkezV0WCg+Jxnyk5OqqRPD9SMLTmWcLZA62TVzrBu3WNNYuNefUgSkmK4qr3Fkg5tpa1LKMMCT3VM+kaJM7vKUMaUK1sjGXrT8xeuAQfO2IOlHKgrUbl/N58zp+D/JGJH663w6Y/VDhO5Sikf7lgRcNJxjVbjqXpEEpHdg2mDTAqbLOziGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feZjTmOflGFytY0QZIVUk0bVAVrwjg0NyzXEBDC5yh8=;
 b=GKZrIb6oUAz85Nmzk0X4dKkA3jJuc7gYvNYicLF0awGbpJOQwRreuy+t5DaCYbfZwMAgZn2K/5HZLmPS3yS/lXxD9R2A5cW37GvI2g7ckiYSL82dsFXKqCBIzfXF8pXh3q0uh1Ziz17Ky+zwPiJLDbJpg43ojpEp2Mo1h0yQJ0rCdXwb+5h3UoOosnSQozOlx7N0iOwnXbSOdB6aR3BWoAR4m/W1jwbNgt799JL0soZn0WoPzbUXruOxjC7cbh/5oX4kaJrBaKF/lAB778wKD7AstGC7FH1ftwxCQr78d6W4N2WTF5xsPeTuT1fVCcckTXpR5moXYN/lEvgWwZrNRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096::15) by
 KUYPR06MB8916.apcprd06.prod.outlook.com (2603:1096:d10:97::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.11; Mon, 20 Jul 2026 05:15:10 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096::cafe:0:0:b3) by SG2P153CA0005.outlook.office365.com
 (2603:1096::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.3 via Frontend Transport; Mon, 20
 Jul 2026 05:15:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Mon, 20 Jul 2026 05:15:09 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2F58C427CEE0;
	Mon, 20 Jul 2026 13:15:08 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v10 0/4] Add Cix Sky1 AUDSS clock and reset support
Date: Mon, 20 Jul 2026 13:15:01 +0800
Message-ID: <20260720051505.1252774-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|KUYPR06MB8916:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 57b78c67-f474-4df0-1e7f-08dee61dde95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|7416014|376014|56012099006|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	B6RtK+36cxdeNocULzVMFstomksez3ge7L3F7G3vSXq8yxAxbdyfN/he2dU+smYUReVQ+ifbOvDHLzUTt6LJcoeZEXIb5ufiVn1UYerB/BeAzUg0z96ysf98J/b5qDEgd5JKgVrUr3o6RPUcJoUw8YBvDQMrJ5ZivrSLhLjBOS3VX1gimzYyAep2QCcdq0j36XpktJp3sDQHf4FVze6UHUIzUU98+iQjMXxP65GDJDa/VCCFtdRNmt+/ouLXxCJSrZVhj66ywptMswm35aHKNltrh9quIiKz0tKT09vYFE0p9j5RyeRayBJqZl4xknBsq11doilVJMI1HixZ8hhbXprE+4lYNRNH+4R0IYu7l1gaoy5d5kxxXMafAFbumL+b2MorwRc3TuQLt2qb2NWGAsCzY7yVy6TBQ7DkcGML/VanNegI3B/kFlo3dq+8H6jGMz+613kIlceAx69pukrXK/C29Hiqa9u9ddLxHIl9st0MoQ+unyj/I98pt4GmJPIc7VMfyezSFP3XTamFy2qLfeU/C1t819jGwt6/+t2VCOuuxzRjoDpRsFakO+pzEpEARVFFy2+Y/DfI2W+sC6Tt4CEwlL/DfOUrGFik1p/3CAnivXdKHKRr0somqgAatekMhYIjfdyfxtc1pE9QplO9IQ0NhJW0EP5v/MQr6gGW+8VFcyeMdwvx80oR1voJwbtlPcCHam2IiULhlVooSa/s1g==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(7416014)(376014)(56012099006)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YR/SpfQx/kzeJnKCK+Vo5Zt0VT+SbuPETw8NO3ZcWwei0SJdzDRs5hwZinqv/mw5ZYLnhVFRosT76FR7OiL/H9NELBECCAAPKoKqfRIeaJTDUUCGkm20AE+2pEEXlhDY8tLKGX2UHIaQnD948h1t+bYAdctRfUvFP6kQ8iYfN7/wMTIohsbbIig/m/ppuiwo7DuPmwO3mNTBYpIA6Yp40AldhFTOY7vn2IbQXMGKwoO58OzV9+m/czcCGZZQct1gYP2znWRAN+wYvPU9a/IrBa0UHwHbrNWVaK1mGioSERMiHKDd4fm93nuQsMRJykxfgpJd0fu49+Dqk0kw6bCXeDPe5cMx7PAjcv1W9OHOvNFuNlspZi1pAFap9qNWWWUJrUgto8WK///KqM/i8zUoT5FbMIjnFWepXPcx39tbBoceb3qJfwH1lm0CvvgcEuj1
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 05:15:09.3347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b78c67-f474-4df0-1e7f-08dee61dde95
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8916

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
v9->v10:
  * clk driver:
    * drop unused linux/of_device.h
    * enable parent clocks before NOC deassert; assert NOC before
      disabling clocks on suspend (and reverse on resume)
    * enable runtime PM only after parent clocks are on; collapse
      probe error paths into a single fail_pm label
    * move runtime PM teardown to devm_add_action_or_reset() and drop
      remove(), so the OF provider is unbound before force_suspend

v8->v9:
  * Reverse Christmas tree order
  * use devm_clk_hw_register_composite_pdata()
  * assert reset if clks enabled failed
  * add pm_ptr

v7->v8:
  * reset Kconfig: drop select REGMAP_MMIO

v6->v7:
  * reset driver:
    * propagate regmap errors in assert/deassert ops
    * drop .reset and .status ops (no consumer uses them)
    * remove regmap fallback path; use parent regmap only
    * use dev->of_node for rcdev.of_node
    * drop of_reset_n_cells and dev_set_drvdata()
  * dt-binding:
    * Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

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
 drivers/clk/cix/clk-sky1-audss.c              | 1211 +++++++++++++++++
 drivers/reset/Kconfig                         |   13 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-sky1-audss.c              |  137 ++
 .../dt-bindings/clock/cix,sky1-audss-cru.h    |   60 +
 .../dt-bindings/reset/cix,sky1-audss-cru.h    |   25 +
 12 files changed, 1578 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c
 create mode 100644 drivers/reset/reset-sky1-audss.c
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-cru.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-cru.h

-- 
2.50.1
