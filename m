Return-Path: <SRS0=Ewk5=EF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400E4C4363A
	for <linux-clk@archiver.kernel.org>; Fri, 30 Oct 2020 03:22:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4E6F206F4
	for <linux-clk@archiver.kernel.org>; Fri, 30 Oct 2020 03:22:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="YkUUz1JU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgJ3DWi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Oct 2020 23:22:38 -0400
Received: from mail-eopbgr70072.outbound.protection.outlook.com ([40.107.7.72]:13766
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725928AbgJ3DWh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 29 Oct 2020 23:22:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Be0fX0OxC+3PVU5a07LP9cq3IxOhLLXS6SAeAfKHlD67y53c/dHr/MAWWMRZ873iOuUbtRC+BgzZZhOaDJRJL/TOrAyx2awXuoEM/WLolH1vZ6X1MUY17+leFB2OAfB0PX4EOxDruGi89AW1MqTlVhlmc4boRnSroabadjEvJ37G4SmXKK3eKNpX3uUKr3sZkqdRtgUnxeayfx4yI1ZdkmWCfovKJH7I2mVMXRl/ZUlYD63jr8IzRwoBgUagvF57LJLuzBl5mDvrDwGICMvoRAqWEoLD1o0qv2wYF3xJk2a/LAwb5dywLSxNIBHKGKxRyDqVSz+SxJPJgYwUxfysKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdsTGZzbp73AJI00X6u6qzl+BaG/wSoKU4KO3q9ypeI=;
 b=eoEtc36Z3K+3xpTeuayw9oRISLTDQwWyeLofWQACye+o+avcNi092QLxNxOTHebHYBkHK70IFXVFOkUTZeVxaJAGCSBuHsASMzAB4+hsrZfZ+nufPLm+O9QxEGXGPDFKvJVrbKqIw8RpPqfZH/beiTgnFSdOBJG/3LiASsY4vGU5DlZyTFouYhvf2RVIRDTG2Cq9MvAxUrcF0PnBPqj8eGr6gx3TRVfkbYGavhHU5sJkdBq0RoH5T5Iy56AoQsi21JEBAFEHdVnzLi0zlIBLzJpmMWlcSiIVw0VnOutq+powNBR0387SxFeEyySx/pV/8Ba5EOBBHbNnPsQxksjmZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdsTGZzbp73AJI00X6u6qzl+BaG/wSoKU4KO3q9ypeI=;
 b=YkUUz1JUN4nDB6/QduTlDYAz3nVzGH4TcGOgNbjtIHJhFjX9qpSgjY7sEGH4Yyn+lWwjFnQE5MtxdJyDYv9wG9a9KjX5fmg9NVMezhOUVD7huVj6H/eNcHQ9P4o9B2XOi9jOzPZfsJfhmFGfgjpHBCRI6PprIQiHql8jkMa1lYs=
Received: from VI1PR04MB4975.eurprd04.prod.outlook.com (2603:10a6:803:5f::14)
 by VI1PR04MB4736.eurprd04.prod.outlook.com (2603:10a6:803:5d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Fri, 30 Oct
 2020 03:22:20 +0000
Received: from VI1PR04MB4975.eurprd04.prod.outlook.com
 ([fe80::19b7:8e74:4d3:3acf]) by VI1PR04MB4975.eurprd04.prod.outlook.com
 ([fe80::19b7:8e74:4d3:3acf%6]) with mapi id 15.20.3499.028; Fri, 30 Oct 2020
 03:22:20 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v7 03/11] clk: imx: scu: add two cells binding support
Thread-Topic: [PATCH v7 03/11] clk: imx: scu: add two cells binding support
Thread-Index: AQHWZX7rE4vC1Bdnl0Suy+3LMSN1jqmv5qsAgAAl/LA=
Date:   Fri, 30 Oct 2020 03:22:19 +0000
Message-ID: <VI1PR04MB497553625BE304915979C92080150@VI1PR04MB4975.eurprd04.prod.outlook.com>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
 <1596009618-25516-4-git-send-email-aisheng.dong@nxp.com>
 <20201030010600.GA2760@Ryzen-9-3900X.localdomain>
In-Reply-To: <20201030010600.GA2760@Ryzen-9-3900X.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2428792f-531f-4510-7936-08d87c8302ab
x-ms-traffictypediagnostic: VI1PR04MB4736:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB47361113D57F8D54C928445480150@VI1PR04MB4736.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fswa9SJ25rdU5b/w2al1rZoOzhd0fdW+SJ7pJSmgnuM8Y7gGq9ZYoj6PqIpJ/Wl2mU/7Bvtc7vdjhQzrsWd3BLocOYqZpmlAyOYKzNOHVDE6vaeBvoRw6/lDYUUVpL7gooLrhNh3Ii04WTeFTBLMSO9gRD023TGRtpIr0v5LFjDFyRlneHeKvj0RQlGPwWAKrZmGlkO9NqUGa6NpVLFyIuEhIxL7Gsr2jaTJfKw7NV81Ul7RArQmis9qOwRfisa8Y2aXIMqtF7pQ2HuZ1mHuRaznBdf+xINhptG0Xd92eP2OBtpaPsPyKgnHxcjvC8Je3aDE4eryeJpjkHbQN7Z6cQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4975.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(186003)(26005)(76116006)(55016002)(5660300002)(71200400001)(66946007)(64756008)(66556008)(66476007)(86362001)(66446008)(8936002)(8676002)(52536014)(478600001)(4326008)(2906002)(83380400001)(6916009)(44832011)(9686003)(54906003)(6506007)(7696005)(33656002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 4Tjwk4bnUlEX2usoVE2eetzUJyTSQcSUE/DuFkMz8QJqZZGV+0pPgzKMF1bhuR8vLizFT6ixrYiD9cmJzoJWU8nWJccxfd+tVEPxSXHeI+b7fsaDCrBCeU7PGAPbrs4kInDcry3W+Sf0Jt4/0r2TcHLadtXDLOCehs+3QiYG2ufVSdJduNx4L0AA1J+WxtyvhzqYNzg2JQykfEmOzBr9XPNmUxLv2hMLDxZogaGETvz1CkAMQn40KTavMors9AfkP1TrFQ6pbzn26aUR2Qpgejv1FKWqE8YGOJnHNqneNT+AyyhFbLvc9q81mPlcKh5vgBW0HPrBpZsb0D2Jknw5xfG6hZyY5TBFHmmjvJOWePy2UoFFPnZflu/YXhr/o9CW+y6wroCjfHsG8dWuso16kxdZCYxvzFkinUui4Tphc+GRq9tuMBJ36umhqpialFxBAU6sjy///T7z2DAIi6yHkYFFvzOSKHPU/J9BIRL0+w2Tixy/84lWKiBbVWygf11wgTje5FCfzyfzkINalsgb+/VXRt59TRvtIuZ4ziEb9UHrgxwjjGoUv9X7PdX9E6szZNaOP3lgx5QNA6+79F7fmj+dnyr7WvqlGhSoOuBqW7H/LJDF8Dj9LW2ocOnbYf+XkoZaH/Fk5V3xEH0ef22QEg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4975.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2428792f-531f-4510-7936-08d87c8302ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 03:22:19.9088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0sPf2VsaUcsqnwTt2X8bJoA/GU8swh5pXp75hBLXc9CelDMV1fOzRcJHvaFzNNDMkLqtSAEiqdM+nj+ImlF9DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4736
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPg0KPiBT
ZW50OiBGcmlkYXksIE9jdG9iZXIgMzAsIDIwMjAgOTowNiBBTQ0KPiANCj4gT24gV2VkLCBKdWwg
MjksIDIwMjAgYXQgMDQ6MDA6MTBQTSArMDgwMCwgRG9uZyBBaXNoZW5nIHdyb3RlOg0KPiA+IFRo
aXMgcGF0Y2ggaW1wbGVtZW50cyB0aGUgbmV3IHR3byBjZWxscyBiaW5kaW5nIGZvciBTQ1UgY2xv
Y2tzLg0KPiA+IFRoZSB1c2FnZSBpcyBhcyBmb2xsb3dzOg0KPiA+IGNsb2NrcyA9IDwmdWFydDBf
Y2xrIElNWF9TQ19SX1VBUlRfMCBJTVhfU0NfUE1fQ0xLX1BFUj4NCj4gPg0KPiA+IER1ZSB0byBl
YWNoIFNDVSBjbG9jayBpcyBhc3NvY2lhdGVkIHdpdGggYSBwb3dlciBkb21haW4sIHdpdGhvdXQg
cG93ZXINCj4gPiBvbiB0aGUgZG9tYWluLCB0aGUgU0NVIGNsb2NrIGNhbid0IHdvcmsuIFNvIHdl
IGNyZWF0ZSBwbGF0Zm9ybSBkZXZpY2VzDQo+ID4gZm9yIGVhY2ggZG9tYWluIGNsb2NrIHJlc3Bl
Y3RpdmVseSBhbmQgbWFudWFsbHkgYXR0YWNoIHRoZSByZXF1aXJlZA0KPiA+IGRvbWFpbiBiZWZv
cmUgcmVnaXN0ZXIgdGhlIGNsb2NrIGRldmljZXMsIHRoZW4gd2UgY2FuIHJlZ2lzdGVyIGNsb2Nr
cw0KPiA+IGluIHRoZSBjbG9jayBwbGF0Zm9ybSBkcml2ZXIgYWNjb3JkaW5nbHkuDQo+ID4NCj4g
PiBOb3RlIGJlY2F1c2Ugd2UgZG8gbm90IGhhdmUgcG93ZXIgZG9tYWluIGluZm8gaW4gZGV2aWNl
IHRyZWUgYW5kIHRoZQ0KPiA+IFNDVSByZXNvdXJjZSBJRCBpcyB0aGUgc2FtZSBmb3IgcG93ZXIg
ZG9tYWluIGFuZCBjbG9jaywgc28gd2UgdXNlDQo+ID4gcmVzb3VyY2UgSUQgdG8gZmluZCBwb3dl
ciBkb21haW5zLg0KPiA+DQo+ID4gTGF0ZXIsIHdlIHdpbGwgYWxzbyB1c2UgdGhpcyBjbG9jayBw
bGF0Zm9ybSBkcml2ZXIgdG8gc3VwcG9ydA0KPiA+IHN1c3BlbmQvcmVzdW1lIGFuZCBydW50aW1l
IHBtLg0KPiA+DQo+ID4gQ2M6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4NCj4gPiBD
YzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPg0KPiA+IENjOiBTYXNjaGEgSGF1ZXIg
PGtlcm5lbEBwZW5ndXRyb25peC5kZT4NCj4gPiBDYzogTWljaGFlbCBUdXJxdWV0dGUgPG10dXJx
dWV0dGVAYmF5bGlicmUuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IERvbmcgQWlzaGVuZyA8YWlz
aGVuZy5kb25nQG54cC5jb20+DQo+IA0KPiBUaGlzIHBhdGNoIGJyZWFrcyBhbGxtb2Rjb25maWcu
DQoNClRoYW5rcyBmb3IgdGhlIGluZm8uDQpJJ20gY2hlY2tpbmcgaXQuDQoNClJlZ2FyZHMNCkFp
c2hlbmcNCg0KPiANCj4gJCBtYWtlIC1za2oiJChucHJvYykiIEFSQ0g9YXJtIENST1NTX0NPTVBJ
TEU9YXJtLWxpbnV4LWdudWVhYmktDQo+IGRpc3RjbGVhbiBhbGxtb2Rjb25maWcgZHJpdmVycy9j
bGsvaW14LyBJbiBmaWxlIGluY2x1ZGVkDQo+IGZyb20gLi9pbmNsdWRlL2xpbnV4L2RldmljZS5o
OjMyLA0KPiAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L29mX3BsYXRmb3Jt
Lmg6OSwNCj4gICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMvY2xrL2lteC9jbGstc2N1LmM6
MTE6DQo+IC4vaW5jbHVkZS9saW51eC9kZXZpY2UvZHJpdmVyLmg6MjkwOjE6IHdhcm5pbmc6IGRh
dGEgZGVmaW5pdGlvbiBoYXMgbm8gdHlwZSBvcg0KPiBzdG9yYWdlIGNsYXNzDQo+ICAgMjkwIHwg
ZGV2aWNlX2luaXRjYWxsKF9fZHJpdmVyIyNfaW5pdCk7DQo+ICAgICAgIHwgXn5+fn5+fn5+fn5+
fn5+DQo+IC4vaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kZXZpY2UuaDoyNTg6Mjogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvDQo+ICdidWlsdGluX2RyaXZlcicNCj4gICAyNTggfCAgYnVpbHRp
bl9kcml2ZXIoX19wbGF0Zm9ybV9kcml2ZXIsIHBsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcikNCj4g
ICAgICAgfCAgXn5+fn5+fn5+fn5+fn4NCj4gZHJpdmVycy9jbGsvaW14L2Nsay1zY3UuYzo1NDU6
MTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvDQo+ICdidWlsdGluX3BsYXRmb3JtX2RyaXZl
cicNCj4gICA1NDUgfCBidWlsdGluX3BsYXRmb3JtX2RyaXZlcihpbXhfY2xrX3NjdV9kcml2ZXIp
Ow0KPiAgICAgICB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IC4vaW5jbHVkZS9saW51eC9k
ZXZpY2UvZHJpdmVyLmg6MjkwOjE6IGVycm9yOiB0eXBlIGRlZmF1bHRzIHRvICdpbnQnIGluIGRl
Y2xhcmF0aW9uDQo+IG9mICdkZXZpY2VfaW5pdGNhbGwnIFstV2Vycm9yPWltcGxpY2l0LWludF0N
Cj4gICAyOTAgfCBkZXZpY2VfaW5pdGNhbGwoX19kcml2ZXIjI19pbml0KTsNCj4gICAgICAgfCBe
fn5+fn5+fn5+fn5+fn4NCj4gLi9pbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RldmljZS5oOjI1ODoy
OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8NCj4gJ2J1aWx0aW5fZHJpdmVyJw0KPiAgIDI1
OCB8ICBidWlsdGluX2RyaXZlcihfX3BsYXRmb3JtX2RyaXZlciwgcGxhdGZvcm1fZHJpdmVyX3Jl
Z2lzdGVyKQ0KPiAgICAgICB8ICBefn5+fn5+fn5+fn5+fg0KPiBkcml2ZXJzL2Nsay9pbXgvY2xr
LXNjdS5jOjU0NToxOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8NCj4gJ2J1aWx0aW5fcGxh
dGZvcm1fZHJpdmVyJw0KPiAgIDU0NSB8IGJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyKGlteF9jbGtf
c2N1X2RyaXZlcik7DQo+ICAgICAgIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gZHJpdmVy
cy9jbGsvaW14L2Nsay1zY3UuYzo1NDU6MTogd2FybmluZzogcGFyYW1ldGVyIG5hbWVzICh3aXRo
b3V0IHR5cGVzKSBpbg0KPiBmdW5jdGlvbiBkZWNsYXJhdGlvbiBJbiBmaWxlIGluY2x1ZGVkIGZy
b20gLi9pbmNsdWRlL2xpbnV4L2RldmljZS5oOjMyLA0KPiAgICAgICAgICAgICAgICAgIGZyb20g
Li9pbmNsdWRlL2xpbnV4L29mX3BsYXRmb3JtLmg6OSwNCj4gICAgICAgICAgICAgICAgICBmcm9t
IGRyaXZlcnMvY2xrL2lteC9jbGstc2N1LmM6MTE6DQo+IGRyaXZlcnMvY2xrL2lteC9jbGstc2N1
LmM6NTQ1OjI1OiB3YXJuaW5nOiAnaW14X2Nsa19zY3VfZHJpdmVyX2luaXQnIGRlZmluZWQgYnV0
DQo+IG5vdCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0NCj4gICA1NDUgfCBidWlsdGluX3BsYXRm
b3JtX2RyaXZlcihpbXhfY2xrX3NjdV9kcml2ZXIpOw0KPiAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fg0KPiAuL2luY2x1ZGUvbGludXgvZGV2aWNlL2Ry
aXZlci5oOjI4NjoxOTogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybw0KPiAnYnVpbHRpbl9k
cml2ZXInDQo+ICAgMjg2IHwgc3RhdGljIGludCBfX2luaXQgX19kcml2ZXIjI19pbml0KHZvaWQp
IFwNCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICBefn5+fn5+fg0KPiBkcml2ZXJzL2Nsay9p
bXgvY2xrLXNjdS5jOjU0NToxOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8NCj4gJ2J1aWx0
aW5fcGxhdGZvcm1fZHJpdmVyJw0KPiAgIDU0NSB8IGJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyKGlt
eF9jbGtfc2N1X2RyaXZlcik7DQo+ICAgICAgIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4g
Y2MxOiBzb21lIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzDQo+IG1ha2VbNF06ICoq
KiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyODM6IGRyaXZlcnMvY2xrL2lteC9jbGstc2N1Lm9d
IEVycm9yIDENCj4gbWFrZVs0XTogVGFyZ2V0ICdfX2J1aWxkJyBub3QgcmVtYWRlIGJlY2F1c2Ug
b2YgZXJyb3JzLg0KPiBtYWtlWzNdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NTAwOiBk
cml2ZXJzL2Nsay9pbXhdIEVycm9yIDINCj4gbWFrZVszXTogVGFyZ2V0ICdfX2J1aWxkJyBub3Qg
cmVtYWRlIGJlY2F1c2Ugb2YgZXJyb3JzLg0KPiBtYWtlWzJdOiAqKiogW3NjcmlwdHMvTWFrZWZp
bGUuYnVpbGQ6NTAwOiBkcml2ZXJzL2Nsa10gRXJyb3IgMg0KPiBtYWtlWzJdOiBUYXJnZXQgJ19f
YnVpbGQnIG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+IG1ha2VbMV06ICoqKiBbTWFr
ZWZpbGU6MTc5OTogZHJpdmVyc10gRXJyb3IgMg0KPiBtYWtlWzFdOiBUYXJnZXQgJ2RyaXZlcnMv
Y2xrL2lteC8nIG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+IG1ha2U6ICoqKiBbTWFr
ZWZpbGU6MzM1OiBfX2J1aWxkX29uZV9ieV9vbmVdIEVycm9yIDINCj4gbWFrZTogVGFyZ2V0ICdk
aXN0Y2xlYW4nIG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+IG1ha2U6IFRhcmdldCAn
YWxsbW9kY29uZmlnJyBub3QgcmVtYWRlIGJlY2F1c2Ugb2YgZXJyb3JzLg0KPiBtYWtlOiBUYXJn
ZXQgJ2RyaXZlcnMvY2xrL2lteC8nIG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+IA0K
PiBDaGVlcnMsDQo+IE5hdGhhbg0K
