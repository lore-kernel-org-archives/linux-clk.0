Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9850C10F0E
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 14:10:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C4FB2171F
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 14:10:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="P/YgNQsk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfDLOKG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 10:10:06 -0400
Received: from mail-eopbgr150089.outbound.protection.outlook.com ([40.107.15.89]:58318
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726785AbfDLOKF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Apr 2019 10:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtnLXuZ56CIYvJTR1H6LwpfHEdXVcic0WGlEQ643VnE=;
 b=P/YgNQsk7KsCRhhQHwJlIznt7Vxs9AqZDKZ2Ep1Y+NRLeLEGtmofbMOYh/GPhuFgcY0RdQC80qdkIlDrFfyrmZYwqgxktWAhva1Srtsuc/H2udl8e40Nic+RqxK7ClFr1zRuo7yqr2Lu91Xw3fhSCLUlYWgQWyg+DSMNOuWIw2s=
Received: from VI1PR04MB5533.eurprd04.prod.outlook.com (20.178.122.159) by
 VI1PR04MB3181.eurprd04.prod.outlook.com (10.170.229.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.14; Fri, 12 Apr 2019 14:10:02 +0000
Received: from VI1PR04MB5533.eurprd04.prod.outlook.com
 ([fe80::cca7:43cf:dc13:a822]) by VI1PR04MB5533.eurprd04.prod.outlook.com
 ([fe80::cca7:43cf:dc13:a822%4]) with mapi id 15.20.1792.016; Fri, 12 Apr 2019
 14:10:02 +0000
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
Subject: [PATCH 0/4] imx8mm-evk: Enable CPU freq and voltage switching
Thread-Topic: [PATCH 0/4] imx8mm-evk: Enable CPU freq and voltage switching
Thread-Index: AQHU8TlrpM9KKI19i0GY8YlRXD2pEQ==
Date:   Fri, 12 Apr 2019 14:10:02 +0000
Message-ID: <cover.1555077720.git.leonard.crestez@nxp.com>
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
x-ms-office365-filtering-correlation-id: ac147d77-6b41-454e-a02f-08d6bf508ddf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3181;
x-ms-traffictypediagnostic: VI1PR04MB3181:
x-microsoft-antispam-prvs: <VI1PR04MB3181E1689614AC7B64CA8FA3EE280@VI1PR04MB3181.eurprd04.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(346002)(39860400002)(396003)(366004)(199004)(189003)(53936002)(68736007)(52116002)(99286004)(71200400001)(316002)(7736002)(66066001)(71190400001)(102836004)(6116002)(6486002)(386003)(6506007)(3846002)(305945005)(6436002)(54906003)(97736004)(110136005)(36756003)(2906002)(486006)(81156014)(2616005)(5660300002)(86362001)(50226002)(8936002)(4326008)(25786009)(26005)(81166006)(8676002)(14454004)(44832011)(476003)(106356001)(256004)(186003)(105586002)(14444005)(478600001)(6512007)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3181;H:VI1PR04MB5533.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T9pK17RUCXAk4yjVO9t8LGOJ9QNlXlWXMr083uffhjLIbYuHjpS5P9aZqBQBhz4zkKN2SPt6wPpSGI7plKEqqeTwcpiROvz4f7QyIVGImdy6PmzfR86mmSnAOr7i24ajH5dKxIcL51qrl6y77btI6F7ghmSxuC+n63fucXIlU5T6eqA/LKHg/gglIG1TDi/2bdDMIiOSynj8Jv41zODcF5+Yg6M5VDc3rfmfmPg9duQdytEFwkeQZc3nHlUGop/N5zqZtFIFRw0NX2IcpeVPeIsTMUAjG2zyhpg4QFUaDV/tf3XFyp4e2aUVWz79Ci+0A1GfnmHVbkFPjoI/HJ57gvU4cWdgndd5z04l8bLWEo6R2dz8YYlvcKmTV3lApBRnFffRJGcLXE7NiR9BnZK0V01cnnAgxRdADkRt+dqkjaA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac147d77-6b41-454e-a02f-08d6bf508ddf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 14:10:02.0687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3181
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

VGhpcyB3YXMgc2VudCBhcyBhIHNlcmllcyBidXQgcGF0Y2hlcyBjYW4gYmUgc2FmZWx5IGFwcGxp
ZWQgaW4gYW55IG9yZGVyLg0KV2l0aG91dCB0aGUgcGxsXzE0MTZ4IGJ1Z2ZpeCBjcHVmcmVxIHdp
bGwgcmVmdXNlIHRvIHN3aXRjaC4NCg0KVGhlIHBhdGNoIGFkZGluZyBQTUlDIHRvIERUIGlzIG1v
c3RseSBiYXNlZCBvbiBvdXIgaW50ZXJuYWwgdHJlZSBhbmQgSSdtIG5vdA0Kc3VyZSBhbGwgcHJv
cGVydGllcyBhcmUgYWN0dWFsbHkgcmVxdWlyZWQuIEkgdGVzdGVkIHRoYXQgY3B1ZnJlcSBzd2l0
Y2hlcw0Kdm9sdGFnZXMgc2FmZWx5IGFuZCBhbHNvIFNWTlMgbW9kZSBhY3Jvc3MgcmVzZXQvc2h1
dGRvd24gc2VlbXMgdG8gd29yaw0KYXMgZXhwZWN0ZWQuDQoNClRoZXJlIGlzIGFsc28gYSBuYW1p
bmcgZGlzYWdyZWVtZW50IGJldHdlZW4gZGF0YXNoZWV0L3NjaGVtYXRpY3MgYW5kDQpyZWd1bGF0
b3IgZHJpdmVyOiBiZXR3ZWVuIEJENzE4MzcgYW5kIEJENzE4NDcgdGhlIEJVQ0szLzQgcmVndWxh
dG9ycw0Kd2VyZSByZW1vdmVkIGJ1dCBkYXRhc2hlZXQgYW5kIGJvYXJkIHNjaGVtYXRpY3Mga2Vw
dCB0aGUgbmFtZXMgZm9yDQpCVUNLNS82LzcvOC4gVGhlIGRyaXZlciBob3dldmVyIHJlbnVtYmVy
ZWQgNS82LzcvOCB0byAzLzQvNS82Lg0KDQpNb3JlIGNvbmNyZXRlbHk6DQoNCiAgICBiZDcxODQ3
X3JlZ3VsYXRvcnNbMl0ubmFtZSA9ICdidWNrMycNCiAgICBiZDcxODQ3X3JlZ3VsYXRvcnNbMl0u
dnNlbF9yZWcgPSBCRDcxOFhYX1JFR18xU1RfTk9EVlNfQlVDS19WT0xUDQogICAgQkQ3MThYWF9S
RUdfMVNUX05PRFZTX0JVQ0tfVk9MVCA9IDB4MTQNCg0KICAgIGJkNzE4MzdfcmVndWxhdG9yc1s0
XS5uYW1lID0gJ2J1Y2s1Jw0KICAgIGJkNzE4MzdfcmVndWxhdG9yc1s0XS52c2VsX3JlZyA9IEJE
NzE4WFhfUkVHXzFTVF9OT0RWU19CVUNLX1ZPTFQNCiAgICBCRDcxOFhYX1JFR18xU1RfTk9EVlNf
QlVDS19WT0xUID0gMHgxNA0KDQogICAgYmQ3MTgzN19yZWd1bGF0b3JzWzJdLm5hbWUgPSAnYnVj
azMnDQogICAgYmQ3MTgzN19yZWd1bGF0b3JzWzJdLnZzZWxfcmVnID0gQkQ3MTgzN19SRUdfQlVD
SzNfVk9MVF9SVU4NCiAgICBCRDcxODM3X1JFR19CVUNLM19WT0xUX1JVTiA9IDB4MTINCg0KRm9y
IGJvdGggdmVyc2lvbnMgdGhlIGRhdGFzaGVldCByZWZlcnMgdG8gMHgxNCBhcyBCVUNLNV9WT0xU
NSByYXRoZXINCnRoYW4gIjFTVF9OT0RWU19CVUNLIi4NCg0KVXNpbmcgdGhlIG5hbWVzIGZyb20g
RFQgYmluZGluZ3Mgd29ya3MgZmluZS4NCg0KTGVvbmFyZCBDcmVzdGV6ICg0KToNCiAgY2xrOiBp
bXg6IEZpeCBQTExfMTQxNlggbm90IHJvdW5kaW5nIHJhdGVzDQogIGFybTY0OiBkdHM6IGlteDht
bTogQWRkIGNwdWZyZXEgcHJvcGVydGllcw0KICBhcm02NDogZGVmY29uZmlnOiBFbmFibGUgUk9I
TV9CRDcxOFhYIFBNSUMgZm9yIGlteDhtbS1ldmsNCiAgYXJtNjQ6IGR0czogaW14OG1tLWV2azog
QWRkIEJENzE4NDcgUE1JQw0KDQogYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1t
LWV2ay5kdHMgfCAxNDUgKysrKysrKysrKysrKysrKysrKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL2lteDhtbS5kdHNpICAgIHwgIDMwICsrKysNCiBhcmNoL2FybTY0L2NvbmZpZ3Mv
ZGVmY29uZmlnICAgICAgICAgICAgICAgICB8ICAgMiArDQogZHJpdmVycy9jbGsvaW14L2Nsay1w
bGwxNHh4LmMgICAgICAgICAgICAgICAgfCAgIDIgKy0NCiA0IGZpbGVzIGNoYW5nZWQsIDE3OCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCi0tIA0KMi4xNy4xDQoNCg==
