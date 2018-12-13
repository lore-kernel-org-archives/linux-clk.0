Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEFEC67839
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 11:19:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85C9420870
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 11:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="gfJ6rysQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85C9420870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728590AbeLMLTa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 06:19:30 -0500
Received: from mail-eopbgr70053.outbound.protection.outlook.com ([40.107.7.53]:53184
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727590AbeLMLTa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 06:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Lp0WJl6OfVkVrlaFuJFKJmu73BeOwaF6OOWEOKzxK0=;
 b=gfJ6rysQRjSfivdXghvEjIW9wlsdBj4d06p5yaU6UBmjjUnMoM1/8i2s893QqorBsYu+TFHXbPStfx4Do+pG6WUyzUsdHGcTFRYgwlhlUAW/YzFq8x5UyTA0y4S5ZKrMq89Cf3U1lGDZDFL8Q9Yr1WYtglhWYXa6SbkdCEKikwg=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5411.eurprd04.prod.outlook.com (20.178.114.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Thu, 13 Dec 2018 11:19:26 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Thu, 13 Dec 2018
 11:19:26 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V11 2/7] clk: imx: add scu clock common part
Thread-Topic: [PATCH V11 2/7] clk: imx: add scu clock common part
Thread-Index: AQHUkoBHoRLNmKbTG0W2ArFlHoWixqV8S10AgAA08PA=
Date:   Thu, 13 Dec 2018 11:19:26 +0000
Message-ID: <AM0PR04MB42118C3E7F49A0437453BA5880A00@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com>
 <1544662938-5020-3-git-send-email-aisheng.dong@nxp.com>
 <154468728640.19322.12955855783518519739@swboyd.mtv.corp.google.com>
In-Reply-To: <154468728640.19322.12955855783518519739@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5411;6:Vnw7SfoYmBoGQv8WIaUc7k5g5NJLQVmXWR+oOLWgTpOncTh6GCLrwj+Uf2/fqPOWQ12CqYvlqZ/hKWNNoZ5HGYM23JTVlDCZS0YRKu9uB9ogEDw1PC8fn0it/q5Tzui/jxWzplREaV8Goce4GW/INXpcpQw2w+5Kwe+e9sgVP3Ku4/ANaIAiOlD9dxYQCsT0V27aT/o3n/69dJKmfI2axIgYEMOaEMP0qU8bE8W8+O/JEeaQ2cV1YDvbeGk2rv9B+qD0KuipKZOSiNgFmwumjgFw/jEFo4CzJUC5olkGBpDF3goy1AVRTXDbC/LdAjxt78iZfY/3+PZ8gbAP8zHXrLV+QYxgVigRKV9MBxyQQZhZVJ7u7PIl9jdlkKEbTuaKaYBhNtE2S1y8PnYIOFQuXkID0bBvN2Q4aaFR+FyXGajGAo1BJSruKIk/pBcUUmAhEDm73hzA9ftnu5DgECigQw==;5:sc4CQCQ0lefjwzzFN+wCdpk8WcdwKS+qstUfmlmEuC4tW0VLtSFWMuNbdFoZ0kqQ6DYmVrOQdWQJKQPRJQtQj1xzr3GFIHQeCV99wY1kz3mzYAo5tHBmmi7RP5go5rSgrWglZ/WhaffhiYDby5Tbifl6UYXAamqQJkQAqK6bh20=;7:BUAmW/4ID2TR7A4eYHQS4WgR/+5uXswlth8NhlVxGMpFqrqdxT2bO8qPu5tUg2uO5/9aBCLEA3X/g/hUm+H065AO96tS+SuYkrL60KAq+NAvtAcrbL9FtC8dwHUH9tPdL8HkFNVebofynAdhghGyIA==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 4261e605-65f2-4b27-bcc9-08d660ecd787
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5411;
x-ms-traffictypediagnostic: AM0PR04MB5411:
x-microsoft-antispam-prvs: <AM0PR04MB5411E4898FCCE9956DC0E50F80A00@AM0PR04MB5411.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231475)(944501520)(52105112)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5411;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5411;
x-forefront-prvs: 088552DE73
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(136003)(366004)(396003)(39860400002)(199004)(189003)(13464003)(14454004)(6116002)(106356001)(110136005)(486006)(44832011)(68736007)(478600001)(25786009)(446003)(74316002)(11346002)(3846002)(476003)(99286004)(229853002)(7736002)(305945005)(6246003)(6436002)(4001150100001)(105586002)(5660300001)(966005)(186003)(7696005)(33656002)(55016002)(9686003)(6306002)(102836004)(86362001)(76176011)(26005)(6506007)(4326008)(316002)(2906002)(256004)(66066001)(2501003)(81156014)(97736004)(8936002)(54906003)(71200400001)(71190400001)(81166006)(8676002)(53936002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5411;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: V1WNm+RfZ5mgwb5/VvLWgdGjaKTwc/JLDoTcMri137LqXFpnInEoa8bOsDG153dCykbWZ8ZCGBRfkTPz95EhWH5YFzCg75/ZuokmuHUo17pEo775elS5HAW06VGIp6/NR7s5HKXKA4qcHjQqrk6OsQAoidYy0BP3pynZu49a5hi/06AUaC1ONBn12Ewp0qjqb0gkNOQVOt1xKHNlPPjsRDh8Q/uhUgfwmvNdOcX5RQHHwq9PR9/8/NwR0JzMV6+ZsFlGSobXReBr4BdO/ECfC4MOUEdKHjJFSgrwYvT93G6kzfrC6Mof2AjmcVTDH33Y
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4261e605-65f2-4b27-bcc9-08d660ecd787
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2018 11:19:26.2768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5411
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBRdW90aW5nIEFpc2hlbmcgRG9uZyAoMjAxOC0xMi0xMiAx
NzowNzo1NSkNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvaW14L0tjb25maWcgYi9kcml2
ZXJzL2Nsay9pbXgvS2NvbmZpZyBpbmRleA0KPiA+IDM3NDc4YmEuLjVjMjZmNGUgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9jbGsvaW14L0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9p
bXgvS2NvbmZpZw0KPiA+IEBAIC0zLDMgKzMsOSBAQA0KPiA+ICBjb25maWcgTVhDX0NMSw0KPiA+
ICAgICAgICAgYm9vbA0KPiA+ICAgICAgICAgZGVmX2Jvb2wgKEFSQ0hfTVhDICYmICFBUk02NCkg
fHwgKEFSQ0hfTVhDICYmIEFSTTY0ICYmDQo+ID4gU09DX0lNWDhNUSkNCj4gPiArDQo+ID4gK2Nv
bmZpZyBNWENfQ0xLX1NDVQ0KPiA+ICsgICAgICAgYm9vbCAiSU1YIFNDVSBDbG9jayINCj4gPiAr
ICAgICAgIGRlcGVuZHMgb24gQVJDSF9NWEMgJiYgQVJNNjQNCj4gDQo+IFRoaXMgc2hvdWxkIGRl
cGVuZCBvbiB0aGUgSU1YX1NDVSBjb25maWcgdG9vLCByaWdodD8gT3RoZXJ3aXNlIGNvbXBpbGF0
aW9uDQo+IHdpbGwgZmFpbC4NCj4gDQoNClllcywgeW91J3JlIHJpZ2h0LiBJIHdpbGwgYWRkIGl0
Lg0KDQo+IFBsdXMsIEkgY2FuJ3Qgc2VlbSB0byBjb21waWxlIHRoaXMgZHJpdmVyIHJlZ2FyZGxl
c3MsIGJlY2F1c2UgdGhlIGRlZmluZXMgZm9yIHRoZQ0KPiBDTEsgbWVzc2FnZXMgYXJlIGluIHNv
bWUgaGVhZGVyIGZpbGUgdGhhdCBpcyBqdXN0IGluY2x1ZGVkIGluIGFub3RoZXIgaGVhZGVyDQo+
IGZpbGUsIGFuZCB0aGF0IGlzIGFsbCBnb2luZyB0aHJvdWdoIGFub3RoZXIgdHJlZS4gV2h5Pw0K
PiANCj4gSXMgdGhlcmUgYW55IHJlYXNvbiB3aHkgdGhvc2UgZGVmaW5lcyBjYW4ndCBqdXN0IGJl
IHdyaXR0ZW4gaW4gdGhlIGNsay1zY3UuaCBmaWxlDQo+IGludHJvZHVjZWQgaW4gdGhpcyBwYXRj
aD8NCg0KU29ycnkgYWJvdXQgdGhhdC4NClllcywgaXQgZGVwZW5kcyBvbiBQTSBzZXJ2aWNlIGhl
YWRmaWxlIFsxXSB3aGljaCBkZWZpbmVzIGFsbCB0aGUgcG93ZXIgcmVsYXRlZCBzZXJ2aWNlIHRv
Z2V0aGVyDQpieSBTQ1UgcHJvdG9jb2wsIGluY2x1ZGluZyBwb3dlciBkb21haW4vY2xrL3Jlc2V0
IGFuZCBldGMuIA0KKHdlIHByb2JhYmx5IHNob3VsZCBkaXZpZGUgdGhlbSB0byBnZXQgYSBiZXR0
ZXIgc2VwYXJhdGlvbiBmcm9tIHRoZSBzdGFydCkuDQpCdXQgUGF0Y2ggNCBkZXBlbmRzIG9uIHRo
ZSByZXNvdXJjZSBJRCBoZWFkZmlsZSBzaGFyZWQgYnkgbW9zdCBTQ1UgY2xpZW50IHVzZXJzLg0K
DQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDY2NDEzNy8NClsyXSBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwNjY0MTI1Lw0KDQpIb3cgd291bGQg
eW91IHN1Z2dlc3QgZm9yIHRoaXMgc2l0dWF0aW9uPw0KDQpTb3JyeSBmb3IgdGhlIGluY29udmVu
aWVuY2UuDQoNClJlZ2FyZHMNCkRvbmcgQWlzaGVuZw0KDQo=
