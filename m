Return-Path: <SRS0=m775=ND=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2ECEC46475
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 22:28:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 455A820651
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 22:28:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="UjICjP7E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 455A820651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbeJXGyT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Oct 2018 02:54:19 -0400
Received: from mail-ty1jpn01on0094.outbound.protection.outlook.com ([104.47.93.94]:35891
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726493AbeJXGyT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 24 Oct 2018 02:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XB0UUVHYmIDkkvjjg72zxMoAOurChImM86CreILeCho=;
 b=UjICjP7EQgmPSLwCbnr+HfaO9EhMvnqRBWeITmfKXoYdz1WgxupxkFORWKlzttMXof2c7MKY3rN3t0L5mwdhdN/KjiAGNJkYD5TJmnlD+OZkbl74gaVHLfI1+EYPOGpvK9PkwgQob7c2/kZXPn9h/K81tXQ692FIQYXWdr2LcgI=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.162.18) by
 TY1PR01MB1199.jpnprd01.prod.outlook.com (10.174.226.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1250.30; Tue, 23 Oct 2018 22:28:50 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::b050:5108:7162:82a8]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::b050:5108:7162:82a8%3]) with mapi id 15.20.1250.028; Tue, 23 Oct 2018
 22:28:47 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v4 0/3] mmc: tmio_mmc: Add support for RZ/A2
Thread-Topic: [PATCH v4 0/3] mmc: tmio_mmc: Add support for RZ/A2
Thread-Index: AQHUYidFnIT1L8kmnkCCHp4iaKbxNqUs/jIAgAB472A=
Date:   Tue, 23 Oct 2018 22:28:47 +0000
Message-ID: <TY1PR01MB1562238AE99ADCB39C05C67A8AF50@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20181012122924.5543-1-chris.brandt@renesas.com>
 <CAPDyKFqNeHC7VqXsRSZegb7PGLnKBv4F4L2Rx4UtGuO7_bv-JA@mail.gmail.com>
In-Reply-To: <CAPDyKFqNeHC7VqXsRSZegb7PGLnKBv4F4L2Rx4UtGuO7_bv-JA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [167.98.65.38]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1199;20:a5gtBWlj9uYXkntbZtJ+70JOSW2G6XxIqELTp4Q9H588MVVYOWAVQCmcpYDliIC1l9RKfGHTppW+gbs2jXFcRU0epVtjS2Xduhn5YtO0BSSmm6EmuQUCeHmIfKeuRuWXlGJKatY7dR37ZgoD7AE208ELfgXHjOu78j5C9I6sr5k=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(346002)(376002)(39860400002)(366004)(396003)(136003)(199004)(189003)(69234005)(14444005)(71200400001)(7696005)(71190400001)(54906003)(229853002)(186003)(76176011)(476003)(316002)(446003)(99286004)(11346002)(106356001)(72206003)(9686003)(86362001)(107886003)(53936002)(486006)(14454004)(256004)(6246003)(4326008)(105586002)(25786009)(68736007)(6916009)(81156014)(8936002)(81166006)(33656002)(5250100002)(97736004)(8676002)(55016002)(26005)(6436002)(5660300001)(6506007)(2900100001)(53546011)(66066001)(102836004)(3846002)(6116002)(305945005)(2906002)(74316002)(7416002)(478600001)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1199;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-office365-filtering-correlation-id: b0a52f01-c024-4302-1048-08d63936e66b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1199;
x-ms-traffictypediagnostic: TY1PR01MB1199:
x-microsoft-antispam-prvs: <TY1PR01MB1199F7E16AC00BF1D7B35BA48AF50@TY1PR01MB1199.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:TY1PR01MB1199;BCL:0;PCL:0;RULEID:;SRVR:TY1PR01MB1199;
x-forefront-prvs: 0834BAF534
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: vSuAXeHWVfsvf3kgsT0Zn9CTEsqjVA2H4VMEa/azPueGdjsTZN1b3Oz065bDo2l4pcdksLRjFv8nz8hajyCmQldLCrBrbG5jMTBZW1B0FvOfWzA2y/e4HdCbMn0TNqfclzmI0gmRRXnI7vxclk9hJDSdimp+jWKqg4jCvUYZ9X4wMZoou+3VxFmFtIZ9eFBVmQA2IIL6LE8lbXw/lZHm7C+di4SuIJsNlVH1OHpN5nEpry5MGNuGlOzyqKrSuyqbT/1xHfkNWfJ9rP1vGoBu4oDWuBB9aqY0bFJ93eYGpyTEwOnCSdZuJtKky/hsNLpoZHZAtmZ4jI4186I5T0pxOzFg4dQLg1G2LmiMYxSbZos=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a52f01-c024-4302-1048-08d63936e66b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2018 22:28:47.4266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1199
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gVHVlc2RheSwgT2N0b2JlciAyMywgMjAxOCwgVWxmIEhhbnNzb24gd3JvdGU6DQo+IE9uIDEy
IE9jdG9iZXIgMjAxOCBhdCAxNDoyOSwgQ2hyaXMgQnJhbmR0IDxjaHJpcy5icmFuZHRAcmVuZXNh
cy5jb20+DQo+IHdyb3RlOg0KPiA+IEJhc2ljYWxseSB0aGUgc2FtZSBIVyBibG9jayB0aGF0IHdh
cyB1c2VkIGluIFItQ2FyIEdlbiAzIGlzIHVzZWQgaW4NCj4gPiBSWi9BMiAod2l0aCBvbmx5IGEg
Y291cGxlIHNtYWxsIGRpZmZlcmVuY2VzKS4NCj4gPg0KPiA+IE5vdCBzdXJlIGlmIHlvdSdyZSBn
b2luZyB0byBsaWtlIHRoZSBLY29uZmlnIGNoYW5nZSBvciBub3QuDQo+ID4NCj4gPiBDaHJpcyBC
cmFuZHQgKDMpOg0KPiA+ICAgY2xrOiByZW5lc2FzOiByN3M5MjEwOiBBZGQgU0RISSBjbG9ja3MN
Cj4gPiAgIG1tYzogcmVuZXNhc19zZGhpX2ludGVybmFsX2RtYWM6IEFkZCBSN1M5MjEwIHN1cHBv
cnQNCj4gPiAgIGR0LWJpbmRpbmdzOiBtbWM6IHRtaW9fbW1jOiBEb2N1bWVudCBSZW5lc2FzIFI3
UzkyMTANCj4gPg0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL3Rt
aW9fbW1jLnR4dCB8ICAzICsrLQ0KPiA+ICBkcml2ZXJzL2Nsay9yZW5lc2FzL3I3czkyMTAtY3Bn
LW1zc3IuYyAgICAgICAgICAgICB8ICA1ICsrKysNCj4gPiAgZHJpdmVycy9tbWMvaG9zdC9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKy0tDQo+ID4gIGRyaXZlcnMvbW1j
L2hvc3QvcmVuZXNhc19zZGhpX2ludGVybmFsX2RtYWMuYyAgICAgIHwgMjgNCj4gKysrKysrKysr
KysrKysrKysrKystLQ0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pDQo+ID4NCj4gPiAtLQ0KPiA+IDIuMTYuMQ0KPiANCj4gVGhpcyBsb29rcyBn
b29kIHRvIG1lLiBTbyB1bmxlc3Mgc29tZW9uZSBvYmplY3RzIEkgaW50ZW5kIHRvIHF1ZXVlDQo+
IHRoaXMgdXAgZm9yIDQuMjEsIG9uY2UgNC4yMCByYzEgaXMgb3V0LiBPciBwZXJoYXBzIHRoZSBj
bG9jayBwYXRjaA0KPiBzaG91bGQgZ28gdmlhIHRoZSBjbG9jayB0cmVlPw0KPiANCj4gVGhhbmtz
IQ0KPiBVZmZlDQoNCkZZSSwNCg0KSSBqdXN0IHRyaWVkIHRvIGFwcGx5IG15IHBhdGNoZXMgdG8g
d2hhdCBpcyBpbiAtbmV4dC4NCkl0IGxvb2tzIGxpa2VzIEZhYnJpemlvIGJlYXQgbWUgdG8gaXQg
KFJaL0cxQyBoYXMgdGhlIHNhbWUgY29udHJvbGxlciksIA0Kc28gdGhlcmUgd2lsbCBiZSBjb25m
bGljdHMgYmVjYXVzZSB3ZSB3ZXJlIGJvdGggYmUgbW9kaWZ5aW5nIHRoZSBzYW1lIA0KbGluZXMg
aW4gS2NvbmZpZyBhbmQgaW4gdGhlIGRyaXZlciAoYWRkaW5nIHRoZSBjb21wYXRpYmxlIHN0cmlu
Z3MpLg0KDQpJdCBhbHNvIGxvb2tzIGxpa2UgRmFicml6aW8gc3RhcnRlZCB1c2luZyB0aGUgbmFt
ZSANCiJyZW5lc2FzLHNkaGktbW1jLXh4eHgiIChhcyBpbiwgYWRkZWQgdGhlICctbW1jJyksIGJ1
dCBJJ2xsIHByb2JhYmx5DQpqdXN0IGtlZXAgbWluZSB0aGUgd2F5IGl0IGlzIChubyAnLW1tYycp
Lg0KDQoNClNvIGlmIHlvdSBkb24ndCBmZWVsIGxpa2UgZml4aW5nIGl0IHVwLCBsZXQgbWUga25v
dyBhbmQgSSdsbCBzZW5kIGFuIHVwZGF0ZS4NCg0KDQpDaHJpcw0KDQo=
