Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022114.outbound.protection.outlook.com [52.101.126.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D714030BF6D;
	Mon, 22 Jun 2026 02:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782095133; cv=fail; b=VoCs14+qj1zK5lAsVhPx8KgkFehmsMx5QIHI7qmBinMGUyRFsSOIPcgycDxnbwOYLSFspN+hi0/vTrhu4teSlr+RdedXT2wuoLVJohcTvuYKetbYBVfSFLkXBsS8y0XDCPnchm7Wg5WwKpfeqC4L+lrfBPmziJdg4qLQCA0Q2c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782095133; c=relaxed/simple;
	bh=53nFM28Q2T6rGNSHU38nvIoQUhFyIrHuUIL1I61RLts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vf7E00NQjbC6gPk4rJ0avwi2ffag8aQXI9FXvnRizanM/6S4Rh2VWZTWZ8Zqqh0yKFoGwHnMExD5v4U5T8D84wSzBoQsKRAXP0aF8ACufghvcf5OT+zuwocMLgI+RDazYUzwSfcNRmnJcxIfu7MZff5pDsWj+RMVUMOvtAL7PYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQNcT95cPZ0PPzNZNg9yzK+PwdKRH7t6nuIoN3Y6zPHI5OJOwswKi9dFqXMZvytOvkROen3V4g24LzqlwlFzOhXoVRBiV72/xbEm/muUsA5vjAE10xmvsDxiQpQyXZXeb5SDfQObjSKvkaWe6wKTHOl3mx9cA0frcOiRNwZjSvjzzdTHpbmtfGFGAbJhcImUUZgqAZk3EmKsxlpCk0nT2bhFDtlnN2gd4VuLGhje5aPO/g1Y25ReKXNFrSL4w0lIbZPsBDgSDwcIS7RbmwA4bQKHFWlQk3cd0vmqqhMs1TLAXzzB2r2rk0vrFzoQaYqnS1FxBJQb5nqJEN+sgk7KJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WvGXZrtq5kg0InsHp4i0KrW4OkfyWRa3sIqjMwOj/0=;
 b=ZAgvfbSoXWSzJa4qlwL9zZ5lBdfbrCEklfwKLZ1DuG/jQbvO+7nCTOg2OvR0tWLFWU3L4pQ/5RMxz3S8eX9gs/KII19LXsrTIXDcG9c5Icr5DhSL27th7R/svZAI6faA3J+6I67Jz8pR/OENqSdZyB4IDSz+lzmPrRXP8Mr4g2O3velNJXqTsX3KljSUdptAQMKsNIgz5k1xRVb6JdzE+KHnJr+OLRItJzvJ5xU09Rigt5QdGIFu4/ap2wsHG+HQT7WLwlnIwM3Ns/C0/kTmzAzChUwqpfdCQlkrh2/a+bkvtFojiY/yh+PklXDzSCPPRymJABhhCvk9emJ9HCyNIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR03CA0001.apcprd03.prod.outlook.com (2603:1096:300:5b::13)
 by KUXPR06MB8342.apcprd06.prod.outlook.com (2603:1096:d10:82::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 02:25:27 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::3c) by PS2PR03CA0001.outlook.office365.com
 (2603:1096:300:5b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.11 via Frontend Transport; Mon,
 22 Jun 2026 02:25:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 02:25:26 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 470A040E7F94;
	Mon, 22 Jun 2026 10:25:25 +0800 (CST)
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
Subject: [PATCH v5 0/4] Add Cix Sky1 AUDSS clock and reset support
Date: Mon, 22 Jun 2026 10:25:16 +0800
Message-ID: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|KUXPR06MB8342:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d99d5781-2e68-44d0-e837-08ded00585a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|23010399003|1800799024|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	ecVPYXDm2tc5gZ218mfT3o2EMHyQL6dVwFiVbwy9SU5Qc7zZ+8dAww8b4x3crOFxa/aIqxLQn3Mnj8uf1QgQQ29VXwDJElMnkL4BJqpTEKO9Op7SjRPCYZL29fA3rt0Ywa12kLqA9XIUvTuRPEu5Dh97kzLbPqTQ+GZZxtaKvz810QIt3fIlqX1/TtjkF4XN1CtLshY6ZN1+4rUhlTndpQ5BUJet3c42p3Jc6rhhRUDJAVVzL4acQx+P4MeQIsmy7qk21JEwzuS9qoBUAvlCR0aMcFchjTt+/0i0YKXB5MIPUhHMLv8Xc/VwCTA5t43AVob+HD2k2Izt7l0q43ySV1UjyUBgkMfW6LrfJAmcT7Q5pue/0AqjBJCvqjtWUXzabbp98zkkWt0ead4Ch5WTwhQqB6BWe5cJ3N4QNNLcXCtmR6yZo2bRo3gZd18AxtEzQlekfRuBE/Scnft7sreFbhFfK3WT9BsDm7Ye1p0mAs5tZnSizK188003hsg54E0KJ8GEQMilnKwS4Ni4HJvJ0oAZCd401VuvaA5426W+mL58M7f8yppy6rxAhvWsdkm/zEBeWX4k9hooZ4n0BbT5gv6vu7o2B9/5piaTKDUp5XHMMLCXQLVUhCJdxMjyb/7k9CWiAA/Om0UbGhsydMY8B3bT/9BFSp3B/bwvcNWVPYCON/PPHWcfkxd1WJfNwNHs4kOt9iR6Q05XDzpmyxIfgA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(23010399003)(1800799024)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZqjVYDxkrDK/+YkCfJKOpPqBQSBXsYL+u33q19hNX/o7G58MFmTNVB3gZOLBV/+oHC3ez7fPIYabOnXiiBO9Q8ndSaKKGRf3sjrLYKPtzncJ2pb+l0YQUwA1Bv0ue2RqFEF/foSw46zugEQixpGMA4zz+p7xFnRdiPZaYIN0T/YtbN4gBLp9pJ2sYBFjyYEXQJTw4+IQb9Qo0/jqQye2MLwesHzwyhGo1KFImk6VjmYcDEMyjfR8opxohZuKrp6L20F+36LekM6UFeoCfB2Fpq5K1VEL7JEKFE4lwuQrz7qlvy60IRtGM6EdypZUblccEejXFd6O+rPCXOXgSfWyQTIs4WcAGDQbQ9x+fO4FuaeYZP3N9UvyIIWezJI5ziikR27hglmRYOzbXMUdwgSN+w9zuav9f43HvxCmjGfxM8PyCOlF72s+PwSxftZYXzWA
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 02:25:26.6224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d99d5781-2e68-44d0-e837-08ded00585a0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8342

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
 arch/arm64/boot/dts/cix/sky1.dtsi             |   19 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/cix/Kconfig                       |   16 +
 drivers/clk/cix/Makefile                      |    3 +
 drivers/clk/cix/clk-sky1-audss.c              | 1205 +++++++++++++++++
 drivers/reset/Kconfig                         |   14 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-sky1-audss.c              |  192 +++
 .../dt-bindings/clock/cix,sky1-audss-clock.h  |   60 +
 .../dt-bindings/reset/cix,sky1-audss-reset.h  |   25 +
 12 files changed, 1629 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c
 create mode 100644 drivers/reset/reset-sky1-audss.c
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-clock.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-reset.h

-- 
2.50.1

