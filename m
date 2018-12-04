Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16160C04EB9
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 01:47:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2721208A3
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 01:47:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="azIE8/IW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2721208A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbeLDBrE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 20:47:04 -0500
Received: from mail-eopbgr150073.outbound.protection.outlook.com ([40.107.15.73]:22432
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725915AbeLDBrE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 3 Dec 2018 20:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RafUoOIYJDh8772VJvt04jBaPKZQTeETGrAlCewKquY=;
 b=azIE8/IWhXYcee1SCDUQxBv+kH/LQbKHKQpsJ9XCFW2d9oY1U129nGf7PlTIKKMSFupwu01jPaYrvQ9uw5+LAH9t5SSoqZtzy0hb0JTH9yuMw0PXdftJITiW3oaYezoq2+rKc9cz20T9Cg9R4JpRnYtTMXyi/mbFuVFYgyjn7OU=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5793.eurprd04.prod.outlook.com (20.178.202.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1382.22; Tue, 4 Dec 2018 01:47:00 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1382.020; Tue, 4 Dec 2018
 01:47:00 +0000
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
Subject: RE: [PATCH V8 0/7] clk: imx: add imx8qxp clock support
Thread-Topic: [PATCH V8 0/7] clk: imx: add imx8qxp clock support
Thread-Index: AQHUgaQ07UOrlEn65UOyxxVfjCE+w6VtfjwAgABky9A=
Date:   Tue, 4 Dec 2018 01:46:59 +0000
Message-ID: <AM0PR04MB4211C1860A97045172987EEA80AF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
 <154386633644.88331.14352445218056608664@swboyd.mtv.corp.google.com>
In-Reply-To: <154386633644.88331.14352445218056608664@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5793;6:2SfsrJM16MOXxJr204vSd1oQ+iQJFoiAWUVjORWQSiO/Ro0znllaQTa0FQQi8SZZTIEaqK5cgxtZrB8mAs10z9FF+HlkxGKc6SxybYLTOT2fQg0Xs7c9xMrp73RnisXDNRlNFl4tVfkc/SmrPXSzH5+/UMQYAj8cFU9Fm5Xn1P5GwJmQdzvFXcLu/QmeOMjy7nuu7IxoWvzDSdj4jLCQ2jI/SsYt+380zBJHyqLFNLRliZzOfbsD1jgKUfjnWnojQQ8dIu3P18oGTZF4q204xYUNuvk3cCUZ3VySGAFi0vHGVQ3Gmsgkx6SeUm+M0w7JAHhDmn8upWdEHpg+TtjeNySt40QDI9co/vTl9KEIVpcxi/3NAruB8HXfngsDWEQvvY02GOo76jqixXzvxxSUMpFGyoLtpfgFJL381KtdODj0FwKp9nchP+QZbyMvMN7uFZRznIfGR/W2HNHeKnrhDg==;5:rsUtglYSmVbvkfUdToKturYyhmlZPbUCne+wU8auxgOexl9A+PXZ5yPiYmTmFFVrGKPQphrd9BX09ZUfWx5yBqPGlvs4gbfSYcUMMsQ5mCnlBA4v2o8WCJsexYoIykKLxGBNdAZPxVvUzYvRsfcYigMRVU+SdfkUgi5E+KjIQK0=;7:aFir2jV5JiaomT1TnN+53cKya0vaGX9bQ3M+1/A1ygAXE8LhFlWey555dbZ2L9wCYUBuM+uJox/UGe/BzznVrHP4jYhn0trG0ZEC5QRQ4yu+MAD1KfX/BAHuHTMm9OHctchtxWO1zLdrxexz+R+9hQ==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: ac32cbc8-22c6-4019-1a18-08d6598a61da
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5793;
x-ms-traffictypediagnostic: AM0PR04MB5793:
x-microsoft-antispam-prvs: <AM0PR04MB5793A0DD6FFD850F9137137480AF0@AM0PR04MB5793.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231455)(999002)(944501493)(52105112)(93006095)(93001095)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5793;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5793;
x-forefront-prvs: 0876988AF0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(39860400002)(376002)(346002)(396003)(13464003)(189003)(199004)(51914003)(7736002)(5660300001)(8676002)(6436002)(76176011)(53546011)(186003)(256004)(26005)(55016002)(6506007)(2501003)(9686003)(229853002)(8936002)(105586002)(7696005)(14454004)(53936002)(33656002)(99286004)(81166006)(81156014)(2906002)(476003)(446003)(486006)(71190400001)(6246003)(3846002)(71200400001)(316002)(54906003)(478600001)(6116002)(102836004)(68736007)(4326008)(110136005)(106356001)(11346002)(74316002)(25786009)(66066001)(4001150100001)(86362001)(305945005)(97736004)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5793;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Qo3gQcY5mxkulo5WN9Lx1EUI6Dc0HQQ4fZE+BmUf9wp20HWMRNr8i8ci45Mti5nUqHyKpbE1q4keOUKVeRlrEzNDdkJbhAgJU9cQw/uAurUJgKDHcFeYKI8wHkafkimxaKoe3eOq6LeuefGIfuOfJYtKitwSd5nzRWMraiPkJS6jHgmIKbK/vOwktkJMNMRxG4NJqhgeeRNNFiXQCBeKQQ2/Pex6Gv1zqYXO/RK42dMPn8D2PQQ+pbS1rUy9nsu49l7HWl8CxIf1M+7d9g0zd9DroYSWuhUCHL0Ih5kLjaypEEBHrVRXz5cYnnwp+j/7Z8bokfgHmQ6tmYVZlgbJ47COWiBnxTd9V6I6ZPbRsdI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac32cbc8-22c6-4019-1a18-08d6598a61da
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2018 01:47:00.0025
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
NDYgQU0NCj4gVG86IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc7IEFpc2hlbmcgRE9ORyA8YWlz
aGVuZy5kb25nQG54cC5jb20+DQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IG10dXJxdWV0dGVAYmF5bGlicmUuY29tOw0KPiBzaGF3bmd1b0BrZXJuZWwub3JnOyBG
YWJpbyBFc3RldmFtIDxmYWJpby5lc3RldmFtQG54cC5jb20+OyBkbC1saW51eC1pbXgNCj4gPGxp
bnV4LWlteEBueHAuY29tPjsga2VybmVsQHBlbmd1dHJvbml4LmRlOyBBaXNoZW5nIERPTkcNCj4g
PGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY4IDAvN10gY2xr
OiBpbXg6IGFkZCBpbXg4cXhwIGNsb2NrIHN1cHBvcnQNCj4gDQo+IFF1b3RpbmcgQWlzaGVuZyBE
T05HICgyMDE4LTExLTIxIDA2OjEyOjE2KQ0KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgaS5N
WDhRWFAgY2xvY2sgc3VwcG9ydCB3aGljaCBpcyBiYXNlZCBvbiB0aGUNCj4gPiBjbG9jayBzZXJ2
aWNlIHByb3ZpZGVkIGJ5IFNDVSBmaXJtd2FyZS4NCj4gPg0KPiA+IE5vdGU6IEl0IGRlcGVuZHMg
b24gU0NVIGRyaXZlciB3aGljaCBoYXMgYWxyZWFkeSBiZWVuIG1lcmdlZCBieSBTaGF3bi4NCj4g
PiBTbyB0aGlzIHBhdGNoIHNlcmllcyBjb3VsZCBnbyB0aHJvdWdoIFNoYXduJ3MgdHJlZSBhcyB3
ZWxsLg0KPiANCj4gQW55IHBhdGNoZXMgSSBkaWRuJ3QgbWFrZSBjb21tZW50cyBvbiBsb29rIGdv
b2QgdG8gZ28uIE9ubHkgYSBmZXcNCj4gY29tbWVudHMgdG8gYWRkcmVzcyBhbmQgb3RoZXJ3aXNl
IGl0IGxvb2tzIGdvb2QuDQoNCkdyZWF0LCBJIHdpbGwgYWRkcmVzcyBhbGwgeW91ciBjb21tZW50
cyBhbmQgcmUtc2VuZCBzb29uLg0KVGhhbmtzIGZvciB0aGUgY2FyZWZ1bGx5IHJldmlldy4NCg0K
UmVnYXJkcw0KRG9uZyBBaXNoZW5nDQoNCg==
