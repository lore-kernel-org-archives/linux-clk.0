Return-Path: <SRS0=gieW=TD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85364C43219
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 00:52:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54FBE2070B
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 00:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ul+9Usip"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfECAwW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 May 2019 20:52:22 -0400
Received: from mail-eopbgr20076.outbound.protection.outlook.com ([40.107.2.76]:49822
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726240AbfECAwV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 2 May 2019 20:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBHPtdW70JPi+vsXxciAWn0+D/PcRDhCVzWhQ/Bm7lA=;
 b=Ul+9Usipgq4C9zqw4cIBQA/n80PS1B1iSLUeXlRYozsNjcf8eFH4CvqjYWff5WrBB37fj5mpvWwVhzxeosc8tVDNIlCvYoXsr+EVEwQgW6P9oLPWLcwiB04x8zNkH4RcDAqx2C5T5ef8+ghiGevJ151jIxY6UFurEzuyJqDgmak=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB5026.eurprd04.prod.outlook.com (20.177.40.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.16; Fri, 3 May 2019 00:52:17 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c415:3cab:a042:2e13]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c415:3cab:a042:2e13%6]) with mapi id 15.20.1856.008; Fri, 3 May 2019
 00:52:17 +0000
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
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V2 0/2] clk: imx: scu: add parsing clocks from device tree
 support
Thread-Topic: [PATCH V2 0/2] clk: imx: scu: add parsing clocks from device
 tree support
Thread-Index: AQHU/3sXAchBbqvng0+oy01651OLQqZYlC0A
Date:   Fri, 3 May 2019 00:52:17 +0000
Message-ID: <AM0PR04MB4211508CC25111598527757A80350@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1556645270-20648-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1556645270-20648-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5dd3edc7-3ab4-49fa-c740-08d6cf619710
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB5026;
x-ms-traffictypediagnostic: AM0PR04MB5026:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR04MB502680CADF20174F1679EA1780350@AM0PR04MB5026.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(136003)(366004)(396003)(54534003)(189003)(199004)(53936002)(9686003)(68736007)(76116006)(110136005)(256004)(4326008)(478600001)(55016002)(305945005)(26005)(316002)(86362001)(52536014)(6246003)(54906003)(6306002)(2501003)(33656002)(25786009)(74316002)(2906002)(73956011)(486006)(186003)(476003)(6116002)(5660300002)(71200400001)(81166006)(6506007)(102836004)(81156014)(229853002)(71190400001)(7736002)(446003)(3846002)(966005)(99286004)(8676002)(7696005)(76176011)(8936002)(44832011)(64756008)(66476007)(14454004)(66066001)(66946007)(6436002)(11346002)(66556008)(66446008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5026;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hHHBZsSeEyikvY/6dta2fX+LtC9hAmQOl2TGLmdP8SUqDRGT6EhDZXVYVbkMpLkqeHjkuDSfsCAGJL8ZhusJeImUu1SOSjfNAICLSN3Dpl9DseqlqMF4gJj4x7v6xbJCOn0tP7DSdhcwYM8p1WAPkX39xEpSB+bK+vm1rrNogpFNJAN4VvaNwSByfQvorZzDNCk6CSOqSTqL8wpKObEB/YKSKe1r1Yz1/fZAKiRw/CRBzqqdMMLKI1SXmMGDj+vwdsTy/YLABWX+rhRGlFyLSla9ZmRqXWKEDzFme8vVJ2JGHm/sxuep6XYQglO/E4F8OragCn3FgxN+yYEYTaQKjrzh8NwK72bxQm+tsr34B4WOZLjrHxsO+054d0jWDRmtz0rG6ygRJsuTobyqroFZ2Z4Tfhbwm0cqo4ur8t3zhvw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd3edc7-3ab4-49fa-c740-08d6cf619710
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 00:52:17.1451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5026
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgUm9iLA0KDQpEbyB5b3UgaGF2ZSBhIGNoYW5jZSB0byBoZWxwIGxvb2sgYXQgdGhpcz8NCg0K
UmVnYXJkcw0KRG9uZyBBaXNoZW5nDQoNCj4gRnJvbTogQWlzaGVuZyBEb25nDQo+IFNlbnQ6IFdl
ZG5lc2RheSwgTWF5IDEsIDIwMTkgMTozNSBBTQ0KPiANCj4gVGhpcyBpcyBhIGZvbGxvdyB1cCBv
ZiB0aGUgcGF0Y2ggdGhyZWFkLg0KPiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9kZXZp
Y2V0cmVlL21zZzI4MzY3NS5odG1sDQo+IA0KPiBUaGlzIHBhdGNoIHNlcmllcyBpcyBhIHByZXBh
cmF0aW9uIGZvciB0aGUgTVg4IEFyY2hpdGVjdHVyZSBpbXByb3ZlbWVudC4NCj4gQXMgZm9yIElN
WCBTQ1UgYmFzZWQgcGxhdGZvcm1zIGxpa2UgTVg4UU0gYW5kIE1YOFFYUCwgdGhleSBhcmUgY29t
cHJpc2VkDQo+IG9mIGEgY291cGxlIG9mIFNTKFN1YnN5c3RlbXMpIHdoaWxlIG1vc3Qgb2YgdGhl
bSB3aXRoaW4gdGhlIHNhbWUgU1MgY2FuIGJlDQo+IHNoYXJlZC4gZS5nLiBDbG9ja3MsIERldmlj
ZXMgYW5kIGV0Yy4NCj4gDQo+IEhvd2V2ZXIsIGN1cnJlbnQgZGV2aWNlIHRyZWUgaXMgaGVhdmls
eSBkZXBlbmRzIG9uIENsb2NrcyBJRHMgZGVmaW5lZCB3aGljaA0KPiBjYXVzZSBzb21lIHRyb3Vi
bGVzIGluIHdyaXRpbmcgdGhlIGNvbW1vbiA8c29jPi1zcy14eC5kdHNpIGZpbGUuDQo+IA0KPiBU
aGlzIHBhdGNoIHNlcmllcyBhZGRzIGEgbmV3IGJpbmRpbmcgdG8gc3VwcG9ydCBwYXJzaW5nIGNs
b2NrcyBmcm9tIGRldmljZSB0cmVlDQo+IHdoaWNoIGNhbiBmdWxseSBkZWNvdXBsZSB0aGUgZGVw
ZW5kZW5jeSBvZiBDbG9jayBJRHMgaW4gZGV2aWNlIHRyZWUgYW5kIG1ha2UNCj4gdXMgYmUgYWJs
ZSB0byB3cml0ZSBhIGZ1bGx5IGdlbmVyaWMgY2xvY2sgZHJpdmVyIGZvciBTQ1UgYmFzZWQgU29D
cy4NCj4gQW5kIGl0IGNhbiBtYWtlIHRoZSBkcml2ZXIgbXVjaCBlYXNpbHkgdG8gYmUgbWFpbnRh
aW5lZCBpbiB0aGUgZnV0dXJlIGFuZA0KPiBhdm9pZCB3cml0aW5nIGEgbG90IG9mIGR1cGxpY2F0
ZWQgY29kZXMuDQo+IA0KPiBDaGFuZ2VMb2c6DQo+IHYxLT52MjoNCj4gICogU0NVIGNsb2NrIGNo
YW5nZWQgdG8gb25lIGNlbGwgY2xvY2sgYmluZGluZyBpbnNwaXJlZCBieSBhcm0sc2NwaS50eHQN
Cj4gICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hcm0sc2NwaS50eHQN
Cj4gICogQWRkIHJlcXVpcmVkIHBvd2VyIGRvbWFpbiBwcm9wZXJ0eQ0KPiAgKiBEcm9wcGVkIFBB
VENIIDMmNCBmaXJzdCwgd2lsbCBzZW5kIHRoZSB1cGRhdGVkIHZlcnNpb24gYWNjb3JkaW5nbHkN
Cj4gICAgYWZ0ZXIgdGhlIGJpbmRpbmcgaXMgZmluYWxseSBkZXRlcm1pbmVkLA0KPiANCj4gRG9u
ZyBBaXNoZW5nICgyKToNCj4gICBkdC1iaW5kaW5nczogZmlybXdhcmU6IGlteC1zY3U6IG5ldyBi
aW5kaW5nIHRvIHBhcnNlIGNsb2NrcyBmcm9tDQo+ICAgICBkZXZpY2UgdHJlZQ0KPiAgIGR0LWJp
bmRpbmdzOiBjbG9jazogaW14LWxwY2c6IGFkZCBzdXBwb3J0IHRvIHBhcnNlIGNsb2NrcyBmcm9t
IGRldmljZQ0KPiAgICAgdHJlZQ0KPiANCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9m
cmVlc2NhbGUvZnNsLHNjdS50eHQgIHwgNDUNCj4gKysrKysrKysrKysrKysrKysrLS0tLQ0KPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svaW14OHF4cC1scGNnLnR4dCAgICAgfCAzNCAr
KysrKysrKysrKysrLS0tDQo+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Zpcm13YXJlL2lteC9yc3Jj
LmggICAgICAgICAgICB8IDE3ICsrKysrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDgyIGluc2Vy
dGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0NCj4gMi43LjQNCg0K
