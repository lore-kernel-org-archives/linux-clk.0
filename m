Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023104.outbound.protection.outlook.com [40.107.44.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AFE414DC9;
	Thu, 23 Jul 2026 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797701; cv=fail; b=idIy6rDWlkzAbHWGrEiZytje9BwlIn0SFPRWuZZdogaQ3HZy81ghgg7tRZpFFj5kf/oT3YQM72oF1SytdsIdbA6Ce+SS+8a3Q0AdfG8eeAslnHoQG0JWpyjLjNpx5AQveF1yyYGRXGHLkLxVBMT6XK18L69GTJn4hwUp4qNbWOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797701; c=relaxed/simple;
	bh=EuMJWR70pkhbrj/Fkpu9hh7LBs1zLxDOZK7k1MZx57E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QNaV5VNWMTwvmB5KFSUeFFy3fH8YVOCBWPO2uWMXmHb/T0P5mu9wAATJf0yCh5uBlnDcuIObzjifLBHGyucxm2UgozfG066uixk1zxabOC4Hb7+RH96H3y1KQYmgRfxMk4BEJl0wKvzdJ0RzWb/+B7LKWoVrwYpuPAhBByK6yjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDzLEUVvjrFkEP9VOkGEjlEBNf491e+ZPj3vtwc7autnLVJRh3rx1Ooc+egPzWHXu8d26gtfzcMWYbDQ5AqBdfsyqv5It20vIbtSTks/7zbxvBXqy99CmsRfYUMbHGA6htetccGbsO0MfWlQ1Ljeal6McxBmcxKnB1BWQTZvxYsI51+H4fI6REfwc/NwQwjocpHz5x+SRYFQPcoUl60+Rc77AwaRFG2jfS3rF53AsxldG6FNqOyqvGgoyYf8YwmQqPf92W38W0ebS1rJcokcD6+jHhH2Qadu+eJ6vLvLfvBE/fBOB3iOqGbQ94ip0KWEPTwopuVFfILAJ0OigUjSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=El1cYR2s5vLyERM1M2bpXWogjTgg04bt9JQLc9gJZSk=;
 b=UIsOjmHTpH5SEf9hd+mMUAxvS/of0OgxvhVfIrJcuyBiVJ8gBrMVhbz3+v7XYPp0jmHh0uLAKLICKpDHy0Bd+IGTQWufqDs5ii39zRmpVZsCoAh6BCgVnYDZl3N2pT0fWCZWpzAKKOiwiVrhCuwaq4xSOEaEkCBxs6yR2hCWyNOO0hD2k3lcYY+QDTNRP/yPDnyFxuQYknMgCceOfeWlRz57siueCGbUZ0lPcHPndNCxhy/7+ycZLMfCPWI3UzyjvQsdYFIaex7+wHfjIogu8hZnqK9zPYgYxTaHAqzyjkdubx2u4H5OCMjnS9teClZ033qGuWSx5F/YDkky+iK4VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0009.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16f::11)
 by TYZPR06MB6914.apcprd06.prod.outlook.com (2603:1096:405:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:08:11 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:301:16f:cafe::14) by PUVP216CA0009.outlook.office365.com
 (2603:1096:301:16f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Thu,
 23 Jul 2026 09:08:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 09:08:10 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 94AC5427CEE3;
	Thu, 23 Jul 2026 17:08:09 +0800 (CST)
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
Subject: [PATCH v11 0/4] Add Cix Sky1 AUDSS clock and reset support
Date: Thu, 23 Jul 2026 17:08:04 +0800
Message-ID: <20260723090808.1727598-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|TYZPR06MB6914:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d6c4949e-61e4-40cf-b1a4-08dee899eb79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|7416014|36860700016|56012099006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	MRMu2czeUKq064xkhUyZbhDmN6gB8lJQSlK0T3uIxF8YfYYU6W6YSNldPCpGiISlV1c3+B8nIVbR19B4m994/si3uD7sdIv6LnSlzsY/xLNXLVfEhYBesoCFnE1dt6RfMxjptxcRf1RXLCnFj9dpJ2h0W2z1Ep5K2CXMqdoRta6ktLsAcO+doLc+dGiJmh90Laz11CBPwaqyZ0/eM0K7WBHleNma42Pa2UF1V4UY/Z25RcKmpzLJ37ZVTo/1zOAN3A44LKBPBzVriCNohTi/cYmtM+Icujws75J/MpglSXqjE8RHOFrVN7CNnNruRqEFjdtXVixiYottVEo8SGMzGkf8eSGinL8P529rUty3+LzDaeyR6uZQQF52IufAmW3tz6vjyZDuyDOUpvOZVNA/eZu7m/M8WWVVAhFF7T5fahVvJ/oNnQIrim3DcHQwfAGcfWjaRd+1B3O+NJrBOQImjNI5Uk6pajVJndtNieFT31Zs8CQx87yK76v1JAFyqDSmdFLCM2/tLpChjImbSOcLNtDr2JW+dQBUiTwebWa8jNa7LlteWulrDBmiMDWNbw5M7R0597hiWnkxLyeatin1dwuaJHRBCrn1FtZzWUI8jgGELNqnNg8CMO/dLjDjNzsTuMqZVS5vkT6HosDbMpKju3gF8Pl4xnKimmTnGP3QiO+1m7pebESJ6Dzlkn5+WZ/T3XUHwObJ5MgsH5GiS5+NhA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(7416014)(36860700016)(56012099006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kF6UODOZV9u0DsTW6DdwPNMrxjCGdF7GaixUAvEv7kjNLGEpAYantb+3MWTtak/5/9YqT+b97moODapA5EXKC9njIHlWhi5goCliOCzYnfqcySvz0E12tzMxCXzGDGgpOdT96hvIQ7Es7GUDk/6bXidWHVPI3YhISplFnlVObs36a/rSlYB98H2Jf9tZth/nsYJiWMso5J+y7yWD27LAkgg1rHeoX0CthmHy8VYXjfwbPJ4jrdfdr1Dk9Goo2USN/cMzXPdOHgoxsUcBqJidM2xYvF7kDiTQbReAFkZr25tm8aFyqWpKXKqxlusqsxY4bkvnAi8Y1hJMoOyLat9P0qB0vQq1Ht/M5KNppm7iDwbmpxkbGqrUNwX1YyrZAc0e7AezagwyedwwIwgoaH7aDJp1nes7RAIlA4Q8EtTopNO3mKyXdQphguYN8q8E7yp5
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:08:10.9427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c4949e-61e4-40cf-b1a4-08dee899eb79
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6914

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
v10->v11:
  * clk driver:
    * Kconfig: spell out menu title as "Cixtech Audio Subsystem Clock Driver"
    * rpm cleanup: only call pm_runtime_force_suspend() (it already
      disables runtime PM)
  * reset driver:
    * drop unused linux/of.h
    * use fsleep() with a single SKY1_RESET_SLEEP_US define
    * use regmap_assign_bits() for active-low SW reset bits
    * move the post-write delay into sky1_audss_reset_set()

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
 drivers/clk/cix/clk-sky1-audss.c              | 1206 +++++++++++++++++
 drivers/reset/Kconfig                         |   13 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-sky1-audss.c              |  127 ++
 .../dt-bindings/clock/cix,sky1-audss-cru.h    |   60 +
 .../dt-bindings/reset/cix,sky1-audss-cru.h    |   25 +
 12 files changed, 1563 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c
 create mode 100644 drivers/reset/reset-sky1-audss.c
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-cru.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-cru.h

-- 
2.50.1
