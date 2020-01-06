Return-Path: <SRS0=2auu=23=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0BBC32771
	for <linux-clk@archiver.kernel.org>; Mon,  6 Jan 2020 09:29:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA1872072C
	for <linux-clk@archiver.kernel.org>; Mon,  6 Jan 2020 09:29:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="WHYUAu5A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbgAFJ3e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Jan 2020 04:29:34 -0500
Received: from mail-eopbgr70088.outbound.protection.outlook.com ([40.107.7.88]:56641
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725446AbgAFJ3e (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 6 Jan 2020 04:29:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDSshU7OIGz5qilLy17str+xTNeMPgNl30oK1nTMZD6Q1PqC+bUngEoBdeXVHXFUvJzSogN4CRyuZikr+fGSO2cC7HYihVtFvnRb7shlApdP0MaWkZcoj7NF3TD3JF8QLjOyE4lJnOE+/xRBs+Z7eBIRJHh8KKqcIqtkMKUFg6RwJSMP44CxyT0ur+cFIKMmEizsn/345DB6jBMckz/0So4GcHxNIPEbTMvnK6M3nNuS88SgrNA6vtCWmMBqpQ4reE5GnUxNMXtZyFKI4prx0Ksf0CpieLuKumxCoEavA05zbB1h0AMHZsGXKzDLQEYQmA6yDrrybvN3jUICyKYn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eaPRTGCG8k4EXIyP3pwAxTqNdwwwiG07nTpJu2b3+6c=;
 b=ivEm7OQPqysm+CiuHonbI05rHsWt23B5owh9XCn4F/ffDZUkD3pB/N5RINMoQt/l51ZZoxtTcfxBkvrrXNw3jXd/hdvlPczcqisOH+xzRXjqt0lmNmErK6BO5WUA/UNbGMV9bPftoNioUHRh8W9wEDyERAN3e6mFa8mBkMhSPKi67+x0PWFFy2TYNt8/7VTFra+99hYlgVAvWeqeITls9acbvzf0WuTgsXYzR0PXp9O0lVsmZhKy32rVayUmuH4dOfUcjJ8itaYDEi5n9pjcvfwGd0aQZxfKgd0PkfEm8I9yULRpDx9B9BRVP2yzyHfJCylbOybuW+Aou4hXkmvSow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eaPRTGCG8k4EXIyP3pwAxTqNdwwwiG07nTpJu2b3+6c=;
 b=WHYUAu5AmVakR/TWJfto+Gy+o2gEoF6StcvgdsqR1U03KnSC7fM4eiKuuOZf9Pc/1GU52VIl0SLAjWrht2Ka+wAY4BjeO5afPlhofAkG0RImpkGYE2WMr9eHYj3vxAGSq3obgN9oo3LCgljOcsEh1W64WXc+7t7AF8PhbwTyKX4=
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB2928.eurprd04.prod.outlook.com (10.175.24.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Mon, 6 Jan 2020 09:29:26 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1%4]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 09:29:25 +0000
From:   Daniel Baluta <daniel.baluta@nxp.com>
To:     "sboyd@kernel.org" <sboyd@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>
Subject: Re: [PATCH V5 00/11] clk: imx8: add new clock binding for better pm
 support
Thread-Topic: [PATCH V5 00/11] clk: imx8: add new clock binding for better pm
 support
Thread-Index: AQHVZxh4yrmq50bMJESYKpQKpxiH1acxANAAgK0YjwA=
Date:   Mon, 6 Jan 2020 09:29:25 +0000
Message-ID: <db9a693f195cdc363d3ab836938d83e2e1a5274e.camel@nxp.com>
References: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com>
         <20190918060835.B93D420856@mail.kernel.org>
In-Reply-To: <20190918060835.B93D420856@mail.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9a0fd83d-32af-433e-b946-08d7928aebf6
x-ms-traffictypediagnostic: VI1PR0402MB2928:|VI1PR0402MB2928:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB2928D1614AE319A1AEB48A4FF93C0@VI1PR0402MB2928.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(199004)(189003)(54534003)(6506007)(478600001)(8676002)(81156014)(8936002)(81166006)(54906003)(76116006)(6486002)(6512007)(66556008)(66476007)(66946007)(2616005)(66446008)(64756008)(91956017)(316002)(2906002)(110136005)(36756003)(71200400001)(26005)(4326008)(186003)(5660300002)(86362001)(44832011)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB2928;H:VI1PR0402MB3839.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 47uRFMMmf+FmCr0JNAxXkkTB+IVSWfzbGdiLdw3qu1KP11uW6QXWJSqy6bZi2PIWrKdqfM0Y2kGz6iN174+lwtx1l+vc1e0X8Qsxj5QZUpUZYcBK8qGQwYWEhHWeT0LL8ZXU8Q2Neaqi6UpWN1o7kU72Ks3K3+Eu1dq/NuxbWSQPIvLyoyvfIY9CR4dhgpPwXjJ3ui1t8Kj8hz0SgVQxbKYwNoHWi4WaTuU0n/W6gmiY1V+H7d55b1ktKelZnhBuIWkxDbO/aEold7Htd7jDXs4fR8RFFSZHdThA3qRaoau1KaSXwjm/JLTHGCUde+HN5tIKvKUMv1FNUncM32v4mWVszvs/khCwSnGW/z5WmI9QPPocQTWQrau0de8/xjX08FhBaExzqSK4YcbXqCPsAdTgWq+XpBGiYkVmbiu56JWBEKoyj5mdQxlAKtbkpKF4fCyyFDmxoTOeptdHMuXAw9PAi0Ui9eg9FzWaNNMvWR0aAkXvwO64ajvKhq+1OQHEo/NFKJANSFqIikZ9fEbW6Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9A5652C52659745A5418326DE75A315@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0fd83d-32af-433e-b946-08d7928aebf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 09:29:25.6432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aoxh43AY6V73qRiPQ370h7jass6Z/6n6MyrFD533OD5wUFgZk0zAxFaWWhqSJEA9gH6yFfGBWsEgj+QRsvJ23Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2928
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gVHVlLCAyMDE5LTA5LTE3IGF0IDIzOjA4IC0wNzAwLCBTdGVwaGVuIEJveWQgd3JvdGU6DQo+
IFF1b3RpbmcgRG9uZyBBaXNoZW5nICgyMDE5LTA5LTA5IDE5OjA5OjU3KQ0KPiA+IFRoaXMgaXMg
YSBmb2xsb3cgdXAgb2YgdGhpcyBwYXRjaCBzZXJpZXMuDQo+ID4gDQpbVjIsMC8yXSBjbGs6IGlt
eDogc2N1OiBhZGQgcGFyc2luZyBjbG9ja3MgZnJvbSBkZXZpY2UgdHJlZSBzdXBwb3J0DQo+ID4g
DQo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaXMgYSBwcmVwYXJhdGlvbiBmb3IgdGhlIE1YOCBBcmNo
aXRlY3R1cmUNCj4gPiBpbXByb3ZlbWVudC4NCj4gPiBBcyBmb3IgSU1YIFNDVSBiYXNlZCBwbGF0
Zm9ybXMgbGlrZSBNWDhRTSBhbmQgTVg4UVhQLCB0aGV5IGFyZQ0KPiA+IGNvbXByaXNlZA0KPiA+
IG9mIGEgY291cGxlIG9mIFNTKFN1YnN5c3RlbXMpIHdoaWxlIG1vc3Qgb2YgdGhlbSB3aXRoaW4g
dGhlIHNhbWUgU1MNCj4gPiBjYW4gYmUgc2hhcmVkLiBlLmcuIENsb2NrcywgRGV2aWNlcyBhbmQg
ZXRjLg0KPiA+IA0KPiA+IEhvd2V2ZXIsIGN1cnJlbnQgY2xvY2sgYmluZGluZyBpcyB1c2luZyBT
VyBJRHMgZm9yIGRldmljZSB0cmVlIHRvDQo+ID4gdXNlDQo+ID4gd2hpY2ggY2FuIGNhdXNlIHRy
b3VibGVzIGluIHdyaXRpbmcgdGhlIGNvbW1vbiA8c29jPi1zcy14eC5kdHNpDQo+ID4gZmlsZSBm
b3INCj4gPiBkaWZmZXJlbnQgU29Dcy4NCj4gPiANCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhaW1z
IHRvIGludHJvZHVjZSBhIG5ldyBiaW5kaW5nIHdoaWNoIGlzIG1vcmUNCj4gPiBjbG9zZSB0bw0K
PiA+IGhhcmR3YXJlIGFuZCBwbGF0Zm9ybSBpbmRlcGVuZGVudCBhbmQgY2FuIG1ha2VzIHVzIHdy
aXRlIGEgbW9yZQ0KPiA+IGdlbmVyYWwNCj4gPiBkcml2ZXJzIGZvciBkaWZmZXJlbnQgU0NVIGJh
c2VkIFNvQ3MuDQo+ID4gDQo+ID4gQW5vdGhlciBpbXBvcnRhbnQgdGhpbmcgaXMgdGhhdCBvbiBN
WDgsIGVhY2ggQ2xvY2sgcmVzb3VyY2UgaXMNCj4gPiBhc3NvY2lhdGVkDQo+ID4gd2l0aCBhIHBv
d2VyIGRvbWFpbi4gU28gd2UgaGF2ZSB0byBhdHRhY2ggdGhhdCBjbG9jayBkZXZpY2UgdG8gdGhl
DQo+ID4gcG93ZXINCj4gPiBkb21haW4gaW4gb3JkZXIgdG8gbWFrZSBpdCB3b3JrIHByb3Blcmx5
LiBGdXJ0aGVyIG1vcmUsIHRoZSBjbG9jaw0KPiA+IHN0YXRlDQo+ID4gd2lsbCBiZSBsb3N0IHdo
ZW4gaXRzIHBvd2VyIGRvbWFpbiBpcyBjb21wbGV0ZWx5IG9mZiBkdXJpbmcNCj4gPiBzdXNwZW5k
L3Jlc3VtZSwNCj4gPiBzbyB3ZSBhbHNvIGludHJvZHVjZSB0aGUgY2xvY2sgc3RhdGUgc2F2ZSZy
ZXN0b3JlIG1lY2hhbmlzbS4NCj4gDQo+IEkgaGFkIHNvbWUgbW9yZSBjb21tZW50cyBvbiB2NC4g
SSdtIGdvaW5nIHRvIHdhaXQgZm9yIHRob3NlIHRvIGJlDQo+IGFkZHJlc3NlZCBiZWZvcmUgcmV2
aWV3aW5nIHRoaXMgc2VyaWVzLg0KDQpIaSBBaXNoZW5nLA0KDQpBcmUgdGhlIGNvbW1lbnRzIGZy
b20gU3RlcGhlbiBhZGRyZXNzZWQgeWV0Pw0KDQpJIG5vdGljZWQgdGhhdCB5b3UgZGlkIGEgUkVT
RU5EIG9mIFY1IHdpdGggdGhlIGNvbW1lbnQ6DQoNCj4gQ2hhbmdlTG9nOg0KPiB2NC0+djU6DQo+
ICAqIEFkZHJlc3MgYWxsIGNvbW1lbnRzIGZyb20gU3RlcGhlbg0KDQpZb3UgY2FuIGFkZCBteToN
Cg0KVGVzdGVkLWJ5OiBEYW5pZWwgQmFsdXRhIDxkYW5pZWwuYmFsdXRhQG54cC5jb20+DQoNCmZv
ciBwYXRjaGVzIHNlbmQgd2l0aCB0YWcgOiBSRVNFTkQgdjUuDQoNCnRoYW5rcywNCkRhbmllbC4N
Cg0KDQo=
