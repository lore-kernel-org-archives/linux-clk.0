Return-Path: <SRS0=4m2Q=TA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870CFC04AA8
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 17:35:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E59121670
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 17:35:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="BqS2X0oG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfD3Rff (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Apr 2019 13:35:35 -0400
Received: from mail-eopbgr00080.outbound.protection.outlook.com ([40.107.0.80]:50502
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726006AbfD3Rff (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 30 Apr 2019 13:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+oyjylI89WOdiEJe1vxtVTeRifl01vyRdMgmrLAUBE=;
 b=BqS2X0oGqJac7ylCGLmHfxOp0qo/v5L5ezSvzghirZCpoTWZm+rwniqOhKOQ2Lj14lAvg5OOvzo13PrAaWM58oXgJOQh8r+OCpcbTkibYQe7zaCVfFOMmYCPilK62wInnx/nQGh8B40PVaCtMsCh+NhQlIQVcknEKRcygM1VsTY=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB4995.eurprd04.prod.outlook.com (20.176.215.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.18; Tue, 30 Apr 2019 17:35:31 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cda:4e52:8e87:8f0e]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cda:4e52:8e87:8f0e%2]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 17:35:31 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH V2 2/2] dt-bindings: clock: imx-lpcg: add support to parse
 clocks from device tree
Thread-Topic: [PATCH V2 2/2] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Thread-Index: AQHU/3scQmNSzEByRUu6j1Pj1Cb9pQ==
Date:   Tue, 30 Apr 2019 17:35:31 +0000
Message-ID: <1556645270-20648-3-git-send-email-aisheng.dong@nxp.com>
References: <1556645270-20648-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1556645270-20648-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2P15301CA0007.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::17) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:5b::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a87900d6-e059-425c-5132-08d6cd923e65
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4995;
x-ms-traffictypediagnostic: AM0PR04MB4995:
x-microsoft-antispam-prvs: <AM0PR04MB49959517A5BB907752BB0C1D803A0@AM0PR04MB4995.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(366004)(346002)(39860400002)(376002)(136003)(396003)(199004)(189003)(54534003)(6506007)(5660300002)(14444005)(36756003)(386003)(102836004)(186003)(256004)(26005)(4326008)(68736007)(71190400001)(71200400001)(25786009)(2501003)(6486002)(6436002)(8936002)(6512007)(50226002)(8676002)(81166006)(81156014)(53936002)(54906003)(66066001)(2906002)(110136005)(66556008)(99286004)(73956011)(66446008)(316002)(66946007)(66476007)(64756008)(52116002)(76176011)(2616005)(44832011)(476003)(11346002)(486006)(97736004)(7736002)(86362001)(446003)(478600001)(14454004)(6116002)(3846002)(305945005)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4995;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sIzGlBNHiQDB6sCIhq4+NpjZlEEaf8FaL3SVhMi22Iv12iSmQzC7LxjjczgNQEGaKDaKrPu1GF0vNeQrAPTCxM3w9C/jlpmlV2cbK1t42RW0zPipa0q5tOCnuvL6eZlh48Vb7N5ykQIp88wWiq0CKISbAmIcN2sXBKu2Z7iykTvTZTI1MwStxmCjCm2S6+6RW6Z6fu1wPpWQwGdB3FcUWqYDwT8aYtpj8alf6wiWCHTaRuqRQ3PG5+OvhDgkurGYPEymJxZ1ehn6CCh5gXROisN5OmnAOODvf/atRzaufm/DPolkjQ/YVJ1F/64nCeEPWsBwMlXH2K/Oo0dccX5/T/n7DpEPuCz2JSk5yN9HtRsppz/wTNwCUmku05QImbr5JuL1kBfZVzVpgfMWOwWW8HJt7lD0Y+mdil2eWONqT3s=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87900d6-e059-425c-5132-08d6cd923e65
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 17:35:31.7852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4995
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

TVg4UU0gYW5kIE1YOFFYUCBMUENHIENsb2NrcyBhcmUgbW9zdGx5IHRoZSBzYW1lIGV4Y2VwdCB0
aGV5IG1heSByZXNpZGUNCmluIGRpZmZlcmVudCBzdWJzeXN0ZW1zIGFjcm9zcyBDUFVzIGFuZCBh
bHNvIHZhcnkgYSBiaXQgb24gdGhlIGF2YWlsYWJpbGl0eS4NCg0KU2FtZSBhcyBTQ1UgY2xvY2ss
IHdlIHdhbnQgdG8gbW92ZSB0aGUgY2xvY2sgZGVmaW5pdGlvbiBpbnRvIGRldmljZSB0cmVlDQp3
aGljaCBjYW4gZnVsbHkgZGVjb3VwbGUgdGhlIGRlcGVuZGVuY3kgb2YgQ2xvY2sgSUQgZGVmaW5p
dGlvbiBmcm9tIGRldmljZQ0KdHJlZSBhbmQgbWFrZSB1cyBiZSBhYmxlIHRvIHdyaXRlIGEgZnVs
bHkgZ2VuZXJpYyBscGNnIGNsb2NrIGRyaXZlci4NCg0KQW5kIHdlIGNhbiBhbHNvIHVzZSB0aGUg
ZXhpc3RlbmNlIG9mIGNsb2NrIG5vZGVzIGluIGRldmljZSB0cmVlIHRvIGFkZHJlc3MNCnRoZSBk
ZXZpY2UgYW5kIGNsb2NrIGF2YWlsYWJpbGl0eSBkaWZmZXJlbmNlcyBhY3Jvc3MgZGlmZmVyZW50
IFNvQ3MuDQoNCkNjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPg0KQ2M6IFN0ZXBo
ZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4NCkNjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5l
bC5vcmc+DQpDYzogU2FzY2hhIEhhdWVyIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+DQpDYzogTWlj
aGFlbCBUdXJxdWV0dGUgPG10dXJxdWV0dGVAYmF5bGlicmUuY29tPg0KQ2M6IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnDQpTaWduZWQtb2ZmLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9u
Z0BueHAuY29tPg0KLS0tDQpDaGFuZ2VMb2c6DQp2MS0+djI6DQogKiBVcGRhdGUgZXhhbXBsZQ0K
ICogQWRkIHBvd2VyIGRvbWFpbiBwcm9wZXJ0eQ0KLS0tDQogLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvY2xvY2svaW14OHF4cC1scGNnLnR4dCAgICAgfCAzNCArKysrKysrKysrKysrKysrKystLS0t
DQogMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svaW14OHF4
cC1scGNnLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9pbXg4
cXhwLWxwY2cudHh0DQppbmRleCA5NjVjZmE0Li42ZmMyZmQ4IDEwMDY0NA0KLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2lteDhxeHAtbHBjZy50eHQNCisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9pbXg4cXhwLWxwY2cudHh0
DQpAQCAtMTEsNiArMTEsMjEgQEAgZW5hYmxlZCBieSB0aGVzZSBjb250cm9sIGJpdHMsIGl0IG1p
Z2h0IHN0aWxsIG5vdCBiZSBydW5uaW5nIGJhc2VkDQogb24gdGhlIGJhc2UgcmVzb3VyY2UuDQog
DQogUmVxdWlyZWQgcHJvcGVydGllczoNCistIGNvbXBhdGlibGU6CQlTaG91bGQgYmUgb25lIG9m
Og0KKwkJCSAgImZzbCxpbXg4cXhwLWxwY2ciDQorCQkJICAiZnNsLGlteDhxbS1scGNnIiBmb2xs
b3dlZCBieSAiZnNsLGlteDhxeHAtbHBjZyIuDQorLSByZWc6CQkJQWRkcmVzcyBhbmQgbGVuZ3Ro
IG9mIHRoZSByZWdpc3RlciBzZXQuDQorLSAjY2xvY2stY2VsbHM6CQlTaG91bGQgYmUgMS4gT25l
IExQQ0cgc3VwcG9ydHMgbXVsdGlwbGUgY2xvY2tzLg0KKy0gY2xvY2tzOgkJSW5wdXQgcGFyZW50
IGNsb2NrcyBwaGFuZGxlIGFycmF5IGZvciBlYWNoIGNsb2NrLg0KKy0gYml0LW9mZnNldDoJCUFu
IGludGVnZXIgYXJyYXkgaW5kaWNhdGluZyB0aGUgYml0IG9mZnNldCBmb3IgZWFjaCBjbG9jay4N
CistIGh3LWF1dG9nYXRlOgkJQm9vbGVhbiBhcnJheSBpbmRpY2F0aW5nIHdoZXRoZXIgc3VwcG9y
dHMgSFcgYXV0b2dhdGUgZm9yDQorCQkJZWFjaCBjbG9jay4NCistIGNsb2NrLW91dHB1dC1uYW1l
czoJU2hhbGwgYmUgdGhlIGNvcnJlc3BvbmRpbmcgbmFtZXMgb2YgdGhlIG91dHB1dHMuDQorCQkJ
Tk9URSB0aGlzIHByb3BlcnR5IG11c3QgYmUgc3BlY2lmaWVkIGluIHRoZSBzYW1lIG9yZGVyDQor
CQkJYXMgdGhlIGNsb2NrIGJpdC1vZmZzZXQgYW5kIGh3LWF1dG9nYXRlIHByb3BlcnR5Lg0KKy0g
cG93ZXItZG9tYWluczoJU2hvdWxkIGNvbnRhaW4gdGhlIHBvd2VyIGRvbWFpbiB1c2VkIGJ5IHRo
aXMgY2xvY2suDQorDQorTGVnYWN5IGJpbmRpbmcgKERFUFJFQ0FURUQpOg0KIC0gY29tcGF0aWJs
ZToJU2hvdWxkIGJlIG9uZSBvZjoNCiAJCSAgImZzbCxpbXg4cXhwLWxwY2ctYWRtYSIsDQogCQkg
ICJmc2wsaW14OHF4cC1scGNnLWNvbm4iLA0KQEAgLTMzLDEwICs0OCwxNyBAQCBFeGFtcGxlczoN
CiANCiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svaW14OHF4cC1jbG9jay5oPg0KIA0KLWNv
bm5fbHBjZzogY2xvY2stY29udHJvbGxlckA1YjIwMDAwMCB7DQotCWNvbXBhdGlibGUgPSAiZnNs
LGlteDhxeHAtbHBjZy1jb25uIjsNCi0JcmVnID0gPDB4NWIyMDAwMDAgMHhiMDAwMD47DQorc2Ro
YzBfbHBjZzogY2xvY2stY29udHJvbGxlckA1YjIwMDAwMCB7DQorCWNvbXBhdGlibGUgPSAiZnNs
LGlteDhxeHAtbHBjZyI7DQorCXJlZyA9IDwweDViMjAwMDAwIDB4MTAwMDA+Ow0KIAkjY2xvY2st
Y2VsbHMgPSA8MT47DQorCWNsb2NrcyA9IDwmc2RoYzBfY2xrIElNWF9TQ19QTV9DTEtfUEVSPiwN
CisJCSA8JmNvbm5faXBnX2Nsaz4sIDwmY29ubl9heGlfY2xrPjsNCisJYml0LW9mZnNldCA9IDww
IDE2IDIwPjsNCisJY2xvY2stb3V0cHV0LW5hbWVzID0gInNkaGMwX2xwY2dfcGVyX2NsayIsDQor
CQkJICAgICAic2RoYzBfbHBjZ19pcGdfY2xrIiwNCisJCQkgICAgICJzZGhjMF9scGNnX2FoYl9j
bGsiOw0KKwlwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9TREhDXzA+Ow0KIH07DQogDQog
dXNkaGMxOiBtbWNANWIwMTAwMDAgew0KQEAgLTQ0LDggKzY2LDggQEAgdXNkaGMxOiBtbWNANWIw
MTAwMDAgew0KIAlpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+Ow0KIAlpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgMjMyIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KIAlyZWcgPSA8MHg1YjAxMDAwMCAweDEw
MDAwPjsNCi0JY2xvY2tzID0gPCZjb25uX2xwY2cgSU1YOFFYUF9DT05OX0xQQ0dfU0RIQzBfSVBH
X0NMSz4sDQotCQkgPCZjb25uX2xwY2cgSU1YOFFYUF9DT05OX0xQQ0dfU0RIQzBfUEVSX0NMSz4s
DQotCQkgPCZjb25uX2xwY2cgSU1YOFFYUF9DT05OX0xQQ0dfU0RIQzBfSENMSz47DQorCWNsb2Nr
cyA9IDwmc2RoYzBfbHBjZyAxPiwNCisJCSA8JnNkaGMwX2xwY2cgMD4sDQorCQkgPCZzZGhjMF9s
cGNnIDI+Ow0KIAljbG9jay1uYW1lcyA9ICJpcGciLCAicGVyIiwgImFoYiI7DQogfTsNCi0tIA0K
Mi43LjQNCg0K
