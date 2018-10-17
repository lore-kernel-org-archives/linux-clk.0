Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5872ECDE32
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 09:22:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E545214C3
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 09:22:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="L2mYk64v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E545214C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbeJQRQv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 13:16:51 -0400
Received: from mail-db5eur01on0089.outbound.protection.outlook.com ([104.47.2.89]:52928
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726923AbeJQRQv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 13:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3PxqV2zX8e8sNGnT/cuGF11cRvCkLm2kLdKoFs3SwM=;
 b=L2mYk64vMpQBoibCgDUBE08ri/V5zoxalgApeXkcx9kgiX/Wc2eFRk7HcyrS23qEAMv7WM68WN1F3psWtcH1Js9EZJ1uV6Wfz/EDunrZ0JwjBqLMUpn/Ca7J5Gk/kIzP72vldnmT+11kQBL68SOMlL/dp8eBCMyyOagKPBuNT3U=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5153.eurprd04.prod.outlook.com (20.177.40.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.25; Wed, 17 Oct 2018 09:21:58 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.032; Wed, 17 Oct 2018
 09:21:58 +0000
From:   "A.s. Dong" <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V4 09/11] clk: imx: add common imx_clk_hw_fixed functions
Thread-Topic: [PATCH V4 09/11] clk: imx: add common imx_clk_hw_fixed functions
Thread-Index: AQHUY5ULf0uevZVM/0aIt+GcK5Mi4qUiaGGAgADDXBA=
Date:   Wed, 17 Oct 2018 09:21:57 +0000
Message-ID: <AM0PR04MB4211AC4095A29F4C49FF7E0180FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-10-git-send-email-aisheng.dong@nxp.com>
 <153972556312.5275.17225594568267875356@swboyd.mtv.corp.google.com>
In-Reply-To: <153972556312.5275.17225594568267875356@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5153;6:Wv0Ym5gIO4NvwOUvtiWyV5cqIiQEWE7+w5jU+Pm5rDP5T4SLg5HuZSBggdu4rsFKvukmgPDNHKFRVn+KV2xvejsLhqfGPFCdxLTgN1mgEPTf7IttMNptrnQLampb9PHrphPvL21FGrk0YCsAGmD4kX0C+edmlrJQLp2ykk+MfuDBErtYivURhYMmFyQKKg/z9uq9cxk49crwqL1FFjNh0B7K4wUXUOZajsDCoiuZLoDzAKnr4YGuA4ygFdaJ2XT12C+hFfKDqqF9tUJYNQ9XOlT5ZexZleptbWI+Rx3NhAIgZIgRC2qMVLqqYKLqAyqOKekyIKFNW3Fdic8Cj3IMT792tD7fmG/JKffJZsq6tgrjkmwgSnqoGJCbQB9/TBjLQpXvAgOhHHq/qU+z46VIKtSADkQwjBH63hwkNcsf6XFtRJfGP2xY1K+qBmvj+F0hEnLc800aMjUY6jwy7hTDRw==;5:3AjFKuqwzpW6NplLERbiRD9dIaDIKvhe40M6A3GzAhRNzs0I7hTUFKd9P0ATQbNH7nugo5VuC3ulpNBYzgvPxiM+cbE0H2vaun8TMHWE9gK2NrLH1j/rJH0ERIBub/oikSRR3CAOMp1RYxNkhRoP/0E+6UMngm6Kx6NfsyA/M9o=;7:Ngo8RwKkk62d8Nsf5XfqI8nEXHpNd2JtTqEXfVV4OzJHDV7RyUbTVEQvD7VwDDjBy80nxreCS2ar7WUfDictVkNUD/CYD4l3rNepMBvDybU7p3yBvWQa8nlhGg2eoISJqbxTczVN1K8xB8Cl10+8DaoTg1I6a2MM+eR1zSO+/7EZxLLYriYe01nRUlfsoMt9J3RoobZ/wPTjx1LnGvlIgrhkgVZX1FfMyKo7Uc5gAh/Aa+/Vz0xAEO9+Htje+2dy
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 7a125f67-8f86-46c5-09a3-08d63411fcdc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5153;
x-ms-traffictypediagnostic: AM0PR04MB5153:
x-microsoft-antispam-prvs: <AM0PR04MB51530BF1119579D3DD7F8C2380FF0@AM0PR04MB5153.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5153;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5153;
x-forefront-prvs: 08286A0BE2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(396003)(366004)(136003)(346002)(376002)(199004)(189003)(57704003)(13464003)(8676002)(26005)(33656002)(102836004)(2906002)(110136005)(54906003)(186003)(5660300001)(53936002)(8936002)(81166006)(9686003)(2900100001)(7696005)(305945005)(7736002)(99286004)(81156014)(76176011)(14454004)(97736004)(74316002)(6506007)(316002)(4001150100001)(3846002)(6116002)(6246003)(478600001)(446003)(476003)(11346002)(25786009)(106356001)(105586002)(256004)(486006)(229853002)(86362001)(66066001)(4326008)(55016002)(5250100002)(71190400001)(68736007)(2501003)(71200400001)(6436002)(14444005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5153;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: nNhpgrutW4qGtdOhM98VKRzD+Ipi2M11pyrjeLqek8tzBifWME1SgjxApCK4I3X/F+/HqyrRxHU4ZPK0CkdwkMXN1nqWQKb9bOq9q/mqFU0TNOzZDwuTUDAjUw3owLiEtOBMpjQMxorULz3LWBVlT/69ZBfkKyfMAPYM9I3OWbOlMwgQmos6F7cKgZgaSL+lXJgzvnDGOvFOGcZ4TZUms9reEFlnBZGFYLV9yUmpbww/UICHudzhdqszQpvlnxSJECGIeJXskgJjXuylQazJQbvNYap6JCKd3dBfPHg8yMWenltMJir4aJc6FmeT0LeioloLT6301jEo1jqktIDvVnDblvM5XviqkRfIvjCJ8UQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a125f67-8f86-46c5-09a3-08d63411fcdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2018 09:21:57.9329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5153
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMTcsIDIwMTgg
NTozMyBBTQ0KPiBRdW90aW5nIEEucy4gRG9uZyAoMjAxOC0xMC0xNCAwMTowODowOSkNCj4gPiBU
aGlzIG1heSBiZSB1c2VkIGJ5IGJvdGggbW1pbyBhbmQgc2N1IGNsa3MuIFNvIGxldCdzIHB1dCBp
dCBpbnRvIGENCj4gPiBjb21tb24gZmlsZS4NCj4gPg0KPiA+IENjOiBTaGF3biBHdW8gPHNoYXdu
Z3VvQGtlcm5lbC5vcmc+DQo+ID4gQ2M6IFNhc2NoYSBIYXVlciA8a2VybmVsQHBlbmd1dHJvbml4
LmRlPg0KPiA+IENjOiBGYWJpbyBFc3RldmFtIDxmYWJpby5lc3RldmFtQG54cC5jb20+DQo+ID4g
Q2M6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4NCj4gPiBDYzogTWljaGFlbCBUdXJx
dWV0dGUgPG10dXJxdWV0dGVAYmF5bGlicmUuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IERvbmcg
QWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvY2xr
L2lteC9jbGstY29tbW9uLmggIHwgMTYgKysrKysrKysrKysrKysrKw0KPiA+IGRyaXZlcnMvY2xr
L2lteC9zY3UvY2xrLXNjdS5oIHwgIDIgKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNl
cnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9pbXgvY2xrLWNv
bW1vbi5oDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvaW14L2Nsay1jb21tb24u
aA0KPiA+IGIvZHJpdmVycy9jbGsvaW14L2Nsay1jb21tb24uaCBuZXcgZmlsZSBtb2RlIDEwMDY0
NCBpbmRleA0KPiA+IDAwMDAwMDAuLmUzNjM0YTUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysr
IGIvZHJpdmVycy9jbGsvaW14L2Nsay1jb21tb24uaA0KPiA+IEBAIC0wLDAgKzEsMTYgQEANCj4g
PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArICovDQo+ID4gKy8qDQo+ID4g
KyAqIENvcHlyaWdodCAyMDE4IE5YUA0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpZm5kZWYgX19J
TVhfQ0xLX0NPTU1PTl9IDQo+ID4gKyNkZWZpbmUgX19JTVhfQ0xLX0NPTU1PTl9IDQo+ID4gKw0K
PiA+ICsjaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+DQo+ID4gKw0KPiA+ICtzdGF0aWMg
aW5saW5lIHN0cnVjdCBjbGtfaHcgKmlteF9jbGtfaHdfZml4ZWQoY29uc3QgY2hhciAqbmFtZSwg
aW50DQo+ID4gK3JhdGUpIHsNCj4gPiArICAgICAgIHJldHVybiBjbGtfaHdfcmVnaXN0ZXJfZml4
ZWRfcmF0ZShOVUxMLCBuYW1lLCBOVUxMLCAwLCByYXRlKTsNCj4gPiArfQ0KPiANCj4gV2h5IGRv
IHdlIG5lZWQgdGhpcyB3cmFwcGVyIGZpbGU/IA0KDQpUaGlzIGZpbGUgY2xrLWNvbW1vbi5oIGlz
IHVzZWQgdG8gcHV0IHRoZSBjb21tb24gYml0cyBiZXR3ZWVuIGxlZ2FjeSBjbG9ja3MgYW5kIHNj
dSBjbG9ja3MuDQpPbmx5IGlteF9jbGtfaHdfZml4ZWQoKSBpcyBhZGRlZCBpbiB0aGlzIHBhdGNo
Lg0KDQo+IEp1c3QgY2FsbCB0aGUgcmVnaXN0cmF0aW9uIGZ1bmN0aW9uIGRpcmVjdGx5DQo+IHdp
dGggdGhlIHJpZ2h0IGFyZ3VtZW50cyBpbnN0ZWFkIG9mIHdyYXBwaW5nIHRoZW0gaW4gYW5vdGhl
ciBmdW5jdGlvbiBwbGVhc2UuDQoNClRoYXQncyBsZWdhY3kgd2F5IGFuZCB3aWRlbHkgdXNlZCBi
ZWZvcmUgaW4gb3JkZXIgdG8gc2F2ZSB1bm5lY2Vzc2FyeSBwYXJhbWV0ZXJzDQpmb3IgaW14IGNs
b2Nrcy4NCmUuZy4NCmRyaXZlcnMvY2xrL2lteC9jbGsuaA0Kc3RhdGljIGlubGluZSBzdHJ1Y3Qg
Y2xrICppbXhfY2xrX2ZpeGVkKGNvbnN0IGNoYXIgKm5hbWUsIGludCByYXRlKQ0Kew0KICAgICAg
ICByZXR1cm4gY2xrX3JlZ2lzdGVyX2ZpeGVkX3JhdGUoTlVMTCwgbmFtZSwgTlVMTCwgMCwgcmF0
ZSk7DQp9DQoNCnN0YXRpYyBpbmxpbmUgc3RydWN0IGNsayAqaW14X2Nsa19kaXZpZGVyKGNvbnN0
IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIgKnBhcmVudCwNCiAgICAgICAgICAgICAgICB2b2lkIF9f
aW9tZW0gKnJlZywgdTggc2hpZnQsIHU4IHdpZHRoKQ0Kew0KICAgICAgICByZXR1cm4gY2xrX3Jl
Z2lzdGVyX2RpdmlkZXIoTlVMTCwgbmFtZSwgcGFyZW50LCBDTEtfU0VUX1JBVEVfUEFSRU5ULA0K
ICAgICAgICAgICAgICAgICAgICAgICAgcmVnLCBzaGlmdCwgd2lkdGgsIDAsICZpbXhfY2NtX2xv
Y2spOw0KfQ0KDQpJIGNhbiByZW1vdmUgaXQgaWYgeW91IGRpc2xpa2UgaXQuDQoNCkp1c3Qgb25l
IHF1ZXN0aW9uLCBpbiBsYXRlciBwYXRjaCwgYW5vdGhlciBjb21tb24gZnVuY3Rpb24gd2lsbCBh
bHNvIGJlIGFkZGVkIGhlcmU6DQpzdGF0aWMgaW5saW5lIHZvaWQgaW14X2NoZWNrX2Nsa19od3Mo
c3RydWN0IGNsa19odyAqY2xrc1tdLCB1bnNpZ25lZCBpbnQgY291bnQpDQp7DQogICAgICAgIHVu
c2lnbmVkIGludCBpOw0KDQogICAgICAgIGZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7DQog
ICAgICAgICAgICAgICAgaWYgKElTX0VSUihjbGtzW2ldKSkNCiAgICAgICAgICAgICAgICAgICAg
ICAgIHByX2VycigiaS5NWCBjbGsgJXU6IHJlZ2lzdGVyIGZhaWxlZCB3aXRoICVsZFxuIiwNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaSwgUFRSX0VSUihjbGtzW2ldKSk7IA0KICAg
ICAgICB9DQp9DQoNClNob3VsZCB3ZSByZW1vdmUgaXQgYXMgd2VsbD8NCg0KUmVnYXJkcw0KRG9u
ZyBBaXNoZW5nDQo=
