Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022109.outbound.protection.outlook.com [52.101.126.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C6F33689B;
	Wed, 10 Jun 2026 06:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072244; cv=fail; b=OTTs8sqNxu8lV1NXjs02/DIEg5Q1YvLvRbH7pMsCNOt/xUJ8yFO5xZi5tdO5v7yvyXqxJlCZnHJtBTp7SPXi5+bE/7nYsiQcIXoyp4/wPW9R9mcrKQra3+Q7T6sUlV1DE1KADHXLvXSJFZkyWWwRya+LKcFZlywrYTIy2S8I4Pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072244; c=relaxed/simple;
	bh=iDz5mdXaDCPxik8rcmwJX6umyC3NvZxDiypMRZ90i7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FCxLN/ocv3Vk7vtSHTmSZSDnV8zLiqwlW4vdr21K47Ij2izd/KM8XBdIrTNIoTKeN9AeEvW3jPCeO6+lzAQlNDsJN/qxvrdiaPFU3Eg5MjzxcSkrwdvIJjOoUxJiiizg+R8RjxQcEyPTjz6G/mDhV/RaGKccB0tJKRIRDuKz4mE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyqFptiBgMYedJOhzzQ+Kg3d2x6tZbJOeOLsyhiOEWxztDjsyOfOKVR2ww02hRAAFJmI1niQfn5SVvqna8ZdE0jI25VX2M+pJdYGHGHuRNqyZwBMwarYwzGiKE1xDgMUP5P0FPTY7dfe1z8xrAL3moA64ncfgpdsok4dN1kQPNr4ksTqSWRRCgHVkE6C+dIDeVoZ5Nwu18s7TADQ1brmEdkXhK0+5nUPhsJ1ky1hajWxwygq0ybzFWMGhwvK1bP7bzo78KKbwvxD07/4chA63fPYdFBO9Oe1adwAmNX8At6ihkc5CgmCcL4CZi/CLid0PFeVMuFb4+oHJLncZ8x8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlQKabuJdvrdGKfy6kN3DYg37z2GYbILku2QmHi9t64=;
 b=eUzeKDMX8D1wHkp4tQjWrggV6cnm6eoTXwcq6ZNsY5Hdr8+eGMOB9bKDwItITWZkdhGMsPPBy71n4BIMW25S5raSiEo9v8M1tv2ikcccHhL9GDRaIWvkPtlwsEnbWh7Duf2hzOJnPODIPl8JgnjNAskVMjBcUgAZdNnqEmWOsL32uYAMBQowdHp+OLzs+tRkSftwtLCkGPqAuH+Ye3ymKiD55xY2ewYyKzF09tpy2Ez/OFGoJstMAfJeCTbOTKDctW/Xr85pbMo9yLq396J309FQKYeXEOPnBiGNsB6zs2O6agL7aDP6HuWKROj7/ewZwudklvxmdEr4rdv8cfE9gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY6PR01CA0027.jpnprd01.prod.outlook.com (2603:1096:405:3bb::17)
 by SEYPR06MB5422.apcprd06.prod.outlook.com (2603:1096:101:8f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 06:17:17 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:405:3bb:cafe::a4) by TY6PR01CA0027.outlook.office365.com
 (2603:1096:405:3bb::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 06:17:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 06:17:15 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id EAFF84084261;
	Wed, 10 Jun 2026 14:17:14 +0800 (CST)
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
Subject: [PATCH v3 0/5] Add Cix Sky1 AUDSS clock and reset support
Date: Wed, 10 Jun 2026 14:17:07 +0800
Message-ID: <20260610061712.3203984-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|SEYPR06MB5422:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9c94196b-2528-4689-30a1-08dec6b7eb7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|23010399003|6133799003|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zoro0zjGXyQqx5gM5NPxuoDrYIj/KBJ7uM39wwed3pVvou8e0brmUM3hPNRhCbiI828UocI/ylTk2lHvjw1HgSHar4BJhf4tAEV6RQEt17hQRkB3dC+GM4jgPt/HyMlsCANfsDsG/vYK81cKrbg16ttHDl6o/yU2TPi/WJ8OPQAqYcurU/DMkd0eMcNhCYLGwB+Ylk/5VYxznYXEXbeIVwC06WC+0L0ZZc3BU2g29K1kksHAySe7QUlRMe/9tjrlW20Sb3MD0NQ5w3ePu4/x4Ial3nQR4EbVCJs/XfES150Limjtojiy82QKK6eq/dlPDYijeZZet3nCiLDHISs5X8vTopb/9JoQCvZndNKmfWWzzT4fc1fC0ZEqf19wRyKk6LhhZ+7zqwNQjVQGunsc12R9adrI4yE7UbYpNcKT87g9s7zXGWxuywenRVafWTkusyBFNs286LxLADvSrWEWckeJFwJZ4x0l6DoLgbaMJVwafkFWHD4CU3wmq9DH/mE/AO1wGWywjLfUj1Pyn0pfaAMctasyEBAOs17IADM5BMH18nU58nCpweoq0VMFU2mbeLHfMMr3D4MrZ5Ah09HXtGZIyKQMGN7CVPQdnqyvNr8CiOUz+NFyp9QV3jtP8d6vQq88JVKe0NLcV1uxZ4Jo/Bm6dBqVrjfLTDZpcy7PF/QALwUYk5K91fSoi6u54rXMLTZuKdaGbdCo9ZH0ulAHJUucPs8yx+vuCNOw7JhHNB8=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(23010399003)(6133799003)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5e5AwElJGRN5LqbOu+vlMQa22wF8LcFLDnVjlwR/ji0UxVykCzixu1yrpMQgZiIVjEHfJ3ksHuQmtvYE+Q17rdmE/b+9Kanktfz+k0JwnbfPKfaet5ohhA5d9nQCAnClA0wqnhHeVRaU1qFXUUnXSVfPcyQTVbznm65SDFDVeypD/Nn7w5IE4Q7YYcVEI2TV/dsOP5YVM6c7MGCba/wh/Tw4FGCEP5SixqCOQuWyMIgomF426YLZG6kUj0SkErjAiaDPlME+CoibBwi57xzH1vtI0wzFIfExS9nwU0E9pmgr3M9jZafmQQCmrjZJnhDTQmQm1wklXj15Y5FtXat7SNSpSd+ZBJuymamAFP6rktz4jYLoLVZA6vuGdd8Nyj0w64HKjPdIz9FjfbmYgzVadA3EIjXY6KqNDsBhcTszvIetDPyVUuJHqYXC9LFL82MY
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 06:17:15.8801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c94196b-2528-4689-30a1-08dec6b7eb7c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5422

From: Joakim Zhang <joakim.zhang@cixtech.com>

This patch set adds the clock and reset support for AUDSS. The AUDSS groups
audio-related peripherals (HDA, I2S, DSP, DMA, mailboxes, watchdog, timer, etc.)
behind a single Clock and Reset Unit (CRU) register block.

Clock and reset changes normally belong to separate subsystems and would
ideally be submitted as independent series. They are combined here because the
AUDSS DT bindings cross-reference each other: the system-control binding
describes the clock child node, the clock binding documents reset lines exposed
on the parent syscon, and the DTS example wires both together. Keeping clock
and reset in one series gives reviewers the full picture when evaluating the
binding layout, dependencies, and integration.

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
dt_binding_check independently. If reviewers prefer separate series for the
reset and clock maintainers, I can split and resubmit after this round of
review once the overall design is agreed on.

ChangeLogs:
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

 .../bindings/clock/cix,sky1-audss-clock.yaml  |   80 ++
 .../soc/cix/cix,sky1-system-control.yaml      |   47 +-
 arch/arm64/boot/dts/cix/sky1.dtsi             |   24 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/cix/Kconfig                       |   16 +
 drivers/clk/cix/Makefile                      |    3 +
 drivers/clk/cix/clk-sky1-audss.c              | 1175 +++++++++++++++++
 drivers/reset/reset-sky1.c                    |   36 +-
 include/dt-bindings/clock/cix,sky1-audss.h    |   60 +
 .../reset/cix,sky1-audss-system-control.h     |   25 +
 11 files changed, 1461 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-control.h

-- 
2.50.1

