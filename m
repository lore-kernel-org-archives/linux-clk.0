Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246A3C56202
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 10:32:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDD3A2417E
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 10:32:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="DwV6nxZ8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgKRKcC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Nov 2020 05:32:02 -0500
Received: from mail-eopbgr70082.outbound.protection.outlook.com ([40.107.7.82]:10050
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725804AbgKRKcC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Nov 2020 05:32:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItM/rCi4PT6bgP/obvwoPN3AHZG+7o0IzhF5YB37cNSpDXwG0vu1sWZ3Aok1ezrS+ymsxeXBmh5yGotx0N2VZ0VqkQqP7kFjOs86wWVXxcXZWz6LJEbXd7FRsgmL2fymY544/EFaQB0RSpFoqq1/2GUbUQVdTaE4sNat4zD1UllLzO3fdyo0iRek6mmd6TdbTD+2ySaMEhciSKCCKvzhxl+bhLxqrZES4fRMEkkF7s/tfjkT93XsQPtI7BgX/Ahc1t68aPqreYltOSiKbfypxhBpwVInSdB/4eEr+IMn5V7CIqyu2mmqRRNdQM65ktgG3asqc5MGp/4cKJHhpJSsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYDq+BwaCd8sEBlnDs/Dwqie3DlVjmNbOBFRx2fVnlQ=;
 b=XKhoZc7otUna/IWFKr1klrhkHBjB6zt61Z3L01LybF0llWw+z+iNX3PVkXQ9oLgyNeuNA1wzdrUF5K8hwoBQC0TWJT+GK0VSTt05zBLv7DIYEns5cgoR7xcu9GtI09pgGGePlCb/HhmXralo0O4yyaxeacCmruh+ds9pvSczixRdE8tZ6LImJs10raBMa/08i8eLs8DtS34dFg3oQKsOMiSkMwFk5BR+MjcPB4IgVY/z2/O4ToamI2OZjnqzbuh9YIt0BubFhe3vv1+O1oMX5v6sJSanGa9M+lXC4hJYMPJ2V0tzmPrQwvRPd5R1f9BEZE7EhPw6VSeEzU3hIZ9NLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYDq+BwaCd8sEBlnDs/Dwqie3DlVjmNbOBFRx2fVnlQ=;
 b=DwV6nxZ8g+CgkaSf6lIoNChnMbjH/OhuRSQqs2qmoVJH/f9GFHRSgWkYuPYfZ1iORvX+/Rz8G7/t56AN0m1R+8v6afjyCxrmDiuc3MivjmgeFDSAsx+QKEYk9VNyn18RCYDYUVs7bP4zivaI4TwYrTJVJYIWAW3xvTEAbVXt1II=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5415.eurprd04.prod.outlook.com (2603:10a6:20b:93::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 10:31:58 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a%3]) with mapi id 15.20.3564.029; Wed, 18 Nov 2020
 10:31:58 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Ying Liu <victor.liu@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: RE: [PATCH 0/5] Add some clocks support for i.MX8qxp DC0/MIPI-LVDS
 subsystems
Thread-Topic: [PATCH 0/5] Add some clocks support for i.MX8qxp DC0/MIPI-LVDS
 subsystems
Thread-Index: AQHWvYYzimpcOFcAO0W76T3fwlxjP6nNsAPg
Date:   Wed, 18 Nov 2020 10:31:57 +0000
Message-ID: <AM6PR04MB496665F6E9AAFB6B56F3E28A80E10@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1605688290-21805-1-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1605688290-21805-1-git-send-email-victor.liu@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c3133196-afa4-463f-a2f2-08d88bad2d67
x-ms-traffictypediagnostic: AM6PR04MB5415:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB54154C9F87942873CF9F261380E10@AM6PR04MB5415.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xf0TmyjdYnZzdbKLGHRv7bZ2myy3Be7qZWO0kGNeuF34pHWMdBMDqU4CACAdxXu2VW7Ky/F+GWikkgMQH+4x6KEmk3be01sfhkpTGlCVDMNOcKvtpls5jNE/QETgA3HX2fgl5YGjA7YcugLgfny7a1F338K+NAXW3k6BGMNuPphZQ3dJip7XCztWDkfNTwQ/vDqbtcDWOtVhFuP91iGvINyusVgqvSBWsn5BBPzCDdgqNNfJp/f2snALlH1GBaRusYKvH6/sZmv6LQ2FJsVZWpp38e+R3ZPHPsoAK2SpR1oOZ3NCScL+GpiIefgo646wvcfA7kYcabsAUTRsGQ4/7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(9686003)(2906002)(110136005)(55016002)(478600001)(26005)(7696005)(6506007)(86362001)(186003)(33656002)(8676002)(44832011)(52536014)(71200400001)(54906003)(7416002)(64756008)(66556008)(4326008)(66476007)(66946007)(66446008)(5660300002)(8936002)(316002)(83380400001)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: YhpPECtWrsXi/LcJvrrLDi66CN2LrAy/8IknUXbDuwg+A6bKn+zsW5KSWJPgvRlL78Xw+kDDb/oK7XUpTmYDcziHcB5DEK9NBJqI7E2Nvhv8wwXkKsnEFJGr/SHbp8yRJ6oDPUy3hnpSNSD/1jVbrns5V0yf3NqaySd2TFeb2WZSOxXq+ZKJb/yy1ZppKykqvGcLL7hIRNvg1Mt4mVpcIjxZsS36n4QoW29Wp4gLfPYaAGdUaVc1vwvubklyst1swFJCN+OTVC7G+1f+e6Hj0b/MLJpzpDGNpdExfGMk8ixvNl+ZpbTQ2SnVm2ztpnpfh7OxlZbknScV1JcXS3mVOCbXGel6R0QjEgzbTmOn1MkupJzgR99lAzs52Gx2ImetyF8F1LLorIsYpqvoVZOmbgKVW8U8uzXlShjoeQCZAGS2MnHtxN6AJvR2c6OubF/MbIFh8CC8zZsQWmLoDcyNg2msTiAR/kj4zbcW8jm49c2eWyVtCVKjccDWs7eYacRftjcM7E5AqflATVab3xUnPMJwyCwBjKhPuJkQ4DJsgZ5JH+Lj1gWzdqiWe0VKNy/i70V9VbS1GMKilXpO0OLTGpgmTwg6pq96fM05PHVCy1u+eNhJU7LmnIS0OjlLDK3T1nNC1jv7QLBF8Ch+AX56Gw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3133196-afa4-463f-a2f2-08d88bad2d67
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2020 10:31:57.9645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E28JlBM7lHYaYuIHSgB86j4evcfdN0DR8yo3M6JjwPNFYgIBj2Onk/szJHouoJQ4fM6zktSNeH0vCqfCxlnJ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5415
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBZaW5nIExpdSA8dmljdG9yLmxpdUBueHAuY29tPg0KPiBTZW50OiBXZWRuZXNkYXks
IE5vdmVtYmVyIDE4LCAyMDIwIDQ6MzEgUE0NCj4gDQo+IFRoaXMgcGF0Y2ggc2V0IGFkZHMgc29t
ZSBjbG9ja3Mgc3VwcG9ydCBmb3IgaS5NWDhxeHAgREMwL01JUEktTFZEUw0KPiBzdWJzeXN0ZW1z
LCB3aGljaCBpbmNsdWRlcyBzb21lIFNDVSBjb250cm9sbGVkIGNsb2NrcyBhbmQgc29tZSBMUENH
IGNsb2Nrcy4NCj4gDQo+IFdpdGggdGhpcyBwYXRjaCBzZXQsIHNvbWUgYmFzaWMgY2xvY2tzIGZv
ciBpLk1YOHF4cCBMVkRTIGRpc3BsYXlzIGNhbiBiZSBnb3QgYnkNCj4gZHJpdmVycy4NCj4gDQo+
IFRoaXMgcGF0Y2ggc2V0IGZvbGxvd3MgdGhlIGxlZ2FjeS9kZXByZWNhdGVkIHdheSB0byBhZGQg
dGhlIGNsb2NrcyBzdXBwb3J0IGluDQo+IGNsb2NrIGRyaXZlcnMgaW5zdGVhZCBvZiB0aGUgbmV3
ICd0d28gY2VsbHMnIGR0LWJpbmRpbmcgd2F5LiAgVGhlIHJlYXNvbiBiZWhpbmQNCj4gdGhpcyBp
cyB0aGF0IHRoZSBleGlzdGluZyBpLk1YOHF4cCBTb0MgZGV2aWNlIHRyZWUgaXMgdXNpbmcgdGhl
IGxlZ2FjeSB3YXkobm8NCj4gY29udmVyc2lvbiBlZmZvcnQgaXMgc2VlbikgYW5kIHRoZXJlIGlz
IG5vdCBpLk1YOHFtKHdpdGggYSBzaW1pbGFyDQo+IGFyY2hpdGVjdHVyZSkgU29DIGRldmljZSB0
cmVlIGZvciB1cyB0byBlbmFibGUgZGlzcGxheSB5ZXQuDQoNCkhpIFlpbmcsDQoNClBsZWFzZSBk
b24ndCBkbyB0aGlzLg0KWW91IGtub3cgdGhlIGxlZ2FjeSBjbG9jayBiaW5kaW5nIHdpbGwgYmUg
cmVtb3ZlZCBhbmQgbm90IHVzZWQgYW55bW9yZS4NCg0KUmVnYXJkcw0KQWlzaGVuZw0KDQo+IA0K
PiBMaXUgWWluZyAoNSk6DQo+ICAgY2xrOiBpbXg6IGNsay1pbXg4cXhwOiBBZGQgU0NVIGNsb2Nr
cyBzdXBwb3J0IGZvciBEQzAgUExMIGNsb2Nrcw0KPiAgIGNsazogaW14OiBjbGstaW14OHF4cC1s
cGNnOiBBZGQgZGlzcGxheSBjb250cm9sbGVyIExQQ0cgY2xvY2tzIHN1cHBvcnQNCj4gICBjbGs6
IGlteDogY2xrLWlteDhxeHA6IEFkZCBzb21lIFNDVSBjbG9ja3Mgc3VwcG9ydCBmb3IgTUlQSS1M
VkRTDQo+ICAgICBzdWJzeXN0ZW1zDQo+ICAgZHQtYmluZGluZ3M6IGNsb2NrOiBpbXg4cXhwLWxw
Y2c6IEFkZCBjb21wYXRpYmxlcyBmb3IgTUlQSS1MVkRTDQo+ICAgICBzdWJzeXN0ZW1zDQo+ICAg
Y2xrOiBpbXg6IGNsay1pbXg4cXhwLWxwY2c6IEFkZCBzb21lIExQQ0cgY2xvY2tzIHN1cHBvcnQg
Zm9yIE1JUEktTFZEUw0KPiAgICAgc3Vic3lzdGVtcw0KPiANCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Nsb2NrL2lteDhxeHAtbHBjZy55YW1sICAgIHwgIDIgKw0KPiAgZHJpdmVycy9jbGsv
aW14L2Nsay1pbXg4cXhwLWxwY2cuYyAgICAgICAgICAgICAgICAgfCA3OQ0KPiArKysrKysrKysr
KysrKysrKysrKysrDQo+ICBkcml2ZXJzL2Nsay9pbXgvY2xrLWlteDhxeHAtbHBjZy5oICAgICAg
ICAgICAgICAgICB8IDI5ICsrKysrKysrDQo+ICBkcml2ZXJzL2Nsay9pbXgvY2xrLWlteDhxeHAu
YyAgICAgICAgICAgICAgICAgICAgICB8IDEyICsrKysNCj4gIGluY2x1ZGUvZHQtYmluZGluZ3Mv
Y2xvY2svaW14OC1jbG9jay5oICAgICAgICAgICAgIHwgNjENCj4gKysrKysrKysrKysrKysrKysN
Cj4gIDUgZmlsZXMgY2hhbmdlZCwgMTgzIGluc2VydGlvbnMoKykNCj4gDQo+IC0tDQo+IDIuNy40
DQoNCg==
