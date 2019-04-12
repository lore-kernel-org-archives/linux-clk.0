Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19343C10F14
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 14:10:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D20032186A
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 14:10:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="qODq/xLU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfDLOKJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 10:10:09 -0400
Received: from mail-eopbgr150089.outbound.protection.outlook.com ([40.107.15.89]:58318
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726785AbfDLOKJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Apr 2019 10:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJJiBMmicwLXx94oqRZEEzd8HPsUxue7/K8M/1wwUBE=;
 b=qODq/xLUBb/fsBci5sxIEGZmhLpVrsdDneDyF5PkeZq/vfCaOGMNcX9brJ4TTuLZeS+vNGrK/rsy+QemlrwDHj09JVXv+lULhHLf0yV9QSkvxvBgQcOk7PXjjbTM/qXTAL6fQ1us0o4BEOZXxZDy1kiPdTCB1QTDPHLZf/CmFgg=
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
Subject: [PATCH 2/4] arm64: dts: imx8mm: Add cpufreq properties
Thread-Topic: [PATCH 2/4] arm64: dts: imx8mm: Add cpufreq properties
Thread-Index: AQHU8TlsXV6OOB9i40qesRp5pI8n8g==
Date:   Fri, 12 Apr 2019 14:10:03 +0000
Message-ID: <9e2f3a885ba69e29ec5592ea7b07b6595bca3404.1555077720.git.leonard.crestez@nxp.com>
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
x-ms-office365-filtering-correlation-id: 7283d99b-77f9-469c-fb5b-08d6bf508f00
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3181;
x-ms-traffictypediagnostic: VI1PR04MB3181:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR04MB3181FE57C3658D64EA343ACAEE280@VI1PR04MB3181.eurprd04.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(346002)(39860400002)(396003)(366004)(199004)(189003)(53936002)(68736007)(52116002)(99286004)(71200400001)(316002)(7736002)(66066001)(71190400001)(102836004)(6116002)(6486002)(386003)(6506007)(3846002)(305945005)(6436002)(54906003)(97736004)(110136005)(36756003)(2906002)(966005)(486006)(11346002)(81156014)(118296001)(2616005)(5660300002)(86362001)(50226002)(8936002)(76176011)(4326008)(25786009)(26005)(81166006)(446003)(8676002)(14454004)(44832011)(476003)(106356001)(256004)(186003)(105586002)(6306002)(14444005)(478600001)(6512007)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3181;H:VI1PR04MB5533.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LmJk6955JX4cKmgtvqy3bAnypchEgyBXsObPFQIfH1PHc0Hq5pGJTJ+s5DEulAOHjOXxEc5+hkO3thClcKW6rytiYfC1sGV5OIg8cNbfZYkY08Vh2lBQo0GxCUUicv6rs3eRLPp/freHQ3nslLnm+qCNho5uwRr4Q4pKGhpww5TIjyXJla7RsAHh1WFJDPSy5tQbWZ7P81Z1FKfgYyJE1BlfQHavAlyebGFvxUk7VetKWjfp97Pg4g9i5x5eMDYCdPhtbAxeuCn2NTZOmwXOrAckM1boIWwZDibG5eE+jJ7WXFq/ceLlu+3yYc1n1hMxeTJthznVFrIeBaxKbFkZhxVrf4grB1+WcNrmGfgiPi46HS5d5GUbx0j8rYwgAttu44v8+MuV85eJRNbDlkA+X44CFz1nz8q3/yAtEzHchlM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7283d99b-77f9-469c-fb5b-08d6bf508f00
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 14:10:04.0181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3181
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

VGhpcyBpcyB2ZXJ5IHNpbWlsYXIgdG8gaW14OG1xIGNwdWZyZXEtZHQgc3VwcG9ydC4NCg0KT3Bl
cmF0aW5nIHBvaW50cyBhcmUgZnJvbSBkYXRhc2hlZXQ6DQpodHRwczovL3d3dy5ueHAuY29tL2Rv
Y3MvZW4vZGF0YS1zaGVldC9JTVg4TU1DRUMucGRmDQoNCkhpZ2hlciBvcHBzIHdlcmUgb21pdHRl
ZCAoanVzdCBsaWtlIGlteDhtcSkgYmVjYXVzZSBpdCByZXF1aXJlcyBjaGVja2luZw0Kc3BlZWQg
Z3JhZGUgZnJvbSBPQ09UUCBmdXNlcy4NCg0KU2lnbmVkLW9mZi1ieTogTGVvbmFyZCBDcmVzdGV6
IDxsZW9uYXJkLmNyZXN0ZXpAbnhwLmNvbT4NCi0tLQ0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDhtbS5kdHNpIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUg
Y2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OG1tLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4bW0uZHRzaQ0KaW5kZXggZGUzNDk4YzJkZDQ0Li42YjQwN2E5NGMwNmUgMTAwNjQ0DQot
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0uZHRzaQ0KKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLmR0c2kNCkBAIC00Niw0MyArNDYsNzMg
QEANCiANCiAJCUE1M18wOiBjcHVAMCB7DQogCQkJZGV2aWNlX3R5cGUgPSAiY3B1IjsNCiAJCQlj
b21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTUzIjsNCiAJCQlyZWcgPSA8MHgwPjsNCisJCQljbG9j
ay1sYXRlbmN5ID0gPDYxMDM2PjsgLyogdHdvIENMSzMyIHBlcmlvZHMgKi8NCisJCQljbG9ja3Mg
PSA8JmNsayBJTVg4TU1fQ0xLX0FSTT47DQogCQkJZW5hYmxlLW1ldGhvZCA9ICJwc2NpIjsNCiAJ
CQluZXh0LWxldmVsLWNhY2hlID0gPCZBNTNfTDI+Ow0KKwkJCW9wZXJhdGluZy1wb2ludHMtdjIg
PSA8JmE1M19vcHBfdGFibGU+Ow0KIAkJfTsNCiANCiAJCUE1M18xOiBjcHVAMSB7DQogCQkJZGV2
aWNlX3R5cGUgPSAiY3B1IjsNCiAJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTUzIjsNCiAJ
CQlyZWcgPSA8MHgxPjsNCisJCQljbG9jay1sYXRlbmN5ID0gPDYxMDM2PjsgLyogdHdvIENMSzMy
IHBlcmlvZHMgKi8NCisJCQljbG9ja3MgPSA8JmNsayBJTVg4TU1fQ0xLX0FSTT47DQogCQkJZW5h
YmxlLW1ldGhvZCA9ICJwc2NpIjsNCiAJCQluZXh0LWxldmVsLWNhY2hlID0gPCZBNTNfTDI+Ow0K
KwkJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmE1M19vcHBfdGFibGU+Ow0KIAkJfTsNCiANCiAJ
CUE1M18yOiBjcHVAMiB7DQogCQkJZGV2aWNlX3R5cGUgPSAiY3B1IjsNCiAJCQljb21wYXRpYmxl
ID0gImFybSxjb3J0ZXgtYTUzIjsNCiAJCQlyZWcgPSA8MHgyPjsNCisJCQljbG9jay1sYXRlbmN5
ID0gPDYxMDM2PjsgLyogdHdvIENMSzMyIHBlcmlvZHMgKi8NCisJCQljbG9ja3MgPSA8JmNsayBJ
TVg4TU1fQ0xLX0FSTT47DQogCQkJZW5hYmxlLW1ldGhvZCA9ICJwc2NpIjsNCiAJCQluZXh0LWxl
dmVsLWNhY2hlID0gPCZBNTNfTDI+Ow0KKwkJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmE1M19v
cHBfdGFibGU+Ow0KIAkJfTsNCiANCiAJCUE1M18zOiBjcHVAMyB7DQogCQkJZGV2aWNlX3R5cGUg
PSAiY3B1IjsNCiAJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTUzIjsNCiAJCQlyZWcgPSA8
MHgzPjsNCisJCQljbG9jay1sYXRlbmN5ID0gPDYxMDM2PjsgLyogdHdvIENMSzMyIHBlcmlvZHMg
Ki8NCisJCQljbG9ja3MgPSA8JmNsayBJTVg4TU1fQ0xLX0FSTT47DQogCQkJZW5hYmxlLW1ldGhv
ZCA9ICJwc2NpIjsNCiAJCQluZXh0LWxldmVsLWNhY2hlID0gPCZBNTNfTDI+Ow0KKwkJCW9wZXJh
dGluZy1wb2ludHMtdjIgPSA8JmE1M19vcHBfdGFibGU+Ow0KIAkJfTsNCiANCiAJCUE1M19MMjog
bDItY2FjaGUwIHsNCiAJCQljb21wYXRpYmxlID0gImNhY2hlIjsNCiAJCX07DQogCX07DQogDQor
CWE1M19vcHBfdGFibGU6IG9wcC10YWJsZSB7DQorCQljb21wYXRpYmxlID0gIm9wZXJhdGluZy1w
b2ludHMtdjIiOw0KKwkJb3BwLXNoYXJlZDsNCisNCisJCW9wcC0xMjAwMDAwMDAwIHsNCisJCQlv
cHAtaHogPSAvYml0cy8gNjQgPDEyMDAwMDAwMDA+Ow0KKwkJCW9wcC1taWNyb3ZvbHQgPSA8ODUw
MDAwPjsNCisJCQljbG9jay1sYXRlbmN5LW5zID0gPDE1MDAwMD47DQorCQl9Ow0KKw0KKwkJb3Bw
LTE2MDAwMDAwMDAgew0KKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8MTYwMDAwMDAwMD47DQorCQkJ
b3BwLW1pY3Jvdm9sdCA9IDw5MDAwMDA+Ow0KKwkJCWNsb2NrLWxhdGVuY3ktbnMgPSA8MTUwMDAw
PjsNCisJCQlvcHAtc3VzcGVuZDsNCisJCX07DQorCX07DQorDQogCW1lbW9yeUA0MDAwMDAwMCB7
DQogCQlkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOw0KIAkJcmVnID0gPDB4MCAweDQwMDAwMDAwIDAg
MHg4MDAwMDAwMD47DQogCX07DQogDQotLSANCjIuMTcuMQ0KDQo=
