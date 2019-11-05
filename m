Return-Path: <SRS0=Glxp=Y5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEA5CA9ECF
	for <linux-clk@archiver.kernel.org>; Tue,  5 Nov 2019 10:04:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C99112190F
	for <linux-clk@archiver.kernel.org>; Tue,  5 Nov 2019 10:04:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="GzeeLfd6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730699AbfKEKEZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Nov 2019 05:04:25 -0500
Received: from mail-eopbgr30068.outbound.protection.outlook.com ([40.107.3.68]:65358
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730571AbfKEKEZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 Nov 2019 05:04:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JShYW5tCyDKa0mVCaCY8gRoFKLqKuOXvVgT1f6Kjk235M2iaDpAHvN6X45KqqxtcdkoSkSupPsrGWcTiiW6334mzyCF0uLqaL2x9sLMCydDd7uovGV4e6QihwbPTxDoHDbjbceJb869o8fGogTaaDCLVWaAucNzLW7PwweyCmSyeVNjrgjKREZZzASKPK02CZxkZ5sO2WiFtNX01HEo1EBW7fE8hlwRW0r4wUaENSWz0JuDGhpgD/6Te+ziMLfuEMbwbAtmS/1AjRoRMS4idx+NLJJzGlrc+3WuDwj4GOApUH/s6u75v6vXA7UPm9fPeEG77cU56zZ0TqAO0yec5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7DJgdwZvma5Kt2IERTx97PHw09SHyxhlqv71znHz9g=;
 b=FGevoTS+igaTmDTXIJtAic7ewbwatsUd+JRi4dpZG57Q6A7tviQPnJViQaibW/NloJMEizu4lG8+/mzVYXFfMInHlcokZT0R/6hOKQawUndyh/CR8FC/Y3gZVOnUOGI/mhakZh5FGe0afZeCKboe4mgv+mfGDZ1ncPe0H61JINGjcdWFFU8ULjEujEDWw329TXZiSPR9EOswFZWmAU0dihGVx96C3xOi3D012JShrBtZKllUuN61gItvkAfOblTedpK9wWkrDs0YeqKxTZoNpACg10JEv3wmJb/Wf+2ROKbgcJqah66vo0bpZEIbzugGuXfmSUDS2owWjFkYtajGYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7DJgdwZvma5Kt2IERTx97PHw09SHyxhlqv71znHz9g=;
 b=GzeeLfd6y8ZlblWbVvx40ux5daxgnmzy7AAyB5wPmjudkd47yynezrUEUXwoPaNHlcJzn+/q+y0MkHD+DEoVDS4UKA/O75D5XzqQ79Eugb8lyCSoA4hyIyS4wcFFpMRVtu59m9Vdm7O6T4IZrAEqNIx+QCnpEQfwi9Ul8B3ChTI=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5156.eurprd04.prod.outlook.com (20.177.42.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 10:04:22 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 10:04:21 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
CC:     Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] clk: imx: pll14xx: initialize flags to 0
Thread-Topic: [PATCH] clk: imx: pll14xx: initialize flags to 0
Thread-Index: AQHVk6mXpyRie0JbfEaM7Eg+PLW60ad8VNgAgAABuPA=
Date:   Tue, 5 Nov 2019 10:04:21 +0000
Message-ID: <AM0PR04MB4481010CA9D3672F55208092887E0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1572938372-7006-1-git-send-email-peng.fan@nxp.com>
 <5fc2dfd6-ae59-6af8-0423-ddc8e0b4f78f@free.fr>
In-Reply-To: <5fc2dfd6-ae59-6af8-0423-ddc8e0b4f78f@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 12507ae2-c688-4d42-0432-08d761d787c4
x-ms-traffictypediagnostic: AM0PR04MB5156:
x-ms-exchange-purlcount: 5
x-microsoft-antispam-prvs: <AM0PR04MB515640A188637CE49E5EAF7F887E0@AM0PR04MB5156.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(51914003)(189003)(199004)(4326008)(76116006)(66946007)(86362001)(6306002)(7736002)(9686003)(478600001)(6246003)(99286004)(54906003)(71200400001)(71190400001)(316002)(55016002)(44832011)(476003)(486006)(446003)(11346002)(14444005)(256004)(305945005)(74316002)(6116002)(52536014)(6916009)(2906002)(25786009)(186003)(66476007)(45080400002)(33656002)(66066001)(26005)(14454004)(66556008)(229853002)(966005)(66446008)(64756008)(6436002)(5660300002)(7696005)(8936002)(8676002)(81156014)(76176011)(81166006)(53546011)(6506007)(102836004)(3846002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5156;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IF+06+Wqb4xdXHW1SQWL7uNVGdYYAegZYwqLnB2H6i2ZbTP8R3Ta0Be64wsmvB4npeXgSzITKpQBr8pqYomGNqWUj9mvUZWV2FhNQS2Vq5TGunOEhuEv4aIsQjw+9XRv/taJ+SpsuHPLGMw5uuE4F3NvwX/09pWwCFHXOCoDuTMuxrVeDcG1l7pH1SUsyVvtKrNkG81Nk3RJ4J6Xe7CvKX0AWaZVV3SVmO5Iu71mAUvkBzLmdwV+A2r3/19DElVck8Sn1aXlYSem11sLsphdeHfb5nmq7AXcSuK4neAeWTYpTfQEZMXkH1kX7nm39A6sKwjDUGyaJPsO3Cosmf59joyM2NVqF4w9n91ixrNinrQRl7gdj2KUr9XGZkA3KyCGHmMg5W/GIsZBNljWfzjY4Sns0rpDYShvjOy1pi1jBtBdVHTQrC/3b0r6AVNSjbgmTqYug2tJkxuzPH+J2Ty4GtwihgwcyagFLqBTa7RJpxc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12507ae2-c688-4d42-0432-08d761d787c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 10:04:21.8418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ne8SfVnWlDhZ5Wm71qazNaPP61UdPPkg6CLsjXkKTaL0FzjiNZLCbQg7vf9eR5x2AE/BQxfbkv2lKdTTxw3L7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5156
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBjbGs6IGlteDogcGxsMTR4eDogaW5pdGlhbGl6ZSBmbGFn
cyB0byAwDQo+IA0KPiBPbiAwNS8xMS8yMDE5IDA4OjIxLCBQZW5nIEZhbiB3cm90ZToNCj4gDQo+
ID4gRnJvbTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+ID4NCj4gPiBpbml0LmZsYWdz
IGlzIGluaXRpYWxpemVkIHdpdGggdmFsdWUgZnJvbSBwbGxfY2xrLT5mbGFncywgaG93ZXZlcg0K
PiA+IGlteF8xNDQzeF9wbGwgYW5kIGlteF8xNDE2eF9wbGwgYXJlIG5vdCBzdGF0aWMgc3RydWN0
dXJlLCBzbyBmbGFncw0KPiA+IG1pZ2h0IGJlIHJhbmRvbSB2YWx1ZS4gU28gbGV0J3MgaW5pdGlh
bGl6ZSBmbGFncyBhcyAwIG5vdy4NCj4gDQo+IFRoaXMgaXMgaW5jb3JyZWN0LiBXaGVuIHVzaW5n
IGFuIGluaXRpYWxpemVyIGxpc3QsIHN0cnVjdCBtZW1iZXJzIG5vdCBleHBsaWNpdGx5DQo+IHNw
ZWNpZmllZCBhcmUgaW5pdGlhbGl6ZWQgdG8gMC4NCj4gDQo+IGh0dHBzOi8vZXVyMDEuc2FmZWxp
bmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwczolMkYlMkZwb3J0NzAubmV0DQo+
ICUyRn5uc3olMkZjJTJGYzExJTJGbjE1NzAuaHRtbCUyMzYuNy45cDE5JmFtcDtkYXRhPTAyJTdD
MDElN0MNCj4gcGVuZy5mYW4lNDBueHAuY29tJTdDYTk0MzU2NzAwZDljNGY2MTYxNGEwOGQ3NjFk
NTM5MzYlN0M2ODZlYTENCj4gZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMSU3QzYz
NzA4NTQ0MDcxNzUxNjk5NiZhbXA7cw0KPiBkYXRhPWNVUW1YemRiYUs2b1pxV3RKYzNWbmgwRkpC
RDF2MWIlMkZKcWI0bFJQaXM1dyUzRCZhbXA7cmVzZQ0KPiBydmVkPTANCj4gDQo+ID4gVGhlIGlu
aXRpYWxpemF0aW9uIHNoYWxsIG9jY3VyIGluIGluaXRpYWxpemVyIGxpc3Qgb3JkZXIsIGVhY2gN
Cj4gPiBpbml0aWFsaXplciBwcm92aWRlZCBmb3IgYSBwYXJ0aWN1bGFyIHN1Ym9iamVjdCBvdmVy
cmlkaW5nIGFueQ0KPiA+IHByZXZpb3VzbHkgbGlzdGVkIGluaXRpYWxpemVyIGZvciB0aGUgc2Ft
ZSBzdWJvYmplY3Q7IGFsbCBzdWJvYmplY3RzDQo+ID4gdGhhdCBhcmUgbm90IGluaXRpYWxpemVk
IGV4cGxpY2l0bHkgc2hhbGwgYmUgaW5pdGlhbGl6ZWQgaW1wbGljaXRseQ0KPiA+IHRoZSBzYW1l
IGFzIG9iamVjdHMgdGhhdCBoYXZlIHN0YXRpYyBzdG9yYWdlIGR1cmF0aW9uLg0KPiAoWW91IG1p
Z2h0IHBvaW50IG91dCB0aGF0IHRoZSBrZXJuZWwgaXMgY29tcGlsZWQgd2l0aCAtc3RkPWdudTg5
IG5vdCBDMTEsIGJ1dA0KPiBHQ0MncyBzZW1hbnRpY3MgYXJlIHRoZSBzYW1lLikNCj4gDQo+IGh0
dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUz
QSUyRiUyRmdjYy5nbg0KPiB1Lm9yZyUyRm9ubGluZWRvY3MlMkZnY2MlMkZEZXNpZ25hdGVkLUlu
aXRzLmh0bWwlMjNEZXNpZ25hdGVkLUluaXRzJmENCj4gbXA7ZGF0YT0wMiU3QzAxJTdDcGVuZy5m
YW4lNDBueHAuY29tJTdDYTk0MzU2NzAwZDljNGY2MTYxNGEwOGQNCj4gNzYxZDUzOTM2JTdDNjg2
ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMSU3QzYzNzA4NQ0KPiA0NDA3MTc1
MTY5OTYmYW1wO3NkYXRhPW5zaUxFJTJCOTFsZloxNXpKdHZnOEQ4bkpiSXBLSmtQeWFvS0J0bU1v
YQ0KPiBBd1ElM0QmYW1wO3Jlc2VydmVkPTANCg0KVGhhbmtzIGZvciB0aGUgaW5mby4NCg0KTXkg
dW5kZXJzdGFuZGluZyBpcyB3cm9uZy4NClRoZSBwYXRjaCB3YXMgaW5pdGlhbGx5IHRyeSB0byBh
ZGRyZXNzIHdoYXQgWzFdIGRpZC4NCkluIFsxXSwgc3RhdGljIHdhcyBkaXNjYXJkZWQgYW5kIG1v
dmVkIHRvIGEgY29tbW9uIHBsYWNlLg0KU28gSSB0aG91Z2h0IGZsYWdzIHNob3VsZCBiZSBpbml0
aWFsaXplZCBhcyAwLg0KDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9pbXgvY2xr
LXBsbDE0eHguYw0KPiA+IGIvZHJpdmVycy9jbGsvaW14L2Nsay1wbGwxNHh4LmMgaW5kZXggZmE3
NmUwNDI1MWM0Li5hN2YxYzFhYmU2NjQNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2Ns
ay9pbXgvY2xrLXBsbDE0eHguYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL2lteC9jbGstcGxsMTR4
eC5jDQo+ID4gQEAgLTY1LDEyICs2NSwxNCBAQCBzdHJ1Y3QgaW14X3BsbDE0eHhfY2xrIGlteF8x
NDQzeF9wbGwgPSB7DQo+ID4gIAkudHlwZSA9IFBMTF8xNDQzWCwNCj4gPiAgCS5yYXRlX3RhYmxl
ID0gaW14X3BsbDE0NDN4X3RibCwNCj4gPiAgCS5yYXRlX2NvdW50ID0gQVJSQVlfU0laRShpbXhf
cGxsMTQ0M3hfdGJsKSwNCj4gPiArCS5mbGFncyA9IDAsDQo+ID4gIH07DQo+IA0KPiBXaGF0IHRy
ZWUgaXMgdGhpcyBwYXRjaCBiYXNlZCBvbj8NCg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvc2hhd25ndW8vbGludXguZ2l0L2xvZy8/aD1mb3ItbmV4dA0K
DQpbMV0NCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3No
YXduZ3VvL2xpbnV4LmdpdC9jb21taXQvP2g9Zm9yLW5leHQmaWQ9NDNjZGFhMTU2N2FkMzkzMWZi
ZGU0Mzg4NTM5NDdkNDUyMzhjYzA0MA0KDQpUaGFua3MsDQpQZW5nLg0KDQo+IA0KPiBodHRwczov
L2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYl
MkZlbGl4aXIuYg0KPiBvb3RsaW4uY29tJTJGbGludXglMkZ2NS40LXJjMSUyRnNvdXJjZSUyRmRy
aXZlcnMlMkZjbGslMkZpbXglMkZjbGstcA0KPiBsbDE0eHguYyUyM0w2NSZhbXA7ZGF0YT0wMiU3
QzAxJTdDcGVuZy5mYW4lNDBueHAuY29tJTdDYTk0MzU2NzANCj4gMGQ5YzRmNjE2MTRhMDhkNzYx
ZDUzOTM2JTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MNCj4gMCU3QzElN0M2
MzcwODU0NDA3MTc1MTY5OTYmYW1wO3NkYXRhPWZQZWFDSlFLc2RXWktWRzQzMUtOTDh2DQo+IGhx
VDB5MlRVTU1udGYxQzY2WU5nJTNEJmFtcDtyZXNlcnZlZD0wDQo+IA0KPiBSZWdhcmRzLg0K
