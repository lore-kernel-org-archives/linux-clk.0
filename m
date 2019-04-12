Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64483C10F0E
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 14:10:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2040D2171F
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 14:10:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="l4Jxf8G/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfDLOKP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 10:10:15 -0400
Received: from mail-eopbgr150089.outbound.protection.outlook.com ([40.107.15.89]:58318
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726850AbfDLOKP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Apr 2019 10:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kJ4t33KUIlGCou/6lInEP4+RUVexl7VXkN8eJNybfI=;
 b=l4Jxf8G/Ah1VU7+iBvyBc0nN+8WzNxfDCGPnpFLTUxcMsO/QsVAKahoc0LZsr5TrDwdDYvXmGiGWbiNH7FrfbIWND4JTIXpO14QSAZhWGWjspSPMZd9pUH2Yt9FWaM3LBut2W8ApRpYWf/M0mD+6/mek1AZueTHduIO9p7AQcRI=
Received: from VI1PR04MB5533.eurprd04.prod.outlook.com (20.178.122.159) by
 VI1PR04MB3181.eurprd04.prod.outlook.com (10.170.229.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.14; Fri, 12 Apr 2019 14:10:05 +0000
Received: from VI1PR04MB5533.eurprd04.prod.outlook.com
 ([fe80::cca7:43cf:dc13:a822]) by VI1PR04MB5533.eurprd04.prod.outlook.com
 ([fe80::cca7:43cf:dc13:a822%4]) with mapi id 15.20.1792.016; Fri, 12 Apr 2019
 14:10:05 +0000
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
Subject: [PATCH 4/4] arm64: dts: imx8mm-evk: Add BD71847 PMIC
Thread-Topic: [PATCH 4/4] arm64: dts: imx8mm-evk: Add BD71847 PMIC
Thread-Index: AQHU8TltZQlU84U+vU6BsxqEUEfe/A==
Date:   Fri, 12 Apr 2019 14:10:05 +0000
Message-ID: <7df309d19cf7f311afe736c95666afe8697e1e5a.1555077720.git.leonard.crestez@nxp.com>
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
x-ms-office365-filtering-correlation-id: c027946e-3a73-46f4-a741-08d6bf508ff8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3181;
x-ms-traffictypediagnostic: VI1PR04MB3181:
x-microsoft-antispam-prvs: <VI1PR04MB3181C5D300565F8D2C877236EE280@VI1PR04MB3181.eurprd04.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(346002)(39860400002)(396003)(366004)(199004)(189003)(53936002)(68736007)(52116002)(99286004)(71200400001)(316002)(7736002)(66066001)(71190400001)(102836004)(6116002)(6486002)(386003)(6506007)(3846002)(305945005)(6436002)(54906003)(97736004)(110136005)(36756003)(2906002)(486006)(11346002)(81156014)(118296001)(2616005)(5660300002)(86362001)(50226002)(8936002)(76176011)(4326008)(25786009)(26005)(81166006)(446003)(8676002)(14454004)(44832011)(476003)(106356001)(256004)(186003)(105586002)(478600001)(6512007)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3181;H:VI1PR04MB5533.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fcJ43gwYY2D6MnGF/TF0hTaAC7eAGAbJfI+Eblm0qhjfh+vJYOb1KWb3nQ09GFHPQ3cqxdXhaSXhWyMGyQVk6K2aBu3WBfKdqDHQgCs/qNvqhwBfZVtN86azruJXMcfYp8KqvCIQjE9zLLfI80FekZ808ChUgljdz7QDPVw8Ojj9xQEDK4t42r73ArtQmhADvDsMLEcUrp5QLRq+275yA1RC2ZlXUcf/LHPplK54NUn0aP9eSqXr8O2Fxo8StN2YzbFmwRy+bwBgrD4cvgIgqd1yBREfWNL85f9pzB9AvKAZoIIlXL1RwcDqmSe8LHpFZM0RmTppz3/oBBkfHqbl29gJz0lkrDV81W8tQA4bQbJXHAleroLZh/d8nzDBr5+uwqKJnjyTLidaQOqQpYNxPMcpIPKbmHpGYWEtWQ2a6GU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c027946e-3a73-46f4-a741-08d6bf508ff8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 14:10:05.6832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3181
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

VGhlIEJVQ0syIHJlZ3VsYXRvciBpcyB1c2VkIGZvciBjcHVmcmVxIHZvbHRhZ2UgY29udHJvbCwg
b3RoZXJ3aXNlDQpjb25maWd1cmF0aW9uIGlzIG1vc3RseSBzdGF0aWMuDQoNClRoaXMgdXNlcyB0
aGUgbmV3bHktaW1wbGVtZW50ZWQgcm9obSxyZXNldC1zbnZzLXBvd2VyZWQgcHJvcGVydHkgdG8N
CnByb3Blcmx5IGhhbmRsZSB0aGUgU05WUyBzdGF0ZSBvZiBpbXg4bW0uDQoNCkJldHdlZW4gQkQ3
MTgzNyBhbmQgQkQ3MTg0NyB0aGUgQlVDSzMvNCByZWd1bGF0b3JzIHdlcmUgcmVtb3ZlZCBidXQN
CmRhdGFzaGVldCBhbmQgYm9hcmQgc2NoZW1hdGljcyBrZXB0IHRoZSBuYW1lcyBmb3IgQlVDSzUv
Ni83LzguIFRoZQ0KZHJpdmVyIGhvd2V2ZXIgcmVudW1iZXJlZCA1LzYvNy84IHRvIDMvNC81LzYu
IFVzZSB0aGUgbmFtZXMgZnJvbSBEVA0KYmluZGluZ3MgYW5kIGFkZCBjb21tZW50cyB0byBzaWdu
YWwgdGhpcy4NCg0KU2lnbmVkLW9mZi1ieTogTGVvbmFyZCBDcmVzdGV6IDxsZW9uYXJkLmNyZXN0
ZXpAbnhwLmNvbT4NCi0tLQ0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1l
dmsuZHRzIHwgMTQ1ICsrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTQ1IGlu
c2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2lteDhtbS1ldmsuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLWV2
ay5kdHMNCmluZGV4IDJkNWQ4OTQ3NWI3Ni4uMDk4Y2NhZWZkMTY5IDEwMDY0NA0KLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLWV2ay5kdHMNCisrKyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1ldmsuZHRzDQpAQCAtMzcsMTAgKzM3LDE0IEBA
DQogCQlncGlvID0gPCZncGlvMiAxOSBHUElPX0FDVElWRV9ISUdIPjsNCiAJCWVuYWJsZS1hY3Rp
dmUtaGlnaDsNCiAJfTsNCiB9Ow0KIA0KKyZBNTNfMCB7DQorCWNwdS1zdXBwbHkgPSA8JmJ1Y2sy
X3JlZz47DQorfTsNCisNCiAmZmVjMSB7DQogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQog
CXBpbmN0cmwtMCA9IDwmcGluY3RybF9mZWMxPjsNCiAJcGh5LW1vZGUgPSAicmdtaWktaWQiOw0K
IAlwaHktaGFuZGxlID0gPCZldGhwaHkwPjsNCkBAIC05MywxMCArOTcsMTM4IEBADQogCXBpbmN0
cmwtMCA9IDwmcGluY3RybF93ZG9nPjsNCiAJZnNsLGV4dC1yZXNldC1vdXRwdXQ7DQogCXN0YXR1
cyA9ICJva2F5IjsNCiB9Ow0KIA0KKyZpMmMxIHsNCisJY2xvY2stZnJlcXVlbmN5ID0gPDQwMDAw
MD47DQorCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQorCXBpbmN0cmwtMCA9IDwmcGluY3Ry
bF9pMmMxPjsNCisJc3RhdHVzID0gIm9rYXkiOw0KKw0KKwlwbWljQDRiIHsNCisJCXJlZyA9IDww
eDRiPjsNCisJCWNvbXBhdGlibGUgPSAicm9obSxiZDcxODQ3IjsNCisJCXBpbmN0cmwtMCA9IDwm
cGluY3RybF9wbWljPjsNCisJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW8xPjsNCisJCWludGVy
cnVwdHMgPSA8MyBHUElPX0FDVElWRV9MT1c+Ow0KKwkJcm9obSxyZXNldC1zbnZzLXBvd2VyZWQ7
DQorDQorCQlyZWd1bGF0b3JzIHsNCisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCisJCQkjc2l6
ZS1jZWxscyA9IDwwPjsNCisNCisJCQlidWNrMV9yZWc6IHJlZ3VsYXRvckAwIHsNCisJCQkJcmVn
ID0gPDA+Ow0KKwkJCQlyZWd1bGF0b3ItY29tcGF0aWJsZSA9ICJCVUNLMSI7DQorCQkJCXJlZ3Vs
YXRvci1taW4tbWljcm92b2x0ID0gPDcwMDAwMD47DQorCQkJCXJlZ3VsYXRvci1tYXgtbWljcm92
b2x0ID0gPDEzMDAwMDA+Ow0KKwkJCQlyZWd1bGF0b3ItYm9vdC1vbjsNCisJCQkJcmVndWxhdG9y
LWFsd2F5cy1vbjsNCisJCQkJcmVndWxhdG9yLXJhbXAtZGVsYXkgPSA8MTI1MD47DQorCQkJfTsN
CisNCisJCQlidWNrMl9yZWc6IHJlZ3VsYXRvckAxIHsNCisJCQkJcmVnID0gPDE+Ow0KKwkJCQly
ZWd1bGF0b3ItY29tcGF0aWJsZSA9ICJCVUNLMiI7DQorCQkJCXJlZ3VsYXRvci1taW4tbWljcm92
b2x0ID0gPDcwMDAwMD47DQorCQkJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDEzMDAwMDA+
Ow0KKwkJCQlyZWd1bGF0b3ItYm9vdC1vbjsNCisJCQkJcmVndWxhdG9yLWFsd2F5cy1vbjsNCisJ
CQkJcmVndWxhdG9yLXJhbXAtZGVsYXkgPSA8MTI1MD47DQorCQkJCXJvaG0sZHZzLXJ1bi12b2x0
YWdlID0gPDEwMDAwMDA+Ow0KKwkJCQlyb2htLGR2cy1pZGxlLXZvbHRhZ2UgPSA8OTAwMDAwPjsN
CisJCQl9Ow0KKw0KKwkJCWJ1Y2szX3JlZzogcmVndWxhdG9yQDIgew0KKwkJCQkvLyBCVUNLNSBp
biBkYXRhc2hlZXQNCisJCQkJcmVnID0gPDI+Ow0KKwkJCQlyZWd1bGF0b3ItY29tcGF0aWJsZSA9
ICJCVUNLMyI7DQorCQkJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDcwMDAwMD47DQorCQkJ
CXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDEzNTAwMDA+Ow0KKwkJCQlyZWd1bGF0b3ItYm9v
dC1vbjsNCisJCQkJcmVndWxhdG9yLWFsd2F5cy1vbjsNCisJCQl9Ow0KKw0KKwkJCWJ1Y2s0X3Jl
ZzogcmVndWxhdG9yQDMgew0KKwkJCQkvLyBCVUNLNiBpbiBkYXRhc2hlZXQNCisJCQkJcmVnID0g
PDM+Ow0KKwkJCQlyZWd1bGF0b3ItY29tcGF0aWJsZSA9ICJCVUNLNCI7DQorCQkJCXJlZ3VsYXRv
ci1taW4tbWljcm92b2x0ID0gPDMwMDAwMDA+Ow0KKwkJCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9s
dCA9IDwzMzAwMDAwPjsNCisJCQkJcmVndWxhdG9yLWJvb3Qtb247DQorCQkJCXJlZ3VsYXRvci1h
bHdheXMtb247DQorCQkJfTsNCisNCisJCQlidWNrNV9yZWc6IHJlZ3VsYXRvckA0IHsNCisJCQkJ
Ly8gQlVDSzcgaW4gZGF0YXNoZWV0DQorCQkJCXJlZyA9IDw0PjsNCisJCQkJcmVndWxhdG9yLWNv
bXBhdGlibGUgPSAiQlVDSzUiOw0KKwkJCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxNjA1
MDAwPjsNCisJCQkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTk5NTAwMD47DQorCQkJCXJl
Z3VsYXRvci1ib290LW9uOw0KKwkJCQlyZWd1bGF0b3ItYWx3YXlzLW9uOw0KKwkJCX07DQorDQor
CQkJYnVjazZfcmVnOiByZWd1bGF0b3JANSB7DQorCQkJCS8vIEJVQ0s4IGluIGRhdGFzaGVldA0K
KwkJCQlyZWcgPSA8NT47DQorCQkJCXJlZ3VsYXRvci1jb21wYXRpYmxlID0gIkJVQ0s2IjsNCisJ
CQkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8ODAwMDAwPjsNCisJCQkJcmVndWxhdG9yLW1h
eC1taWNyb3ZvbHQgPSA8MTQwMDAwMD47DQorCQkJCXJlZ3VsYXRvci1ib290LW9uOw0KKwkJCQly
ZWd1bGF0b3ItYWx3YXlzLW9uOw0KKwkJCX07DQorDQorCQkJbGRvMV9yZWc6IHJlZ3VsYXRvckA2
IHsNCisJCQkJcmVnID0gPDY+Ow0KKwkJCQlyZWd1bGF0b3ItY29tcGF0aWJsZSA9ICJMRE8xIjsN
CisJCQkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzAwMDAwMD47DQorCQkJCXJlZ3VsYXRv
ci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Ow0KKwkJCQlyZWd1bGF0b3ItYm9vdC1vbjsNCisJ
CQkJcmVndWxhdG9yLWFsd2F5cy1vbjsNCisJCQl9Ow0KKw0KKwkJCWxkbzJfcmVnOiByZWd1bGF0
b3JANyB7DQorCQkJCXJlZyA9IDw3PjsNCisJCQkJcmVndWxhdG9yLWNvbXBhdGlibGUgPSAiTERP
MiI7DQorCQkJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDkwMDAwMD47DQorCQkJCXJlZ3Vs
YXRvci1tYXgtbWljcm92b2x0ID0gPDkwMDAwMD47DQorCQkJCXJlZ3VsYXRvci1ib290LW9uOw0K
KwkJCQlyZWd1bGF0b3ItYWx3YXlzLW9uOw0KKwkJCX07DQorDQorCQkJbGRvM19yZWc6IHJlZ3Vs
YXRvckA4IHsNCisJCQkJcmVnID0gPDg+Ow0KKwkJCQlyZWd1bGF0b3ItY29tcGF0aWJsZSA9ICJM
RE8zIjsNCisJCQkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAwMD47DQorCQkJCXJl
Z3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Ow0KKwkJCQlyZWd1bGF0b3ItYm9vdC1v
bjsNCisJCQkJcmVndWxhdG9yLWFsd2F5cy1vbjsNCisJCQl9Ow0KKw0KKwkJCWxkbzRfcmVnOiBy
ZWd1bGF0b3JAOSB7DQorCQkJCXJlZyA9IDw5PjsNCisJCQkJcmVndWxhdG9yLWNvbXBhdGlibGUg
PSAiTERPNCI7DQorCQkJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDkwMDAwMD47DQorCQkJ
CXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDE4MDAwMDA+Ow0KKwkJCQlyZWd1bGF0b3ItYm9v
dC1vbjsNCisJCQkJcmVndWxhdG9yLWFsd2F5cy1vbjsNCisJCQl9Ow0KKw0KKwkJCWxkbzZfcmVn
OiByZWd1bGF0b3JAMTEgew0KKwkJCQlyZWcgPSA8MTE+Ow0KKwkJCQlyZWd1bGF0b3ItY29tcGF0
aWJsZSA9ICJMRE82IjsNCisJCQkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8OTAwMDAwPjsN
CisJCQkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTgwMDAwMD47DQorCQkJCXJlZ3VsYXRv
ci1ib290LW9uOw0KKwkJCQlyZWd1bGF0b3ItYWx3YXlzLW9uOw0KKwkJCX07DQorCQl9Ow0KKwl9
Ow0KK307DQorDQogJmlvbXV4YyB7DQogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQogDQog
CXBpbmN0cmxfZmVjMTogZmVjMWdycCB7DQogCQlmc2wscGlucyA9IDwNCkBAIC0xMjIsMTAgKzI1
NCwyMyBAQA0KIAkJZnNsLHBpbnMgPSA8DQogCQkJTVg4TU1fSU9NVVhDX05BTkRfUkVBRFlfQl9H
UElPM19JTzE2CTB4MTkNCiAJCT47DQogCX07DQogDQorCXBpbmN0cmxfaTJjMTogaTJjMWdycCB7
DQorCQlmc2wscGlucyA9IDwNCisJCQlNWDhNTV9JT01VWENfSTJDMV9TQ0xfSTJDMV9TQ0wJCQkw
eDQwMDAwMWMzDQorCQkJTVg4TU1fSU9NVVhDX0kyQzFfU0RBX0kyQzFfU0RBCQkJMHg0MDAwMDFj
Mw0KKwkJPjsNCisJfTsNCisNCisJcGluY3RybF9wbWljOiBwbWljaXJxIHsNCisJCWZzbCxwaW5z
ID0gPA0KKwkJCU1YOE1NX0lPTVVYQ19HUElPMV9JTzAzX0dQSU8xX0lPMwkJMHg0MQ0KKwkJPjsN
CisJfTsNCisNCiAJcGluY3RybF9yZWdfdXNkaGMyX3ZtbWM6IHJlZ3VzZGhjMnZtbWMgew0KIAkJ
ZnNsLHBpbnMgPSA8DQogCQkJTVg4TU1fSU9NVVhDX1NEMl9SRVNFVF9CX0dQSU8yX0lPMTkJMHg0
MQ0KIAkJPjsNCiAJfTsNCi0tIA0KMi4xNy4xDQoNCg==
