Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7FDECDE32
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 07:28:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 667852151D
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 07:28:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="j16gouCI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 667852151D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbeJQPXI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 11:23:08 -0400
Received: from mail-db5eur01on0046.outbound.protection.outlook.com ([104.47.2.46]:2087
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726622AbeJQPXI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 11:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oSXhExSzclM1D11v3PNdDS4t+SzlofGO1ooMN0TMvU=;
 b=j16gouCI+M0pp/PSvJoTysPl1gmgRXOElN9r9ROc45Omu0y40pniCvGcFIV93eAIogS9BDImwk7OFiK/Y+Amxh2PdvhsFTwVstzy5MqEcHDGSKBoP3AAQLpnd1fkXK0Fz4Ugnnup5BveeqxA3NJACSudkjOAU8zOUAOaq6uLu4Y=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5251.eurprd04.prod.outlook.com (20.177.42.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.26; Wed, 17 Oct 2018 07:28:45 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.032; Wed, 17 Oct 2018
 07:28:44 +0000
From:   "A.s. Dong" <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH V4 05/11] clk: imx: scu: add scu clock gate
Thread-Topic: [PATCH V4 05/11] clk: imx: scu: add scu clock gate
Thread-Index: AQHUY5UDa12Huho8BEyIYtM4b8PGa6Uf6y+AgAAZoyCAAA3sAIAAOofAgAIXJICAAKlxcA==
Date:   Wed, 17 Oct 2018 07:28:44 +0000
Message-ID: <AM0PR04MB4211CA6F8AF1A312A516DB0180FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-6-git-send-email-aisheng.dong@nxp.com>
 <20181015073207.66npcgegibl2rybb@pengutronix.de>
 <AM0PR04MB4211129386C9088C6AFEDAF580FD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181015095342.kjokajxyugugbtcw@pengutronix.de>
 <AM0PR04MB42111FD6D3542E12250E556880FD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <153972471150.5275.14761857440358508106@swboyd.mtv.corp.google.com>
In-Reply-To: <153972471150.5275.14761857440358508106@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5251;6:INxpu8bgnPgiZ83FwBqmN28j/LM0PjRu9ao7/LARQrp0RgiDSbgKRBMCxzFY4DNIaucf4I3uwS1IS86RdW1O9i3fie1kSZFC2U0wBckXMmHKjTNZfbuFgkKX7zQjnlg3bvZPteO64FsTSH5r+v+InGFR4ZnK0UwxhEUOiGlkRteCk1yAad2m2LemF3iTInOhhFWkL6DHx20O7PVqdlezj1L7GvFJjoZVlxcQlUYQG3fKx2mmSKUi0MebW4L3tq9GXenCFsFOVG7JRjNHshnZGbLPm5nL5ogAQd5FA/dB76F3y1M3tpMH4lNl3FWyD/LruFAxjN7Vseg7WkbOkOn2O2jOqYuI2x2Z36yTFXDXuqBgdwZCFG6mEL9aWoV1PejW36Ns0QK+RHC3jXA+yGlklQMrTB2g4afrsr1f4tQmgZWO8Rh7nT/d3mtOvrDG8KqRtwf+Sv8c14QMR+alP9ganA==;5:IKu/zy7QYwGprqlsMTeWrcGEIbYHINE8CyjBtr/+avkvenS30lue4et8WM+2WBsZcY3mhRH1h0Xh1cgRvHmJVIig6xg363WLnd+zstY2IRdlESvWz1E8lREInq9YdC48H0VZ+VQXpoC0t6fN9a58n4dwzdKt1qiHoL/NOkK+aes=;7:sjD9Kyd+0NJGo36IY+BtaQsSAXtsp1sHYyDSLBzpLRdrwW7X6irteRH8LItZkqTe6i8iRMWkemY/KkebhZFbjQz0cm7ikKnr5pQvtGPSDbdYPk1HGDQocIYYWZAmUImVzPE/KeHLiFXrqfrA7X3J2GzfrrRch5KZkzMVvRA4Edy2EMlUwTMnbxxyc8mhczxQfjIu3Ixqo9FpaX51A3GnA15aZyoo2WL9HqXM3a8bmRB29c4gfAV+mmtXiMPyAEiX
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 8b60aba0-7808-4f6c-bec8-08d634022bd3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5251;
x-ms-traffictypediagnostic: AM0PR04MB5251:
x-microsoft-antispam-prvs: <AM0PR04MB5251679303C683B5A16BF97080FF0@AM0PR04MB5251.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(944501410)(52105095)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5251;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5251;
x-forefront-prvs: 08286A0BE2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(199004)(229853002)(14454004)(4326008)(305945005)(26005)(74316002)(478600001)(33656002)(5250100002)(256004)(14444005)(7736002)(5660300001)(6246003)(105586002)(71190400001)(53936002)(11346002)(66066001)(106356001)(446003)(97736004)(71200400001)(102836004)(99286004)(486006)(3846002)(68736007)(81156014)(81166006)(8676002)(54906003)(6436002)(7696005)(186003)(55016002)(93886005)(2906002)(76176011)(316002)(86362001)(8936002)(25786009)(476003)(2900100001)(6116002)(6506007)(9686003)(110136005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5251;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Z5cKrHlRB7EPtkB2Y3OoUIG4oTre8HKSFSqCEUncpxT5tqFd1/szKarCf/b2u18aJJrCSZ7Xwf1LVD4QNEADJWoeHtRaK9yap6/7RfnK6hRxhbLb15R62bk7yUTP+CbcbeXNxh47+KXFybGKYAUgzFAvLFWY2MbJ47ycAi8YOQW2u2Ymg7W61Vo/uLYu/uQf12Y+TdmMbBYSLLcryLuB6pGRwHWc6SEqU2hZewvZO3PmkrezUWmZQZJRv7mNJRsSmGCYMMtOg6C2vZobZOfsZ322z0txBZeofDnUXRVd+9sASlliuhSYfxzlM7nmv4fCY4au2HKmNbDeIb5pkCI3+D0Q5RQnx6ugxVvXxFLqREg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b60aba0-7808-4f6c-bec8-08d634022bd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2018 07:28:44.8649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5251
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQo+IEZyb206IFN0ZXBoZW4gQm95ZCBbbWFpbHRvOnNib3lkQGtlcm5lbC5vcmddDQo+IFNlbnQ6
IFdlZG5lc2RheSwgT2N0b2JlciAxNywgMjAxOCA1OjE5IEFNDQoNClsuLi5dDQoNCj4gPiAiIERy
aXZlcnMgZG9uJ3QgbmVlZCB0byBtYW51YWxseSBwcm90ZWN0IHJlc291cmNlcyBzaGFyZWQgYmV0
d2VlbiB0aGUNCj4gPiBvcGVyYXRpb25zIG9mIG9uZSBncm91cCwgcmVnYXJkbGVzcyBvZiB3aGV0
aGVyIHRob3NlIHJlc291cmNlcyBhcmUNCj4gPiBzaGFyZWQgYnkgbXVsdGlwbGUgY2xvY2tzIG9y
IG5vdC4gSG93ZXZlciwgYWNjZXNzIHRvIHJlc291cmNlcyB0aGF0DQo+ID4gYXJlIHNoYXJlZCBi
ZXR3ZWVuIG9wZXJhdGlvbnMgb2YgdGhlIHR3byBncm91cHMgbmVlZHMgdG8gYmUgcHJvdGVjdGVk
IGJ5DQo+IHRoZSBkcml2ZXJzLiINCj4gPg0KPiA+IERvIHlvdSB0aGluayBpdCdzIG9rYXkgdG8g
ZHJvcCBpdD8NCj4gPg0KPiANCj4gTm8gaXQncyBub3QgT0suIFdlIHByZWZlciB0aGF0IGNsayBk
cml2ZXJzIGRvbid0IGFzc3VtZSB0aGUgZ2xvYmFsIGxvY2tzIGluIHRoZQ0KPiBjbGsgZnJhbWV3
b3JrIGFyZSBnb2luZyB0byBwcm90ZWN0IHRoZW0gZnJvbSBjb25jdXJyZW50IGFjY2VzcyB0byB0
aGUgc2FtZQ0KPiByZXNvdXJjZSBiZXR3ZWVuIGRpZmZlcmVudCBjbGtzLiBEcml2ZXJzIGNhbiBh
c3N1bWUgdGhhdCBhIGNsayBvcCB3b24ndCBiZQ0KPiBjYWxsZWQgaW4gcGFyYWxsZWwgZm9yIHRo
ZSBzYW1lIGNsaywgYnV0IHRoZXkgc2hvdWxkbid0IGFzc3VtZSB0aGF0IGV2ZXJ5dGhpbmcgaXMN
Cj4gcHJvdGVjdGVkIG90aGVyd2lzZS4gSWYgdGhleSBkaWQsIHdlIHdvdWxkIGhhdmUgdG8gZ28g
ZmluZCBhbGwgdGhlIGRyaXZlcnMgdGhhdA0KPiBtYWtlIHRoaXMgYXNzdW1wdGlvbiBhbmQgdGhl
biBmaXggdGhlbSB3aGVuIHdlIGV2ZW50dWFsbHkgc3BsaXQgdGhlIGxvY2sgaW50bw0KPiBzbWFs
bGVyIHBpZWNlcy4NCj4gDQo+IExvbmcgc3Rvcnkgc2hvcnQsIGlmIHlvdSBoYXZlIHNvbWV0aGlu
ZyBzaGFyZWQgKGkuZS4gYSByZWdpc3RlcikgYW5kIHlvdSBwbGFuIHRvDQo+IHdyaXRlIHRvIGl0
IGFuZCByZWFkIGZyb20gaXQgZm9yIG11bHRpcGxlIGNsa3MsIGFkZCBhIGxvY2sgYXJvdW5kIGl0
Lg0KDQpPa2F5LCBnb3QgaXQuIEFwcHJlY2lhdGVkIGZvciB0aGUgZGV0YWlsZWQgZXhwbGFuYXRp
b24uDQoNClJlZ2FyZHMNCkRvbmcgQWlzaGVuZw0K
