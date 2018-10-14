Return-Path: <SRS0=5HZW=M2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53ED9C6787C
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EE3420835
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="rB3u/GeV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EE3420835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbeJNPsd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Oct 2018 11:48:33 -0400
Received: from mail-eopbgr00067.outbound.protection.outlook.com ([40.107.0.67]:15923
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726115AbeJNPsd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Oct 2018 11:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Qf7u2nZnpVoeYdB1sEVn+cBxe8JEG1ziWG3ljcJgVU=;
 b=rB3u/GeV63XB2A2SOSdEjMiplN+oHI8f59niHm/hPF2nTPlwm+6XDM8rOv4LQO9/LtLxF00uCnRoyCxfPyuAUl+leszbAaUJ2cueo1mGW4ejNJDJI+jlIq4daMgVykNynKu6uJqD7gXKlcVqCgXBJ80o2Z/0oS9fkt4QXfH3AFU=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4435.eurprd04.prod.outlook.com (52.135.148.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.26; Sun, 14 Oct 2018 08:07:39 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.027; Sun, 14 Oct 2018
 08:07:39 +0000
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
Subject: [PATCH V4 00/11] clk: imx: add imx8qxp clock support
Thread-Topic: [PATCH V4 00/11] clk: imx: add imx8qxp clock support
Thread-Index: AQHUY5T5s44Lv5B3kEiDIjreoMLF+A==
Date:   Sun, 14 Oct 2018 08:07:38 +0000
Message-ID: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0056.apcprd03.prod.outlook.com
 (2603:1096:203:52::20) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4435;6:SU1uYokr2RB1MO+LF78Ys2D0wMOqy7bRzawVAAoOUN/fgHOduCukq64GvNBLLuLPwUFHJgLL97j/XbFf84XJtSpYJbid0VMZYgN6MWh/jz+cwxpSfaOYHa4nL3j7hqTky3J74Z0k1ySUyeT5TZpkSbAeFeGlv5+2n2z0ye9O7csF4ESW0ISxtEDfveKkoXble8/8EZD0A3VSKld03ZEu+rNPdS8Fyz7vy92hDtlZ3FUVYfSs72097flmlF1x6rDd7qf3hTf8wIgc4HxWaalO5YDuAPm382ibFhdTNqOqIJ602sTenai1+509Dt/pl9KxEdc5XECqk1jSwnTzhwAke46XdN1N1ZPqGdWSEwcq4bHZdi5vVVmNSDlqE3t8jbwWXkIg4vYanZ79JaY9RpePfsIZcz9MTppGa8HV2Ao6v05iXCLvuMoRLSdxQJjeOuMOCL+PbkNeiOxM9fnkAqxm3g==;5:LNhWC6DSiXU68i9qtz3qBNmXxzAwEzYRLHckchOPmcXqDMTST0mxKJHmWtVSp+wm4KddpmxpQf39BuhvlSqZglrqQMMyUA4rrBL1Q2u9GQx+NXn0ZalnGOTf2ehdxGeV0V+gIzqSV6lnwOA2c9Lv17vi7w2UHuY5O5zMjdsXufw=;7:i5sXBvliy1JU7XN07opplnQDG6FNrxCNfPsXGB2dMshpLDsXU9ehPk2b6vOAigLvKLtNTOLWMtL6nkErOCrsnHVUHuBMkRBgNF4yrpj5ZrywGOyyxlHYPq43nhwGYjyEzA31KE767dd/GvAx26D1IrSoLEaqoj8CLU1vZg79qfYx1bAgVhiaSZCzm5Ux6GNA3wlSqZhpOiBYQBPv3szFru2lwC4+KPCHUpXET3KdBMW9apNXYY7jGApJv1qzHr0H
x-ms-office365-filtering-correlation-id: 6411d694-a0eb-4b3a-9e76-08d631ac1b70
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4435;
x-ms-traffictypediagnostic: AM0PR04MB4435:
x-microsoft-antispam-prvs: <AM0PR04MB4435CEE41D2ABDC02355387680FC0@AM0PR04MB4435.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991067);SRVR:AM0PR04MB4435;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4435;
x-forefront-prvs: 08252193F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(136003)(396003)(39850400004)(366004)(54534003)(199004)(189003)(6436002)(186003)(5640700003)(386003)(6506007)(316002)(36756003)(52116002)(2351001)(99286004)(6512007)(106356001)(6486002)(26005)(8936002)(86362001)(476003)(2616005)(8676002)(5660300001)(102836004)(486006)(81166006)(81156014)(6916009)(4326008)(54906003)(2906002)(66066001)(14444005)(71190400001)(71200400001)(256004)(305945005)(5250100002)(25786009)(2900100001)(97736004)(7736002)(50226002)(68736007)(478600001)(105586002)(3846002)(6116002)(53936002)(2501003)(14454004)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4435;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: T5fzEe71VuXGwa8HyJRQxduwuO0BREMeNcowEYRfyLpCcDx/b+NuyJK5SJ1wa/yPEOzECmWNjkJdcB4LPiff0RA8G5cSc0PVrCGHcKlgXybWL3WKhpdrlOFakLou8owIiuPUBgoJHCskHuyM99qhjktafNDcrV41LVtC0WaykqE7twNeDRDoaZAvHo/xdK54XNPcljC8kHYtt/A7PNzYmqjzUCpPn0o9/dZBJd5unMwkzOYr/jCJVDQos5hkbjSyKED4k5Skx7cthns5gVnly8lh4psb5Hl/1+tCKaBzsbkqhPYK3vV6GQ76JWnvoXTQQX5/XiYsmgEoyiMO43n9iiudYVLaMfOxkgf2qIs8Pss=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6411d694-a0eb-4b3a-9e76-08d631ac1b70
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2018 08:07:38.9368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4435
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series adds i.MX8QXP clock support which is based
on the clock service provided by SCU firmware.

Note: It depends on SCU driver which has already been merged by Shawn.
So this patch series could go through Shawn's tree as well.

ChangeLog:
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

Dong Aisheng (11):
  clk: imx: add configuration option for mmio clks
  clk: imx: scu: add scu clock common part
  clk: imx: scu: add scu clock divider
  clk: imx: scu: add scu clock gpr divider
  clk: imx: scu: add scu clock gate
  clk: imx: scu: add scu clock gpr gate
  clk: imx: scu: add scu clock mux
  clk: imx: scu: add scu clock gpr mux
  clk: imx: add common imx_clk_hw_fixed functions
  clk: imx: add imx_check_clk_hws helper function
  clk: imx: add imx8qxp clk driver

 arch/arm/mach-imx/Kconfig                 |  11 +
 drivers/clk/Kconfig                       |   1 +
 drivers/clk/imx/Kconfig                   |   7 +
 drivers/clk/imx/Makefile                  |   4 +-
 drivers/clk/imx/clk-common.h              |  27 ++
 drivers/clk/imx/scu/Kconfig               |   5 +
 drivers/clk/imx/scu/Makefile              |  12 +
 drivers/clk/imx/scu/clk-divider-gpr-scu.c | 129 +++++++++
 drivers/clk/imx/scu/clk-divider-scu.c     | 176 +++++++++++++
 drivers/clk/imx/scu/clk-gate-gpr-scu.c    |  87 ++++++
 drivers/clk/imx/scu/clk-gate-scu.c        | 222 ++++++++++++++++
 drivers/clk/imx/scu/clk-imx8qxp.c         | 425 ++++++++++++++++++++++++++=
++++
 drivers/clk/imx/scu/clk-mux-gpr-scu.c     |  90 +++++++
 drivers/clk/imx/scu/clk-mux-scu.c         | 130 +++++++++
 drivers/clk/imx/scu/clk-scu.c             |  17 ++
 drivers/clk/imx/scu/clk-scu.h             |  97 +++++++
 include/dt-bindings/clock/imx8qxp-clock.h | 362 +++++++++++++++++++++++++
 include/soc/imx/imx8qxp/lpcg.h            | 186 +++++++++++++
 18 files changed, 1987 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/Kconfig
 create mode 100644 drivers/clk/imx/clk-common.h
 create mode 100644 drivers/clk/imx/scu/Kconfig
 create mode 100644 drivers/clk/imx/scu/Makefile
 create mode 100644 drivers/clk/imx/scu/clk-divider-gpr-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-divider-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-gate-gpr-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-gate-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-imx8qxp.c
 create mode 100644 drivers/clk/imx/scu/clk-mux-gpr-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-mux-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-scu.h
 create mode 100644 include/dt-bindings/clock/imx8qxp-clock.h
 create mode 100644 include/soc/imx/imx8qxp/lpcg.h

--=20
2.7.4

