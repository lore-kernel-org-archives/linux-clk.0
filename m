Return-Path: <SRS0=oBAc=3K=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCE3C33CAA
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jan 2020 05:01:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9446722522
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jan 2020 05:01:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="D5jYPTer"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgAUFBB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jan 2020 00:01:01 -0500
Received: from mail-eopbgr80057.outbound.protection.outlook.com ([40.107.8.57]:18886
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725789AbgAUFBB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 21 Jan 2020 00:01:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMkaZqAV2nye8znyKXQQn/Rj2sZkUUjTlXbWjQPEW2qzV0GCMB3Bl0MIzXV0juK/U47E5U744XXA376HPwMq7deb6NP7/OZsqiQOSPorFICL3LqCehBVOpQkuHEIQ8xVIFo173/GNT69Pm17/8TPNUFBdBOx/388t46b1tUwueIR12pMDUprsOLrapSDsXWE9iPFMxu8vgP7joBbljl6uf18qPYmfXJhSYws3hXFHlXRCS3u3eCcOBoSrwx4/T7DITRORFTbWENgaPkrPENMKsQGHK7hhSGNL7JjVi6I/44JpQAbcAbQ2Ok5xQSOmRd+wNdOj3F1QtHpC6+lvlcaRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFe4TbvfHpRkdgZj0fJOTowKwVzhuQuceYxfQhwn+tg=;
 b=EPdKB9Km55TcrbTWYnUE6MBLKe526ZBgkuPvQeWUQuWhM5/NPmxxf/0yJlgpvcI5bxfoxcG5pqSE0ZfNunipMKhJ/o2JSnpCWRXpWqM+1p5YNTi/peziCNF8C1YY6YcbUVk2PMmhm+ysYUNy0qYW2Cjo2ds/cU6VKZ+gquPLBoUe9o7zl+BJDtXioqEMe+G4tRnYQR6cFnsmufB/9RTEvGN+Ew/WkEn/NVBCRcnefdK70rsrN4nZ/3utArg3wQUadCQvaESVNwOJzL9t2Gg5m2AJBFvpj0PuNAwHZTksMpXBqxXXyFWPZyxm/e5jGjyNT2wkumTfaGsf/wfhzVXCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFe4TbvfHpRkdgZj0fJOTowKwVzhuQuceYxfQhwn+tg=;
 b=D5jYPTerNHhBgiNprx353JJ89jZbw3Lcx6WEZqIdNLKm+sfql/wqsBATwM/HL4mT15Srw7WvY+JSj7cXJs9YbnRtQJ5cNwZAYl5LW/6S1p5WJQTUKdP93xMmA4jpCpbO68h/K67X0R6lJYEbTxthz0OUNxSmD/rdxPONrCzqR1g=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB4961.eurprd04.prod.outlook.com (20.177.42.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.24; Tue, 21 Jan 2020 05:00:56 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::b9bd:470c:5f9c:1bfd]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::b9bd:470c:5f9c:1bfd%7]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 05:00:56 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH RESEND V5 00/11] clk: imx8: add new clock binding for
 better pm support
Thread-Topic: [PATCH RESEND V5 00/11] clk: imx8: add new clock binding for
 better pm support
Thread-Index: AQHVnUJfJlMJ/jCUUkSe2HX97baBSqe0uPgAgCKYlZCAHaMQkA==
Date:   Tue, 21 Jan 2020 05:00:56 +0000
Message-ID: <AM0PR04MB42115D5A9D431D6EEA0C8D2D800D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1573993519-14308-1-git-send-email-aisheng.dong@nxp.com>
 <20191211080525.GS15858@dragon>
 <AM0PR04MB42111A436D719D321ADB479380200@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB42111A436D719D321ADB479380200@AM0PR04MB4211.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ee47c8c6-cbb1-4027-1fa0-08d79e2ee672
x-ms-traffictypediagnostic: AM0PR04MB4961:|AM0PR04MB4961:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB4961898E087698AA082A35E0800D0@AM0PR04MB4961.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(199004)(189003)(55016002)(26005)(186003)(6506007)(86362001)(52536014)(66446008)(66556008)(64756008)(7696005)(5660300002)(66946007)(66476007)(478600001)(76116006)(2906002)(71200400001)(44832011)(8676002)(110136005)(4326008)(9686003)(54906003)(81166006)(8936002)(33656002)(316002)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4961;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AZZZidb7dD+Fv4aWeY/NjXyifA0ON26BItgPAzOLg1H/xvvh2bjhqt3jOLEYv03/+Gavxm8SicqLacs2e7W3ZC+7KPDKIQfbHQmGyCsPxyL4cIktVM8vZVLljWrXN320aGcjU0Kcqyj1T/qgeQDMs9vmlYWmC9PT5w3AWX5nzDoSHkdsHRlL03kcxAPH2YPpxiSHiLrcpBIm9CMB4O8vsGSwEB8Coweu6g7bv8iA4wihxr/Bqp0Pu2QGBXlleWAXn+CaEVia7m7/1HZycuuttFJGnYOSWMKKP+lMDZF2Nphziu8P2vZB/WMyjkepePA0DC3HTxSdCWq6Lq0nVnVOGUiFnIiThVUzVn6HDq/J0ny1izWms5t9EDSF7YdfZqAum56HCBZ6Jjaz3/YmMmINpg1VwnVJZ1saTi6K3F4tmLem0uJRwU923AAJc0vKvEkI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee47c8c6-cbb1-4027-1fa0-08d79e2ee672
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 05:00:56.6438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lSpWs55absCjitlErTjbh1MajjZ3R8beOF/XDcxYHwB4/H3Ngsq8SWXJjKBWXK3UyCgN+ri0sd5Qe34gacR6uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4961
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

R2VudGx5IHBpbmcuLg0KDQo+IEZyb206IEFpc2hlbmcgRG9uZyA8YWlzaGVuZy5kb25nQG54cC5j
b20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDIsIDIwMjAgNDoyNiBQTQ0KPiANCj4gSGkg
U3RlcGhlbiwNCj4gDQo+IENvdWxkIHlvdSB0YWtlIGEgbG9vayBhdCB0aGlzPw0KPiANCj4gUmVn
YXJkcw0KPiBBaXNoZW5nDQo+IA0KPiA+IEZyb206IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVs
Lm9yZz4NCj4gPiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDExLCAyMDE5IDQ6MDUgUE0NCj4g
Pg0KPiA+IE9uIFN1biwgTm92IDE3LCAyMDE5IGF0IDA4OjI1OjA4UE0gKzA4MDAsIERvbmcgQWlz
aGVuZyB3cm90ZToNCj4gPiA+IFRoaXMgaXMgYSBmb2xsb3cgdXAgb2YgdGhpcyBwYXRjaCBzZXJp
ZXMuDQo+ID4gPiBbVjIsMC8yXSBjbGs6IGlteDogc2N1OiBhZGQgcGFyc2luZyBjbG9ja3MgZnJv
bSBkZXZpY2UgdHJlZSBzdXBwb3J0DQo+ID4gPg0KPiA+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaXMg
YSBwcmVwYXJhdGlvbiBmb3IgdGhlIE1YOCBBcmNoaXRlY3R1cmUgaW1wcm92ZW1lbnQuDQo+ID4g
PiBBcyBmb3IgSU1YIFNDVSBiYXNlZCBwbGF0Zm9ybXMgbGlrZSBNWDhRTSBhbmQgTVg4UVhQLCB0
aGV5IGFyZQ0KPiA+ID4gY29tcHJpc2VkIG9mIGEgY291cGxlIG9mIFNTKFN1YnN5c3RlbXMpIHdo
aWxlIG1vc3Qgb2YgdGhlbSB3aXRoaW4NCj4gPiA+IHRoZSBzYW1lIFNTIGNhbiBiZSBzaGFyZWQu
IGUuZy4gQ2xvY2tzLCBEZXZpY2VzIGFuZCBldGMuDQo+ID4gPg0KPiA+ID4gSG93ZXZlciwgY3Vy
cmVudCBjbG9jayBiaW5kaW5nIGlzIHVzaW5nIFNXIElEcyBmb3IgZGV2aWNlIHRyZWUgdG8NCj4g
PiA+IHVzZSB3aGljaCBjYW4gY2F1c2UgdHJvdWJsZXMgaW4gd3JpdGluZyB0aGUgY29tbW9uIDxz
b2M+LXNzLXh4LmR0c2kNCj4gPiA+IGZpbGUgZm9yIGRpZmZlcmVudCBTb0NzLg0KPiA+ID4NCj4g
PiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFpbXMgdG8gaW50cm9kdWNlIGEgbmV3IGJpbmRpbmcgd2hp
Y2ggaXMgbW9yZQ0KPiA+ID4gY2xvc2UgdG8gaGFyZHdhcmUgYW5kIHBsYXRmb3JtIGluZGVwZW5k
ZW50IGFuZCBjYW4gbWFrZXMgdXMgd3JpdGUgYQ0KPiA+ID4gbW9yZSBnZW5lcmFsIGRyaXZlcnMg
Zm9yIGRpZmZlcmVudCBTQ1UgYmFzZWQgU29Dcy4NCj4gPiA+DQo+ID4gPiBBbm90aGVyIGltcG9y
dGFudCB0aGluZyBpcyB0aGF0IG9uIE1YOCwgZWFjaCBDbG9jayByZXNvdXJjZSBpcw0KPiA+ID4g
YXNzb2NpYXRlZCB3aXRoIGEgcG93ZXIgZG9tYWluLiBTbyB3ZSBoYXZlIHRvIGF0dGFjaCB0aGF0
IGNsb2NrDQo+ID4gPiBkZXZpY2UgdG8gdGhlIHBvd2VyIGRvbWFpbiBpbiBvcmRlciB0byBtYWtl
IGl0IHdvcmsgcHJvcGVybHkuDQo+ID4gPiBGdXJ0aGVyIG1vcmUsIHRoZSBjbG9jayBzdGF0ZSB3
aWxsIGJlIGxvc3Qgd2hlbiBpdHMgcG93ZXIgZG9tYWluIGlzDQo+ID4gPiBjb21wbGV0ZWx5IG9m
ZiBkdXJpbmcgc3VzcGVuZC9yZXN1bWUsIHNvIHdlIGFsc28gaW50cm9kdWNlIHRoZSBjbG9jaw0K
PiA+ID4gc3RhdGUgc2F2ZSZyZXN0b3JlDQo+ID4gbWVjaGFuaXNtLg0KPiA+ID4NCj4gPiA+IENo
YW5nZUxvZzoNCj4gPiA+IHY0LT52NToNCj4gPiA+ICAqIEFkZHJlc3MgYWxsIGNvbW1lbnRzIGZy
b20gU3RlcGhlbg0KPiA+DQo+ID4gSGkgU3RlcGhlbiwNCj4gPg0KPiA+IEFyZSB5b3UgZmluZSB3
aXRoIHRoaXMgdmVyc2lvbj8NCj4gPg0KPiA+IFNoYXduDQo=
