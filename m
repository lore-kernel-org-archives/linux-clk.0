Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C79E9C282C3
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:31:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DBA6218D0
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:31:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="edpY+Mev"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbfAVJby (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 04:31:54 -0500
Received: from mail-eopbgr00068.outbound.protection.outlook.com ([40.107.0.68]:50861
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727505AbfAVJbx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Jan 2019 04:31:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNeNxVJ0nCHxv19W0piYK+uUVb05PN7ADIm7epFpB7g=;
 b=edpY+MevXy3LLmj62oXIerqAfLBtGkzGHym2YvlLOw+jGmnc9wCyqCXdxNwCwM8qMMLLksOw7Jd/yPUr4E4MkNPeTD8QhapI+u8ntBOU/nO4UR9JZxSuyMAygc7mC7UJen7TNHIvElDmyEFRK2bu8WDNsltzpnLfUeWjcsUu2zc=
Received: from VI1PR0402MB3519.eurprd04.prod.outlook.com (52.134.4.24) by
 VI1PR0402MB3391.eurprd04.prod.outlook.com (52.134.1.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.30; Tue, 22 Jan 2019 09:31:47 +0000
Received: from VI1PR0402MB3519.eurprd04.prod.outlook.com
 ([fe80::85ec:f90c:2a0c:20d3]) by VI1PR0402MB3519.eurprd04.prod.outlook.com
 ([fe80::85ec:f90c:2a0c:20d3%4]) with mapi id 15.20.1537.031; Tue, 22 Jan 2019
 09:31:47 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     Fabio Estevam <fabio.estevam@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: imx: Add clock binding doc for imx8mm
Thread-Topic: [PATCH v2 2/3] dt-bindings: imx: Add clock binding doc for
 imx8mm
Thread-Index: AQHUsjVL0ajxCDKGH0y2aoN8eo2PJA==
Date:   Tue, 22 Jan 2019 09:31:46 +0000
Message-ID: <1548149769-32267-2-git-send-email-ping.bai@nxp.com>
References: <1548149769-32267-1-git-send-email-ping.bai@nxp.com>
In-Reply-To: <1548149769-32267-1-git-send-email-ping.bai@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 1.9.1
x-clientproxiedby: HK0P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::27) To VI1PR0402MB3519.eurprd04.prod.outlook.com
 (2603:10a6:803:8::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ping.bai@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;VI1PR0402MB3391;6:WOKyRheVX43dPerllT5LkUPCI4mj6WRINudJbbkviABb3cvPs9EwALBULriHJd1NJ1a0J7gnajaGpZ+amfjyMT8y+KtoFuAAD1fKzBL0QkYuzdVWXZdN1hSOImFWj8g4Arlj7/8Zh/v7pt8aSMC/+C0nM2VY20lQd2PzivRPL1QCQvjcS5hDEopZ6cYHUSzaiOoobjMisys2qPbR1Wq84d05kpLHLR5hzQ1PxfAILllxaUUyOQ6//X21FVcQSPtr7qoM1GQc/WiOV4vamQ74Tr2uGQnvQUvz4n8nbIpQPXHPQNkm80SAkiH/WezlvWSt935IoZTlY5PwrHpoG1cf2x/LqAgICWsLDQGfOvZhFrQbCXN8yvOVo5HmGUWZMCUxtE/sB/jml4H1dRPEkaVHhur4OjC+soh98ZKrnvnHbB0wG2SGsvMmOrLbxequzav519yqDSLbVFa2ytRYua8ScA==;5:wbJTroZS24tIqSrexFdEtO3nlICjOlPIEslL/9xR8nwt3XVLswW418z6nhyutbp5tIiANqf7XuHOmYDcFluqL67W94eTSKN7erXMpibURvyigpE1Jc6urin3scRJvbYaYkU+fyszx4W3NxLWWZagixasmg8OJmmhbI8vswEeTaX9uLkDUI3DhRomVQDf1nJ/m6iQkuxc6SR+B+y8oRQ2tA==;7:2A9317iBreSRT59oNEhzPx+uvhnKM8cUOpsnGr9bpxb7fviIWnfuTTJJXvhbWE3VPzTdnwVe4xnJUSSvlX6Bokv6Jz/2x1siEhvIfDOoC2gTONnqikuAcNBMnC7XAvPmVuU6rl/gOjRDH1UnnqqFzg==
x-ms-office365-filtering-correlation-id: 33baf3f1-a8c0-4dc0-4887-08d6804c6daa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR0402MB3391;
x-ms-traffictypediagnostic: VI1PR0402MB3391:
x-microsoft-antispam-prvs: <VI1PR0402MB3391DABDCF7DB719F4C40EDD87980@VI1PR0402MB3391.eurprd04.prod.outlook.com>
x-forefront-prvs: 0925081676
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(376002)(346002)(39860400002)(136003)(189003)(199004)(8936002)(2906002)(66066001)(81156014)(50226002)(25786009)(81166006)(97736004)(4326008)(316002)(54906003)(478600001)(14454004)(110136005)(99286004)(68736007)(76176011)(36756003)(6436002)(6486002)(8676002)(86362001)(386003)(102836004)(6506007)(186003)(7736002)(305945005)(105586002)(26005)(106356001)(486006)(6116002)(3846002)(476003)(2616005)(11346002)(256004)(53936002)(6512007)(71190400001)(71200400001)(446003)(2501003)(52116002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB3391;H:VI1PR0402MB3519.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1tF1PsgvZwlccNUtWDUU5BMuUnmWY2kwG5r2DEjcXT1IG46mN9rVNr+4O+Yu+T6ElqfhWMyGrSHByaktNHX+IgT7RUzZ5kSZniYsgU0qhlPXsHNvPYqs0zU5WdhN5noDefxO2YkthSSHAQmc8pYoJIdbP+ilcFlchyUMIf3ogJsVK0yDiaK7lnwdvhOuHQ0QHg9auychTaHRA9dVH69+uasqnEpdY1q4bj0l/gPs1xOE68h0VwBe/Qpi+3dUXROo/SkP4Vfr7sFggFCFDPgUmrEaZ2aJyxX9J0jWgjcdoZxCAlegKQM282ov2/VDLEJvW3OU77BnElgkc5ATbX0GJavKiSCawMiiIrS4uuEgSUtNUadGT4aEzfmi+z4PnxZc8ZE0GHfrdJ4PxQpgcMHjGI9D00n7MltIg2wNL6SumbM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33baf3f1-a8c0-4dc0-4887-08d6804c6daa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2019 09:31:43.4057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3391
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bai Ping <ping.bai@nxp.com>

Add the clock binding doc for i.MX8MM.

Signed-off-by: Bai Ping <ping.bai@nxp.com>
---
 change v1->v2
 - add the provider node example;
 - replace table with space after define.
---
 .../devicetree/bindings/clock/imx8mm-clock.txt     |  29 +++
 include/dt-bindings/clock/imx8mm-clock.h           | 244 +++++++++++++++++=
++++
 2 files changed, 273 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8mm-clock.tx=
t
 create mode 100644 include/dt-bindings/clock/imx8mm-clock.h

diff --git a/Documentation/devicetree/bindings/clock/imx8mm-clock.txt b/Doc=
umentation/devicetree/bindings/clock/imx8mm-clock.txt
new file mode 100644
index 0000000..8e4ab9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imx8mm-clock.txt
@@ -0,0 +1,29 @@
+* Clock bindings for NXP i.MX8M Mini
+
+Required properties:
+- compatible: Should be "fsl,imx8mm-ccm"
+- reg: Address and length of the register set
+- #clock-cells: Should be <1>
+- clocks: list of clock specifiers, must contain an entry for each require=
d
+          entry in clock-names
+- clock-names: should include the following entries:
+    - "osc_32k"
+    - "osc_24m"
+    - "clk_ext1"
+    - "clk_ext2"
+    - "clk_ext3"
+    - "clk_ext4"
+
+clk: clock-controller@30380000 {
+	compatible =3D "fsl,imx8mm-ccm";
+	reg =3D <0x0 0x30380000 0x0 0x10000>;
+	#clock-cells =3D <1>;
+	clocks =3D <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
+		 <&clk_ext3>, <&clk_ext4>;
+	clock-names =3D "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
+		      "clk_ext3", "clk_ext4";
+};
+
+The clock consumer should specify the desired clock by having the clock
+ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mm-cloc=
k.h
+for the full list of i.MX8M Mini clock IDs.
diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings=
/clock/imx8mm-clock.h
new file mode 100644
index 0000000..1b4353e
--- /dev/null
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -0,0 +1,244 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2017-2018 NXP
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_IMX8MM_H
+#define __DT_BINDINGS_CLOCK_IMX8MM_H
+
+#define IMX8MM_CLK_DUMMY			0
+#define IMX8MM_CLK_32K				1
+#define IMX8MM_CLK_24M				2
+#define IMX8MM_OSC_HDMI_CLK			3
+#define IMX8MM_CLK_EXT1				4
+#define IMX8MM_CLK_EXT2				5
+#define IMX8MM_CLK_EXT3				6
+#define IMX8MM_CLK_EXT4				7
+#define IMX8MM_AUDIO_PLL1_REF_SEL		8
+#define IMX8MM_AUDIO_PLL2_REF_SEL		9
+#define IMX8MM_VIDEO_PLL1_REF_SEL		10
+#define IMX8MM_DRAM_PLL_REF_SEL			11
+#define IMX8MM_GPU_PLL_REF_SEL			12
+#define IMX8MM_VPU_PLL_REF_SEL			13
+#define IMX8MM_ARM_PLL_REF_SEL			14
+#define IMX8MM_SYS_PLL1_REF_SEL			15
+#define IMX8MM_SYS_PLL2_REF_SEL			16
+#define IMX8MM_SYS_PLL3_REF_SEL			17
+#define IMX8MM_AUDIO_PLL1			18
+#define IMX8MM_AUDIO_PLL2			19
+#define IMX8MM_VIDEO_PLL1			20
+#define IMX8MM_DRAM_PLL				21
+#define IMX8MM_GPU_PLL				22
+#define IMX8MM_VPU_PLL				23
+#define IMX8MM_ARM_PLL				24
+#define IMX8MM_SYS_PLL1				25
+#define IMX8MM_SYS_PLL2				26
+#define IMX8MM_SYS_PLL3				27
+#define IMX8MM_AUDIO_PLL1_BYPASS		28
+#define IMX8MM_AUDIO_PLL2_BYPASS		29
+#define IMX8MM_VIDEO_PLL1_BYPASS		30
+#define IMX8MM_DRAM_PLL_BYPASS			31
+#define IMX8MM_GPU_PLL_BYPASS			32
+#define IMX8MM_VPU_PLL_BYPASS			33
+#define IMX8MM_ARM_PLL_BYPASS			34
+#define IMX8MM_SYS_PLL1_BYPASS			35
+#define IMX8MM_SYS_PLL2_BYPASS			36
+#define IMX8MM_SYS_PLL3_BYPASS			37
+#define IMX8MM_AUDIO_PLL1_OUT			38
+#define IMX8MM_AUDIO_PLL2_OUT			39
+#define IMX8MM_VIDEO_PLL1_OUT			40
+#define IMX8MM_DRAM_PLL_OUT			41
+#define IMX8MM_GPU_PLL_OUT			42
+#define IMX8MM_VPU_PLL_OUT			43
+#define IMX8MM_ARM_PLL_OUT			44
+#define IMX8MM_SYS_PLL1_OUT			45
+#define IMX8MM_SYS_PLL2_OUT			46
+#define IMX8MM_SYS_PLL3_OUT			47
+#define IMX8MM_SYS_PLL1_40M			48
+#define IMX8MM_SYS_PLL1_80M			49
+#define IMX8MM_SYS_PLL1_100M			50
+#define IMX8MM_SYS_PLL1_133M			51
+#define IMX8MM_SYS_PLL1_160M			52
+#define IMX8MM_SYS_PLL1_200M			53
+#define IMX8MM_SYS_PLL1_266M			54
+#define IMX8MM_SYS_PLL1_400M			55
+#define IMX8MM_SYS_PLL1_800M			56
+#define IMX8MM_SYS_PLL2_50M			57
+#define IMX8MM_SYS_PLL2_100M			58
+#define IMX8MM_SYS_PLL2_125M			59
+#define IMX8MM_SYS_PLL2_166M			60
+#define IMX8MM_SYS_PLL2_200M			61
+#define IMX8MM_SYS_PLL2_250M			62
+#define IMX8MM_SYS_PLL2_333M			63
+#define IMX8MM_SYS_PLL2_500M			64
+#define IMX8MM_SYS_PLL2_1000M			65
+
+/* core */
+#define IMX8MM_CLK_A53_SRC			66
+#define IMX8MM_CLK_M4_SRC			67
+#define IMX8MM_CLK_VPU_SRC			68
+#define IMX8MM_CLK_GPU3D_SRC			69
+#define IMX8MM_CLK_GPU2D_SRC			70
+#define IMX8MM_CLK_A53_CG			71
+#define IMX8MM_CLK_M4_CG			72
+#define IMX8MM_CLK_VPU_CG			73
+#define IMX8MM_CLK_GPU3D_CG			74
+#define IMX8MM_CLK_GPU2D_CG			75
+#define IMX8MM_CLK_A53_DIV			76
+#define IMX8MM_CLK_M4_DIV			77
+#define IMX8MM_CLK_VPU_DIV			78
+#define IMX8MM_CLK_GPU3D_DIV			79
+#define IMX8MM_CLK_GPU2D_DIV			80
+
+/* bus */
+#define IMX8MM_CLK_MAIN_AXI			81
+#define IMX8MM_CLK_ENET_AXI			82
+#define IMX8MM_CLK_NAND_USDHC_BUS		83
+#define IMX8MM_CLK_VPU_BUS			84
+#define IMX8MM_CLK_DISP_AXI			85
+#define IMX8MM_CLK_DISP_APB			86
+#define IMX8MM_CLK_DISP_RTRM			87
+#define IMX8MM_CLK_USB_BUS			88
+#define IMX8MM_CLK_GPU_AXI			89
+#define IMX8MM_CLK_GPU_AHB			90
+#define IMX8MM_CLK_NOC				91
+#define IMX8MM_CLK_NOC_APB			92
+
+#define IMX8MM_CLK_AHB				93
+#define IMX8MM_CLK_AUDIO_AHB			94
+#define IMX8MM_CLK_IPG_ROOT			95
+#define IMX8MM_CLK_IPG_AUDIO_ROOT		96
+
+#define IMX8MM_CLK_DRAM_ALT			97
+#define IMX8MM_CLK_DRAM_APB			98
+#define IMX8MM_CLK_VPU_G1			99
+#define IMX8MM_CLK_VPU_G2			100
+#define IMX8MM_CLK_DISP_DTRC			101
+#define IMX8MM_CLK_DISP_DC8000			102
+#define IMX8MM_CLK_PCIE1_CTRL			103
+#define IMX8MM_CLK_PCIE1_PHY			104
+#define IMX8MM_CLK_PCIE1_AUX			105
+#define IMX8MM_CLK_DC_PIXEL			106
+#define IMX8MM_CLK_LCDIF_PIXEL			107
+#define IMX8MM_CLK_SAI1				108
+#define IMX8MM_CLK_SAI2				109
+#define IMX8MM_CLK_SAI3				110
+#define IMX8MM_CLK_SAI4				111
+#define IMX8MM_CLK_SAI5				112
+#define IMX8MM_CLK_SAI6				113
+#define IMX8MM_CLK_SPDIF1			114
+#define IMX8MM_CLK_SPDIF2			115
+#define IMX8MM_CLK_ENET_REF			116
+#define IMX8MM_CLK_ENET_TIMER			117
+#define IMX8MM_CLK_ENET_PHY_REF			118
+#define IMX8MM_CLK_NAND				119
+#define IMX8MM_CLK_QSPI				120
+#define IMX8MM_CLK_USDHC1			121
+#define IMX8MM_CLK_USDHC2			122
+#define IMX8MM_CLK_I2C1				123
+#define IMX8MM_CLK_I2C2				124
+#define IMX8MM_CLK_I2C3				125
+#define IMX8MM_CLK_I2C4				126
+#define IMX8MM_CLK_UART1			127
+#define IMX8MM_CLK_UART2			128
+#define IMX8MM_CLK_UART3			129
+#define IMX8MM_CLK_UART4			130
+#define IMX8MM_CLK_USB_CORE_REF			131
+#define IMX8MM_CLK_USB_PHY_REF			132
+#define IMX8MM_CLK_ECSPI1			133
+#define IMX8MM_CLK_ECSPI2			134
+#define IMX8MM_CLK_PWM1				135
+#define IMX8MM_CLK_PWM2				136
+#define IMX8MM_CLK_PWM3				137
+#define IMX8MM_CLK_PWM4				138
+#define IMX8MM_CLK_GPT1				139
+#define IMX8MM_CLK_WDOG				140
+#define IMX8MM_CLK_WRCLK			141
+#define IMX8MM_CLK_DSI_CORE			142
+#define IMX8MM_CLK_DSI_PHY_REF			143
+#define IMX8MM_CLK_DSI_DBI			144
+#define IMX8MM_CLK_USDHC3			145
+#define IMX8MM_CLK_CSI1_CORE			146
+#define IMX8MM_CLK_CSI1_PHY_REF			147
+#define IMX8MM_CLK_CSI1_ESC			148
+#define IMX8MM_CLK_CSI2_CORE			149
+#define IMX8MM_CLK_CSI2_PHY_REF			150
+#define IMX8MM_CLK_CSI2_ESC			151
+#define IMX8MM_CLK_PCIE2_CTRL			152
+#define IMX8MM_CLK_PCIE2_PHY			153
+#define IMX8MM_CLK_PCIE2_AUX			154
+#define IMX8MM_CLK_ECSPI3			155
+#define IMX8MM_CLK_PDM				156
+#define IMX8MM_CLK_VPU_H1			157
+#define IMX8MM_CLK_CLKO1			158
+
+#define IMX8MM_CLK_ECSPI1_ROOT			159
+#define IMX8MM_CLK_ECSPI2_ROOT			160
+#define IMX8MM_CLK_ECSPI3_ROOT			161
+#define IMX8MM_CLK_ENET1_ROOT			162
+#define IMX8MM_CLK_GPT1_ROOT			163
+#define IMX8MM_CLK_I2C1_ROOT			164
+#define IMX8MM_CLK_I2C2_ROOT			165
+#define IMX8MM_CLK_I2C3_ROOT			166
+#define IMX8MM_CLK_I2C4_ROOT			167
+#define IMX8MM_CLK_OCOTP_ROOT			168
+#define IMX8MM_CLK_PCIE1_ROOT			169
+#define IMX8MM_CLK_PWM1_ROOT			170
+#define IMX8MM_CLK_PWM2_ROOT			171
+#define IMX8MM_CLK_PWM3_ROOT			172
+#define IMX8MM_CLK_PWM4_ROOT			173
+#define IMX8MM_CLK_QSPI_ROOT			174
+#define IMX8MM_CLK_NAND_ROOT			175
+#define IMX8MM_CLK_SAI1_ROOT			176
+#define IMX8MM_CLK_SAI1_IPG			177
+#define IMX8MM_CLK_SAI2_ROOT			178
+#define IMX8MM_CLK_SAI2_IPG			179
+#define IMX8MM_CLK_SAI3_ROOT			180
+#define IMX8MM_CLK_SAI3_IPG			181
+#define IMX8MM_CLK_SAI4_ROOT			182
+#define IMX8MM_CLK_SAI4_IPG			183
+#define IMX8MM_CLK_SAI5_ROOT			184
+#define IMX8MM_CLK_SAI5_IPG			185
+#define IMX8MM_CLK_SAI6_ROOT			186
+#define IMX8MM_CLK_SAI6_IPG			187
+#define IMX8MM_CLK_UART1_ROOT			188
+#define IMX8MM_CLK_UART2_ROOT			189
+#define IMX8MM_CLK_UART3_ROOT			190
+#define IMX8MM_CLK_UART4_ROOT			191
+#define IMX8MM_CLK_USB1_CTRL_ROOT		192
+#define IMX8MM_CLK_GPU3D_ROOT			193
+#define IMX8MM_CLK_USDHC1_ROOT			194
+#define IMX8MM_CLK_USDHC2_ROOT			195
+#define IMX8MM_CLK_WDOG1_ROOT			196
+#define IMX8MM_CLK_WDOG2_ROOT			197
+#define IMX8MM_CLK_WDOG3_ROOT			198
+#define IMX8MM_CLK_VPU_G1_ROOT			199
+#define IMX8MM_CLK_GPU_BUS_ROOT			200
+#define IMX8MM_CLK_VPU_H1_ROOT			201
+#define IMX8MM_CLK_VPU_G2_ROOT			202
+#define IMX8MM_CLK_PDM_ROOT			203
+#define IMX8MM_CLK_DISP_ROOT			204
+#define IMX8MM_CLK_DISP_AXI_ROOT		205
+#define IMX8MM_CLK_DISP_APB_ROOT		206
+#define IMX8MM_CLK_DISP_RTRM_ROOT		207
+#define IMX8MM_CLK_USDHC3_ROOT			208
+#define IMX8MM_CLK_TMU_ROOT			209
+#define IMX8MM_CLK_VPU_DEC_ROOT			210
+#define IMX8MM_CLK_SDMA1_ROOT			211
+#define IMX8MM_CLK_SDMA2_ROOT			212
+#define IMX8MM_CLK_SDMA3_ROOT			213
+#define IMX8MM_CLK_GPT_3M			214
+#define IMX8MM_CLK_ARM				215
+#define IMX8MM_CLK_PDM_IPG			216
+#define IMX8MM_CLK_GPU2D_ROOT			217
+#define IMX8MM_CLK_MU_ROOT			218
+#define IMX8MM_CLK_CSI1_ROOT			219
+
+#define IMX8MM_CLK_DRAM_CORE			220
+#define IMX8MM_CLK_DRAM_ALT_ROOT		221
+
+#define IMX8MM_CLK_NAND_USDHC_BUS_RAWNAND_CLK	222
+
+#define IMX8MM_CLK_END				223
+
+#endif
--=20
1.9.1

