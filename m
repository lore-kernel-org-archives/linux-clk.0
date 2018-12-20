Return-Path: <SRS0=NpU+=O5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FF2C43387
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 06:26:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28A0F20869
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 06:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZAYYG4Da"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730537AbeLTG04 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Dec 2018 01:26:56 -0500
Received: from mail-eopbgr00089.outbound.protection.outlook.com ([40.107.0.89]:26739
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727943AbeLTG04 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 20 Dec 2018 01:26:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/zl/8QnL8oFgZ1oPgFgwHcd7iefG4pfo155k2IGJ5I=;
 b=ZAYYG4DaVAFEGuL5vR9LRquzMPhqoh3RNBgcyd4MK9rafAZUtA6ITN04G9XAP6kB40S12SkAYkRziTezvnO8wTq9YaqIvnjsgCeF0AzR5078NgL8+PFl5wukejIqUr5y0J+vrxmwzTylIdre997AtzBOKruEDcKrNYlyTgyyH1M=
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (52.134.31.21) by
 VI1PR04MB1438.eurprd04.prod.outlook.com (10.163.166.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.22; Thu, 20 Dec 2018 06:26:50 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::8003:6376:a0a2:9a30]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::8003:6376:a0a2:9a30%6]) with mapi id 15.20.1446.020; Thu, 20 Dec 2018
 06:26:50 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 4/5] clk: imx8qxp: make the name of clock ID generic
Thread-Topic: [PATCH 4/5] clk: imx8qxp: make the name of clock ID generic
Thread-Index: AQHUl69S+HgseDOVoEaFEXoCLLe+SaWGS2qAgADXyCA=
Date:   Thu, 20 Dec 2018 06:26:50 +0000
Message-ID: <VI1PR04MB4222ABD43B82BD3C0B73404780BF0@VI1PR04MB4222.eurprd04.prod.outlook.com>
References: <1545232888-9302-1-git-send-email-aisheng.dong@nxp.com>
 <1545232888-9302-5-git-send-email-aisheng.dong@nxp.com>
 <CAOMZO5DzMpMp-Tf74iM3SuHoFpji8z-dxM-UsC13GeDx2bZYgA@mail.gmail.com>
In-Reply-To: <CAOMZO5DzMpMp-Tf74iM3SuHoFpji8z-dxM-UsC13GeDx2bZYgA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;VI1PR04MB1438;6:OYaq3JqYULnjRiYVVXaSTKQXFWublWoWFXgQQ9xIcowy7zBiYHfO/SqGzp0I+FR/7CoduyMDvJ6ZCRGynhYrOXdhkGcnDWEddhh2z2sqSeoty4vbatXvqvi+42Q1BJ0Wz+8WUKLv/JyrWGRVuPJCtLjhHKBsKQhUlqNsbcuYqlgPNbYwVg99YhGGQ/XdLqthZdrVAZky8UNjUPUKbtUzZ12FVXYSL/OXxhCWmz257qMpiJLimMGYSuLwgSVVnwOYAdRUOxOkYbFPA7+Wy4nZ00mazqNeeqDNp2Zjp8xlTpAS4BwowtLLsOq0tSEpG4ne368qPfVy3KTDLOFS+FLFVR4L6jMS8siLdXUxHW0IZhEcRajMbzjqRIhbiQ3n+QHfKLYolzAP/WeITS1YHCpkhBiRHelqUAjgnmB0lVxVw3dyNZbUNL4oVyKV8cPiIITnoQF4Or1M5IqcbXCVor30xQ==;5:fnwEG4/uMH+I4e2iZRbroENfu1XynbyA6H4kS65qYQfIa47z3NAso7w5XT4Tljrb6lUufxiw3PQIlWpzrGVtjPhhKxGsbtjrJz9kXZskrio6fqKlMwt9llIZ7W8XQOLChRurIqj6iRldWdWknx5bcWoPcP4JC3kg1sxvyZvd2Ps=;7:YcozfWNtyRGOGLE14sjbXHU6jV+a/xjMCdTCM+BpZ/JTze3ooh2YfzfSx2Ih7UBH2QmY98tXNbknZJsZ9CzgKEVNVne0+uW/EGLnj6x93NlzOiHJtbo+dTnLJgUFL1sWLjmG4vkuA0n1+nGfKdd4gg==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 6904f9f9-be6e-4996-22d9-08d666442066
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR04MB1438;
x-ms-traffictypediagnostic: VI1PR04MB1438:
x-microsoft-antispam-prvs: <VI1PR04MB1438D15E6FEFBFE774E0079D80BF0@VI1PR04MB1438.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(5005026)(6040522)(2401047)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231475)(944501520)(52105112)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123564045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:VI1PR04MB1438;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB1438;
x-forefront-prvs: 0892FA9A88
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(376002)(366004)(136003)(39860400002)(199004)(13464003)(189003)(99286004)(68736007)(316002)(8676002)(446003)(11346002)(105586002)(8936002)(2906002)(53936002)(55016002)(4326008)(6116002)(305945005)(39060400002)(81166006)(81156014)(3846002)(5660300001)(6246003)(256004)(9686003)(74316002)(476003)(486006)(71190400001)(71200400001)(186003)(86362001)(7736002)(1411001)(106356001)(6436002)(478600001)(102836004)(14454004)(7696005)(76176011)(53546011)(25786009)(54906003)(97736004)(6916009)(6506007)(66066001)(44832011)(229853002)(26005)(33656002)(41533002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB1438;H:VI1PR04MB4222.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: CZbCkHByvGStec8HoUzTUg7AiBFastMGOuS6zHuCZbzrtSybe/AOtkSGfDFu/prAjOrNdBHYWRrp+6cUYN7EvZcd5AunCV9T+LKJF5Q4qal4nmCyes2d/6s20Wjxfw//dUA2QZnHmb6Z53RSVmMfMf8o+7JfEJwmR26fBRg0Dl/Z5WQ02mcrW57Jrl77AUDJ+xB1JcDumPvHAKDYIgk+YW31Tgc94npkyyjWQutmtAeXm5Wrjd5ueuqTRCDph8aMZOac/w58qcnTHurykJDzJ/U4LVbalXMKE5nEjEmSW64DGI2kpsK6E3hF3uzguUO6
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6904f9f9-be6e-4996-22d9-08d666442066
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2018 06:26:50.5706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB1438
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGYWJpbyBFc3RldmFtIFttYWls
dG86ZmVzdGV2YW1AZ21haWwuY29tXQ0KPiBIaSBBaXNoZW5nLA0KPiANCj4gT24gV2VkLCBEZWMg
MTksIDIwMTggYXQgMToyOSBQTSBBaXNoZW5nIERvbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0K
PiB3cm90ZToNCj4gPg0KPiA+IFNDVSBjbG9jayBjYW4gYmUgdXNlZCBpbiBhIHNpbWlsYXIgd2F5
IGJ5IElNWDhRWFAgYW5kIElNWDhRTSBTb0NzLg0KPiA+IExldCdzIG1ha2UgdGhlIG5hbWUgb2Yg
Y2xvY2sgSUQgZ2VuZXJpYyB0byBhbGxvdyBvdGhlciBTb0NzIHRvIHJldXNlDQo+ID4gdGhlIGNv
bW1vbiBwYXJ0Lg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBvbmx5IGNoYW5nZXMgdGhlIGNsb2NrIGlk
IG5hbWUgYW5kIGZpbGUgbmFtZSwgc28gbm8NCj4gPiBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gPg0K
PiA+IENjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+DQo+ID4gQ2M6IFNhc2NoYSBI
YXVlciA8a2VybmVsQHBlbmd1dHJvbml4LmRlPg0KPiA+IENjOiBGYWJpbyBFc3RldmFtIDxmYWJp
by5lc3RldmFtQG54cC5jb20+DQo+ID4gQ2M6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9y
Zz4NCj4gPiBDYzogTWljaGFlbCBUdXJxdWV0dGUgPG10dXJxdWV0dGVAYmF5bGlicmUuY29tPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQo+
ID4gLS0tDQo+ID4gIGRyaXZlcnMvY2xrL2lteC9jbGstaW14OHF4cC1scGNnLmMgICAgICAgIHwg
MTQ2ICsrKysrKystLS0tLS0tLQ0KPiA+ICBkcml2ZXJzL2Nsay9pbXgvY2xrLWlteDhxeHAuYyAg
ICAgICAgICAgICB8IDE1MiArKysrKysrKy0tLS0tLS0tDQo+ID4gIGluY2x1ZGUvZHQtYmluZGlu
Z3MvY2xvY2svaW14OC1jbG9jay5oICAgIHwgMjg5DQo+ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiA+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2lteDhxeHAtY2xvY2suaCB8
IDI4OQ0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICA0IGZpbGVzIGNo
YW5nZWQsIDQzOCBpbnNlcnRpb25zKCspLCA0MzggZGVsZXRpb25zKC0pDQo+IA0KPiBUaGlzIHNl
ZW1zIGxpa2UgdW5uZWVkZWQgY2h1cm4uIEp1c3Qga2VlcCB0aGUgZXhpc3RpbmcgbmFtaW5nIGFu
ZCBvdGhlciBTb0NzDQo+IGNhbiByZXVzZSBpdCB3aXRob3V0IHByb2JsZW0uDQoNClRoZXJlJ3Mg
YSByZWFzb24uDQpXZSBzdGlsbCBuZWVkIGFkZCBzb21lIGNsb2NrIElEcyB3aGljaCBleGlzdCBv
biBNWDhRTSBvbmx5IChwcm9iYWJseSBtb3JlIG9uIGZ1dHVyZSBTb0NzKQ0KSGF2aW5nIHRoZW0g
cHJlZml4ZWQgd2l0aCAnSU1YOFFYUCcgbWF5IGxvb2sgc3RyYW5nZS4NCg0KQmVzaWRlcyB0aGF0
LCBhcyB0aG9zZSBjbG9jayBJRHMgd2lsbCBhbHNvIGJlIHVzZWQgaW4gZGV2aWNldHJlZSwgbWFr
ZSB0aGUgbmFtZSBnZW5lcmljIGZvcg0KZGlmZmVyZW50IFNvQ3Mgc2VlbXMgc3RpbGwgYmV0dGVy
IGFuZCBsZXNzIGNvbmZ1c2luZy4NCg0KUmVnYXJkcw0KRG9uZyBBaXNoZW5nDQo=
