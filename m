Return-Path: <SRS0=xK8l=PT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552F6C43387
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 11:56:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26AF12064C
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 11:56:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="io/KRsBQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731921AbfAKL4Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jan 2019 06:56:16 -0500
Received: from mail-eopbgr20068.outbound.protection.outlook.com ([40.107.2.68]:4903
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731289AbfAKL4Q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 11 Jan 2019 06:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rSgbVUFXMhV7Imsu5RSQ3XGFNcFP/erJgj7Y6uCiJg=;
 b=io/KRsBQ8Nl/xtqY4qf3Wz6A/NdxAErt5jROeDuQBYDTZ4nZQvOVkdAO4ptO3PL3P07rJ351bf8UqkQD+wNpwI2QARjuhRUZll+j7GmEZDH0sMz0mHWjopM9NcHUVLrW+VoGwJslwy/TWhpw99vQgWQeiD3L80fWW118fQTPz2I=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4659.eurprd04.prod.outlook.com (52.135.149.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.7; Fri, 11 Jan 2019 11:56:09 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1516.016; Fri, 11 Jan 2019
 11:56:09 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH RESEND v1 4/4] dt-bindings: imx8-clock: add a53 and a72 clock
 id
Thread-Topic: [PATCH RESEND v1 4/4] dt-bindings: imx8-clock: add a53 and a72
 clock id
Thread-Index: AQHUqaSkppDl39MTT0aJiP3Ffy/VUA==
Date:   Fri, 11 Jan 2019 11:56:09 +0000
Message-ID: <1547207400-28307-5-git-send-email-aisheng.dong@nxp.com>
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0063.apcprd03.prod.outlook.com
 (2603:1096:203:52::27) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4659;6:keMupmWEsL0kOo+EBVLU+EtzfrY0qcrcKnpRnW6dqrZQhEwOOgS8srVo7oDZzZ0nE6mVoNwX/o9LxuL5CMDP6rtyp27nfaV2yq/ccmHafAL0SNha8sHJ3I5TPLQpvB8cTzBq+AMYix+vWQYIVrCafFKK9WNW7nth+OzHfraDOEX8uAZ8SW9XMyxu3hWc4E/oQ6VwZnt+xLgek2p/u6L72MlvoLtSpsuZQhYGp33kI3CMun0lkU31qiKrJRaGYAnoc4kvzwVw4EZFXAVUkMpxgHqntKhfUmTLEBsFOfGEr0r0S3Q4tlrPa7+EWUTOqJIk3ciGy/ZFJdqcovEf4WHi0CYx4Gn/aHzEXpaRCkUtEHmM62TjDfdFXYEFAxYFt08nq1BBJaZQjlxsj15eWBRMDJoBB5OMkf3AJCPwplB6UtDweHN0F/b1VBgHf8Jzi3tT2xdTg6Nq+1vZVfWnabsVvQ==;5:Qj9N0ZHTEDRmxTwla7/UkR8MTBZi8rj8/+fHzRcZWXlOcM15ZKdSYuugyi5ftqizoP90pH3qFf2AHYiHdSOzPwh81EF95dxJ6t76gAKMOIaqYXEtdpn0FXV3iKYAzPS33nQH2sX/d+oo6b+n75DzqZcgivc9oWH3Sp7/vJQXQmfP+yiT0l/hdc3lwh9ahXHmGyMkZo1V/3k27mwDGwUmUg==;7:rtZd5pA1XBCU5SOrgVxHygPuHOolEcPG3APR+GuOXHB+IxSPGvltT3yrvUqtAZdwoQr+K/Z/p/wP3jKJSQuRyZLk/SNdGnunqQoJDgLJIr4KCIn985MiJzz76+Si8shmRSiHjsPCg9vMobEyMmLzLA==
x-ms-office365-filtering-correlation-id: 48b95652-c4c3-4ec0-26ee-08d677bbc659
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600109)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4659;
x-ms-traffictypediagnostic: AM0PR04MB4659:
x-microsoft-antispam-prvs: <AM0PR04MB46594E2482642381701A27A680850@AM0PR04MB4659.eurprd04.prod.outlook.com>
x-forefront-prvs: 09144DB0F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(366004)(199004)(189003)(478600001)(316002)(2351001)(54906003)(14454004)(68736007)(186003)(105586002)(106356001)(86362001)(4326008)(71190400001)(71200400001)(6486002)(76176011)(52116002)(53936002)(5640700003)(25786009)(6436002)(2501003)(6512007)(5660300001)(97736004)(44832011)(256004)(99286004)(14444005)(102836004)(6916009)(217873002)(26005)(6506007)(6346003)(386003)(11346002)(305945005)(7736002)(36756003)(50226002)(2616005)(486006)(66066001)(2906002)(476003)(446003)(6116002)(3846002)(81166006)(81156014)(8676002)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4659;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TkHIyzorEfOHUqaug6crr/EcVbjhD6OfQYXMEwmdchHz8jtD/Iu1qjvdks0d3pzHAJvaiFV6RBxWx0F1boMpRArxbdyH6BQokHV3H7jOWHsPB1SK6eeYg2JT3hBYCWSaveM/54S/J8R3q49m6OSZkP19lYahGge6bD/jRNIpLZVoXF7lr+aIumdCcg7pz1T5EW0mEbzh4x1n+y/2H13zuyMGGTjrXfrmx1ZU5vqrArNrrh9EJoYsq+CtFNqyfGf5ae28bGPxkrXgs++9p/3FmLi73whqY1VvZoRIlolGrYQKheeJzVjQBTTItD4a4P57xhxl0A6LCHKILRIok3sgaM7QXndFnTifqr/OCiWIoAkhxhq+jcEbYvSG1o1jDIcikEpo/pNzN8mrwpTjQY2EeAPvyoPBdjavASGKSLKDuWE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b95652-c4c3-4ec0-26ee-08d677bbc659
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2019 11:56:05.4599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4659
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a53 and a72 clock id, as there's still no users, we update
IMX_LSIO_MEM_CLK base to start from 6 to allow a53 and a72 clock
id to be continued with a35 clk.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 include/dt-bindings/clock/imx8-clock.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/imx8-clock.h b/include/dt-bindings/c=
lock/imx8-clock.h
index 4236818..2f1aa2f 100644
--- a/include/dt-bindings/clock/imx8-clock.h
+++ b/include/dt-bindings/clock/imx8-clock.h
@@ -13,10 +13,12 @@
=20
 /* CPU */
 #define IMX_A35_CLK					1
+#define IMX_A53_CLK					2
+#define IMX_A72_CLK					3
=20
 /* LSIO SS */
-#define IMX_LSIO_MEM_CLK				2
-#define IMX_LSIO_BUS_CLK				3
+#define IMX_LSIO_MEM_CLK				6
+#define IMX_LSIO_BUS_CLK				7
 #define IMX_LSIO_PWM0_CLK				10
 #define IMX_LSIO_PWM1_CLK				11
 #define IMX_LSIO_PWM2_CLK				12
--=20
2.7.4

