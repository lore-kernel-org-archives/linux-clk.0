Return-Path: <SRS0=L57n=6C=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3FE0C38A2E
	for <linux-clk@archiver.kernel.org>; Sat, 18 Apr 2020 12:40:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 756D121D82
	for <linux-clk@archiver.kernel.org>; Sat, 18 Apr 2020 12:40:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="DBHK5YTh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgDRMkH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 18 Apr 2020 08:40:07 -0400
Received: from mail-eopbgr40073.outbound.protection.outlook.com ([40.107.4.73]:9184
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725891AbgDRMkD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 18 Apr 2020 08:40:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iM4DnJxfuulgjznsEBb/eXXEvsHGfZ/5KWYihN1yFb2+L/7d6U4b+qxruJt5dfIvWDKCJI1n6VyAcHGreuDUnWEvzEBc9SWc8fo50rMW1QRX03XQXWRMsZ5r5jVIloMiPCpzx/tkdYokilhPTdd2iBpivhNzTgXAcqBQ5tuQwciBXEOny3Hs2WamauuhyiMS21hvWIsdYgVZ+N3i1G0gyHv3h7Iu+sIANl2NVWUdExA/J1yMMDv34TaP7tFRoihmbCPnYedQEoxY9Cv5wq6HHGIftf24vMphCKbghyYe8P/5Q2EWdxGEpXlgaIW/Co7n17doaMBbZkRAdl0o55P7Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raZdLyJ7AEjvK7ZUhNFEPfbGxSlcOhDNU8f1+hTmDtI=;
 b=Dj85z5x/19D1THUzvBp0cZ1Y5mYv2xpF8dBsl+qOJBe4kquiZHOqpJvLmZbqKIvWcruLMOWjuY5sX3BHtA62+s/Kl+H7+R/Yo5Dp+S5qHZ7vNy5wQtl7TqA39uUaKc0537d7o0NF203k7LDi+iHbDVd1jYEciPlg8MGnlxMUnLvn0srI7Ij7WlWhhQ9k7xhpgzJ0jcNYe63ZdK69d2G0oRDj2xcoo2yIQTmy/6iiTYkUF56l0tCjXI9T/1dEITguGDyLIYRC+Lcsn5zbiQrUj4c0714ASyxl5iQA1UD0yYEqsV0fczz0uIFhi+KEEVkZBDZdpwHDbxI9tu5+xtsHaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raZdLyJ7AEjvK7ZUhNFEPfbGxSlcOhDNU8f1+hTmDtI=;
 b=DBHK5YThi1F+s1BVCArH8SMC+W7NsLFcDSkoSd3KpeDvJoRJuKdPhQiWUUICCf5lIXCAwK9iwf/aAkjs4lcbaSz54+++Hj3Zb9mujBNFJKccHy5244NjlFKZIYiZI7Cgj7UE70PX3YE38tMLLdS9FyRYuZ9bCLKuX8d12bFMSQ4=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5927.eurprd04.prod.outlook.com (2603:10a6:20b:a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Sat, 18 Apr
 2020 12:39:59 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::d9f7:5527:e89d:1ae3]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::d9f7:5527:e89d:1ae3%7]) with mapi id 15.20.2921.027; Sat, 18 Apr 2020
 12:39:59 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "dongas86@hotmail.com" <dongas86@hotmail.com>,
        Oliver Graute <oliver.graute@gmail.com>
Subject: RE: [PATCH V6 00/12] clk: imx8: add new clock binding for better pm
 support
Thread-Topic: [PATCH V6 00/12] clk: imx8: add new clock binding for better pm
 support
Thread-Index: AQHV+tC4KM3qOryI0kukDYglzXuSqahJsFvwgBCTKOCAEs1BUIAR9eTw
Date:   Sat, 18 Apr 2020 12:39:59 +0000
Message-ID: <AM6PR04MB49665300C790AD797FCFC12580D60@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com>
 <AM0PR04MB42117B51ACA7E84CDB7995F380F80@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <AM6PR04MB49668F50A257A6BCD45666A380CF0@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <AM6PR04MB4966DD18256848D81E06D67880C30@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB4966DD18256848D81E06D67880C30@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [218.82.155.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e4711016-600f-40d9-1138-08d7e3959bc3
x-ms-traffictypediagnostic: AM6PR04MB5927:|AM6PR04MB5927:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB59279DCF26D42CCB0B9E8C0F80D60@AM6PR04MB5927.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0377802854
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(55016002)(9686003)(86362001)(4326008)(45080400002)(316002)(478600001)(186003)(54906003)(110136005)(2906002)(8936002)(8676002)(81156014)(52536014)(71200400001)(966005)(6506007)(26005)(76116006)(5660300002)(66446008)(7696005)(66946007)(33656002)(44832011)(66476007)(66556008)(64756008);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RAwp1ydzRNkwk2KZ6k7/dfalJrzEoAsH70dQMab12oTC658D/0DynfKvoZVYsrkWXSMJ/UnYLBkCWkKFFmyDPzTut+y4CGlKBjegy2XMn8gFMaaGtcLN89/9lHu3XX/w/9kZ5fpfLu3j69h5l6/QCgwca5NfQLj0th37qKjxxhzcNndZyfQzATnr7niObOD800R2AXu+Qk4mK+FFbMmRylE6q563bthNzcCIbNHl57MqSfZT3kv6bt5JJayqnO3gfoRUp6Z9tdBN5nMovTuBBt5n4C+cTb8UqlJ0TyDp3DOi8U06ghdOQx6rIQE3CRzA0K5XHb9xICorASae9o8SEtV2z6o9lYgjEzAfkDqm/eqfOaVC5ikzrqeaanVBN6jXQA2qdfil7Q2xb4N04Ga8mAXLs1UBESHfie0OoGMrZdN1kuecz0NY3AALdL/QRY2Rf5s5oY1pGzrp3zxIcugNzksUvivxRCKtXCHufZxmI5kkEC8WP+e4x89X7MhZbcADzQzNg0ZQDhYW9EJQIPe3Dg==
x-ms-exchange-antispam-messagedata: E69Y1aDrMiwUWqZ1lU6W/QqVdzXD6RU23xi+VrQuVNOdUreNV0Lv8Ymp5iQreode/ObWN8nfjUBMOtYRoSPBaqWVKaDU1bSt+CPXFwnQq1PebFmg2DKdUkwkM9FWFnMR97AixXcuzZ1a7Z77vDc7Uw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4711016-600f-40d9-1138-08d7e3959bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2020 12:39:59.8046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AzLrmqs2PXpmx0mDWf8p1R7KWWkjhwe6yTI5Ui2CjK6Yrm5FOcJZzIK6cuCM5xP+qJm38QQNgiJO9pLyQDKJsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5927
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

R2VudGx5IFBpbmcuLg0KVGhpcyBwYXRjaHNldCBpcyB3aXRob3V0IGNvbW1lbnRzIGZvciBhIGZl
dyBtb250aHMuDQpDb3VsZCB5b3UgaGVscCB0aGlzPw0KDQo+IEZyb206IEFpc2hlbmcgRG9uZyA8
YWlzaGVuZy5kb25nQG54cC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDcsIDIwMjAgMTA6
MjMgQU0NCj4gDQo+IFBpbmcuLi4gVGhpcyBwYXRjaHNldCBpcyBwZW5kaW5nIGZvciBxdWl0ZSBh
IGxvbmcgdGltZSB3aXRob3V0IGNvbW1lbnRzLiBJdCBhbHNvDQo+IGJsb2NrZWQgYSBsb3QgY29u
dGludWVkIHVwc3RyZWFtaW5nIHdvcmsuDQo+IEFueSBzdWdnZXN0aW9ucyBob3cgdG8gcHJvY2Vl
ZD8NCj4gDQo+IFJlZ2FyZHMNCj4gQWlzaGVuZw0KPiANCj4gPiBGcm9tOiBBaXNoZW5nIERvbmcg
PGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiA+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyNiwgMjAy
MCAxMToxNSBBTQ0KPiA+DQo+ID4gUGluZw0KPiA+DQo+ID4gPiBGcm9tOiBBaXNoZW5nIERvbmcg
PGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiA+ID4gU2VudDogU3VuZGF5LCBNYXJjaCAxNSwgMjAy
MCAxMDoxMSBQTQ0KPiA+ID4NCj4gPiA+IEhpIFN0ZXBoZW4sDQo+ID4gPg0KPiA+ID4gPiBGcm9t
OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiA+ID4gPiBTZW50OiBTdW5k
YXksIE1hcmNoIDE1LCAyMDIwIDk6NDQgUE0NCj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBwYXRjaCBz
ZXJpZXMgaXMgYSBwcmVwYXJhdGlvbiBmb3IgdGhlIE1YOCBBcmNoaXRlY3R1cmUgaW1wcm92ZW1l
bnQuDQo+ID4gPiA+IEFzIGZvciBJTVggU0NVIGJhc2VkIHBsYXRmb3JtcyBsaWtlIE1YOFFNIGFu
ZCBNWDhRWFAsIHRoZXkgYXJlDQo+ID4gPiA+IGNvbXByaXNlZCBvZiBhIGNvdXBsZSBvZiBTUyhT
dWJzeXN0ZW1zKSB3aGlsZSBtb3N0IG9mIHRoZW0gd2l0aGluDQo+ID4gPiA+IHRoZSBzYW1lIFNT
IGNhbiBiZSBzaGFyZWQuIGUuZy4gQ2xvY2tzLCBEZXZpY2VzIGFuZCBldGMuDQo+ID4gPiA+DQo+
ID4gPiA+IEhvd2V2ZXIsIGN1cnJlbnQgY2xvY2sgYmluZGluZyBpcyB1c2luZyBTVyBJRHMgZm9y
IGRldmljZSB0cmVlIHRvDQo+ID4gPiA+IHVzZSB3aGljaCBjYW4gY2F1c2UgdHJvdWJsZXMgaW4g
d3JpdGluZyB0aGUgY29tbW9uDQo+ID4gPiA+IDxzb2M+LXNzLXh4LmR0c2kgZmlsZSBmb3INCj4g
PiA+IGRpZmZlcmVudCBTb0NzLg0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIHBhdGNoIHNlcmllcyBh
aW1zIHRvIGludHJvZHVjZSBhIG5ldyBiaW5kaW5nIHdoaWNoIGlzIG1vcmUNCj4gPiA+ID4gY2xv
c2UgdG8gaGFyZHdhcmUgYW5kIHBsYXRmb3JtIGluZGVwZW5kZW50IGFuZCBjYW4gbWFrZXMgdXMg
d3JpdGUNCj4gPiA+ID4gYSBtb3JlIGdlbmVyYWwgZHJpdmVycyBmb3IgZGlmZmVyZW50IFNDVSBi
YXNlZCBTb0NzLg0KPiA+ID4gPg0KPiA+ID4gPiBBbm90aGVyIGltcG9ydGFudCB0aGluZyBpcyB0
aGF0IG9uIE1YOCwgZWFjaCBDbG9jayByZXNvdXJjZSBpcw0KPiA+ID4gPiBhc3NvY2lhdGVkIHdp
dGggYSBwb3dlciBkb21haW4uIFNvIHdlIGhhdmUgdG8gYXR0YWNoIHRoYXQgY2xvY2sNCj4gPiA+
ID4gZGV2aWNlIHRvIHRoZSBwb3dlciBkb21haW4gaW4gb3JkZXIgdG8gbWFrZSBpdCB3b3JrIHBy
b3Blcmx5Lg0KPiA+ID4gPiBGdXJ0aGVyIG1vcmUsIHRoZSBjbG9jayBzdGF0ZSB3aWxsIGJlIGxv
c3Qgd2hlbiBpdHMgcG93ZXIgZG9tYWluDQo+ID4gPiA+IGlzIGNvbXBsZXRlbHkgb2ZmIGR1cmlu
ZyBzdXNwZW5kL3Jlc3VtZSwgc28gd2UgYWxzbyBpbnRyb2R1Y2UgdGhlDQo+ID4gPiA+IGNsb2Nr
IHN0YXRlIHNhdmUmcmVzdG9yZQ0KPiA+ID4gbWVjaGFuaXNtLg0KPiA+ID4gPg0KPiA+ID4gPiBJ
dCdzIGJhc2VkIG9uIGxhdGVzdCBzaGFudy9mb3ItbmV4dCBicmFuY2guDQo+ID4gPiA+DQo+ID4g
PiA+IFRoZSB0b3AgY29tbWl0IGlzOg0KPiA+ID4gPiA0NTU5YTExZTQ4ZDUgTWVyZ2UgYnJhbmNo
ICdpbXgvZGVmY29uZmlnJyBpbnRvIGZvci1uZXh0DQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gSSBj
YXJlZnVsbHkgd2VudCB0aHJvdWdoIGFsbCB5b3VyIHJldmlldyBjb21tZW50cyBvbiBWNCBbMV0g
YW5kIGknbQ0KPiA+ID4gc3VyZSBhbGwgb2YgdGhlbSBoYXZlIGJlZW4gYWRkcmVzc2VkLg0KPiA+
ID4gQW5kIGZvciB0aGUgVjUtUmVzZW5kIHZlcnNpb24gWzJdICwgd2UgZGlkbid0IHJlY2VpdmUg
eW91ciBjb21tZW50Lg0KPiA+ID4gSXQgc2VlbXMgU2hhd24gaXMgYWxzbyB3YWl0aW5nIGZvciB5
b3VyIGZlZWRiYWNrIGZvciB0aGUgbmV4dCBzdGVwLg0KPiA+ID4gQ291bGQgeW91IGhlbHAgY2hl
Y2sgVjY/DQo+ID4gPg0KPiA+ID4gRm9yIFY2LCBvbmx5IGEgbWlub3IgdXBkYXRlIHRoYXQgYWRk
ZWQgc2N1IGNsayB1bnJlZ2lzdGVyIGlmIG1ldA0KPiA+ID4gZXJyb3IuIEFzIHRoZSBvcmlnaW5h
bCBjb2RlIGRvZXMgbm90IHN1cHBvcnQgaXQsIHNvIGkgYWRkZWQgYW4gZXh0cmENCj4gPiA+IHBh
dGNoIHRvDQo+ID4gaGFuZGxlIGl0Lg0KPiA+ID4NCj4gPiA+IFsxXQ0KPiA+ID4NCj4gPg0KPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jbGsvQU0wUFIwNE1CNDIxMTgxRTQzNzYwNzA2
MzY4OTg5MDZGODANCj4gPiA+IEExMEBBTTBQUjA0TUI0MjExLmV1cnByZDA0LnByb2Qub3V0bG9v
ay5jb20vdC8NCj4gPiA+IFsyXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2NvdmVyLzEx
MjQ4MjQ5Lw0KPiA+ID4NCj4gPiA+IFJlZ2FyZHMNCj4gPiA+IEFpc2hlbmcNCj4gPiA+DQo+ID4g
PiA+IENoYW5nZUxvZzoNCj4gPiA+ID4gdjUtPnY2Og0KPiA+ID4gPiAgKiBhZGQgc2N1IGNsayB1
bnJlZ2lzdGVyIGlmIGFkZCBwcm92aWRlciBmYWlsZWQNCj4gPiA+ID4gdjQtPnY1Og0KPiA+ID4g
PiAgKiBBZGRyZXNzIGFsbCBjb21tZW50cyBmcm9tIFN0ZXBoZW4NCj4gPiA+ID4gdjMtPnY0Og0K
PiA+ID4gPiAgKiB1c2UgY2xrLWluZGljZXMgZm9yIExQQ0cgdG8gZmV0Y2ggZWFjaCBjbGtzIG9m
ZnNldCBmcm9tIGR0DQo+ID4gPiA+IHYyLT52MzoNCj4gPiA+ID4gICogY2hhbmdlIHNjdSBjbGsg
aW50byB0d28gY2VsbHMgYmluZGluZw0KPiA+ID4gPiAgKiBhZGQgY2xrIHBtIHBhdGNoZXMgdG8g
ZWFzZSB0aGUgdW5kZXJzdGFuZCBvZiB0aGUgY2hhbmdlcw0KPiA+ID4gPiB2MS0+djI6DQo+ID4g
PiA+ICAqIFNDVSBjbG9jayBjaGFuZ2VkIHRvIG9uZSBjZWxsIGNsb2NrIGJpbmRpbmcgaW5zcGly
ZWQgYnkgYXJtLHNjcGkudHh0DQo+ID4gPiA+ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vYXJtLHNjcGkudHh0DQo+ID4gPiA+ICAqIEFkZCByZXF1aXJlZCBwb3dlciBk
b21haW4gcHJvcGVydHkNCj4gPiA+ID4gICogRHJvcHBlZCBQQVRDSCAzJjQgZmlyc3QsIHdpbGwg
c2VuZCB0aGUgdXBkYXRlZCB2ZXJzaW9uIGFjY29yZGluZ2x5DQo+ID4gPiA+ICAgIGFmdGVyIHRo
ZSBiaW5kaW5nIGlzIGZpbmFsbHkgZGV0ZXJtaW5lZCwNCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+
ID4gRG9uZyBBaXNoZW5nICgxMik6DQo+ID4gPiA+ICAgZHQtYmluZGluZ3M6IGZpcm13YXJlOiBp
bXgtc2N1OiBuZXcgYmluZGluZyB0byBwYXJzZSBjbG9ja3MgZnJvbQ0KPiA+ID4gPiAgICAgZGV2
aWNlIHRyZWUNCj4gPiA+ID4gICBkdC1iaW5kaW5nczogY2xvY2s6IGlteC1scGNnOiBhZGQgc3Vw
cG9ydCB0byBwYXJzZSBjbG9ja3MgZnJvbSBkZXZpY2UNCj4gPiA+ID4gICAgIHRyZWUNCj4gPiA+
ID4gICBjbGs6IGlteDogc2N1OiBhZGQgdHdvIGNlbGxzIGJpbmRpbmcgc3VwcG9ydA0KPiA+ID4g
PiAgIGNsazogaW14OiBzY3U6IGJ5cGFzcyBjcHUgcG93ZXIgZG9tYWlucw0KPiA+ID4gPiAgIGNs
azogaW14OiBzY3U6IGFsbG93IHNjdSBjbGsgdG8gdGFrZSBkZXZpY2UgcG9pbnRlcg0KPiA+ID4g
PiAgIGNsazogaW14OiBzY3U6IGFkZCBydW50aW1lIHBtIHN1cHBvcnQNCj4gPiA+ID4gICBjbGs6
IGlteDogc2N1OiBhZGQgc3VzcGVuZC9yZXN1bWUgc3VwcG9ydA0KPiA+ID4gPiAgIGNsazogaW14
OiBpbXg4cXhwLWxwY2c6IGFkZCBwYXJzaW5nIGNsb2NrcyBmcm9tIGRldmljZSB0cmVlDQo+ID4g
PiA+ICAgY2xrOiBpbXg6IGxwY2c6IGFsbG93IGxwY2cgY2xrIHRvIHRha2UgZGV2aWNlIHBvaW50
ZXINCj4gPiA+ID4gICBjbGs6IGlteDogY2xrLWlteDhxeHAtbHBjZzogYWRkIHJ1bnRpbWUgcG0g
c3VwcG9ydA0KPiA+ID4gPiAgIGNsazogaW14OiBscGNnOiBhZGQgc3VzcGVuZC9yZXN1bWUgc3Vw
cG9ydA0KPiA+ID4gPiAgIGNsazogaW14OiBzY3U6IHVucmVnaXN0ZXIgY2xvY2tzIGlmIGFkZCBw
cm92aWRlciBmYWlsZWQNCj4gPiA+ID4NCj4gPiA+ID4gIC4uLi9iaW5kaW5ncy9hcm0vZnJlZXNj
YWxlL2ZzbCxzY3UudHh0ICAgICAgICB8ICAxMiArLQ0KPiA+ID4gPiAgLi4uL2JpbmRpbmdzL2Ns
b2NrL2lteDhxeHAtbHBjZy50eHQgICAgICAgICAgIHwgIDM2ICsrLQ0KPiA+ID4gPiAgZHJpdmVy
cy9jbGsvaW14L2Nsay1pbXg4cXhwLWxwY2cuYyAgICAgICAgICAgIHwgMTM5ICsrKysrKysrKysr
DQo+ID4gPiA+ICBkcml2ZXJzL2Nsay9pbXgvY2xrLWlteDhxeHAuYyAgICAgICAgICAgICAgICAg
fCAxMzYgKysrKysrLS0tLS0NCj4gPiA+ID4gIGRyaXZlcnMvY2xrL2lteC9jbGstbHBjZy1zY3Uu
YyAgICAgICAgICAgICAgICB8ICA1MyArKystDQo+ID4gPiA+ICBkcml2ZXJzL2Nsay9pbXgvY2xr
LXNjdS5jICAgICAgICAgICAgICAgICAgICAgfCAyMzENCj4gPiA+ICsrKysrKysrKysrKysrKysr
LQ0KPiA+ID4gPiAgZHJpdmVycy9jbGsvaW14L2Nsay1zY3UuaCAgICAgICAgICAgICAgICAgICAg
IHwgIDU2ICsrKystDQo+ID4gPiA+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2lteDgtbHBj
Zy5oICAgICAgICAgfCAgMTQgKysNCj4gPiA+ID4gIGluY2x1ZGUvZHQtYmluZGluZ3MvZmlybXdh
cmUvaW14L3JzcmMuaCAgICAgICB8ICAyMyArKw0KPiA+ID4gPiAgOSBmaWxlcyBjaGFuZ2VkLCA2
MTAgaW5zZXJ0aW9ucygrKSwgOTAgZGVsZXRpb25zKC0pICBjcmVhdGUgbW9kZQ0KPiA+ID4gPiAx
MDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9pbXg4LWxwY2cuaA0KPiA+ID4gPg0KPiA+
ID4gPiAtLQ0KPiA+ID4gPiAyLjIzLjANCg0K
