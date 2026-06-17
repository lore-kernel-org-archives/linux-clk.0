Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022097.outbound.protection.outlook.com [52.101.126.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAAB3B4EAF;
	Wed, 17 Jun 2026 06:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781678471; cv=fail; b=gsaSiBQqLSIjVJnCBsRyHdClD5G+Q2g8IuwLeqt3HsWrFNNZ3JiP40/2kvdwxWa1C0Q0X/GXxpazHkQQBU7c+LdqlaE7L6iOn51TfPihMB4b3yDhcbsBV4GN42PjWQ56dQTjQMZXJYKzQ8FpL7ngORNfN84cC3HenoqqEDFeBks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781678471; c=relaxed/simple;
	bh=29mgrWKGDn8nAOGQ/QdUp48dZOm9m3JYtegTUQ0ycGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YsCQ/0LorHxsvtB3K+sL15OFLwTQhwySXvukf+EGG3P4A27zMi6T3pKvgqUMBpFoAMXUCQSzwKGs/ZMXwhrZ+ou23Q4oWqF93qxrXhdlRvNEM/PR8gBxABtXLTMacwZjrwQh7sNY8aw+rXaNTyQMAlE1d5m4U7cofMwz5tXFj/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjDrf3QAghBAbGjTb35RipoKOaKMBUz8e9W8Blaw9AZwDHdXvi8DmQvrZ+1pCndFnQ1HmQD5Trmhzh8t89eUYsXZ6CAxyg4bq8FKbqfWZubmFuV1iGiTxk4hKPzIeIuOqbfwKjraOgI6AlcrrXQrZM+etmphyLLFfWLWaq+QYi2mkwYLgSyEhxil3UulcEBd8utm/vM9IBeRD82UFmbQfJZdzGoMp73UVplE3SBcgMpm5eDrcSRd1jtVaE105P2FsAzNduE79I0vJ+z25eRjRD1E2HFjEKFmY4kfsXpIElBLnLju08cjdCP98td0WZ/LoisfuT+AeIy0Yden1TL7CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16t1swX9E3DoDDgaTiCcWxCfxC/3ieCbtYwPAByc6ek=;
 b=H5aIGhuYCx438oUZHkbFY+pZB4PVUe/mYKiDK9XoX2wTZAW0EyceKSuMPcOFRxcUF1Qt+vLrxIh++yrpBZJOUXM7sOw0nE0HSfB6xO7lh2BOfWCwGdER689fjB1sHYebR+t75D5zK+0qq1Ps8YqcyFrf1ufneprgSY/MmTUbp2Ck1XG3p1WcazlydN4Zj/Nn9CPSl3WQ8n2X1Z6msllO4F2Fkux4DxzBrf4/gxeM3NrzkLQMkEcLowkZPsQ0L3OZSUQ43aZxZx6YTB4haWu06ex3qK+xZrn7u5qdDwh9DRW6/Zh+k/ih6ADdVYMFXU2U0Olt++J9to46OdzXcyGsEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0045.apcprd02.prod.outlook.com (2603:1096:4:1f6::16)
 by SE3PR06MB8199.apcprd06.prod.outlook.com (2603:1096:101:2f0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 06:41:05 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:1f6:cafe::78) by SI1PR02CA0045.outlook.office365.com
 (2603:1096:4:1f6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 06:41:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 06:41:03 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8351E41D4000;
	Wed, 17 Jun 2026 14:41:02 +0800 (CST)
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
Subject: [PATCH v4 resend 0/5] Add Cix Sky1 AUDSS clock and reset support
Date: Wed, 17 Jun 2026 14:40:55 +0800
Message-ID: <20260617064100.1504617-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|SE3PR06MB8199:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5836a575-9141-4fdb-3e46-08decc3b6709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|82310400026|1800799024|56012099006|3023799007|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DKp2PtegUbS65Evb+K5IDV4od4uqvEZL3X/cmLWYifoRaRJ4XnSO+kvY1K9vwqPcOtotRWhdUDJb7BUGAnPuxmwUF/QQaky8oBSMog2wt1mymU+CoiS0UbZdJCgpg1ARW5PbiCeZLxScTS7ve7vWSzhkVzCm7o03AxE4ADT6Kbx7txQpPThmGAsw3DTpRsVieU9DGKrhaR1BBpXfGekvZ8UklkFCZBiS05Ytua8XD7WQ1HpsBlzbsvis6t58Uit+vUYcnqzAnel+t5ZepwCBxrC8vIuE1OLbRj3b+vic6BmZWlOjb25k8Tg+QpvZmGX5eYAlMvijZxYH9YcQlGH/uSVZN0kvIeTD07knYTxIyp6VaoFFqkk+D0Kc+NfemJpBWAZW/xo7+qfbz2VfgnOSN4VHkQtM2T15CPU8uR4mgll6aK1G8tuU3UgESIGPJ8hI7XthMCCqrAsbZ39U+SKtshD+JfSgGcABO/Ws0iG6A3fwZuXXLJoB2PEMkgjkyTPq7shMy4KSRQMISorbGy78JO5tSnxShgNln92Slo9V0Jc4ahTqoKXfZndtMl/8MMczigLmiRIx/rlmYHIfrAZoRpWksGIakmzXikuKxUmVbkjgy7ADESvH9xwOEeLkpQv7e6Zj1Lwl00WqbAIeBpsN3Up7PVfUvUQYVAaNhcaCApVRlBDuh6jfQp1+Vol8BXUlkOWUVIi0RFa05gdUD0MKMHz7jfJTvnt7MqtlGcGuEzI=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(82310400026)(1800799024)(56012099006)(3023799007)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	adHNevPsZekEpwmdE71pBEDcNSl677U+bjhOiKfUUVY2e1ieXsU7MEL3xSy9FjcpTywd0VGvIdVCBD0CdS0sKZfp5l4issftC3ZfGkNI6t3IFYMLUJHy9jxLepEU8g5L/wqrbN0CnItZ4A+/8SkQMsOUQgW87wfnWNba3ZjmgNppvOZalOiDK5R7OQn0wBuZrYN6a+cZvn4aibVwDdnZGH5ruHLp8xxAi6vFrP/jEBZNZZFIn5+OwdwNA2zPCbXWOo8aoJYHJ3MEwJYvIXRtz8K4ENwrX0+dZRDgRZQvUBpyIZ2wnOW7naKEFoNVxCYeGA5mZ8tti5/K/o8tz3Wnw2ZA3IOSVFnYzw0GMS9TdTL//0wP2uPvwXE1UqMx+8zenjKl3L79uvHmgsG2Y2fZF/sToFTxK68SRnnisJQQYGxF5ERHc4Vzo2dSZQvD5/gv
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:41:03.4336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5836a575-9141-4fdb-3e46-08decc3b6709
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8199

From: Joakim Zhang <joakim.zhang@cixtech.com>

This patch set adds the clock and reset support for AUDSS. The AUDSS
groups audio-related peripherals (HDA, I2S, DSP, DMA, mailboxes,
watchdog, timer, etc.) behind a single Clock and Reset Unit (CRU)
register block.

Clock and reset changes normally belong to separate subsystems and would
ideally be submitted as independent series. They are combined here because
the AUDSS DT bindings cross-reference each other: the system-control
binding describes the clock child node, the clock binding documents
reset lines exposed on the parent syscon, and the DTS example wires both
together. Keeping clock and reset in one series gives reviewers the full
picture when evaluating the binding layout, dependencies, and
integration.

Patches apply in the following order:

  1. Reset support
     - dt-bindings: soc: cix,sky1-system-control: add audss system control
     - reset: cix: add audss support to sky1 reset driver

  2. Clock support
     - dt-bindings: clock: cix,sky1-audss-clock: add audss clock controller
     - clk: cix: add sky1 audss clock controller

  3. Device tree
     - arm64: dts: cix: sky1: add audss system control

The reset and clock parts have each been build-tested and checked with
dt_binding_check independently. If reviewers prefer separate series for
the reset and clock maintainers, I can split and resubmit after this
round of review once the overall design is agreed on.

---
ChangeLogs:
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

Joakim Zhang (5):
  dt-bindings: soc: cix,sky1-system-control: add audss system control
  reset: cix: add audss support to sky1 reset driver
  dt-bindings: clock: cix,sky1-audss-clock: add audss clock controller
  clk: cix: add sky1 audss clock controller
  arm64: dts: cix: sky1: add audss system control

 .../bindings/clock/cix,sky1-audss-clock.yaml  |   72 +
 .../soc/cix/cix,sky1-system-control.yaml      |   48 +
 arch/arm64/boot/dts/cix/sky1.dtsi             |   24 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/cix/Kconfig                       |   16 +
 drivers/clk/cix/Makefile                      |    3 +
 drivers/clk/cix/clk-sky1-audss.c              | 1167 +++++++++++++++++
 drivers/reset/reset-sky1.c                    |   86 +-
 .../dt-bindings/clock/cix,sky1-audss-clock.h  |   60 +
 .../reset/cix,sky1-audss-system-control.h     |   25 +
 11 files changed, 1500 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-clock.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-control.h

-- 
2.50.1
