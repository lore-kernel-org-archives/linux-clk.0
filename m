Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B96C282C3
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 13:22:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD9E821855
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 13:22:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="aSDjtYF8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbfAXNWd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 08:22:33 -0500
Received: from mail-eopbgr60054.outbound.protection.outlook.com ([40.107.6.54]:44303
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727622AbfAXNWd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 24 Jan 2019 08:22:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkTrU/Z/IrMhEYbdefyVVws/5/Ejs4Dzo4IZMeSxb0c=;
 b=aSDjtYF8dMygxS3ANP4eNIsxWaRBMMJfX167maPyJNNiguh0Q2EKjt15qcpgdVUm9hkUHO/Ep8BaYPQbvH27oQHF9+Dj9BQgYp1oRhFtfqq3cqZaX02M/1Deraun8Gh2kJgpYTnoPDc2rDeFeXLuVblxA5yKdx8JjCTTkMZ6dps=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5443.eurprd04.prod.outlook.com (20.178.112.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.29; Thu, 24 Jan 2019 13:22:28 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1558.016; Thu, 24 Jan 2019
 13:22:28 +0000
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
Subject: [PATCH V3 0/5] dt-binding: clk: prepare for imx8qm clock support
Thread-Topic: [PATCH V3 0/5] dt-binding: clk: prepare for imx8qm clock support
Thread-Index: AQHUs+fa4FLqgxNzK0m2acNYnGEA7w==
Date:   Thu, 24 Jan 2019 13:22:28 +0000
Message-ID: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0041.apcprd03.prod.outlook.com
 (2603:1096:203:2f::29) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5443;6:nGaKd6xAVX9JVAMXtFqEqoq5uzHbY6w4XfXUE0zEONrcxUoE6+7tae2ftPZ60Z9lUMuyt/T0Uy3l+d+Hv4Rxp+gP3qJmLi8wx9ZZJQhuGT8HHlBKL0a1LkWWj1LGw+1oW4T7sVPJJI+0BpKoo8aFJX+GXfr/ZptCnzhL4Pa0dbaWmYYG0WU65hxLpgJ+6fuWkNKaWjKqzqXodXqR+qj9EprwukP1zRSLh1YJAz/JM+ag0Wby51mRmaUVDMBTVFVrWooCj9r6hlxYNb8Fu+FwwZqb2mdrm/4ggjcrQhs6wjIP2KSqn3Z81NSC1GXCJ3UGjtJ5BOzx2PBUdXJMv99lPxu+7LqaruNL4CiILwiPWrL0BVDSaT94pLeqzbyQExCBwwAewYBwbuIik2emHxDM2vPeeP83kjyet4J4iT9addsKKgNJkWvf3+7OBhl2q0vtdu/jSjv//+9a9xqumQFu5w==;5:JiPgrhjDOdy4LFFnl/tgiTZW0VZV0Ye4WpsfYgCSeUtT17TPkeeb/vaJf6sACFS90f+gqhkeWEjo0jChg7dYpUPrKa/3zvN+v44gAuAxSP1Y5ug3GSFBn8FxnPtjdlpX72IPOfp2ed/chiDPEisIq01YsuQ+6bFQ0lRoto0K+rdCZwgLq1ra2XlgQrUjJb0GkLhJhgTgTpAnUVNyb3207g==;7:4Lc6kr7WoQdlkUBG4aWLuQN+/tNzh90LsqIB2cXh24zxpPBhTK5U2MSt8UKfxK73vHVSXL9jjoIKK2X+jZC1B1mNnYoIFd0m2n4gI2SPjN0sWYTjqcjkVsZORtNKisY1F3QjOPeabMWjQB6XcDRUAQ==
x-ms-office365-filtering-correlation-id: 8dec270b-ee3b-4c32-4e45-08d681fefc8a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5443;
x-ms-traffictypediagnostic: AM0PR04MB5443:
x-microsoft-antispam-prvs: <AM0PR04MB54433CC869414E3F35D3966A809A0@AM0PR04MB5443.eurprd04.prod.outlook.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(50226002)(6916009)(5640700003)(6512007)(6116002)(66066001)(305945005)(7736002)(486006)(44832011)(97736004)(86362001)(99286004)(316002)(6486002)(68736007)(81156014)(106356001)(81166006)(6436002)(8676002)(8936002)(54906003)(476003)(2351001)(2616005)(71200400001)(14454004)(102836004)(2501003)(2906002)(105586002)(36756003)(71190400001)(478600001)(4326008)(186003)(52116002)(256004)(3846002)(14444005)(53936002)(26005)(25786009)(6506007)(386003)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5443;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Puw9tgypilWjMx7H5oGQljJlYEll/969ekaw5cJc24L5DBs60q0oYVNH2uQ23Hfzib08QjTzwPIOCnTu0DwuCXnMkaDt6P1XgUzvD163Y/48RjZ5m/n7mAD4d+Y6yXSNWfwvq0K7NUwW8hZmqDNsPQlmgAkQMlSuqWRot39erl+ARZJrXXrVmEkXT/v+FUu4gkG3SYLZTjp4oiIgFztds/8XdlYZbP2zHQnUfER4KYX3v8fkd/M+USmiHmKd8Sr0YCQbGmmWr/U1f3OdCNMbdcnS38iSyqsWCmw4+AMMAIe1Jh6x7j9IkFaGsvzAVFZQYuWAZXudq+F1dS4UEXhVCQcx7pFP0HS9mFrgF3dMYebWae+Uhjykd59yuDQhUDN/abstdn2rvjrMZlMQNNYzOc5avrwI8/Rf5nkgqWkWN4Y=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dec270b-ee3b-4c32-4e45-08d681fefc8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 13:22:24.3267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5443
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After a bit more investigation on IMX8QM, it seemed SCU clock can be used
in a similar way as IMX8QXP. So update the binding and driver to be a bit
generic for easily extension of IMX8QM support later.

Dong Aisheng (5):
  dt-bindings: fsl: scu: add fallback compatible string for clock
  dt-bindings: fsl: scu: add imx8qm scu clock support
  dt-bindings: clock: update CPU clock ID name
  dt-bindings: imx8-clock: add a53 and a72 clock id
  clk: imx: scu: add fallback compatible string support

 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 7 +++++--
 drivers/clk/imx/clk-imx8qxp.c                               | 1 +
 include/dt-bindings/clock/imx8-clock.h                      | 7 +++++--
 3 files changed, 11 insertions(+), 4 deletions(-)

--=20
2.7.4

