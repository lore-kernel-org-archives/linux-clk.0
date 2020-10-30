Return-Path: <SRS0=Ewk5=EF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36FDC00A89
	for <linux-clk@archiver.kernel.org>; Fri, 30 Oct 2020 16:14:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3598220719
	for <linux-clk@archiver.kernel.org>; Fri, 30 Oct 2020 16:14:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ekKafLlq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgJ3QOx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Oct 2020 12:14:53 -0400
Received: from mail-vi1eur05on2071.outbound.protection.outlook.com ([40.107.21.71]:15009
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725808AbgJ3QOw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 30 Oct 2020 12:14:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzFKbo110soBIXgHMd+VrujO7Ml4yYEtqj+C+L6GuhpYUA1+8WpXeaC0H9vG4PvIdUgWZUDgg2PS+I60X8kz+2LROGo3yAiz8zVUwFjM3BjwhJH8AxoA84ckx/29jhWxRwY84Y4LaiKtkXEsYJRXjL1sx36gpiaTbiZzTLvNTc0mf8wBeYLsYvI/oNPYBbUyDKr1VtLGAFdwiGM58fyUCCjWOxFIWSb2qoLsM1u/VLIIvwkwALcxEaDHJv07dZJ197pwHlWYmUfJFOOht889Ezy48cQo51t68xTxjYUxY7j1rwseaoyTtwjaicrvRuYuugyeTNNEf8AWqDznqhJ06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWYIa8adWegg/B0eoMcVfa0E/gCARNADR1N24kKRqtI=;
 b=UufXGHy4b9pfBiRyihF669JmsmUdH0WOBimIGH76Zq+NH82umnPqJjL9sPcUfq8b1efSkuQ8n7X0kgrDIQdolC30mDJ++sxwASpVYo36jbFm3kcST1z6PyYdUJwBh1Y1XHMr87ppYCvXRMjggYFL6bxSDiaL7m4NON3iJ/5MqBRmxFsm4y0o87NywnREDtY8byR9yl6NYjqeoADHMZheiwT65xkiKun1LwVHnf++LLZ92ArXQCI5CbIaQ5Q2EucFzYXXC6kpenue66epnErZ/IffQR2XULoEMPjL+WOb0v8kIrLDT0+o03xFiEvSV1Pck79c97x//4MxI3VVATeVuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWYIa8adWegg/B0eoMcVfa0E/gCARNADR1N24kKRqtI=;
 b=ekKafLlq6HYphgprhj9VhPyapFs6lE1i/i58wLKzJvGwmjdMEgS+Lif06K+dFusN8u+oxR9nZAHqNujN+1lq9dAFyfyhRUjyiZG22So4I2Y9/Xh8UwE1K3YdtOaQXkqaY8XPB1pp+M54H+kdhDfTeBMpt3khR1yyxewIb31i1bY=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5285.eurprd04.prod.outlook.com (2603:10a6:20b:3::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Fri, 30 Oct
 2020 15:58:45 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::546f:92f0:f3c5:a148]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::546f:92f0:f3c5:a148%7]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 15:58:38 +0000
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
Thread-Index: AQHWZX7rE4vC1Bdnl0Suy+3LMSN1jqmv5qsAgAAl/LCAANM40A==
Date:   Fri, 30 Oct 2020 15:58:38 +0000
Message-ID: <AM6PR04MB49666D16498847FC2C660D7D80150@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
 <1596009618-25516-4-git-send-email-aisheng.dong@nxp.com>
 <20201030010600.GA2760@Ryzen-9-3900X.localdomain>
 <VI1PR04MB497553625BE304915979C92080150@VI1PR04MB4975.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB497553625BE304915979C92080150@VI1PR04MB4975.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d7225aca-5a12-4fad-f7cf-08d87cecaa8e
x-ms-traffictypediagnostic: AM6PR04MB5285:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB528566B261206E1425A8888080150@AM6PR04MB5285.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +LMRRJcCgRJByMXqGleFIn90wPb2DbUAI/NATGK+u+rqqoT1dTdZ+YDkdNoXS5jgk+VAb0vAG9RUMT78jtRq9feJ8C3FivfUaNn+1vOtnTFYxntfV4ddicu3n9984W1ClQNTp/Z/grKJSoM2Xuf2lysvPlSkLhQpeVsHF3bZHUS+zPbcPIa5DEYYcdUik0nvxnp9V/PGq+wPqfJs1IwMwg9HCr8xhwAveYXRZBUA6tKWUnlL79yr82Sz45g9vsNfTCdoV1B5gvb9gU0ehpFWzeDnXs4Vpmpw/Tb/d0Z4n/a+0TSmZTnWu8t8aQGQ+AFcmw4DV8L2nlqVRDNZXuWCb7gnS/vSnSD86FflZPdpucmJloQAE4swkDIDlP/Km5Yf5m6sD3j8vHjTyfNI0FrCIQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(76116006)(66946007)(66476007)(66446008)(64756008)(66556008)(6506007)(4326008)(478600001)(2906002)(54906003)(26005)(52536014)(8936002)(966005)(8676002)(86362001)(7696005)(5660300002)(55016002)(83380400001)(186003)(6916009)(33656002)(44832011)(71200400001)(316002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: m3VYay3SXKcZjCdcMAGxbl2zfmLz/zdEnsxPGwWQlekMKBAn1yPhwYkqUyYZywWDlNpipmnN4BG/LriXmG4YQVEPpcQAYbXFByP7buBXAQ2OzgPSanwU+4p4YxQ9IImY0zEM0175De6fySnmhlxPSwLg/YvT2L+DJf8u8CK5DQ3cVAc98DP8pxRXQesjgvbMh3tDggaOc7X2fO1U69J7daurRpP9GnuwaC4cMchLPOn3Mwv9vhXlZkQ28axsFszq63qt2v/rvcfUDZqenm0kEBXO8/4Aqz1O2/Fb7DlmBI/MJSjzRSEk59K+VhSm0BquWCiL5kFOmPjCXBqfOFqpprxuZHlNWbeVXY27oYGpHpvevVILx7yUqF/e7yDROBWxZSAr2AHrW2hHOoFbMybCemPQhmHU7F4LUsSUNLOWH0V2ZjZBRrE5TtvDcUESoYqIuZPnrqG2Oc0ZfjyDNeg1E5ZbCmzY0SRbtx5s6GuflUmBPgkHMRsHIEN7l9r4GVZ75qWOcDFyTQ7SeW/H/CsTMc2qpjSVqgPBhOaA8yfq90uWSXzPEKjtzdiGEf/dt4rUWr2S5atjQkJ0UBBW3IMqddigxngmf3182XdMlUsmjcsAqcXRyUYGoYxzq4+x+e2Kw4ARmxHx44kqLv1gp3Ed1w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7225aca-5a12-4fad-f7cf-08d87cecaa8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 15:58:38.7418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cc0kFBjW3WF5m77398xlu9Kwc80b5rVWfbfnXRiT3AVFPJ7pzql+TjBILAW/92Ubk0/rIYMKgFcYdtZryG/xpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5285
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBBaXNoZW5nIERvbmcNCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDMwLCAyMDIwIDEx
OjIyIEFNDQo+IA0KPiA+IEZyb206IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBn
bWFpbC5jb20+DQo+ID4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDMwLCAyMDIwIDk6MDYgQU0NCj4g
Pg0KPiA+IE9uIFdlZCwgSnVsIDI5LCAyMDIwIGF0IDA0OjAwOjEwUE0gKzA4MDAsIERvbmcgQWlz
aGVuZyB3cm90ZToNCj4gPiA+IFRoaXMgcGF0Y2ggaW1wbGVtZW50cyB0aGUgbmV3IHR3byBjZWxs
cyBiaW5kaW5nIGZvciBTQ1UgY2xvY2tzLg0KPiA+ID4gVGhlIHVzYWdlIGlzIGFzIGZvbGxvd3M6
DQo+ID4gPiBjbG9ja3MgPSA8JnVhcnQwX2NsayBJTVhfU0NfUl9VQVJUXzAgSU1YX1NDX1BNX0NM
S19QRVI+DQo+ID4gPg0KPiA+ID4gRHVlIHRvIGVhY2ggU0NVIGNsb2NrIGlzIGFzc29jaWF0ZWQg
d2l0aCBhIHBvd2VyIGRvbWFpbiwgd2l0aG91dA0KPiA+ID4gcG93ZXIgb24gdGhlIGRvbWFpbiwg
dGhlIFNDVSBjbG9jayBjYW4ndCB3b3JrLiBTbyB3ZSBjcmVhdGUgcGxhdGZvcm0NCj4gPiA+IGRl
dmljZXMgZm9yIGVhY2ggZG9tYWluIGNsb2NrIHJlc3BlY3RpdmVseSBhbmQgbWFudWFsbHkgYXR0
YWNoIHRoZQ0KPiA+ID4gcmVxdWlyZWQgZG9tYWluIGJlZm9yZSByZWdpc3RlciB0aGUgY2xvY2sg
ZGV2aWNlcywgdGhlbiB3ZSBjYW4NCj4gPiA+IHJlZ2lzdGVyIGNsb2NrcyBpbiB0aGUgY2xvY2sg
cGxhdGZvcm0gZHJpdmVyIGFjY29yZGluZ2x5Lg0KPiA+ID4NCj4gPiA+IE5vdGUgYmVjYXVzZSB3
ZSBkbyBub3QgaGF2ZSBwb3dlciBkb21haW4gaW5mbyBpbiBkZXZpY2UgdHJlZSBhbmQgdGhlDQo+
ID4gPiBTQ1UgcmVzb3VyY2UgSUQgaXMgdGhlIHNhbWUgZm9yIHBvd2VyIGRvbWFpbiBhbmQgY2xv
Y2ssIHNvIHdlIHVzZQ0KPiA+ID4gcmVzb3VyY2UgSUQgdG8gZmluZCBwb3dlciBkb21haW5zLg0K
PiA+ID4NCj4gPiA+IExhdGVyLCB3ZSB3aWxsIGFsc28gdXNlIHRoaXMgY2xvY2sgcGxhdGZvcm0g
ZHJpdmVyIHRvIHN1cHBvcnQNCj4gPiA+IHN1c3BlbmQvcmVzdW1lIGFuZCBydW50aW1lIHBtLg0K
PiA+ID4NCj4gPiA+IENjOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+ID4gPiBD
YzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPg0KPiA+ID4gQ2M6IFNhc2NoYSBIYXVl
ciA8a2VybmVsQHBlbmd1dHJvbml4LmRlPg0KPiA+ID4gQ2M6IE1pY2hhZWwgVHVycXVldHRlIDxt
dHVycXVldHRlQGJheWxpYnJlLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IERvbmcgQWlzaGVu
ZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQo+ID4NCj4gPiBUaGlzIHBhdGNoIGJyZWFrcyBhbGxt
b2Rjb25maWcuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBpbmZvLg0KPiBJJ20gY2hlY2tpbmcgaXQu
DQoNClNlZSBmaXggaGVyZS4NCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9s
aW51eC1jbGsvcGF0Y2gvMjAyMDEwMzAxNTM3MzMuMzAxNjAtMS1haXNoZW5nLmRvbmdAbnhwLmNv
bS8NCg0KUmVnYXJkcw0KQWlzaGVuZw0KDQo+IA0KPiBSZWdhcmRzDQo+IEFpc2hlbmcNCj4gDQo+
ID4NCj4gPiAkIG1ha2UgLXNraiIkKG5wcm9jKSIgQVJDSD1hcm0gQ1JPU1NfQ09NUElMRT1hcm0t
bGludXgtZ251ZWFiaS0NCj4gPiBkaXN0Y2xlYW4gYWxsbW9kY29uZmlnIGRyaXZlcnMvY2xrL2lt
eC8gSW4gZmlsZSBpbmNsdWRlZCBmcm9tDQo+ID4gLi9pbmNsdWRlL2xpbnV4L2RldmljZS5oOjMy
LA0KPiA+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvb2ZfcGxhdGZvcm0u
aDo5LA0KPiA+ICAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL2Nsay9pbXgvY2xrLXNjdS5j
OjExOg0KPiA+IC4vaW5jbHVkZS9saW51eC9kZXZpY2UvZHJpdmVyLmg6MjkwOjE6IHdhcm5pbmc6
IGRhdGEgZGVmaW5pdGlvbiBoYXMgbm8NCj4gPiB0eXBlIG9yIHN0b3JhZ2UgY2xhc3MNCj4gPiAg
IDI5MCB8IGRldmljZV9pbml0Y2FsbChfX2RyaXZlciMjX2luaXQpOw0KPiA+ICAgICAgIHwgXn5+
fn5+fn5+fn5+fn5+DQo+ID4gLi9pbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RldmljZS5oOjI1ODoy
OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8NCj4gPiAnYnVpbHRpbl9kcml2ZXInDQo+ID4g
ICAyNTggfCAgYnVpbHRpbl9kcml2ZXIoX19wbGF0Zm9ybV9kcml2ZXIsIHBsYXRmb3JtX2RyaXZl
cl9yZWdpc3RlcikNCj4gPiAgICAgICB8ICBefn5+fn5+fn5+fn5+fg0KPiA+IGRyaXZlcnMvY2xr
L2lteC9jbGstc2N1LmM6NTQ1OjE6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybw0KPiA+ICdi
dWlsdGluX3BsYXRmb3JtX2RyaXZlcicNCj4gPiAgIDU0NSB8IGJ1aWx0aW5fcGxhdGZvcm1fZHJp
dmVyKGlteF9jbGtfc2N1X2RyaXZlcik7DQo+ID4gICAgICAgfCBefn5+fn5+fn5+fn5+fn5+fn5+
fn5+fg0KPiA+IC4vaW5jbHVkZS9saW51eC9kZXZpY2UvZHJpdmVyLmg6MjkwOjE6IGVycm9yOiB0
eXBlIGRlZmF1bHRzIHRvICdpbnQnDQo+ID4gaW4gZGVjbGFyYXRpb24gb2YgJ2RldmljZV9pbml0
Y2FsbCcgWy1XZXJyb3I9aW1wbGljaXQtaW50XQ0KPiA+ICAgMjkwIHwgZGV2aWNlX2luaXRjYWxs
KF9fZHJpdmVyIyNfaW5pdCk7DQo+ID4gICAgICAgfCBefn5+fn5+fn5+fn5+fn4NCj4gPiAuL2lu
Y2x1ZGUvbGludXgvcGxhdGZvcm1fZGV2aWNlLmg6MjU4OjI6IG5vdGU6IGluIGV4cGFuc2lvbiBv
ZiBtYWNybw0KPiA+ICdidWlsdGluX2RyaXZlcicNCj4gPiAgIDI1OCB8ICBidWlsdGluX2RyaXZl
cihfX3BsYXRmb3JtX2RyaXZlciwgcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKQ0KPiA+ICAgICAg
IHwgIF5+fn5+fn5+fn5+fn5+DQo+ID4gZHJpdmVycy9jbGsvaW14L2Nsay1zY3UuYzo1NDU6MTog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvDQo+ID4gJ2J1aWx0aW5fcGxhdGZvcm1fZHJpdmVy
Jw0KPiA+ICAgNTQ1IHwgYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXIoaW14X2Nsa19zY3VfZHJpdmVy
KTsNCj4gPiAgICAgICB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+ID4gZHJpdmVycy9jbGsv
aW14L2Nsay1zY3UuYzo1NDU6MTogd2FybmluZzogcGFyYW1ldGVyIG5hbWVzICh3aXRob3V0DQo+
ID4gdHlwZXMpIGluIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIEluIGZpbGUgaW5jbHVkZWQgZnJvbSAu
L2luY2x1ZGUvbGludXgvZGV2aWNlLmg6MzIsDQo+ID4gICAgICAgICAgICAgICAgICBmcm9tIC4v
aW5jbHVkZS9saW51eC9vZl9wbGF0Zm9ybS5oOjksDQo+ID4gICAgICAgICAgICAgICAgICBmcm9t
IGRyaXZlcnMvY2xrL2lteC9jbGstc2N1LmM6MTE6DQo+ID4gZHJpdmVycy9jbGsvaW14L2Nsay1z
Y3UuYzo1NDU6MjU6IHdhcm5pbmc6ICdpbXhfY2xrX3NjdV9kcml2ZXJfaW5pdCcNCj4gPiBkZWZp
bmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dDQo+ID4gICA1NDUgfCBidWlsdGlu
X3BsYXRmb3JtX2RyaXZlcihpbXhfY2xrX3NjdV9kcml2ZXIpOw0KPiA+ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+DQo+ID4gLi9pbmNsdWRlL2xpbnV4
L2RldmljZS9kcml2ZXIuaDoyODY6MTk6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8NCj4g
PiAnYnVpbHRpbl9kcml2ZXInDQo+ID4gICAyODYgfCBzdGF0aWMgaW50IF9faW5pdCBfX2RyaXZl
ciMjX2luaXQodm9pZCkgXA0KPiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4N
Cj4gPiBkcml2ZXJzL2Nsay9pbXgvY2xrLXNjdS5jOjU0NToxOiBub3RlOiBpbiBleHBhbnNpb24g
b2YgbWFjcm8NCj4gPiAnYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXInDQo+ID4gICA1NDUgfCBidWls
dGluX3BsYXRmb3JtX2RyaXZlcihpbXhfY2xrX3NjdV9kcml2ZXIpOw0KPiA+ICAgICAgIHwgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gPiBjYzE6IHNvbWUgd2FybmluZ3MgYmVpbmcgdHJlYXRl
ZCBhcyBlcnJvcnMNCj4gPiBtYWtlWzRdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6Mjgz
OiBkcml2ZXJzL2Nsay9pbXgvY2xrLXNjdS5vXQ0KPiA+IEVycm9yIDENCj4gPiBtYWtlWzRdOiBU
YXJnZXQgJ19fYnVpbGQnIG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+ID4gbWFrZVsz
XTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjUwMDogZHJpdmVycy9jbGsvaW14XSBFcnJv
ciAyDQo+ID4gbWFrZVszXTogVGFyZ2V0ICdfX2J1aWxkJyBub3QgcmVtYWRlIGJlY2F1c2Ugb2Yg
ZXJyb3JzLg0KPiA+IG1ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1MDA6IGRy
aXZlcnMvY2xrXSBFcnJvciAyDQo+ID4gbWFrZVsyXTogVGFyZ2V0ICdfX2J1aWxkJyBub3QgcmVt
YWRlIGJlY2F1c2Ugb2YgZXJyb3JzLg0KPiA+IG1ha2VbMV06ICoqKiBbTWFrZWZpbGU6MTc5OTog
ZHJpdmVyc10gRXJyb3IgMg0KPiA+IG1ha2VbMV06IFRhcmdldCAnZHJpdmVycy9jbGsvaW14Lycg
bm90IHJlbWFkZSBiZWNhdXNlIG9mIGVycm9ycy4NCj4gPiBtYWtlOiAqKiogW01ha2VmaWxlOjMz
NTogX19idWlsZF9vbmVfYnlfb25lXSBFcnJvciAyDQo+ID4gbWFrZTogVGFyZ2V0ICdkaXN0Y2xl
YW4nIG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+ID4gbWFrZTogVGFyZ2V0ICdhbGxt
b2Rjb25maWcnIG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+ID4gbWFrZTogVGFyZ2V0
ICdkcml2ZXJzL2Nsay9pbXgvJyBub3QgcmVtYWRlIGJlY2F1c2Ugb2YgZXJyb3JzLg0KPiA+DQo+
ID4gQ2hlZXJzLA0KPiA+IE5hdGhhbg0K
