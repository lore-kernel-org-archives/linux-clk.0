Return-Path: <SRS0=wvUy=PS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BA9C43387
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jan 2019 01:59:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E11EE20663
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jan 2019 01:59:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="VcAPEcZ7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfAJB7N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 20:59:13 -0500
Received: from mail-eopbgr40057.outbound.protection.outlook.com ([40.107.4.57]:53924
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726425AbfAJB7N (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Jan 2019 20:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DldHIs5arlYhrOrYfjnRyeD1o4Hm6Sna5eJS2qDc8wk=;
 b=VcAPEcZ7JOiY+cL4610PwYIhu5dpplyu1GOGRRqn/tccY0KLxtDzld73nTq2LI/9c4XQxp/xPtuvzrL/ahnOCubrPgQxFUcyQAk8mPWzj18SynaSEqbHTM2NBt7xLdZV8hRFjxyTPodDgpIq5UUnEVumQsnWEqc1pmY0NdXwsC8=
Received: from VI1PR0402MB3519.eurprd04.prod.outlook.com (52.134.4.24) by
 VI1PR0402MB3853.eurprd04.prod.outlook.com (52.134.16.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.9; Thu, 10 Jan 2019 01:59:08 +0000
Received: from VI1PR0402MB3519.eurprd04.prod.outlook.com
 ([fe80::5d51:a6f6:df78:87e]) by VI1PR0402MB3519.eurprd04.prod.outlook.com
 ([fe80::5d51:a6f6:df78:87e%5]) with mapi id 15.20.1495.011; Thu, 10 Jan 2019
 01:59:08 +0000
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
Subject: RE: [PATCH 2/3] dt-bindings: imx: Add clock binding doc for imx8mm
Thread-Topic: [PATCH 2/3] dt-bindings: imx: Add clock binding doc for imx8mm
Thread-Index: AQHUpzCrD39omiAYVE6WZBWElns7n6WnZ6WAgABVH8A=
Date:   Thu, 10 Jan 2019 01:59:07 +0000
Message-ID: <VI1PR0402MB351916006483034F8146FEDE87840@VI1PR0402MB3519.eurprd04.prod.outlook.com>
References: <1546938317-23203-1-git-send-email-ping.bai@nxp.com>
 <1546938317-23203-2-git-send-email-ping.bai@nxp.com>
 <154706619539.15366.15074052691710369448@swboyd.mtv.corp.google.com>
In-Reply-To: <154706619539.15366.15074052691710369448@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ping.bai@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;VI1PR0402MB3853;6:fnNtXWh+fpL5VVGjMnMoeVtMh1owlvLi9eaEUuqsrlb9E26CMvDmEINlxlifm1onqhmuygUf+qj2IN32W4hsY4PyE5MrQ5Tspts++bIbZb9TQuSJ6DihNDD4dKcZ0TLe80co1wID4nYM8+Xt57w2fC42jaSqlXy2FDq+hvYRIgZi4oyHfVIOJD10ayW5BqH7paPpaMCucIH4jU9S105XFvN2j0JufK1zbMZF958o48cd2AW7qvD7A/vKiDlXN+OHyBcJ+r7HoVz7l2/tKT8b3eDktiZIkihFIgzsUxmGXIv7/u457XeLqCqinEUP/9OCAOHt3aCzZ183CKR9BgyOjg5n3h+HWXnvhOOg0lageTKA0VOFAICwyJ+Kl4hyr3MtR+JNp3u0sbsSGyhKE9bV2mZG9oSNnefVJnnURFHn6kUyySRCzMzgaNBA/NMniQqnqHm018RlEoEe6qPL5bC1ug==;5:yKNJvHFCCuKpCJjK+5ZoiZjwqi83Qh8gyf9EBc20QLyCBY0FGhDZKS+WPer+tcjrhLW2srVFAonh+z0VP95Tk0+hrpuX5tQt/Ylt4RXAgSyBHGJ80zi7AEi3/+fsgDR1QpdyogpmQ33ngWn1M/DC/MoY9EQPvk9WBrpnNVz/mk7ZFXYtrMCB0hX2Y06Caa8q9FvjrlQd6FIw0vVA3Zmjwg==;7:Nvv/me9oCEJVIpgMFnOghalzmMOb8/M9ZTjcsc2ZoIbExg/Uf2RFm2e4Igqa6T6mOEvQeSxb5qsCXXH3zw2MWGtt0b0jhtVhiVJnJ9H+n7r396xv2d7xW/Rli6me1e3cp1SqZIQSQnVS80qgEm/RxQ==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: a9109333-69f0-4e73-910b-08d6769f350d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR0402MB3853;
x-ms-traffictypediagnostic: VI1PR0402MB3853:
x-microsoft-antispam-prvs: <VI1PR0402MB3853F55884CE7FB52053FA2787840@VI1PR0402MB3853.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231475)(944501520)(52105112)(6055026)(6041310)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:VI1PR0402MB3853;BCL:0;PCL:0;RULEID:;SRVR:VI1PR0402MB3853;
x-forefront-prvs: 0913EA1D60
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(39860400002)(346002)(366004)(396003)(199004)(189003)(71190400001)(11346002)(81166006)(256004)(71200400001)(8676002)(53936002)(7736002)(74316002)(6246003)(2906002)(8936002)(4326008)(476003)(446003)(5660300001)(66066001)(25786009)(54906003)(316002)(6116002)(86362001)(3846002)(305945005)(110136005)(81156014)(6436002)(26005)(186003)(102836004)(478600001)(6506007)(105586002)(68736007)(14454004)(229853002)(76176011)(106356001)(486006)(97736004)(99286004)(9686003)(33656002)(7696005)(2501003)(55016002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB3853;H:VI1PR0402MB3519.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8m3U2Z8fPCZzMEVEOWX2bCw6cbdKmyjaU+oadFJ6bmm6iKcHI2w1DT1wHV+7hiauuNXsRh3mtREMTsmCVRReYCHHhy9lgmGhA5NrSk9zaIzfebmSSy2bs+AdtEA+dh1afiZNejV56j9Hc9iQdLnyMnz/AIdQIri9o+3mjr65Jz6W0lfgP+Gwl057dROnwxI7davutjItMmI11+LQCz0Xks9+F3sz4mG+iLTxZxKxGsd2SuUM3C6fFgDVd5V38Hx2UV/7xARRSfLGWUzQ/1SSuIswTOecajIhnXhZ4yjNV0XIQVM3rMzCXqFQrp7cKvqy
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9109333-69f0-4e73-910b-08d6769f350d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2019 01:59:08.0292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3853
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10gZHQtYmluZGluZ3M6IGlteDogQWRkIGNsb2NrIGJp
bmRpbmcgZG9jIGZvciBpbXg4bW0NCj4gDQo+IFF1b3RpbmcgSmFja3kgQmFpICgyMDE5LTAxLTA4
IDAxOjAwOjU4KQ0KPiA+IEFkZCB0aGUgY2xvY2sgYmluZGluZyBkb2MgZm9yIGkuTVg4TU0uDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCYWkgUGluZyA8cGluZy5iYWlAbnhwLmNvbT4NCj4gPiAt
LS0NCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svaW14OG1tLWNsb2NrLnR4dCAg
ICAgfCAgMTkgKysNCj4gPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9pbXg4bW0tY2xvY2su
aCAgICAgICAgICAgfCAyNDQNCj4gKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgMjYzIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2lteDhtbS1jbG9jay50eHQN
Cj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svaW14OG1t
LWNsb2NrLmgNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvY2xvY2svaW14OG1tLWNsb2NrLnR4dA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2lteDhtbS1jbG9jay50eHQNCj4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAuLjAzNGI2ZDQNCj4gPiAtLS0gL2Rldi9udWxsDQo+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2lteDhtbS1j
bG9jay50eHQNCj4gPiBAQCAtMCwwICsxLDE5IEBADQo+ID4gKyogQ2xvY2sgYmluZGluZ3MgZm9y
IE5YUCBpLk1YOE0gTWluaQ0KPiA+ICsNCj4gPiArUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiAr
LSBjb21wYXRpYmxlOiBTaG91bGQgYmUgImZzbCxpbXg4bW0tY2NtIg0KPiA+ICstIHJlZzogQWRk
cmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSByZWdpc3RlciBzZXQNCj4gPiArLSAjY2xvY2stY2VsbHM6
IFNob3VsZCBiZSA8MT4NCj4gPiArLSBjbG9ja3M6IGxpc3Qgb2YgY2xvY2sgc3BlY2lmaWVycywg
bXVzdCBjb250YWluIGFuIGVudHJ5IGZvciBlYWNoIHJlcXVpcmVkDQo+ID4gKyAgICAgICAgICBl
bnRyeSBpbiBjbG9jay1uYW1lcw0KPiA+ICstIGNsb2NrLW5hbWVzOiBzaG91bGQgaW5jbHVkZSB0
aGUgZm9sbG93aW5nIGVudHJpZXM6DQo+ID4gKyAgICAtICJvc2NfMzJrIg0KPiA+ICsgICAgLSAi
b3NjXzI0bSINCj4gPiArICAgIC0gImNsa19leHQxIg0KPiA+ICsgICAgLSAiY2xrX2V4dDIiDQo+
ID4gKyAgICAtICJjbGtfZXh0MyINCj4gPiArICAgIC0gImNsa19leHQ0Ig0KPiA+ICsNCj4gPiAr
VGhlIGNsb2NrIGNvbnN1bWVyIHNob3VsZCBzcGVjaWZ5IHRoZSBkZXNpcmVkIGNsb2NrIGJ5IGhh
dmluZyB0aGUNCj4gPiArY2xvY2sgSUQgaW4gaXRzICJjbG9ja3MiIHBoYW5kbGUgY2VsbC4gU2Vl
DQo+ID4gK2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svaW14OG1tLWNsb2NrLmgNCj4gPiArZm9y
IHRoZSBmdWxsIGxpc3Qgb2YgaS5NWDhNIE1pbmkgY2xvY2sgSURzLg0KPiANCj4gQW55IGV4YW1w
bGUgb2YgdGhpcyBub2RlPyBOb3QgdGhlIGNsb2NrIGNvbnN1bWVyLg0KDQpTdXJlLCBJIGNhbiBh
ZGQgYW4gZXhhbXBsZSBpbiBWMi4NCg0KQlINCkphY2t5IEJhaQ0K
