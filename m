Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22F2C10F14
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 21:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 605BD214C6
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 21:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="IBJtvUYO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389442AbfDRVP2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 17:15:28 -0400
Received: from mail-eopbgr750045.outbound.protection.outlook.com ([40.107.75.45]:31974
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729198AbfDRVP1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Apr 2019 17:15:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wd85Pre3fnlIrPwYnLTzkDocJkDqQzuXY/tHzeksm9A=;
 b=IBJtvUYOALbP9QD8nWVBlXG00w5CbcydUR3mA/y2O92PCAuCpl6cHcKfU8q/Zzl2CARqmVY4iObUNrdAYcMzxXmYpT8W5cB9JuMvNe9/sY58fO8+kXBKqBBZt53syW0yMDhHqjKOWkQkyS4DBAh6u/jjUlxApBre3A55PANr6yE=
Received: from BYAPR02MB5992.namprd02.prod.outlook.com (20.179.89.80) by
 BYAPR02MB4840.namprd02.prod.outlook.com (52.135.234.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Thu, 18 Apr 2019 21:15:24 +0000
Received: from BYAPR02MB5992.namprd02.prod.outlook.com
 ([fe80::75d3:6a86:7357:90bd]) by BYAPR02MB5992.namprd02.prod.outlook.com
 ([fe80::75d3:6a86:7357:90bd%6]) with mapi id 15.20.1813.013; Thu, 18 Apr 2019
 21:15:24 +0000
From:   Jolly Shah <JOLLYS@xilinx.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michals@xilinx.com>
Subject: RE: [PATCH v3] clk: zynqmp: use structs for clk query responses
Thread-Topic: [PATCH v3] clk: zynqmp: use structs for clk query responses
Thread-Index: AQHU8RVzo6Bnhld52UOhpViGBBpWq6ZCYMJQgAAKmwCAAAnb4A==
Date:   Thu, 18 Apr 2019 21:15:24 +0000
Message-ID: <BYAPR02MB59923C6ACA66F86DD73C4774B8260@BYAPR02MB5992.namprd02.prod.outlook.com>
References: <20190412095220.22855-1-m.tretter@pengutronix.de>
 <BYAPR02MB5992D239360C649F9CB0EB7EB8260@BYAPR02MB5992.namprd02.prod.outlook.com>
 <155561994675.15276.10692297233973568559@swboyd.mtv.corp.google.com>
In-Reply-To: <155561994675.15276.10692297233973568559@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JOLLYS@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12f80482-e8ec-4206-83fc-08d6c442f927
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:BYAPR02MB4840;
x-ms-traffictypediagnostic: BYAPR02MB4840:
x-microsoft-antispam-prvs: <BYAPR02MB48409AC883FF13D48502ACB8B8260@BYAPR02MB4840.namprd02.prod.outlook.com>
x-forefront-prvs: 0011612A55
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(39860400002)(346002)(396003)(366004)(189003)(199004)(13464003)(6116002)(6436002)(9686003)(72206003)(486006)(25786009)(102836004)(53936002)(71200400001)(71190400001)(76176011)(53546011)(54906003)(3846002)(110136005)(55016002)(305945005)(478600001)(107886003)(66556008)(4326008)(66476007)(8936002)(73956011)(76116005)(26005)(7736002)(7696005)(74316002)(186003)(14454004)(6506007)(229853002)(68736007)(81166006)(8676002)(6246003)(33656002)(256004)(446003)(81156014)(2501003)(99286004)(66066001)(11346002)(2201001)(52536014)(86362001)(2906002)(97736004)(316002)(5660300002)(476003)(66446008)(64756008)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB4840;H:BYAPR02MB5992.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bQILyfKNd7ZE+Djhsas0HgvSNepVlSzy781nsxKLv5cO8JMvyAQTs14zxshjMa5XDEyhp13ZlGoSGEBb8lJ9iVlj0Nw8Uiy8rq2HfQ91y058Ga2IP28+KFmO5U6mXulf1wJKU8f0DCbdGLrXEuHYuOmOKRLFYITU5BUzHn8B7gphnnlIeIo4xc1mPMWloIxwo2xbzDh90bUtQM1ot2AvkdgBS9nWH0BTPTz6N8IgDBlQP1/l5gHPh5if+jL6K3YY2fehrOAaXJmP1Ejf6Wr1SLi2Lv0fbICUBKh+77HXBeJbbW9BypXamPGuuJSP/JL1CfrQAT7nKmpquiSyUBbEOm2iGexNkVEmr9wXh588CSVg4JxKrVWoVMd+kK1nzYaBKGSywrd5xdSEgiIF3rtg4UJrMZTzrfO9OhWfKws6yiA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f80482-e8ec-4206-83fc-08d6c442f927
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2019 21:15:24.5195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4840
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU3RlcGhhbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVw
aGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAxOCwg
MjAxOSAxOjM5IFBNDQo+IFRvOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7
IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc7IEpvbGx5IFNoYWgNCj4gPEpPTExZU0B4aWxpbngu
Y29tPjsgTWljaGFlbCBUcmV0dGVyIDxtLnRyZXR0ZXJAcGVuZ3V0cm9uaXguZGU+DQo+IENjOiBr
ZXJuZWxAcGVuZ3V0cm9uaXguZGU7IE1pY2hhZWwgVHVycXVldHRlIDxtdHVycXVldHRlQGJheWxp
YnJlLmNvbT47DQo+IE1pY2hhbCBTaW1layA8bWljaGFsc0B4aWxpbnguY29tPg0KPiBTdWJqZWN0
OiBSRTogW1BBVENIIHYzXSBjbGs6IHp5bnFtcDogdXNlIHN0cnVjdHMgZm9yIGNsayBxdWVyeSBy
ZXNwb25zZXMNCj4gDQo+IFF1b3RpbmcgSm9sbHkgU2hhaCAoMjAxOS0wNC0xOCAxMzowMTozMikN
Cj4gPiBIaSwNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZy
b206IE1pY2hhZWwgVHJldHRlciA8bS50cmV0dGVyQHBlbmd1dHJvbml4LmRlPg0KPiA+ID4gU2Vu
dDogRnJpZGF5LCBBcHJpbCAxMiwgMjAxOSAyOjUyIEFNDQo+ID4gPiBUbzogbGludXgtY2xrQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4g
PiBDYzoga2VybmVsQHBlbmd1dHJvbml4LmRlOyBNaWNoYWVsIFR1cnF1ZXR0ZQ0KPiA8bXR1cnF1
ZXR0ZUBiYXlsaWJyZS5jb20+Ow0KPiA+ID4gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3Jn
PjsgTWljaGFsIFNpbWVrIDxtaWNoYWxzQHhpbGlueC5jb20+Ow0KPiBKb2xseQ0KPiA+ID4gU2hh
aCA8Sk9MTFlTQHhpbGlueC5jb20+OyBNaWNoYWVsIFRyZXR0ZXIgPG0udHJldHRlckBwZW5ndXRy
b25peC5kZT4NCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2M10gY2xrOiB6eW5xbXA6IHVzZSBzdHJ1
Y3RzIGZvciBjbGsgcXVlcnkgcmVzcG9uc2VzDQo+ID4gPg0KPiA+ID4gVGhlIGRyaXZlciByZXRy
aWV2ZXMgdGhlIGNsb2NrIHRyeSBieSBxdWVyeWluZyB0aGUgQVRGIGZvciB0aGUgY2xvY2sNCj4g
Pg0KPiA+ICp0cmVlDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gSm9sbHkgU2hhaA0KPiANCj4gSXMg
dGhhdCBhIFJldmlld2VkLWJ5Pw0KDQpDb21taXQgbWVzc2FnZSBoYXMgYSB0eXBvLCAidHJ5IiBp
bnN0ZWFkIG9mICJ0cmVlIi4gUmVzdCBsb29rcyBnb29kLg0KDQpUaGFua3MsDQpKb2xseSBTaGFo
DQoNCg==
