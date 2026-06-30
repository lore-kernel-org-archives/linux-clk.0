Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022116.outbound.protection.outlook.com [40.107.75.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595A240E8DB;
	Tue, 30 Jun 2026 12:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823462; cv=fail; b=V9+5b/nsJjd4KUQm80vkf/OeS7Xk9TabxTfWB0ipdCrfDLeAFAJHe+0H8Dn1CRHfooV7E8ZFjSnQsuw5ioWsyI296tabpthXGmcSNxW3mt1puroNhK6n/z0aT80/2Hmn7+6NUs2qFPhRLz+x+qO98V/zGJRTrSns3QPxQUHBtgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823462; c=relaxed/simple;
	bh=xGcb05kXfwhn7hDJ8qYvX72mwb3XP7aG4PFwX1a/xy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c/B28+kt9i3G79KW/BwcmGXOCdTuwgvE1gTzL+tt4g2kYn7/Jij5cyDGCssCm62OWL1LezYJXKVLHaR/MkeFjfB90PkCa7V1V/Z3KdKXmc3B5GL6nCh8eyCqJE+lbU9Cq9g+cTDfF0ZKbEwPMA2ovw8l+35bSPEyDmobIxoJ9ZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsVNlm39odO6UXfJoLOKt+yly65ar0lTqn5qsRUO3eL+iHLRWkgL4v+wEML9xreVwmi9e8j2rXnAHnmr8n9qMhcNThUSrG9brqFLpO9IG1EErIgFKWEb725yq0EAzl5gapOq3RASHfA+QvEdfPXp/c1qBy5YiiuzgLvp9zejck49CjfteUYphkY4qJBXmHRiG7UZnHo+OoT/q9koBhPm9ZdgPmNZQAiHGqeUeEEVPYz3wrM3QqAWVABgKgJZk75VjK+stNNySpH3HZwWDXMziqEjMJT1jtlta9UP6pQUzUNIG+SMsv8GSESqJ19AAVd0bB8FSQKadV6w+UCRY1u/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5IugCvJ1hfFwfBd/boltLY3D2DUgY/3e2ntLRvjpLQ=;
 b=hfT6MnrglITx76E5aPups/QnnRrR0ZypZvHNqAUKWNDF08PGcIoxAdVPBCWAJaUEzObfx6Rlktjk8p8bGOBSx2fWK48LuNLvSENpSIFiu1j4OwYksRXDzymOifV/Bw6bEoVOQ1ceHR9EeTWhe2NDfrzhjvUtlQ/+iqh/78wK7tZkac3kuPUw4FkaBZLxeAUWA26iWq7eUoTeQxmemoLuGAit3OtQSsz/lKUTaHuCVwDT3BNFC/d1WZ1BIQKI9Zvhd5jIiYCd7WCdiiOtwkojbjaWXe9P/9LvA/iVPsiQvjNdOcXv1a8tfoaa48r6hpf78BMboLiBysIqcuREBHzt9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR06CA0009.apcprd06.prod.outlook.com (2603:1096:4:186::17)
 by SETPR06MB9047.apcprd06.prod.outlook.com (2603:1096:101:316::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:44:18 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:186:cafe::91) by SI2PR06CA0009.outlook.office365.com
 (2603:1096:4:186::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 12:44:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 12:44:16 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0399641C1E42;
	Tue, 30 Jun 2026 20:44:14 +0800 (CST)
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
Subject: [PATCH v8 0/4] Add Cix Sky1 AUDSS clock and reset support
Date: Tue, 30 Jun 2026 20:44:09 +0800
Message-ID: <20260630124413.1814379-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|SETPR06MB9047:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 361fcaf1-9676-415a-6d3c-08ded6a54bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|1800799024|82310400026|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	RJknDsbsG8eL9j75sgbFhf2lmgDn7imcBNC/Bvmjey/SrTNiv4Vz9bauiWMH93hFHzevC9shGE/96nA2pQCacYNOtsUm9N2yHyBqce9L7gb/AEE/9TCp1ZCRHsWU5ImoNlyblHpxdJblY3zLHXNKTOEVeGj9NUImh1fixDhEh2QhcHdt3bk5j/JJblUgAop22eHRp7O3qGFyzCqFdnorLcEqW5MlTHG1b0USPKK76RHmMLuMxyZoVLr+K8vAhe35lZS6oZDvOgjt/f5t3INZE9TPXIOxl5RnJswNVgnNBrA3SxuEbp7Zd9AnVGiKFU6p1HemWO7qprcpaqf0YTalhAdIbajsLYUwahrhZjGosnIBAUpIiOjXuvmvGO7C+za0q/NmILgWbhslhRPxKle2cv13Jo2P2Bhh33EuDXmvmfoLsmtFwZ5opr+ACmgaM+UGH7N/UfI3M8+Jgrk1rXlVjeLptnW722EgcWW7kvSKoNldUN3y+sheOieo2IGenHJUgvHM/tdEMWJ20lc3wPpo8SljsMxGWBdu/3eBwo6bK9HsAAnoYcu8OEHi4sy7eOpjqEbNJ6bOc71wcEUycnag6OLsNrkxeij0Rc49KOyZvfBje/h9XAZBMGqc1H7iGRbste0RQ9/AETkUS37WgmV/VSANLZgocUyMhoAebK4Ik0r91AoA6m10X4UeDvF5tLEvbZ8QESqe9HU6r8j7NivsVg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(1800799024)(82310400026)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jsLEMQACHuCTZbH/cPy08x1Sy2cDO+Ywn/lRXjB4xyWZTlgRDSkU0vfG/toN4E+jbFz8ljC7t3YJsVwSgBdHTyyZjNU41NaqkzmJvqP5uMP3Lkrl81Btf9qFMB/Xgq4CIEXMMWnNK7Aq97dFsU4egvs1zHuLmCNhUcVc+xlQtcKeL73dQ6/JUv7Zu6V/P+XkIqtKkwKmD3a8HDKwJFzgN2jJXcC33zONL7Jz1Ud2P1kLK4wFQ2xRO6pRxh7iD+qmYUZFe//2pfzq2dJ9uUNvyk/LfYway7KO8+9jhee/u07xGuysECTkFzj0oARgMf3PRGAyPJtMliD16uSXdlgl+/Ty4PeqbYLTDUosN1Uo+lh1PZD8xCTyPxeUgydzcX1j/C98rwbrybIHjv1t5K57gSh3hGp3PL5Oo9tSU18Wu5BeHusumlsKAUHQRtx+hjr0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:44:16.3583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 361fcaf1-9676-415a-6d3c-08ded6a54bff
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SETPR06MB9047

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
 drivers/clk/cix/clk-sky1-audss.c              | 1203 +++++++++++++++++
 drivers/reset/Kconfig                         |   13 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-sky1-audss.c              |  137 ++
 .../dt-bindings/clock/cix,sky1-audss-cru.h    |   60 +
 .../dt-bindings/reset/cix,sky1-audss-cru.h    |   25 +
 12 files changed, 1570 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c
 create mode 100644 drivers/reset/reset-sky1-audss.c
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-cru.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-cru.h

-- 
2.50.1

