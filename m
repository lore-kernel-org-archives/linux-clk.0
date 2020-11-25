Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66127C63777
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 07:15:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0622B20DD4
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 07:15:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hd+JI0Aj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgKYHPb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Nov 2020 02:15:31 -0500
Received: from mail-am6eur05on2076.outbound.protection.outlook.com ([40.107.22.76]:8160
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726930AbgKYHPb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 25 Nov 2020 02:15:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRcK/RHuzFTlg8rcSNI+B2uYRktPxLcZMg8er4qvtO3NULnuAO6JxivkokXKVvGIheS/PhWtk/44BrnJi8/KOAMJVLhVtb74dH/g25lt8BMiso+WLD5WPwGs7++R/qZq7p/gctpD3O1/zD7B/5U3Fq7YRzErcjk79sdbQloerd63YTyJV62C5CU89eZretAnzUF95jIEZ1+5i2bXTA12rN5O48V7RkULccZP+8l6MoVYhy3sw89rwumlPtnIAGnxwWbvI62e7MdVELje+PaDkVupIjsyN5pM5AIBr4fqyy8FTM/Dx1l99SCm5Btk4SaNQL2a+RPfUFn+u28rxTMlXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpqKJYBzPHr/TuQdBKIZZvVZENCBQcM8CMG+afSqH2c=;
 b=Kd7lNjld0RRtxAMYJy+yMBW6LG4KByItbEEJIZHNuYUZC2CsXxUZZKgDX+9emrJGsgNypXNXDOhmcWTntU7QdZXUOo1EAn8tYK0pwXaHGFaInq27XTu0pUs2xFFyBOkqA2HKKLZk0dOjgODYA7ygLMb+thBMzi4B8M1ixWh13V6Ut36ZHJCJQOYtYYP6rbaQsFYyVSE8uMLJ206WjQ788vbLlQouaJBLT/kIOAgXpLIuBxB6YhEc4wOgeBB5YHgNdsxe6LIdSYdVDeYYInLu+i5/k9Mo1SCFWr7HmZs8atGUlW2/RLTxMWdst/TMU3ZO/dAwFEG05VbrCB7jxyZ5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpqKJYBzPHr/TuQdBKIZZvVZENCBQcM8CMG+afSqH2c=;
 b=Hd+JI0Aj8RHnCdIlFqms8+NuToUmYtg2rob3fuaY5z4JTFPKbTv1PHV0eTMGlMe07Du/nmloz82bLePiPtylRmiFTzdGg4b8jH+gLkXm/UHMZE36WYSCgvEAA+IdtveIYsF/c9RkPH9SR3IadY6trRprZ76uVPJhr93V1DyojHU=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5862.eurprd04.prod.outlook.com (2603:10a6:20b:a0::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 25 Nov
 2020 07:15:24 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a%3]) with mapi id 15.20.3564.029; Wed, 25 Nov 2020
 07:15:24 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: RE: [RFC PATCH] clk: imx8qxp: Unbreak auto module building for
 MXC_CLK_SCU
Thread-Topic: [RFC PATCH] clk: imx8qxp: Unbreak auto module building for
 MXC_CLK_SCU
Thread-Index: AQHWwlvRlJUaj2nxKEiTYKb+tbM2jKnYKJLA
Date:   Wed, 25 Nov 2020 07:15:24 +0000
Message-ID: <AM6PR04MB49665B30445C929ABF458D3E80FA0@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20201124121740.ytag7rm53umi2qvm@linutronix.de>
In-Reply-To: <20201124121740.ytag7rm53umi2qvm@linutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linutronix.de; dkim=none (message not signed)
 header.d=none;linutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8f36a5f9-ffb4-4643-c874-08d89111e0df
x-ms-traffictypediagnostic: AM6PR04MB5862:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB58624CB1F90429397B6A767A80FA0@AM6PR04MB5862.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:268;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +XyFWq1Da8SNzo3CRcyy0JiP+MMkvpjE5vhFTsgDkvuSuPIqJLGU+dqsTH8IYK6rCxmYgz1Lp6zhIK+h0cZ622yimUW41bXrvtFRVW8a8vOYRMqzu6JediKlLIU+TenUKra87muwRKL+7HJixYWVerukQ4vOKBcYFEOdWlSRfentbkwamVVTfXofCN5K6Gz8Jis6L3M897sQq/YO0cMDD+HeeEUDcnJsaJqANtkVUTFB8maV36psPWkRM5NLvl/sM+BeetLrmXOsWsUGSpRlb/DeRE7BzsUGD7m4oryEWTqctRNMSa+9D5HbuD8wn7qBujKShzJ+9DmYfIlRE4ri0FZN94QK5jTeqSyx/xmbiRWBRMTAnmTUsovJz5+/5cklFdWFLmKTV8kRZ4sH02PtpoxarvD5TUUrv0t54MhMZpUKq6MYg5EO4OjXJ4xjtUtwqTAd+Z1kRX3a1TH2qj8pIg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(9686003)(55016002)(7696005)(83380400001)(7416002)(966005)(8676002)(54906003)(110136005)(8936002)(6506007)(66476007)(316002)(52536014)(478600001)(64756008)(71200400001)(66556008)(66446008)(186003)(33656002)(76116006)(66946007)(5660300002)(4326008)(86362001)(44832011)(2906002)(26005)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: l0btW2+CQB6adcX6JtGRf5WYb+KP/RkB8ir0t0CRzdKv2ydeYaq8H4FI01RvQFays8wT+5UNaVWlKu0s2rt364HVrtIFejsD/LwGPhwP4gkR1sd5amzqo8vU/ESRo1cbVxwdrbz9+yktAHJhPZNoSfctKtYk55aWD+CGGnHhQwU3+TOU7eRWsvaLCl3kKjBzpWfI3HbNA/fgVUDFdT0/MuVjZgqoaNmqk6tyZRPcERc4+60vvhrhONjCvCQmNaaSZwKtuSa5FGatT92Lh7pG+uSQ8Qhmcm0AvAo1cY1oTp88bSVUJgv5xSJHFaD2STt40tu8m4w+id2w0GhcaYXaAXbEooYDTVXxnDvMIufMqxklJNsmH/fsKo7BB/687QA+dW3GARPzhDY+uA4MQnUN01AWQkcUprncw06WZ1DEwOsF3K4tUSc071g08JnrgGqjL9W4i+MJjxUOuNi6Mjl9u4pVmZzWy9idHO2YMt9j59o5CDG+x1KL2/MAz9xaKpWo3SIMGrS7z5gvCVJtgax+m//jgIhf3EjLG6xc9zaQyxOYubxSsOTKCviRH8sI16WDAkFKn4gkFg466B94vQ/FphRvXBy/ltBcqWKFrT+CYEcmSR8Lfnchf2hKgO3c6FotzUCeIiInGHDEudIzVVfmZ+Xlyb4Uk4nt8/J31rGEGFKdrRJJbAjxdKLmElyPXlscuMHmKQBJfVQczm0X7kMZ+q1QADTcYJrk2LU/SmTXnq69c5uOGCi8YMSqLVe7GJk6WX+FQuPRKhhqHh6E7UR6vDWjwKDcMjWzCs11xFHoVVjAsJ+SfdICymC4/NceIVL+xLeZhUGk3pENld4xMwPFG5LME2McTf0vI5cWXfnowGCN3+lDGupjQfk5rq8puE3uE5GFbvzPR+cqYoDw4mOtVg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f36a5f9-ffb4-4643-c874-08d89111e0df
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 07:15:24.5299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RUmIdJm/vPef/zXNBo7Tn+5+wio5zYuUBC7aREnpUnKVRBVvYV4GjJXdlQrBT5auTMBR06vID+/ebESVEAvTVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5862
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yIDxiaWdlYXN5QGxpbnV0cm9uaXguZGU+
DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDI0LCAyMDIwIDg6MTggUE0NCj4gDQo+IEF1dG9t
YXRpYyBtb3VkdWxlIGJ1aWxkaW5nIGlzIGJyb2tlbiBieSBhZGRpbmcgbW9kdWxlIHN1cHBvcnQg
dG8gaS5NWDhRWFANCj4gY2xvY2sgZHJpdmVyLiBJdCBjYW4gYmUgdGVzdGVkIGJ5IEFSTSBkZWZj
b25maWcgKyBDT05GSUdfSU1YX01CT1g9bSBhbmQNCj4gQ09ORklHX01YQ19DTEtfU0NVPW0uDQo+
IA0KPiBUaGUgY29tcGlsZSBicmVha3MgYmVjYXVzZSB0aGUgbW9kdWxlcyBhbmQgc291cmNlIGZp
bGVzIGFyZSBtaXhlZC4NCj4gQWZ0ZXIgZml4aW5nIHRoYXQsIHRoZSBidWlsZCBicmVha3MgYmVj
YXVzZSB0aGUgU0NVIGRyaXZlciBoYXMgbm8gbGljZW5zZSBvcg0KPiBzeW1ib2xzLCB3aGljaCBh
cmUgcmVxdWlyZWQgYnkgdGhlIENMS19JTVg4UVhQIGRyaXZlciwgYXJlIG5vdCBwcm9wZXJseQ0K
PiBleHBvcnRlZC4NCj4gDQo+IFRoZSBmb2xsb3dpbmcgcGF0Y2ggaXMgYWdhaW5zdCAtcmM1Og0K
PiANCj4gQ29tcGlsZSBtb2R1bGUgY2xrLWlteC1zY3UubyB3aGljaCBjb250YWlucyBvZiBjbGst
c2N1Lm8gY2xrLWxwY2ctc2N1Lm8gaWYNCj4gQ09ORklHX01YQ19DTEtfU0NVIGlzIGVuYWJsZWQu
DQo+IENvbXBpbGUgbW9kdWxlcyBjbGstaW14OHF4cC5vIGFuZCBjbGstaW14OHF4cC1scGNnLm8g
aWYNCj4gQ09ORklHX0NMS19JTVg4UVhQIGlzIGVuYWJsZWQuDQo+IEFkZCBFWFBPUlRfU1lNQk9M
X0dQTCgpIHRvIGZ1bmN0aW9ucyB3aGljaCBmYWlsIHRvIHJlc29sdmUgb25jZQ0KPiBDT05GSUdf
Q0xLX0lNWDhRWFAgaXMgZW5hYmxlZCBhcyBtb2R1bGUuDQo+IEFkZCBMaWNlbnNlIEdQTCB0byBj
bGstc2N1LmMuDQo+IA0KDQpJIHRoaW5rIHRoZSBzaW1wbGVzdCBzb2x1dGlvbiBpcyBtYWtlIE1Y
Q19DTEtfU0NVIHRvIGJlIGludmlzaWJsZSB0byB1c2VycyBhbmQgY2FuIG9ubHkNCmJlIHNlbGVj
dGVkIGJ5IENMS19JTVg4UVhQIG9wdGlvbiBiZWNhdXNlIGN1cnJlbnRseSBjbGstc2N1Lm8gYW5k
IGNsay1pbXg4cXhwLm8gYXJlIGJ1aWx0DQp0b2dldGhlciwgaXQncyBtZWFuaW5nbGVzcyBhbmQg
YnVnZ3kgdG8gc2VwYXJhdGUgdGhlbS4gTG9uZ3Rlcm1seSB0aGV5IHdpbGwgYmUgY29tYmluZWQg
aW50bw0Kb25lIGRyaXZlciBmaWxlLg0KDQpFLmcNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9p
bXgvS2NvbmZpZyBiL2RyaXZlcnMvY2xrL2lteC9LY29uZmlnDQppbmRleCAzYjM5M2NiMDcyOTUu
LmRiYWNkZDcwYWYyZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvY2xrL2lteC9LY29uZmlnDQorKysg
Yi9kcml2ZXJzL2Nsay9pbXgvS2NvbmZpZw0KQEAgLTUsNyArNSw3IEBAIGNvbmZpZyBNWENfQ0xL
DQogICAgICAgIGRlcGVuZHMgb24gQVJDSF9NWEMgfHwgQ09NUElMRV9URVNUDQogDQogY29uZmln
IE1YQ19DTEtfU0NVDQotICAgICAgIHRyaXN0YXRlICJJTVggU0NVIGNsb2NrIg0KKyAgICAgICB0
cmlzdGF0ZQ0KICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfTVhDIHx8IENPTVBJTEVfVEVTVA0KICAg
ICAgICBkZXBlbmRzIG9uIElNWF9TQ1UgJiYgSEFWRV9BUk1fU01DQ0MNCg0KPiBJbiAtbmV4dCBp
dCBicmVha3MgYWRkaXRpb25hbGx5IGJlY2F1c2UgZGV2aWNlX2lzX2JvdW5kKCkgaXMgbm90IG1h
ZGUgYXZhaWxhYmxlDQo+IHRvIG1vZHVsZXMuDQo+IEFueSBzdWdnZXN0aW9ucz8gU2hvdWxkIHRo
ZSBvcmlnaW5hbCBjb21taXQgYmUgcmV2b2tlZD8NCg0KU2VlIGZpeGVzIGhlcmU6DQpodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtY2xrL2NvdmVyLzIwMjAxMTI0MTAw
ODAyLjIyNzc1LTEtYWlzaGVuZy5kb25nQG54cC5jb20vDQoNCj4gDQo+IEZpeGVzOiBlMGQwZDRk
ODZjNzY2ICgiY2xrOiBpbXg4cXhwOiBTdXBwb3J0IGJ1aWxkaW5nIGkuTVg4UVhQIGNsb2NrIGRy
aXZlcg0KPiBhcyBtb2R1bGUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gQW5kcnplaiBT
aWV3aW9yIDxiaWdlYXN5QGxpbnV0cm9uaXguZGU+DQo+IC0tLQ0KPiANCj4gIGRyaXZlcnMvY2xr
L2lteC9NYWtlZmlsZSAgICAgICB8IDYgKysrLS0tDQo+ICBkcml2ZXJzL2Nsay9pbXgvY2xrLWxw
Y2ctc2N1LmMgfCAxICsNCj4gIGRyaXZlcnMvY2xrL2lteC9jbGstc2N1LmMgICAgICB8IDQgKysr
Kw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvaW14L01ha2VmaWxlIGIvZHJpdmVycy9jbGsv
aW14L01ha2VmaWxlIGluZGV4DQo+IGRkNmE3MzdkMDYwYjQuLmI4YmY5NDYwYzkxZDcgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvY2xrL2lteC9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL2Nsay9p
bXgvTWFrZWZpbGUNCj4gQEAgLTI2LDkgKzI2LDkgQEAgb2JqLSQoQ09ORklHX0NMS19JTVg4TU4p
ICs9IGNsay1pbXg4bW4ubw0KPiAgb2JqLSQoQ09ORklHX0NMS19JTVg4TVApICs9IGNsay1pbXg4
bXAubw0KPiAgb2JqLSQoQ09ORklHX0NMS19JTVg4TVEpICs9IGNsay1pbXg4bXEubw0KPiANCj4g
LW9iai0kKENPTkZJR19NWENfQ0xLX1NDVSkgKz0gY2xrLWlteC1zY3UubyBjbGstaW14LWxwY2ct
c2N1Lm8NCj4gLWNsay1pbXgtc2N1LSQoQ09ORklHX0NMS19JTVg4UVhQKSArPSBjbGstc2N1Lm8g
Y2xrLWlteDhxeHAubw0KPiAtY2xrLWlteC1scGNnLXNjdS0kKENPTkZJR19DTEtfSU1YOFFYUCkg
Kz0gY2xrLWxwY2ctc2N1Lm8NCj4gY2xrLWlteDhxeHAtbHBjZy5vDQo+ICtvYmotJChDT05GSUdf
TVhDX0NMS19TQ1UpCSs9IGNsay1pbXgtc2N1Lm8NCj4gK2Nsay1pbXgtc2N1LXkJCQk6PSBjbGst
c2N1Lm8gY2xrLWxwY2ctc2N1Lm8NCg0KV2UgY2FuJ3QgZG8gdGhpcyBiZWNhdXNlIGNsay1zY3Ug
IGFuZCBjbGstbHBjZy1zY3UgYXJlIHNlcGFyYXRlIGRyaXZlcnMuDQoNClJlZ2FyZHMNCkFpc2hl
bmcNCg0KPiArb2JqLSQoQ09ORklHX0NMS19JTVg4UVhQKQkrPSBjbGstaW14OHF4cC5vIGNsay1p
bXg4cXhwLWxwY2cubw0KPiANCj4gIG9iai0kKENPTkZJR19DTEtfSU1YMSkgICArPSBjbGstaW14
MS5vDQo+ICBvYmotJChDT05GSUdfQ0xLX0lNWDI1KSAgKz0gY2xrLWlteDI1Lm8gZGlmZiAtLWdp
dA0KPiBhL2RyaXZlcnMvY2xrL2lteC9jbGstbHBjZy1zY3UuYyBiL2RyaXZlcnMvY2xrL2lteC9j
bGstbHBjZy1zY3UuYyBpbmRleA0KPiAxZjBlNDRmOTIxYWVlLi4zMzZkY2U0M2RhODJkIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2Nsay9pbXgvY2xrLWxwY2ctc2N1LmMNCj4gKysrIGIvZHJpdmVy
cy9jbGsvaW14L2Nsay1scGNnLXNjdS5jDQo+IEBAIC0xMTUsMyArMTE1LDQgQEAgc3RydWN0IGNs
a19odyAqaW14X2Nsa19scGNnX3NjdShjb25zdCBjaGFyICpuYW1lLA0KPiBjb25zdCBjaGFyICpw
YXJlbnRfbmFtZSwNCj4gDQo+ICAJcmV0dXJuIGh3Ow0KPiAgfQ0KPiArRVhQT1JUX1NZTUJPTF9H
UEwoaW14X2Nsa19scGNnX3NjdSk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9pbXgvY2xr
LXNjdS5jIGIvZHJpdmVycy9jbGsvaW14L2Nsay1zY3UuYyBpbmRleA0KPiBiOGIyMDcyNzQyYTU2
Li4wMjZhMzM2MDZhZTUzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2Nsay9pbXgvY2xrLXNjdS5j
DQo+ICsrKyBiL2RyaXZlcnMvY2xrL2lteC9jbGstc2N1LmMNCj4gQEAgLTksNiArOSw3IEBADQo+
ICAjaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvZXJy
Lmg+DQo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPg0KPiANCj4gICNpbmNsdWRlICJjbGstc2N1LmgiDQo+IA0KPiBAQCAtMTMyLDYgKzEzMyw3
IEBAIGludCBpbXhfY2xrX3NjdV9pbml0KHZvaWQpICB7DQo+ICAJcmV0dXJuIGlteF9zY3VfZ2V0
X2hhbmRsZSgmY2NtX2lwY19oYW5kbGUpOw0KPiAgfQ0KPiArRVhQT1JUX1NZTUJPTF9HUEwoaW14
X2Nsa19zY3VfaW5pdCk7DQo+IA0KPiAgLyoNCj4gICAqIGNsa19zY3VfcmVjYWxjX3JhdGUgLSBH
ZXQgY2xvY2sgcmF0ZSBmb3IgYSBTQ1UgY2xvY2sgQEAgLTM4NywzICszODksNSBAQA0KPiBzdHJ1
Y3QgY2xrX2h3ICpfX2lteF9jbGtfc2N1KGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIgKiBj
b25zdCAqcGFyZW50cywNCj4gDQo+ICAJcmV0dXJuIGh3Ow0KPiAgfQ0KPiArRVhQT1JUX1NZTUJP
TF9HUEwoX19pbXhfY2xrX3NjdSk7DQo+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7DQo+IC0tDQo+
IDIuMjkuMg0KDQo=
