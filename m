Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A569C04EB9
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 01:45:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 501EF208A3
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 01:45:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="pXARlNot"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 501EF208A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbeLDBpu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 20:45:50 -0500
Received: from mail-eopbgr150055.outbound.protection.outlook.com ([40.107.15.55]:10608
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725915AbeLDBpu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 3 Dec 2018 20:45:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5do3wNffRhBdqeMxopR+pdB0WeJj/8+/G1+S5Pmtcs=;
 b=pXARlNot8dCV8+ipvpyZZU2fALmMxdbAJ7qc8bR38KP+lDMrHtwqll9wdnRd7P+3cWio2AalraVDErKs6ykmDcNnPHdmwCtxggLFvAZ7bj0RFgegn1TTKOarbKiwmMfqChstWwbnxUomOxY/2zaRuLSSh7HmNjjeMpqXyk6Q6jQ=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5793.eurprd04.prod.outlook.com (20.178.202.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1382.22; Tue, 4 Dec 2018 01:45:46 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1382.020; Tue, 4 Dec 2018
 01:45:46 +0000
From:   Aisheng DONG <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V8 6/7] clk: imx: add lpcg clock support
Thread-Topic: [PATCH V8 6/7] clk: imx: add lpcg clock support
Thread-Index: AQHUgaRCQQJmVj/lpEGe6LAmNSfItqVtfgEAgABgiGA=
Date:   Tue, 4 Dec 2018 01:45:46 +0000
Message-ID: <AM0PR04MB421164275DE2C2B6617E3AA080AF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
 <1542809234-539-7-git-send-email-aisheng.dong@nxp.com>
 <154386628648.88331.6049034476912976846@swboyd.mtv.corp.google.com>
In-Reply-To: <154386628648.88331.6049034476912976846@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5793;6:P/On7RQPD+a7R13Kb/8Ix6jun9EnvAONpjXoslrJMWAHXmY21T52fEK+ky9esCFXSUuFoQpiVWEp+aPUt6id4pII6oQw5o7ocHx2QbT3xDV9NRgt+mm2Rk75N/F+tjA+prRXo+w3rx9k2x95+MOIm/+vj+TGsA+xJak9IrARo2dHeRTYyIGsEk1V0upAZs4oyVIy9OoqKZKl4NbdQUJMoNspdiKeRagEJnQNs9boie8/c8J9p5KMVdR06/iYSqcB0GM4pQQENSMrhhv2VaWvNh5eL9jwNy0Hh1FgwEPZ3GwwwELQTdYoM5WeuhZRw1cdZ4w34NRHSYgqdNOzMieYuuopO3rS3P1tBqHsBkPW2eYZV/atsSefcEetz74rGy70eJKd8F9YPiN5iaeOLjqUniatVmD4WEK2V5n8IkvrIVJPq7p178ggjmSV6st/8HwuKNZcgdQcQggijxyIksf6Jw==;5:wddvbvs3oSbubnrP0G8QJA6gd3eIS5L1b0PakufiWSmKwg+k/q47si8YlEMeO6gk2qm7cERalQhpweQgpUaugZAvfi6Q3wuLG3mIB98U2FFByoAYqSr7elrEllHDEUFAo7jxWmseWF2PqYMKLIf4WcrEpBg4+60R8YPD0fMjQ4U=;7:VR4KFpMhdf6tVHETMf3JVCez1OLAehehtlOeu7S3Jm6/tVPHdZmwkoqfcGsKF7/PQGdwChF+slg07pNihBAI33QX7Wj+eyKbs9BE7HtNsUm/3KvFdvRC/vZpFtXrNjUUEpsxvvlvH0LVnnAJgIwNfw==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: cf156e22-a284-4a54-7e18-08d6598a35eb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5793;
x-ms-traffictypediagnostic: AM0PR04MB5793:
x-microsoft-antispam-prvs: <AM0PR04MB579317D4351ECF6F922B75DC80AF0@AM0PR04MB5793.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231455)(999002)(944501493)(52105112)(93006095)(93001095)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5793;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5793;
x-forefront-prvs: 0876988AF0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(39860400002)(376002)(346002)(396003)(13464003)(189003)(199004)(7736002)(5660300001)(8676002)(6436002)(14444005)(76176011)(53546011)(186003)(256004)(26005)(55016002)(6506007)(2501003)(9686003)(229853002)(8936002)(105586002)(7696005)(14454004)(53936002)(33656002)(99286004)(81166006)(81156014)(2906002)(476003)(446003)(486006)(71190400001)(6246003)(3846002)(71200400001)(316002)(54906003)(478600001)(6116002)(102836004)(68736007)(4326008)(110136005)(106356001)(11346002)(74316002)(25786009)(66066001)(4001150100001)(86362001)(305945005)(97736004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5793;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: vWJHEifwgH56bwOuitfi6twYAp7ErRR3y1XWK7V3x135fGBVUd8vYJRja71Tfjd2ERuxE9IqRqnwUXDXjKxnoAuOVjkZR3fScsuWtsnrub0g8Sc+wilEMyjH3fAy1ni7sgFrdnidFYzfN+BWNoqo7tCEmfCUmiM2/B0rG0eGoB6eyNnLhKdu2CQcol09FXF+PaQp5HkamQAyeLfFjdjkKWpJZ/3+sdPGRaOmQ7wlXRhjgfw/RNfVB5HF9KUcgr0XnCoizSOHMP4oOeVAjTedXiKSdVWIKeYBd/k5krvOLl6ASwszC3Fdm2HsjQFxF/Y0KDw6vULD1QAndDt5bLkvw6ntelUsc5rF3De6FKKgQjA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf156e22-a284-4a54-7e18-08d6598a35eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2018 01:45:46.3137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5793
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciA0LCAyMDE4IDM6
NDUgQU0NCj4gVG86IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc7IEFpc2hlbmcgRE9ORyA8YWlz
aGVuZy5kb25nQG54cC5jb20+DQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IG10dXJxdWV0dGVAYmF5bGlicmUuY29tOw0KPiBzaGF3bmd1b0BrZXJuZWwub3JnOyBG
YWJpbyBFc3RldmFtIDxmYWJpby5lc3RldmFtQG54cC5jb20+OyBkbC1saW51eC1pbXgNCj4gPGxp
bnV4LWlteEBueHAuY29tPjsga2VybmVsQHBlbmd1dHJvbml4LmRlOyBBaXNoZW5nIERPTkcNCj4g
PGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY4IDYvN10gY2xr
OiBpbXg6IGFkZCBscGNnIGNsb2NrIHN1cHBvcnQNCj4gDQo+IFF1b3RpbmcgQWlzaGVuZyBET05H
ICgyMDE4LTExLTIxIDA2OjEyOjM4KQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9pbXgv
Y2xrLWxwY2ctc2N1LmMNCj4gPiBiL2RyaXZlcnMvY2xrL2lteC9jbGstbHBjZy1zY3UuYyBuZXcg
ZmlsZSBtb2RlIDEwMDY0NCBpbmRleA0KPiA+IDAwMDAwMDAuLjE1YjdkOTQNCj4gPiAtLS0gL2Rl
di9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvaW14L2Nsay1scGNnLXNjdS5jDQo+ID4gQEAg
LTAsMCArMSwxMTMgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAr
DQo+ID4gKy8qDQo+ID4gKyAqIENvcHlyaWdodCAyMDE4IE5YUA0KPiA+ICsgKiAgICAgRG9uZyBB
aXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCj4gPiArICovDQo+ID4gKw0KPiA+ICsjaW5j
bHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9lcnIuaD4N
Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+
DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9zcGlubG9jay5oPg0KPiA+ICsNCj4gPiArc3RhdGljIERF
RklORV9TUElOTE9DSyhpbXhfbHBjZ19zY3VfbG9jayk7DQo+ID4gKw0KPiA+ICsjZGVmaW5lIENM
S19HQVRFX1NDVV9MUENHX01BU0sgICAgICAgICAweDMNCj4gPiArI2RlZmluZSBDTEtfR0FURV9T
Q1VfTFBDR19IV19TRUwgICAgICAgQklUKDApDQo+ID4gKyNkZWZpbmUgQ0xLX0dBVEVfU0NVX0xQ
Q0dfU1dfU0VMICAgICAgIEJJVCgxKQ0KPiA+ICsNCj4gPiArLyoNCj4gPiArICogc3RydWN0IGNs
a19scGNnX3NjdSAtIERlc2NyaXB0aW9uIG9mIExQQ0cgY2xvY2sNCj4gPiArICoNCj4gPiArICog
QGh3OiBjbGtfaHcgb2YgdGhpcyBMUENHDQo+ID4gKyAqIEByZWc6IHJlZ2lzdGVyIG9mIHRoaXMg
TFBDRyBjbG9jaw0KPiA+ICsgKiBAYml0X2lkeDogYml0IGluZGV4IG9mIHRoaXMgTFBDRyBjbG9j
aw0KPiA+ICsgKiBAaHdfZ2F0ZTogSFcgYXV0byBnYXRlIGVuYWJsZQ0KPiA+ICsgKg0KPiA+ICsg
KiBUaGlzIHN0cnVjdHVyZSBkZXNjcmliZXMgb25lIExQQ0cgY2xvY2sgICovIHN0cnVjdCBjbGtf
bHBjZ19zY3Ugew0KPiA+ICsgICAgICAgc3RydWN0IGNsa19odyBodzsNCj4gPiArICAgICAgIHZv
aWQgX19pb21lbSAqcmVnOw0KPiA+ICsgICAgICAgdTggYml0X2lkeDsNCj4gPiArICAgICAgIGJv
b2wgaHdfZ2F0ZTsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyNkZWZpbmUgdG9fY2xrX2xwY2dfc2N1
KF9odykgY29udGFpbmVyX29mKF9odywgc3RydWN0IGNsa19scGNnX3NjdSwNCj4gPiAraHcpDQo+
ID4gKw0KPiA+ICtzdGF0aWMgaW50IGNsa19scGNnX3NjdV9lbmFibGUoc3RydWN0IGNsa19odyAq
aHcpIHsNCj4gPiArICAgICAgIHN0cnVjdCBjbGtfbHBjZ19zY3UgKmNsayA9IHRvX2Nsa19scGNn
X3NjdShodyk7DQo+ID4gKyAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+ICsgICAgICAg
dTMyIHJlZzsNCj4gPiArDQo+ID4gKyAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaW14X2xwY2df
c2N1X2xvY2ssIGZsYWdzKTsNCj4gPiArDQo+ID4gKyAgICAgICByZWcgPSByZWFkbChjbGstPnJl
Zyk7DQo+IA0KPiBVc2UgcmVhZGxfcmVsYXhlZCgpIGhlcmU/DQo+IA0KDQpZZXMsIHdlIGNhbiBk
byBpdC4NCg0KPiA+ICsgICAgICAgcmVnICY9IH4oQ0xLX0dBVEVfU0NVX0xQQ0dfTUFTSyA8PCBj
bGstPmJpdF9pZHgpOw0KPiA+ICsgICAgICAgaWYgKGNsay0+aHdfZ2F0ZSkNCj4gPiArICAgICAg
ICAgICAgICAgcmVnIHw9IChDTEtfR0FURV9TQ1VfTFBDR19IV19TRUwgfA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIENMS19HQVRFX1NDVV9MUENHX1NXX1NFTCkgPDwgY2xrLT5iaXRfaWR4
Ow0KPiA+ICsgICAgICAgZWxzZQ0KPiA+ICsgICAgICAgICAgICAgICByZWcgfD0gKENMS19HQVRF
X1NDVV9MUENHX1NXX1NFTCA8PCBjbGstPmJpdF9pZHgpOw0KPiANCj4gV3JpdGUgdGhpcyBhczoN
Cj4gDQo+IAl1MzIgdmFsOw0KPiANCj4gCXZhbCA9IENMS19HQVRFX1NDVV9MUENHX1NXX1NFTDsN
Cj4gCWlmICguLi4pDQo+IAkJdmFsIHw9IENMS19HQVRFX1NDVV9MUENHX0hXX1NFTDsNCj4gCXJl
ZyB8PSB2YWwgPDwgY2xrLT5iaXRfaWR4Ow0KPiANCg0KWWVzLCBhIHNtYXJ0ZXIgd2F5Lg0KDQo+
ID4gKyAgICAgICB3cml0ZWwocmVnLCBjbGstPnJlZyk7DQo+IA0KPiBUaGlzIGNhbiBzdGF5ICJz
dHJvbmdlciIsIHNvIG5vIHdyaXRlbF9yZWxheGVkKCkuDQo+IA0KDQpHb3QgaXQuDQoNCj4gPiAr
DQo+ID4gKyAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpbXhfbHBjZ19zY3VfbG9jaywg
ZmxhZ3MpOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+
ICtzdGF0aWMgdm9pZCBjbGtfbHBjZ19zY3VfZGlzYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykgew0K
PiA+ICsgICAgICAgc3RydWN0IGNsa19scGNnX3NjdSAqY2xrID0gdG9fY2xrX2xwY2dfc2N1KGh3
KTsNCj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4gKyAgICAgICB1MzIgcmVn
Ow0KPiA+ICsNCj4gPiArICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZpbXhfbHBjZ19zY3VfbG9j
aywgZmxhZ3MpOw0KPiA+ICsNCj4gPiArICAgICAgIHJlZyA9IHJlYWRsKGNsay0+cmVnKTsNCj4g
DQo+IHJlYWRsX3JlbGF4ZWQoKT8NCg0KR290IGl0Lg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcN
Cg0KPiANCj4gPiArICAgICAgIHJlZyAmPSB+KENMS19HQVRFX1NDVV9MUENHX01BU0sgPDwgY2xr
LT5iaXRfaWR4KTsNCg==
