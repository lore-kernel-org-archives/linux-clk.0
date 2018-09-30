Return-Path: <SRS0=xqQ/=MM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3269C64EAD
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E370206B8
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="OxMLRmjt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E370206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbeI3HmC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Sep 2018 03:42:02 -0400
Received: from mail-eopbgr10057.outbound.protection.outlook.com ([40.107.1.57]:48520
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbeI3HmC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 30 Sep 2018 03:42:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JiNDCbdVke6aSNLVlAA4EoO+zlcoKx+Da+ueQ9rJFM=;
 b=OxMLRmjtHruMrig50lvOiTmWnk+q3QCSPmqqtozVDe7EgMQOQ0sYPVEB3KRZbiCt0db1YWxqDwJ6X37NTXalpDVe1aFC05ESfjFlBvJSXge94w0uiwDSizp1gcb3p6BSDpygerk38O4mMz6eXVyBAZU6PO0wG71EjJ0zOejc5Dk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 VI1PR04MB4221.eurprd04.prod.outlook.com (2603:10a6:803:3e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1185.22; Sun, 30 Sep 2018 01:11:14 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V3 01/11] clk: imx: add configuration option for mmio clks
Date:   Sun, 30 Sep 2018 08:56:16 +0800
Message-Id: <1538268986-24890-2-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538268986-24890-1-git-send-email-aisheng.dong@nxp.com>
References: <1538268986-24890-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK0PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::15) To VI1PR04MB4221.eurprd04.prod.outlook.com
 (2603:10a6:803:3e::20)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9194ef50-6ce8-40f7-3a34-08d626719fb1
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR04MB4221;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;3:HoaJQFXNIUtpql68viJw7NhZnwGKlkPmUtd96MrM0mnW8FlspRmw83OA5Y5+2YONNRP/mSOsBm7vaBKudCONMb+EKHWuL9OOtzjgLIHplACa+5svydYLaE05DvBcVaW8seRmRD31rZ+Ea8XT5XjwLCvB4M9Sx2OZeeWxgUCAq2Jfiwy6iJTqzaQ6Mph62Jar7p4uz/8RZ9RjbrjFQ+43c1h++U/+tzGawVjAfzeDwG7m5Y3Yh/1v2VF/Txf5A0EB;25:/guKz+0YhF725uRWhZtLO4NFmN63zPL1X8KPEIjhHvX6ohYxF+fXVoCApfXJ79WhvZuq6gVg+2L5UV00XMEjyrAJTbuwlXiz5cMd+St0fUIKc5I6bjkeaJxWOuAYHFXJR9tLUvAxVfJd7Urau7LDYZqwi6LYSelyF93C37PydyHqqKIo6NfSPTL329CAmkkSNYjvW/FuyazOmlGl4f4BM1EMrvStCdy349V4rhi8BnxRo7FCzl/rrRzxnsMzNILice2qxolOh/mH5M8b82dmMihZbo8eizXYUfVB1cAEYf4Xiyo+4obOc2HPv9bHmQaZ31SJlFkV0dSc8qqRmbznXA==;31:vsi/k/w0lg0W+R6kMakhQDwYy12Ka8cWqH/PcnWjrJfNp7xlFnlh+3/bYoDgmUfLrO12jsDNEHl8aFUTXhF49WFQVwzJkEuyJ1gdQh8vWiooryXHsyUDMYbp245R+T/ruLp3pYSXTDmRJPcYY4e6lFxC1F94YbN3CJH0HLWVo8x7SacvucnNeufRrOXGnCQM6eztBPbqyN44lno+Wx13dR0l/APlfJX488NXpfphJfs=
X-MS-TrafficTypeDiagnostic: VI1PR04MB4221:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;20:45j3iEb9wRqh2q8IJW8HHCFZJU3W5cAJqC2VcnV7Uyc8wAX2nTAvGMooif2TLx5nvPswpbcAIllNW+lDdAKWi2sgD6UAa4y9V/D6ZtFk8uEmCDutEoRy1MQiWdq9CHyszdVWDhLB/AKrkkdmW6LSUgLJanHwjW7gzudSZ96IdwzOZ00iokmnCNIzCmpbRpLfWUYfvHDLv1NuygdtAWLoDtyS08Mb8cgFhTh1aEK1nLGX32kzCqmtDou5gti9y4NMSFVevUP6n0/+p+t13YutbXEVqG7ju3v/eEmvU4Qd1ApMF9XNSerE4tVKbVj9NhyZ49HqLAvhIRClMzLm074lLdRiu/eV5ur2t7/z63iH8164DGGaeDFpyO88fyB86PxPqIc6Si/1MTMaBaM7hM/Z+cl00/G+TWbnMP0noPuNhjVyggO0g4LjpoLsVdWX82/t6szDFDXL7M2cplal0qKA1AZLFSO6UOUC+K4m08US71L3hAMwmhTmFLaek/uBVfaT;4:zY9iSlCjMgIRmh90mt5O7vSxb/IyK5j+wyQXGIFRKzhhkEiJ28ePRkIauceXj0fE9gRosbeFvqKm8Eyh4P7l85qEJHHMKQTys+rGm/Fd1/0U9bV1+fVMM3UxVI22isUTbc5OFl78KrzeFf94g1QbgSFLZz9J6vPCOrppWEuoA1tGjuUplbvu7ED4C3jjDmRJPgV+wNW9ezLY9CBZ5AuP1ltDk8ij10wsw2TKsgkN9438GIgligw9sjP6gFdUQTfCU7Ll7BgCv7KB63lyerX/cjP1UShDojwzraJAlso6943kJAlUsLQlWtHNzTrA4u6y
X-Microsoft-Antispam-PRVS: <VI1PR04MB4221561226EB085778AC114380EE0@VI1PR04MB4221.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(10201501046)(3002001)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(201708071742011)(7699051);SRVR:VI1PR04MB4221;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB4221;
X-Forefront-PRVS: 08118EFC2B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(366004)(189003)(199004)(14444005)(6486002)(81166006)(81156014)(66066001)(6512007)(8676002)(52116002)(53936002)(11346002)(446003)(2616005)(956004)(476003)(486006)(6506007)(48376002)(26005)(2906002)(47776003)(386003)(6916009)(478600001)(97736004)(68736007)(50226002)(5660300001)(8936002)(6116002)(50466002)(3846002)(76176011)(51416003)(106356001)(25786009)(16586007)(4326008)(34290500001)(186003)(16526019)(2361001)(2351001)(316002)(105586002)(36756003)(305945005)(7736002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4221;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR04MB4221;23:X1DR2rh9w0VOvRhvlRkVym8pG8EnhFhF41Fi4nBOQ?=
 =?us-ascii?Q?PFXbwR+mVyzxWyrmOaPYybZLysR96HoCHC3qFU6ivYyWyuZHf5coo01ZX/BR?=
 =?us-ascii?Q?i+piyL1XdD3oIvypkY0M11WudH4krWBhKoYfm0X18WFJsPmyzPa2eDQWuzRw?=
 =?us-ascii?Q?ETGRRFi2k7jKHcwRFmqCZEGdGnxP+W2bQki5yU/l+tL6R8Bx1FkSY5wRS9L1?=
 =?us-ascii?Q?WnXT94NZTocWPlbxStykP7v4h2iYP9nB2EWC01VGeM9LY9fHBWQcScWuyJBE?=
 =?us-ascii?Q?6MZDoXs4ZlXTRx6FKTRZiA7vn/gkMiT9CFn3GgYbD1xHi2FiZoMTmvIxidf6?=
 =?us-ascii?Q?Bo+bE1v6+Yh/sZfy7v4Vq4cbppTff4QO9VcTh+2liCe+OQn//c9OOA/r35Ve?=
 =?us-ascii?Q?F94HkN6BpTlw22yejUVJ39At+yjd455FeqtbgsuUWfKGTdjF0snxg/CbgvuK?=
 =?us-ascii?Q?w65G47zTlPRGKPXVp4rJ/eSDyoZsHOIGnMo8ZAQaPlGgKYr6hc9FkoLverqi?=
 =?us-ascii?Q?t9KSGRuhlIb8vYW79QN+Sm5KyLpAmUbo+BebgbQ5QS5KJRqgmfzUK/RearuI?=
 =?us-ascii?Q?Ac2V5YJsDBFl76dA8IFmsOq1gWPsEvwB628CgcSlT9SOtP8IoI53JERf+uVs?=
 =?us-ascii?Q?GxwJm2iKruHbsj9n6OYr0veJyCcN0PBthHqs/u+4XRMzWKsezbiVA2QoHQx6?=
 =?us-ascii?Q?6iXrsfragvbxu6B/U7ZqbKWs3+lgBIqZJCZ+rvYIQHkXR/B8mOtCB9m7EXvA?=
 =?us-ascii?Q?6aCBKdUYaY2CeeucNoTCiY3ar8Bc0l3s1bxZox/7xfwoIz+nCsvcOiAb5WNq?=
 =?us-ascii?Q?jxb+hMJFz7g6Ho55rs9KL6GK+5K3U930o80wGKmzKigEvOAVgX/0QeOMFHSG?=
 =?us-ascii?Q?WKw56rbxHuqJo7eKclj69oGHDQM2l0C7vbsnKryqCGJSzS1FktrI1JvfzS0G?=
 =?us-ascii?Q?WFHRuWBBX7ybhpR1xBUm73DmPNeDVC4rNzk3vf5wFUgbvjdUjr4SC/96KLfj?=
 =?us-ascii?Q?ibvcOyOhy3Rp2cEfZoev30hUVOrdbLoHSMq+wm8GYVKQOnEqhUXHxID800/G?=
 =?us-ascii?Q?2I5YVfRbm9JSVmjkphhSu6/IWiIRapZGbhtxOu+9V1azqIo89Urfr+0X1em+?=
 =?us-ascii?Q?AOJ8aIeo7e5XoRHskFLVNG8Q2T9gd1kukC7yNx/54ZFmAHFWOPBXlSFVqP6m?=
 =?us-ascii?Q?C5t+0qpIs7J85SnwIhfIcZPrXejT8mW+v3SSE6PKRRbIyS73MAB+n42sQ=3D?=
 =?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: clNnxYSR+DAC74a1hBpGega7blMRS9ycOV4iQyurGsy7SPllUUN3NComklpG4ol9S6xxShOHONFDhLqaND2GOgsiNFjzqf3DZ+4pbbAOP0HrzuDBt8EuDqljTsEsqRVeh7hvJ5occhLeaQb1LezGj7H4h+Uuvm07aU/oaiboJ6aLi9qYyqUhE89N85/08SPy+O1lyxDKUOvrAreEL5om/prG1ypRbo1PX//2oQnyRNjhJ8+cfoA0CTJyirYLowpvMIBPuJvQMgwhLElpPGNicQxUGeuwjtMtIpo1TxHn3H2rQzZHPa0cTsUpvD0rBGxxbFOXEQ6FZHbEFP2rXdA8NlJip9nYREjkRDZ5Xo7Sn+Q=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;6:VkHccRmYTtPD8sGEWeFhd2H0qilaTtZ82IcAU5a0OJ9/WamSJ5uKt8u2I3EYqlbXbIXD6GlI6ihO2xtcRz5gas2xE6iggbdhRp3y4whRcDJoiAM5owR9OdNVfFNY5S09TGM1hX9r/wKwhAmed/ILN8iUy6auwxXQm4VsEq9CBdK3fiDg33d92TsDJM4t7W2T9ztleUm+mMLR1+xYhdgZ7VccDFaoLPTgaZYKDLcD2oMbRnYhWVZdQwje0BRDek0Pkg1t3LCV3IANae8tu3ZzPM3TR+cqC9V/YXxXYYXDD2FDAm0ZVKR/+jlKdn3G1OZbxeEKZiN4meFP4q8mv7uGAkRBfoRlzmr4KcoGivmWXmssmtVFMwpaz8wUXsVI2uxsOVmXiVHBLD0f1I2+6Z18WQwakdb2mwnI+vxBrCdb8VBgIALo0sdQ6NcQoU6btOZB90n0M/o0gSUekayttrzTrA==;5:judWhNVTAdD8CcaVQLnXDJYFbmut2JNbTNGE+HFQ1Dtl0rrp2yJGZ0Pwg2OpIF3clDM33+1FFN4oOa1wzL3jD2v78RX+BG2Ftl5hM8E91ThHiwsk/mEHSbIJSjvoZ4YIdDDgLv5RprSMG/UFh5a62eVAD51kxrJCCrWH+MuoxzI=;7:tSEAHxaJK9PL9r4ta4cg8ScFDvO3l5Q19v15n5NmoM6JwadksvrImqsU2qHeP6sfbpAVNqaCd2s0K/qDUVbM8cYph+SrhvEgRYPg+hJwS30PWzlHfZ1HbCNRLB3ADOxxysQRVVjxA+RKQLmOt6Q8OamzwnxUYgcj8wlVPiEI0ae6m0NtzjLZjluohphko+5NDz1X8T2fDMAlZyvfzAc0hJfE8aQN5RZ20T41uG/0Vxv+GrioBUKWK0qc7A737Qid
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2018 01:11:14.4386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9194ef50-6ce8-40f7-3a34-08d626719fb1
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4221
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The patch introduces CONFIG_MXC_CLK option for legacy MMIO clocks,
this is required to compile legacy MMIO clock conditionally when adding
SCU based clocks for MX8 platforms later.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 arch/arm/mach-imx/Kconfig | 11 +++++++++++
 drivers/clk/Kconfig       |  1 +
 drivers/clk/imx/Kconfig   |  5 +++++
 drivers/clk/imx/Makefile  |  2 +-
 4 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/Kconfig

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index abc3371..11a9661 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -57,23 +57,27 @@ config SOC_IMX21
 	select CPU_ARM926T
 	select IMX_HAVE_IOMUX_V1
 	select MXC_AVIC
+	select MXC_CLK
 
 config SOC_IMX27
 	bool
 	select CPU_ARM926T
 	select IMX_HAVE_IOMUX_V1
 	select MXC_AVIC
+	select MXC_CLK
 	select PINCTRL_IMX27
 
 config SOC_IMX31
 	bool
 	select CPU_V6
 	select MXC_AVIC
+	select MXC_CLK
 
 config SOC_IMX35
 	bool
 	select ARCH_MXC_IOMUX_V3
 	select MXC_AVIC
+	select MXC_CLK
 	select PINCTRL_IMX35
 
 if ARCH_MULTI_V5
@@ -417,6 +421,7 @@ config SOC_IMX1
 	bool "i.MX1 support"
 	select CPU_ARM920T
 	select MXC_AVIC
+	select MXC_CLK
 	select PINCTRL_IMX1
 	help
 	  This enables support for Freescale i.MX1 processor
@@ -430,6 +435,7 @@ config SOC_IMX25
 	select ARCH_MXC_IOMUX_V3
 	select CPU_ARM926T
 	select MXC_AVIC
+	select MXC_CLK
 	select PINCTRL_IMX25
 	help
 	  This enables support for Freescale i.MX25 processor
@@ -442,6 +448,7 @@ comment "Cortex-A platforms"
 config SOC_IMX5
 	bool
 	select HAVE_IMX_SRC
+	select MXC_CLK
 	select MXC_TZIC
 
 config	SOC_IMX50
@@ -478,6 +485,7 @@ config SOC_IMX6
 	select HAVE_IMX_MMDC
 	select HAVE_IMX_SRC
 	select MFD_SYSCON
+	select MXC_CLK
 	select PL310_ERRATA_769419 if CACHE_L2X0
 
 config SOC_IMX6Q
@@ -545,10 +553,12 @@ config SOC_IMX7D_CA7
 	select HAVE_IMX_MMDC
 	select HAVE_IMX_SRC
 	select IMX_GPCV2
+	select MXC_CLK
 
 config SOC_IMX7D_CM4
 	bool
 	select ARMV7M_SYSTICK
+	select MXC_CLK
 
 config SOC_IMX7D
 	bool "i.MX7 Dual support"
@@ -561,6 +571,7 @@ config SOC_IMX7D
 config SOC_VF610
 	bool "Vybrid Family VF610 support"
 	select ARM_GIC if ARCH_MULTI_V7
+	select MXC_CLK
 	select PINCTRL_VF610
 
 	help
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 292056b..09eba54 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -287,6 +287,7 @@ source "drivers/clk/actions/Kconfig"
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/imgtec/Kconfig"
+source "drivers/clk/imx/Kconfig"
 source "drivers/clk/keystone/Kconfig"
 source "drivers/clk/mediatek/Kconfig"
 source "drivers/clk/meson/Kconfig"
diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
new file mode 100644
index 0000000..43a3ecc
--- /dev/null
+++ b/drivers/clk/imx/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+# common clock support for NXP i.MX SoC family.
+config MXC_CLK
+	bool
+	depends on ARCH_MXC
diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 8c3baa7..d447f8c 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-y += \
+obj-$(CONFIG_MXC_CLK) += \
 	clk.o \
 	clk-busy.o \
 	clk-cpu.o \
-- 
2.7.4

