Return-Path: <SRS0=YASP=N2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3795EC43441
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 08:56:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EBB922077C
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 08:56:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="jD4YeSjs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBB922077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbeKOTDI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Nov 2018 14:03:08 -0500
Received: from mail-eopbgr30056.outbound.protection.outlook.com ([40.107.3.56]:48413
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728699AbeKOTDI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Nov 2018 14:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xD9YboytHuuNqwoca5fgAtQ4XZAbQTgpilOXo0jssoU=;
 b=jD4YeSjsfim1sL1wu7lWfDvVUTkxF+wrDuMqhk/7SPSj7k2Zads71fZ5shLALo0g6nVUFnfSUxsfQsoihfflaN9dGkPcp77eA/dRRvNljOyfy/uvLIgJFDqdbXd9ROPx4YmlsyJbdRwCbNF+7lxhrhGFWxAmY3WGqUWoPZ5rxL4=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4068.eurprd04.prod.outlook.com (52.134.125.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Thu, 15 Nov 2018 08:56:10 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10%2]) with mapi id 15.20.1294.045; Thu, 15 Nov 2018
 08:56:10 +0000
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
        "A.s. Dong" <aisheng.dong@nxp.com>
Subject: [PATCH V7 0/7] clk: imx: add imx8qxp clock support
Thread-Topic: [PATCH V7 0/7] clk: imx: add imx8qxp clock support
Thread-Index: AQHUfMENFmbI0QKpEkClebIHbPnEhA==
Date:   Thu, 15 Nov 2018 08:56:10 +0000
Message-ID: <1542271869-18600-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:203:2e::22) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4068;6:09xMV+J3R+8UPxaHJpp/6iinDs5hBII1PJClzFf8DoAaDNVJLCm0pupYhJe3lG6ny3aaUh9ShNnN1zd+cGOnQmmpTkVWcEXBGq1Ggpp8zXmhNHXCdaMJ7MvwmDbfql3w4ltt6gJsJB8zt5PzuK9so7BgMOX6a7ePEV15yKUjIWqw8OFYZXixleHR/Mcw9tSAoPuGrXxM1pFZCcLuGH3usSUrAcVkFZADUaFyufZeMNscXIT6LkqOHroRneoVY5IwhiaqmSZLCODpT0NDwZgDg2xAL+VLW2HS3frf8hh/l5J4WL7VNzSvHZAqEghagv9waNxu1kCaLvMjykd2/2xAgwWvfE2RWvhHP/M0WOS13dn6e5YzIgTb+/1VmeGhBNIlqoigaMXiSuvDJ1/WKSsd/bOAQk++jDqroMTp7nrjb9eKI0KOZ5O7zSHkc9NFVrz5hsYE/bHAhjplV9UUvGyyjw==;5:8ynsvgM9CuWd2Qf1nS8KHmMmYEPyFVCndM9xjfM+R0lwvpJL1fQcZqnVDYoKKIGVIMHfDOYnHU/KSqeMBY+Y+64UkbplWJgEqFNDNk+8G2nuqJR3ziwzfIzaoHJv0Qs7bbqsGAF3y+y3Wcg2D7tvtIOfdE9zD/sKknPLy3rjZXc=;7:nvzAOoZssQqevL8vTZpKS08qtC3iUNpl5MPPf7uor3L98ZjXAnKLWRyBDR0VuGt6beDVHIYG+fK8BN3XJ9cQDB7QQDvF1cn5BJJhxg8bDNVpKiCJ/2x+JP1Dv3RShD7UDZhv9OmqeT9073dVIO59sw==
x-ms-office365-filtering-correlation-id: 9849b256-accf-4d8a-fd13-08d64ad83021
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4068;
x-ms-traffictypediagnostic: AM0PR04MB4068:
x-microsoft-antispam-prvs: <AM0PR04MB406893C5496FC9F697B2C35A80DC0@AM0PR04MB4068.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231415)(944501410)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4068;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4068;
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(376002)(39860400002)(366004)(136003)(54534003)(199004)(189003)(102836004)(4326008)(5640700003)(316002)(54906003)(8676002)(53936002)(25786009)(81166006)(50226002)(81156014)(8936002)(106356001)(86362001)(6436002)(6512007)(186003)(6916009)(36756003)(99286004)(97736004)(386003)(2900100001)(105586002)(26005)(2351001)(52116002)(6506007)(2906002)(256004)(2501003)(478600001)(5660300001)(3846002)(66066001)(6116002)(14444005)(68736007)(71190400001)(71200400001)(476003)(305945005)(2616005)(7736002)(6486002)(14454004)(486006)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4068;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 7XJIned+n0d0sRaJYouxoMSgNcMJ5Q6vLOUF5ldkDgauW2RW6qtuiwZd2ZwE5wKv/W/Xw6HMOGKGzp/jjhvCiIg8/5K5WqH2cFiuPiod7ZGZWir6FYD18qPMmLDKCf99XYLIKQpKOptzoSjTcsILQ9qomkj+yjOT3JuqlRrjm1ofQGxKUHjVyvKNwICJTRaXHK5PW4LeKnM4kiFsgWEuQqlwqjJW3XBD0auuY+nH8dvYneOWmiuCKebjifhUp1GlLIPRxXfUnruYORDORiDNTLUdVCdTDezKyraZicBK8wtd4HRLXKgbMwayAV3BAFhx2tsfczw5kfusXQ1VE5UlpgQTX/XjpaGaTjWShHxHBMQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9849b256-accf-4d8a-fd13-08d64ad83021
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 08:56:10.3261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4068
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series adds i.MX8QXP clock support which is based
on the clock service provided by SCU firmware.

Note: It depends on SCU driver which has already been merged by Shawn.
So this patch series could go through Shawn's tree as well.

ChangeLog:
v6->v7:
 * use struct_size()
 * remove MODULE_ macros
 * add more kernel docs/code comments
 * other small improvements
 * update reviewed-by tags
 * add the missing PATCH 1 in V6
v5->v6:
 * simply the driver a lot by re-orgnizing the driver into a few clock type=
s:
   scu clock (merge scu divider/gate/mux) and scu gpr lock which accessing =
is
   through SCU protocol and LPCG clock which is directly accessible by CPU.
 * LPCG clock is separate from SCU clock, gpr clock is still not used
   and will be added later.
 * remove old year license as the code is totally rewritten
 * scu mux support will be added later as it's also still not used.
v4->v5:
 Address all Stephen and Sascha's review comments, see details in each patc=
h
v3->v4:
 * scu headfile path update
 * no functionality change
v2->v3:
 * structures/enums name update with imx_sc prefix
 * no functionality change
v1->v2:
 * structure and enums name update
 * api usage update due to api change
 * no functionality change

Dong Aisheng (7):
  clk: imx: add configuration option for mmio clks
  clk: imx: add scu clock common part
  dt-bindings: clock: imx8qxp: add SCU clock IDs
  clk: imx: add imx8qxp clk driver
  dt-bindings: clock: add imx8qxp lpcg clock binding
  clk: imx: add lpcg clock support
  clk: imx: add imx8qxp lpcg driver

 .../devicetree/bindings/clock/imx8qxp-lpcg.txt     |  51 ++++
 arch/arm/mach-imx/Kconfig                          |  11 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/imx/Kconfig                            |   9 +
 drivers/clk/imx/Makefile                           |   8 +-
 drivers/clk/imx/clk-imx8qxp-lpcg.c                 | 216 +++++++++++++++
 drivers/clk/imx/clk-imx8qxp-lpcg.h                 | 102 ++++++++
 drivers/clk/imx/clk-imx8qxp.c                      | 152 +++++++++++
 drivers/clk/imx/clk-lpcg-scu.c                     | 108 ++++++++
 drivers/clk/imx/clk-scu.c                          | 237 +++++++++++++++++
 drivers/clk/imx/clk-scu.h                          |  24 ++
 include/dt-bindings/clock/imx8qxp-clock.h          | 289 +++++++++++++++++=
++++
 12 files changed, 1207 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8qxp-lpcg.tx=
t
 create mode 100644 drivers/clk/imx/Kconfig
 create mode 100644 drivers/clk/imx/clk-imx8qxp-lpcg.c
 create mode 100644 drivers/clk/imx/clk-imx8qxp-lpcg.h
 create mode 100644 drivers/clk/imx/clk-imx8qxp.c
 create mode 100644 drivers/clk/imx/clk-lpcg-scu.c
 create mode 100644 drivers/clk/imx/clk-scu.c
 create mode 100644 drivers/clk/imx/clk-scu.h
 create mode 100644 include/dt-bindings/clock/imx8qxp-clock.h

--=20
2.7.4

