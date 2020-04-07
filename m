Return-Path: <SRS0=wIso=5X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3000C2BA1A
	for <linux-clk@archiver.kernel.org>; Tue,  7 Apr 2020 02:23:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D5D2206C0
	for <linux-clk@archiver.kernel.org>; Tue,  7 Apr 2020 02:23:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="SKyYjatf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgDGCXX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Apr 2020 22:23:23 -0400
Received: from mail-vi1eur05on2057.outbound.protection.outlook.com ([40.107.21.57]:46657
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726287AbgDGCXW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 6 Apr 2020 22:23:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VArUZl9C+Cr+7T81ooLN7Sj/KN48FNB6IzMvNdEC7IW9MZsHOTzpemumsFvHKkF61QV8RMWUnfZBKWp6/lLwBJnKLLC03SdYfRftusIAmV3Rj/aE0QTx6JtncNWQr/Xfh93r8B6mewgy7v2UuuJYU9/KpIhuVhhhg2uDlxI1w261Se3/+4+GyXyy+UotctfQCchS4FlegASzCM3TzDx3QZlmVfVJMXjwxjFNZIuLvqa+daCW3p/TP5UnAOwnlVmouXAkPZfdzS+7p0C/IzM0ghQWlMPsW1GvzDyo4fzt6kcACea5ZQAZrF/I5Zs1hHI8xHkPt2EUzbq5POp8/wb+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIZkhIyKk5ox/80Xey5wUWMvrUVVoWzYwPtarAtCNrg=;
 b=n/HR9Ouhziu0B5uEeq9AYSTgjkalRsdaEZrIINef3H6OXcDQirHS5gPu735w2IksRp5xiySj8qpKQNo4E6PRa9AAZhH3FBfKqal0AyO0yDqsdC3vbGmq+qQER6Ejkna4aj/HM/5tl6NhdpZ6qGVfFTf30Np9fnc3SNcHrFPlQEqU720c125lUA8mTOf0YbeNncDENwZ5ZudsGW++yxwoEy/tPcaekEIQPxLde6WXtEfxsQajAL7Rl/g/kywPvHfXMmkzohJh1y2nPG4UedfF7bhVaU2NrktWcwEcqHlMyKUfJQJXMkgtlGotK2peAMHm2OgjTOVb6t5ky/KhNmduJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIZkhIyKk5ox/80Xey5wUWMvrUVVoWzYwPtarAtCNrg=;
 b=SKyYjatfwNTDxjy/uUXSG8uYYOjlnF2sqimxmNXyyV7uX/5ikjgpTxjAjeCeaHeGhYKdz5ynVcfn1YNDsCNKWqOHO1Fla7OOk3wreatF2Lyih7x5sGNwDCCWJQWbFIYg9V7oqI/w3qShIDdBpdwbG1hwOq0mJCRxi6D0Ogo8en4=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB4504.eurprd04.prod.outlook.com (2603:10a6:20b:19::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Tue, 7 Apr
 2020 02:23:17 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::d9f7:5527:e89d:1ae3]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::d9f7:5527:e89d:1ae3%7]) with mapi id 15.20.2878.018; Tue, 7 Apr 2020
 02:23:17 +0000
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
Thread-Index: AQHV+tC4KM3qOryI0kukDYglzXuSqahJsFvwgBCTKOCAEs1BUA==
Date:   Tue, 7 Apr 2020 02:23:17 +0000
Message-ID: <AM6PR04MB4966DD18256848D81E06D67880C30@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com>
 <AM0PR04MB42117B51ACA7E84CDB7995F380F80@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <AM6PR04MB49668F50A257A6BCD45666A380CF0@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB49668F50A257A6BCD45666A380CF0@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [218.82.155.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 09ee1ed1-5bce-42d8-46e3-08d7da9aa211
x-ms-traffictypediagnostic: AM6PR04MB4504:|AM6PR04MB4504:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB450452F6020BF16EA79D360A80C30@AM6PR04MB4504.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(366004)(396003)(39850400004)(136003)(346002)(376002)(4326008)(44832011)(26005)(33656002)(45080400002)(2906002)(71200400001)(5660300002)(55016002)(186003)(86362001)(110136005)(9686003)(8936002)(66556008)(81166006)(316002)(7696005)(8676002)(64756008)(76116006)(6506007)(66946007)(66476007)(54906003)(966005)(81156014)(66446008)(478600001)(52536014);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t1iJPx1V5u0XbqHXiu8XCIteapN7I530GEK0/lpTEHJCbdWBKWCaotl10VlwYrLjtApIFV7KismQpkfh+5nVR9OxUi8jwpnaqL6cZmf5eO8I9hb/dNDG+dqZen1T7AqODubVb8wev99DKOmyBBWKT6SHM3X6scTBDUzpowsg8XTcoApC/yIGnfz/0uR5V+RF14kYcHcikOlareHU/E0EKVFrYmcaHd1C8at1E+gUS711YFYXbVbO5fZC6+oPW+UUpncbdBUgQ1+7GI1g6BCIiDuPkW3gRPouO+fH1F2tmE42eRiIKi2SDGzr9U5h2+GU9CZ7ako2qoXNE0+m/Zn+zHigTUli7ewcjttJqLJjPfJC4Pgr6Vfwwp+U2z+FFjn5Y/B2mtIzUcOZSd9hms6aZiiO9iPtJXlPSxn4V+7QsMOu15xao+R63TRWYkfFW7T3NASm56kqYGS47baF49auH9tE4RelA9/WaEQeSnAE1jazyBSW4hdxZcBt7XF1oUsS9KQFsTEi1IFFnAkdouaV2A==
x-ms-exchange-antispam-messagedata: 5d3fbekp8G2fzSgneJ9iYNXMchbD8dhNOGXdlaAZVAaTqLW4xpCOAkGbvV7KuiJ5Oxdft35cO14mNaIfmcjchUVasCv9SiUr/PTulO6tyCmqUrulbY20Bv3kZ8Hwf+4QJ9hhN+0EhmKIxcABFlHalQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ee1ed1-5bce-42d8-46e3-08d7da9aa211
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2020 02:23:17.3925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z9zMjTbJlUFg4S+4qYYGhbYlYpc1cDDhMMAe1AlvBwHNIa0Tjh3HEDI3GaheZduHdrukwi3ykveXH852n/9lGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4504
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

UGluZy4uLiBUaGlzIHBhdGNoc2V0IGlzIHBlbmRpbmcgZm9yIHF1aXRlIGEgbG9uZyB0aW1lIHdp
dGhvdXQgY29tbWVudHMuIEl0IGFsc28gYmxvY2tlZCBhIGxvdCBjb250aW51ZWQgdXBzdHJlYW1p
bmcgd29yay4NCkFueSBzdWdnZXN0aW9ucyBob3cgdG8gcHJvY2VlZD8NCg0KUmVnYXJkcw0KQWlz
aGVuZw0KDQo+IEZyb206IEFpc2hlbmcgRG9uZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQo+IFNl
bnQ6IFRodXJzZGF5LCBNYXJjaCAyNiwgMjAyMCAxMToxNSBBTQ0KPiANCj4gUGluZw0KPiANCj4g
PiBGcm9tOiBBaXNoZW5nIERvbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiA+IFNlbnQ6IFN1
bmRheSwgTWFyY2ggMTUsIDIwMjAgMTA6MTEgUE0NCj4gPg0KPiA+IEhpIFN0ZXBoZW4sDQo+ID4N
Cj4gPiA+IEZyb206IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQo+ID4gPiBT
ZW50OiBTdW5kYXksIE1hcmNoIDE1LCAyMDIwIDk6NDQgUE0NCj4gPiA+DQo+ID4gPiBUaGlzIHBh
dGNoIHNlcmllcyBpcyBhIHByZXBhcmF0aW9uIGZvciB0aGUgTVg4IEFyY2hpdGVjdHVyZSBpbXBy
b3ZlbWVudC4NCj4gPiA+IEFzIGZvciBJTVggU0NVIGJhc2VkIHBsYXRmb3JtcyBsaWtlIE1YOFFN
IGFuZCBNWDhRWFAsIHRoZXkgYXJlDQo+ID4gPiBjb21wcmlzZWQgb2YgYSBjb3VwbGUgb2YgU1Mo
U3Vic3lzdGVtcykgd2hpbGUgbW9zdCBvZiB0aGVtIHdpdGhpbg0KPiA+ID4gdGhlIHNhbWUgU1Mg
Y2FuIGJlIHNoYXJlZC4gZS5nLiBDbG9ja3MsIERldmljZXMgYW5kIGV0Yy4NCj4gPiA+DQo+ID4g
PiBIb3dldmVyLCBjdXJyZW50IGNsb2NrIGJpbmRpbmcgaXMgdXNpbmcgU1cgSURzIGZvciBkZXZp
Y2UgdHJlZSB0bw0KPiA+ID4gdXNlIHdoaWNoIGNhbiBjYXVzZSB0cm91YmxlcyBpbiB3cml0aW5n
IHRoZSBjb21tb24gPHNvYz4tc3MteHguZHRzaQ0KPiA+ID4gZmlsZSBmb3INCj4gPiBkaWZmZXJl
bnQgU29Dcy4NCj4gPiA+DQo+ID4gPiBUaGlzIHBhdGNoIHNlcmllcyBhaW1zIHRvIGludHJvZHVj
ZSBhIG5ldyBiaW5kaW5nIHdoaWNoIGlzIG1vcmUNCj4gPiA+IGNsb3NlIHRvIGhhcmR3YXJlIGFu
ZCBwbGF0Zm9ybSBpbmRlcGVuZGVudCBhbmQgY2FuIG1ha2VzIHVzIHdyaXRlIGENCj4gPiA+IG1v
cmUgZ2VuZXJhbCBkcml2ZXJzIGZvciBkaWZmZXJlbnQgU0NVIGJhc2VkIFNvQ3MuDQo+ID4gPg0K
PiA+ID4gQW5vdGhlciBpbXBvcnRhbnQgdGhpbmcgaXMgdGhhdCBvbiBNWDgsIGVhY2ggQ2xvY2sg
cmVzb3VyY2UgaXMNCj4gPiA+IGFzc29jaWF0ZWQgd2l0aCBhIHBvd2VyIGRvbWFpbi4gU28gd2Ug
aGF2ZSB0byBhdHRhY2ggdGhhdCBjbG9jaw0KPiA+ID4gZGV2aWNlIHRvIHRoZSBwb3dlciBkb21h
aW4gaW4gb3JkZXIgdG8gbWFrZSBpdCB3b3JrIHByb3Blcmx5Lg0KPiA+ID4gRnVydGhlciBtb3Jl
LCB0aGUgY2xvY2sgc3RhdGUgd2lsbCBiZSBsb3N0IHdoZW4gaXRzIHBvd2VyIGRvbWFpbiBpcw0K
PiA+ID4gY29tcGxldGVseSBvZmYgZHVyaW5nIHN1c3BlbmQvcmVzdW1lLCBzbyB3ZSBhbHNvIGlu
dHJvZHVjZSB0aGUgY2xvY2sNCj4gPiA+IHN0YXRlIHNhdmUmcmVzdG9yZQ0KPiA+IG1lY2hhbmlz
bS4NCj4gPiA+DQo+ID4gPiBJdCdzIGJhc2VkIG9uIGxhdGVzdCBzaGFudy9mb3ItbmV4dCBicmFu
Y2guDQo+ID4gPg0KPiA+ID4gVGhlIHRvcCBjb21taXQgaXM6DQo+ID4gPiA0NTU5YTExZTQ4ZDUg
TWVyZ2UgYnJhbmNoICdpbXgvZGVmY29uZmlnJyBpbnRvIGZvci1uZXh0DQo+ID4gPg0KPiA+DQo+
ID4gSSBjYXJlZnVsbHkgd2VudCB0aHJvdWdoIGFsbCB5b3VyIHJldmlldyBjb21tZW50cyBvbiBW
NCBbMV0gYW5kIGknbQ0KPiA+IHN1cmUgYWxsIG9mIHRoZW0gaGF2ZSBiZWVuIGFkZHJlc3NlZC4N
Cj4gPiBBbmQgZm9yIHRoZSBWNS1SZXNlbmQgdmVyc2lvbiBbMl0gLCB3ZSBkaWRuJ3QgcmVjZWl2
ZSB5b3VyIGNvbW1lbnQuDQo+ID4gSXQgc2VlbXMgU2hhd24gaXMgYWxzbyB3YWl0aW5nIGZvciB5
b3VyIGZlZWRiYWNrIGZvciB0aGUgbmV4dCBzdGVwLg0KPiA+IENvdWxkIHlvdSBoZWxwIGNoZWNr
IFY2Pw0KPiA+DQo+ID4gRm9yIFY2LCBvbmx5IGEgbWlub3IgdXBkYXRlIHRoYXQgYWRkZWQgc2N1
IGNsayB1bnJlZ2lzdGVyIGlmIG1ldA0KPiA+IGVycm9yLiBBcyB0aGUgb3JpZ2luYWwgY29kZSBk
b2VzIG5vdCBzdXBwb3J0IGl0LCBzbyBpIGFkZGVkIGFuIGV4dHJhIHBhdGNoIHRvDQo+IGhhbmRs
ZSBpdC4NCj4gPg0KPiA+IFsxXQ0KPiA+DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LWNsay9BTTBQUjA0TUI0MjExODFFNDM3NjA3MDYzNjg5ODkwNkY4MA0KPiA+IEExMEBBTTBQUjA0
TUI0MjExLmV1cnByZDA0LnByb2Qub3V0bG9vay5jb20vdC8NCj4gPiBbMl0gaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTI0ODI0OS8NCj4gPg0KPiA+IFJlZ2FyZHMNCj4gPiBB
aXNoZW5nDQo+ID4NCj4gPiA+IENoYW5nZUxvZzoNCj4gPiA+IHY1LT52NjoNCj4gPiA+ICAqIGFk
ZCBzY3UgY2xrIHVucmVnaXN0ZXIgaWYgYWRkIHByb3ZpZGVyIGZhaWxlZA0KPiA+ID4gdjQtPnY1
Og0KPiA+ID4gICogQWRkcmVzcyBhbGwgY29tbWVudHMgZnJvbSBTdGVwaGVuDQo+ID4gPiB2My0+
djQ6DQo+ID4gPiAgKiB1c2UgY2xrLWluZGljZXMgZm9yIExQQ0cgdG8gZmV0Y2ggZWFjaCBjbGtz
IG9mZnNldCBmcm9tIGR0DQo+ID4gPiB2Mi0+djM6DQo+ID4gPiAgKiBjaGFuZ2Ugc2N1IGNsayBp
bnRvIHR3byBjZWxscyBiaW5kaW5nDQo+ID4gPiAgKiBhZGQgY2xrIHBtIHBhdGNoZXMgdG8gZWFz
ZSB0aGUgdW5kZXJzdGFuZCBvZiB0aGUgY2hhbmdlcw0KPiA+ID4gdjEtPnYyOg0KPiA+ID4gICog
U0NVIGNsb2NrIGNoYW5nZWQgdG8gb25lIGNlbGwgY2xvY2sgYmluZGluZyBpbnNwaXJlZCBieSBh
cm0sc2NwaS50eHQNCj4gPiA+ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vYXJtLHNjcGkudHh0DQo+ID4gPiAgKiBBZGQgcmVxdWlyZWQgcG93ZXIgZG9tYWluIHByb3Bl
cnR5DQo+ID4gPiAgKiBEcm9wcGVkIFBBVENIIDMmNCBmaXJzdCwgd2lsbCBzZW5kIHRoZSB1cGRh
dGVkIHZlcnNpb24gYWNjb3JkaW5nbHkNCj4gPiA+ICAgIGFmdGVyIHRoZSBiaW5kaW5nIGlzIGZp
bmFsbHkgZGV0ZXJtaW5lZCwNCj4gPiA+DQo+ID4gPg0KPiA+ID4gRG9uZyBBaXNoZW5nICgxMik6
DQo+ID4gPiAgIGR0LWJpbmRpbmdzOiBmaXJtd2FyZTogaW14LXNjdTogbmV3IGJpbmRpbmcgdG8g
cGFyc2UgY2xvY2tzIGZyb20NCj4gPiA+ICAgICBkZXZpY2UgdHJlZQ0KPiA+ID4gICBkdC1iaW5k
aW5nczogY2xvY2s6IGlteC1scGNnOiBhZGQgc3VwcG9ydCB0byBwYXJzZSBjbG9ja3MgZnJvbSBk
ZXZpY2UNCj4gPiA+ICAgICB0cmVlDQo+ID4gPiAgIGNsazogaW14OiBzY3U6IGFkZCB0d28gY2Vs
bHMgYmluZGluZyBzdXBwb3J0DQo+ID4gPiAgIGNsazogaW14OiBzY3U6IGJ5cGFzcyBjcHUgcG93
ZXIgZG9tYWlucw0KPiA+ID4gICBjbGs6IGlteDogc2N1OiBhbGxvdyBzY3UgY2xrIHRvIHRha2Ug
ZGV2aWNlIHBvaW50ZXINCj4gPiA+ICAgY2xrOiBpbXg6IHNjdTogYWRkIHJ1bnRpbWUgcG0gc3Vw
cG9ydA0KPiA+ID4gICBjbGs6IGlteDogc2N1OiBhZGQgc3VzcGVuZC9yZXN1bWUgc3VwcG9ydA0K
PiA+ID4gICBjbGs6IGlteDogaW14OHF4cC1scGNnOiBhZGQgcGFyc2luZyBjbG9ja3MgZnJvbSBk
ZXZpY2UgdHJlZQ0KPiA+ID4gICBjbGs6IGlteDogbHBjZzogYWxsb3cgbHBjZyBjbGsgdG8gdGFr
ZSBkZXZpY2UgcG9pbnRlcg0KPiA+ID4gICBjbGs6IGlteDogY2xrLWlteDhxeHAtbHBjZzogYWRk
IHJ1bnRpbWUgcG0gc3VwcG9ydA0KPiA+ID4gICBjbGs6IGlteDogbHBjZzogYWRkIHN1c3BlbmQv
cmVzdW1lIHN1cHBvcnQNCj4gPiA+ICAgY2xrOiBpbXg6IHNjdTogdW5yZWdpc3RlciBjbG9ja3Mg
aWYgYWRkIHByb3ZpZGVyIGZhaWxlZA0KPiA+ID4NCj4gPiA+ICAuLi4vYmluZGluZ3MvYXJtL2Zy
ZWVzY2FsZS9mc2wsc2N1LnR4dCAgICAgICAgfCAgMTIgKy0NCj4gPiA+ICAuLi4vYmluZGluZ3Mv
Y2xvY2svaW14OHF4cC1scGNnLnR4dCAgICAgICAgICAgfCAgMzYgKystDQo+ID4gPiAgZHJpdmVy
cy9jbGsvaW14L2Nsay1pbXg4cXhwLWxwY2cuYyAgICAgICAgICAgIHwgMTM5ICsrKysrKysrKysr
DQo+ID4gPiAgZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4cXhwLmMgICAgICAgICAgICAgICAgIHwg
MTM2ICsrKysrKy0tLS0tDQo+ID4gPiAgZHJpdmVycy9jbGsvaW14L2Nsay1scGNnLXNjdS5jICAg
ICAgICAgICAgICAgIHwgIDUzICsrKy0NCj4gPiA+ICBkcml2ZXJzL2Nsay9pbXgvY2xrLXNjdS5j
ICAgICAgICAgICAgICAgICAgICAgfCAyMzENCj4gPiArKysrKysrKysrKysrKysrKy0NCj4gPiA+
ICBkcml2ZXJzL2Nsay9pbXgvY2xrLXNjdS5oICAgICAgICAgICAgICAgICAgICAgfCAgNTYgKysr
Ky0NCj4gPiA+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2lteDgtbHBjZy5oICAgICAgICAg
fCAgMTQgKysNCj4gPiA+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Zpcm13YXJlL2lteC9yc3JjLmgg
ICAgICAgfCAgMjMgKysNCj4gPiA+ICA5IGZpbGVzIGNoYW5nZWQsIDYxMCBpbnNlcnRpb25zKCsp
LCA5MCBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlDQo+ID4gPiAxMDA2NDQgaW5jbHVkZS9kdC1i
aW5kaW5ncy9jbG9jay9pbXg4LWxwY2cuaA0KPiA+ID4NCj4gPiA+IC0tDQo+ID4gPiAyLjIzLjAN
Cg0K
