Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.111
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794996351;
	b=igC6kg5Yu6mTCTf93JINf1rNfcOagNp+T/o+7EXYbEwUZ3IWmaMCn+yk4mKl/2hB1d4a
	 N/pPqu/x5HV4JKpaMPA2uS8FHDegFwAsBX4VTObWOEuC6AbugiZwtUNe0MjPHHwxvlRYT
	 Nz1V2SIdB/pwUGQ+bmZrWaSsPkoeGArWIYKaUnYATxehre3uE0YI0CJEpwN7lh1ujJJQ3
	 8h5ya13TrH1G5wWGrAEt11V8pAeP8lYrzfEK5wEew83EjD1rdEnhvCrwQ2CIH2OcL9Z13
	 VdvKaO8T926eLyQ+4KyAagebyzfCsRUmq5W4aPiXc43ySM9XqGxx8GHLK2EMfUnOXKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996351;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=h3kStI0zrXymP7fdkw2CLJl0UvqoNY8yDsThNXWzjZc=;
	b=rM/5JskBKOw/7bmrx9GJIYNNO8RfP7vfBniOYoGMhZUppTtAIsemAC5YbY4Mft70FZrI
	 QgBkihy5azkaXSodyB6KzDugvI5zrFQVV8z1mJR4N6D5ZfYcrRXr3HevBKXOvV4qwmOsC
	 Yycf5s14hT6IjMQ/RHG8AFXJkblYIoG6eFqW68pRRoqLe+CCUG1Z44IeyvqdNYtKAsyTA
	 /ZXPIP8gpHIhP8eKFBF1SscHskaBhPANXJF9MuAeAKgLxwQLmZRaxcxQ5VLM7KswGPbD4
	 m2Xiq7m5rckuEU1i1yHJAuJGnkjb4Mv21Pg0faztwK4R+FCYTL9IDbveeNogry94Hyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.111
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67A3606A320;
	Wed, 18 Nov 2026 10:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E67A3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ed3pWvH4ftYtjBlCbuycgHKs/86wZlDsgzA5iken41dsfQWFXowicD0zfOOHmwrvgsXmE3tbNoxrWQ2ttddb4H+8SyAJBtd9I57WkK1Bg3+2jXu+LWEGtrTeyUzBNKZuW5rNJEBy79Yp7iyoay6m8L7WCzWkvXWdF+QgcVu+WF4f6W3pNqIlLl313IbnJAJPapqf//+xSaElYkZHs4HdGJhQd2eyCPG8Pl8NPm8ZsJtx4uvO14yh7BaGS6ESfmCro9xRw2aIPKeHoePVEqnwPlyJvZf24Y5XX4YBZ92564hF7GhgLmOpzw+1HKM1X/Uw2o6Aw/u8feEgvJHHHv7hyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3kStI0zrXymP7fdkw2CLJl0UvqoNY8yDsThNXWzjZc=;
 b=UnWv4Fo97W9vPef8/Vf0pXEH2mruXV7NoU8hh7Z3Bbcsv3Eqt9RpqnyEU0WOyYm26VUCRoaGPCM+CUygtOhX+HvAylgYZddiAqVQ9BVB3yaeZqSVpGTFz5yJNqV5A0g2fJDqo6FytLjB96q3P++UrqbWoS6XnLtednvqfh+3jV2AJUNKKDyblAzZqd9hvyQbKy7CX2215GmxjVaXlTY/YBz7Ue1IHrAdN/jCmKWcFFNG3Wr5L4OCkLe7gNCp8iqZbkyCua6C0DrC4IsBV5c5MQXet1RDsg9VY4iYH2bJbPCjIDv0V5BApe90u1/H2LGuYpiw7xCasT5AnqBc0dpG+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 10:05:40 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.009; Wed, 18 Nov 2026 10:05:40 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 4/6] clk: starfive: Add JHB100 System-0 clock generator driver
Date: Wed, 18 Nov 2026 02:05:21 -0800
Message-Id: <20261118100523.11395-5-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::25) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1170:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a3164d0-5434-46ea-9706-08df455b801f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|23010399003|1800799024|376014|366016|261009223027099003|261026140227099003|38350700014|10067099003|261021121427099003|261021135927099003|56012099006|261021130227099003|261021133027099003|261022105027099003|261022115727099003|261022113327099003|261102123227099003|261022075727099003|261026135527099003|261021123027099003|261026130827099003|261028144727099003|261026121527099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	FdPvE43yjrw4G4jmgczTboMi2lKT07T68wl5W8n1vL4DM+lq2bnnZC5CvB52HsseEjD65zSDEaQPPcCCuEUpar/vstzAmURAtAyR+wGk8MTRg3fiLSdr+qkyIv+IOEO94xMbwEW7Sw3mm5B6r1w1xXoYvngUKfqBUSnV6zscwBVfEo9OElJdUcJe85f2rMe6SfNmJmVTC66qN1M3tyedr8i3weZDXuFa2RdmLAv5xZBq76dUuuQlXY4bbJ7C3u+zvGucp1tmOV0tXgvpVmF1eVhSIWxvpfdokf/kTEcO+PDvRtZrosJtz1+a1mhEEs1bAmoqvkM+7yau/DDS3HQrjuncT/XdFDX+RKi8dq/55sE5ZeVcowmoALDkVlU9G8Y5NBlENH6lIJwQjddsfbtjMM3W8cf9QN4r+Qpqc8KHe3wxzcuRAnD6X7vEYLYQ4DgNfT7HIyFqdiIg0qOZvoxeTqlhjAv5rXpjsUrH0hjqYuvSxLHjH6VNBJ0T+qDKUyQTqz83U2WMT17oqYPVhrZJHBrWI1kR46Nv7+jvlXsW9OIxmnhii1Vpz+gr1Eoui6Me
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(23010399003)(1800799024)(376014)(366016)(261009223027099003)(261026140227099003)(38350700014)(10067099003)(261021121427099003)(261021135927099003)(56012099006)(261021130227099003)(261021133027099003)(261022105027099003)(261022115727099003)(261022113327099003)(261102123227099003)(261022075727099003)(261026135527099003)(261021123027099003)(261026130827099003)(261028144727099003)(261026121527099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B7vf15HekvnFHwjfiXBrzqbcw8bBSomTy3S50fb1KNYWjxug7foDV4R9pqSJ?=
 =?us-ascii?Q?lSmyylOILAf2jor7r1xb1wgs4l08/KVSKdL4waI4eYCUVCQ5XmXYUinvMDvo?=
 =?us-ascii?Q?BCM2H6aBPcN/2UQzzKBzXOiEe4jxh3K/3wc+M59i5+1H0lrql04h516qA+ZZ?=
 =?us-ascii?Q?FSfOZ+DJp1D9A6mKLqtDi3PMTe3PZQdjIdh4mtzdzkbXJwwk3SND/MVQryhw?=
 =?us-ascii?Q?ERxf0JrTlWXb17lqVaepG8rBwTqqq095V+dHwHmPz5Bd3Qj5xAHsA3fIhuZM?=
 =?us-ascii?Q?q9HU8nSsDOUhOiLlkHECJFJr3TKElrqp/yDU606RhQZkpIn3PDzZ4rkD1A7P?=
 =?us-ascii?Q?1V4w84FsOAUYhAu0FJq5On/OxAO8OKu+Hccb8ACbr6iphskKW2SF1oJN01V2?=
 =?us-ascii?Q?KdiaT89+7PEbZFmS1HSE41Jzd1DOmZdAkfQwIUYwXK53d+ZTUBipGhVUaO4i?=
 =?us-ascii?Q?O0xJcvE2C1QT/xkboYftnzHkHzLmYtkxqO+PFQdayLbRoh+OLTf+SlT5r+2N?=
 =?us-ascii?Q?pCwtdCrll5Jb/yGX4O1fDfYZ2YDscxqAhFxMqcEwj7gDVd/rmSpr+rnJGL5r?=
 =?us-ascii?Q?bu5dBJNjVnlhassjVNIXsP5L2X2mlfzdGl8JiLrM9Fk5fhXr9VHZPEebplZ9?=
 =?us-ascii?Q?4RI29W4UJYAb0mYd7Ylz97tfjcjK26jIKP9Ou/7Y4EcXnqSNHBceunULm8pB?=
 =?us-ascii?Q?C2H0knK1e9jHe/r1Cb2L6smL44VRz0nxmvS0WqV6oDoSu5q3UpE2A8Ny1m23?=
 =?us-ascii?Q?Sva7Ztixpn5q0JBHFFhoN16HHK5LM8Lkj0wUSamCQ7YoiyIYluVFNwZAXPhK?=
 =?us-ascii?Q?w49UyHFLsXbhtSp/ZbqPlpjlVZH26giBVc9c7xNY3wpdibPWZ/qBWekYuzNs?=
 =?us-ascii?Q?9vKtehJ6Tf6745KLFmJ2bOqjXofONrLz1syWDcavXQUPjApAmj0gxx0sEQXj?=
 =?us-ascii?Q?wB4fE0rTkYFCEYjhKUCARs0Z049M+9OeZ4TVw6mEs2Sriq610iP03pAyGEuT?=
 =?us-ascii?Q?FmczGagB+0IjlIO2tbkfxdul0b/6gppO467L/JGtoq3J1H9LMFW2OBU6X/CI?=
 =?us-ascii?Q?ilwO3L439JTpQZsjhvXhtMB1ZjhsHhMXQidueCqglDNmDQB2oTTcmohA6PJH?=
 =?us-ascii?Q?PEeyEtBGmzUtflbAzi4ZjdvbbgrKHHynTEfvRu7/jo1pwIuX1hyWldhW/5Tu?=
 =?us-ascii?Q?5CT5PUcuKvj+0fkkFVDHqwju7flxZKn6yvYGsjQYoS8cUfRmZ64nTv6U8QXY?=
 =?us-ascii?Q?Lj5eBSqAOuIdrFkZ4i+Fo6Es07oI6FSTbL0p/hbcYP/NtZQ5+ZUzd6tcV75G?=
 =?us-ascii?Q?NelN9864ZHpCG1Ze3Fyq+lDLXI3DxiIf8PTsuI5H5XUULMJrLHpVH+6pBIhU?=
 =?us-ascii?Q?XjRhrE/PK82ob8OlZ3TEmKb+k7xR2KQCa13JekoiuQ7eGuwK+x23oV4gRuAX?=
 =?us-ascii?Q?551LZ6CRk28B/mGYjjWMjRCckb+lGyX4EuqyAJR2xYE0DOqVfUsn7S7NBhMw?=
 =?us-ascii?Q?LSJReHj+hWgcpOVcXcRTT6dc2uLs8rjj3QYtAXqJVBLMMY5cv5GEVZCTAPSM?=
 =?us-ascii?Q?eex0Rh6BcnFprfHAKjgMNlFZsfY/RJJiWaQv22HRB6adtUTD1mVHCRlP+acu?=
 =?us-ascii?Q?686321qFtq064I9XEr0+tOagx694IYsyvDmGKWeu0B1CthucsfbIqQoO3sNW?=
 =?us-ascii?Q?c40lEM9kHjL24whbIc0xIPb9MenU6vIKZXI13cUn9NDSyCISfY9i5glFIbDy?=
 =?us-ascii?Q?OU+RgkQSx2lpR2xDhbYU4lkKtUdedviPfLpncHks3yFt0o7ZxM55?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3164d0-5434-46ea-9706-08df455b801f
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:05:40.4953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7d1AzRbU5TF87kqdwwZtvnseqeDWwb00nCB51Ke41Jge+80nKI/bkmdT/s8p2G25vdlDC80ONdEwgFIjQ+oKnOfucod81sWIjHaPx9xiNFAN2oHbW22RjwOUG7jWPB2P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170

Add support for JHB100 System-0 clock generator (SYS0CRG).

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                   |   7 +
 drivers/clk/starfive/Kconfig                  |  10 ++
 drivers/clk/starfive/Makefile                 |   2 +
 .../clk/starfive/clk-starfive-jhb100-sys0.c   | 137 ++++++++++++++++++
 4 files changed, 156 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 36461742efb2..a891c9046eca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26907,6 +26907,13 @@ F:	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
 F:	drivers/phy/starfive/phy-jh7110-pcie.c
 F:	drivers/phy/starfive/phy-jh7110-usb.c
 
+STARFIVE JHB100 CLOCK DRIVERS
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
+F:	drivers/clk/starfive/clk-starfive-jhb1*
+F:	include/dt-bindings/clock/starfive,jhb1*.h
+
 STARFIVE JHB100 EXTERNAL INTERRUPT CONTROLLER DRIVER
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 S:	Supported
diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 51716655554f..cb246ae12c08 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -72,3 +72,13 @@ config CLK_STARFIVE_JH7110_VOUT
 	help
 	  Say yes here to support the Video-Output clock controller
 	  on the StarFive JH7110 SoC.
+
+config CLK_STARFIVE_JHB100_SYS0
+	bool "StarFive JHB100 system-0 clock support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select CLK_STARFIVE_JH71X0
+	imply RESET_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the system-0 clock controller on the
+	  StarFive JHB100 SoC.
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index 199ac0f37a2f..d2ba83d7d02c 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -10,3 +10,5 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+= clk-starfive-jh7110-aon.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
+
+obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys0.c b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
new file mode 100644
index 000000000000..74bcc6ffb177
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JHB100 System-0 Clock Driver
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ *
+ */
+
+#include <dt-bindings/clock/starfive,jhb100-crg.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+
+#include "clk-starfive-jh71x0.h"
+
+/* external clocks */
+#define JHB100_SYS0CLK_OSC			JH71X0_EXT_PARENT("osc")
+#define JHB100_SYS0CLK_PLL0			JH71X0_EXT_PARENT("pll0")
+#define JHB100_SYS0CLK_PLL1			JH71X0_EXT_PARENT("pll1")
+#define JHB100_SYS0CLK_PLL2			JH71X0_EXT_PARENT("pll2")
+
+static const struct jh71x0_crg_clk_data jhb100_sys0crg_clk_data[] = {
+	/* bmcpcierp */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN, "bmcpcierp_ncnoc_main", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG, "bmcpcierp_ncnoc_cfg", 12,
+		    JHB100_SYS0CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS0CLK_PCIE_REF_CML, "pcie_ref_cml", 24,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_DATA_INIT, "bmcpcierp_ncnoc_data_init",
+		    0, JH71X0_INT_PARENT(JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN)),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG_INIT, "bmcpcierp_ncnoc_cfg_init",
+		    0, JH71X0_INT_PARENT(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG)),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_TARG, "bmcpcierp_ncnoc_targ",
+		    0, JH71X0_INT_PARENT(JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN)),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_PCU, "bmcpcierp_pcu", 0, JHB100_SYS0CLK_OSC),
+	/* hostss0 */
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS0_NCNOC_CFG, "hostss0_ncnoc_cfg", 12,
+		    JHB100_SYS0CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS0_NCNOC_DATA, "hostss0_ncnoc_data", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS0_PHY_SCAN_400, "hostss0_phy_scan_400", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_GPIO_ESPI0_EXT, "gpio_espi0_ext", 14,
+		    JHB100_SYS0CLK_PLL2),
+	/* bmcusb */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCUSB_NCNOC_INIT, "bmcusb_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCUSB_NCNOC_TARG, "bmcusb_ncnoc_targ", 6,
+		    JHB100_SYS0CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCUSB_SCANCLK, "bmcusb_scanclk", 5,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCUSB_480M_SCANCLK, "bmcusb_480m_scanclk",
+		    0, JH71X0_INT_PARENT(JHB100_SYS0CLK_BMCUSB_SCANCLK)),
+	/* vce */
+	JH71X0__DIV(JHB100_SYS0CLK_VCE_NCNOC_INIT, "vce_ncnoc_init", 10,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_VCE_NCNOC_TARG, "vce_ncnoc_targ", 12,
+		    JHB100_SYS0CLK_PLL1),
+	/* bmcperiph2 */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_NCNOC_INIT, "bmcper2_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_NCNOC_TARG, "bmcper2_ncnoc_targ", 12,
+		    JHB100_SYS0CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_CFG_400, "bmcper2_cfg_400", 8,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_CFG_125, "bmcper2_cfg_125", 10,
+		    JHB100_SYS0CLK_PLL1),
+	/* hostss1 */
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS1_NCNOC_DATA, "hostss1_ncnoc_data", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS1_PHY_SCAN_400, "hostss1_phy_scan_400", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0_GATE(JHB100_SYS0CLK_HOSTSS1_PHY_SCAN_400_ICG_BUF,
+		    "hostss1_phy_scan_400_icg_buf", 0,
+		    JH71X0_INT_PARENT(JHB100_SYS0CLK_HOSTSS1_PHY_SCAN_400)),
+	/* npu */
+	JH71X0__DIV(JHB100_SYS0CLK_NPU_NCNOC_INIT, "npu_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	/* vout */
+	JH71X0__DIV(JHB100_SYS0CLK_VOUT_NCNOC_INIT, "vout_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_VOUT_AUX, "vout_aux", 150,
+		    JHB100_SYS0CLK_PLL0),
+	/* bmcperiph3 */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER3_NCNOC_INIT, "bmcper3_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	/* hostusb */
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTUSB_NCNOC_INIT, "hostusb_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	/* hostusbcmn */
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTUSBCMN_CFG_480, "hostusbcmn_cfg_480", 5,
+		    JHB100_SYS0CLK_PLL0),
+	/* bmcperiph1 */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER1_NCNOC_INIT, "bmcper1_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER1_CFG_800, "bmcper1_cfg_800", 4,
+		    JHB100_SYS0CLK_PLL0),
+	/* bmcperiph0 */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER0_NCNOC_INIT, "bmcper0_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER0_CFG_400, "bmcper0_cfg_400", 8,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER0_CFG_800, "bmcper0_cfg_800", 8,
+		    JHB100_SYS0CLK_PLL0),
+	/* gpu0 */
+	JH71X0__DIV(JHB100_SYS0CLK_GPU0_NCNOC_INIT, "gpu0_ncnoc_init", 10,
+		    JHB100_SYS0CLK_PLL0),
+	/* gpu1 */
+	JH71X0__DIV(JHB100_SYS0CLK_GPU1_NCNOC_INIT, "gpu1_ncnoc_init", 10,
+		    JHB100_SYS0CLK_PLL0),
+};
+
+static const struct jh71x0_crg_domain_info jhb100_sys0crg_info = {
+	.clk_data	= jhb100_sys0crg_clk_data,
+	.num_clk	= ARRAY_SIZE(jhb100_sys0crg_clk_data),
+	.rst_name	= "jhb100-r-sys0",
+};
+
+static const struct of_device_id jhb100_sys0crg_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys0crg",
+		.data = &jhb100_sys0crg_info,
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jhb100_sys0crg_driver = {
+	.probe = jh71x0_crg_probe,
+	.driver = {
+		.name = "clk-starfive-jhb100-sys0",
+		.of_match_table = jhb100_sys0crg_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(jhb100_sys0crg_driver);
-- 
2.25.1

