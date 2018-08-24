Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-eopbgr70042.outbound.protection.outlook.com ([40.107.7.42]:35339
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726243AbeHXN0Z (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 24 Aug 2018 09:26:25 -0400
From: "A.s. Dong" <aisheng.dong@nxp.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Rob Herring <robh@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Dong Aisheng <dongas86@gmail.com>,
        ", Sascha Hauer" <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: RE: [PATCH V5 1/5] dt-bindings: arm: fsl: add scu binding doc
Date: Fri, 24 Aug 2018 09:51:47 +0000
Message-ID: <AM0PR04MB4211D1CB3DE05AF148E94AAD80360@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1534781305-4770-1-git-send-email-aisheng.dong@nxp.com>
 <1534781305-4770-2-git-send-email-aisheng.dong@nxp.com>
 <20180820181155.GA13901@bogus>
 <AM0PR04MB4211B9113831B292110C709280310@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <CABb+yY1+J+=nV2gNN30KLr2YQDy_g81-dJS1DJq8NgUv7Qqcog@mail.gmail.com>
In-Reply-To: <CABb+yY1+J+=nV2gNN30KLr2YQDy_g81-dJS1DJq8NgUv7Qqcog@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYXNzaSBCcmFyIFttYWlsdG86
amFzc2lzaW5naGJyYXJAZ21haWwuY29tXQ0KPiBPbiBUdWUsIEF1ZyAyMSwgMjAxOCBhdCA4OjMw
IEFNIEEucy4gRG9uZyA8YWlzaGVuZy5kb25nQG54cC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gPiA+
ICsNCj4gPiA+ID4gK1RoZSBTeXN0ZW0gQ29udHJvbGxlciBGaXJtd2FyZSAoU0NGVykgaXMgYSBs
b3ctbGV2ZWwgc3lzdGVtDQo+ID4gPiA+ICtmdW5jdGlvbiB3aGljaCBydW5zIG9uIGEgZGVkaWNh
dGVkIENvcnRleC1NIGNvcmUgdG8gcHJvdmlkZQ0KPiA+ID4gPiArcG93ZXIsIGNsb2NrLCBhbmQg
cmVzb3VyY2UgbWFuYWdlbWVudC4gSXQgZXhpc3RzIG9uIHNvbWUgaS5NWDgNCj4gPiA+ID4gK3By
b2Nlc3NvcnMuIGUuZy4gaS5NWDhRTSAoUU0sIFFQKSwgYW5kIGkuTVg4UVggKFFYUCwgRFgpLg0K
PiA+ID4gPiArDQo+ID4gPiA+ICtUaGUgQVAgY29tbXVuaWNhdGVzIHdpdGggdGhlIFNDIHVzaW5n
IGEgbXVsdGktcG9ydGVkIE1VIG1vZHVsZQ0KPiA+ID4gPiArZm91bmQgaW4gdGhlIExTSU8gc3Vi
c3lzdGVtLiBUaGUgY3VycmVudCBkZWZpbml0aW9uIG9mIHRoaXMgTVUNCj4gPiA+ID4gK21vZHVs
ZSBwcm92aWRlcw0KPiA+ID4gPiArNSByZW1vdGUgQVAgY29ubmVjdGlvbnMgdG8gdGhlIFNDIHRv
IHN1cHBvcnQgdXAgdG8gNSBleGVjdXRpb24NCj4gPiA+ID4gK2Vudmlyb25tZW50cyAoVFosIEhW
LCBzdGFuZGFyZCBMaW51eCwgZXRjLikuIFRoZSBTQyBzaWRlIG9mIHRoaXMNCj4gPiA+ID4gK01V
IG1vZHVsZSBpbnRlcmZhY2VzIHdpdGggdGhlIExTSU8gRFNDIElQIGJ1cy4gVGhlIFNDIGZpcm13
YXJlDQo+ID4gPiA+ICt3aWxsIGNvbW11bmljYXRlIHdpdGggdGhpcyBNVSB1c2luZyB0aGUgTVNJ
IGJ1cy4NCj4gPiA+DQo+ID4gPiBIb3cgYXJlIDUgdXNlcnMgc3VwcG9ydGVkIHdpdGggb25seSA0
IGNoYW5uZWxzIGRlZmluZWQgYmVsb3c/DQo+ID4NCj4gPiBUaGVyZSdyZSA1IE1VIGluc3RhbmNl
cyBkZXNpZ25lZCB0byBiZSBzcGVjaWZpY2FsbHkgY29tbXVuaWNhdGUgd2l0aA0KPiA+IFNDVSBG
aXJtd2FyZSBvbiBNWDggaGFyZHdhcmUuDQo+ID4NCj4gVGhpcyBpcyBjb3JyZWN0Lg0KPiANCj4g
PiBXaXRoIHRoZSBuZXcgZ2VuZXJpYyBtdSBiaW5kaW5nIFsxXSwgZWFjaCBNVSBpbnN0YW5jZSBp
cyBhYnN0cmFjdGVkDQo+ID4gSW50byAxNiB2aXJ0dWFsIE1VIGNoYW5uZWxzLiAoNCBUeCwgNCBS
eCwgNCBUeCBkb29yYmVsbCwgNCBSeCBkb29yYmVsbCkuDQo+ID4gKE1VIGhhcyA0IHBhaXIgb2Yg
VHgvUnggZGF0YSByZWdpc3RlciB3aGljaCBjYW4gYmUgdXNlZCB0bw0KPiA+IHNlbmQvcmVjZWl2
ZSBtdWx0aSB3b3Jkcy4gV2l0aCBuZXcgYmluZGluZywgZWFjaCBkYXRhIHJlZ2lzdGVyIGlzDQo+
ID4gYWJzdHJhY3RlZCBpbnRvIG9uZSBNVSBjaGFubmVsLCB0b3RhbGx5IDggY2hhbm5lbHMgZm9y
IGRhdGEgdHJhbnNmZXIpLg0KPiA+DQo+ID4gU0NVIHByb3RvY29sIGlzIGFscmVhZHkgZGVzaWdu
ZWQgdG8gdXNlcyBhbGwgZGF0YSByZWdpc3RlcnMgdG8NCj4gPiBzZW5kL3JlY2VpdmUgbXVsdGkg
d29yZHMgYWNjb3JkaW5nIHRvIE1VIGhhcmR3YXJlIHJlZmVyZW5jZSBtYW51YWwuIFNvDQo+ID4g
aXQgbXVzdCB1c2UgYWxsIGNoYW5uZWxzIGluIG9uZSBNVSBpbnN0YW5jZXMgd2l0aCBuZXcgYmlu
ZGluZy4NCj4gPg0KPiBGWUksIHRoaXMgaXMgaW5jb3JyZWN0Lg0KPiBUaGUgMTYgY2hhbm5lbHMg
YXJlIHBoeXNpY2FsIGFuZCBub3QgdmlydHVhbC4gSW4gZmFjdCwgYWxsIHRoaXMgaXMgdG8gYXZv
aWQgdmlydHVhbA0KPiBjaGFubmVscy4NCj4gVGhlIHBoeXNpY2FsIHJlc291cmNlcyByZXF1aXJl
ZCBieSBuZXcgYmluZGluZ3MgYXJlIGV4YWN0bHkgdGhlIHNhbWUgYXMgYnkgb2xkDQo+IGJpbmRp
bmdzLiBOb3cgeW91IHVzZSA4IHBoeXNpY2FsIGNoYW5uZWxzIGluc3RlYWQgb2YgMSB2aXJ0dWFs
Lg0KDQpPa2F5LCBnb3QgaXQuDQpJJ20gZmluZSB0byByZWZlciB0byB0aGVtIGFsbCBhcyBwaHlz
aWNhbCBjaGFubmVscy4NClRoYW5rcw0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcNCg==
