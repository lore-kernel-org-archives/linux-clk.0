Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D77C282CE
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 14:10:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A493B2171F
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 14:10:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="abVVNjeI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfDLOKH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 10:10:07 -0400
Received: from mail-eopbgr150089.outbound.protection.outlook.com ([40.107.15.89]:58318
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726833AbfDLOKH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Apr 2019 10:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Qjh5FDLKJUW4k6GXWCgm4rDD6r5hVcVLBy792G1lNI=;
 b=abVVNjeI4lUBKbr9DNDLPBBDqLdmWd3008RENV1LqJbo8jkD5gqWCPtBw0MwNfbm8gfMognIakhzO//6XAI0PfRVYPs4IFJkhjH9KoLI34gXPOpiS61e28ip/81gHzcyp2cxffH2Kc7MH1jWAuV/PnHBYru8Per15ZYez6gBz2I=
Received: from VI1PR04MB5533.eurprd04.prod.outlook.com (20.178.122.159) by
 VI1PR04MB3181.eurprd04.prod.outlook.com (10.170.229.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.14; Fri, 12 Apr 2019 14:10:03 +0000
Received: from VI1PR04MB5533.eurprd04.prod.outlook.com
 ([fe80::cca7:43cf:dc13:a822]) by VI1PR04MB5533.eurprd04.prod.outlook.com
 ([fe80::cca7:43cf:dc13:a822%4]) with mapi id 15.20.1792.016; Fri, 12 Apr 2019
 14:10:03 +0000
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
Subject: [PATCH 1/4] clk: imx: Fix PLL_1416X not rounding rates
Thread-Topic: [PATCH 1/4] clk: imx: Fix PLL_1416X not rounding rates
Thread-Index: AQHU8TlsQxuaDIrr0kGbg87wdHIZtA==
Date:   Fri, 12 Apr 2019 14:10:03 +0000
Message-ID: <7dd868d4673f155faa8c52d80a01d01aed2ea247.1555077720.git.leonard.crestez@nxp.com>
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
x-ms-office365-filtering-correlation-id: ebcbfb6a-7727-4bc9-310c-08d6bf508e7f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3181;
x-ms-traffictypediagnostic: VI1PR04MB3181:
x-microsoft-antispam-prvs: <VI1PR04MB31819C59BFDE8623B6DF835BEE280@VI1PR04MB3181.eurprd04.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(346002)(39860400002)(396003)(366004)(199004)(189003)(53936002)(68736007)(52116002)(99286004)(71200400001)(316002)(7736002)(66066001)(71190400001)(102836004)(6116002)(6486002)(386003)(6506007)(3846002)(305945005)(6436002)(54906003)(97736004)(110136005)(36756003)(2906002)(486006)(11346002)(81156014)(118296001)(2616005)(5660300002)(86362001)(4744005)(50226002)(8936002)(76176011)(4326008)(25786009)(26005)(81166006)(446003)(8676002)(14454004)(44832011)(476003)(106356001)(256004)(186003)(105586002)(14444005)(478600001)(6512007);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3181;H:VI1PR04MB5533.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yoYkUqrNVKCq0aJIOZVTEi0K07fy/OZOc0Pwxd/GIslRwRn42mG1rUpdGD8+2Pu0o6T1w3R0v0aIdUWmnsUrgMqps+4Ur9Abh3rLeuH3muYM4RHw0DGQvEOqw6wY3kGZ2CeMm6IATgmPuTvEweCMJFcKBEP3oqQDolCnHZpqck7lACTulF30m3DW7P0nCsbG2grdzv+VhUdlvimb5gEgNZoqPoHOdw5j9fF0pUv7TZaw47piuJnBU7m9SOD47VrsvANdxtW7nSYyChSvQyt/NCe45zOkgHyjE6XcPpZa60MAhOaTL0kwgctwr4l0Osvi0/kuI99L+JohWm5ubgUB0VPupcFOncMtbX+4Z6TYG7cSa3IkHWjF5bxxsiwVFBMoY0Fr7yNHV3CRo2OSniDbB57OmQivX8U6DRIVHttAhVw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebcbfb6a-7727-4bc9-310c-08d6bf508e7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 14:10:03.1785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3181
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Q29kZSB3aGljaCBpbml0aWFsaXplcyB0aGUgImNsa19pbml0X2RhdGEub3BzIiBjaGVja3MgcGxs
LT5yYXRlX3RhYmxlDQpiZWZvcmUgdGhhdCBmaWVsZCBpcyBldmVyIGFzc2lnbmVkIHRvIHNvIGl0
IGFsd2F5cyBwaWNrcw0KImNsa19wbGwxNDE2eF9taW5fb3BzIi4NCg0KVGhpcyBicmVha3MgZHlu
YW1pYyByYXRlIHJvdW5kaW5nIGZvciBmZWF0dXJlcyBzdWNoIGFzIGNwdWZyZXEuDQoNCkZpeCBi
eSBjaGVja2luZyBwbGxfY2xrLT5yYXRlX3RhYmxlIGluc3RlYWQsIGhlcmUgcGxsX2NsayByZWZl
cnMgdG8NCnRoZSBjb25zdGFudCBpbml0aWFsaXphdGlvbiBkYXRhIGNvbWluZyBmcm9tIHBlci1z
b2MgY2xrIGRyaXZlci4NCg0KU2lnbmVkLW9mZi1ieTogTGVvbmFyZCBDcmVzdGV6IDxsZW9uYXJk
LmNyZXN0ZXpAbnhwLmNvbT4NCi0tLQ0KIGRyaXZlcnMvY2xrL2lteC9jbGstcGxsMTR4eC5jIHwg
MiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvaW14L2Nsay1wbGwxNHh4LmMgYi9kcml2ZXJzL2Nsay9p
bXgvY2xrLXBsbDE0eHguYw0KaW5kZXggMWFjZmEzZTNjZmI0Li4xMTNkNzEwNDIxOTkgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL2Nsay9pbXgvY2xrLXBsbDE0eHguYw0KKysrIGIvZHJpdmVycy9jbGsv
aW14L2Nsay1wbGwxNHh4LmMNCkBAIC0zNjAsMTEgKzM2MCwxMSBAQCBzdHJ1Y3QgY2xrICppbXhf
Y2xrX3BsbDE0eHgoY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhciAqcGFyZW50X25hbWUsDQog
CWluaXQucGFyZW50X25hbWVzID0gJnBhcmVudF9uYW1lOw0KIAlpbml0Lm51bV9wYXJlbnRzID0g
MTsNCiANCiAJc3dpdGNoIChwbGxfY2xrLT50eXBlKSB7DQogCWNhc2UgUExMXzE0MTZYOg0KLQkJ
aWYgKCFwbGwtPnJhdGVfdGFibGUpDQorCQlpZiAoIXBsbF9jbGstPnJhdGVfdGFibGUpDQogCQkJ
aW5pdC5vcHMgPSAmY2xrX3BsbDE0MTZ4X21pbl9vcHM7DQogCQllbHNlDQogCQkJaW5pdC5vcHMg
PSAmY2xrX3BsbDE0MTZ4X29wczsNCiAJCWJyZWFrOw0KIAljYXNlIFBMTF8xNDQzWDoNCi0tIA0K
Mi4xNy4xDQoNCg==
