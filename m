Return-Path: <SRS0=eW+W=6T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A99C47254
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 14:06:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A26B92073B
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 14:06:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ic+shoHH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729245AbgEEOGI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 May 2020 10:06:08 -0400
Received: from mail-eopbgr00041.outbound.protection.outlook.com ([40.107.0.41]:51185
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728707AbgEEOGH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 May 2020 10:06:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cw42XBvn29zREiDsx2uh4BjkNLDa2/JUmvFl7C6IFuWw8v7H+OwCM4k64mG/EwY0/2GalSvFu9Dg7AEgiSeNNGRm0Jvtl0PENeVUwNFVvdR2HuZ9tOB/dA/REM1lomXnZX/ZLQkW0ECuDg8x+F8k8M/up+8lgidq/91SvAdWsYh8cQii3K7ADMYOSsqVy4y1ASGoGJM18tFLnfC7RCP0FEE7hHVmqqT9kTP7omF7sFxcT57v8UfwnXr2tg/5Uk98s4Gb/+qeWMZ3FxDAw2cZjdjcACkLFJDqyj+txkdX1JbHl/xMbQQ5bZpbrcR0Z/xHzrY9qaM7gINB6iiRwzVs2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFjvzKVwkEi0j4fd/jk1xoDQaM0N2zLvvvisYYUEEzs=;
 b=X2w+H6P+zMiDJoxBQrNCg03ZghkBeRr9g+yRoLVQ1oLUw7pTkRzRfnep5HKQW9sqPEZO5M6NvDAHhmLk6Oz0uxy3k6zqIVGrBymF1a/1wGTbyRECosIXrud+YKGtXNRjg5FgtC8W0Jsd/Kedm1maYYyda0EShM7zKixlwURAMdwLTkzn7Z+G2UtK/X49TUiObgnDHrjsQZeFkEFFKNy1FyUus/ORl1kM3hpxSxJ59aHNoAOZ200peAhBjkaFyNLrE6W4JBXSALrynvTcFiokUhOkhSgsGkgj6X5gc+6u8TZHkI7sgwfuIrs+rkdYZAJ2zyUTlYNSifQdUtBpPkkD3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFjvzKVwkEi0j4fd/jk1xoDQaM0N2zLvvvisYYUEEzs=;
 b=ic+shoHHq8DQO8UWomqjNM/uZmJFzh0DVhWKbnmxeUGxvVTZDCDXFAYbh58EIFQrNgbhdl7+jENqtKVZ3Mn9AZubZo1L+z9oVSoFic8BhENJXZfX0NYU7KN5i3xqiWlLjm2m7MjIqAiUX0OkGwoFsqOmvC4/BU6D2ntJkXsfiqE=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB6296.eurprd04.prod.outlook.com (2603:10a6:20b:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Tue, 5 May
 2020 14:06:02 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d%7]) with mapi id 15.20.2958.030; Tue, 5 May 2020
 14:06:02 +0000
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
Subject: RE: [PATCH V6 12/12] clk: imx: scu: unregister clocks if add provider
 failed
Thread-Topic: [PATCH V6 12/12] clk: imx: scu: unregister clocks if add
 provider failed
Thread-Index: AQHV+tC+vsm/wd8oDkW8576X8SB3wKiZPUeAgACX0PA=
Date:   Tue, 5 May 2020 14:06:02 +0000
Message-ID: <AM6PR04MB4966682F98CC23AF175D3F0C80A70@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com>
 <1584279836-29825-13-git-send-email-aisheng.dong@nxp.com>
 <158865455360.11125.17297772155388824388@swboyd.mtv.corp.google.com>
In-Reply-To: <158865455360.11125.17297772155388824388@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [218.82.155.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fc85eda7-bf6e-4a5d-820b-08d7f0fd71d6
x-ms-traffictypediagnostic: AM6PR04MB6296:|AM6PR04MB6296:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB629695BE35E57EFC7EE071DD80A70@AM6PR04MB6296.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0394259C80
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mUYkQgPlVF5JbuMUNeltQ7OnfF9Ib55VqzDy9SlaAnPa7qGb9ammjVhwoQ3bcq6KAU+Jdhj9bQM+6qT1D03WJOGPWW4LTE91OHVrocyH3AoIslCdy77OssNL5YCpC4Y8e4MqinTDI+GW3OHeikv5ziyNIXZZtiYiVTZaaFk75ZB1Zs9oYEK9F8n7g9q2xetnN0U92F+oeD+7CBIYkQe2s1k0tlroJeV7m+QDA5kzM9Uvz77njTBTQwLfwI4dqHWt2yU7GIRmR8G5tlKKVDekOZ0xoc3SeelHFIOzXshlivJRgGoHE/3OYZNAkndv+J22tUwaif3fKTk0kS6rzY5QYTPw/gd9TufaEPOzE3hfh5G/8S6LavGaOR35Xfd9gdmv+blhE3u6i8eKbpbqrsUcnx+PxuXzEd17dQnt9QI6NBACiWKInLKeKUl6hKxTpQeqetSxzdAWCONVtdYJB+iZuFKAMGLmJKxx2ZP9KMW+HjlHVuxp1C9ltSphtC58K3f/R1sipw1Oah8K0Q4UMHj++A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(33430700001)(498600001)(86362001)(66556008)(76116006)(5660300002)(66476007)(66446008)(4326008)(54906003)(64756008)(110136005)(33440700001)(8676002)(44832011)(71200400001)(6506007)(66946007)(9686003)(2906002)(55016002)(8936002)(7696005)(26005)(186003)(33656002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: EDbMZy+jTOL3kTz5y0bB3qI+asUPjum9wuyLe+KK2lFr/T2iSbn0kYvDDtGeJSv3ydN7HONoOrJuG9s9Z8LNg3GV5fZv6JwVgBZWb0EFVPkG4PD5TMy5xbiLubyZaJ/YffSaibvLqXWnbJNVieW7oqd/XRlUmw0E/7bITVgIfqitzWDwsPhpGyFr1r+feyEEBYKQvN6nMQ05HgcJUXZtpCb2B1l6Iq4efs8FpvQdDSRGbYLxJ/pJIiw0wenGiF8U6qtRYMbjkdA4rDzNUBULJb4m23HPJIxoySOSWHfK7SlnA387/Quo3CWsU7BukLXML5HMxPzyDhGEdi56PboPezEi5jFl//aG4kkje7FOZIg5WVZJ5EsVHM3l86B83pCOm9UaafUmLdPWUKvs8J0JQ6hjgLtl+5YQ/Mn5FMa21j/BgHk07QvJ5rwPo5as8QvYGtzHWFr7cOHTsljwF2mhFA8gfYQggRD0zeWWMNXwIcOdRIJHZ5OiTV0xVqt2bttV0xklFsaRHMNUA51jehlZNHvEWYD0sQ3HVgYOdVPSLKGTapn1r2IIOA1g7JTABjqbQdS4i2u5VIiBvfWtlXBbjqwKfbPxgGOKwW2GZgnMcMOd/ziI0VNiPbvFHMQfOLao8aTjd1VUa8EvUc5q9xlWTSys0npt2pf54CKoGQbM4+IvaLdIX0Jz5tJDSxhcCbUsY5AnPaxlN46c1p9LU6kQr4CrahWA+G+yIWHFoUJ+y5n5np0p8ntbMpfYJ2SeXdBHtySVPYU3LrRg2ds0CpX6acQoMklvKABl84kJPP/fmYQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc85eda7-bf6e-4a5d-820b-08d7f0fd71d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2020 14:06:02.2370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pR3s4qEEblfpIi2+F4pah1Yz6MivHIx4k9RNdDyGm1U9+enAOtP4K0B7LKRNmUzVR6ngLfvjMaBWIuxrYcrQow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6296
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXks
IE1heSA1LCAyMDIwIDEyOjU2IFBNDQo+IA0KPiBRdW90aW5nIERvbmcgQWlzaGVuZyAoMjAyMC0w
My0xNSAwNjo0Mzo1NikNCj4gPiBVbnJlZ2lzdGVyIGNsb2NrcyBpZiBhZGQgcHJvdmlkZXIgZmFp
bGVkDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0Bu
eHAuY29tPg0KPiA+DQo+ID4gLS0tDQo+IA0KPiBXaHkgaXNuJ3QgdGhpcyBzcXVhc2hlZCBpbiB0
byB3aGVyZSBpdCdzIG5lZWRlZD8NCg0KVGhlcmUgd2VyZSB0d28gcmVhc29uczoNCjEuIFRoZSBv
cmlnaW5hbCBjb2RlIGFsc28gaGFzIHRoZSBpc3N1ZSwgc28gSSB0aG91Z2h0IG1heWJlIEl0IGNv
dWxkIGJlDQphbiBleHRyYSBmaXggcGF0Y2guDQoyLiBJdCBzYXZlZCBzb21lIHJlYmFzZSBjb25m
bGljdHMuDQoNCkJ1dCBhbnl3YXksIGlmIHlvdSdkIGxpa2UgdG8gc2VlIGl0IHdhcyBzcXVhc2hl
ZCwgSSBjYW4gZG8gaXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiA+IENoYW5nZUxvZzoNCj4g
PiB2NjogbmV3IHBhdGNoDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvY2xrL2lteC9jbGstaW14OHF4
cC5jIHwgMTEgKysrKysrKysrLS0NCj4gPiAgZHJpdmVycy9jbGsvaW14L2Nsay1zY3UuYyAgICAg
fCAxMyArKysrKysrKysrKysrDQo+ID4gIGRyaXZlcnMvY2xrL2lteC9jbGstc2N1LmggICAgIHwg
IDIgKysNCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2lteC9jbGstaW14OHF4cC5j
DQo+ID4gYi9kcml2ZXJzL2Nsay9pbXgvY2xrLWlteDhxeHAuYyBpbmRleCAyZWMzZTBjNDc0OWQu
LmU2MTUyMTQ0OTVjMA0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL2lteC9jbGst
aW14OHF4cC5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4cXhwLmMNCj4gPiBA
QCAtMTM4LDEwICsxMzgsMTcgQEAgc3RhdGljIGludCBpbXg4cXhwX2Nsa19wcm9iZShzdHJ1Y3QN
Cj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaSwgUFRSX0VSUihjbGtzW2ldKSk7DQo+ID4gICAgICAgICB9DQo+ID4NCj4gPiAtICAg
ICAgIGlmIChjbGtfY2VsbHMgPT0gMikNCj4gPiArICAgICAgIGlmIChjbGtfY2VsbHMgPT0gMikg
ew0KPiA+ICAgICAgICAgICAgICAgICByZXQgPSBvZl9jbGtfYWRkX2h3X3Byb3ZpZGVyKGNjbV9u
b2RlLA0KPiBpbXhfc2N1X29mX2Nsa19zcmNfZ2V0LCBpbXhfc2N1X2Nsa3MpOw0KPiA+IC0gICAg
ICAgZWxzZQ0KPiA+ICsgICAgICAgICAgICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGlteF9jbGtfc2N1X3VucmVnaXN0ZXIoKTsNCj4gPiArICAgICAgIH0gZWxzZSB7
DQo+ID4gKyAgICAgICAgICAgICAgIC8qDQo+ID4gKyAgICAgICAgICAgICAgICAqIE5PVEU6IHdl
IGRpZCBub3QgdW5yZWdpc3RlciBjbG9ja3MgZm9yIHRoZSBsZWdhY3kgd2F5DQo+IGNhdXNlDQo+
ID4gKyAgICAgICAgICAgICAgICAqIGl0IHdpbGwgYmUgcmVtb3ZlZCBsYXRlci4NCj4gDQo+IEkg
Z290IGNvbmZ1c2VkIHdoYXQgJ2l0JyB3YXMuIEkgdGhpbmsgaXQncyB0aGUgbGVnYWN5IHdheSBl
bnRpcmVseS4NCj4gTWF5YmUgc2F5ICJsZWdhY3kgYmluZGluZyBjb2RlIHBhdGggZG9lc24ndCB1
bnJlZ2lzdGVyIGhlcmUgYmVjYXVzZS4uLiINCg0KVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4N
Ckkgd2lsbCBjaGFuZ2UgdG8gdXNlIHlvdXIgdmVyc2lvbiDwn5iKDQoNClJlZ2FyZHMNCkFpc2hl
bmcNCg0KPiANCj4gPiArICAgICAgICAgICAgICAgICovDQo+ID4gICAgICAgICAgICAgICAgIHJl
dCA9IG9mX2Nsa19hZGRfaHdfcHJvdmlkZXIoY2NtX25vZGUsDQo+ID4gb2ZfY2xrX2h3X29uZWNl
bGxfZ2V0LCBjbGtfZGF0YSk7DQo+ID4gKyAgICAgICB9DQo+ID4NCj4gPiAgICAgICAgIHJldHVy
biByZXQ7DQo+ID4gIH0NCg==
