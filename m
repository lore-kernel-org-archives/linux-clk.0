Return-Path: <SRS0=uqeP=YJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79A9FA372A
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 11:57:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B43F218DE
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 11:57:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="fR2pEgXV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbfJPL5k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Oct 2019 07:57:40 -0400
Received: from mail-eopbgr10044.outbound.protection.outlook.com ([40.107.1.44]:62173
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726372AbfJPL5k (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Oct 2019 07:57:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XU2AriCXbxRmyZW3gxEYPsbzmvhi9AaAH7aDpBoBg8HAJaNC3r68VEEGs/XYgzuvawmKHmMS379Teo/IB0Qw1LdSE5gQdrkkFHxFZE5Eg5oGyWod0rDLFEurHB4uCOns/Og/ZwIEoxL0Ix5rTWZ7apRrjEzKlthYSejzW1HlL5v1UjFsO1CxxtJ6XPgF3dT3uZHzpyU4CMwObD0nmaUhZMvL4iD3rP1Ul93L+56dHAexiQZzOQ/6jNcmj9miibqU1pPYof/Xq3S8uiqINnB8+0W0qKhLDyrn1v4Pz3BSBuEbJV63f3J+xlahGqTQR8H7FA3d5IXfDjxsoIdqBHQBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Igz0DGIOV+UF1FSt19y8Zo2cEQjxmvUNM5ByR2jHTU0=;
 b=aaUz6EUPww82SMrOaL9n69xHVNdD0GjVmHLHiAQjnNbvf2sie7ylSLxm+hUr3gDGucir3XxHOqB28mqBBuf2eQkAmb5XgLjF+AvukSGx+XdkT8KkHeHqMY0lJKqJEQalfQPqjxP04hq4tAL89O59/0mN56yCalYFzNHWNt+wlReriL/czpNeZEP5jwELrt/p6UpW7leWEhywrgowQtVUFVe+gG3oDiwzhLZe0e8nW00NITlPAaF2aOB1gD2+OeAIhJ3B2Ae4mQ7k8aFtt0vrA16bXDxy1cPk7dd52aL48VVkaJMcHdknhWIL8UXdsOpvO1VuDpYsgM9wrEmmm2MYTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Igz0DGIOV+UF1FSt19y8Zo2cEQjxmvUNM5ByR2jHTU0=;
 b=fR2pEgXVdSZI1crsspmi2xw7Q3NeVRZUUElrEV43SkiFZ32OoeNOY8iwhYYIfhaCy7HiP5U5P/+0dUTAjy7A2FAfWVRPZP2vlnPIfvUkrrGeke0zttBWLAbb1PulBxXBFvcPjGWxtTncwYZ7N81jq0XoWMFj8l2/KzQZdWeJhRo=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB7136.eurprd04.prod.outlook.com (10.186.156.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.23; Wed, 16 Oct 2019 11:57:36 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58d9:b0f7:b31:c05a]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58d9:b0f7:b31:c05a%7]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 11:57:36 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>
CC:     Jacky Bai <ping.bai@nxp.com>, Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 0/3] clk: imx8m: Define gates for pll1/2 dividers
Thread-Topic: [PATCH v3 0/3] clk: imx8m: Define gates for pll1/2 dividers
Thread-Index: AQHVhBjm9h4luDsJQEWJmMzVqbMlUQ==
Date:   Wed, 16 Oct 2019 11:57:36 +0000
Message-ID: <cover.1571226979.git.leonard.crestez@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [89.37.124.34]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::19) To VI1PR04MB7023.eurprd04.prod.outlook.com
 (2603:10a6:800:12f::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4145f9a6-94ee-4e44-197b-08d752300956
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR04MB7136:|VI1PR04MB7136:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB713647A6E90C7935C258B311EE920@VI1PR04MB7136.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(189003)(199004)(50226002)(305945005)(26005)(110136005)(476003)(66066001)(71190400001)(71200400001)(2616005)(186003)(25786009)(8936002)(3846002)(6116002)(6506007)(86362001)(386003)(5660300002)(44832011)(316002)(99286004)(36756003)(7736002)(478600001)(52116002)(54906003)(486006)(102836004)(966005)(8676002)(81156014)(81166006)(6436002)(66476007)(66946007)(4326008)(256004)(6306002)(5024004)(6512007)(6486002)(14454004)(2906002)(66446008)(64756008)(66556008)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB7136;H:VI1PR04MB7023.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zAfUlkNRYaD2UJ3/MS+RBVSlXLkw+F/u9Jxwh0WvR5hAuPgoVIw2vpedXnh5e7kb5OOD64yznBBNvmWwTuBuHVIBjkIzwyN/1GmlbRNER0dyUzwCAnMhxJE75qhr/sQ8zxZoYC3rp8bmw8LrcH4ujX3D0/6R0fUjiWTIyuXLE+qaUWUT/OnKcNnO4BZvFQP28Ljo5DPF+YIbZYcAWx0JltigxSd3MMTnymZe7d2ElxNO/92FrdKIDUu+9yiCLqvRUlfu86Y9OsoF9cMCJ2/6B2rfoyJf0hUcyAbSdu5S3F3LbAPo9nRt8dAQ9NXSzMkHKDLKc5AGO7aMSY/zMnRFsxfyuQM79RsVNjFEbYWZLyfNltZ8CSt44QFbk1hrIEf7zvj64iGq1ZlSVcnu04Ei1ZhseQxw1cderR6MCNOVYmQg+cH0E3kuE38zL0B7frwejlRlB3YNqdQSTgKMvm0H3g==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A970E969D3A6B047B1C0553668B23F39@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4145f9a6-94ee-4e44-197b-08d752300956
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 11:57:36.6432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s6zUz6vQ+Kw/pXQSQSQauDiO/1tCKKTmMX7ufxyqFAyGpTpp9E/B6BoSJL94tmjnr2ie0b1pSJl23PQegUl8fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7136
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The fixed dividers for sys_pll1 and sys_pll2 on imx8m each have a gate
attached but they're currently unused so they default to "always on".

Add them to the clk tree for the sake of corectness. This could expose
bugs where parent clocks were not correctly enabled.

The new gates are added between the PLL and fixed dividers and new gates
are enumerated at the end in dt-bindings. This should ensure
compatibility, even though none of these fixed dividers are directly
referenced by peripherals anyway.

There are small differences on imx8mq because the PLL physical
implementation is also different.

Changes since v2:
* Rebased on top of next-20191015 which includes recent changes in
shawnguo/clk/imx, solving conflict with commit f0b1d7f2e7c2 ("clk:
imx8mq: Add VIDEO2_PLL clock")
Link to v2: https://patchwork.kernel.org/cover/11177851/

This was send with a different "email workaround", hopefully the patches
look correct on your send. If they don't please let me know and I'll
resend through another method

Changes since v1:
* Renumber 8mq 8mm clocks to avoid introducing gaps
* Improve imx8mq commit message
Link to v1: https://patchwork.kernel.org/cover/11141027/

Leonard Crestez (3):
  clk: imx8mq: Define gates for pll1/2 fixed dividers
  clk: imx8mm: Define gates for pll1/2 fixed dividers
  clk: imx8mn: Define gates for pll1/2 fixed dividers

 drivers/clk/imx/clk-imx8mm.c             | 57 ++++++++++++++--------
 drivers/clk/imx/clk-imx8mn.c             | 57 ++++++++++++++--------
 drivers/clk/imx/clk-imx8mq.c             | 61 ++++++++++++++++--------
 include/dt-bindings/clock/imx8mm-clock.h | 19 +++++++-
 include/dt-bindings/clock/imx8mn-clock.h | 19 +++++++-
 include/dt-bindings/clock/imx8mq-clock.h | 22 ++++++++-
 6 files changed, 174 insertions(+), 61 deletions(-)

--=20
2.17.1

