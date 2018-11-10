Return-Path: <SRS0=kVDh=NV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36E6C43441
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 15:20:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7087B20858
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 15:20:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="mseEHjpj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7087B20858
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbeKKBGE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Nov 2018 20:06:04 -0500
Received: from mail-db5eur01on0042.outbound.protection.outlook.com ([104.47.2.42]:53175
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726270AbeKKBGE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 10 Nov 2018 20:06:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwcNCr7h6X1Uwi3ga7JY06nkkf1DvHpdSeRaUjQZKs0=;
 b=mseEHjpjH+7LCip2r9AP4SROSqc2drtqk5+YwhCEGuYjjNFKB5EC2WgvBmpVb06HA50dHH/wOFRDoq81PZuO5cOjt+lDpsqNlyabEuR6O3HCfAYHdii+vQIW6XHke+CZuEM2urCxIR/tDkL73mdIwa9AvG2eOTgQYFpnpJ+Ntp8=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4067.eurprd04.prod.outlook.com (52.134.125.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Sat, 10 Nov 2018 15:20:01 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10%2]) with mapi id 15.20.1294.039; Sat, 10 Nov 2018
 15:20:01 +0000
From:   "A.s. Dong" <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH V6 4/6] dt-bindings: clock: add imx8qxp lpcg clock binding
Thread-Topic: [PATCH V6 4/6] dt-bindings: clock: add imx8qxp lpcg clock
 binding
Thread-Index: AQHUeQjZ3VfZXHVegUSGqcwxO5MRaw==
Date:   Sat, 10 Nov 2018 15:20:01 +0000
Message-ID: <1541862894-8209-5-git-send-email-aisheng.dong@nxp.com>
References: <1541862894-8209-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1541862894-8209-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0024.apcprd03.prod.outlook.com
 (2603:1096:203:2e::36) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4067;6:9KYmU8WHgHXO4spPxsbG9sir50IENySnRBRe5h/TyW0K6vS3wUasib+d8v5YMusf/WFhjQR4jz9PT45VYEEjdXU64rnpuWPcDauWaYhG37xn4EDJL36ZPjR9wmaJRZfbWf1kxi9CvSkcCBphg8+Nc00Xv1wcOjpjqNjZ9v50Xa8QmwO6FhYml8VVzDw7hoGcYeSEzkaIW7wUKIL873vdrHZFQGBqaLT0ZPq3RpEBbodvSxBcfMMCwgSBsa+bwgsJngqhmJy+kfx0+DYSFOVdF5G27xNAwuKqhtHevMgb1XOejsOdDfNcopXz4e/72ygqHeLjs+z0/tqpxpMaC2vGQtYY7B0dk+eE/BrSpheDxmJCxGTSWJQoScWe6SO/MExWVgJQo65sj4NjBsmFqKEz5AHuY8o3RjX/e0pH5RZXkHX6KPHmHB0wdoFILpkYjJ5V8JaPkhgWhrjWER7KNeo73w==;5:rq+Yu+WQ0WyMGLf4hCdpDQE7KyTAjxONuwLa8HLTAhit4wviV40jILZxLXQJyBhiABOngaBIUYkZLeFJI7Q4376nTgZK/z/HFI1zGvnxToe7LaJDmbZm2cdDVTbQTRruSR7k5a3V4gVjo/B6bx/VRtxArDy4xmuzBhVBr2LRkVw=;7:N1cpF1s5slw70DrBSrnds/IBeLOBn3C1QKHZ/FOdGILADxzjJp9mtX5QDYLR3mbfxa1wlwErpaonR5+jczArvNKa19xBQyi3pT7MMHnC8HYxdraLxQn28CHi+yVyfYzwtPvcmXcXZ85tVSnCzchtfA==
x-ms-office365-filtering-correlation-id: ff43e8fb-25cb-430d-0790-08d6471ffba9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390040)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4067;
x-ms-traffictypediagnostic: AM0PR04MB4067:
x-microsoft-antispam-prvs: <AM0PR04MB4067D247844505269C4D61BF80C70@AM0PR04MB4067.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(9452136761055)(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4067;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4067;
x-forefront-prvs: 0852EB6797
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(346002)(376002)(396003)(366004)(39850400004)(136003)(189003)(199004)(2501003)(25786009)(50226002)(71190400001)(4326008)(97736004)(2900100001)(14454004)(8676002)(99286004)(76176011)(186003)(8936002)(53936002)(52116002)(5660300001)(102836004)(81156014)(81166006)(68736007)(446003)(386003)(11346002)(26005)(71200400001)(486006)(6512007)(6506007)(66066001)(5640700003)(2616005)(476003)(7736002)(305945005)(86362001)(6116002)(6486002)(3846002)(36756003)(6436002)(316002)(54906003)(478600001)(105586002)(106356001)(256004)(6916009)(2906002)(2351001)(32563001)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4067;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: oKdYfdZqCc/y7hn96uaTB0Ap6EMcqTA6WNxk6kaOVLVN8Cb80KiweYzz+/5t2ulaOX2OvcXmiub29WbTaQLCh2yp2S4lRGuzpxEEEJ0x2nSx6dj906umdGHLNhQBr+NhAMSz2WJr6Y3i6eRc7EgjW722MzvD9TeAmOxMR8XcUtKZPLKpVFcVOasGASP/tr7HyF6nW0rOPXpraX2GYUoqbBXcDJdwgUatryaIWBoYjQj2RB7RzAndP3EdKCniVCZEaZ0c52e1fP8gLkzvzEFnXpmcUZ5Y8J8hoyjroQxKi1EQGqxcr7Z1oVBZQDLi5sRsF/j5T3SF4NTf64E5RG6vYnVYyk72vjCBOEzQPxIXb/o=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff43e8fb-25cb-430d-0790-08d6471ffba9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2018 15:20:01.3852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4067
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Low-Power Clock Gate (LPCG) modules contain a local programming
model to control the clock gates for the peripherals. An LPCG module
is used to locally gate the clocks for the associated peripheral.

Note:
This level of clock gating is provided after the clocks are generated
by the SCU resources and clock controls. Thus even if the clock is
enabled by these control bits, it might still not be running based
on the base resource.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 .../devicetree/bindings/clock/imx8qxp-lpcg.txt     |  51 +++++++
 include/dt-bindings/clock/imx8qxp-clock.h          | 153 +++++++++++++++++=
++++
 2 files changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8qxp-lpcg.tx=
t

diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt b/Doc=
umentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
new file mode 100644
index 0000000..965cfa4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
@@ -0,0 +1,51 @@
+* NXP i.MX8QXP LPCG (Low-Power Clock Gating) Clock bindings
+
+The Low-Power Clock Gate (LPCG) modules contain a local programming
+model to control the clock gates for the peripherals. An LPCG module
+is used to locally gate the clocks for the associated peripheral.
+
+Note:
+This level of clock gating is provided after the clocks are generated
+by the SCU resources and clock controls. Thus even if the clock is
+enabled by these control bits, it might still not be running based
+on the base resource.
+
+Required properties:
+- compatible:	Should be one of:
+		  "fsl,imx8qxp-lpcg-adma",
+		  "fsl,imx8qxp-lpcg-conn",
+		  "fsl,imx8qxp-lpcg-dc",
+		  "fsl,imx8qxp-lpcg-dsp",
+		  "fsl,imx8qxp-lpcg-gpu",
+		  "fsl,imx8qxp-lpcg-hsio",
+		  "fsl,imx8qxp-lpcg-img",
+		  "fsl,imx8qxp-lpcg-lsio",
+		  "fsl,imx8qxp-lpcg-vpu"
+- reg:		Address and length of the register set
+- #clock-cells:	Should be <1>
+
+The clock consumer should specify the desired clock by having the clock
+ID in its "clocks" phandle cell.
+See the full list of clock IDs from:
+include/dt-bindings/clock/imx8qxp-clock.h
+
+Examples:
+
+#include <dt-bindings/clock/imx8qxp-clock.h>
+
+conn_lpcg: clock-controller@5b200000 {
+	compatible =3D "fsl,imx8qxp-lpcg-conn";
+	reg =3D <0x5b200000 0xb0000>;
+	#clock-cells =3D <1>;
+};
+
+usdhc1: mmc@5b010000 {
+	compatible =3D "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
+	interrupt-parent =3D <&gic>;
+	interrupts =3D <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
+	reg =3D <0x5b010000 0x10000>;
+	clocks =3D <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_IPG_CLK>,
+		 <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_PER_CLK>,
+		 <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_HCLK>;
+	clock-names =3D "ipg", "per", "ahb";
+};
diff --git a/include/dt-bindings/clock/imx8qxp-clock.h b/include/dt-binding=
s/clock/imx8qxp-clock.h
index d72a39c..6fec368 100644
--- a/include/dt-bindings/clock/imx8qxp-clock.h
+++ b/include/dt-bindings/clock/imx8qxp-clock.h
@@ -133,4 +133,157 @@
=20
 #define IMX8QXP_SCU_CLK_END				190
=20
+/* LPCG clocks */
+
+/* LSIO SS LPCG */
+#define IMX8QXP_LSIO_LPCG_PWM0_IPG_CLK			0
+#define IMX8QXP_LSIO_LPCG_PWM0_IPG_S_CLK		1
+#define IMX8QXP_LSIO_LPCG_PWM0_IPG_HF_CLK		2
+#define IMX8QXP_LSIO_LPCG_PWM0_IPG_SLV_CLK		3
+#define IMX8QXP_LSIO_LPCG_PWM0_IPG_MSTR_CLK		4
+#define IMX8QXP_LSIO_LPCG_PWM1_IPG_CLK			5
+#define IMX8QXP_LSIO_LPCG_PWM1_IPG_S_CLK		6
+#define IMX8QXP_LSIO_LPCG_PWM1_IPG_HF_CLK		7
+#define IMX8QXP_LSIO_LPCG_PWM1_IPG_SLV_CLK		8
+#define IMX8QXP_LSIO_LPCG_PWM1_IPG_MSTR_CLK		9
+#define IMX8QXP_LSIO_LPCG_PWM2_IPG_CLK			10
+#define IMX8QXP_LSIO_LPCG_PWM2_IPG_S_CLK		11
+#define IMX8QXP_LSIO_LPCG_PWM2_IPG_HF_CLK		12
+#define IMX8QXP_LSIO_LPCG_PWM2_IPG_SLV_CLK		13
+#define IMX8QXP_LSIO_LPCG_PWM2_IPG_MSTR_CLK		14
+#define IMX8QXP_LSIO_LPCG_PWM3_IPG_CLK			15
+#define IMX8QXP_LSIO_LPCG_PWM3_IPG_S_CLK		16
+#define IMX8QXP_LSIO_LPCG_PWM3_IPG_HF_CLK		17
+#define IMX8QXP_LSIO_LPCG_PWM3_IPG_SLV_CLK		18
+#define IMX8QXP_LSIO_LPCG_PWM3_IPG_MSTR_CLK		19
+#define IMX8QXP_LSIO_LPCG_PWM4_IPG_CLK			20
+#define IMX8QXP_LSIO_LPCG_PWM4_IPG_S_CLK		21
+#define IMX8QXP_LSIO_LPCG_PWM4_IPG_HF_CLK		22
+#define IMX8QXP_LSIO_LPCG_PWM4_IPG_SLV_CLK		23
+#define IMX8QXP_LSIO_LPCG_PWM4_IPG_MSTR_CLK		24
+#define IMX8QXP_LSIO_LPCG_PWM5_IPG_CLK			25
+#define IMX8QXP_LSIO_LPCG_PWM5_IPG_S_CLK		26
+#define IMX8QXP_LSIO_LPCG_PWM5_IPG_HF_CLK		27
+#define IMX8QXP_LSIO_LPCG_PWM5_IPG_SLV_CLK		28
+#define IMX8QXP_LSIO_LPCG_PWM5_IPG_MSTR_CLK		29
+#define IMX8QXP_LSIO_LPCG_PWM6_IPG_CLK			30
+#define IMX8QXP_LSIO_LPCG_PWM6_IPG_S_CLK		31
+#define IMX8QXP_LSIO_LPCG_PWM6_IPG_HF_CLK		32
+#define IMX8QXP_LSIO_LPCG_PWM6_IPG_SLV_CLK		33
+#define IMX8QXP_LSIO_LPCG_PWM6_IPG_MSTR_CLK		34
+#define IMX8QXP_LSIO_LPCG_PWM7_IPG_CLK			35
+#define IMX8QXP_LSIO_LPCG_PWM7_IPG_S_CLK		36
+#define IMX8QXP_LSIO_LPCG_PWM7_IPG_HF_CLK		37
+#define IMX8QXP_LSIO_LPCG_PWM7_IPG_SLV_CLK		38
+#define IMX8QXP_LSIO_LPCG_PWM7_IPG_MSTR_CLK		39
+#define IMX8QXP_LSIO_LPCG_GPT0_IPG_CLK			40
+#define IMX8QXP_LSIO_LPCG_GPT0_IPG_S_CLK		41
+#define IMX8QXP_LSIO_LPCG_GPT0_IPG_HF_CLK		42
+#define IMX8QXP_LSIO_LPCG_GPT0_IPG_SLV_CLK		43
+#define IMX8QXP_LSIO_LPCG_GPT0_IPG_MSTR_CLK		44
+#define IMX8QXP_LSIO_LPCG_GPT1_IPG_CLK			45
+#define IMX8QXP_LSIO_LPCG_GPT1_IPG_S_CLK		46
+#define IMX8QXP_LSIO_LPCG_GPT1_IPG_HF_CLK		47
+#define IMX8QXP_LSIO_LPCG_GPT1_IPG_SLV_CLK		48
+#define IMX8QXP_LSIO_LPCG_GPT1_IPG_MSTR_CLK		49
+#define IMX8QXP_LSIO_LPCG_GPT2_IPG_CLK			50
+#define IMX8QXP_LSIO_LPCG_GPT2_IPG_S_CLK		51
+#define IMX8QXP_LSIO_LPCG_GPT2_IPG_HF_CLK		52
+#define IMX8QXP_LSIO_LPCG_GPT2_IPG_SLV_CLK		53
+#define IMX8QXP_LSIO_LPCG_GPT2_IPG_MSTR_CLK		54
+#define IMX8QXP_LSIO_LPCG_GPT3_IPG_CLK			55
+#define IMX8QXP_LSIO_LPCG_GPT3_IPG_S_CLK		56
+#define IMX8QXP_LSIO_LPCG_GPT3_IPG_HF_CLK		57
+#define IMX8QXP_LSIO_LPCG_GPT3_IPG_SLV_CLK		58
+#define IMX8QXP_LSIO_LPCG_GPT3_IPG_MSTR_CLK		59
+#define IMX8QXP_LSIO_LPCG_GPT4_IPG_CLK			60
+#define IMX8QXP_LSIO_LPCG_GPT4_IPG_S_CLK		61
+#define IMX8QXP_LSIO_LPCG_GPT4_IPG_HF_CLK		62
+#define IMX8QXP_LSIO_LPCG_GPT4_IPG_SLV_CLK		63
+#define IMX8QXP_LSIO_LPCG_GPT4_IPG_MSTR_CLK		64
+#define IMX8QXP_LSIO_LPCG_FSPI0_HCLK			65
+#define IMX8QXP_LSIO_LPCG_FSPI0_IPG_CLK			66
+#define IMX8QXP_LSIO_LPCG_FSPI0_IPG_S_CLK		67
+#define IMX8QXP_LSIO_LPCG_FSPI0_IPG_SFCK		68
+#define IMX8QXP_LSIO_LPCG_FSPI1_HCLK			69
+#define IMX8QXP_LSIO_LPCG_FSPI1_IPG_CLK			70
+#define IMX8QXP_LSIO_LPCG_FSPI1_IPG_S_CLK		71
+#define IMX8QXP_LSIO_LPCG_FSPI1_IPG_SFCK		72
+
+#define IMX8QXP_LSIO_LPCG_CLK_END			73
+
+/* Connectivity SS LPCG */
+#define IMX8QXP_CONN_LPCG_SDHC0_IPG_CLK			0
+#define IMX8QXP_CONN_LPCG_SDHC0_PER_CLK			1
+#define IMX8QXP_CONN_LPCG_SDHC0_HCLK			2
+#define IMX8QXP_CONN_LPCG_SDHC1_IPG_CLK			3
+#define IMX8QXP_CONN_LPCG_SDHC1_PER_CLK			4
+#define IMX8QXP_CONN_LPCG_SDHC1_HCLK			5
+#define IMX8QXP_CONN_LPCG_SDHC2_IPG_CLK			6
+#define IMX8QXP_CONN_LPCG_SDHC2_PER_CLK			7
+#define IMX8QXP_CONN_LPCG_SDHC2_HCLK			8
+#define IMX8QXP_CONN_LPCG_GPMI_APB_CLK			9
+#define IMX8QXP_CONN_LPCG_GPMI_BCH_APB_CLK		10
+#define IMX8QXP_CONN_LPCG_GPMI_BCH_IO_CLK		11
+#define IMX8QXP_CONN_LPCG_GPMI_BCH_CLK			12
+#define IMX8QXP_CONN_LPCG_APBHDMA_CLK			13
+#define IMX8QXP_CONN_LPCG_ENET0_ROOT_CLK		14
+#define IMX8QXP_CONN_LPCG_ENET0_TX_CLK			15
+#define IMX8QXP_CONN_LPCG_ENET0_AHB_CLK			16
+#define IMX8QXP_CONN_LPCG_ENET0_IPG_S_CLK		17
+#define IMX8QXP_CONN_LPCG_ENET0_IPG_CLK			18
+
+#define IMX8QXP_CONN_LPCG_ENET1_ROOT_CLK		19
+#define IMX8QXP_CONN_LPCG_ENET1_TX_CLK			20
+#define IMX8QXP_CONN_LPCG_ENET1_AHB_CLK			21
+#define IMX8QXP_CONN_LPCG_ENET1_IPG_S_CLK		22
+#define IMX8QXP_CONN_LPCG_ENET1_IPG_CLK			23
+
+#define IMX8QXP_CONN_LPCG_CLK_END			24
+
+/* ADMA SS LPCG */
+#define IMX8QXP_ADMA_LPCG_UART0_IPG_CLK			0
+#define IMX8QXP_ADMA_LPCG_UART0_BAUD_CLK		1
+#define IMX8QXP_ADMA_LPCG_UART1_IPG_CLK			2
+#define IMX8QXP_ADMA_LPCG_UART1_BAUD_CLK		3
+#define IMX8QXP_ADMA_LPCG_UART2_IPG_CLK			4
+#define IMX8QXP_ADMA_LPCG_UART2_BAUD_CLK		5
+#define IMX8QXP_ADMA_LPCG_UART3_IPG_CLK			6
+#define IMX8QXP_ADMA_LPCG_UART3_BAUD_CLK		7
+#define IMX8QXP_ADMA_LPCG_SPI0_IPG_CLK			8
+#define IMX8QXP_ADMA_LPCG_SPI1_IPG_CLK			9
+#define IMX8QXP_ADMA_LPCG_SPI2_IPG_CLK			10
+#define IMX8QXP_ADMA_LPCG_SPI3_IPG_CLK			11
+#define IMX8QXP_ADMA_LPCG_SPI0_CLK			12
+#define IMX8QXP_ADMA_LPCG_SPI1_CLK			13
+#define IMX8QXP_ADMA_LPCG_SPI2_CLK			14
+#define IMX8QXP_ADMA_LPCG_SPI3_CLK			15
+#define IMX8QXP_ADMA_LPCG_CAN0_IPG_CLK			16
+#define IMX8QXP_ADMA_LPCG_CAN0_IPG_PE_CLK		17
+#define IMX8QXP_ADMA_LPCG_CAN0_IPG_CHI_CLK		18
+#define IMX8QXP_ADMA_LPCG_CAN1_IPG_CLK			19
+#define IMX8QXP_ADMA_LPCG_CAN1_IPG_PE_CLK		20
+#define IMX8QXP_ADMA_LPCG_CAN1_IPG_CHI_CLK		21
+#define IMX8QXP_ADMA_LPCG_CAN2_IPG_CLK			22
+#define IMX8QXP_ADMA_LPCG_CAN2_IPG_PE_CLK		23
+#define IMX8QXP_ADMA_LPCG_CAN2_IPG_CHI_CLK		24
+#define IMX8QXP_ADMA_LPCG_I2C0_CLK			25
+#define IMX8QXP_ADMA_LPCG_I2C1_CLK			26
+#define IMX8QXP_ADMA_LPCG_I2C2_CLK			27
+#define IMX8QXP_ADMA_LPCG_I2C3_CLK			28
+#define IMX8QXP_ADMA_LPCG_I2C0_IPG_CLK			29
+#define IMX8QXP_ADMA_LPCG_I2C1_IPG_CLK			30
+#define IMX8QXP_ADMA_LPCG_I2C2_IPG_CLK			31
+#define IMX8QXP_ADMA_LPCG_I2C3_IPG_CLK			32
+#define IMX8QXP_ADMA_LPCG_FTM0_CLK			33
+#define IMX8QXP_ADMA_LPCG_FTM1_CLK			34
+#define IMX8QXP_ADMA_LPCG_FTM0_IPG_CLK			35
+#define IMX8QXP_ADMA_LPCG_FTM1_IPG_CLK			36
+#define IMX8QXP_ADMA_LPCG_PWM_HI_CLK			37
+#define IMX8QXP_ADMA_LPCG_PWM_IPG_CLK			38
+#define IMX8QXP_ADMA_LPCG_LCD_PIX_CLK			39
+#define IMX8QXP_ADMA_LPCG_LCD_APB_CLK			40
+
+#define IMX8QXP_ADMA_LPCG_CLK_END			41
+
 #endif /* __DT_BINDINGS_CLOCK_IMX8QXP_H */
--=20
2.7.4

