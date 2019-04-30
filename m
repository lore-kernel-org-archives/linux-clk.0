Return-Path: <SRS0=4m2Q=TA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AF8C43219
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 17:37:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4BD4E2147A
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 17:37:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="X3sxogKh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbfD3RhN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Apr 2019 13:37:13 -0400
Received: from mail-eopbgr00056.outbound.protection.outlook.com ([40.107.0.56]:36511
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725950AbfD3RhM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 30 Apr 2019 13:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rwejN7Mf09aKc7fDLTTXWqvzXGJIsNZlQLq7GIbOk4=;
 b=X3sxogKh5Luaq8xqlr7GF78ltG+4maqoxsq03gASujLUebZqC1C8p8bV7iX5VA8LHZzx0UvNdDhAhjX/w/g3NAivQtHlootqt069fQjXAloIiv1rtCR8slscO7UaUq3f4Nie9+3qSIKaqtv4Rp7rqRtGWTl3rpwBJ+Gvz+KDqkQ=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB5730.eurprd04.prod.outlook.com (20.178.119.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 30 Apr 2019 17:35:28 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cda:4e52:8e87:8f0e]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cda:4e52:8e87:8f0e%2]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 17:35:28 +0000
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
Subject: [PATCH V2 1/2] dt-bindings: firmware: imx-scu: new binding to parse
 clocks from device tree
Thread-Topic: [PATCH V2 1/2] dt-bindings: firmware: imx-scu: new binding to
 parse clocks from device tree
Thread-Index: AQHU/3sZNSeTsgJx/0O0a2xVB8NaKg==
Date:   Tue, 30 Apr 2019 17:35:28 +0000
Message-ID: <1556645270-20648-2-git-send-email-aisheng.dong@nxp.com>
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
x-ms-office365-filtering-correlation-id: 1aff0e25-5d1b-487e-b3b9-08d6cd923c28
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB5730;
x-ms-traffictypediagnostic: AM0PR04MB5730:
x-microsoft-antispam-prvs: <AM0PR04MB5730597908399CDB3271719F803A0@AM0PR04MB5730.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(346002)(376002)(136003)(39860400002)(366004)(54534003)(189003)(199004)(81166006)(97736004)(6506007)(476003)(4326008)(386003)(102836004)(2501003)(50226002)(66066001)(2616005)(8936002)(486006)(81156014)(66946007)(8676002)(6116002)(53936002)(3846002)(305945005)(66556008)(73956011)(86362001)(64756008)(6512007)(7736002)(66446008)(66476007)(36756003)(478600001)(71190400001)(52116002)(2906002)(186003)(446003)(54906003)(14454004)(26005)(76176011)(68736007)(44832011)(11346002)(316002)(6486002)(71200400001)(6436002)(5660300002)(99286004)(110136005)(14444005)(25786009)(256004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5730;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7oeDOrlpExZDrLH4Us+fXN/jdvDUr34j5X2S3hx9ebOzYo6akZ2uLMsJ6VtJtCoyXz4uxZeZVFdJ1lCztO6urv+kTDISD8aT+EOgdWYsduWlQb64WSd2+dbgVPZ9K/m2Yoo+NPY/QfYoyI9a7yUhDS7Tttmo+RMJpNoTTYIuIP3Dkne4YlO4DqcqW2+tJ2a4lPBTlHIUlJ4yjrGcYymkGKE7WZSTtWINL7tczA6+Yzce55iDBwi9t4R+Ted8QUSX8qHGKn1CJb0DbTivao87LJ0Tjnx8U9EICSx327LcAE438ENYLllbB9Vlu+0DPWou/hGZZOwbXHJNFPALgmnLWBLJcgjau+fsaCMeeKCa0GcpPGykIguBUgKbbaV1zFMbXqOBXbhgPf+vNhxSPJX8cBrjKNAZOXuXSj1LuiBcaNE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aff0e25-5d1b-487e-b3b9-08d6cd923c28
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 17:35:28.2406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5730
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

VGhlcmUncyBhIGZldyBsaW1pdGF0aW9ucyBvbiB0aGUgb3JpZ2luYWwgb25lIGNlbGwgY2xvY2sg
YmluZGluZw0KKCNjbG9jay1jZWxscyA9IDwxPikgdGhhdCB3ZSBoYXZlIHRvIGRlZmluZSBhbGwg
Y2xvY2sgSURzIGZvciBkZXZpY2UNCnRyZWUgdG8gcmVmZXJlbmNlLiBUaGlzIG1heSBjYXVzZSB0
cm91YmxlcyBpZiB3ZSB3YW50IHRvIHVzZSBjb21tb24NCmNsb2NrIElEcyBmb3IgbXVsdGkgcGxh
dGZvcm1zIHN1cHBvcnQgd2hlbiB0aGUgY2xvY2sgb2YgdGhvc2UgcGxhdGZvcm1zDQphcmUgbW9z
dGx5IHRoZSBzYW1lLg0KZS5nLiBDdXJyZW50IGNsb2NrIElEcyBuYW1lIGFyZSBkZWZpbmVkIHdp
dGggU1MgcHJlZml4Lg0KDQpIb3dldmVyIHRoZSBkZXZpY2UgbWF5IHJlc2lkZSBpbiBkaWZmZXJl
bnQgU1MgYWNyb3NzIENQVXMsIHRoYXQgbWVhbnMgdGhlDQpTUyBwcmVmaXggbWF5IG5vdCB2YWxp
ZCBhbnltb3JlIGZvciBhIG5ldyBTb0MuIEZ1cnRoZXJtb3JlLCB0aGUgZGV2aWNlDQphdmFpbGFi
aWxpdHkgb2YgdGhvc2UgY2xvY2tzIG1heSBhbHNvIHZhcnkgYSBiaXQuDQoNCkZvciBzdWNoIHNp
dHVhdGlvbiwgV2UgZm9ybWVybHkgcGxhbm5lZCB0byBhZGQgYWxsIG5ldyBJRHMgZm9yIGVhY2gg
U1MNCmFuZCBkeW5hbWljYWxseSBjaGVjayBhdmFpbGFiaWxpdHkgZm9yIGRpZmZlcmVudCBTb0Mg
aW4gZHJpdmVyLiBUaGF0IGNhbg0KYmUgZG9uZSBidXQgdGhhdCBtYXkgaW52b2x2ZSBhIGxvdCBl
ZmZvcnQgYW5kIG1heSByZXN1bHQgaW4gbW9yZSBjaGFuZ2VzDQphbmQgZHVwbGljYXRlZCBjb2Rl
IGluIGRyaXZlciwgYWxzbyBtYWtlIGRldmljZSB0cmVlIHVwc3RyZWFtaW5nIGhhcmQgd2hpY2gN
CmRlcGVuZHMgb24gQ2xvY2sgSURzLg0KDQpUbyByZWxpZWYgdGhpcyBzaXR1YXRpb24sIHdlIHdh
bnQgdG8gbW92ZSB0aGUgY2xvY2sgZGVmaW5pdGlvbiBpbnRvDQpkZXZpY2UgdHJlZSB3aGljaCBj
YW4gZnVsbHkgZGVjb3VwbGUgdGhlIGRlcGVuZGVuY3kgb2YgQ2xvY2sgSUQgZGVmaW5pdGlvbg0K
ZnJvbSBkZXZpY2UgdHJlZS4gVGhpcyBjYW4gbWFrZSB1cyB3cml0ZSBhIGZ1bGwgZ2VuZXJpYyBj
bG9jayBkcml2ZXINCmZvciBTQ1UgYmFzZWQgU29Dcy4gTm8gbW9yZSBmcmVxdWVudCBjaGFuZ2Vz
IG5lZWRlZCBpbiBjbG9jayBkcml2ZXINCmFueSBtb3JlLg0KDQpJbiB0aGUgbWVhbndoaWxlLCB3
ZSBjYW4gYWxzbyB1c2UgdGhlIGV4aXN0ZW5jZSBvZiBjbG9jayBub2RlcyBpbiBkZXZpY2UNCnRy
ZWUgdG8gYWRkcmVzcyB0aGUgZGV2aWNlIGFuZCBjbG9jayBhdmFpbGFiaWxpdHkgZGlmZmVyZW5j
ZXMgYWNyb3NzDQpkaWZmZXJlbnQgU29Dcy4NCg0KRm9yIFNDVSBjbG9ja3MsIG9ubHkgdHdvIHBh
cmFtcyByZXF1aXJlZC4gVGhlIGZpcnN0IG9uZSBpcyByZXNvdXJjZSBpZA0Kd2hpY2ggaXMgZW5j
b2RlZCBpbiByZWcgcHJvcGVydHkgYW5kIHRoZSBzZWNvbmQgaXMgY2xvY2sgdHlwZSBpbmRleA0K
d2hpY2ggaXMgZW5jb2RlZCBpbiBnZW5lcmljIGNsb2NrLWluZGljZXMgcHJvcGVydHkgdGhleSdy
ZSBub3QgY29udGludW91c2x5Lg0KDQpBbmQgYXMgd2UgYWxzbyB3YW50IHRvIHN1cHBvcnQgY2xv
Y2sgc2V0IHBhcmVudCBmdW5jdGlvbiwgJ2Nsb2NrcycgcHJvcGVydHkNCmlzIGFsc28gdXNlZCB0
byBwYXNzIGFsbCB0aGUgcG9zc2libGUgaW5wdXQgcGFyZW50cy4NCg0KQ2M6IFJvYiBIZXJyaW5n
IDxyb2JoK2R0QGtlcm5lbC5vcmc+DQpDYzogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3Jn
Pg0KQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4NCkNjOiBTYXNjaGEgSGF1ZXIg
PGtlcm5lbEBwZW5ndXRyb25peC5kZT4NCkNjOiBNaWNoYWVsIFR1cnF1ZXR0ZSA8bXR1cnF1ZXR0
ZUBiYXlsaWJyZS5jb20+DQpDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNClNpZ25lZC1v
ZmYtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQotLS0NCkNoYW5nZUxv
ZzoNCnYxLT52MjoNCiAqIGNoYW5nZWQgdG8gb25lIGNlbGwgYmluZGluZyBpbnNwaXJlZCBieSBh
cm0sc2NwaS50eHQNCiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJt
LHNjcGkudHh0DQogICBSZXNvdXJjZSBJRCBpcyBlbmNvZGVkIGluICdyZWcnIHByb3BlcnR5Lg0K
ICAgQ2xvY2sgdHlwZSBpcyBlbmNvZGVkIGluIGdlbmVyaWMgY2xvY2staW5kaWNlcyBwcm9wZXJ0
eS4NCiAgIFRoZW4gd2UgZG9uJ3QgaGF2ZSB0byBzZWFyY2ggYWxsIHRoZSBEVCBub2RlcyB0byBm
ZXRjaA0KICAgdGhvc2UgdHdvIHZhbHVlIHRvIGNvbnN0cnVjdCBjbG9ja3Mgd2hpY2ggaXMgcmVs
YXRpdmVseQ0KICAgbG93IGVmZmljaWVuY3kuDQogKiBBZGQgcmVxdWlyZWQgcG93ZXItZG9tYWlu
IHByb3BlcnR5IGFzIHdlbGwuDQotLS0NCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJl
ZXNjYWxlL2ZzbCxzY3UudHh0ICB8IDQ1ICsrKysrKysrKysrKysrKysrKy0tLS0NCiBpbmNsdWRl
L2R0LWJpbmRpbmdzL2Zpcm13YXJlL2lteC9yc3JjLmggICAgICAgICAgICB8IDE3ICsrKysrKysr
DQogMiBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KDQpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2Nh
bGUvZnNsLHNjdS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2Zy
ZWVzY2FsZS9mc2wsc2N1LnR4dA0KaW5kZXggNWQ3ZGJhYi4uMmY0NmU4OSAxMDA2NDQNCi0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3Uu
dHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2Fs
ZS9mc2wsc2N1LnR4dA0KQEAgLTg5LDYgKzg5LDI3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQog
CQkJICAiZnNsLGlteDhxbS1jbG9jayINCiAJCQkgICJmc2wsaW14OHF4cC1jbG9jayINCiAJCQlm
b2xsb3dlZCBieSAiZnNsLHNjdS1jbGsiDQorLSAjYWRkcmVzcy1jZWxsczoJU2hvdWxkIGJlIDEu
DQorLSAjc2l6ZS1jZWxsczoJCVNob3VsZCBiZSAwLg0KKw0KK1N1YiBub2RlcyBhcmUgcmVxdWly
ZWQgdG8gcmVwcmVzZW50IGFsbCBhdmFpbGFibGUgU0NVIGNsb2NrcyB3aXRoaW4gdGhpcw0KK2hh
cmR3YXJlIHN1YnN5c3RlbSBhbmQgdGhlIGZvbGxvd2luZyBwcm9wZXJ0aWVzIGFyZSBuZWVkZWQ6
DQorDQorLSByZWc6CQkJU2hvdWxkIGNvbnRhaW4gdGhlIFJlc291cmNlIElEIG9mIHRoaXMgU0NV
IGNsb2NrLg0KKy0gI2Nsb2NrLWNlbGxzOgkJU2hvdWxkIGJlIDEuDQorLSBjbG9jay1pbmRpY2Vz
OglJbmRleCBvZiBhbGwgY2xvY2sgdHlwZXMgc3VwcG9ydGVkIGJ5IHRoaXMgU0NVIGNsb2NrLg0K
KwkJCVRoZSBvcmRlciBzaG91bGQgbWF0Y2ggdGhlIGNsb2NrLW91dHB1dC1uYW1lcyBhcnJheS4N
CisJCQlSZWZlciB0byA8aW5jbHVkZS9kdC1iaW5kaW5ncy9maXJtd2FyZS9pbXgvcnNyYy5oPiBm
b3INCisJCQlhdmFpbGFibGUgY2xvY2sgdHlwZXMgc3VwcG9ydGVkIGJ5IFNDVS4NCistIGNsb2Nr
LW91dHB1dC1uYW1lczoJU2hhbGwgYmUgdGhlIGNvcnJlc3BvbmRpbmcgbmFtZXMgb2YgdGhlIG91
dHB1dHMuDQorLSBwb3dlci1kb21haW5zOglTaG91bGQgY29udGFpbiB0aGUgcG93ZXIgZG9tYWlu
IHVzZWQgYnkgdGhpcyBTQ1UgY2xvY2suDQorDQorT3B0aW9uYWwgcHJvcGVydGllczoNCistIGNs
b2NrczoJCVNoYWxsIGJlIHRoZSBpbnB1dCBwYXJlbnQgY2xvY2socykgcGhhbmRsZSBmb3IgdGhl
IGNsb2NrLg0KKwkJCUZvciBtdWx0aXBsZXhlZCBjbG9ja3MsIHRoZSBsaXN0IG9yZGVyIG11c3Qg
bWF0Y2ggdGhlIGhhcmR3YXJlDQorCQkJcHJvZ3JhbW1pbmcgb3JkZXIuDQorDQorTGVnYWN5IENs
b2NrIGJpbmRpbmcgKE5vIHN1Yi1ub2RlcyB3aGljaCBpcyBERVBSRUNBVEVEKToNCiAtICNjbG9j
ay1jZWxsczoJCVNob3VsZCBiZSAxLiBDb250YWlucyB0aGUgQ2xvY2sgSUQgdmFsdWUuDQogLSBj
bG9ja3M6CQlMaXN0IG9mIGNsb2NrIHNwZWNpZmllcnMsIG11c3QgY29udGFpbiBhbiBlbnRyeSBm
b3INCiAJCQllYWNoIHJlcXVpcmVkIGVudHJ5IGluIGNsb2NrLW5hbWVzDQpAQCAtMTQ0LDYgKzE2
NSwyMSBAQCBsc2lvX211MTogbWFpbGJveEA1ZDFjMDAwMCB7DQogCSNtYm94LWNlbGxzID0gPDI+
Ow0KIH07DQogDQorY29ubi1zY3UtY2xvY2stY29udHJvbGxlciB7DQorCWNvbXBhdGlibGUgPSAi
ZnNsLGlteDhxeHAtY2xrIiwgImZzbCxzY3UtY2xrIjsNCisJI2FkZHJlc3MtY2VsbHMgPSA8MT47
DQorCSNzaXplLWNlbGxzID0gPDA+Ow0KKw0KKwl1YXJ0MF9jbGs6IGNsb2NrLXNjdUA1NyB7DQor
CQlyZWcgPSA8NTc+Ow0KKwkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KKwkJY2xvY2staW5kaWNlcyA9
IDxJTVhfU0NfUE1fQ0xLX1BFUj47DQorCQljbG9jay1vdXRwdXQtbmFtZXMgPSAidWFydDBfY2xr
IjsNCisJCXBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX1VBUlRfMD47DQorCX07DQorCS4u
Lg0KK30NCisNCiBmaXJtd2FyZSB7DQogCXNjdSB7DQogCQljb21wYXRpYmxlID0gImZzbCxpbXgt
c2N1IjsNCkBAIC0xNjAsMTEgKzE5Niw2IEBAIGZpcm13YXJlIHsNCiAJCQkgICZsc2lvX211MSAx
IDMNCiAJCQkgICZsc2lvX211MSAzIDM+Ow0KIA0KLQkJY2xrOiBjbGsgew0KLQkJCWNvbXBhdGli
bGUgPSAiZnNsLGlteDhxeHAtY2xrIiwgImZzbCxzY3UtY2xrIjsNCi0JCQkjY2xvY2stY2VsbHMg
PSA8MT47DQotCQl9Ow0KLQ0KIAkJaW9tdXhjIHsNCiAJCQljb21wYXRpYmxlID0gImZzbCxpbXg4
cXhwLWlvbXV4YyI7DQogDQpAQCAtMTkyLDggKzIyMyw2IEBAIHNlcmlhbEA1YTA2MDAwMCB7DQog
CS4uLg0KIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KIAlwaW5jdHJsLTAgPSA8JnBpbmN0
cmxfbHB1YXJ0MD47DQotCWNsb2NrcyA9IDwmY2xrIElNWDhRWFBfVUFSVDBfQ0xLPiwNCi0JCSA8
JmNsayBJTVg4UVhQX1VBUlQwX0lQR19DTEs+Ow0KLQljbG9jay1uYW1lcyA9ICJwZXIiLCAiaXBn
IjsNCisJY2xvY2tzID0gPCZ1YXJ0MF9jbGsgSU1YX1NDX1BNX0NMS19QRVI+Ow0KIAlwb3dlci1k
b21haW5zID0gPCZwZCBJTVhfU0NfUl9VQVJUXzA+Ow0KIH07DQpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kdC1iaW5kaW5ncy9maXJtd2FyZS9pbXgvcnNyYy5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9m
aXJtd2FyZS9pbXgvcnNyYy5oDQppbmRleCA0ZTYxZjY0Li5mYmVhY2E3IDEwMDY0NA0KLS0tIGEv
aW5jbHVkZS9kdC1iaW5kaW5ncy9maXJtd2FyZS9pbXgvcnNyYy5oDQorKysgYi9pbmNsdWRlL2R0
LWJpbmRpbmdzL2Zpcm13YXJlL2lteC9yc3JjLmgNCkBAIC01NDcsNCArNTQ3LDIxIEBADQogI2Rl
ZmluZSBJTVhfU0NfUl9BVFRFU1RBVElPTgkJNTQ1DQogI2RlZmluZSBJTVhfU0NfUl9MQVNUCQkJ
NTQ2DQogDQorLyoNCisgKiBEZWZpbmVzIGZvciBTQyBQTSBDTEsNCisgKi8NCisjZGVmaW5lIElN
WF9TQ19QTV9DTEtfU0xWX0JVUwkJMAkvKiBTbGF2ZSBidXMgY2xvY2sgKi8NCisjZGVmaW5lIElN
WF9TQ19QTV9DTEtfTVNUX0JVUwkJMQkvKiBNYXN0ZXIgYnVzIGNsb2NrICovDQorI2RlZmluZSBJ
TVhfU0NfUE1fQ0xLX1BFUgkJMgkvKiBQZXJpcGhlcmFsIGNsb2NrICovDQorI2RlZmluZSBJTVhf
U0NfUE1fQ0xLX1BIWQkJMwkvKiBQaHkgY2xvY2sgKi8NCisjZGVmaW5lIElNWF9TQ19QTV9DTEtf
TUlTQwkJNAkvKiBNaXNjIGNsb2NrICovDQorI2RlZmluZSBJTVhfU0NfUE1fQ0xLX01JU0MwCQkw
CS8qIE1pc2MgMCBjbG9jayAqLw0KKyNkZWZpbmUgSU1YX1NDX1BNX0NMS19NSVNDMQkJMQkvKiBN
aXNjIDEgY2xvY2sgKi8NCisjZGVmaW5lIElNWF9TQ19QTV9DTEtfTUlTQzIJCTIJLyogTWlzYyAy
IGNsb2NrICovDQorI2RlZmluZSBJTVhfU0NfUE1fQ0xLX01JU0MzCQkzCS8qIE1pc2MgMyBjbG9j
ayAqLw0KKyNkZWZpbmUgSU1YX1NDX1BNX0NMS19NSVNDNAkJNAkvKiBNaXNjIDQgY2xvY2sgKi8N
CisjZGVmaW5lIElNWF9TQ19QTV9DTEtfQ1BVCQkyCS8qIENQVSBjbG9jayAqLw0KKyNkZWZpbmUg
SU1YX1NDX1BNX0NMS19QTEwJCTQJLyogUExMICovDQorI2RlZmluZSBJTVhfU0NfUE1fQ0xLX0JZ
UEFTUwkJNAkvKiBCeXBhc3MgY2xvY2sgKi8NCisNCiAjZW5kaWYgLyogX19EVF9CSU5ESU5HU19S
U0NSQ19JTVhfSCAqLw0KLS0gDQoyLjcuNA0KDQo=
