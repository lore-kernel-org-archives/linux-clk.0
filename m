Return-Path: <SRS0=kVDh=NV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07B6C43441
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 15:19:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F0F720858
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 15:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q0LG3Ni1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F0F720858
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbeKKBFL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Nov 2018 20:05:11 -0500
Received: from mail-db5eur01on0063.outbound.protection.outlook.com ([104.47.2.63]:6041
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726068AbeKKBFL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 10 Nov 2018 20:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rKyKxju+K3DbSBusGTHNqjbDH0t5iqNX8bHbPprW2E=;
 b=Q0LG3Ni1kO5YKBHd0dZ86/wDoiPqqQ9z143QVudQmJ4fOw0WU4dJSMivWH+j9kmm0+lrWptAbqmVNJN6ZwDHpFDQhugUYbyghurCUSfXlCzbU2GyvDoOT6OzmypL8v95/wJh3kRS4/aFEdjhFFBJ9yKczK8X4DoRd5fFnfLih84=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4067.eurprd04.prod.outlook.com (52.134.125.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Sat, 10 Nov 2018 15:19:46 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10%2]) with mapi id 15.20.1294.039; Sat, 10 Nov 2018
 15:19:46 +0000
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
Subject: [PATCH V6 0/6] clk: imx: add imx8qxp clock support
Thread-Topic: [PATCH V6 0/6] clk: imx: add imx8qxp clock support
Thread-Index: AQHUeQjQFr2CFvfrBkCwaBiV+7lOJA==
Date:   Sat, 10 Nov 2018 15:19:46 +0000
Message-ID: <1541862894-8209-1-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4067;6:MjaiZJL5hYVvI9NAodEH7TNOO06jiEzadNwEIgJEgZRSSvunv8SZABR+lPH/rGAIWJsJrAiFqSpNrfbwI/Vvf6liwjwh5O9kdmWAJHV9uXVXorRopdz3huHVFjQiqdS4C/qY0aJiDcQTJUrmVGQ8ilqTDF+n1Io+438WwVm9DpmxKXUTdaSL+ljRyFD0MS3Ejup9Aha2Ig5HI1dVUr6ehBcRn7ePoKAxEYVLmhuKyvox+bQEfMcp625Wc7tqogBy6JdPVocCmL7f4bDOB3XmtK/m0nnzJawghLjueDbwLkLR2gEYzIs/Hg0VQKl8aqFaWnuVd4K2AjqINo5rA5BQY2zXBc2QJlp/qELx4Libjvwvcx1WrLTtfflX7CarNnAwZ6+aHSRH7Esa9gazpq4jn+kwIp4fLm5J2f7o1b2g7d/pgB+ghXQnZlTGEYQQRkrtJ8VHyNabuh9+8RhOEzIHrA==;5:JN7ro/ZXbv5nFozEuc6obqdzsk9q6UljSkuHJy79RN4xg5vi5Tsg/5cJ+nxTxFj0xEFA9iKvP0flGzlkyYfnC7Kefe/1vSmfKfc3H4I9jaAyXsb2n0TmziZ79V7k25DvdB/q96bLa5i7ENbxDtVj1TX0qYh9jFFUvgLi8DzI6Pc=;7:cQmWc4d/81IBOVnHAXeMR7WXm8+JGWOsguRg+wkXUu89jZkcCqTIl+tMVEWztx6awsOR/QhrHRCv7eb8/KozBUYSSfZw7uELS0eoBSW5t+4+wLotHCGq4S6k6eEKm7RFpNBIrboWf7QXAt8bjdAMww==
x-ms-office365-filtering-correlation-id: ee0a628c-4dd0-405f-1eb7-08d6471ff2c7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390040)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4067;
x-ms-traffictypediagnostic: AM0PR04MB4067:
x-microsoft-antispam-prvs: <AM0PR04MB406719025D0F3A3C8E4E9A2380C70@AM0PR04MB4067.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4067;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4067;
x-forefront-prvs: 0852EB6797
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(396003)(366004)(39850400004)(136003)(54534003)(189003)(199004)(2501003)(25786009)(50226002)(71190400001)(4326008)(97736004)(2900100001)(14454004)(8676002)(99286004)(186003)(8936002)(53936002)(52116002)(5660300001)(102836004)(81156014)(81166006)(68736007)(386003)(26005)(71200400001)(486006)(6512007)(6506007)(66066001)(5640700003)(2616005)(476003)(7736002)(305945005)(86362001)(6116002)(6486002)(3846002)(36756003)(6436002)(316002)(54906003)(478600001)(105586002)(106356001)(256004)(6916009)(14444005)(2906002)(2351001)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4067;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: S/1wADuNFMWmSeB9khAqPsEMeu5IYMc6rzxAIs778SmyGotEvslKmzstVSxVYp6/6LqYCVmg68E+qQXLem2hgtSzjkAFOoxhoAszEBsi6XDBZAg9TnVsqsB3G7rYXWXHFbcmRmuvvowGQZVdVvF9VCYp47u421Z9G4h29hYy9qVFMatIcqgLXUiTeqGiq69FCLke2FB12ZnGCXWguFjOApmO8ah9BvDSS4JMs0iThUJvZkE0OZyCYYdeY5X/CSDIiXlJVIDPOp+19zh8w9Lp0TKJYXN0rIKq/4CKwntz9l7j+F+UIpRQMA7trAVxUHTmEfB3IvnVkzNXr8nngvFmJZqTFnkJXm5hzIn+3iZUsJo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0a628c-4dd0-405f-1eb7-08d6471ff2c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2018 15:19:46.4789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4067
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series adds i.MX8QXP clock support which is based
on the clock service provided by SCU firmware.

Note: It depends on SCU driver which has already been merged by Shawn.
So this patch series could go through Shawn's tree as well.

ChangeLog:
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



Dong Aisheng (6):
  clk: imx: add scu clock common part
  dt-bindings: clock: imx8qxp: add SCU clock IDs
  clk: imx: add imx8qxp clk driver
  dt-bindings: clock: add imx8qxp lpcg clock binding
  clk: imx: add lpcg clock support
  clk: imx: add imx8qxp lpcg driver

 .../devicetree/bindings/clock/imx8qxp-lpcg.txt     |  51 ++++
 drivers/clk/imx/Kconfig                            |   4 +
 drivers/clk/imx/Makefile                           |   6 +
 drivers/clk/imx/clk-imx8qxp-lpcg.c                 | 198 ++++++++++++++
 drivers/clk/imx/clk-imx8qxp-lpcg.h                 | 102 ++++++++
 drivers/clk/imx/clk-imx8qxp.c                      | 156 +++++++++++
 drivers/clk/imx/clk-lpcg-scu.c                     | 108 ++++++++
 drivers/clk/imx/clk-scu.c                          | 237 +++++++++++++++++
 drivers/clk/imx/clk-scu.h                          |  24 ++
 include/dt-bindings/clock/imx8qxp-clock.h          | 289 +++++++++++++++++=
++++
 10 files changed, 1175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8qxp-lpcg.tx=
t
 create mode 100644 drivers/clk/imx/clk-imx8qxp-lpcg.c
 create mode 100644 drivers/clk/imx/clk-imx8qxp-lpcg.h
 create mode 100644 drivers/clk/imx/clk-imx8qxp.c
 create mode 100644 drivers/clk/imx/clk-lpcg-scu.c
 create mode 100644 drivers/clk/imx/clk-scu.c
 create mode 100644 drivers/clk/imx/clk-scu.h
 create mode 100644 include/dt-bindings/clock/imx8qxp-clock.h

--=20
2.7.4

