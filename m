Return-Path: <SRS0=xK8l=PT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623C5C43387
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 11:55:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CCE72064C
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 11:55:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="gbCpXFnk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731136AbfAKLz4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jan 2019 06:55:56 -0500
Received: from mail-eopbgr20075.outbound.protection.outlook.com ([40.107.2.75]:7344
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729237AbfAKLz4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 11 Jan 2019 06:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/abhdxDsoRDZzzYz5/fS94OHFE3/omLYdPTeSc0zfo=;
 b=gbCpXFnkgfBISFOQszSjQegGU0TnFrHhL6FnAddcXS84++6ltobXP5GJpZvwl4lAmrBVLP3v/4b0zOwkKnY5JICwLFsVyydytlIQET6CIB5gKfB40KfsWxvMTiT5rNz95iYusoy5vwSoRa1FyZemp5KTI1CGxuzW4UVkDmmidG0=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4659.eurprd04.prod.outlook.com (52.135.149.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.7; Fri, 11 Jan 2019 11:55:52 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1516.016; Fri, 11 Jan 2019
 11:55:52 +0000
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
Subject: [PATCH RESEND v1 0/4] dt-binding: clk: prepare for imx8qm clock
 support
Thread-Topic: [PATCH RESEND v1 0/4] dt-binding: clk: prepare for imx8qm clock
 support
Thread-Index: AQHUqaSa8HQ124jcu0KqZJxAJsOAcg==
Date:   Fri, 11 Jan 2019 11:55:52 +0000
Message-ID: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4659;6:sXYNBVakw1oa3KAzN3S01Hnmml2Nf9F/uhjxfmYKAhqi0R4OObLoQGxOclcMBviz4i7eqjtv4qfDj5KdF4iCi5Z0n8fRi9eaj3S17NzG/Y3uALmjEhncwHmPhzjtVMFdyxpjUy5IX+JTYJpae665YG+Y9ChEFYHcYp28g/ML4Se7i55kM1ZMHMvAv84erwcARxF+Q9Z5f3gf5AH/zOFYrMELrxrK4+cBP/pmndHHQh9hwSZhZNXnQdhLiuQhcKz5MHG9+NxtTeX3y8GDPXup2Vobxfv2JVT0FefUf+ODc3F63GJheoYzJ1VGtVnouDZmbyHcE2qXGuSp60BWxFCDMCHxGRuFFfa0DhXwbgIo9Odm0ItHtGn1OOrqNZJESH79pBCcB3QzX38UIUR9v5jCUDW1HhXtMIbx/CazoP+ZahWzd+6KbjPWsAQnrhrjtru/7gyf1BeAPhcrkkcx+m1v2Q==;5:fs84m0oK+BuoWM67HNog4XFUdC0nQbd132Xx8NqawF/UDGv5WHBbw/i0xXyDvxs5GA2+CBwJX2vIP4zxLeNUNgrT26wRQ8FsHweKxu6Bnq5LLvmO+56bnbYgw8VdgPB5RfJ5cfmFnGJGTmRCOLUBrW9bxnkUfP3qJI6wee4z7jpprkHI88Cp3Lxm8h02FwGCDQ3NcH3dMSqEEVOdbpbJ9A==;7:SfFXiSsPlVwvAQwoASa+AQ0k23rr09KMy0ZQJgknSo0tM/zNkkRE4baQJthYlzOdps7sfhy9hCY00EJns/H7TgTpeJVMoN21rQIq7JHFK+T0/I4QwqR8oWU7xmj0LN7ZMqbDmrS365SJtAFOFDUOXg==
x-ms-office365-filtering-correlation-id: f01bd4c9-c8b4-4d0f-8d72-08d677bbbc48
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600109)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4659;
x-ms-traffictypediagnostic: AM0PR04MB4659:
x-microsoft-antispam-prvs: <AM0PR04MB465972F5021DEF2E29C8CEA080850@AM0PR04MB4659.eurprd04.prod.outlook.com>
x-forefront-prvs: 09144DB0F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(366004)(199004)(189003)(478600001)(316002)(2351001)(54906003)(14454004)(68736007)(186003)(105586002)(106356001)(86362001)(4326008)(71190400001)(71200400001)(6486002)(52116002)(53936002)(5640700003)(25786009)(6436002)(2501003)(6512007)(5660300001)(97736004)(44832011)(256004)(99286004)(14444005)(102836004)(6916009)(217873002)(26005)(6506007)(6346003)(386003)(305945005)(7736002)(36756003)(50226002)(2616005)(486006)(66066001)(2906002)(476003)(6116002)(3846002)(81166006)(81156014)(8676002)(8936002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4659;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bHTddeNVY+wiGY1MofvKWMXTN7G/qyVaeVYiaFHqHRkDj4UCYr83oS5da8RyYqZ4KdRvgtTHvXn/H5i1L/q+wuVs0yoCxEMDoWWVtKdkY0U1XjdLSvDZgZ8gkTMGabFKwlvHPHbOp5xxyBY6zOmMnn/aXn6bT9M3QWftCOX4UBKO+EeV/ShH9ULzHUutInR3PBi/nEdwQbHuw5hDPRRsZ7U7q/vP//FjkDSahxRNSRczQUlGbn9JSiGOI7Ewi4khQYtXQH59kY8Wt29wGeTP9QxXOAn+mNtXZmqH26wDbMxh0U411+bSqvXoR/FcSp/UO8gc0r4mknerf6+eWvEBTzFVX3LdZbZ1SKLfoqm+AOEDrKgtD/PEGcSG6PyucI64ehlhbMU+Crq9edAh9GpFMY8Z/z6TLN/OE/VPia0rjO4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01bd4c9-c8b4-4d0f-8d72-08d677bbbc48
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2019 11:55:48.5679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4659
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After a bit more investigation on IMX8QM, it seemed SCU clock can be used
in a similar way as IMX8QXP. So update the binding and driver to be a bit
generic for easily extension of IMX8QM support later.

Dong Aisheng (4):
  dt-bindings: fsl: scu: add fallback compatible string for clock
  dt-bindings: fsl: scu: add imx8qm scu clock support
  clk: imx: scu: add fallback compatible string support
  dt-bindings: imx8-clock: add a53 and a72 clock id

 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 7 +++++--
 drivers/clk/imx/clk-imx8qxp.c                               | 1 +
 include/dt-bindings/clock/imx8-clock.h                      | 6 ++++--
 3 files changed, 10 insertions(+), 4 deletions(-)

--=20
2.7.4

