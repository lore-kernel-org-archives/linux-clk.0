Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE54ECDE32
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 09:07:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDE7921523
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 09:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="FtPKoQZv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDE7921523
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbeJQRBs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 13:01:48 -0400
Received: from mail-eopbgr30065.outbound.protection.outlook.com ([40.107.3.65]:32170
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726636AbeJQRBs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 13:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1jmw8+iVMemcRzTlB14uCoQP9HK5OMcq9ADqAoXdT0=;
 b=FtPKoQZvBVOQGhyaG+OlCs81HUGhkSJeMQVdzGiSO0GoXkMuL/M8k+Plq84/U5cbBipZONzv8+dvep4HkWZFrD63ZCOPCz3Rn0S1fP/6qbjStCnKgqYCsHz4sq4J9UUMbtpM1AtZPMcacCQhfFl1LG1TJ284b7OL91eF8fMKqqI=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4386.eurprd04.prod.outlook.com (52.135.148.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.26; Wed, 17 Oct 2018 09:07:00 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.032; Wed, 17 Oct 2018
 09:07:00 +0000
From:   "A.s. Dong" <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V4 08/11] clk: imx: scu: add scu clock gpr mux
Thread-Topic: [PATCH V4 08/11] clk: imx: scu: add scu clock gpr mux
Thread-Index: AQHUY5UJiMWo4EyTlU6ZkZDeCgMmnqUiZ84AgADBmgA=
Date:   Wed, 17 Oct 2018 09:07:00 +0000
Message-ID: <AM0PR04MB42111EE950D372B8D330164780FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-9-git-send-email-aisheng.dong@nxp.com>
 <153972544065.5275.2030080128764662219@swboyd.mtv.corp.google.com>
In-Reply-To: <153972544065.5275.2030080128764662219@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4386;6:isT6GAX4t+2IN8iVflqN+nSFL9lKwwYa3XguqO3HaoGJazFKjzyb9Fxx8lOjG3Y2v91ObZIYIYQROOqpHF1VFSI6TNkIZRrTG5k2NL+JPqAvdVvLZCb7eUo8M3IIYH+t5Z/gvhIt8TI+S/dFTDxWJi6R/He1kKhaCxLOd0EZ1fzjsNRkWNq2BIFFqAGY8xbYPm7flC7xPDR205A/ZqK43i9BjtnTKgBTo8fMsSJp48IwdX0O/RRzFIaSYG0y6Ms2c3EBJrdO0NdEjUofMWc9Sf4OVpgI2OZ4tLF3jYnHm9TLDdQerxLKgBpnK9VtKyoSCWbCSnyRHz9LNKVqD5Dqf33GDFUIUdLqM9QjBDk/6vVQ4sUU7jtnTKc2C8HdoKYYwhZY4oVpGAqiTfi+9OZTCmzjdM7b8zFmXxzSKURWvPPP6S7Yoo9qQ6WPcR1gfG+9bxs1rT/amQNjZzQ30pnU8Q==;5:L31j5kV0nhg1DDdN5oQbN1jczNAHuxbrmmc0JZVJlQbYIAS3x4hyaxnRNR7eZp7yS7H3vVtVxqGcsM2/1UW8Bd4K2Nf7UiqAHn8CcHSPkLol88sJKdoM8of+nthPhsInqv3HTOk9WEzJKFibmSXWd7rXJIsDVfczT4RmgdPo/xI=;7:b1qJ7nf6gjH0EnX2iWoXc+l3TovgxrJU2Y5acZyRRbG8sxsmIYHggTRutklatNPiy0356rm1LcJzrUdzrAqigp+EbK2BHjOzNjkjeoGRtgkunlEAcuncHWqjChV42nN0pHEqfYNMhE+16dZh5ew4EvPBaCB5615yIcMLCMFGkrsfxAnsfvOB65Az+nNvR2t1j7HIv2UGsSAXf6hiL0Rbonb5KOcKo929h7kTwTXglNTDFurrcV+8xdXJ9phKX2zP
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: a834396c-1d48-4445-5f43-08d6340fe5a8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4386;
x-ms-traffictypediagnostic: AM0PR04MB4386:
x-microsoft-antispam-prvs: <AM0PR04MB4386D28FB9D9D79E70A2659C80FF0@AM0PR04MB4386.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(10201501046)(93006095)(93001095)(3002001)(6055026)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4386;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4386;
x-forefront-prvs: 08286A0BE2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(366004)(346002)(39860400002)(136003)(13464003)(199004)(189003)(71190400001)(66066001)(478600001)(53936002)(5660300001)(106356001)(186003)(316002)(14454004)(6246003)(2900100001)(68736007)(9686003)(55016002)(256004)(71200400001)(5250100002)(6436002)(8676002)(229853002)(7736002)(6506007)(81166006)(81156014)(54906003)(76176011)(99286004)(7696005)(33656002)(2501003)(74316002)(486006)(305945005)(8936002)(105586002)(446003)(2906002)(476003)(6116002)(11346002)(3846002)(26005)(25786009)(97736004)(4001150100001)(86362001)(110136005)(4326008)(102836004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4386;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Qvju7TK5u/LNC/x1WBWBVK6uY/A8iM90FW05b1Dk67w8PUlzBgr05xOKBDbU3F5MngRpQsZ5xp6oM8J1Jj4XDdXkKlGVSmIG0VSRly1J/mraVFN4Z3pVKlrkRUWrfAZcEtj2/f9fUhv3BRTTYdFrRythIGmA+Cr3rDoPZ3sCrPe2GFj4bk/egl8wHaKebtbEZhY3BreyqaXV+hhft96zBl95aFtlyxosBQQCKP1JxiHyn5pWv7aBv0wloRlcrZgcJnQ5OWyTaU+45GFE7GSUNfb2ukhxuO+vlpIpM/rkQ4eERRZHRKvLLalZZcCQwYre8ugm/0qLwVZ2croJwDkeO7LKawIp4Jm7SkpQLP8UcFk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a834396c-1d48-4445-5f43-08d6340fe5a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2018 09:07:00.0573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4386
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMTcsIDIwMTgg
NTozMSBBTQ0KPiBRdW90aW5nIEEucy4gRG9uZyAoMjAxOC0xMC0xNCAwMTowODowNikNCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvaW14L3NjdS9jbGstbXV4LWdwci1zY3UuYw0KPiA+IGIv
ZHJpdmVycy9jbGsvaW14L3NjdS9jbGstbXV4LWdwci1zY3UuYw0KPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMC4uMmFkN2E4MA0KPiA+IC0tLSAvZGV2L251bGwNCj4g
PiArKysgYi9kcml2ZXJzL2Nsay9pbXgvc2N1L2Nsay1tdXgtZ3ByLXNjdS5jDQo+ID4gQEAgLTAs
MCArMSw5MCBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsNCj4g
PiArLyoNCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDE2IEZyZWVzY2FsZSBTZW1pY29uZHVjdG9y
LCBJbmMuDQo+ID4gKyAqIENvcHlyaWdodCAyMDE3fjIwMTggTlhQDQo+ID4gKyAqICAgICBEb25n
IEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNp
bmNsdWRlIDxsaW51eC9jbGstcHJvdmlkZXIuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2Vyci5o
Pg0KPiA+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIu
aD4NCj4gPiArDQo+ID4gKyNpbmNsdWRlICJjbGstc2N1LmgiDQo+ID4gKw0KPiA+ICtzdHJ1Y3Qg
Y2xrX211eF9ncHJfc2N1IHsNCj4gPiArICAgICAgIHN0cnVjdCBjbGtfaHcgaHc7DQo+ID4gKyAg
ICAgICB1MzIgICAgIHJzcmNfaWQ7DQo+ID4gKyAgICAgICB1OCAgICAgIGdwcl9pZDsNCj4gPiAr
fTsNCj4gPiArDQo+ID4gKyNkZWZpbmUgdG9fY2xrX211eF9ncHJfc2N1KF9odykgY29udGFpbmVy
X29mKF9odywgc3RydWN0DQo+ID4gK2Nsa19tdXhfZ3ByX3NjdSwgaHcpDQo+ID4gKw0KPiA+ICtz
dGF0aWMgdTggY2xrX211eF9ncHJfc2N1X2dldF9wYXJlbnQoc3RydWN0IGNsa19odyAqaHcpIHsN
Cj4gPiArICAgICAgIHN0cnVjdCBjbGtfbXV4X2dwcl9zY3UgKmdwcl9tdXggPSB0b19jbGtfbXV4
X2dwcl9zY3UoaHcpOw0KPiA+ICsgICAgICAgdTMyIHZhbCA9IDA7DQo+ID4gKyAgICAgICBpbnQg
cmV0Ow0KPiA+ICsNCj4gPiArICAgICAgIHJldCA9IGlteF9zY19taXNjX2dldF9jb250cm9sKGNj
bV9pcGNfaGFuZGxlLCBncHJfbXV4LT5yc3JjX2lkLA0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZ3ByX211eC0+Z3ByX2lkLCAmdmFsKTsNCj4gPiArICAgICAgIGlm
IChyZXQpIHsNCj4gPiArICAgICAgICAgICAgICAgcHJfZXJyKCIlczogZmFpbGVkIHRvIGdldCBj
bG9jayBwYXJlbnQgJWRcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xrX2h3X2dl
dF9uYW1lKGh3KSwgcmV0KTsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ID4gKyAg
ICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuICh1OCl2YWw7DQo+IA0KPiBOaXRwaWNr
OiBQbGVhc2UgZHJvcCBleHBsaWNpdCBjYXN0cy4NCj4gDQoNCkNvbXBpbGVyIGRvZXMgaXQgZm9y
IHVzIGFscmVhZHksIHJpZ2h0Pw0KV2lsbCBkcm9wIGl0Lg0KDQo+ID4gK30NCj4gPiArDQo+ID4g
K3N0YXRpYyBpbnQgY2xrX211eF9ncHJfc2N1X3NldF9wYXJlbnQoc3RydWN0IGNsa19odyAqaHcs
IHU4IGluZGV4KSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgY2xrX211eF9ncHJfc2N1ICpncHJfbXV4
ID0gdG9fY2xrX211eF9ncHJfc2N1KGh3KTsNCj4gPiArICAgICAgIGludCByZXQ7DQo+ID4gKw0K
PiA+ICsgICAgICAgcmV0ID0gaW14X3NjX21pc2Nfc2V0X2NvbnRyb2woY2NtX2lwY19oYW5kbGUs
IGdwcl9tdXgtPnJzcmNfaWQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBncHJfbXV4LT5ncHJfaWQsIGluZGV4KTsNCj4gPiArICAgICAgIGlmIChyZXQpDQo+ID4g
KyAgICAgICAgICAgICAgIHByX2VycigiJXM6IGZhaWxlZCB0byBzZXQgY2xvY2sgcGFyZW50ICVk
XG4iLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsa19od19nZXRfbmFtZShodyksIHJl
dCk7DQo+IA0KPiBOaXRwaWNrOiBUaGVzZSBwcmludGtzIGFyZSBjbHV0dGVyaW5nIHRoZSBjb2Rl
LCBhbnkgY2hhbmNlIHRoZXkgY2FuIGJlIHJlbW92ZWQNCj4gYW5kIHlvdSBjYW4gcmVseSBvbiBj
YWxsZXJzIHRvIGNhcmUgaWYgc29tZXRoaW5nIGZhaWxlZD8NCj4gDQoNClllcywgZ29vZCBzdWdn
ZXN0aW9uLg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcNCg0KPiA+ICsNCj4gPiArICAgICAgIHJl
dHVybiByZXQ7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX29w
cyBjbGtfbXV4X2dwcl9zY3Vfb3BzID0gew0KPiA+ICsgICAgICAgLmdldF9wYXJlbnQgPSBjbGtf
bXV4X2dwcl9zY3VfZ2V0X3BhcmVudCwNCj4gPiArICAgICAgIC5zZXRfcGFyZW50ID0gY2xrX211
eF9ncHJfc2N1X3NldF9wYXJlbnQsIH07DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgY2xrX2h3ICpjbGtf
cmVnaXN0ZXJfbXV4X2dwcl9zY3UoY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhcg0KPiA+ICsq
IGNvbnN0ICpwYXJlbnRzLA0K
