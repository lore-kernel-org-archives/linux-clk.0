Return-Path: <SRS0=wvUy=PS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88D0C43387
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jan 2019 02:14:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6279F214DA
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jan 2019 02:14:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="shtq84RW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfAJCOn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 21:14:43 -0500
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:54621
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726425AbfAJCOn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Jan 2019 21:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqNAAfLJeQ0J2an5FUJIPRVLB7NJC/YKxIJX3FLgb50=;
 b=shtq84RWqZDmIAJEu6MbXrTVBnp2ZggTf6spml0rOciFyOTF4LUBK8xobXyldxEbLt+zzNf96ocpMsEOUeLT2/eRR7nxl69x8rIXPmWbv4XMNpo2t4qSA6/jI9nDyNVMmrUv7rUK5m/RftjdkmZ0T9j0PgTHcpr2Fe7VE2Indg8=
Received: from VI1PR0402MB3519.eurprd04.prod.outlook.com (52.134.4.24) by
 VI1PR0402MB3437.eurprd04.prod.outlook.com (52.134.3.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.14; Thu, 10 Jan 2019 02:14:37 +0000
Received: from VI1PR0402MB3519.eurprd04.prod.outlook.com
 ([fe80::5d51:a6f6:df78:87e]) by VI1PR0402MB3519.eurprd04.prod.outlook.com
 ([fe80::5d51:a6f6:df78:87e%5]) with mapi id 15.20.1495.011; Thu, 10 Jan 2019
 02:14:37 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     Fabio Estevam <fabio.estevam@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 3/3] clk: imx: Add clock driver support for imx8mm
Thread-Topic: [PATCH 3/3] clk: imx: Add clock driver support for imx8mm
Thread-Index: AQHUpzCvrU2cW5RFHEOH8VA9DviWeaWnZn+AgABeCgA=
Date:   Thu, 10 Jan 2019 02:14:37 +0000
Message-ID: <VI1PR0402MB3519F5D070C8C52AE1444C6A87840@VI1PR0402MB3519.eurprd04.prod.outlook.com>
References: <1546938317-23203-1-git-send-email-ping.bai@nxp.com>
 <1546938317-23203-3-git-send-email-ping.bai@nxp.com>
 <154706594997.15366.8932514505305165638@swboyd.mtv.corp.google.com>
In-Reply-To: <154706594997.15366.8932514505305165638@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ping.bai@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;VI1PR0402MB3437;6:d/MY0SJMFbBxLrDGmDlBMpaTN0BfFW/f8reXDKUPxbzH+8LPZ+y/xnmyetXL+J7+UCZJpbziJ15R4E73o9SFmLP+9Qw62zNmkGcSJyXS2d86JypFvcL5Z8KBZjUyQ5+vHDuqxY46Rqmmx1Yd1PjjoCvz0vnlvVvGPH1iCAYYaBMdHXZ9zTtcvylALct8cVho797cOtCdJAxrYcMXt7nCOmFnKxH7F5hLNlgaOGG6VxMJGqzIKof4sldDnEp7bG8ZrQf3H0BK24HzaTlrc25BjCIaNahTxrN7EQbP18HPLKI7bF90MBGcioUkJMcxyUJCWTWYz4llFnmCBdTE1tIDse3tu5DwgiH/B/c2Ui3YiDUlX9yBLxEha9rm/eFJf9qvSkE2ehkbX38IIPSH/XEYblncMj1NAladQ5XIDQjiuETcqJJzpmu3G4yD8WjYeWCEYcjNPfdIRWBLCiwqOhU3Ew==;5:AtS7LUq2cpmVPpqMwf/51KTEdkcHChNUmGWlKdqG0nghISvYE2aZgK+QoRESlLPNErb4uxOKe9CplcKOGcJB56BtyY41ksZeQET1z/FitgMv7gm+ncZzxtAax4pNWAuY+1gpj1ggT1dcDSGqZ2NT6BdysSb5q4joaOeqZ2tvfMvTBg3cuoxR2yVMIwLfvYFn0g/GIDpAV7umVcK3nKpwmw==;7:NIDdJR0YrT371RXNh3lQzNu1DKcqA86cIfLu1aJQMl62t4zMCSqvv18MxPKVBYJOdsLoLsGHpH8Nse60bNFE+lsHB5ugaVc5KiD8xn+0WkLptyVxMCXpBD78yxgttenn9ul8HjhBFXQ1iKL6lrkDjw==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 03540225-45b9-4574-eb4a-08d676a15f3b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR0402MB3437;
x-ms-traffictypediagnostic: VI1PR0402MB3437:
x-microsoft-antispam-prvs: <VI1PR0402MB3437AAEEB04BDD471020F43B87840@VI1PR0402MB3437.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(10201501046)(3002001)(3231475)(944501520)(52105112)(93006095)(93001095)(6055026)(6041310)(20161123562045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:VI1PR0402MB3437;BCL:0;PCL:0;RULEID:;SRVR:VI1PR0402MB3437;
x-forefront-prvs: 0913EA1D60
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(396003)(376002)(346002)(136003)(199004)(189003)(6116002)(74316002)(99286004)(6246003)(3846002)(9686003)(4326008)(256004)(71200400001)(71190400001)(53936002)(478600001)(86362001)(68736007)(476003)(106356001)(105586002)(2501003)(5660300001)(14454004)(186003)(486006)(81156014)(81166006)(97736004)(8936002)(26005)(316002)(11346002)(446003)(110136005)(54906003)(33656002)(55016002)(8676002)(6506007)(102836004)(229853002)(25786009)(7736002)(6436002)(2906002)(7696005)(305945005)(76176011)(66066001)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB3437;H:VI1PR0402MB3519.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NpZxC7JLBm/D4Lh8NdZL+DH1N51dznVHDcu1EloSrl5jMXqVUsh3x/pP1tv0Tdo2rUoDzSf0g1hNiPIndrDnh8h/H/hpHz+chmFjWElk0eVOoerrFYWrwxd80d/rjRchzxkqvViOsIjLGH2ivCnTA5nRylAtiq40YbGnCQ5/bres10M9p4FLH8RU/9O+sJvIbxync5v7FE09FcsC8c1sVxm5a3AjM1eBtWKdVHvriv/T1ct4zIOstQpcPgcYf8klMuplXj7loS6ZHVlUCR/qnGVv0sqSmuJrh8JDfdv3/v/ncxvCQIufFW4Ve86sg49f
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03540225-45b9-4574-eb4a-08d676a15f3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2019 02:14:37.7347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3437
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDMvM10gY2xrOiBpbXg6IEFkZCBjbG9jayBkcml2ZXIgc3Vw
cG9ydCBmb3IgaW14OG1tDQo+IA0KPiBRdW90aW5nIEphY2t5IEJhaSAoMjAxOS0wMS0wOCAwMTow
MTowNCkNCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgaW14OG1tX2Nsb2Nrc19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYg
PSAmcGRldi0+ZGV2Ow0KPiA+ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+
b2Zfbm9kZTsNCj4gPiArICAgICAgIHZvaWQgX19pb21lbSAqYmFzZTsNCj4gPiArICAgICAgIGlu
dCByZXQgPSAwOw0KPiANCj4gUGxlYXNlIGRvbid0IGFzc2lnbiByZXQgaGVyZS4gSnVzdCBsZXQg
aXQgYmUgYXNzaWduZWQgbGF0ZXIgb24uDQo+IA0KDQpTdXJlLg0KDQo+ID4gKw0KPiA+ICsgICAg
ICAgY2xrc1tJTVg4TU1fQ0xLX0RVTU1ZXSA9IGlteF9jbGtfZml4ZWQoImR1bW15IiwgMCk7DQo+
ID4gKyAgICAgICBjbGtzW0lNWDhNTV9DTEtfMjRNXSA9IG9mX2Nsa19nZXRfYnlfbmFtZShucCwg
Im9zY18yNG0iKTsNCj4gPiArICAgICAgIGNsa3NbSU1YOE1NX0NMS18zMktdID0gb2ZfY2xrX2dl
dF9ieV9uYW1lKG5wLCAib3NjXzMyayIpOw0KPiAvKiBDaGVjayBtb3JlICovDQo+ID4gKyAgICAg
ICBjbGtzW0lNWDhNTV9DTEtfRVhUMV0gPSBvZl9jbGtfZ2V0X2J5X25hbWUobnAsICJjbGtfZXh0
MSIpOw0KPiA+ICsgICAgICAgY2xrc1tJTVg4TU1fQ0xLX0VYVDJdID0gb2ZfY2xrX2dldF9ieV9u
YW1lKG5wLCAiY2xrX2V4dDIiKTsNCj4gPiArICAgICAgIGNsa3NbSU1YOE1NX0NMS19FWFQzXSA9
IG9mX2Nsa19nZXRfYnlfbmFtZShucCwgImNsa19leHQzIik7DQo+ID4gKyAgICAgICBjbGtzW0lN
WDhNTV9DTEtfRVhUNF0gPSBvZl9jbGtfZ2V0X2J5X25hbWUobnAsICJjbGtfZXh0NCIpOw0KPiA+
ICsNCj4gPiArICAgICAgIG5wID0gb2ZfZmluZF9jb21wYXRpYmxlX25vZGUoTlVMTCwgTlVMTCwN
Cj4gImZzbCxpbXg4bW0tYW5hdG9wIik7DQo+ID4gKyAgICAgICBiYXNlID0gb2ZfaW9tYXAobnAs
IDApOw0KPiA+ICsgICAgICAgaWYgKFdBUk5fT04oIWJhc2UpKQ0KPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gLUVOT01FTTsNCj4gDQo+IFdoeSBkbyB3ZSBuZWVkIHRvIHJlYWNoIGludG8gc29t
ZSBvdGhlciBub2RlIHRvIGdldCB0aGUgbWVtb3J5IHJlZ2lvbiB0bw0KPiBtYXA/DQo+IA0KDQpU
aGUgUExMcycgY29uZmlnIHJlZ2lzdGVyIGlzIGluIGEgc3BlcmF0ZSBtZW1vcnkgcmVnaW9uLiBB
cyB3ZSByZWdpc3RlcmVkIGFsbCB0aGUgUExMcyBjbG9ja3MgaW4gdGhpcyBkcml2ZXIsIHRoZSBQ
TExzIG1lbW9yeSByZWdpb24NCk5lZWQgdG8gYmUgcmVhZCBvdXQgZnJvbSBpdHMgY29ycmVzcG9u
ZGluZyBub2RlLiBUaGlzIGlzIHRoZSBtZXRob2QgdGhhdCB3ZSB1c2VkIG9uIG91ciBhbGwgaS5N
WCBwbGF0Zm9ybS4NCg0KPiA+ICsNCj4gPiArICAgICAgIGNsa3NbSU1YOE1NX0FVRElPX1BMTDFf
UkVGX1NFTF0gPQ0KPiBpbXhfY2xrX211eCgiYXVkaW9fcGxsMV9yZWZfc2VsIiwgYmFzZSArIDB4
MCwgMCwgMiwgcGxsX3JlZl9zZWxzLA0KPiBBUlJBWV9TSVpFKHBsbF9yZWZfc2VscykpOw0KPiA+
ICsgICAgICAgY2xrc1tJTVg4TU1fQVVESU9fUExMMl9SRUZfU0VMXSA9DQo+IGlteF9jbGtfbXV4
KCJhdWRpb19wbGwyX3JlZl9zZWwiLCBiYXNlICsgMHgxNCwgMCwgMiwgcGxsX3JlZl9zZWxzLA0K
PiBBUlJBWV9TSVpFKHBsbF9yZWZfc2VscykpOw0KPiA+ICsgICAgICAgY2xrc1tJTVg4TU1fVklE
RU9fUExMMV9SRUZfU0VMXSA9DQo+IGlteF9jbGtfbXV4KCJ2aWRlb19wbGwxX3JlZl9zZWwiLCBi
YXNlICsgMHgyOCwgMCwgMiwgcGxsX3JlZl9zZWxzLA0KPiBBUlJBWV9TSVpFKHBsbF9yZWZfc2Vs
cykpOw0KPiA+ICsgICAgICAgY2xrc1tJTVg4TU1fRFJBTV9QTExfUkVGX1NFTF0gPQ0KPiA+ICsg
aW14X2Nsa19tdXgoImRyYW1fcGxsX3JlZl9zZWwiLCBiYXNlICsgMHg1MCwgMCwgMiwgcGxsX3Jl
Zl9zZWxzLA0KPiA+ICsgQVJSQVlfU0laRShwbGxfcmVmX3NlbHMpKTsNCj4gWy4uLl0NCj4gPiAr
ICAgICAgIGNsa3NbSU1YOE1NX1NZU19QTEwyXzMzM01dID0NCj4gaW14X2Nsa19maXhlZF9mYWN0
b3IoInN5c19wbGwyXzMzM20iLCAic3lzX3BsbDJfb3V0IiwgMSwgMyk7DQo+ID4gKyAgICAgICBj
bGtzW0lNWDhNTV9TWVNfUExMMl81MDBNXSA9DQo+IGlteF9jbGtfZml4ZWRfZmFjdG9yKCJzeXNf
cGxsMl81MDBtIiwgInN5c19wbGwyX291dCIsIDEsIDIpOw0KPiA+ICsgICAgICAgY2xrc1tJTVg4
TU1fU1lTX1BMTDJfMTAwME1dID0NCj4gPiArIGlteF9jbGtfZml4ZWRfZmFjdG9yKCJzeXNfcGxs
Ml8xMDAwbSIsICJzeXNfcGxsMl9vdXQiLCAxLCAxKTsNCj4gPiArDQo+ID4gKyAgICAgICBucCA9
IGRldi0+b2Zfbm9kZTsNCj4gPiArICAgICAgIGJhc2UgPSBvZl9pb21hcChucCwgMCk7DQo+ID4g
KyAgICAgICBpZiAoV0FSTl9PTighYmFzZSkpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAt
RU5PTUVNOw0KPiANCj4gVGhpcyBjYW4gc3VyZWx5IHVzZSB0aGUgcGxhdGZvcm0gZGV2aWNlIEFQ
SXMgdG8gbWFwIGFuZCByZXRyaWV2ZSBtZW1vcnkNCj4gcmVnaW9ucy4NCj4gDQoNCk9rLCB3aWxs
IGZpeCBpdA0KDQo+ID4gKw0KPiBbLi4uXQ0KPiA+ICsNCj4gPiArICAgICAgIGlteF9jaGVja19j
bG9ja3MoY2xrcywgQVJSQVlfU0laRShjbGtzKSk7DQo+ID4gKw0KPiA+ICsgICAgICAgY2xrX2Rh
dGEuY2xrcyA9IGNsa3M7DQo+ID4gKyAgICAgICBjbGtfZGF0YS5jbGtfbnVtID0gQVJSQVlfU0la
RShjbGtzKTsNCj4gPiArICAgICAgIHJldCA9IG9mX2Nsa19hZGRfcHJvdmlkZXIobnAsIG9mX2Ns
a19zcmNfb25lY2VsbF9nZXQsICZjbGtfZGF0YSk7DQo+ID4gKyAgICAgICBpZiAocmV0IDwgMCkg
ew0KPiA+ICsgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZWdpc3RlciBj
bGtzIGZvciBpLk1YOE1NXG4iKTsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgaW14X3JlZ2lzdGVyX3VhcnRfY2xv
Y2tzKHVhcnRfY2xrcyk7DQo+ID4gKw0KPiA+ICsgICAgICAgcHJfaW5mbygiaS5NWDhNTSBjbG9j
ayBkcml2ZXIgaW5pdCBkb25lXG4iKTsNCj4gDQo+IFBsZWFzZSBubyAiSSJtIGFsaXZlIiBtZXNz
YWdlcy4NCg0KSSB3aWxsIHJlbW92ZSBpdCBpbiBWMi4NCg0KQlINCj4gDQo+ID4gKw0KPiA+ICsg
ICAgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo=
