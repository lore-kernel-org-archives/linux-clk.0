Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FEAC65BAE
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 01:45:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E227E20811
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 01:45:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="APs96XGU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E227E20811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728433AbeLNBpE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 20:45:04 -0500
Received: from mail-eopbgr130085.outbound.protection.outlook.com ([40.107.13.85]:44720
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728130AbeLNBpE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 20:45:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zibGWd5kwlCfkowVEFOkO2bjp3jwJS+6B7wyvyXibzI=;
 b=APs96XGUUcyiE5zcsBJTPH/68yso6TOObVbcYJR6LJJxQ+QHnbU/uJ6kcWCfTT/S4eqs4oYnUE+QdsrwW6W1UBfEJ/5VpnerS6Q0HuowSnJ44sFJ3y7RQTqvmU6Z2jPGif9wYYY+/N/Ln1QrxigJyayRnPlguXWH1SWxE655Avs=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4609.eurprd04.prod.outlook.com (52.135.149.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.24; Fri, 14 Dec 2018 01:44:55 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Fri, 14 Dec 2018
 01:44:55 +0000
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
Thread-Index: AQHUkoBHoRLNmKbTG0W2ArFlHoWixqV8S10AgAA08PCAAPPtgIAAAqXg
Date:   Fri, 14 Dec 2018 01:44:55 +0000
Message-ID: <AM0PR04MB4211D584BCE4B6D06D57637280A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com>
 <1544662938-5020-3-git-send-email-aisheng.dong@nxp.com>
 <154468728640.19322.12955855783518519739@swboyd.mtv.corp.google.com>
 <AM0PR04MB42118C3E7F49A0437453BA5880A00@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <154475103791.19322.8783777114832958727@swboyd.mtv.corp.google.com>
In-Reply-To: <154475103791.19322.8783777114832958727@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4609;6:ieE8DQ4XKiwO/ACiDuMAqBa/62t8rdQPuPW7wBJ413SSAg6Wgnv2CWuPBtskCs0BfCx99Tyu8WuWZbeXj8XQ2pLpAZMwU2WRDNZSbLS/utyxq6L4EuyH750rkWw4xTngEMW2rfa0jKDfl4lQE1cmZdmXOCiyBOZFW7VZcS31yABThavqJDrDMt5ThGIEev4gMF5OVmLJcFuqNb9S781VdVp6NGHhhHKP8dRQ7nkFuUpnjbs0nhyxkGRSBTXHWFKLNaIr51BuAmkKDHNmUJzQz5LdkwDpZ1z/oKb7wNyTkE2y0Hlo2PWTyQZqZnbKjuzrTUhSsEcBo0dTUBSa1ka9tRbtiHU0Utyx1KR7/gJIwE3e3IPqpgAU4BsBecs2jkDE4Gggr1VLu7WnDVI7CO9572xlYZqtgRITot/MF0nnk7YZnLqOOhj2op/UlMOcwFm9QmYezSdq8NpHIpBXhT4NIQ==;5:AK2wNwrL3QGvm0S5eQG9oOL1s0uQ6yNKH24B2N2vxY+jKpHqUPbdzgjobjxYbtIrdAtq/yWP5yEh972PlYzFSk2EkbSTDsdy3A6syjhIeud0q78nszzod0SCWFpnH5THqRWj2+xfiHIsMgxkt8IBQVwBBkhn6HvnfeqtS6CNphY=;7:Z/TDGaW1NrYaLTuI33vyBa8l+CBt9xIm90N2pjCzP8dFMaeQ/tf+evsjUvIxj3xyonjmcLL3F2//j707bjQ4UXTyPfiRxyQ/bmuytRIFkxXBVz5YpXT7RK+WigdBuj9ozMogxyLfzi30pztG3AaQ7A==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 6bde759c-5902-4041-5645-08d66165bfda
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4609;
x-ms-traffictypediagnostic: AM0PR04MB4609:
x-microsoft-antispam-prvs: <AM0PR04MB46098A887B999ABE181315F280A10@AM0PR04MB4609.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3002001)(3231475)(944501520)(52105112)(10201501046)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4609;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4609;
x-forefront-prvs: 08864C38AC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(366004)(396003)(136003)(13464003)(189003)(199004)(11346002)(71200400001)(25786009)(53936002)(256004)(45080400002)(3846002)(4326008)(6246003)(9686003)(99286004)(33656002)(68736007)(6116002)(478600001)(53546011)(966005)(486006)(446003)(8936002)(97736004)(106356001)(6506007)(105586002)(86362001)(26005)(102836004)(305945005)(476003)(6306002)(54906003)(2501003)(4001150100001)(186003)(5660300001)(8676002)(7696005)(76176011)(55016002)(93886005)(44832011)(81166006)(81156014)(74316002)(110136005)(229853002)(316002)(2906002)(66066001)(14454004)(6436002)(7736002)(71190400001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4609;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 8L4MOoB5lK5M7z5gprcZvV/JpcNT2Hh4qoUqNLuBlbn+ldzy8ylT38X3eib+xhi4JdEFfs49V3+mWqrezFKGZmYgKRHK33ZJc5pRF1RrLEfpiQHpi+skKnstePYImgIW/BYgRkCuV3d0eTsrHPsco0Qdc0yzGolL9vd/uzfJ0EYuct7tohCX43/qWC65vdqYQXaW1EZDBGAc8UMrjDtgu3t4bEGEdlj91rwjseIsThsbodW3EkEiJJBzR6ubljFzbT1qZt1pz0y63TflUT//PdCbJwqN1u2DUpqa5TTvldyeOGuj/1WvqmXN8VjOjpgc
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bde759c-5902-4041-5645-08d66165bfda
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2018 01:44:55.7341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4609
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBCb3lkIFtt
YWlsdG86c2JveWRAa2VybmVsLm9yZ10NCj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAxNCwgMjAx
OCA5OjMxIEFNDQo+IFRvOiBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnOyBBaXNoZW5nIERvbmcg
PGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnOyBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsNCj4gc2hhd25ndW9Aa2VybmVsLm9y
ZzsgRmFiaW8gRXN0ZXZhbSA8ZmFiaW8uZXN0ZXZhbUBueHAuY29tPjsgZGwtbGludXgtaW14DQo+
IDxsaW51eC1pbXhAbnhwLmNvbT47IGtlcm5lbEBwZW5ndXRyb25peC5kZQ0KPiBTdWJqZWN0OiBS
RTogW1BBVENIIFYxMSAyLzddIGNsazogaW14OiBhZGQgc2N1IGNsb2NrIGNvbW1vbiBwYXJ0DQo+
IA0KPiBRdW90aW5nIEFpc2hlbmcgRG9uZyAoMjAxOC0xMi0xMyAwMzoxOToyNikNCj4gPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXSBRdW90aW5nIEFpc2hlbmcgRG9uZw0KPiA+ID4gKDIwMTgtMTIt
MTIgMTc6MDc6NTUpDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9pbXgvS2NvbmZp
ZyBiL2RyaXZlcnMvY2xrL2lteC9LY29uZmlnDQo+ID4gPiA+IGluZGV4IDM3NDc4YmEuLjVjMjZm
NGUgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvY2xrL2lteC9LY29uZmlnDQo+ID4gPiA+
ICsrKyBiL2RyaXZlcnMvY2xrL2lteC9LY29uZmlnDQo+ID4gPiA+IEBAIC0zLDMgKzMsOSBAQA0K
PiA+ID4gPiAgY29uZmlnIE1YQ19DTEsNCj4gPiA+ID4gICAgICAgICBib29sDQo+ID4gPiA+ICAg
ICAgICAgZGVmX2Jvb2wgKEFSQ0hfTVhDICYmICFBUk02NCkgfHwgKEFSQ0hfTVhDICYmIEFSTTY0
DQo+ICYmDQo+ID4gPiA+IFNPQ19JTVg4TVEpDQo+ID4gPiA+ICsNCj4gPiA+ID4gK2NvbmZpZyBN
WENfQ0xLX1NDVQ0KPiA+ID4gPiArICAgICAgIGJvb2wgIklNWCBTQ1UgQ2xvY2siDQo+ID4gPiA+
ICsgICAgICAgZGVwZW5kcyBvbiBBUkNIX01YQyAmJiBBUk02NA0KPiA+ID4NCj4gPiA+IFRoaXMg
c2hvdWxkIGRlcGVuZCBvbiB0aGUgSU1YX1NDVSBjb25maWcgdG9vLCByaWdodD8gT3RoZXJ3aXNl
DQo+ID4gPiBjb21waWxhdGlvbiB3aWxsIGZhaWwuDQo+ID4gPg0KPiA+DQo+ID4gWWVzLCB5b3Un
cmUgcmlnaHQuIEkgd2lsbCBhZGQgaXQuDQo+ID4NCj4gPiA+IFBsdXMsIEkgY2FuJ3Qgc2VlbSB0
byBjb21waWxlIHRoaXMgZHJpdmVyIHJlZ2FyZGxlc3MsIGJlY2F1c2UgdGhlDQo+ID4gPiBkZWZp
bmVzIGZvciB0aGUgQ0xLIG1lc3NhZ2VzIGFyZSBpbiBzb21lIGhlYWRlciBmaWxlIHRoYXQgaXMg
anVzdA0KPiA+ID4gaW5jbHVkZWQgaW4gYW5vdGhlciBoZWFkZXIgZmlsZSwgYW5kIHRoYXQgaXMg
YWxsIGdvaW5nIHRocm91Z2ggYW5vdGhlciB0cmVlLg0KPiBXaHk/DQo+ID4gPg0KPiA+ID4gSXMg
dGhlcmUgYW55IHJlYXNvbiB3aHkgdGhvc2UgZGVmaW5lcyBjYW4ndCBqdXN0IGJlIHdyaXR0ZW4g
aW4gdGhlDQo+ID4gPiBjbGstc2N1LmggZmlsZSBpbnRyb2R1Y2VkIGluIHRoaXMgcGF0Y2g/DQo+
ID4NCj4gPiBTb3JyeSBhYm91dCB0aGF0Lg0KPiA+IFllcywgaXQgZGVwZW5kcyBvbiBQTSBzZXJ2
aWNlIGhlYWRmaWxlIFsxXSB3aGljaCBkZWZpbmVzIGFsbCB0aGUgcG93ZXINCj4gPiByZWxhdGVk
IHNlcnZpY2UgdG9nZXRoZXIgYnkgU0NVIHByb3RvY29sLCBpbmNsdWRpbmcgcG93ZXIgZG9tYWlu
L2Nsay9yZXNldA0KPiBhbmQgZXRjLg0KPiA+ICh3ZSBwcm9iYWJseSBzaG91bGQgZGl2aWRlIHRo
ZW0gdG8gZ2V0IGEgYmV0dGVyIHNlcGFyYXRpb24gZnJvbSB0aGUgc3RhcnQpLg0KPiA+IEJ1dCBQ
YXRjaCA0IGRlcGVuZHMgb24gdGhlIHJlc291cmNlIElEIGhlYWRmaWxlIHNoYXJlZCBieSBtb3N0
IFNDVSBjbGllbnQNCj4gdXNlcnMuDQo+ID4NCj4gPiBbMV0NCj4gPiBodHRwczovL2VtZWEwMS5z
YWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGcGF0DQo+
ID4NCj4gY2h3b3JrLmtlcm5lbC5vcmclMkZwYXRjaCUyRjEwNjY0MTM3JTJGJmFtcDtkYXRhPTAy
JTdDMDElN0NhaXNoZQ0KPiBuZy5kb24NCj4gPg0KPiBnJTQwbnhwLmNvbSU3Q2VhMDliYmM3ZGZi
ZjQyNDg0NGJiMDhkNjYxNjNjMjQwJTdDNjg2ZWExZDNiYzJiNA0KPiBjNmZhOTJjZA0KPiA+DQo+
IDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzY4MDM0Nzg0MjIxMDAxMjMmYW1wO3NkYXRhPUd3T1lq
Wm5zJTINCj4gQkp4TGVQblQ1DQo+ID4gNlpUelJ1TUUzRFFBNVY4ZXVrdlJYQ2YxczAlM0QmYW1w
O3Jlc2VydmVkPTANCj4gPiBbMl0NCj4gPiBodHRwczovL2VtZWEwMS5zYWZlbGlua3MucHJvdGVj
dGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGcGF0DQo+ID4NCj4gY2h3b3JrLmtl
cm5lbC5vcmclMkZwYXRjaCUyRjEwNjY0MTI1JTJGJmFtcDtkYXRhPTAyJTdDMDElN0NhaXNoZQ0K
PiBuZy5kb24NCj4gPg0KPiBnJTQwbnhwLmNvbSU3Q2VhMDliYmM3ZGZiZjQyNDg0NGJiMDhkNjYx
NjNjMjQwJTdDNjg2ZWExZDNiYzJiNA0KPiBjNmZhOTJjZA0KPiA+DQo+IDk5YzVjMzAxNjM1JTdD
MCU3QzAlN0M2MzY4MDM0Nzg0MjIxMDAxMjMmYW1wO3NkYXRhPUNKR0FsYUY0SzMNCj4gdUszYlls
RWJDDQo+ID4gc1NSUXNzYTI1JTJGJTJCaVBhSTV5NHg3Z3JSYyUzRCZhbXA7cmVzZXJ2ZWQ9MA0K
PiA+DQo+ID4gSG93IHdvdWxkIHlvdSBzdWdnZXN0IGZvciB0aGlzIHNpdHVhdGlvbj8NCj4gPg0K
PiANCj4gSSBzdWdnZXN0IHRoZSBkZWZpbmVzIGp1c3QgZ28gaW50byB0aGUgY2xrIGRyaXZlci4g
SXMgdGhhdCBhIHdvcmthYmxlIHNvbHV0aW9uIG9yDQo+IGRvZXMgc29tZXRoaW5nIG5vdCB3b3Jr
Pw0KDQpBcmUgeW91IHN1Z2dlc3RpbmcgbWUgdG8gZG9pbmcgaXQgbm93Pw0KQXMgdGhlIHBhdGNo
IGlzIGFscmVhZHkgaW4gU2hhd24ncyB0cmVlLCBidXQgSSB0aGluayBJIGNhbiBkbyBpdCBhbmQg
Y2xlYW4gdXANCnRoZSBmaWxlIGluIFNoYXduJ3MgdHJlZSBsYXRlci4NCg0KSG93ZXZlciwgb25s
eSBtb3ZpbmcgdGhlIGNsayByZWxhdGVkIGRlZmluZXMgaW50byBjbGsgZHJpdmVyIGlzIG5vdCBl
bm91Z2guDQpUaGUgZHJpdmVyIGNvbXBpbGluZyBzdGlsbCBkZXBlbmRzIG9uIHRoZSByZXNvdXJj
ZSBJRCBmaWxlIHdoaWNoIGlzIHNoYXJlZA0KYnkgcG93ZXIgZG9tYWluIGRyaXZlciBhbmQgY2xr
IGRyaXZlciAoYW5kIHBvc3NpYmxlIG1hbnkgb3RoZXJzKS4NClNvIHdlIHN0aWxsIGhhdmUgZGVw
ZW5kZW5jeSBpc3N1ZXMuDQoNCkFueSBzdWdnZXN0aW9uPw0KDQpSZWdhcmRzDQpEb25nIEFpc2hl
bmcNCg0K
