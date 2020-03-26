Return-Path: <SRS0=aVCd=5L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A381C2D0E7
	for <linux-clk@archiver.kernel.org>; Thu, 26 Mar 2020 03:14:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5CF3A2074D
	for <linux-clk@archiver.kernel.org>; Thu, 26 Mar 2020 03:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="DmBNhcfP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbgCZDOg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Mar 2020 23:14:36 -0400
Received: from mail-eopbgr80059.outbound.protection.outlook.com ([40.107.8.59]:19332
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727560AbgCZDOg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 25 Mar 2020 23:14:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Py09iXliDRLe4heP3HsBYxyWC0+m8Dg7bCPNtSG923JNsoLG1Ey20kjQ4hb2F10Zn3ADN9GxTKUhVb++yql8FJzrCdGem/Wgplmrow7CmrGaNLbi3WHPnF4I1w2zb7qWJ+xa8F4UhOkqZPcHNEdHZ76iUbvxoEuKbq9EVn1ei+OMpgUNuSCzB4S5sczhr7tSy41D2tHfbfatjn4QRvIV0gDfQe9Edg6O+MKo3o5MGGtz8P0kkuK7LYMSC4nVSfBGNkMEa9G9dZu9683YiQsR/ZOIU45YrAFTb2elPurkxgANrXM66z7REpmyC/hOnySfaq5RWi6PhZsWV8qYqXAi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UWy0DCUFxvXHFi4mcIuowKmMN6OH+WNMubNgz7KXOw=;
 b=Sztizhpp8b3F6IpQA5q0QUSNzHGKh3fgk1r0ZnYmzi0gnqmBChBamfsxVTKVPncUWut8QeLXFFLYVOLCpkG1RZmB+u/xpKKxSSQHu76PN6qDkFwxaZkYLNmOZHjJ8SgLiSkaacTY7LI7pG5SxZpRHbcHwvA9Pc55ttVmcbYsjznHlju9jAha76erZBlCXKsJBXQ2Ew/rW3zvWCH+K/7xxLXnpKknJfLI+SOHkP0wGj4aEkycKmRDRIPfD2+fAYn/llV3GCnxFlTkDpL4zXBrhuwZ1lX8brvbTGojlR02ec+eyoe5wCSY9gqaXRCBpYH33P6U9ujKEjSeH08kUdZLwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UWy0DCUFxvXHFi4mcIuowKmMN6OH+WNMubNgz7KXOw=;
 b=DmBNhcfPjVWzNhfPF4gkA6vHYt/QPwLDPIl6P9uFsqZlAlCYEFjpxFdUfWr4vLRRbb0M7UbBuCf9OEcS0xFYkufqp4ga82nicoHCXPG8RsTq4uhNhZTUxwIjhLH0LTJj9/p9FNa8NNIEMKp0F4g9Y7jmlrnYcZAy0Na++Kc/wvQ=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (20.177.32.142) by
 AM6PR04MB4407.eurprd04.prod.outlook.com (20.177.39.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Thu, 26 Mar 2020 03:14:30 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::d9f7:5527:e89d:1ae3]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::d9f7:5527:e89d:1ae3%7]) with mapi id 15.20.2856.018; Thu, 26 Mar 2020
 03:14:30 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "dongas86@hotmail.com" <dongas86@hotmail.com>,
        Oliver Graute <oliver.graute@gmail.com>
Subject: RE: [PATCH V6 00/12] clk: imx8: add new clock binding for better pm
 support
Thread-Topic: [PATCH V6 00/12] clk: imx8: add new clock binding for better pm
 support
Thread-Index: AQHV+tC4KM3qOryI0kukDYglzXuSqahJsFvwgBCTKOA=
Date:   Thu, 26 Mar 2020 03:14:30 +0000
Message-ID: <AM6PR04MB49668F50A257A6BCD45666A380CF0@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com>
 <AM0PR04MB42117B51ACA7E84CDB7995F380F80@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB42117B51ACA7E84CDB7995F380F80@AM0PR04MB4211.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b39b0dbc-546d-43d4-677a-08d7d133cce8
x-ms-traffictypediagnostic: AM6PR04MB4407:|AM6PR04MB4407:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB4407E6BDAA98F08CDF1BFDDF80CF0@AM6PR04MB4407.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(54906003)(316002)(110136005)(5660300002)(52536014)(81156014)(81166006)(71200400001)(8676002)(8936002)(86362001)(7696005)(4326008)(6506007)(66476007)(33656002)(478600001)(9686003)(45080400002)(186003)(966005)(44832011)(55016002)(26005)(66556008)(64756008)(66446008)(2906002)(66946007)(76116006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR04MB4407;H:AM6PR04MB4966.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hntqeBiu3Xqa596uSg/SzmIuyLBJYw4qyHbIwAuSsdINqqNt954dfY9Z86nAjalAYFunqKguQ4dkSEGMQPm3sO/WSff27pNztQAuipJDZc2axD+I4zttSv9W1hxSTW3Cl4cETmot8IBq0a13nx54ZN5SGQr0MJ2NTSkPd5Ke7RB8MszoXgR6tb3tIJGS4WoRXEa7LWC1rtPmc6V5YCEncgV2Sm0vJipH9zzSS6LM5GTTKwpRvAPrdgDfylYbuRSfqBYuNJB27ARlcceteBMsR8f0HOIsqYdCQBhiqy5O5tesMwx6tTiqlIs79T1/bSRxT4e17HQDaQfbdQnhwrPKMYiJDiZG3zn9Hd2+Y9T70AFvIdFlBeuVWfCbL3EaA+kRGK0IAeaqeKCiBALKVvteqn5Y0GE8ubrqiF2QbUgRpNRghIpnGhtnoQi+tF80KLQqLn00cigXgatXAKq+eDYy8pB72+V2Qivr31lwlDTXjtEmMvLy8nJ6X6rllH/U5fXhLrOGfuSY6fXfE//yvQlJ0g==
x-ms-exchange-antispam-messagedata: c1kgjkf0wkxa7ZN9DO1xuc+KmnD8FGJkz6vGLeKtyzrtCrEVMjg0AXrzKR/mD3qngVOFxoCtRRcrv4mybPuLnGWPVQ7wuM1ai2Wv5RZU4NPb++nx0YM9YC6EKK8Sfvxz5XhxZmM9KBygsLwFz2tjPw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b39b0dbc-546d-43d4-677a-08d7d133cce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 03:14:30.6930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e+Ywl9Lm5LiTIRgDFZhcI2AQO0RsEN1CmTc66aza4DbHNRqKDh5+lJJm6Oe3Q3zyvTCnWPn2t4JQBmEbuCxbdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4407
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

UGluZw0KDQo+IEZyb206IEFpc2hlbmcgRG9uZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQo+IFNl
bnQ6IFN1bmRheSwgTWFyY2ggMTUsIDIwMjAgMTA6MTEgUE0NCj4gDQo+IEhpIFN0ZXBoZW4sDQo+
IA0KPiA+IEZyb206IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQo+ID4gU2Vu
dDogU3VuZGF5LCBNYXJjaCAxNSwgMjAyMCA5OjQ0IFBNDQo+ID4NCj4gPiBUaGlzIHBhdGNoIHNl
cmllcyBpcyBhIHByZXBhcmF0aW9uIGZvciB0aGUgTVg4IEFyY2hpdGVjdHVyZSBpbXByb3ZlbWVu
dC4NCj4gPiBBcyBmb3IgSU1YIFNDVSBiYXNlZCBwbGF0Zm9ybXMgbGlrZSBNWDhRTSBhbmQgTVg4
UVhQLCB0aGV5IGFyZQ0KPiA+IGNvbXByaXNlZCBvZiBhIGNvdXBsZSBvZiBTUyhTdWJzeXN0ZW1z
KSB3aGlsZSBtb3N0IG9mIHRoZW0gd2l0aGluIHRoZQ0KPiA+IHNhbWUgU1MgY2FuIGJlIHNoYXJl
ZC4gZS5nLiBDbG9ja3MsIERldmljZXMgYW5kIGV0Yy4NCj4gPg0KPiA+IEhvd2V2ZXIsIGN1cnJl
bnQgY2xvY2sgYmluZGluZyBpcyB1c2luZyBTVyBJRHMgZm9yIGRldmljZSB0cmVlIHRvIHVzZQ0K
PiA+IHdoaWNoIGNhbiBjYXVzZSB0cm91YmxlcyBpbiB3cml0aW5nIHRoZSBjb21tb24gPHNvYz4t
c3MteHguZHRzaSBmaWxlIGZvcg0KPiBkaWZmZXJlbnQgU29Dcy4NCj4gPg0KPiA+IFRoaXMgcGF0
Y2ggc2VyaWVzIGFpbXMgdG8gaW50cm9kdWNlIGEgbmV3IGJpbmRpbmcgd2hpY2ggaXMgbW9yZSBj
bG9zZQ0KPiA+IHRvIGhhcmR3YXJlIGFuZCBwbGF0Zm9ybSBpbmRlcGVuZGVudCBhbmQgY2FuIG1h
a2VzIHVzIHdyaXRlIGEgbW9yZQ0KPiA+IGdlbmVyYWwgZHJpdmVycyBmb3IgZGlmZmVyZW50IFND
VSBiYXNlZCBTb0NzLg0KPiA+DQo+ID4gQW5vdGhlciBpbXBvcnRhbnQgdGhpbmcgaXMgdGhhdCBv
biBNWDgsIGVhY2ggQ2xvY2sgcmVzb3VyY2UgaXMNCj4gPiBhc3NvY2lhdGVkIHdpdGggYSBwb3dl
ciBkb21haW4uIFNvIHdlIGhhdmUgdG8gYXR0YWNoIHRoYXQgY2xvY2sgZGV2aWNlDQo+ID4gdG8g
dGhlIHBvd2VyIGRvbWFpbiBpbiBvcmRlciB0byBtYWtlIGl0IHdvcmsgcHJvcGVybHkuIEZ1cnRo
ZXIgbW9yZSwNCj4gPiB0aGUgY2xvY2sgc3RhdGUgd2lsbCBiZSBsb3N0IHdoZW4gaXRzIHBvd2Vy
IGRvbWFpbiBpcyBjb21wbGV0ZWx5IG9mZg0KPiA+IGR1cmluZyBzdXNwZW5kL3Jlc3VtZSwgc28g
d2UgYWxzbyBpbnRyb2R1Y2UgdGhlIGNsb2NrIHN0YXRlIHNhdmUmcmVzdG9yZQ0KPiBtZWNoYW5p
c20uDQo+ID4NCj4gPiBJdCdzIGJhc2VkIG9uIGxhdGVzdCBzaGFudy9mb3ItbmV4dCBicmFuY2gu
DQo+ID4NCj4gPiBUaGUgdG9wIGNvbW1pdCBpczoNCj4gPiA0NTU5YTExZTQ4ZDUgTWVyZ2UgYnJh
bmNoICdpbXgvZGVmY29uZmlnJyBpbnRvIGZvci1uZXh0DQo+ID4NCj4gDQo+IEkgY2FyZWZ1bGx5
IHdlbnQgdGhyb3VnaCBhbGwgeW91ciByZXZpZXcgY29tbWVudHMgb24gVjQgWzFdIGFuZCBpJ20g
c3VyZSBhbGwgb2YNCj4gdGhlbSBoYXZlIGJlZW4gYWRkcmVzc2VkLg0KPiBBbmQgZm9yIHRoZSBW
NS1SZXNlbmQgdmVyc2lvbiBbMl0gLCB3ZSBkaWRuJ3QgcmVjZWl2ZSB5b3VyIGNvbW1lbnQuDQo+
IEl0IHNlZW1zIFNoYXduIGlzIGFsc28gd2FpdGluZyBmb3IgeW91ciBmZWVkYmFjayBmb3IgdGhl
IG5leHQgc3RlcC4NCj4gQ291bGQgeW91IGhlbHAgY2hlY2sgVjY/DQo+IA0KPiBGb3IgVjYsIG9u
bHkgYSBtaW5vciB1cGRhdGUgdGhhdCBhZGRlZCBzY3UgY2xrIHVucmVnaXN0ZXIgaWYgbWV0IGVy
cm9yLiBBcyB0aGUNCj4gb3JpZ2luYWwgY29kZSBkb2VzIG5vdCBzdXBwb3J0IGl0LCBzbyBpIGFk
ZGVkIGFuIGV4dHJhIHBhdGNoIHRvIGhhbmRsZSBpdC4NCj4gDQo+IFsxXQ0KPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1jbGsvQU0wUFIwNE1CNDIxMTgxRTQzNzYwNzA2MzY4OTg5MDZG
ODANCj4gQTEwQEFNMFBSMDRNQjQyMTEuZXVycHJkMDQucHJvZC5vdXRsb29rLmNvbS90Lw0KPiBb
Ml0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTI0ODI0OS8NCj4gDQo+IFJl
Z2FyZHMNCj4gQWlzaGVuZw0KPiANCj4gPiBDaGFuZ2VMb2c6DQo+ID4gdjUtPnY2Og0KPiA+ICAq
IGFkZCBzY3UgY2xrIHVucmVnaXN0ZXIgaWYgYWRkIHByb3ZpZGVyIGZhaWxlZA0KPiA+IHY0LT52
NToNCj4gPiAgKiBBZGRyZXNzIGFsbCBjb21tZW50cyBmcm9tIFN0ZXBoZW4NCj4gPiB2My0+djQ6
DQo+ID4gICogdXNlIGNsay1pbmRpY2VzIGZvciBMUENHIHRvIGZldGNoIGVhY2ggY2xrcyBvZmZz
ZXQgZnJvbSBkdA0KPiA+IHYyLT52MzoNCj4gPiAgKiBjaGFuZ2Ugc2N1IGNsayBpbnRvIHR3byBj
ZWxscyBiaW5kaW5nDQo+ID4gICogYWRkIGNsayBwbSBwYXRjaGVzIHRvIGVhc2UgdGhlIHVuZGVy
c3RhbmQgb2YgdGhlIGNoYW5nZXMNCj4gPiB2MS0+djI6DQo+ID4gICogU0NVIGNsb2NrIGNoYW5n
ZWQgdG8gb25lIGNlbGwgY2xvY2sgYmluZGluZyBpbnNwaXJlZCBieSBhcm0sc2NwaS50eHQNCj4g
PiAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FybSxzY3BpLnR4dA0K
PiA+ICAqIEFkZCByZXF1aXJlZCBwb3dlciBkb21haW4gcHJvcGVydHkNCj4gPiAgKiBEcm9wcGVk
IFBBVENIIDMmNCBmaXJzdCwgd2lsbCBzZW5kIHRoZSB1cGRhdGVkIHZlcnNpb24gYWNjb3JkaW5n
bHkNCj4gPiAgICBhZnRlciB0aGUgYmluZGluZyBpcyBmaW5hbGx5IGRldGVybWluZWQsDQo+ID4N
Cj4gPg0KPiA+IERvbmcgQWlzaGVuZyAoMTIpOg0KPiA+ICAgZHQtYmluZGluZ3M6IGZpcm13YXJl
OiBpbXgtc2N1OiBuZXcgYmluZGluZyB0byBwYXJzZSBjbG9ja3MgZnJvbQ0KPiA+ICAgICBkZXZp
Y2UgdHJlZQ0KPiA+ICAgZHQtYmluZGluZ3M6IGNsb2NrOiBpbXgtbHBjZzogYWRkIHN1cHBvcnQg
dG8gcGFyc2UgY2xvY2tzIGZyb20gZGV2aWNlDQo+ID4gICAgIHRyZWUNCj4gPiAgIGNsazogaW14
OiBzY3U6IGFkZCB0d28gY2VsbHMgYmluZGluZyBzdXBwb3J0DQo+ID4gICBjbGs6IGlteDogc2N1
OiBieXBhc3MgY3B1IHBvd2VyIGRvbWFpbnMNCj4gPiAgIGNsazogaW14OiBzY3U6IGFsbG93IHNj
dSBjbGsgdG8gdGFrZSBkZXZpY2UgcG9pbnRlcg0KPiA+ICAgY2xrOiBpbXg6IHNjdTogYWRkIHJ1
bnRpbWUgcG0gc3VwcG9ydA0KPiA+ICAgY2xrOiBpbXg6IHNjdTogYWRkIHN1c3BlbmQvcmVzdW1l
IHN1cHBvcnQNCj4gPiAgIGNsazogaW14OiBpbXg4cXhwLWxwY2c6IGFkZCBwYXJzaW5nIGNsb2Nr
cyBmcm9tIGRldmljZSB0cmVlDQo+ID4gICBjbGs6IGlteDogbHBjZzogYWxsb3cgbHBjZyBjbGsg
dG8gdGFrZSBkZXZpY2UgcG9pbnRlcg0KPiA+ICAgY2xrOiBpbXg6IGNsay1pbXg4cXhwLWxwY2c6
IGFkZCBydW50aW1lIHBtIHN1cHBvcnQNCj4gPiAgIGNsazogaW14OiBscGNnOiBhZGQgc3VzcGVu
ZC9yZXN1bWUgc3VwcG9ydA0KPiA+ICAgY2xrOiBpbXg6IHNjdTogdW5yZWdpc3RlciBjbG9ja3Mg
aWYgYWRkIHByb3ZpZGVyIGZhaWxlZA0KPiA+DQo+ID4gIC4uLi9iaW5kaW5ncy9hcm0vZnJlZXNj
YWxlL2ZzbCxzY3UudHh0ICAgICAgICB8ICAxMiArLQ0KPiA+ICAuLi4vYmluZGluZ3MvY2xvY2sv
aW14OHF4cC1scGNnLnR4dCAgICAgICAgICAgfCAgMzYgKystDQo+ID4gIGRyaXZlcnMvY2xrL2lt
eC9jbGstaW14OHF4cC1scGNnLmMgICAgICAgICAgICB8IDEzOSArKysrKysrKysrKw0KPiA+ICBk
cml2ZXJzL2Nsay9pbXgvY2xrLWlteDhxeHAuYyAgICAgICAgICAgICAgICAgfCAxMzYgKysrKysr
LS0tLS0NCj4gPiAgZHJpdmVycy9jbGsvaW14L2Nsay1scGNnLXNjdS5jICAgICAgICAgICAgICAg
IHwgIDUzICsrKy0NCj4gPiAgZHJpdmVycy9jbGsvaW14L2Nsay1zY3UuYyAgICAgICAgICAgICAg
ICAgICAgIHwgMjMxDQo+ICsrKysrKysrKysrKysrKysrLQ0KPiA+ICBkcml2ZXJzL2Nsay9pbXgv
Y2xrLXNjdS5oICAgICAgICAgICAgICAgICAgICAgfCAgNTYgKysrKy0NCj4gPiAgaW5jbHVkZS9k
dC1iaW5kaW5ncy9jbG9jay9pbXg4LWxwY2cuaCAgICAgICAgIHwgIDE0ICsrDQo+ID4gIGluY2x1
ZGUvZHQtYmluZGluZ3MvZmlybXdhcmUvaW14L3JzcmMuaCAgICAgICB8ICAyMyArKw0KPiA+ICA5
IGZpbGVzIGNoYW5nZWQsIDYxMCBpbnNlcnRpb25zKCspLCA5MCBkZWxldGlvbnMoLSkgIGNyZWF0
ZSBtb2RlDQo+ID4gMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svaW14OC1scGNnLmgN
Cj4gPg0KPiA+IC0tDQo+ID4gMi4yMy4wDQoNCg==
