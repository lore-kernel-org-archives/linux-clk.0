Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4759C43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 14:12:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AF2E2147D
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 14:12:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="LHHfW80j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AF2E2147D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730914AbeKVAqy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 19:46:54 -0500
Received: from mail-eopbgr00061.outbound.protection.outlook.com ([40.107.0.61]:25440
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726004AbeKVAqy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Nov 2018 19:46:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTcdbAqVSiuVE/e6am9mVTdIXouobANxOz9mIqFg0ew=;
 b=LHHfW80j3tyf1HU2XEl+4jNx7ijgxoIzT48BvbQtGg8cE95gg0ZRA8aWLW63ppavE7nf+WXbN7PvR2wnXpQhyuWPN+S2t4VUalTh7BVZ/CcBsEoyt08ipCwXk5xlmcaWAnwferAol99vNsbA4n28b62yHguZAKn0sFpvWDHUh88=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4081.eurprd04.prod.outlook.com (52.134.125.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1339.23; Wed, 21 Nov 2018 14:12:16 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1339.027; Wed, 21 Nov 2018
 14:12:16 +0000
From:   Aisheng DONG <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng DONG <aisheng.dong@nxp.com>
Subject: [PATCH V8 0/7] clk: imx: add imx8qxp clock support
Thread-Topic: [PATCH V8 0/7] clk: imx: add imx8qxp clock support
Thread-Index: AQHUgaQ07UOrlEn65UOyxxVfjCE+ww==
Date:   Wed, 21 Nov 2018 14:12:16 +0000
Message-ID: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4081;6:LbNMVeP3jDXiAKW0r5ZygjVwsDjds1aPBqX4nWw4for2pCyqt6Hnnqt3jkPJPdxlC7d+I1sYu5gHKJtAkl9IlbZLfjdPzL6MKRI4+lc24LOKrqdy0RDM3s17NMTNpS8M4h4p0DxTmezNMooVpDdeZufDfuhAh7PhE5J7KJDKdzDwnraqGxjnyFMgS4Q7pTVffMw+xB/uqcGS8AniYYKHD+cMSFKGtd1tyFofd1mPHiK3MskH8tvo8If7+KDPCyuCKfzc/RoqZ5aG99LjLpFo2Ju+YbQ8btIaw9vVvMQIzjGOPYZgypVbGzA9V8bRUJ9x9AA4eioWnrjTWzuyVsxsi/RmjPAIxrLWP3MmwEpkASrjeEkziJyoSFOpqZNg7CnCtv8JhpXUoMdnNvivdXa9Zo98q0pjcVk2ztkApZHkRIyyWdsXbpaQoimR/lNeZKgX+zcXMrkQCFC6QmLJboqBpQ==;5:3NP6TR19+lzfy+vY9m3UDJpqkgP3hUgvIayhuNDDOMg9nkgrQ7XeIAWDH2q2iCLcJD2yrDLhYPy3XoRCn8aQ/MelgUH3iGgusMq+AR4TFsfuz4Gu+3Eo7iLKle6AsTExIm5Fa5Y8lB7yGYuwlxMk6P5hf2vofoXwzfwYw1RF3bE=;7:ShXH4wIfBPHNcKIHDQPp/yvWOl57PyR3CRDIhbg4vG8v6/CO4Yd/OPGkzGdE2azsXTlxCN6kNv6m88QowBnf4XORdo8oKLSGpy93X9w80gCMKbmqv1WxMaQoyMKvjMxiiXpPl2i2bp33sNGIgpQ/cw==
x-ms-office365-filtering-correlation-id: e2ca6ce3-8cbb-45d0-743f-08d64fbb56e4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4081;
x-ms-traffictypediagnostic: AM0PR04MB4081:
x-microsoft-antispam-prvs: <AM0PR04MB408106BABCE03CA6266C6D9380DA0@AM0PR04MB4081.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231442)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4081;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4081;
x-forefront-prvs: 08635C03D4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(396003)(376002)(39860400002)(366004)(199004)(189003)(54534003)(6506007)(386003)(54906003)(2900100001)(105586002)(66066001)(50226002)(26005)(3846002)(102836004)(2501003)(186003)(6486002)(305945005)(7736002)(4326008)(8676002)(478600001)(68736007)(52116002)(106356001)(2351001)(5660300001)(316002)(14454004)(6916009)(5640700003)(81156014)(25786009)(2906002)(81166006)(2616005)(476003)(486006)(86362001)(6436002)(6116002)(97736004)(71190400001)(14444005)(99286004)(53936002)(6512007)(256004)(8936002)(71200400001)(36756003)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4081;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: V5AmbHNGQf4zReTX4R7WR0yOt8u80DfCpu4RYCLlEdBYERZKltdBjojsHXHThwvwlWTkikiU8nW9Dv22uNMh6XORaSt+Ad3McB8Y50++2VKlvaOdSIk3h93MuwL332P6V+JPu28SRG4+TrxgZ9ov7Akxlm5vxYcebQSWUmVpQd0xJUdcLaR+SJNHsqtvqWToeM5to/x5R9LZy5M5mR5FrDHTuD8jzWkLQVG1zDF+q6/mFUXqsqVj5kaBrTvlr9n2TQUoqHrILW0OEJ+TVlW0J69lsGL225ACN9IsPYj9QsQeMMY2/zeLX9irJNx02lxa3/SAUqpM693DpVj8vLvIrbOGm8K4Ru/GOciw5SMfliA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ca6ce3-8cbb-45d0-743f-08d64fbb56e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2018 14:12:16.1357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4081
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series adds i.MX8QXP clock support which is based
on the clock service provided by SCU firmware.

Note: It depends on SCU driver which has already been merged by Shawn.
So this patch series could go through Shawn's tree as well.

ChangeLog:
v7->v8:
 * add more kernel doc for lpcg and scu clock structures
 * remove one unneccessry reg checking
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
 drivers/clk/imx/clk-imx8qxp.c                      | 153 +++++++++++
 drivers/clk/imx/clk-lpcg-scu.c                     | 113 ++++++++
 drivers/clk/imx/clk-scu.c                          | 267 +++++++++++++++++=
++
 drivers/clk/imx/clk-scu.h                          |  24 ++
 include/dt-bindings/clock/imx8qxp-clock.h          | 289 +++++++++++++++++=
++++
 12 files changed, 1243 insertions(+), 1 deletion(-)
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

