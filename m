Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02FFC56202
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 11:11:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42D3E206B5
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 11:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="owXFr6gU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgKYLKv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Nov 2020 06:10:51 -0500
Received: from mail-eopbgr30050.outbound.protection.outlook.com ([40.107.3.50]:7625
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726316AbgKYLKv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 25 Nov 2020 06:10:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdBapAaanFDIBKz/TGT59oqCdg/REz1FoUsQcLyn64TeGsUx1ogWhQRxOapny237TJJuFXCJJzq56+g1hwVD4n8NJwLxGhNRUcBIaC1KB9JjGCjDvIpmemluiWR8vGxv1O2ifVHW9tP84yXnilnepxIJNV8XxMhKrHPesuAcOam6tS2BguB1odN1gAT9ejl98Qfp/OZN2VRYaGQkNyo5EW0STtqMarN/F69o1D2I1QzBB82CxP+wUMRuMk1C0tKApvNb2cLGBZqTPYQtgNOrBEnBY0RkTamtMJiRmSXKdK1npv/lzUHV9UDW7q3LYGB+T1rWXbR7TAhJCv76JPpJew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwN7oMrJ8OPJRCkW2sEK3t91LOKOvodBTfxaQxMJR/s=;
 b=bpqbMqGRYeurJmceHg2Pp5sN6H6vzRYi/+ASDTwO+dJwpFJZDHS87Ed9quOsl/hjiTRWgGHbQa7GW9vBKVtmVQ5xwYfajZ7d+DMJsnfHXbUCt2d54IYzv6wTa59cLax9KfUaYzW4FF+6KbP+1Hnvl464JaGMG72B4DZhFBxfHO+uwFbkChTMrdZCZ/2fl+t2T9zJVi3Rc+HwHOn0JCXbuppfm+qwWZiZnXBHrAgqqFM7vHp0HtEgX1D/Jz5/CwE058yrX/u1vsB01SEWs8ejO6uK4dM0PGQCCMnFZ2MVZEPrnhuxDrbkAvKsilNHA99SI8kcKU6R8++bjCPvQAKKWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwN7oMrJ8OPJRCkW2sEK3t91LOKOvodBTfxaQxMJR/s=;
 b=owXFr6gUBN3KrrMHKZfHM0NCxp44PyQ9rSc2Cp5tIvYCD6Q2gPfGT1oSy2FkVWH2spTGq8F0lSf/WDNLZLhJbHvQP2pjbrqNt0p3mHffN1ic1BdSxuhMUqV4u9Mfo4B+G9j6/PLK3+pfn2W4wKskYtte2Q2afMtrYriYNBbVAtY=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5815.eurprd04.prod.outlook.com (2603:10a6:20b:b0::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.25; Wed, 25 Nov
 2020 11:10:47 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a%3]) with mapi id 15.20.3564.029; Wed, 25 Nov 2020
 11:10:47 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "sudipm.mukherjee@gmail.com" <sudipm.mukherjee@gmail.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: RE: [PATCH 1/1] clk: imx: scu: fix MXC_CLK_SCU module build break
Thread-Topic: [PATCH 1/1] clk: imx: scu: fix MXC_CLK_SCU module build break
Thread-Index: AQHWwxtcOBAOcl2P/02xv3xvhsQLMqnYsNOQ
Date:   Wed, 25 Nov 2020 11:10:47 +0000
Message-ID: <AM6PR04MB4966F70037422D9CBC57883D80FA0@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20201125105037.22079-1-aisheng.dong@nxp.com>
In-Reply-To: <20201125105037.22079-1-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b0699b02-03ed-42ca-fcaa-08d89132c2bf
x-ms-traffictypediagnostic: AM6PR04MB5815:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5815A291FB9EE48DE7E4D5E780FA0@AM6PR04MB5815.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iw/mBZVE9rvLgB3tnNVCGCp3KmnAMue9ppgGLn6VBygkG7/SH+A/z5FZekAKGob/bQkDkugheZ3YoreyPCR5vU2XZynPC4OVx5fAiYLe/7p4LA4x0TyJiKjHG9ngDRQ+SUmp449hvw98ykahlHbtpwDtL98phfxwuK5docztWDejCpNMpcTg4ydnltzSC11NTOuXToEmMpvyzH2I6BRDQGewr68faOi5duH86mkNEk4iPn32gvs0FT22Jw1RuAv3nrA/pKomhfUFQNjUb8tD+fRnWTJaUajyMgncQRtFrgiri2gt/cBWPWS6HCP+GXndz5E7kN0bhnqsYY9ulQSzEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(478600001)(66556008)(2906002)(76116006)(26005)(9686003)(7696005)(66946007)(6916009)(66476007)(86362001)(5660300002)(6506007)(8676002)(55016002)(64756008)(83380400001)(8936002)(33656002)(316002)(44832011)(66446008)(52536014)(186003)(71200400001)(4326008)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: WT39T1Zigk9WRJ9WfsZdrZC/o3qemnVayE/nj7ovWOju4/6gku0/NdcfOooCHd1lFTQefUbjEmMq8K4QQei+wvXAmYqxpK6Ms/Q5WzJgWbZDVV7qrGyF+v2Lki4y+8cju1DejAWbrZSmNyflxSQI7kyIbEjibI0He7uedEl+DaHb9JHvbtChosBX3etCv6iY2ZhcaNaEiuBSjgqQ13mDY2BB8NqVr0TXQlRf4uSW67LtrxoMEdn+qIjB9wQynYovkC2e/CSeCBMbVeyvcl+ji3KTOjETO6c8dkQ3+mQqbs0x601fwcAN4cev/B5Uo9+UWo6NnDqwqHcuMuzwr8HWo4EDgyhufDi4IvoXuFU8uJk5GxeXvIAgXOEIVE+dsOSrykNKifg8ZQcK15MJeQXzmxJYyuwuit9vkFjg/UiAxro5RhTR//NaVQJydgafd07At6kAqUOUuXJhyB65BR8MveYpd3v+VsCOWXree8DavhIlUYXph3Ho9Ef2Da+BQe3HSc0/stKUybea4zevNY4H2h6Ibc/sm8SqPpEVnGHMNn3j04Iy3UWhCErFStvdT4HZU8ysAPG8MSORubr56qE5AYBqj4D8In1INLSjoOOVCMSLufm326Kjud5VOlY6CewSeB6+HRIEfzmvQPIWCMDr7XYE7MaBU4keB5ao0Y6Mf+8k2t99zsLpwyKZom71dEZNrQSq3CHyaJJav7EL8vLn7ra8ps8x+eOPOww0QkQVxADEeVjzYkJLUgUm2mBTxW+MgRg6G2Gh2hUlslH357frw/iHncY4Iva23NBH1ppdTz93c68b0+QhSWUWmCT+SOSAUB6ssCAB9Z96rNCiR3A5RCVzdzTRD1/gh2dDvibLtbgPVUNxOhRlCpmqnjpYnbUBKsY0UE023P++EFiplOiHOw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0699b02-03ed-42ca-fcaa-08d89132c2bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 11:10:47.3829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DNnE+UJ/OTLR5b861jk4Jp4pXTTNEkfuhVoLvaN2CdGrVh2n6hmvxY8zeQI80NKRqDN33VZ3ZPecqetlypabsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5815
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU2hhd24sIFN0ZXBoZW4sDQoNCj4gRnJvbTogQWlzaGVuZyBEb25nIDxhaXNoZW5nLmRvbmdA
bnhwLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyNSwgMjAyMCA2OjUxIFBNDQo+
IA0KPiBUaGlzIGlzc3VlIGNhbiBiZSByZXByb2R1Y2VkIGJ5IENPTkZJR19JTVhfTUJPWD1tIGFu
ZA0KPiBDT05GSUdfTVhDX0NMS19TQ1U9bS4NCj4gSXQncyBjYXVzZWQgYnkgY3VycmVudCBNYWtl
ZmlsZSBjYW4ndCBzdXBwb3J0IGJ1aWxkIGNsay1zY3UubyBhbmQgY2xrLWlteDhxeHAubw0KPiBz
ZXBhcmF0ZWx5Lg0KPiAib2JqLSQoQ09ORklHX01YQ19DTEtfU0NVKSArPSBjbGstaW14LXNjdS5v
IGNsay1pbXgtbHBjZy1zY3Uubw0KPiBjbGstaW14LXNjdS0kKENPTkZJR19DTEtfSU1YOFFYUCkg
Kz0gY2xrLXNjdS5vIGNsay1pbXg4cXhwLm8iDQo+IE9ubHkgZW5hYmxlIE1YQ19DTEtfU0NVIHdo
aWxlIENMS19JTVg4UVhQIG5vdCBpcyBtZWFuaW5nbGVzcyBhbmQgYnVnZ3kuDQo+IA0KPiBUaGlz
IHBhdGNoIG1ha2VzIE1YQ19DTEtfU0NVIHRvIGJlIGludmlzaWJsZSB0byB1c2VycyBhbmQgY2Fu
IG9ubHkgYmUgc2VsZWN0ZWQNCj4gYnkgQ0xLX0lNWDhRWFAgb3B0aW9uIHRvIGVuc3VyZSB0aGV5
J3JlIGJ1aWx0IHRvZ2V0aGVyLg0KPiANCj4gRml4ZXM6IGUwZDBkNGQ4NmM3NjYgKCJjbGs6IGlt
eDhxeHA6IFN1cHBvcnQgYnVpbGRpbmcgaS5NWDhRWFAgY2xvY2sgZHJpdmVyDQo+IGFzIG1vZHVs
ZSIpDQo+IFJlcG9ydGVkLWJ5OiBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yIDxiaWdlYXN5QGxp
bnV0cm9uaXguZGU+DQo+IFNpZ25lZC1vZmYtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25n
QG54cC5jb20+DQoNClRoaXMgcGF0Y2ggaXMgcmVxdWlyZWQgZm9yIHY1LjEwIHJjNS4NClBsZWFz
ZSBoZWxwIHJldmlldy4NCg0KUmVnYXJkcw0KQWlzaGVuZw0KDQo+IC0tLQ0KPiAgZHJpdmVycy9j
bGsvaW14L0tjb25maWcgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9pbXgvS2NvbmZp
ZyBiL2RyaXZlcnMvY2xrL2lteC9LY29uZmlnIGluZGV4DQo+IDNiMzkzY2IwNzI5NS4uZGJhY2Rk
NzBhZjJlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2Nsay9pbXgvS2NvbmZpZw0KPiArKysgYi9k
cml2ZXJzL2Nsay9pbXgvS2NvbmZpZw0KPiBAQCAtNSw3ICs1LDcgQEAgY29uZmlnIE1YQ19DTEsN
Cj4gIAlkZXBlbmRzIG9uIEFSQ0hfTVhDIHx8IENPTVBJTEVfVEVTVA0KPiANCj4gIGNvbmZpZyBN
WENfQ0xLX1NDVQ0KPiAtCXRyaXN0YXRlICJJTVggU0NVIGNsb2NrIg0KPiArCXRyaXN0YXRlDQo+
ICAJZGVwZW5kcyBvbiBBUkNIX01YQyB8fCBDT01QSUxFX1RFU1QNCj4gIAlkZXBlbmRzIG9uIElN
WF9TQ1UgJiYgSEFWRV9BUk1fU01DQ0MNCj4gDQo+IC0tDQo+IDIuMjMuMA0KDQo=
