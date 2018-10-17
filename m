Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D483ECDE30
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 09:11:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CCA4921523
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 09:11:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="NRKyPRZj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCA4921523
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727292AbeJQRFy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 13:05:54 -0400
Received: from mail-eopbgr80078.outbound.protection.outlook.com ([40.107.8.78]:2208
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727000AbeJQRFy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 13:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wyopq8VfKIqwTr+siIGyGy6Hnco47ra9GWps6qsGIQY=;
 b=NRKyPRZjVsI19WaRlK8tHueddkc7bShpx2DiFQDE9hvHi1Gb8ZlnNo4ZfT3eYbaCJP3e9JSkytgdYjK5NJramLhPLeadm/mqjcLLe9nYQZBv6epKgJ6QpHnlaU50U8DtOXvRRYZ/ABkRuScWvH9iTEijxpuH9DW69xzLbfTXqVI=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4563.eurprd04.prod.outlook.com (52.135.149.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.26; Wed, 17 Oct 2018 09:11:04 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.032; Wed, 17 Oct 2018
 09:11:04 +0000
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
Subject: RE: [PATCH V4 02/11] clk: imx: scu: add scu clock common part
Thread-Topic: [PATCH V4 02/11] clk: imx: scu: add scu clock common part
Thread-Index: AQHUY5T9MGUT6Zv05kq5JPA5N1+iFqUiaByAgADCS0A=
Date:   Wed, 17 Oct 2018 09:11:03 +0000
Message-ID: <AM0PR04MB42110A50FDC33E66A9DDF63D80FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-3-git-send-email-aisheng.dong@nxp.com>
 <153972550584.5275.12112973418888551824@swboyd.mtv.corp.google.com>
In-Reply-To: <153972550584.5275.12112973418888551824@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4563;6:OxXT5U09D8N7xNkw0ElC+eaMXEoqV55tede/LfoEPoF4OqM+JgyqMql85q5SxmdXXyQQI2q6C8cLjBsuDOsrE6yx1Qv4YdGXqZHSobLhrht/2H9LyaTiay9AsD1784Bd/jlbvREks09HBfNqlkLNVP+nnlMGFxNv+9HdanpsmULkAJo/fki+f4gZYlc0CCs0Y87GkTF2qCbkcwYK0I3C1ZDNiONLWMmyETiVAiE+MfF9a9EfX1XiVZodI0C++2WFSrm4XpmyNMYoDRMScMz1yHLtz+g0aHrld5jYWUbVG86RBnCShFoMpbUt8OPbianGHZRjf2sJPbZdsSO8bEGfaqWXeZ6HWpqgQkQ2QvP/m/0AJkEV1NggdcvlEB5DBAc23vz58S/1L1wwC2OT1Yinj2Ris3LybW3dvJELDX/n51dCxd2Uo4Gvm9ijqZS8MfHTTeOgAJ8Zn9jv6LTv/HvHMw==;5:gp4MhikvVezdv9KyiovosoZsXSh6udS/xl+X+DzKGkCNTBSGa1EWetl6cSGKbe7ZtqB8y4lWwWN3404yCuURV4nCNoNZ4KeJytXwsda3ShrtTOWSuHRAb9IChVr3gCCC9crx+sVUuFp6dpcL/lW/98dS8AyQOUUGI+5LKdnLIlk=;7:MZrpafgcR/P+zgbZs6KG5hlkWxHPNkHOPcRU6eY/1R3L1B7Is/Soyv9QWjQSuNEDtasXPm5jGMHnBESTLXCfNddIUPOB8OFRa0uwj3YyzCUNBlBXWsBv5d6HjEIZZFVOEivi+4wuR6ZuQkJdwVQWRGTDMZbz+1CaiK/xl7ymWePFbrPZ/WqFx/0zF3GclDsbGp9HePO1it3WyJUzoOEo4KySVNRWoNDZV5eDonyulLptUywDtPgaxbVXg2fHnriO
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 5cfac139-f0a6-40d8-199b-08d634107701
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4563;
x-ms-traffictypediagnostic: AM0PR04MB4563:
x-microsoft-antispam-prvs: <AM0PR04MB4563B82D09BD1768074E6C9D80FF0@AM0PR04MB4563.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4563;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4563;
x-forefront-prvs: 08286A0BE2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(366004)(376002)(39860400002)(396003)(189003)(54534003)(13464003)(199004)(486006)(6246003)(6436002)(2501003)(476003)(229853002)(71190400001)(6116002)(71200400001)(3846002)(446003)(186003)(5250100002)(14454004)(97736004)(25786009)(105586002)(2900100001)(26005)(256004)(14444005)(106356001)(11346002)(478600001)(4326008)(4001150100001)(33656002)(110136005)(102836004)(2906002)(305945005)(86362001)(81166006)(68736007)(54906003)(53936002)(55016002)(66066001)(6506007)(7736002)(316002)(81156014)(8676002)(5660300001)(8936002)(99286004)(74316002)(9686003)(7696005)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4563;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: bDHITdfUZDlVM+Bq4P2ooFhk7xQfOXfvxMR/Z8yrmzTjwbSqd5vNK4IH6siU6s8cp5ZFYnttW99bkc6kFVGsyRP5kLmkZ60T8ClsqS4xUTkMSN+k/UTij75NagE3dNhUECDE2WFnGbyx2TGk+H2MTXOFEKyeRFQoq/ZbC2TtGW/kahGM4/nxSRVpJHl3uyO4dKFwI12Q1AK47V9daeipwEgkRpUSFNX8VSn7sj9pwIAJ1ybDVhFigBNI1BZv5RcOSodEyPWl7mc+F5x6YM4O4QTF3GARUaU7FAULzMNgF4bY2v5z9bL0Qt9g+PebRrSMzVu36zI6qSZT6E78a9Or3FKRN+zfwuA/4ybfVOWwz5s=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfac139-f0a6-40d8-199b-08d634107701
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2018 09:11:03.8674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4563
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMTcsIDIwMTgg
NTozMiBBTQ0KPiBRdW90aW5nIEEucy4gRG9uZyAoMjAxOC0xMC0xNCAwMTowNzo0NSkNCj4gPiBB
ZGQgc2N1IGNsb2NrIGNvbW1vbiBwYXJ0IHdoaWNoIHdpbGwgYmUgdXNlZCBieSBjbGllbnQgY2xv
Y2sgZHJpdmVycy4NCj4gPg0KPiA+IENjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+
DQo+ID4gQ2M6IFNhc2NoYSBIYXVlciA8a2VybmVsQHBlbmd1dHJvbml4LmRlPg0KPiA+IENjOiBG
YWJpbyBFc3RldmFtIDxmYWJpby5lc3RldmFtQG54cC5jb20+DQo+ID4gQ2M6IFN0ZXBoZW4gQm95
ZCA8c2JveWRAa2VybmVsLm9yZz4NCj4gPiBDYzogTWljaGFlbCBUdXJxdWV0dGUgPG10dXJxdWV0
dGVAYmF5bGlicmUuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVu
Zy5kb25nQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlTG9nOg0KPiA+IHYzLT52NDoNCj4g
PiAgKiBzY3UgaGVhZGZpbGUgcGF0aCBjaGFuZ2UNCj4gPiB2Mi0+djM6DQo+ID4gICogbm8gY2hh
bmdlcw0KPiA+IHYxLT52MjoNCj4gPiAgKiB1cGRhdGUgZnVuY3Rpb24gY2FsbCBuYW1lDQo+ID4g
LS0tDQo+ID4gIGRyaXZlcnMvY2xrL2lteC9LY29uZmlnICAgICAgIHwgIDIgKysNCj4gPiAgZHJp
dmVycy9jbGsvaW14L01ha2VmaWxlICAgICAgfCAgMiArKw0KPiA+ICBkcml2ZXJzL2Nsay9pbXgv
c2N1L0tjb25maWcgICB8ICA1ICsrKysrDQo+ID4gIGRyaXZlcnMvY2xrL2lteC9zY3UvTWFrZWZp
bGUgIHwgIDQgKysrKw0KPiA+IGRyaXZlcnMvY2xrL2lteC9zY3UvY2xrLXNjdS5jIHwgMTcgKysr
KysrKysrKysrKysrKysNCj4gPiBkcml2ZXJzL2Nsay9pbXgvc2N1L2Nsay1zY3UuaCB8IDE4ICsr
KysrKysrKysrKysrKysrKw0KPiANCj4gV2h5IGlzIHNjdSBuZXN0ZWQgb25lIGxldmVsIGRlZXBl
ciBpbiB0aGUgaW14IGRpcmVjdG9yeT8gQ2FuJ3Qgd2UganVzdCBrZWVwDQo+IHRoZW0gYWxsIHdp
dGhpbiBpbXggdG9wbGV2ZWwgZGlyZWN0b3J5Pw0KPiANCg0KTW9zdGx5IGJlY2F1c2UgU0NVIGNs
b2NrcyBhcmUgdG90YWxseSBkaWZmZXJlbnQgZnJvbSB0aGUgbGVnYWN5IGNsb2Nrcy4NCihObyBt
dWNoIGxlZ2FjeSB0aGluZ3MgY2FuIGJlIHJldXNlZCkgU28gb3JnYW5pemVkIHRoZW0gdG9nZXRo
ZXIgaW4gYSBkZWVwZXIgZm9sZGVyDQpmb3IgY2xlYXIgc2VwYXJhdGlvbiBhbmQgYmV0dGVyIG1h
aW50ZW5hbmNlDQoNCkRvIHlvdSB0aGluayB3ZSBzdGlsbCBzaG91bGQgcHV0IHRoZW0gd2l0aGlu
IGlteCB0b3BsZXZlbCBkaXJlY3RvcnkgYW5kIG1peCB0aGVtIHdpdGgNCkxlZ2FjeSBjbG9ja3M/
DQoNClJlZ2FyZHMNCkRvbmcgQWlzaGVuZw0KDQo+ID4gIDYgZmlsZXMgY2hhbmdlZCwgNDggaW5z
ZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvaW14L3NjdS9L
Y29uZmlnICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBkcml2ZXJzL2Nsay9pbXgvc2N1L01ha2Vm
aWxlICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBkcml2ZXJzL2Nsay9pbXgvc2N1L2Nsay1zY3Uu
YyAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gZHJpdmVycy9jbGsvaW14L3NjdS9jbGstc2N1LmgN
Cj4gPg0K
