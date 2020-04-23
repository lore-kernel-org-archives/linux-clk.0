Return-Path: <SRS0=Q+FU=6H=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EE8C54FCB
	for <linux-clk@archiver.kernel.org>; Thu, 23 Apr 2020 14:16:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD71D2087E
	for <linux-clk@archiver.kernel.org>; Thu, 23 Apr 2020 14:16:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="iqQFqI7V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbgDWOQQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Apr 2020 10:16:16 -0400
Received: from mail-eopbgr70084.outbound.protection.outlook.com ([40.107.7.84]:34756
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726450AbgDWOQP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 23 Apr 2020 10:16:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqyHO+lxIXF4tNrqt9y0YFQlo8Fq9XWvyjJvhSSWTIGB/CoBDn8emvXNThDeYKmZtfwtzGPfCy4Pnv/7hLI3qud/JCqHdhyZr4bthZourRhhvmnQtw7XtvlAc07DHLy+mdmbL/MFrRVpTBILnBmy4ssxnhgGU2S6F7cNj7iq2U3LtIWn60QxfTlYczfra+63YqLG5FajB+QFSaQRu+gi7SIIj2ZMVrnaSYDOvwNMql/dzpH01uQw0BD6O9koi5qssSSjYgRBico4z70IVt48XYUWBAzazznyfaWV2LIOtCW8SDFSti3q109KCgYv13OmkC7Ab4Zv2xTrYK/9Z8X6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQaICSse6eEF7G+bgNQ4X2kydv8WDHSeFQPAED+0JJM=;
 b=acIgl3ZvNOqUdDEkzoMkA2I0UWMhCrzR7RLsmVJ47fXbENY8k8EN5OpPO/41j8+yny4Bl+CR/qWABzhD6kyzyy9aXqvQfjamiXwp9wh2FbHDPWnDXSDwbAvFb8DJ0tDbPd/1g50M72AMC3QLxPKITDynrzirgWQ9y0h2iFPAjcsIJyGubjueVaUVOB8QtDJYOInUramEWMI6eCx5AYdqDriIySNEUMLFtvYSPDWDLeHLw7cBtzlsXR9IGuKdydWmrWrul2H3NqCMf1E4krEvAbdM6Bhkz9nljEcwo0Dv0/yAnNBP12TqB9CXVARHCcEw0fferAqxJVrHc8e3EgB2IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQaICSse6eEF7G+bgNQ4X2kydv8WDHSeFQPAED+0JJM=;
 b=iqQFqI7VEec6+Pya7nZQ4I6fi/GGh1A5MK/b23Q2yJxpPOHRtmr2vaPzXAdz+GIS+rOmHa47GDvdHdcHsHUV/Be1G1v6lAZdjFPJiGSbfukq0QRbNa6x8PEro3tsonO/ypIr6k9Q7TduLeK6PjgQKrJV5WCvQ93VVA90MfWrlKM=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB6470.eurprd04.prod.outlook.com (2603:10a6:20b:fb::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Thu, 23 Apr
 2020 14:16:10 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::d9f7:5527:e89d:1ae3]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::d9f7:5527:e89d:1ae3%7]) with mapi id 15.20.2921.032; Thu, 23 Apr 2020
 14:16:10 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Oliver Graute <oliver.graute@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Oliver Graute <Oliver.Graute@KoCoConnector.com>
Subject: RE: imx8qxp-lpcg-clk: probe of 5a4a0000.clock-controller failed with
 error -110
Thread-Topic: imx8qxp-lpcg-clk: probe of 5a4a0000.clock-controller failed with
 error -110
Thread-Index: AQHWF+h+DUwHsumPo02GcEVru4cZZKiGicFw
Date:   Thu, 23 Apr 2020 14:16:10 +0000
Message-ID: <AM6PR04MB4966D212E388766E8F6101A980D30@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20200421142350.GA77260@archlinux.localdomain>
In-Reply-To: <20200421142350.GA77260@archlinux.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 169ff3c3-d682-404c-8ef7-08d7e790df96
x-ms-traffictypediagnostic: AM6PR04MB6470:|AM6PR04MB6470:|AM6PR04MB6470:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB6470FD777257D42090523A5080D30@AM6PR04MB6470.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(66446008)(66556008)(66476007)(45080400002)(478600001)(52536014)(6506007)(110136005)(54906003)(55016002)(9686003)(5660300002)(316002)(4326008)(7696005)(76116006)(33656002)(64756008)(26005)(81156014)(66946007)(8936002)(186003)(71200400001)(8676002)(86362001)(2906002)(44832011)(32563001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t61q8dvIIpZvdGzk2Oly9A9Sa3QEDRhD7o5+8LWM+MBZ+oQejdTwN6kgJXpO72R5lCXzdBZdyCVR0dv2lSEJUi8m00wne/ZUw6ftqqHo+4GnbBWrAJpqLHfZlU/TVfB9Qqo69KMD18AfczyxsoS0bj+c/TUlvdo9wBvPbkAnQ5Udbk2rS82QoXmM0ECGADMlV3/m5cKxy5YznWR4ztM+sANaX7K1lM4mOAAdZgwCCJQM+IyZKZQZiliYQANai6/mSPmzlb3keEDBcQ/Vaa0alLkhSPhXS8CmB/sCfVNrj/z7VrkASVECKuDPkJ8cPM2W8m7/VrfT/EHo3KrmodeA1dPCj7sz4IqfubZP7vqDOHHkzFEHicRUpqPbSIu7okvilEcDJrT4JFlMvxklSA4wbBwyKJwn7pSZIgjkhIwez+P8FMK/Wy+cSUig4vxYdCv1lHikOJwaeBowRvYxa1A2D2usrqhe7TQswmMP5gH51aHhacABPezpRgFwXKMewfpc
x-ms-exchange-antispam-messagedata: u7J8jzDnCHZ5Z9CsjhFCnYW/PMOBgZ9zmuaEZNl3foPzHu+b/CaB2IZPhZaCmYyHjW0DcE7jTvcfmSkG7HRP+sQLBoyIXyiSbsgQo8xhjQaVLbSfRyaPZDsQ9PXzFnkl91DmK/8ZWAVSQlHUxpcj0Q==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169ff3c3-d682-404c-8ef7-08d7e790df96
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 14:16:10.7819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fOkf3ADdzZ8BP4Nx/TfWRBOldNNg5OWBM6PPM1KnmxS0A1gRM5ccTLO382p+/Hf2M38DrQmaR5NVKo1UH46Kww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6470
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBPbGl2ZXIgR3JhdXRlIDxvbGl2ZXIuZ3JhdXRlQGdtYWlsLmNvbT4NCj4gU2VudDog
VHVlc2RheSwgQXByaWwgMjEsIDIwMjAgMTA6MjQgUE0NCj4gDQo+IEhlbGxvLA0KPiANCj4gSSBy
dW4gaW50byBiZWxvdyBjbG9jayBwcm9iaW5nIGlzc3VlLCBhZnRlciB1cGdyYWRpbmcgZnJvbSBu
ZXh0LTIwMjAwMjE0IHRvDQo+IG5leHQtMjAyMDA0MjAuIEkgdXNlIHRoZSBmb2xsb3dpbmcgcGF0
Y2hlcyBzZXJpZXMgb250b3A6DQo+ID4gDQo+IFNvbWUgaWRlYXMgd2hhdCdzIHRoZSByZWFzb24g
Zm9yIHRoaXMgYmVoYXZpb3I/IG9yIGhvdyB0byBmaXggdGhpcz8NCj4gDQoNCkkgd2lsbCBjaGVj
ayBpdCB0b21vcnJvdy4NCkJlZm9yZSB0aGF0LCBJIG5lZWQgcmViYXNlIG15IHBhdGNoIHNlcmll
cyB0byBsYXN0IGtlcm5lbCB0byByZXByb2R1Y2UgdGhpcyBpc3N1ZS4NCg0KUmVnYXJkcw0KQWlz
aGVuZw0KDQo+IEJlc3QgUmVnYXJkcywNCj4gDQo+IE9saXZlcg0KPiANCj4gDQo+IExpbnV4IGRt
c3NlMjAgNS43LjAtcmMyLW5leHQtMjAyMDA0MjAtMDAwNjItZ2RlYjRhYjU2OGE2NSAjMjkgU01Q
DQo+IFBSRUVNUFQgVHVlIEFwciAyMSAxMzozMDo1NiBVVEMgMjAyMCBhYXJjaDY0IEdOVS9MaW51
eA0KPiANCj4gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+IFsgICAzMS44
MTc5NzFdIGlteDhxeHAtbHBjZy1jbGsgNWE0YTAwMDAuY2xvY2stY29udHJvbGxlcjogZGVmZXJy
ZWQgcHJvYmUNCj4gdGltZW91dCwgaWdub3JpbmcgZGVwZW5kZW5jeQ0KPiBbICAgMzEuODE4MDM1
XSBXQVJOSU5HOiBDUFU6IDAgUElEOiAxMjIgYXQgZHJpdmVycy9iYXNlL2RkLmM6MjcwDQo+IGRy
aXZlcl9kZWZlcnJlZF9wcm9iZV9jaGVja19zdGF0ZSsweDQ0LzB4NjgNCj4gWyAgIDMxLjgzNjY0
N10gTW9kdWxlcyBsaW5rZWQgaW46DQo+IFsgICAzMS44Mzk3MDldIENQVTogMCBQSUQ6IDEyMiBD
b21tOiBrd29ya2VyLzA6MSBOb3QgdGFpbnRlZA0KPiA1LjcuMC1yYzItbmV4dC0yMDIwMDQyMC0w
MDA2Mi1nZGViNGFiNTY4YTY1ICMyOQ0KPiBbICAgMzEuODQ5Mjc2XSBIYXJkd2FyZSBuYW1lOiBB
ZHZhbnRlY2ggaU1YOFFNIERNU1NFMjAgKERUKQ0KPiBbICAgMzEuODU0NTkzXSBXb3JrcXVldWU6
IGV2ZW50cyBkZWZlcnJlZF9wcm9iZV93b3JrX2Z1bmMNCj4gWyAgIDMxLjg1OTczOF0gcHN0YXRl
OiA2MDAwMDAwNSAoblpDdiBkYWlmIC1QQU4gLVVBTykNCj4gWyAgIDMxLjg2NDUzMl0gcGMgOiBk
cml2ZXJfZGVmZXJyZWRfcHJvYmVfY2hlY2tfc3RhdGUrMHg0NC8weDY4DQo+IFsgICAzMS44NzAx
OThdIGxyIDogZHJpdmVyX2RlZmVycmVkX3Byb2JlX2NoZWNrX3N0YXRlKzB4NDQvMHg2OA0KPiBb
ICAgMzEuODc1ODU5XSBzcCA6IGZmZmY4MDAwMTIwZWJhYzANCj4gWyAgIDMxLjg3OTE2OF0geDI5
OiBmZmZmODAwMDEyMGViYWMwIHgyODogZmZmZjgwMDAxMTk1NzAwMA0KPiBbICAgMzEuODg0NDg1
XSB4Mjc6IDAwMDAwMDAwMDAwMDAwMDAgeDI2OiBmZmZmODAwMDEwMDZiY2U4DQo+IFsgICAzMS44
ODk3OTJdIHgyNTogMDAwMDAwMDAwMDAwMDAwMSB4MjQ6IGZmZmY4MDAwMTFhZThkNTgNCj4gWyAg
IDMxLjg5NTEwOV0geDIzOiBmZmZmMDAwOTc1ZmY3MDEwIHgyMjogZmZmZmZmZmZmZmZmZmZmZQ0K
PiBbICAgMzEuOTAwNDI2XSB4MjE6IGZmZmYwMDA5NzVlYzQ2MDAgeDIwOiBmZmZmMDAwOTc1ZmY3
MDEwDQo+IFsgICAzMS45MDU3NDJdIHgxOTogZmZmZjAwMDk3NWZmNzAxMCB4MTg6IDAwMDAwMDAw
MDAwMDAwMTANCj4gWyAgIDMxLjkxMTA1MF0geDE3OiAwMDAwMDAwMDAwMDAwMDAwIHgxNjogMDAw
MDAwMDAwMDAwMDAwMA0KPiBbICAgMzEuOTE2MzY3XSB4MTU6IGZmZmYwMDA5NzVlYzRhNzAgeDE0
OiA2ZjY1NmQ2OTc0MjA2NTYyDQo+IFsgICAzMS45MjE2ODRdIHgxMzogNmY3MjcwMjA2NDY1NzI3
MiB4MTI6IDY1NjY2NTY0MjAzYTcyNjUNCj4gWyAgIDMxLjkyNzAwMV0geDExOiA2YzZjNmY3Mjc0
NmU2ZjYzIHgxMDogMmQ2YjYzNmY2YzYzMmUzMA0KPiBbICAgMzEuOTMyMzE4XSB4OSA6IDMwMzAz
MDYxMzQ2MTM1MjAgeDggOiAwMDAwMDAwMDAwMDAwMDAwDQo+IFsgICAzMS45Mzc2MzRdIHg3IDog
NmY2ZTY3NjkyMDJjNzQ3NSB4NiA6IGZmZmY4MDAwMTFiNTU4NGYNCj4gWyAgIDMxLjk0Mjk1MV0g
eDUgOiAwMDAwMDAwMDAwMDAwMDAwIHg0IDogMDAwMDAwMDAwMDAwMDAwMA0KPiBbICAgMzEuOTQ4
MjY4XSB4MyA6IDAwMDAwMDAwZmZmZmZmZmYgeDIgOiBmZmZmODAwOTZkOWQwMDAwDQo+IFsgICAz
MS45NTM1ODRdIHgxIDogY2RhMTg3OWUzYWY0MTQwMCB4MCA6IDAwMDAwMDAwMDAwMDAwMDANCj4g
WyAgIDMxLjk1ODkwNF0gQ2FsbCB0cmFjZToNCj4gWyAgIDMxLjk2MTM1MV0gIGRyaXZlcl9kZWZl
cnJlZF9wcm9iZV9jaGVja19zdGF0ZSsweDQ0LzB4NjgNCj4gWyAgIDMxLjk2NjY2N10gIF9fZ2Vu
cGRfZGV2X3BtX2F0dGFjaCsweDFhNC8weDFiMA0KPiBbICAgMzEuOTcxMTA5XSAgZ2VucGRfZGV2
X3BtX2F0dGFjaCsweDYwLzB4NzANCj4gWyAgIDMxLjk3NTIxNF0gIGRldl9wbV9kb21haW5fYXR0
YWNoKzB4NTAvMHg1OA0KPiBbICAgMzEuOTc5NDAxXSAgcGxhdGZvcm1fZHJ2X3Byb2JlKzB4M2Mv
MHhhOA0KPiBbICAgMzEuOTgzNDExXSAgcmVhbGx5X3Byb2JlKzB4ZDgvMHgzMjANCj4gWyAgIDMx
Ljk4Njk5MF0gIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHg1OC8weGYwDQo+IFsgICAzMS45OTEwOTNd
ICBfX2RldmljZV9hdHRhY2hfZHJpdmVyKzB4ODQvMHhjOA0KPiBbICAgMzEuOTk1NDU0XSAgYnVz
X2Zvcl9lYWNoX2RydisweDc4LzB4YzgNCj4gWyAgIDMxLjk5OTI5Ml0gIF9fZGV2aWNlX2F0dGFj
aCsweGU0LzB4MTQwDQo+IFsgICAzMi4wMDMxMzFdICBkZXZpY2VfaW5pdGlhbF9wcm9iZSsweDE0
LzB4MjANCj4gWyAgIDMyLjAwNzMxMF0gIGJ1c19wcm9iZV9kZXZpY2UrMHg5Yy8weGE4DQo+IFsg
ICAzMi4wMTExNDFdICBkZWZlcnJlZF9wcm9iZV93b3JrX2Z1bmMrMHg3NC8weGIwDQo+IFsgICAz
Mi4wMTU2ODNdICBwcm9jZXNzX29uZV93b3JrKzB4MWEwLzB4MzI4DQo+IFsgICAzMi4wMTk2OTJd
ICB3b3JrZXJfdGhyZWFkKzB4MWY4LzB4NDI4DQo+IFsgICAzMi4wMjM0NDddICBrdGhyZWFkKzB4
MTM4LzB4MTU4DQo+IFsgICAzMi4wMjY2ODBdICByZXRfZnJvbV9mb3JrKzB4MTAvMHgxYw0KPiBb
ICAgMzIuMDMwMjU2XSAtLS1bIGVuZCB0cmFjZSAzM2Q0MTc0MDE1ODUwMTUwIF0tLS0NCj4gWyAg
IDMyLjAzNDk0N10gaW14OHF4cC1scGNnLWNsazogcHJvYmUgb2YgNWE0YTAwMDAuY2xvY2stY29u
dHJvbGxlciBmYWlsZWQNCj4gd2l0aCBlcnJvciAtMTEwDQo+IFsgICAzMi4wNDYzNjVdIHBsYXRm
b3JtIGx2ZHNfYmFja2xpZ2h0QDE6IGRlZmVycmVkIHByb2JlIHBlbmRpbmcNCj4gWyAgIDMyLjA1
MjE1NF0gcGxhdGZvcm0gNWIxMzAwMDAuY2RuczM6IGRlZmVycmVkIHByb2JlIHBlbmRpbmcNCg0K
