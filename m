Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D731EC10F14
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 14:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A5AF32171F
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 14:10:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="q1NrGqIR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfDLOKL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 10:10:11 -0400
Received: from mail-eopbgr150089.outbound.protection.outlook.com ([40.107.15.89]:58318
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726833AbfDLOKL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Apr 2019 10:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P8/Nw60t8cYtqldX3Uqt0S51k7KzKlzHNheprcuw2E=;
 b=q1NrGqIRpiztHqvV9nTyRA6hlyo7xMDFO1kWYeig0BzVOL3arCFa+iUMPeSAT1KwuiSpwF349/NogVjRz9D9YEb37VSDzronTeXWWIeLXyRmwMgq9aGgP1b2A5BQb69Q75uSpEwhD3+M1Ugp+ZWESJAJD5bAM1InmOm6e7pRro0=
Received: from VI1PR04MB5533.eurprd04.prod.outlook.com (20.178.122.159) by
 VI1PR04MB3181.eurprd04.prod.outlook.com (10.170.229.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.14; Fri, 12 Apr 2019 14:10:04 +0000
Received: from VI1PR04MB5533.eurprd04.prod.outlook.com
 ([fe80::cca7:43cf:dc13:a822]) by VI1PR04MB5533.eurprd04.prod.outlook.com
 ([fe80::cca7:43cf:dc13:a822%4]) with mapi id 15.20.1792.016; Fri, 12 Apr 2019
 14:10:04 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
CC:     Robin Gong <yibin.gong@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Angus Ainslie <angus@akkea.ca>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        "linux-pm@lists.infradead.org" <linux-pm@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: [PATCH 3/4] arm64: defconfig: Enable ROHM_BD718XX PMIC for imx8mm-evk
Thread-Topic: [PATCH 3/4] arm64: defconfig: Enable ROHM_BD718XX PMIC for
 imx8mm-evk
Thread-Index: AQHU8TltvLhxhUkMPkOVm9/kU7UcUw==
Date:   Fri, 12 Apr 2019 14:10:04 +0000
Message-ID: <31905a9f97f4195b705cb9e853976aa3e9f6b144.1555077720.git.leonard.crestez@nxp.com>
References: <cover.1555077720.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1555077720.git.leonard.crestez@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.146.100.6]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: VI1PR07CA0132.eurprd07.prod.outlook.com
 (2603:10a6:802:16::19) To VI1PR04MB5533.eurprd04.prod.outlook.com
 (2603:10a6:803:d2::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 442241b7-bdc5-48ad-507a-08d6bf508f82
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3181;
x-ms-traffictypediagnostic: VI1PR04MB3181:
x-microsoft-antispam-prvs: <VI1PR04MB3181287AE1FD2D187D93DF90EE280@VI1PR04MB3181.eurprd04.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(346002)(39860400002)(396003)(366004)(199004)(189003)(53936002)(68736007)(52116002)(99286004)(71200400001)(316002)(7736002)(66066001)(71190400001)(102836004)(6116002)(6486002)(386003)(6506007)(3846002)(305945005)(6436002)(54906003)(97736004)(110136005)(36756003)(2906002)(486006)(11346002)(81156014)(118296001)(2616005)(5660300002)(86362001)(4744005)(50226002)(8936002)(76176011)(4326008)(25786009)(26005)(81166006)(446003)(8676002)(14454004)(44832011)(476003)(106356001)(256004)(186003)(105586002)(478600001)(6512007)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3181;H:VI1PR04MB5533.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rG2K19GQGRGhbHEyCVBU8qFIPLHqwA2FLUAVuVXFW2xQaJkJYmV7Wrn/Uc93vZh96iSmLGjRDC46ekhwpOJzhB9dZ9XOaQju6THpJ55izvRUuVk0N2JIZzGwPxTGxqhUHLvp0D1b8W9Mtg3us3hAOznP/fqaJu7gjNyBf0sGAx7EerejO703FuzBmVe1vHkzx9svToIVJpIFWyX2cxeDubUIpQmod16INQ9SAv7Nj0BN0WecSu/iNrnr0SsxXM/IchGYaT5fH5m/9oMpt5RAq4pF7SVKTgsMJF+AyTx/tpaiNp1b0IUdQ7vXQ+nL8E/fjHpLublE/SLGL/3d2cXIsj4mL5BEI4Efgsvwm68IHt4bJSXyLj7e3ST6ugF0WCtEVU2kF4w9T/ipY4Slii1fef6QKTzyexi2FQmKbOTCFbs=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 442241b7-bdc5-48ad-507a-08d6bf508f82
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 14:10:04.7986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3181
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

RW5hYmxlIG1mZCBhbmQgcmVndWxhdG9yIGRyaXZlciBmb3IgUE1JQyBmb3VuZCBvbiBpbXg4bW0t
ZXZrIGJvYXJkcw0KDQpTaWduZWQtb2ZmLWJ5OiBMZW9uYXJkIENyZXN0ZXogPGxlb25hcmQuY3Jl
c3RlekBueHAuY29tPg0KLS0tDQogYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZyB8IDIgKysN
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2NvbmZpZ3MvZGVmY29uZmlnIGIvYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZw0KaW5k
ZXggYjE4NTBhN2IyNDI2Li40ODNkMGUyNTFmMzcgMTAwNjQ0DQotLS0gYS9hcmNoL2FybTY0L2Nv
bmZpZ3MvZGVmY29uZmlnDQorKysgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnDQpAQCAt
NDM4LDEyICs0MzgsMTQgQEAgQ09ORklHX01GRF9ISTY0MjFfUE1JQz15DQogQ09ORklHX01GRF9I
STY1NVhfUE1JQz15DQogQ09ORklHX01GRF9NQVg3NzYyMD15DQogQ09ORklHX01GRF9TUE1JX1BN
SUM9eQ0KIENPTkZJR19NRkRfUks4MDg9eQ0KIENPTkZJR19NRkRfU0VDX0NPUkU9eQ0KK0NPTkZJ
R19NRkRfUk9ITV9CRDcxOFhYPXkNCiBDT05GSUdfUkVHVUxBVE9SX0ZJWEVEX1ZPTFRBR0U9eQ0K
IENPTkZJR19SRUdVTEFUT1JfQVhQMjBYPXkNCitDT05GSUdfUkVHVUxBVE9SX0JENzE4WFg9eQ0K
IENPTkZJR19SRUdVTEFUT1JfQkQ5NTcxTVdWPXkNCiBDT05GSUdfUkVHVUxBVE9SX0ZBTjUzNTU1
PXkNCiBDT05GSUdfUkVHVUxBVE9SX0dQSU89eQ0KIENPTkZJR19SRUdVTEFUT1JfSEk2NDIxVjUz
MD15DQogQ09ORklHX1JFR1VMQVRPUl9ISTY1NVg9eQ0KLS0gDQoyLjE3LjENCg0K
