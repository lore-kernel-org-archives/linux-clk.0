Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AD0C63777
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 11:08:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E89DE2075A
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 11:08:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="TIyjJB9i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgKYLIm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Nov 2020 06:08:42 -0500
Received: from mail-eopbgr80048.outbound.protection.outlook.com ([40.107.8.48]:25411
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726034AbgKYLIl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 25 Nov 2020 06:08:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHSo+phLW7KVCzC5c+1jVDbImKrSqNGSGqEfMM9Q4uNnG0f+aqgKX420CS5YsnJUJ24inJ4WZA4WWsCaBJZUpNExRRZPUv17wu0KB5Huce9UU3MFSdnQH/BcDegxu2IsQeH5pT9P6RKIMKO15RkxOgy1NnmyV/gO0yIjuyQ7gflGd5D3YCBTEIu7OEEvPWpI8JPjvktdXe79rVSfQj8jCAcm1DCVt7HRLQFRHnQnNX8s5cKS2mHUZelVKk7rIsB0qVoXErPJTBLQkd/BznTmGCHX7iw3YqmUJy6cs222XyZVHYhNh/p8NNMMXpotxiUl8VpuZPxhYfN/hvf6nD2skg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HS6/XnrPbI174kgyLK+KQHGbyQsj7o1rIaK6BOfN7DY=;
 b=Y4kv1Vovll9jL5jGjgMlcDKop9tm+dkfg6G8nXuNDvR24bzyxaFNRyEX78I9aMs3Atc/pX9q1bSr/vq+/PZUtA9SdSjsyiZQs/Qanh279pyXfeXXfuPcdCxjt40UWcZXa+Gq3Kr9HnG8/JGmsNbntHzLMPq3fzuTA/7By+NvzTovsBMas3giLwfoXopr6NAK1dm/+s3cv1O86pfIzyY4IOjPJIeut+R0XlvtVWxd90kW08VLBg4Qa/pfn8OFkX0XweIMyZSH+0kwWWV2s4n7nxcr2VOL2xVQUApZh/fIcBkV0foDYkWJTr9FcMcVJIv4dtBTpvb8qCNdWPj0vXOzSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HS6/XnrPbI174kgyLK+KQHGbyQsj7o1rIaK6BOfN7DY=;
 b=TIyjJB9iuJezTCNhQ5Z+781y9HMnKiXAjfZDGgZ8r67qahLP5sbs7MXZ74F/AcFdDcfux2lNsTqR0kGckehmoCGfYX76bWZs216K3YjnYASKdYYfQ8eYj4whJLB2RSVnCwvFIfHwiNDw3IjMWDXA12bUdFXakcvbPVY8npFFxyU=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM5PR04MB3252.eurprd04.prod.outlook.com (2603:10a6:206:6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Wed, 25 Nov
 2020 11:08:38 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a%3]) with mapi id 15.20.3564.029; Wed, 25 Nov 2020
 11:08:38 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
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
Thread-Index: AQHWwlvRlJUaj2nxKEiTYKb+tbM2jKnYKJLAgABf3YCAABL3kIAAFmIg
Date:   Wed, 25 Nov 2020 11:08:38 +0000
Message-ID: <AM6PR04MB49661FFA170EA19B96F5F45980FA0@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20201124121740.ytag7rm53umi2qvm@linutronix.de>
 <AM6PR04MB49665B30445C929ABF458D3E80FA0@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <20201125084007.miwbxcln6tdkesgj@linutronix.de>
 <AM6PR04MB49665E5189ED5241B5471C3680FA0@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB49665E5189ED5241B5471C3680FA0@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linutronix.de; dkim=none (message not signed)
 header.d=none;linutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7010349d-dc63-44e7-8aa1-08d8913275a7
x-ms-traffictypediagnostic: AM5PR04MB3252:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3252F61290779D686BD677DE80FA0@AM5PR04MB3252.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BxjyTbt3+xPQvcO1H9t6T6+1HZpSe2iOJ8rlOy3jjjp/RB0hpvnoIJMCe8F52Sku1zi2i/sjaRSuH8DWfctEli1i3+0vmVH7dsO//5l4Q85aL9y2YWA6qgDoRqI4a8XMUJFMtUmP+SIpaDZ6NSHB9eIZevwA/fjMqRG8Z48M+P7CScLKkVa5GFDZ8LsxhoBlh6AOVAvVhvu4+DqviM/zI6yGk1lfsJduV6pi34G1bkvK/2P+W4PGM3zu++U1OlCdX1l9nGQDsWTsogYMWAnFJ79npaqiyUBR7uqHnloJumfTUqhD/4aNyQgcWmmE93ofciOIeO8nar1i2jpbIzOCi5vSNdWqBzdvS941HWeEGZr6UNPZkHvGfaMNzjzEN6VV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(9686003)(186003)(33656002)(66556008)(55016002)(66476007)(64756008)(66446008)(316002)(66946007)(8676002)(71200400001)(53546011)(44832011)(26005)(4326008)(2906002)(5660300002)(2940100002)(6916009)(76116006)(52536014)(478600001)(7416002)(8936002)(86362001)(6506007)(54906003)(7696005)(4001150100001)(83380400001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: UWFgy14QqCUbvmKVYiqoAJxl9K6gGAf+7nr10tgF/k7JpCiFu4sIckrpj+1oDl2Dgr3vzbvzgFMTTLAc4iQubP6UOMMqWfXvPpeIsvs+TH3H5yh0sPo+p8+6S0KOkt//EgrKzA8Qhq8F5kVCyHDYlFXVKwscd9ewMn1/X582n0fIsRGR0hj2VV6oPVm/1u5T1aCtFLVkqtP0seFFt8HMYq66RmlPO5zUuvsO7h25JElp/fjRABq+lEkS536mdmtUl1GhKpL/CM/BkkCVYeBntT/3m/q1QjPoBQbxD2L5KVDX4a7mOnoEfCzPcJrtueYWQrobDeCOLsG5hHo9T4VsPvLR50GLfwLwnp0i0qkASuqj2uWBcFyM8XstRMLc43YgwPoZIoN7uKW/2o23pnVqA1JV7bK/6e2CNZYR1lwVhS170xEMOQwfWu/2otUYaSH/yqdXhNdAmQNjLsJDlzZWEVJAjUx9WcCYe04T1T/pIa34m+SM13hcRlfhZSF0JH9w4mVnK4i5VBKPoyQonJUPj/Fff/aDFSb4mxPbntWmpqZ9/ugQjZ2jZh7XCvwLcUNNvxudIHdyW4N/SX5lmc4ZnKo8dBRV6++LrZC+h/aNI1SvrG5oqYcbF8UUYcpexxLrQw89LC2K89IP/Oqam9UqA5BD2DCjRyfDWHdFWr9jkQnyjUrJjgZ0WlJ4lCAR7lZLUqmvXaVVw9zAqp7Xt08ZSkvlDv9WAwKO34SQgr9FeQRL9P9spItw6b9Ffbk01PpOqfL9soyX0FTm5nexvMpv9MnX0Bg2lyOgD1cU0FM7PltEms23dl0btqyg6GAcFrdbekWkNz14Xt4ym8bz2jLsdbg9LeyS0GKOQpTgyItZdXbiwZZ1hF1eKXLy9YnJpvKBMLN7QkGMxvZd8GA6ycfQgg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7010349d-dc63-44e7-8aa1-08d8913275a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 11:08:38.0552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CawuYRrXgYXCJYDjFoe3Aais6PrJpqErDALu5Pwk5WGeh0G4SBX92gTcVOD0wTtlE1FHvotxF7dhliz6KzWvaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3252
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU2ViYXN0aWFuDQoNCj4gRnJvbTogQWlzaGVuZyBEb25nIDxhaXNoZW5nLmRvbmdAbnhwLmNv
bT4NCj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyNSwgMjAyMCA1OjUzIFBNDQo+IA0KPiA+
IEZyb206IFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3IgPGJpZ2Vhc3lAbGludXRyb25peC5kZT4N
Cj4gPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDI1LCAyMDIwIDQ6NDAgUE0NCj4gPg0KPiA+
IE9uIDIwMjAtMTEtMjUgMDc6MTU6MjQgWyswMDAwXSwgQWlzaGVuZyBEb25nIHdyb3RlOg0KPiA+
ID4gSSB0aGluayB0aGUgc2ltcGxlc3Qgc29sdXRpb24gaXMgbWFrZSBNWENfQ0xLX1NDVSB0byBi
ZSBpbnZpc2libGUgdG8NCj4gPiA+IHVzZXJzIGFuZCBjYW4gb25seSBiZSBzZWxlY3RlZCBieSBD
TEtfSU1YOFFYUCBvcHRpb24gYmVjYXVzZQ0KPiA+ID4gY3VycmVudGx5IGNsay1zY3UubyBhbmQg
Y2xrLWlteDhxeHAubyBhcmUgYnVpbHQgdG9nZXRoZXIsIGl0J3MNCj4gPiA+IG1lYW5pbmdsZXNz
IGFuZCBidWdneSB0byBzZXBhcmF0ZSB0aGVtLiBMb25ndGVybWx5IHRoZXkgd2lsbCBiZSBjb21i
aW5lZA0KPiBpbnRvIG9uZSBkcml2ZXIgZmlsZS4NCj4gPiA+DQo+ID4gPiBFLmcNCj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9pbXgvS2NvbmZpZyBiL2RyaXZlcnMvY2xrL2lteC9LY29u
ZmlnIGluZGV4DQo+ID4gPiAzYjM5M2NiMDcyOTUuLmRiYWNkZDcwYWYyZSAxMDA2NDQNCj4gPiA+
IC0tLSBhL2RyaXZlcnMvY2xrL2lteC9LY29uZmlnDQo+ID4gPiArKysgYi9kcml2ZXJzL2Nsay9p
bXgvS2NvbmZpZw0KPiA+ID4gQEAgLTUsNyArNSw3IEBAIGNvbmZpZyBNWENfQ0xLDQo+ID4gPiAg
ICAgICAgIGRlcGVuZHMgb24gQVJDSF9NWEMgfHwgQ09NUElMRV9URVNUDQo+ID4gPg0KPiA+ID4g
IGNvbmZpZyBNWENfQ0xLX1NDVQ0KPiA+ID4gLSAgICAgICB0cmlzdGF0ZSAiSU1YIFNDVSBjbG9j
ayINCj4gPiA+ICsgICAgICAgdHJpc3RhdGUNCj4gPiA+ICAgICAgICAgZGVwZW5kcyBvbiBBUkNI
X01YQyB8fCBDT01QSUxFX1RFU1QNCj4gPiA+ICAgICAgICAgZGVwZW5kcyBvbiBJTVhfU0NVICYm
IEhBVkVfQVJNX1NNQ0NDDQo+ID4NCj4gPiBTbyBpdCBzdGlsbCBiZWNvbWVzIGEgbW9kdWxlIGlm
IGl0IGdldHMgc2VsZWN0ZWQgYnkgb25lLCBsaWtlIENMS19JTVg4UVhQLg0KPiA+DQo+IA0KPiBZ
ZXMsIGFzIE1YQ19DTEtfU0NVIGFuZCBDTEtfSU1YOFFYUCB3aWxsIGJlIGVuYWJsZWQgYXQgdGhl
IHNhbWUgdGltZSBhbmQNCj4gY2xrLXNjdS5vIGFuZCBjbGstaW14OHF4cC5vIGFyZSBjb21waWxl
ZCB0b2dldGhlciBpbnRvIG9uZSBtb2R1bGUsIHRoZXJlIHdpbGwNCj4gYmUgbm8gc3VjaCBpc3N1
ZXMgcmVwb3J0ZWQgaW4gdGhpcyBlbWFpbC4NCj4gDQo+IA0KPiA+ID4gU2VlIGZpeGVzIGhlcmU6
DQo+IC4uLg0KPiA+DQo+ID4gV2hhdGV2ZXIgeW91IGRvLCBwbGVhc2UgbWFrZSBzdXJlIHRoZSBp
c3N1ZSBpbiB2NS4xMCBnZXRzIGFsc28gYWRkcmVzc2VkLg0KPiANCj4gV2lsbCB5b3Ugc2VuZCBv
dXQgYWJvdmUgcGF0Y2ggaWYgeW91J3JlIG9rPw0KPiBPciBJIHdpbGwgZG8gaXQgbm93IGlmIHlv
dSBkb24ndCBtaW5kLg0KDQpJIGp1c3Qgc2VudCBvdXQgdGhlIGZpeCB3aXRoIHlvdSBDQ2VkLg0K
DQpSZWdhcmRzDQpBaXNoZW5nDQoNCj4gDQo+IFJlZ2FyZHMNCj4gQWlzaGVuZw0KPiANCj4gPg0K
PiA+IFNlYmFzdGlhbg0K
