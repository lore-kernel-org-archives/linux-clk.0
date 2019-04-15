Return-Path: <SRS0=I40h=SR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6405C10F0E
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 14:37:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80D0D2075B
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 14:37:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="G5yz4zcR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbfDOOhj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Apr 2019 10:37:39 -0400
Received: from mail-eopbgr140044.outbound.protection.outlook.com ([40.107.14.44]:30438
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726094AbfDOOhj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 15 Apr 2019 10:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jn0ddURuP9S3Jp1RKHYOG3eYTBy+QOfVj6jXDwUc2jk=;
 b=G5yz4zcRtc11FL90g27MsQe4Sv+yRb7qAfsQ3yRaCApVlqikM8Q35LMGsrZy7FztwJrdvMze+Bubt0/9sDaUITAppWa/KsidJhc6XEdoIiqxuXo1OXm9IJbQOCcn6eYjBOYz2efL9RFL/6K4WUcKtQvFRw/wbjp6r6BycTVZ/io=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB5219.eurprd04.prod.outlook.com (20.177.42.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.18; Mon, 15 Apr 2019 14:37:34 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cda:4e52:8e87:8f0e]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cda:4e52:8e87:8f0e%2]) with mapi id 15.20.1792.018; Mon, 15 Apr 2019
 14:37:34 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: firmware: imx-scu: new binding to parse
 clocks from device tree
Thread-Topic: [PATCH 1/4] dt-bindings: firmware: imx-scu: new binding to parse
 clocks from device tree
Thread-Index: AdTzlZg/sk/rCKUERDyjyk7LRmmqqQ==
Date:   Mon, 15 Apr 2019 14:37:34 +0000
Message-ID: <AM0PR04MB4211C417490D2245BFFEB63A802B0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c068d60-b257-439d-cf4e-08d6c1afe675
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600140)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB5219;
x-ms-traffictypediagnostic: AM0PR04MB5219:
x-microsoft-antispam-prvs: <AM0PR04MB5219DA3A94FC1AB50228DA8E802B0@AM0PR04MB5219.eurprd04.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(376002)(39860400002)(366004)(396003)(51914003)(199004)(189003)(53936002)(105586002)(55016002)(186003)(106356001)(9686003)(5660300002)(33656002)(8676002)(256004)(81166006)(81156014)(52536014)(14444005)(8936002)(6436002)(68736007)(66066001)(6506007)(6246003)(4326008)(102836004)(25786009)(486006)(44832011)(476003)(305945005)(54906003)(316002)(74316002)(99286004)(97736004)(7736002)(7696005)(14454004)(86362001)(6116002)(3846002)(6916009)(2906002)(478600001)(229853002)(26005)(71190400001)(71200400001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5219;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eTI8gru9v9Kacr27G41j7jeUNVPZ0OQd8wrChQoz5k3lBbD4MxZA3a7avK53iY3w6TaKiOopaqYR2wKEFrOGMYuCnWxJlBsb0NuYlKfZzI4Ku0PsPrZ7oUwnYpiwNQ7QBUQBFLwUP+Bp6RdxySJGF+IH62+M04sIjAtmGK4e2JobWukw11HoHmw3bCiYCkratuwOVqpJ0Hv7pn9l53IPNktMizQvi3YDrtV5x7FMIU2F2N8I4HQ7q5MLMNvZmvM3H15teRZgy+R6A3QmzptsS+RfNWSw0XAl3n4eKwcybM9fFnmG5MgLpfu9kR2uCug8NuXDugpe/oCvueazD0CVYzz1jDrUK3MKCIxY+EnmvZfTpHQTPpSDJnPnL/OvsM2TFuPkSvBUtxS119y0aZpZW/tSqPqM9SU7ccVWZQq5Ouk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c068d60-b257-439d-cf4e-08d6c1afe675
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 14:37:34.8100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5219
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgUm9iLA0KDQo+ID4gPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9mcmVlc2NhbGUvZnNsLHNjdS50eHQNCj4gPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KPiA+ID4gPiBpbmRleCA3MmQ0
ODFjLi4yODE2Nzg5IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KPiA+ID4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0K
PiA+ID4gPiBAQCAtNzgsNiArNzgsMTkgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICJmc2wsaW14OHFtLWNsb2NrIg0KPiA+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgImZzbCxpbXg4cXhwLWNsb2NrIg0KPiA+ID4gPiAgICAgICAgICAgICAg
ICAgICAgIGZvbGxvd2VkIGJ5ICJmc2wsc2N1LWNsayINCj4gPiA+ID4gKy0gI2Nsb2NrLWNlbGxz
OiAgICAgICAgICAgIFNob3VsZCBiZSAwLg0KPiA+ID4gPiArLSByc3JjLWlkOiAgICAgICAgIFJl
c291cmNlIElEIGFzc29jaWF0ZWQgd2l0aCB0aGlzIGNsb2NrDQo+ID4gPiA+ICstIGNsay10eXBl
OiAgICAgICAgICAgICAgICBUeXBlIG9mIHRoaXMgY2xvY2suDQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgUmVmZXIgdG8gPGluY2x1ZGUvZHQtYmluZGluZ3MvZmlybXdhcmUvaW14L3JzcmMu
aD4NCj4gZm9yDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgYXZhaWxhYmxlIGNsb2NrIHR5
cGVzIHN1cHBvcnRlZCBieSBTQ1UuDQo+ID4gPg0KPiA+ID4gQ2FuJ3QgeW91IGp1c3QgbWFrZSB0
aGVzZSAyIHZhbHVlcyBjbG9jayBjZWxscz8gSSdtIGFsbCBmb3IgZ2V0dGluZw0KPiA+ID4gcmlk
IG9mIG1hZGUgdXAgY2xvY2sgbnVtYmVycy4NCj4gPiA+DQo+ID4NCj4gPiBUaGFua3MgZm9yIHRo
ZSBhZ3JlZW1lbnQgdG8gcmVtb3ZlIGNsb2NrIElEcy4NCj4gPg0KPiA+IFRoZSAyIHZhbHVlcyBj
bG9jayBjZWxsIHNlZW1zIG5vdCB0aGUgYmVzdCBhcHByb2FjaCBmb3IgaS5NWCBiZWNhdXNlDQo+
ID4gaXQgc3RpbGwgbmVlZHMgdG8gZGVmaW5lIGFsbCBjbG9ja3MgaW4gdGhlIGRyaXZlciB3aGlj
aCBpcyBleGFjdGx5IHdlDQo+ID4gd2FudCB0byBhdm9pZCBub3cgZHVlIHRvIHNvbWUgc3BlY2lh
bCBIVyBjaGFyYWN0ZXJpc3RpYzoNCj4gDQo+IFdoeSdzIHRoYXQ/IFlvdSBjYW4gd2FsayB0aGUg
RFQgYW5kIGV4dHJhY3QgdGhlIDIgY2VsbHMgZm9yIGVhY2ggY2xvY2sgcHJlc2VudC4NCj4gVGhh
dCdzIG5vdCBhbnkgZGlmZmVyZW50IHRoYW4gd2Fsa2luZyBjaGlsZCBub2RlcyBoZXJlIGFuZCBn
ZXR0aW5nIHRoZSByZXNvdXJjZQ0KPiBpZHMgYW5kIHR5cGUuIFRoYXQncyBub3QgcmVhbGx5IGZh
c3QsIGJ1dCBpZiBzcGVlZCBpcyByZWFsbHkgYW4gaXNzdWUgd2UgY2FuDQo+IGNvbnNpZGVyIGFk
ZHJlc3NpbmcgdGhhdCBpbiB3YXlzIHRoYXQgZXh0ZW5kIHJhdGhlciB0aGFuIGNoYW5nZSB0aGUg
YmluZGluZy4NCj4gDQoNCkR1ZSB0byBzZWFyY2hpbmcgdGhlICdjbG9ja3MnIHByb3BlcnR5IG9m
IGFsbCBkZXZpY2Ugbm9kZXMgaW5kaXJlY3RseSB0byANCmV4YWN0IHRoZSAyIGNlbGwgdmFsdWUg
Y2F1c2VzIG11Y2ggdHJvdWJsZXMgaW4gZHJpdmVyIGltcGxlbWVudGF0aW9uIGFuZA0KbG9va3Mg
YSBiaXQgd2VpcmQgYW5kIGlzIHZlcnkgbG93IGVmZmljaWVuY3kgKCB0aGUgcGVyZm9ybWFuY2Ug
d2lsbCBhbHNvIHBvdGVudGlhbGx5DQpiZSBhZmZlY3RlZCBieSBhZGRpbmcgbmV3IHVucmVsZXZh
bnQgbm9kZXMgd2hpY2ggaXMgYmFkKSwgd2UgZm91bmQgdGhlIGJlbG93DQphbHRlcm5hdGl2ZSB3
YXkgdG8gZG8gdGhlIHNhbWUgMiBjZWxsIGJpbmRpbmcsIGJ1dCBoYXZpbmcgbm8gcGVyZm9ybWFu
Y2UgaXNzdWUuDQpJdCdzIG11Y2ggc2ltaWxhciB0byB0aGUgQVJNIFNDUEkgY2xvY2sgYmluZGlu
Zy4NCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLHNjcGkudHh0DQoN
CkRvIHlvdSB0aGluayBpZiBpdCdzIG9rYXkgdG8geW91Pw0KDQpJZiB3ZSBoYXZlIHRvIHVzZSAy
IGNlbGwgYmluZGluZywgd2UgcHJvYmFibHkgd291bGQgcHJlZmVyIHRvIHVzZSB0aGlzIHdheQ0K
YXMgaXQgY2FuIHJlbGllZiB1cyBhIGxvdCBmcm9tIGluZGlyZWN0bHkgc2VhcmNoaW5nIHRoZSAn
Y2xvY2tzJyBwcm9wZXJ0eS4gDQoNCklmIHlvdSdyZSBvaywgcGxlYXNlIGxldCBtZSBrbm93LCBJ
IHdpbGwgbWFrZSBpdCBpbiBWMiBmb3IgdGhlIHJldmlldy4NCg0KZW5ldDBfY2xrOiBjbG9jay1l
bmV0MCB7DQogICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtY2xvY2siLCAiZnNsLHNj
dS1jbGsiOw0KICAgICAgICAjY2xvY2stY2VsbHMgPSA8Mj47DQogICAgICAgIGNsb2NrLWluZGlj
ZSA9IDxJTVhfU0NfUE1fQ0xLX1BFUj4sCQkvLyBjbG9jayBjZWxsIDIgdmFsdWUNCiAgICAgICAg
ICAgICAgICAgICAgICAgPElNWF9TQ19QTV9DTEtfQllQQVNTPiwNCiAgICAgICAgICAgICAgICAg
ICAgICAgPElNWF9TQ19QTV9DTEtfTUlTQzA+Ow0KICAgICAgICBjbG9jay1vdXRwdXQtbmFtZXMg
PSAiZW5ldDBfY2xrIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImVuZXQwX2J5cGFz
c19jbGsiLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZW5ldDBfcmdtaWlfY2xrIjsN
CgkJLy8gd2UgY2FuIHVzZSB0aGUgc2FtZSByZXNvdXJjZSBpZCBmb3IgY2xvY2sgY2VsbHMgMSB2
YWx1ZQ0KCQkvLyBvciBwcm9iYWJseSBlbmNvZGVkIGluIG5vZGVAcmVnPw0KICAgICAgICBwb3dl
ci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9FTkVUXzA+OyANCn07DQoNCmVuZXQwX2xwY2c6IGNs
b2NrLWNvbnRyb2xsZXJANWIyMzAwMDAgew0KICAgICAgICBjb21wYXRpYmxlID0gImZzbCxpbXg4
cXhwLWxwY2ciOw0KICAgICAgICByZWcgPSA8MHg1YjIzMDAwMCAweDEwMDAwPjsNCiAgICAgICAg
I2Nsb2NrLWNlbGxzID0gPDE+Ow0KICAgICAgICBjbG9ja3MgPSA8JmVuZXQwX2NsayBJTVhfU0Nf
Ul9FTkVUXzAgSU1YX1NDX1BNX0NMS19QRVI+LA0KICAgICAgICAgICAgICAgICA8JmVuZXQwX2Ns
ayBJTVhfU0NfUl9FTkVUXzAgSU1YX1NDX1BNX0NMS19QRVI+LA0KICAgICAgICAgICAgICAgICA8
JmNvbm5fYXhpX2Nsaz4sIDwmY29ubl9pcGdfY2xrPiwgPCZjb25uX2lwZ19jbGs+Ow0KICAgICAg
ICBiaXQtb2Zmc2V0ID0gPDAgNCA4IDE2IDIwPjsNCiAgICAgICAgY2xvY2stb3V0cHV0LW5hbWVz
ID0gImVuZXQwX2lwZ19yb290X2NsayIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICJl
bmV0MF90eF9jbGsiLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZW5ldDBfYWhiX2Ns
ayIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICJlbmV0MF9pcGdfY2xrIiwNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgImVuZXQwX2lwZ19zX2NsayI7DQogICAgICAgIHBvd2Vy
LWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX0VORVRfMD47DQp9Ow0KDQpmZWMxOiBldGhlcm5ldEA1
YjA0MDAwMCB7DQogICAgICAgIHJlZyA9IDwweDViMDQwMDAwIDB4MTAwMDA+Ow0KICAgICAgICBp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgMjU4IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KICAgICAgICAg
ICAgICAgICAgICAgPEdJQ19TUEkgMjU2IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KICAgICAgICAg
ICAgICAgICAgICAgPEdJQ19TUEkgMjU3IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KICAgICAgICAg
ICAgICAgICAgICAgPEdJQ19TUEkgMjU5IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KICAgICAgICBj
bG9ja3MgPSA8JmVuZXQwX2xwY2cgMz4sDQogICAgICAgICAgICAgICAgIDwmZW5ldDBfbHBjZyAy
PiwNCiAgICAgICAgICAgICAgICAgPCZlbmV0MF9scGNnIDE+LA0KICAgICAgICAgICAgICAgICA8
JmVuZXQwX2xwY2cgMD47DQogICAgICAgIGNsb2NrLW5hbWVzID0gImlwZyIsICJhaGIiLCAiZW5l
dF9jbGtfcmVmIiwgInB0cCI7DQogICAgICAgIGZzbCxudW0tdHgtcXVldWVzPTwzPjsNCiAgICAg
ICAgZnNsLG51bS1yeC1xdWV1ZXM9PDM+Ow0KICAgICAgICBwb3dlci1kb21haW5zID0gPCZwZCBJ
TVhfU0NfUl9FTkVUXzA+Ow0KICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KfTsNCg0KUmVn
YXJkcw0KRG9uZyBBaXNoZW5nDQo=
