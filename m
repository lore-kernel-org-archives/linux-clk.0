Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BE8C56201
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 09:53:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 652D0206B5
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 09:53:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="sk6pa+Nf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728174AbgKYJxU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Nov 2020 04:53:20 -0500
Received: from mail-eopbgr60051.outbound.protection.outlook.com ([40.107.6.51]:16344
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728079AbgKYJxU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 25 Nov 2020 04:53:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zi50ff9vSccLIvHdS+5w/A2k4IbVSPyEkT2qk9rlZk7zWYJdgn3ZOQGPJs3SSutWhWsYI67jwdj0sR33fHUNpqMinfabfQkm6CT4/Sk3EXjCCiUJMvpIPMEJvPP5fAVz2QHZP1Iysfwh1eAcG37L2xUj2ePfYYIy3vCgs0NSv6u72GI85CUw/7t7tTcMKx7H99bVc4am+eCNTppCOn3Ks8WV0vAt1sbOndtLzvbCEFrc60es6Gi42C0AZPly11f7sAL5Qmd11hWQWAbpLdslgkFXO6DZ2FcATKfmHYlXKVBJbsdvcyCIrWdkWeGQQeyKnENrlrvW55+iwxdwQ2gEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ocmDMPBUYRA9RwcLbbXAjoek/Z6II9uRWNUbtbJmoQ=;
 b=n/sh791so6+1wMtJ8t1cd/kCsBKQMdhCR+JkgBmsYKVNy0rdCejdZUsgJk5R//fqEY2w/sFy2tTF42zuFucVq6Qi2F0vqNFtIzyyzaESCpxkYlPvUqid7Wu+19JUFbVFG91civSQiYIB4FcIXARiaQQHtHgrhYrajXro6mRFdgA6nQIw17EWHWcuYC+xKhNIhikiBh0Lbokj1qywHKLFqPUNSo1E8eJLTmPVVSESGmxfrCiwqrH2kUFwXapp1vDDJPqgIwjZtZ+l4wBrnj0m1Nu4Gz805NJHhsj9aRnnpiYqYc03dNWyTR9wMU7lEE5fa22fkMUOObmRInkxZT9qvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ocmDMPBUYRA9RwcLbbXAjoek/Z6II9uRWNUbtbJmoQ=;
 b=sk6pa+NfsoQAdE8ToIMnaTph76goR9GKXA2cFqC5d5v8fBUvoFxMEvuFReoexlUKouefe/tEbbyRqDxyXUcLKL3YoXUkmPSgN6DKc3etWHOhcpSfrfc5qUmvyWyhD8T1w2aXRhKdNgDBH7spzNDGWnIIiwri5JU08UQGNppgt70=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR0402MB3560.eurprd04.prod.outlook.com (2603:10a6:209:8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Wed, 25 Nov
 2020 09:53:06 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a%3]) with mapi id 15.20.3564.029; Wed, 25 Nov 2020
 09:53:06 +0000
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
Thread-Index: AQHWwlvRlJUaj2nxKEiTYKb+tbM2jKnYKJLAgABf3YCAABL3kA==
Date:   Wed, 25 Nov 2020 09:53:05 +0000
Message-ID: <AM6PR04MB49665E5189ED5241B5471C3680FA0@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20201124121740.ytag7rm53umi2qvm@linutronix.de>
 <AM6PR04MB49665B30445C929ABF458D3E80FA0@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <20201125084007.miwbxcln6tdkesgj@linutronix.de>
In-Reply-To: <20201125084007.miwbxcln6tdkesgj@linutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linutronix.de; dkim=none (message not signed)
 header.d=none;linutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ab1bcbd6-960f-4fbc-c6c3-08d89127e858
x-ms-traffictypediagnostic: AM6PR0402MB3560:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0402MB3560515AEC7C330DCF8887C480FA0@AM6PR0402MB3560.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PPs+CejZl4Vg2dWZSKQN3p9T5sBkMfy6z72bCU6VV2nmiE8SRXADvzPRSVxUJd2y6W3ulWoMXhAfMXPR40dF07lrhcM+A2Is/F9OdWbI8/8rMWYxH3PQb0h2eChGX70EltXmJy4NjrTzoGFgQ96nzUJftlpg/2EzyM3GI0QQjp5gjV5mjxU1YbbnlNBRyqZxfdPn0+Uu5ZqVdB/DerOYflVM4HPgbHdFstWWd+LwjQVA8BtBybpwIKETRGT5OVu20gt5+Cq71IIWMnwP1gg+Tzkupu08qwEnl1p+aTWEYpWpYT3pljUZ1i1v6bSx4MEf+Y/aZxRkXkx2kQxZcL4oufwHJ6ql+JOMezqDrwrlmCpnHlW7v8IXHZEDHug7KOqw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(4001150100001)(86362001)(6916009)(26005)(186003)(55016002)(76116006)(9686003)(66476007)(5660300002)(66946007)(478600001)(66446008)(83380400001)(66556008)(52536014)(7416002)(64756008)(44832011)(316002)(8676002)(8936002)(54906003)(4326008)(53546011)(6506007)(71200400001)(7696005)(2906002)(33656002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: YXiQnIdIjGgX5YA4WnI/XcgKbyF/Nj7N8HSxiFSl2+Z4MYm4Fj2eahTBbaAySxpXte4rkQfniF58SrAIICaO3MCZPbi89Afb+uFxR0tQPcOSFYzshuTg/RyElU7LO5ihDU0tfgu/nLH8d7me690Sun03qJrDPKSXj425Xc/CVYtehu7mbypg4x1Tpq/k1xUa3kUzqK+A4igAXlBfW57cJHDi1pjyA4HubleauUvU3u3G16KeEjJZcRwUQ710dAfcuLtAF+AGHEX8w2pujY529TLWWJPaEWxPicuqLEGe4g+nOA2eSA06+ETwCiTfo14AjVqt6oxF5BhRQeW0nkgNH6PygOQymaYmAu9FWZ7NcY/sUBblV95xSd+hra3K1ZaLliTJ44YJlj402wTVH01RnfxHJvPsr585VDKXsW9HoYw0F3i+jNnvhTYzZW6YhUbdIyrvytpWncMpFXo4pBmLuTwrPrZ01qksbYd3SwmAK5VGtL6f4MUlX7yRtTUY/GFnQhPElqmwRqL8lz2pvncT/hg+xRUHlZCjhGnCmLsGd5WkjzFtcSccBbdR1/kBs/U0VJ1O0s1I0pDj+SHti/NZqPgiU4fEY0Tg/iSEriBSlu0f6CO3mjgE2Gr2aWolPNv1k3FGhUzoAb/85O93WBvUQAVRHa0NKu4nLMOO0OwaHD/nL/2MxJPcsHLcFKOjiFnAUx1VCYRmr/tZxZdfHtqOXU009RTKELzYIs85hdKDpfqfPSF9436cf7wJVtbX1HwKFrXXZAoF52CC8b8b0O9OdUkz/ZfNPORzmNaFCUym7+/CThFME2SmkTkQs2QCE6yMLSkqZzeg+6AfKab/SqoKFQ74ErQ/FXEx73vi2mkaBlYuqaCzIMyIyfEs6bH9EmdbW0VsAUXyeJOj5f/p2vM6wg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1bcbd6-960f-4fbc-c6c3-08d89127e858
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 09:53:05.9969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u4yte/ZNdzjDV2e1duBuhRCPK/Mo5ECJUa1IMdEO329nuD1XjitVF6BG3Ai/e68zO02y3DRrwBIV89F8mYFUaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3560
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yIDxiaWdlYXN5QGxpbnV0cm9uaXguZGU+
DQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMjUsIDIwMjAgNDo0MCBQTQ0KPiANCj4gT24g
MjAyMC0xMS0yNSAwNzoxNToyNCBbKzAwMDBdLCBBaXNoZW5nIERvbmcgd3JvdGU6DQo+ID4gSSB0
aGluayB0aGUgc2ltcGxlc3Qgc29sdXRpb24gaXMgbWFrZSBNWENfQ0xLX1NDVSB0byBiZSBpbnZp
c2libGUgdG8NCj4gPiB1c2VycyBhbmQgY2FuIG9ubHkgYmUgc2VsZWN0ZWQgYnkgQ0xLX0lNWDhR
WFAgb3B0aW9uIGJlY2F1c2UgY3VycmVudGx5DQo+ID4gY2xrLXNjdS5vIGFuZCBjbGstaW14OHF4
cC5vIGFyZSBidWlsdCB0b2dldGhlciwgaXQncyBtZWFuaW5nbGVzcyBhbmQNCj4gPiBidWdneSB0
byBzZXBhcmF0ZSB0aGVtLiBMb25ndGVybWx5IHRoZXkgd2lsbCBiZSBjb21iaW5lZCBpbnRvIG9u
ZSBkcml2ZXIgZmlsZS4NCj4gPg0KPiA+IEUuZw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay9pbXgvS2NvbmZpZyBiL2RyaXZlcnMvY2xrL2lteC9LY29uZmlnIGluZGV4DQo+ID4gM2IzOTNj
YjA3Mjk1Li5kYmFjZGQ3MGFmMmUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvaW14L0tj
b25maWcNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9pbXgvS2NvbmZpZw0KPiA+IEBAIC01LDcgKzUs
NyBAQCBjb25maWcgTVhDX0NMSw0KPiA+ICAgICAgICAgZGVwZW5kcyBvbiBBUkNIX01YQyB8fCBD
T01QSUxFX1RFU1QNCj4gPg0KPiA+ICBjb25maWcgTVhDX0NMS19TQ1UNCj4gPiAtICAgICAgIHRy
aXN0YXRlICJJTVggU0NVIGNsb2NrIg0KPiA+ICsgICAgICAgdHJpc3RhdGUNCj4gPiAgICAgICAg
IGRlcGVuZHMgb24gQVJDSF9NWEMgfHwgQ09NUElMRV9URVNUDQo+ID4gICAgICAgICBkZXBlbmRz
IG9uIElNWF9TQ1UgJiYgSEFWRV9BUk1fU01DQ0MNCj4gDQo+IFNvIGl0IHN0aWxsIGJlY29tZXMg
YSBtb2R1bGUgaWYgaXQgZ2V0cyBzZWxlY3RlZCBieSBvbmUsIGxpa2UgQ0xLX0lNWDhRWFAuDQo+
IA0KDQpZZXMsIGFzIE1YQ19DTEtfU0NVIGFuZCBDTEtfSU1YOFFYUCB3aWxsIGJlIGVuYWJsZWQg
YXQgdGhlIHNhbWUgdGltZSBhbmQNCmNsay1zY3UubyBhbmQgY2xrLWlteDhxeHAubyBhcmUgY29t
cGlsZWQgdG9nZXRoZXIgaW50byBvbmUgbW9kdWxlLA0KdGhlcmUgd2lsbCBiZSBubyBzdWNoIGlz
c3VlcyByZXBvcnRlZCBpbiB0aGlzIGVtYWlsLg0KDQoNCj4gPiBTZWUgZml4ZXMgaGVyZToNCi4u
Lg0KPiANCj4gV2hhdGV2ZXIgeW91IGRvLCBwbGVhc2UgbWFrZSBzdXJlIHRoZSBpc3N1ZSBpbiB2
NS4xMCBnZXRzIGFsc28gYWRkcmVzc2VkLg0KDQpXaWxsIHlvdSBzZW5kIG91dCBhYm92ZSBwYXRj
aCBpZiB5b3UncmUgb2s/DQpPciBJIHdpbGwgZG8gaXQgbm93IGlmIHlvdSBkb24ndCBtaW5kLg0K
DQpSZWdhcmRzDQpBaXNoZW5nDQoNCj4gDQo+IFNlYmFzdGlhbg0K
