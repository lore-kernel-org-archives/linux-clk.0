Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A96C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 12:49:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2433320870
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 12:49:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="RakNhJZ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2433320870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbeLMMtP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 07:49:15 -0500
Received: from mail-eopbgr30059.outbound.protection.outlook.com ([40.107.3.59]:14112
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728865AbeLMMtP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 07:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FchVhBPfn09L/hXLSIaxzw62o6IpEK8l7UPnFC3i8ig=;
 b=RakNhJZ3kFNzN/+1gCXKHoJoD5woeqxwHgd8Vjgr8aXypyO3FB3OBusxXdmzMbaae7TLf52NdOApiP76c7N23e0vB0bjX8yO3vmS+SHp4uHvYPrnFcwozuFZEydArOTp54QYDqpm1VXBvdINiCfkDBGkC6xvX417jdRoC8l87MU=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5745.eurprd04.prod.outlook.com (20.178.119.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Thu, 13 Dec 2018 12:49:08 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Thu, 13 Dec 2018
 12:49:08 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: RE: [PATCH V11 1/7] clk: imx: add configuration option for mmio clks
Thread-Topic: [PATCH V11 1/7] clk: imx: add configuration option for mmio clks
Thread-Index: AQHUkoBFxXjd98YyekOIqi1bO3Y7g6V8TgAAgAA5bEA=
Date:   Thu, 13 Dec 2018 12:49:07 +0000
Message-ID: <AM0PR04MB4211128F59A987F3D94AAD8F80A00@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com>
 <1544662938-5020-2-git-send-email-aisheng.dong@nxp.com>
 <154468785263.19322.9529215687462426277@swboyd.mtv.corp.google.com>
In-Reply-To: <154468785263.19322.9529215687462426277@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5745;6:FwmsZotdsQto2KEMc5VxVhWR0LKwti45pye0tezu/f1LPwssd5bYZah8o0Yk3Xz6VhT5bysgfUNHEOC+cvYkAW2OCrngciOVDdzLsPc7kR/On1QImYy2KuNC40Dk2dpR1bzpPyadhz4VvjTnBdzYDzcacQ8CMfpGbgr4jH3l4pTZxxyaUgzWbgD/q8CJVOYMjAxmG/Pi19eSeWjxjlAarVfmgNj/a8K2lUdr+yZQLgsNnKHLZu2XQV2Yq2Ikr/6uzmXxlx9H1PLBVgdPdVyKEMhhx0lQ7Ueq5oEVgauOQDtK42dWH8lHIbOKfkBYjYykv4So7ps+X6szeq4rMFQ3SFp1ty9ynr4izfcD1R9B41+wo7RLr8JCYx4BIGKo3DsLr+4Y2hwcU2N1q8PI3xUd3xiN4kf8pzPG3M9CZXiFEjHWbKtXEdeDQWUXltmKlOnmx5NNHp25TSpGkn2oyfNHjQ==;5:dup7T87Fg5b147APrqMSRvoAKykpDH9R7ZMHDSnlD195cAPiS9LN5HAQVMJzwVANbB2VZ7Eg6v5FhKco6Ozm+Rssd1jEeA/jCHW5JaxLvwZguf+9s/drxqV/jNRhYtQzKquK2oMhzgp4HqR6U0n2UZBba1RAy/4JNpOmCzQdc7Y=;7:GgMhlcDbvQMzxILOglMTQwBqLHZShvV1KXNRcJBSc9RuNsOy47uVPayqk4LQHrvE3e/YtoV4N/POKShge6ejpwF9+s1aeC24La4rNMKhJKSpTee8+22Jp+qINHGkavUpswvz/XQYwjMlEkTLaAav5g==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: be1182b6-6e9a-4263-9f72-08d660f95f4b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5745;
x-ms-traffictypediagnostic: AM0PR04MB5745:
x-microsoft-antispam-prvs: <AM0PR04MB5745D362DCA58425E4D0B7E680A00@AM0PR04MB5745.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231475)(944501520)(52105112)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5745;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5745;
x-forefront-prvs: 088552DE73
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(366004)(396003)(39860400002)(136003)(13464003)(51914003)(199004)(189003)(11346002)(2501003)(74316002)(25786009)(5660300001)(2906002)(476003)(478600001)(446003)(68736007)(44832011)(486006)(4001150100001)(33656002)(106356001)(14454004)(66066001)(81156014)(97736004)(7736002)(8676002)(81166006)(229853002)(54906003)(256004)(110136005)(71200400001)(71190400001)(14444005)(575784001)(105586002)(4326008)(53546011)(9686003)(53936002)(86362001)(55016002)(7696005)(6246003)(3846002)(186003)(6116002)(6436002)(26005)(102836004)(316002)(305945005)(6506007)(8936002)(99286004)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5745;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: RXrDCxCftsCZOIMbaNoWw3TinIzS09j2ndyt9o9P/LCElQmk4dKf5tGoaUFQcMhtN4bXCTe7nkwZnGVYnYdskdqI+Cw8MPe7T4MZx2NsVLQ9qJoQFkwDZs3K/Bv5ByrKvvEuLL3wtZLMLnqwRzxrwM2W7Il0hARoT509ui2CWkRs1scMyH9wNw0Pd+MxRU3XfHJulgiK3S5kukVdZ/Av9TV4kXgS/lUGioVeu+rKmhB9Lt0xSPVg9+N56Zv1KJldXRwscEftK42/o8JDigDdAzld/N2BZaU583nRSilEO6gFtuRNXWN7+ZS/G8staWOu
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be1182b6-6e9a-4263-9f72-08d660f95f4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2018 12:49:08.0157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5745
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIgMTMsIDIwMTgg
Mzo1OCBQTQ0KPiBUbzogbGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsgQWlzaGVuZyBEb25nIDxh
aXNoZW5nLmRvbmdAbnhwLmNvbT4NCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7
IEZhYmlvIEVzdGV2YW0gPGZhYmlvLmVzdGV2YW1AbnhwLmNvbT47IGRsLWxpbnV4LWlteA0KPiA8
bGludXgtaW14QG54cC5jb20+OyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IEFpc2hlbmcgRG9uZw0K
PiA8YWlzaGVuZy5kb25nQG54cC5jb20+OyBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPjsg
T2xvZiBKb2hhbnNzb24NCj4gPG9sb2ZAbGl4b20ubmV0Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IFYxMSAxLzddIGNsazogaW14OiBhZGQgY29uZmlndXJhdGlvbiBvcHRpb24gZm9yIG1taW8gY2xr
cw0KPiANCj4gUXVvdGluZyBBaXNoZW5nIERvbmcgKDIwMTgtMTItMTIgMTc6MDc6NTIpDQo+ID4g
VGhlIHBhdGNoIGludHJvZHVjZXMgQ09ORklHX01YQ19DTEsgb3B0aW9uIGZvciBsZWdhY3kgTU1J
TyBjbG9ja3MsDQo+ID4gdGhpcyBpcyByZXF1aXJlZCB0byBjb21waWxlIGxlZ2FjeSBNTUlPIGNs
b2NrIGNvbmRpdGlvbmFsbHkgd2hlbg0KPiA+IGFkZGluZyBTQ1UgYmFzZWQgY2xvY2tzIGZvciBN
WDggcGxhdGZvcm1zIGxhdGVyLg0KPiA+DQo+ID4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2Vy
bmVsLm9yZz4NCj4gPiBDYzogU2FzY2hhIEhhdWVyIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+DQo+
ID4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZhYmlvLmVzdGV2YW1AbnhwLmNvbT4NCj4gPiBDYzogU3Rl
cGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPg0KPiA+IENjOiBNaWNoYWVsIFR1cnF1ZXR0ZSA8
bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogRG9uZyBBaXNoZW5n
IDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9jbGsvTWFr
ZWZpbGUgYi9kcml2ZXJzL2Nsay9NYWtlZmlsZSBpbmRleCBhNDc0MzBiLi44YTk0NDBhDQo+ID4g
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvTWFrZWZpbGUNCj4gPiArKysgYi9kcml2ZXJz
L2Nsay9NYWtlZmlsZQ0KPiA+IEBAIC03Miw3ICs3Miw3IEBAIG9iai0kKENPTkZJR19BUkNIX0RB
VklOQ0kpICAgICAgICAgICAgKz0NCj4gZGF2aW5jaS8NCj4gPiAgb2JqLSQoQ09ORklHX0g4MzAw
KSAgICAgICAgICAgICAgICAgICAgKz0gaDgzMDAvDQo+ID4gIG9iai0kKENPTkZJR19BUkNIX0hJ
U0kpICAgICAgICAgICAgICAgICAgICAgICAgKz0gaGlzaWxpY29uLw0KPiA+ICBvYmoteSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICArPSBpbWd0ZWMvDQo+ID4gLW9iai0kKENPTkZJ
R19BUkNIX01YQykgICAgICAgICAgICAgICAgICs9IGlteC8NCj4gPiArb2JqLXkgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKz0gaW14Lw0KPiA+ICBvYmoteSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICArPSBpbmdlbmljLw0KPiA+ICBvYmotJChDT05GSUdfQVJDSF9L
MykgICAgICAgICAgICAgICAgICArPSBrZXlzdG9uZS8NCj4gPiAgb2JqLSQoQ09ORklHX0FSQ0hf
S0VZU1RPTkUpICAgICAgICAgICAgKz0ga2V5c3RvbmUvDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvY2xrL2lteC9LY29uZmlnIGIvZHJpdmVycy9jbGsvaW14L0tjb25maWcgbmV3DQo+ID4gZmls
ZSBtb2RlIDEwMDY0NCBpbmRleCAwMDAwMDAwLi4zNzQ3OGJhDQo+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+ICsrKyBiL2RyaXZlcnMvY2xrL2lteC9LY29uZmlnDQo+ID4gQEAgLTAsMCArMSw1IEBADQo+
ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArIyBjb21tb24gY2xv
Y2sgc3VwcG9ydCBmb3IgTlhQIGkuTVggU29DIGZhbWlseS4NCj4gPiArY29uZmlnIE1YQ19DTEsN
Cj4gPiArICAgICAgIGJvb2wNCj4gPiArICAgICAgIGRlZl9ib29sIChBUkNIX01YQyAmJiAhQVJN
NjQpIHx8IChBUkNIX01YQyAmJiBBUk02NCAmJg0KPiA+ICtTT0NfSU1YOE1RKQ0KPiANCj4gT2sg
SSBsb29rZWQgY2xvc2VyLCBTT0NfSU1YOE1RIGlzIG9ubHkgYmVpbmcgaW50cm9kdWNlZCBub3cg
YW5kIGhhcyBvbmx5DQo+IGJlZW4gaW4gbGludXgtbmV4dCBmb3IgYSBmZXcgZGF5cy4gSGF2aW5n
IHN1Y2ggYSBjb25maWcgc3ltYm9sIGlzIGhpZ2hseSB1bnVzdWFsDQo+IGZvciBhcm02NCBjb2Rl
LiBIYXMgdGhhdCBiZWVuIGFjY2VwdGVkIGJ5IGFybS1zb2M/IEkgZG9uJ3Qga25vdyB3aHkgaXQN
Cj4gd291bGQgYmUgYmVjYXVzZSB3ZSBkb24ndCBhZGQgU29DIHNwZWNpZmljIGNvbmZpZyBvcHRp
b25zIGFueW1vcmUuIEkgaW1hZ2luZQ0KPiBpdCB3aWxsIGJlIHJlamVjdGVkIGFuZCB3ZSdsbCBu
ZWVkIHRvIGhhdmUgdGhpcyBuZXcgTVhDX0NMSyBjb25maWcgYmUgZW5hYmxlZA0KPiBpbiB0aGUg
ZGVmY29uZmlnIGluc3RlYWQgb2Ygc2VsZWN0ZWQgZnJvbSB0aGUgYXJjaCBsYXllci4NCj4gDQo+
IEdpdmVuIGFsbCB0aGF0LCBpcyB0aGVyZSBhbnkgZGFtYWdlIGlmIHRoaXMgaXMganVzdCBhIGRl
Zl9ib29sIEFSQ0hfTVhDIHJpZ2h0DQo+IG5vdz8gSWYgaXQncyBlbmFibGVkIG9uIHRoZSBwbGF0
Zm9ybXMgdGhhdCBkb24ndCB1c2UgaXQgYmVjYXVzZSB0aGV5IGhhdmUgU0NVLA0KPiBkb2VzIGl0
IGFjdHVhbGx5IG1hdHRlcj8gT3Igd2UganVzdCBnZXQgc29tZSBjb2RlIGJsb2F0Pw0KPiBJZiBp
dCdzIGp1c3Qgc29tZSBleHRyYSBjb2RlLCB0aGVuIGV2ZW4gbW9yZSByZWFzb24gdG8gbWFrZSBh
IHVzZXIgdmlzaWJsZSBjb25maWcNCj4gb3B0aW9uIHRoYXQgY2FuIGJlIHNlbGVjdGVkIGluIHRo
ZSBjb25maWd1cmF0aW9ucyB0aGF0IGNhcmUgdG8gc2F2ZSBzb21lIHNwYWNlLg0KPiANCg0KSXQg
bWFrZSBzZW5zZSB0byBtZS4gTm8gYWN0dWFsIGRhbWFnZSBhcyB3ZSBzdXBwb3J0IG11bHRpcGxh
dGZvcm1zIHVzaW5nIGJvdGgNCk1YQ19DTEsgYW5kIE1YQ19DTEtfU0NVIG9uIEFSTXY4LiBBbmQg
Zm9yIHVzZXJzIHdobyB3YW50IHRvIHNhdmUgb25lIG9mIHRoZW0sDQp0aGV5IGRvIGNhbiBjaGFu
Z2UgdmlhIG1lbXVjb25maWcgbGF0ZXIuDQpJIHdpbGwgbWFrZSBpdCBhIGRlZl9ib29sIEFSQ0hf
TVhDLg0KVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4NCg0KQlRXLCBhcyBJIGFsc28gaW50cm9k
dWNlZCBTT0NfSU1YOFFYUCBpbiBQYXRjaCA0IGFuZCA3Lg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y2xrL2lteC9NYWtlZmlsZSBiL2RyaXZlcnMvY2xrL2lteC9NYWtlZmlsZQ0KK29iai0kKENPTkZJ
R19TT0NfSU1YOFFYUCkgKz0gY2xrLWlteDhxeHAubyBjbGstaW14OHF4cC1scGNnLm8gDQoNCkFj
Y29yZGluZyB0byB5b3VyIGZvcm1lciBzdWdnZXN0aW9uLCBJIHRoaW5rIHdlIHNob3VsZCByZW1v
dmUgaXQuDQpTbyBJJ20gZ29pbmcgdG8gbWFrZSBpbXg4cXhwIGNsayBhbiB1c2VyIHNlbGVjdGFi
bGUgY29uZmlndXJhdGlvbiBvcHRpb24gd2hpY2gNCndpbGwgc2VsZWN0IHRoZSBjb21tb24gTVhD
X0NMS19TQ1UuIFNvIGEgYml0IGRpZmZlcmVuY2UgZnJvbSBmb3JtZXIgZGlzY3Vzc2lvbiwNCk1Y
Q19DTEtfU0NVIHdpbGwgc3RpbGwgYmUga2VwdCBhIGhpZGUgb3B0aW9uLg0KDQpUaGlzIHdheSBp
cyBtb3N0bHkgbGlrZSBob3cgUUNPTSBkb2VzIGFuZCBzaG91bGQgd29yayBmb3IgSU1YIGFzIHdl
bGwuDQoNClRoZW4gaXQgd2lsbCBsb29rIGxpa2U6DQpjb25maWcgTVhDX0NMS19TQ1UNCiAgICAg
ICAgYm9vbCANCg0KY29uZmlnIENMS19JTVg4UVhQDQogICAgICAgIGJvb2wgIklNWDhRWFAgU0NV
IENsb2NrIg0KICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfTVhDICYmIElNWF9TQ1UgJiYgQVJNNjQN
CiAgICAgICAgc2VsZWN0IE1YQ19DTEtfU0NVDQogICAgICAgIGhlbHANCiAgICAgICAgICBCdWls
ZCB0aGUgZHJpdmVyIGZvciBJTVg4UVhQIFNDVSBiYXNlZCBjbG9ja3MuDQoNCklmIGFueSBpc3N1
ZSwgcGxlYXNlIGxldCBtZSBrbm93Lg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcNCg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9pbXgvTWFrZWZpbGUgYi9kcml2ZXJzL2Nsay9pbXgvTWFr
ZWZpbGUgaW5kZXgNCj4gPiA1YzBiMTFlLi5mODUwNDI0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvY2xrL2lteC9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL2lteC9NYWtlZmlsZQ0K
PiA+IEBAIC0xLDYgKzEsNiBAQA0KPiA+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wDQo+ID4NCj4gPiAtb2JqLXkgKz0gXA0KPiA+ICtvYmotJChDT05GSUdfTVhDX0NMSykgKz0g
XA0KPiA+ICAgICAgICAgY2xrLm8gXA0KPiA+ICAgICAgICAgY2xrLWJ1c3kubyBcDQo+ID4gICAg
ICAgICBjbGstY29tcG9zaXRlLThtLm8gXA0K
