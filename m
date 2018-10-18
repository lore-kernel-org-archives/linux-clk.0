Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA81C5ACCC
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:53:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6E7E2086E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:53:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="mxVtQR7k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6E7E2086E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728406AbeJSAzg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Oct 2018 20:55:36 -0400
Received: from mail-eopbgr20075.outbound.protection.outlook.com ([40.107.2.75]:20928
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727294AbeJSAzf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Oct 2018 20:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ls6LXpnUGD1Ck8ixBy0tudeEWLH0sdgbjGZE26t8ZWc=;
 b=mxVtQR7kzRp+dqL23lBcgRbe6siaBTrtivTE1EzybXAcVBF9SonLmTKNNqHhLbzZxn41/2tD8iHWqEp9L4xhpUtmbilNJCbNuPL0gI0qNBHnjv9Mt+xk0npSnEvW7NkI68oRZRJSSYy+o3HhAIvlfk7bPRAcV2Ub8GHWD0YLW04=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4001.eurprd04.prod.outlook.com (52.134.90.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.25; Thu, 18 Oct 2018 16:53:42 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.033; Thu, 18 Oct 2018
 16:53:42 +0000
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
Subject: [PATCH V5 0/9] clk: imx: add imx8qxp clock support
Thread-Topic: [PATCH V5 0/9] clk: imx: add imx8qxp clock support
Thread-Index: AQHUZwMfysBum5nilUy7v6AZ9yIing==
Date:   Thu, 18 Oct 2018 16:53:42 +0000
Message-ID: <1539881347-20871-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0P153CA0028.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::16) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4001;6:gyDRgatpNVRi4e4DnpG5OvvM/TpEcfDTq4XI4YtP+TJizxBoK5pE0VmRAXCyEj+TJIue9MNw5xB4xV39v1dkW6jaUiR8cILmQVIPgslkuLG3F6lgQvz94SLydDuPoKkOKcE+MfvQXxzipgFguJBqoh3Mw0y03KhjNc4qpDaUB4s773GtBmjmRrsZ+7RV+yaLN/KblzrZvTriGf8zRyOVsLcUwpuK2ZpjzhJeea6Wtr9SgI5S5AT+MZUwVB3OwSf183q0FUNVDTePo13WJSEdhd6bFqD8CcjPF7H/XyuH36N2LMXDPgv51AcCphqlfmBETh3LhOeCArY7KNRYY8BdN7gXjOvMm6zFftkYgepxr0eOwNNCq8DKcxvG/gawNy9fdIcIkG6kSb0w77/REx/C5Oe5tDZVMuS5q7+aeHLz6QMAavfe9Kg8X1PDOT0FE0lMJbYBZSrmw+PyURrs4lLodw==;5:Pa93WrpWEkfiKyTWVL1xWtGlTnMZ+4ChUC54PralQ47FVlI2q41GpguizLBiG7YImfqOklHZX9Bz+llVbqClTOTE7vQr+tNksEu8h0n7U7DRAw+Mm0V4w3U2joNzAvMWcA58G9bivaAjxJh5TxOx7eQjROviGYLjvk9Y3EkWflQ=;7:q0UaL22P57tZRmASFUzDjcWt9kKQbtIM7l2XE+Z1etZ79IKLa4wqSm5CsQNsZGRbqalSJK4Bf18MVNthxaEGtOl1aL485p40qBDYW5suLnzZbQyLHQt9/tAAE3xLcFViPbRJhSTfwFAQyDHNHdZpHWUjXr9tJqZF1iEIku4tH1Gfv3963AXnSmyQvLgwmMPAl9K6HZSAXmaUppTxzrEW+7Mcjn26JKX3MGNsThaHq93lLeZBG2T+BusO+ismGpFo
x-ms-office365-filtering-correlation-id: 84f39fcc-409b-4a9a-6093-08d6351a423c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4001;
x-ms-traffictypediagnostic: AM0PR04MB4001:
x-microsoft-antispam-prvs: <AM0PR04MB4001028907B6D5E6DF5EF45380F80@AM0PR04MB4001.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4001;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4001;
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(54534003)(14454004)(6486002)(54906003)(53936002)(26005)(5640700003)(2906002)(102836004)(99286004)(2900100001)(97736004)(105586002)(52116002)(106356001)(2501003)(6116002)(386003)(6512007)(5250100002)(3846002)(71200400001)(6436002)(71190400001)(2351001)(6506007)(486006)(8936002)(36756003)(476003)(81156014)(8676002)(2616005)(508600001)(81166006)(25786009)(186003)(68736007)(86362001)(4326008)(305945005)(50226002)(256004)(14444005)(6916009)(316002)(6346003)(66066001)(7736002)(5660300001)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4001;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-message-info: mWtp9YUFK52Bum+0EpXZ4/6P122dMLW/WpW4OJVHnSQKpvRFUmT6HvXd9Gj0URQkyFgMo8zj4c7Hfw+JXBbS3CRfV4s1xOIfj1LRQSOkYXg0kp+zzUA3EopKwg9tlPgv+EWv39DGpTx1KUBrPWb8C58Ub4NxtdJEgAn2CrPiE/Hc/Hyyo0oCrMEIHHcP8qDU6P8jKmMcV8ajtd915eB2AOot2Crmhc01oCoV9jkOoBtmvfVSdvTMxCFjkmr7NOnt6o0xyqMyXNjvSaBTqX+AZEgFgohxgJfsHizRvlE//ZPU55XwawjY3WnB3w9rNfkP8rXehQCzPV1dk9kFlp4suIvR16AlwsmuX8QB/4sPySM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f39fcc-409b-4a9a-6093-08d6351a423c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 16:53:42.1412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4001
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series adds i.MX8QXP clock support which is based
on the clock service provided by SCU firmware.

Note: It depends on SCU driver which has already been merged by Shawn.
So this patch series could go through Shawn's tree as well.

ChangeLog:
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

Dong Aisheng (9):
  clk: imx: add configuration option for mmio clks
  clk: imx: scu: add scu clock common part
  clk: imx: scu: add scu clock divider
  clk: imx: scu: add scu clock gpr divider
  clk: imx: scu: add scu clock gate
  clk: imx: scu: add scu clock gpr gate
  clk: imx: scu: add scu clock mux
  clk: imx: scu: add scu clock gpr mux
  clk: imx: add imx8qxp clk driver

 arch/arm/mach-imx/Kconfig                 |  11 +
 drivers/clk/Kconfig                       |   1 +
 drivers/clk/imx/Kconfig                   |   9 +
 drivers/clk/imx/Makefile                  |  13 +-
 drivers/clk/imx/clk-divider-gpr-scu.c     | 130 +++++++++
 drivers/clk/imx/clk-divider-scu.c         | 171 ++++++++++++
 drivers/clk/imx/clk-gate-gpr-scu.c        |  87 ++++++
 drivers/clk/imx/clk-gate-scu.c            | 228 ++++++++++++++++
 drivers/clk/imx/clk-imx8qxp.c             | 422 ++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk-mux-gpr-scu.c         |  84 ++++++
 drivers/clk/imx/clk-mux-scu.c             | 123 +++++++++
 drivers/clk/imx/clk-scu.c                 |  17 ++
 drivers/clk/imx/clk-scu.h                 |  95 +++++++
 include/dt-bindings/clock/imx8qxp-clock.h | 362 +++++++++++++++++++++++++
 include/soc/imx/imx8qxp/lpcg.h            | 186 +++++++++++++
 15 files changed, 1938 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/Kconfig
 create mode 100644 drivers/clk/imx/clk-divider-gpr-scu.c
 create mode 100644 drivers/clk/imx/clk-divider-scu.c
 create mode 100644 drivers/clk/imx/clk-gate-gpr-scu.c
 create mode 100644 drivers/clk/imx/clk-gate-scu.c
 create mode 100644 drivers/clk/imx/clk-imx8qxp.c
 create mode 100644 drivers/clk/imx/clk-mux-gpr-scu.c
 create mode 100644 drivers/clk/imx/clk-mux-scu.c
 create mode 100644 drivers/clk/imx/clk-scu.c
 create mode 100644 drivers/clk/imx/clk-scu.h
 create mode 100644 include/dt-bindings/clock/imx8qxp-clock.h
 create mode 100644 include/soc/imx/imx8qxp/lpcg.h

--=20
2.7.4

