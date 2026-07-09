Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023080.outbound.protection.outlook.com [40.107.44.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534F3421898;
	Thu,  9 Jul 2026 12:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598498; cv=fail; b=TE/f0pIgTW15QoZlEs0ZyiV/L5JFuh3Ig1TrPhcGUs34J6IDGrVyP75Ep3eDkeKxPGvHu0DM1RKx1n0R/HiDxU85X0mTtrUIIJLjhph5gfX3ivP5y+PmNAT8U4c7JxdNh3PwOL7jmcxM8nQdks3zMwPnVUXiWqlfy//Szj9N+Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598498; c=relaxed/simple;
	bh=OMFQt8krwgyaEHyL3lJBRLM+OzSFXW9huHydQEmdd0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JHV8iN9J0Q6B8Wr3vf6Pg/lo4AvaoFF6l9VTHS/ZuEjvp0y46r11httQTxLW9Zu0Tf7VqWdwTHoNAvrxdTijJNwZfwFf5F/Euc5ATcwpmBCyRfq3NPwCNbr3sAjqsv6p785dnIfXRpIV8FUrZ5DUsxyyhBZ5Ayu9YZz86J6ce7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6C90qjMaPv0YfXID8NFnO/yXntknpbS6eYTGwFuHT8r6UEnN+GQCxRt1+jXZtdcXnIfyvvLx2pUXFAPGZfCAzxviBHZzK8PB6gxq93SjNsblq4/Xz55mRCItAQysy4DpfI4pdm7SfINns/C2UYGDUmIjkhCYEImh2YJonA1dFPgNieO6P1jQf09uH1SEOxbZOl+VwE5EZPQYiStDI5V6Qb71h7dBOHoZuTW+06M82+yQpmwLSua0cP8AcbSmSdxl5BEgOx20XuOV+NIDWXxyyEmY8bYrfcTaRq1bwLpPFZmfki8oDGi0S6w+x2llLe1wmGcyo7SHSfwnwjO5OhHJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F424nrgsh0asWYfbRO7MY9PITUgXXZMIoEaGoaElsRw=;
 b=rHavlSICuZyJIaEIs6KzawWFHD/VowuT5CgdYcMbEnpGmdTzFmhe2TXzL4+msfAq00l+MQ87FoViEAR0MYlZUIMgfOCi/1tVCjv00hH4GzAvvSQhUVRN7JoI0/qiCkmSON4Mkq1WRk8gwHmyf6Xk56Ut+m4onqiJj4bdVGRaOlDtF5Fo75HSy5LdPPMm+l1xY0dpMasM+gAik2IXE10ME9T6tGpqG+CLXUbXVfg2GX/5thpARgueNAy66esfLVn5+j0P/xRKtJF6BMY18NU+Nd2fXBNr2Kr3IrZfXxrxqo7AXF9/wpX8pL5PVzMuL7z4gd1XMBfzRMSctxd5BvTv1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) by JH0PR06MB7106.apcprd06.prod.outlook.com
 (2603:1096:990:9c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 12:01:31 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::49) by SI2PR01CA0042.outlook.office365.com
 (2603:1096:4:193::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 12:01:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 12:01:30 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D9A494351F32;
	Thu,  9 Jul 2026 20:01:28 +0800 (CST)
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
Subject: [PATCH v9 0/4] Add Cix Sky1 AUDSS clock and reset support
Date: Thu,  9 Jul 2026 20:01:21 +0800
Message-ID: <20260709120125.3997078-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|JH0PR06MB7106:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 79ca0054-8ee1-40f7-40ea-08deddb1d008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|23010399003|82310400026|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	HpD7sJLPkQjYKqLtWqn4wbysYceN2E+xBuNCR+OXZAP9SH3pv8ifNcihSFeQvlKAqp7JC8+g9W//K8N+eCgmcsPoH/eBh2z5AndMuTc1ABFHnmRWdbBlZpBggpW66gGJww4xN2dQ9x1Vs/8rTQycYLr7aphW2fhXoWHokIwA8fG6B1pwuCvNRtlyJ82eOtTSm0qKgVUswYDV95V5gegsx8zXJyVtd30OHqtuHvJ/ME3SopvRBcYUu7/y2dkVStPIdYVQRto8R+wxZggHNSSw79Guddo95tpkW36z9Rz2FqnluebEkcdfTZVjaC2rYlSmT2ANlNgik8M6qFV/UJbUwvaXst/kTv9LLJcwXQfAabXLEFzZjZgHueoF/NLw1EehtRxBu2oVPgRO6NSAqqGPk79Nx5FluQEmskVYryH6sWIpysJEBj57cxkCFWkjF+719vwuVyNQA64DIwL8MBBUFBGLnDR0ROoAUh/Q2mgnBM5DAIQbGHEBV1HMCsmbLmlEwkGFPfuPcAojWmpewvZ/6gzLigBCQijC47WQwixnDWZIgvX4rXCihsxRr55QJ/Vm9EM3VYia94pVkM+3czKERjMOMGBpCQnMiW4NvNQoB0KJ4/cy1J49YTLSSNrZpL9bqcQtfjAIFpTQWtemfBZJT3Rw2O5LPrlqbBGWfNKPxaWsMWGEp7qaLOM+tlVqrY++0T7Ml/SukWC224at+LqC9A==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(23010399003)(82310400026)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rlld1WtyzDAa0Pk8sV1WGmWVQrmT81yKtyxOQ8hQD7oxuRmVPu+gioBSo+JWav74jXx/nXT9n61aDONAxZRJA496DcVfNYS+LWV1zaqWb1EtAIce8Ngtv1f2OF359yuUYIiXBYpXUVf244kY0aF6CQPgq7uoKMBzBJffJ8TED4blKHDTYP2qh8NZp29XGRwmGDp/PvrXQrugNjTOywSWKPqTH+MwJVYK7rY4vGLK0NCIbcwUiDzMUZg0PtiDLdrD/BRqbdQho16P1CdB0hHHZuGu5dcUmUZ17LNsXFxgE2OphB6VW6YYtRnxKYgSSTSTKBXd2o8KS5LUawgRFijWPUS8iYUgPklImCV9w1qgR8rMcdLcPn3vH7w3TVK80nDWOi4mOxZ71GdTUbTpMYvkJQy0/wu7ORl8vfBxhZ6empUNrwhJ6HFKBq1o+vrLcfZP
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 12:01:30.0322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ca0054-8ee1-40f7-40ea-08deddb1d008
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7106

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
 drivers/clk/cix/clk-sky1-audss.c              | 1205 +++++++++++++++++
 drivers/reset/Kconfig                         |   13 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-sky1-audss.c              |  137 ++
 .../dt-bindings/clock/cix,sky1-audss-cru.h    |   60 +
 .../dt-bindings/reset/cix,sky1-audss-cru.h    |   25 +
 12 files changed, 1572 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c
 create mode 100644 drivers/reset/reset-sky1-audss.c
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-cru.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-cru.h

-- 
2.50.1

