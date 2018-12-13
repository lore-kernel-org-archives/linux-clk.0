Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9415C67839
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 00:33:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65F7620811
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 00:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Asjk9yI5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65F7620811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbeLMAdV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Dec 2018 19:33:21 -0500
Received: from mail-eopbgr130071.outbound.protection.outlook.com ([40.107.13.71]:22752
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726869AbeLMAdV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Dec 2018 19:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpH8FK6nQUAwZ/C4fxmDcHkcPscTSzjdwxHn2nvcDf8=;
 b=Asjk9yI58n6irDFMzCKgpssgTq9LY6HjHmMoy4MLSdmB7V62u+Mq4jFsk+0XLo47gyP8Ndu3huA0N5i8NT5aqrkernwJy5kM3pOdx4jT/EmRlB207RVLDqhR3HXCaXvQBQVAKkcLnoxdTLWpgVThbon655ZIL4LOzFOEgJ5mw7s=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4769.eurprd04.prod.outlook.com (20.176.215.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.23; Thu, 13 Dec 2018 00:32:20 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Thu, 13 Dec 2018
 00:32:20 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V9 1/7] clk: imx: add configuration option for mmio clks
Thread-Topic: [PATCH V9 1/7] clk: imx: add configuration option for mmio clks
Thread-Index: AQHUi98lQ6o73Estskm1k5h96wz2oqV4fYEAgABeCkCAARxjAIAAXN6QgACazVCAAMtXAIAAIYdA
Date:   Thu, 13 Dec 2018 00:32:20 +0000
Message-ID: <AM0PR04MB421101C45B460F6DC5032D1780A00@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com>
 <1543934041-12572-2-git-send-email-aisheng.dong@nxp.com>
 <154447530435.17204.3027810086542897433@swboyd.mtv.corp.google.com>
 <AM0PR04MB4211B87A842FB8AF14621E3380A60@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <154455657071.17204.2493209125185218529@swboyd.mtv.corp.google.com>
 <AM0PR04MB4211D9C32A4DDCCF266B60C380A70@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <AM0PR04MB4211C8B8DC2D5F2133D30B9F80A70@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <154465342417.17204.9306702088509412293@swboyd.mtv.corp.google.com>
In-Reply-To: <154465342417.17204.9306702088509412293@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4769;6:2IjzseVeakvuv/YIyvr88t2RQ1PKFKiG6lys4Li1Z8N04DmPUE6CGwMYtWkcbXZzyeU4XLAy6Rn7ek0wEZfa311kc+IWEHYyVTLj6YHzJZAgkAk8A8PEm9XXAtVAYhae9QNyhHs2ouUi6+s+DNE0mtygeTbISqhGrXN5ZH+396yDsQLfrv/ML/+jdEt9O2MSalWWc6FTSfSAafQGdoGahKhfUwgSvAnsPfRTeBpg5+xMcUaL9pVr37LiFn5mgaTjWaTEeImMtA6ZWWGaAEmGI/BBUSm9mxjH4AM+tdyXghZWqoaTjVj5D8oTn7gBivyM+uBju7rM5TOz84b9P8i6VpiYYHv0xaLbOzBU/Maa+4GcCmlQZ4aiLG/8oGggYi4Pepqe8KRV/9q52OentJ35ur1RuAz7csnn69heLQSXkmIxCOmrQvDq0SpeRTeLdqwFnl90l7LoZgcXdXZcqtokzw==;5:D5KVlwjTKOhMwxWhl7XJIWynjaTVjvWTrwKvMh5v44gC+gefEfkexUD2D3TaRQ/UM8zwlIX2KnxJtKNiK2SGWEljIMezQgrroYj0EuhPnPuxpTodVMMYw2zNsuq/ZeypG3WJ8QATjSucupQXC74KnruROJbM4ovv1Q85gIHdSKk=;7:11MTyEjecOs7x5MhGAYVN0TzOECl3YUWpYJXUJ1vVoK4XSoXmvLDLp/H4FbzriqWQZtzAhqq3tzi+AC386mB7hnlF7qYc5LqXpQUFj84GmDD04725Jl+cCZCzk//IrUEvALM7BEDPqNbkY+r4G7w1A==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 058ccbab-3ec8-473d-f16d-08d660927197
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4769;
x-ms-traffictypediagnostic: AM0PR04MB4769:
x-microsoft-antispam-prvs: <AM0PR04MB4769133D536436AC529F1ECA80A00@AM0PR04MB4769.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230020)(999002)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231475)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4769;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4769;
x-forefront-prvs: 088552DE73
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(39860400002)(366004)(136003)(346002)(396003)(13464003)(51914003)(199004)(189003)(2906002)(93886005)(14454004)(7696005)(256004)(99286004)(575784001)(86362001)(14444005)(76176011)(105586002)(53936002)(6116002)(4001150100001)(8936002)(106356001)(2501003)(3846002)(54906003)(4326008)(71190400001)(316002)(55016002)(110136005)(9686003)(25786009)(33656002)(446003)(68736007)(5660300001)(7736002)(476003)(305945005)(97736004)(44832011)(26005)(6246003)(66066001)(102836004)(8676002)(478600001)(53546011)(186003)(486006)(6506007)(6436002)(71200400001)(81156014)(229853002)(11346002)(81166006)(74316002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4769;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: MHWQMBoXQvgiVCsZdeeLjd37pOEaC5MJPPMT5oqqqvWooSGVbfIJ8JMKF8Pg58gIjE3+CKmdY0z5FAqeV7pXA9QugjwD+7EtasT80t18xU2Jdkk+L+FZXCDXLR2AsrYNPV7bEiwsa2A6AhJm0SH37DaiAsMhJAyJaGwuxzLvYJWXs7xmsQwxIAEbUoRqqiN0Wx1+C/zQYDKFpqTXVjXS4N5QtRJF00hnd8RwE2KQ93UPelv2jXjrUrC6cPk7HmDI4j2ZpPYdQzeb5aeA/TvYldz7jOY1N3rvpYpDNbAOWTXKxGi9gBCdMG0Z1NgG90Uw
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 058ccbab-3ec8-473d-f16d-08d660927197
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2018 00:32:20.5958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4769
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIgMTMsIDIwMTgg
NjoyNCBBTQ0KPiBUbzogbGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsgQWlzaGVuZyBEb25nIDxh
aXNoZW5nLmRvbmdAbnhwLmNvbT4NCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7
IEZhYmlvIEVzdGV2YW0gPGZhYmlvLmVzdGV2YW1AbnhwLmNvbT47IGRsLWxpbnV4LWlteA0KPiA8
bGludXgtaW14QG54cC5jb20+OyBrZXJuZWxAcGVuZ3V0cm9uaXguZGUNCj4gU3ViamVjdDogUkU6
IFtQQVRDSCBWOSAxLzddIGNsazogaW14OiBhZGQgY29uZmlndXJhdGlvbiBvcHRpb24gZm9yIG1t
aW8gY2xrcw0KPiANCj4gUXVvdGluZyBBaXNoZW5nIERvbmcgKDIwMTgtMTItMTIgMDI6Mjc6MjQp
DQo+ID4gSGkgU3RlcGhlbiwNCj4gPg0KPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jbGsvaW14L01ha2VmaWxlDQo+ID4gPiA+ID4gPiA+IGIvZHJpdmVycy9jbGsvaW14L01ha2Vm
aWxlIGluZGV4DQo+ID4gPiA+ID4gPiA+IDVjMGIxMWUuLmY4NTA0MjQgMTAwNjQ0DQo+ID4gPiA+
ID4gPiA+IC0tLSBhL2RyaXZlcnMvY2xrL2lteC9NYWtlZmlsZQ0KPiA+ID4gPiA+ID4gPiArKysg
Yi9kcml2ZXJzL2Nsay9pbXgvTWFrZWZpbGUNCj4gPiA+ID4gPiA+ID4gQEAgLTEsNiArMSw2IEBA
DQo+ID4gPiA+ID4gPiA+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IC1vYmoteSArPSBcDQo+ID4gPiA+ID4gPiA+ICtvYmot
JChDT05GSUdfTVhDX0NMSykgKz0gXA0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEJlY2F1c2Ug
dGhpcyBjaGFuZ2VzIHRvIG9iai0kKENPTkZJRykgd2Ugc2hvdWxkIGNoYW5nZSB0aGUNCj4gPiA+
ID4gPiA+IGRyaXZlcnMvY2xrL01ha2VmaWxlIHRvIGhhdmUgb2JqLXkgZm9yIHRoaXMgTWFrZWZp
bGUgaW5zdGVhZA0KPiA+ID4gPiA+ID4gb2YgZGVwZW5kaW5nIG9uIEFSQ0hfTVhDLg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gV2UgYWxzbyB1c2UgQVJDSF9NWEMgZm9yIEFSTXY4IFNvQyBjbG9ja3Mu
DQo+ID4gPiA+DQo+ID4gPiA+IFllcywgYW5kPyBJJ20gc3VnZ2VzdGluZyBkcml2ZXJzL2Nsay9N
YWtlZmlsZSBoYXZlIGFuIG9iai15ICs9DQo+ID4gPiA+IGRyaXZlcnMvY2xrL2lteC8gYW5kIHRo
ZW4gZGVjaWRlIHRvIGNvbXBpbGUgb3Igbm90IGNvbXBpbGUgdGhlDQo+ID4gPiA+IE1YQ19DTEsg
ImNvcmUiIGJpdHMgYmFzZWQgb24gQ09ORklHX01YQ19DTEsgY29uZmlnIG9wdGlvbi4NCj4gPiA+
DQo+ID4gPiBTb3JyeSBmb3IgdGhlIG1pc3N1bmRlcnN0YW5kaW5nIGJlZm9yZS4NCj4gPiA+IEkg
Z3Vlc3MgeW91IHBvaW50IGlzIGhhdmUgYW4gb2piLXkgKz0gZHJpdnJzL2Nsay9pbXgvIFRoZW4g
aW4NCj4gPiA+IGRyaXZlcnMvY2xrL2lteC9LY29uZmlnIGNvbmZpZyBNWENfQ0xLDQo+ID4gPiAg
ICAgICAgICAgICAgIGRlZl9ib29sIEFSQ0hfTVhDICYmICFBUk02NA0KPiA+ID4gICAgICAgICAg
ICAgICBzZWxlY3QgTVhDX2NsayBiaXRzDQo+ID4gPiBjb25maWcgTVhDX0NMS19TQ1UNCj4gPiA+
ICAgICAgICAgICAgICAgZGVmX2Jvb2wgQVJDSF9NWEMgJiYgQVJNNjQNCj4gPiA+ICAgICAgICAg
ICAgICAgc2VsZWN0IFNDVSBjbG9jayBiaXRzDQo+ID4gPg0KPiA+ID4gSWYgd3JvbmcgcGxlYXNl
IGxldCBtZSBrbm93Lg0KPiA+ID4NCj4gPiA+IFdpbGwgdXBkYXRlIHRoZSBwYXRjaCBzZXJpZXMg
YW5kIHJlLXNlbmQuDQo+ID4gPiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLg0KPiANCj4gWWVz
IHRoYXQgbG9va3MgbGlrZSB3aGF0IEknbSBhc2tpbmcgZm9yLg0KPiANCj4gPiA+DQo+ID4NCj4g
PiBJIHRyaWVkIGFuZCBtZXQgYW5vdGhlciBwcm9ibGVtIHRoYXQgTVg4TVEgKEFSTTY0KSBpcyBh
bHNvIHVzaW5nDQo+ID4gbGVnYWN5IE1YQ19DTEsuIChBbmQgMyBtb3JlIE1YOE0gc2VyaWVzIGJh
c2VkIGNoaXBzLikNCj4gPg0KPiA+IFRoYXQgbWVhbnMgSSBoYXZlIHRvIHdyaXRlIHNvbWV0aGlu
ZyBsaWtlOg0KPiA+IGNvbmZpZyBNWENfQ0xLDQo+ID4gICAgICAgICBib29sDQo+ID4gICAgICAg
ICBkZWZfYm9vbCAoQVJDSF9NWEMgJiYgIUFSTTY0KSB8fCAoQVJDSF9NWEMgJiYgQVJNNjQgJiYN
Cj4gPiBTT0NfSU1YOE1RKQ0KPiA+DQo+ID4gY29uZmlnIE1YQ19DTEtfU0NVDQo+ID4gICAgICAg
ICBib29sDQo+ID4gICAgICAgICBkZWZfYm9vbCAoQVJDSF9NWEMgJiYgQVJNNjQgJiYgIVNPQ19J
TVg4TVEpDQo+ID4NCj4gPiBCdXQgaXQgY2FuJ3Qgd29yayBhcyBBUk02NCBzdXBwb3J0cyBtdWx0
aXBsYXRmb3Jtcy4NCj4gPiBlLmcuIHdlIGhhdmUgYWxzbyBTT0NfSU1YOFFYUCwgU09DX0lNWDhR
TSwgU09DX0lNWDhETSAuLi4NCj4gPg0KPiA+IERvIHlvdSBoYXZlIGEgc3VnZ2VzdGlvbiBhYm91
dCB0aGlzPw0KPiA+DQo+IA0KPiBDYW4geW91IHB1dCB0aGUgZW5hYmxpbmcgb2YgTVhDX0NMS19T
Q1UgaW4gdGhlIGRlZmNvbmZpZyBhbmQgZXhwb3NlZCBpdCBhcyBhDQo+IHVzZXIgc2VsZWN0YWJs
ZSBvcHRpb24/IEFuZCBrZWVwIGhpZGluZyB0aGUgTVhDX0NMSyBvcHRpb24gYmVoaW5kIHRoZQ0K
PiBkZWZfYm9vbD8gSSBob3BlIHRoYXQgTVhDX0NMSyBjb3VsZCBiZSB1c2VyIHNlbGVjdGFibGUg
ZXZlbnR1YWxseSwgYnV0IHRoZQ0KPiBkZWZfYm9vbCBpcyB0aGVyZSB0byBtYWtlIGl0IGVhc2ll
ciB0byBicmlkZ2UgdGhlIHRyYW5zaXRpb24gYW5kIHVwZGF0ZQ0KPiBldmVyeW9uZSdzIGRlZmNv
bmZpZ3Mgd2hpbGUgaXQgaXMgbW92ZWQgaW50byB0aGUgZGVmY29uZmlnLg0KDQpTb3VuZHMgbGlr
ZSBhIGdvb2Qgc3VnZ2VzdGlvbi4NCkkgd2lsbCBkbyBpdCBub3cuDQoNCkluIG9yZGVyIHRvIGF2
b2lkIGJyZWFraW5nIE1YOE1RLCBJIHdpbGwga2VlcCBNWENfQ0xLIGFzDQpjb25maWcgTVhDX0NM
Sw0KICAgICAgICAgYm9vbA0KICAgICAgICAgZGVmX2Jvb2wgKEFSQ0hfTVhDICYmICFBUk02NCkg
fHwgKEFSQ0hfTVhDICYmIEFSTTY0ICYmIFNPQ19JTVg4TVEpDQoNCmFuZCBtYWtlIE1YQ19DTEtf
U0NVIGEgdXNlciBzZWxlY3RhYmxlIG9wdGlvbi4NCg0KQW5kIGZpbmFsbHkgd2Ugd2lsbCBtYWtl
IE1YQ19DTEsgc2VsZWN0YWJsZSBhcyB3ZWxsIGFmdGVyIHRoZSB0cmFuc2l0aW9uLg0KDQpJZiBh
bnkgaXNzdWUgcGxlYXNlIGxldCBtZSBrbm93Lg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcNCg==
