Return-Path: <SRS0=w22C=WP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA21CC3A5A0
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 12:36:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F1E620843
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 12:36:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="AacVxzDc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727172AbfHSMgl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Aug 2019 08:36:41 -0400
Received: from mail-eopbgr40073.outbound.protection.outlook.com ([40.107.4.73]:28545
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726852AbfHSMgl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Aug 2019 08:36:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzFQ5Pb2nOQHPMWeknqsLhr5Yo2NppRJDOXTZ/DAh7hlzntywacdL6elLKeHyO4ysJzTIHKoLRrYZVd2p00l7IqXrEI2W1wHLJZsQxexjlolQBAM9waQEHiJC5mGaA7jSw11GNRNocAwOFrD/3Qu9TxknmRgYhWNVF3u4Vgqxj0B+zyQUnPHXcCe0FKeWXmruXPjahXxV33KqqvRrVxRxjSPlnVDaRgSP3zcHj+BJvxvYGnbord5btwOlXyHUtbinWTRN32v5qv66mH5/ptsl+I36yXiz94h3I+Z2IEzPDFqYWWI+7M9WKq98e1m7qhys4UL+lEeFbRzeC0dDaO5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cz7RX9V2sBdhCfDyY5gs57smM8zshXCi+OyC0efeQsY=;
 b=oe/v/6POHDp3TUzV6zbKOVy/bTjspxP6c83oVsOAOTsjBYmlO8c/yxnDaSNSAL7ipxDf6sabr6Y/zqzHDOVKtUHYkvHovmQ+GR7j0Nzmw+APmyrbdfOkZfCojIPqj71PagpthDnJEAWWoOrnbEt2BlZJD0wpmrOs5zKGXBSNKBL72MCJKlLQJiknMAV4LFJGHoy9NvaOHg/ESpxz9Q5Tu3W8E+HFgBVLPvYodQyCfE0vvEdKG2DiVN5JyoeVOnsOgoD5cDpEl+jze7nmhFwQfTHzdEQojhNkTamwvtbmQ6w/ijvfQvoFmiiwYZLwgzyKtzJGkYLfAvE4xyGkzIQXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cz7RX9V2sBdhCfDyY5gs57smM8zshXCi+OyC0efeQsY=;
 b=AacVxzDcCl4Jz0Vo+aLwIsCU5fJASxlzRyaZVZDTx8FSspEMKJ32HSje7yW0EiMI/71ohwPjuyEhY9asRg0d5/dedTC9lDWqMzWuAubdTdDMXEn3NZUmfgO5mQjwuTcDccJzCm4BiQduPVgeshOMDZUNFP1ywD7986pyYCTn3XU=
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com (52.133.13.160) by
 VI1PR04MB6142.eurprd04.prod.outlook.com (20.179.27.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 12:36:36 +0000
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c]) by VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c%7]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 12:36:36 +0000
From:   Daniel Baluta <daniel.baluta@nxp.com>
To:     "dongas86@gmail.com" <dongas86@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v3 01/11] dt-bindings: firmware: imx-scu: new binding to
 parse clocks from device tree
Thread-Topic: [PATCH v3 01/11] dt-bindings: firmware: imx-scu: new binding to
 parse clocks from device tree
Thread-Index: AQHVO+pjpMhm5od2jUWUpLbDWVCffqbpm56AgAJt1oCAFpQwgA==
Date:   Mon, 19 Aug 2019 12:36:36 +0000
Message-ID: <caab750569dc246c99e88bbe6d9ca137ae7f198f.camel@nxp.com>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
         <1563289265-10977-2-git-send-email-aisheng.dong@nxp.com>
         <20190803144246.GM8870@X250.getinternet.no>
         <CAA+hA=Sm0MAHNwH1sZQfK8cO+3jLkue97u=ceFiUv34+qGos1Q@mail.gmail.com>
In-Reply-To: <CAA+hA=Sm0MAHNwH1sZQfK8cO+3jLkue97u=ceFiUv34+qGos1Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a60cf5c-7366-49c4-23e8-08d724a1e02c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB6142;
x-ms-traffictypediagnostic: VI1PR04MB6142:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB61420C36210341CA3BE7AE73F9A80@VI1PR04MB6142.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(54534003)(199004)(189003)(53546011)(6506007)(66446008)(64756008)(8676002)(91956017)(76116006)(102836004)(66556008)(25786009)(66476007)(81166006)(8936002)(186003)(6486002)(99286004)(26005)(118296001)(4326008)(53936002)(476003)(2616005)(81156014)(66946007)(316002)(11346002)(446003)(54906003)(486006)(44832011)(3846002)(110136005)(6246003)(6116002)(14444005)(71200400001)(36756003)(6436002)(50226002)(229853002)(76176011)(5660300002)(305945005)(2906002)(478600001)(2501003)(71190400001)(6512007)(86362001)(14454004)(66066001)(7736002)(256004)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6142;H:VI1PR04MB4094.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oYXytbRuxbTVRjB5A+IzUgc8hBhqo6Uax04MTYYiI5JbMt5/KG266/S7uTH8hlcFJuKijHGrYSObzipEdEkb390BGzx2lWOuNsZm5fowrNjJyEU729FHMes5ZxPhRYiArplwjHTWaxW5o3TkPY5bI0o5sAHVSAMW9E3lIeorDEZsVE1JoV2Oiv8UIrHTWqbGbKRXMuaH8KwJ72v6Hnyg0eoCev/J4IP4VmEan5iss1FFbRbEBsU7u9bPdXd6SWG1H6nJmLGp/1k7VSN+Wc0iXea4GDpCjeRI3dlgRc2kwgpUheG3xR1vcNLCwV5XLZPwW4j9DVB+nHfbWdenwt5/CB106ilCe2nbU8LQDyUgtpr80urY09WQKOL3L+0omFcslVzReacHlCp+1PemF4E1U1HTTXLcOBdDWmCKnYv30cE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00FD0AD8D6909240B0D78742C00FF69A@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a60cf5c-7366-49c4-23e8-08d724a1e02c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 12:36:36.4358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wmn1VLLqzAcx4/dI+FPikS6d9C61tfp7+nRTzA2WEFPjiZc789fZvBGplvvJCJmbHhWb6AWKd4Y0A20UcO+avw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6142
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gTW9uLCAyMDE5LTA4LTA1IGF0IDExOjQ4ICswODAwLCBEb25nIEFpc2hlbmcgd3JvdGU6DQo+
IE9uIFN1biwgQXVnIDQsIDIwMTkgYXQgMTE6NDkgQU0gU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJu
ZWwub3JnPg0KPiB3cm90ZToNCj4gPiANCj4gPiBPbiBUdWUsIEp1bCAxNiwgMjAxOSBhdCAxMTow
MDo1NVBNICswODAwLCBEb25nIEFpc2hlbmcgd3JvdGU6DQo+ID4gPiBUaGVyZSdzIGEgZmV3IGxp
bWl0YXRpb25zIG9uIHRoZSBvcmlnaW5hbCBvbmUgY2VsbCBjbG9jayBiaW5kaW5nDQo+ID4gPiAo
I2Nsb2NrLWNlbGxzID0gPDE+KSB0aGF0IHdlIGhhdmUgdG8gZGVmaW5lIHNvbWUgU1cgY2xvY2sg
SURzIGZvcg0KPiA+ID4gZGV2aWNlDQo+ID4gPiB0cmVlIHRvIHJlZmVyZW5jZS4gVGhpcyBtYXkg
Y2F1c2UgdHJvdWJsZXMgaWYgd2Ugd2FudCB0byB1c2UNCj4gPiA+IGNvbW1vbg0KPiA+ID4gY2xv
Y2sgSURzIGZvciBtdWx0aSBwbGF0Zm9ybXMgc3VwcG9ydCB3aGVuIHRoZSBjbG9jayBvZiB0aG9z
ZQ0KPiA+ID4gcGxhdGZvcm1zDQo+ID4gPiBhcmUgbW9zdGx5IHRoZSBzYW1lLg0KPiA+ID4gZS5n
LiBDdXJyZW50IGNsb2NrIElEcyBuYW1lIGFyZSBkZWZpbmVkIHdpdGggU1MgcHJlZml4Lg0KPiA+
ID4gDQo+ID4gPiBIb3dldmVyIHRoZSBkZXZpY2UgbWF5IHJlc2lkZSBpbiBkaWZmZXJlbnQgU1Mg
YWNyb3NzIENQVXMsIHRoYXQNCj4gPiA+IG1lYW5zIHRoZQ0KPiA+ID4gU1MgcHJlZml4IG1heSBu
b3QgdmFsaWQgYW55bW9yZSBmb3IgYSBuZXcgU29DLiBGdXJ0aGVybW9yZSwgdGhlDQo+ID4gPiBk
ZXZpY2UNCj4gPiA+IGF2YWlsYWJpbGl0eSBvZiB0aG9zZSBjbG9ja3MgbWF5IGFsc28gdmFyeSBh
IGJpdC4NCj4gPiA+IA0KPiA+ID4gRm9yIHN1Y2ggc2l0dWF0aW9uLCB3ZSB3YW50IHRvIGVsaW1p
bmF0ZSB0aGUgdXNpbmcgb2YgU1cgQ2xvY2sNCj4gPiA+IElEcyBhbmQNCj4gPiA+IGNoYW5nZSB0
byB1c2UgYSBtb3JlIGNsb3NlIHRvIEhXIG9uZSBpbnN0ZWFkLg0KPiA+ID4gRm9yIFNDVSBjbG9j
a3MgdXNhZ2UsIG9ubHkgdHdvIHBhcmFtcyByZXF1aXJlZDogUmVzb3VyY2UgaWQgKw0KPiA+ID4g
Q2xvY2sgVHlwZS4NCj4gPiANCj4gPiBJZiB0aGlzIGlzIGhvdyBTQ1UgZmlybXdhcmUgYWRkcmVz
c2VzIHRoZSBjbG9jaywgSSBhZ3JlZSB0aGF0IGl0J3MNCj4gPiB3b3J0aA0KPiA+IHdpdGNoaW5n
IHRvIHRoaXMgbmV3IGJpbmRpbmdzLCB3aGljaCBkZXNjcmliZXMgdGhlIGhhcmR3YXJlIChTQ1UN
Cj4gPiBmaXJtd2FyZSBpbiB0aGlzIGNhc2UpIGJldHRlciwgSU1PLg0KPiA+IA0KPiA+ID4gQm90
aCBwYXJhbWV0ZXJzIGFyZSBwbGF0Zm9ybSBpbmRlcGVuZGVudC4gU28gd2UgY291bGQgdXNlIHR3
bw0KPiA+ID4gY2VsbHMgYmluZGluZw0KPiA+ID4gdG8gcGFzcyB0aG9zZSBwYXJhbWV0ZXJzLA0K
PiA+ID4gDQo+ID4gPiBDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4NCj4gPiA+
IENjOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+ID4gPiBDYzogU2hhd24gR3Vv
IDxzaGF3bmd1b0BrZXJuZWwub3JnPg0KPiA+ID4gQ2M6IFNhc2NoYSBIYXVlciA8a2VybmVsQHBl
bmd1dHJvbml4LmRlPg0KPiA+ID4gQ2M6IE1pY2hhZWwgVHVycXVldHRlIDxtdHVycXVldHRlQGJh
eWxpYnJlLmNvbT4NCj4gPiA+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCj4gPiA+
IC0tLQ0KPiA+ID4gQ2hhbmdlTG9nOg0KPiA+ID4gdjItPnYzOg0KPiA+ID4gICogQ2hhbmdlZCB0
byB0d28gY2VsbHMgYmluZGluZyBhbmQgcmVnaXN0ZXIgYWxsIGNsb2NrcyBpbiBkcml2ZXINCj4g
PiA+ICAgIGluc3RlYWQgb2YgcGFyc2UgZnJvbSBkZXZpY2UgdHJlZS4NCj4gPiA+IHYxLT52MjoN
Cj4gPiA+ICAqIGNoYW5nZWQgdG8gb25lIGNlbGwgYmluZGluZyBpbnNwaXJlZCBieSBhcm0sc2Nw
aS50eHQNCj4gPiA+ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJt
LHNjcGkudHh0DQo+ID4gPiAgICBSZXNvdXJjZSBJRCBpcyBlbmNvZGVkIGluICdyZWcnIHByb3Bl
cnR5Lg0KPiA+ID4gICAgQ2xvY2sgdHlwZSBpcyBlbmNvZGVkIGluIGdlbmVyaWMgY2xvY2staW5k
aWNlcyBwcm9wZXJ0eS4NCj4gPiA+ICAgIFRoZW4gd2UgZG9uJ3QgaGF2ZSB0byBzZWFyY2ggYWxs
IHRoZSBEVCBub2RlcyB0byBmZXRjaA0KPiA+ID4gICAgdGhvc2UgdHdvIHZhbHVlIHRvIGNvbnN0
cnVjdCBjbG9ja3Mgd2hpY2ggaXMgcmVsYXRpdmVseQ0KPiA+ID4gICAgbG93IGVmZmljaWVuY3ku
DQo+ID4gPiAgKiBBZGQgcmVxdWlyZWQgcG93ZXItZG9tYWluIHByb3BlcnR5IGFzIHdlbGwuDQo+
ID4gPiAtLS0NCj4gPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2Zz
bCxzY3UudHh0ICAgICAgIHwgMTINCj4gPiA+ICsrKysrKystLS0tLQ0KPiA+ID4gIGluY2x1ZGUv
ZHQtYmluZGluZ3MvZmlybXdhcmUvaW14L3JzcmMuaCAgICAgICAgICAgICAgICAgfCAxNw0KPiA+
ID4gKysrKysrKysrKysrKysrKysNCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQNCj4gPiA+IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHNjdS50
eHQNCj4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2Nh
bGUvZnNsLHNjdS50eHQNCj4gPiA+IGluZGV4IDVkN2RiYWIuLjM1MWQzMzUgMTAwNjQ0DQo+ID4g
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9m
c2wsc2N1LnR4dA0KPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQNCj4gPiA+IEBAIC04OSw3ICs4OSwxMCBAQCBSZXF1
aXJlZCBwcm9wZXJ0aWVzOg0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgImZzbCxpbXg4
cW0tY2xvY2siDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAiZnNsLGlteDhxeHAtY2xv
Y2siDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgZm9sbG93ZWQgYnkgImZzbCxzY3UtY2xr
Ig0KPiA+ID4gLS0gI2Nsb2NrLWNlbGxzOiAgICAgICAgICAgICAgU2hvdWxkIGJlIDEuIENvbnRh
aW5zIHRoZSBDbG9jayBJRA0KPiA+ID4gdmFsdWUuDQo+ID4gPiArLSAjY2xvY2stY2VsbHM6ICAg
ICAgICAgICAgICBTaG91bGQgYmUgZWl0aGVyDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
MjogQ29udGFpbnMgdGhlIFJlc291cmNlIGFuZCBDbG9jayBJRA0KPiA+ID4gdmFsdWUuDQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgb3INCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAx
OiBDb250YWlucyB0aGUgQ2xvY2sgSUQgdmFsdWUuDQo+ID4gPiAoREVQUkVDQVRFRCkNCj4gPiA+
ICAtIGNsb2NrczogICAgICAgICAgICBMaXN0IG9mIGNsb2NrIHNwZWNpZmllcnMsIG11c3QgY29u
dGFpbiBhbg0KPiA+ID4gZW50cnkgZm9yDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgZWFj
aCByZXF1aXJlZCBlbnRyeSBpbiBjbG9jay1uYW1lcw0KPiA+ID4gIC0gY2xvY2stbmFtZXM6ICAg
ICAgICAgICAgICAgU2hvdWxkIGluY2x1ZGUgZW50cmllcw0KPiA+ID4gInh0YWxfMzJLSHoiLCAi
eHRhbF8yNE1IeiINCj4gPiA+IEBAIC0xNjIsNyArMTY1LDcgQEAgZmlybXdhcmUgew0KPiA+ID4g
DQo+ID4gPiAgICAgICAgICAgICAgIGNsazogY2xrIHsNCj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLWNsayIsICJmc2wsc2N1LQ0KPiA+ID4gY2xr
IjsNCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47DQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDI+Ow0KPiA+ID4gICAgICAg
ICAgICAgICB9Ow0KPiA+ID4gDQo+ID4gPiAgICAgICAgICAgICAgIGlvbXV4YyB7DQo+ID4gPiBA
QCAtMTkyLDggKzE5NSw3IEBAIHNlcmlhbEA1YTA2MDAwMCB7DQo+ID4gPiAgICAgICAuLi4NCj4g
PiA+ICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4gPiAgICAgICBwaW5jdHJs
LTAgPSA8JnBpbmN0cmxfbHB1YXJ0MD47DQo+ID4gPiAtICAgICBjbG9ja3MgPSA8JmNsayBJTVg4
UVhQX1VBUlQwX0NMSz4sDQo+ID4gPiAtICAgICAgICAgICAgICA8JmNsayBJTVg4UVhQX1VBUlQw
X0lQR19DTEs+Ow0KPiA+ID4gLSAgICAgY2xvY2stbmFtZXMgPSAicGVyIiwgImlwZyI7DQo+ID4g
PiArICAgICBjbG9ja3MgPSA8JnVhcnQwX2NsayBJTVhfU0NfUl9VQVJUXzAgSU1YX1NDX1BNX0NM
S19QRVI+Ow0KPiA+ID4gKyAgICAgY2xvY2stbmFtZXMgPSAiaXBnIjsNCj4gPiA+ICAgICAgIHBv
d2VyLWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX1VBUlRfMD47DQo+ID4gPiAgfTsNCj4gPiA+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Zpcm13YXJlL2lteC9yc3JjLmgNCj4gPiA+
IGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9maXJtd2FyZS9pbXgvcnNyYy5oDQo+ID4gPiBpbmRleCA0
ZTYxZjY0Li5mYmVhY2E3IDEwMDY0NA0KPiA+ID4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9m
aXJtd2FyZS9pbXgvcnNyYy5oDQo+ID4gPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Zpcm13
YXJlL2lteC9yc3JjLmgNCj4gPiA+IEBAIC01NDcsNCArNTQ3LDIxIEBADQo+ID4gPiAgI2RlZmlu
ZSBJTVhfU0NfUl9BVFRFU1RBVElPTiAgICAgICAgIDU0NQ0KPiA+ID4gICNkZWZpbmUgSU1YX1ND
X1JfTEFTVCAgICAgICAgICAgICAgICAgICAgICAgIDU0Ng0KPiA+ID4gDQo+ID4gPiArLyoNCj4g
PiA+ICsgKiBEZWZpbmVzIGZvciBTQyBQTSBDTEsNCj4gPiA+ICsgKi8NCj4gPiA+ICsjZGVmaW5l
IElNWF9TQ19QTV9DTEtfU0xWX0JVUyAgICAgICAgICAgICAgICAwICAgICAgIC8qIFNsYXZlDQo+
ID4gPiBidXMgY2xvY2sgKi8NCj4gPiA+ICsjZGVmaW5lIElNWF9TQ19QTV9DTEtfTVNUX0JVUyAg
ICAgICAgICAgICAgICAxICAgICAgIC8qIE1hc3Rlcg0KPiA+ID4gYnVzIGNsb2NrICovDQo+ID4g
PiArI2RlZmluZSBJTVhfU0NfUE1fQ0xLX1BFUiAgICAgICAgICAgIDIgICAgICAgLyogUGVyaXBo
ZXJhbCBjbG9jaw0KPiA+ID4gKi8NCj4gPiA+ICsjZGVmaW5lIElNWF9TQ19QTV9DTEtfUEhZICAg
ICAgICAgICAgMyAgICAgICAvKiBQaHkgY2xvY2sgKi8NCj4gPiA+ICsjZGVmaW5lIElNWF9TQ19Q
TV9DTEtfTUlTQyAgICAgICAgICAgNCAgICAgICAvKiBNaXNjIGNsb2NrICovDQo+IA0KPiBUaGlz
IGlzIGZvciB0eXBpY2FsIGRldmljZSByZXNvdXJjZS4NCj4gDQo+ID4gPiArI2RlZmluZSBJTVhf
U0NfUE1fQ0xLX01JU0MwICAgICAgICAgIDAgICAgICAgLyogTWlzYyAwIGNsb2NrICovDQo+ID4g
PiArI2RlZmluZSBJTVhfU0NfUE1fQ0xLX01JU0MxICAgICAgICAgIDEgICAgICAgLyogTWlzYyAx
IGNsb2NrICovDQo+ID4gPiArI2RlZmluZSBJTVhfU0NfUE1fQ0xLX01JU0MyICAgICAgICAgIDIg
ICAgICAgLyogTWlzYyAyIGNsb2NrICovDQo+ID4gPiArI2RlZmluZSBJTVhfU0NfUE1fQ0xLX01J
U0MzICAgICAgICAgIDMgICAgICAgLyogTWlzYyAzIGNsb2NrICovDQo+ID4gPiArI2RlZmluZSBJ
TVhfU0NfUE1fQ0xLX01JU0M0ICAgICAgICAgIDQgICAgICAgLyogTWlzYyA0IGNsb2NrICovDQo+
IA0KPiBUaGlzIGlzIGZvciBzb21lIHNwZWNpYWwgY2xvY2sgdHlwZXMgd2hpY2ggZG8gbm90IGJl
bG9uZyB0byBhYm92ZQ0KPiBub3JtYWwgY2xvY2sgdHlwZXMuDQo+IFVzZWQgdmVyeSByYXJlIGlu
IFNDVSBmaXJtd2FyZS4NCj4gZS5nLg0KPiBlbmV0MF9tYWMwX3J4Y2xrIFNDX1JfRU5FIFRfMCAv
IFNDX1BNX0NMIEtfTUlTQzANCj4gDQo+ID4gPiArI2RlZmluZSBJTVhfU0NfUE1fQ0xLX0NQVSAg
ICAgICAgICAgIDIgICAgICAgLyogQ1BVIGNsb2NrICovDQo+ID4gPiArI2RlZmluZSBJTVhfU0Nf
UE1fQ0xLX1BMTCAgICAgICAgICAgIDQgICAgICAgLyogUExMICovDQo+ID4gPiArI2RlZmluZSBJ
TVhfU0NfUE1fQ0xLX0JZUEFTUyAgICAgICAgIDQgICAgICAgLyogQnlwYXNzIGNsb2NrICovDQo+
IA0KPiBUaGV5J3JlIGZvciBzcGVjaWZpYyBjbG9jayB0eXBlcyBmb3IgQ1BVL1BMTC9CWVBBU1Mg
b25seS4NCg0KSGkgQWlzaGVuZywNCg0KWWVzLCBwbGVhc2Ugc2VwYXJhdGUgdGhpcyB0eXBlcyBv
ZiBjbG9ja3MgaW4gdGhlaXIgb3duIHNlY3Rpb25zIHdpdGgNCnByb3BlciBkZXNjcmlwdGlvbi4N
Cg0KPiANCj4gPiANCj4gPiBJdCBzZWVtcyB0aGF0IHRoZXJlIGFyZSBzZXZlcmFsIHNldHMgb2Yg
Y2xvY2sgdHlwZSB3aGljaCBhcHBseSB0bw0KPiA+IGRpZmZlcmVudCByZXNvdXJjZXMvZGV2aWNl
cz8gIElmIHNvLCBjYW4geW91IHNlcGFyYXRlIHRoZW0gYSBiaXQNCj4gPiB3aXRoDQo+ID4gc29t
ZSBjb21tZW50cyB0byBtYWtlIHRoZSBsaXN0IGVhc2llciBmb3IgcmVhZGVycz8NCj4gPiANCj4g
DQo+IA0KU28sIHBsZWFzZSBzZW5kIHY0IHdpdGggYWxsIGNvbW1lbnRzIGZpeGVkLiBJIGNhbiBo
ZWxwIHdpdGggdGVzdGluZy4NCkkgYW0gYWxzbyBpbnRyZXN0ZWQgaW4gc2VlaW5nIHRoaXMgZ2V0
IGluIQ0KDQp0aGFua3MsDQpEYW5pZWwuDQo=
