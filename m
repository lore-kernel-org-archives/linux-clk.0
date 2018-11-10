Return-Path: <SRS0=kVDh=NV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE94C43441
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 15:58:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3877320854
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 15:58:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="uCM/2Smq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3877320854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbeKKBnc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Nov 2018 20:43:32 -0500
Received: from mail-eopbgr50062.outbound.protection.outlook.com ([40.107.5.62]:4448
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726270AbeKKBnc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 10 Nov 2018 20:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFH2nSO+stET+ay+ZPMLNTqKMgugwTnL8wK6BKTHvGo=;
 b=uCM/2SmqKLYIGdVUb2pBlGPjiRfaYgED57f8MqrHX/zIn88GcsaIE+gMKHTIzk2DuJrKx+Ct1+S1+v8264zUMxEsru3lwwmtJJbgfg6aec/KquxK2gI6KRhFwqyty+RVKuekgkcO0Q2Qxm3iW79u1O1UAFvVBCjmiW5k2AePdyI=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4387.eurprd04.prod.outlook.com (52.135.148.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.21; Sat, 10 Nov 2018 15:58:00 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10%2]) with mapi id 15.20.1294.039; Sat, 10 Nov 2018
 15:58:00 +0000
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
Subject: RE: [PATCH V5 9/9] clk: imx: add imx8qxp clk driver
Thread-Topic: [PATCH V5 9/9] clk: imx: add imx8qxp clk driver
Thread-Index: AQHUZwMzoA17UBIsSkGVKzG2jHXioaUlRLCAgAAIYRCAACwagIAAyKWwgCMJ9LA=
Date:   Sat, 10 Nov 2018 15:58:00 +0000
Message-ID: <AM0PR04MB42115A499619B6D650C9728480C70@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539881347-20871-1-git-send-email-aisheng.dong@nxp.com>
 <1539881347-20871-10-git-send-email-aisheng.dong@nxp.com>
 <153988429912.5275.13469659599335212731@swboyd.mtv.corp.google.com>
 <AM0PR04MB42112CB1324B0994A26AB15D80F80@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <153989556955.53599.9032716427049619310@swboyd.mtv.corp.google.com>
 <AM0PR04MB42112BEEF4DB939F13D6AF1680F90@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB42112BEEF4DB939F13D6AF1680F90@AM0PR04MB4211.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4387;6:gPGN+XJkiLHdNf4CXR4SwRAVwV6eVeEMyhYPx8aXUqJaC8olY78+JiWrjfv5ph02txNOxYShbaJ2U2mjajxzfziNGQqJxxS2w7VO7SfxYP56ghyAVIhCILcgsbjgRjUxACWMrXly5NUEBS86QOe7Qg1GMbiYijGAPYZzlysVCjQ6Ca7Ae3Dm5f54OEP3uyIQl2Ff/b4dFLpkKWO0TuEFwmGKO5N3WvSdUIyssSKviIymv8xwMkWhYuI6nvugboGEVWsz0K10zMKCrP2C6COx03s4LOzbJlYptbFFCFE0Zu+a4wJPwgp8GaELn36lCpmyeOwLUYLy6+IkYGSTu8Mv/KnDPUv0parXJdT2wF8waSTJ76BfdBtvk67xYaaRhJ6e014anINniNgWeEQzdjgqsNWKYdn+4PoB3FjfbZ8XPlz0MUAaFWBWvjYg5uZQLBQlYaFQUEJctSj+Xjn4emxZ5w==;5:TfvOaLY7V3c8V+3cl21jYtpY0xFvvkdEWcCV1e2Cd0tVmzWQCB6V1DwDBu3ecRpjpou6ffalpBzOveNN6hrRTjJWAX84uwl9FIF68Fz7IZSYptmy1EJHRrAPCSWhn0U3BTNCy/Ovh9QUESCsnqYY1I6b16CMMA+8lgsIsz7UpF0=;7:V96GcyytLDFAeEWbgskD+ddZTzflpy2jE23beXbUgWPIki+aoH+FutpNgH70h/XN6Y7GXarTh7xSWU1TwkgmORbB6OwL3ez7uMoQ2bEFBtnOPzAUUAmEtulQfNJFZI8j7ZW53IC41sdlt782gUdS5w==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: a6d56ef4-2f3f-4cc5-e02d-08d647254a69
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390040)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4387;
x-ms-traffictypediagnostic: AM0PR04MB4387:
x-microsoft-antispam-prvs: <AM0PR04MB4387CC44688801A5C2EBC4F080C70@AM0PR04MB4387.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231382)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4387;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4387;
x-forefront-prvs: 0852EB6797
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(366004)(396003)(376002)(136003)(189003)(199004)(52084003)(2501003)(2906002)(93886005)(5660300001)(11346002)(86362001)(105586002)(25786009)(478600001)(71190400001)(446003)(3846002)(110136005)(6116002)(71200400001)(54906003)(14454004)(476003)(486006)(966005)(316002)(33656002)(76176011)(55016002)(4326008)(66066001)(68736007)(81156014)(81166006)(53936002)(9686003)(6306002)(102836004)(6246003)(229853002)(8676002)(305945005)(256004)(7696005)(26005)(97736004)(106356001)(8936002)(6436002)(7736002)(186003)(74316002)(2900100001)(14444005)(6506007)(99286004)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4387;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 331drHPe23vtg2YSjXZ/zaD9Xub759O3birZ6Nce6+Nzt8ZbC2EdaB+2bkBEcF8cri4hxObx3muNo+HA/YextsZPFfhrfi8EneKhjPXbZHwRzZJA6LIpp8wC1eptedQrCVKiXSaLN8RnRgKblSO+ey8btKh+KNV13h+t+GCPF3IjOP+pl4Ywi1JjQo1L5ViePn9Xa59L7WqydHAdcqpqnh2g+OUNQujffko9m4avcZk1zVIJ86DPGrPNkT0XbHLrn9foi4/hFWAVPcgWUJ4iMns8zmeSTTn3hoWLxPszhoa3CSMVoLs7x/YJCEJ2vMVNFhZ2Z8xZCZsshV5Kj4ht8FZ2HdEjXlTHBWywLHzDOdg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d56ef4-2f3f-4cc5-e02d-08d647254a69
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2018 15:58:00.6858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4387
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU3RlcGhlbiwNCg0KWy4uLl0NCj4gPiA+ID4gV2hlcmUncyB0aGUgRFQgYmluZGluZyBmb3Ig
dGhpcyBkZXZpY2U/DQo+ID4gPg0KPiA+ID4gU29ycnkgZm9yIG1pc3NlZCB0byBtZW50aW9uIHRo
aXMuDQo+ID4gPiBJdCdzIGJlZW4gbWVyZ2VkIGludG8gc2N1IGJpbmRpbmcgZG9jIHBlciBSb2In
cyByZXF1ZXN0IHdoaWNoIGhhcw0KPiA+ID4gYWxyZWFkeSBiZWVuIGluIFNoYXduJ3MgdHJlZS4N
Cj4gPiA+DQo+ID4gPiBQbGVhc2UgdGFrZSBhIGxvb2sgYXQgaGVyZToNCj4gWy4uLl0NCj4gPg0K
PiA+IE9rIEkgYXNrIGJlY2F1c2UgaXQncyBvZGQgdG8gaGFyZGNvZGUgcGh5c2ljYWwgYWRkcmVz
c2VzIGluIGEgY2xrDQo+ID4gZHJpdmVyIHdoZW4gdGhvc2Ugc2hvdWxkIGNvbWUgZnJvbSBEVCBp
biByZWcgcHJvcGVydGllcy4gV2FzIFJvYiBhd2FyZQ0KPiA+IHRoYXQgdGhpcyBjbGsgbm9kZSB3
YXMgY29tYmluaW5nIEkvTyBtZW1vcnkgYW5kIG1lc3NhZ2UgcGFzc2luZz8NCj4gDQo+IFllcywg
SSBhZ3JlZSB3aXRoIHlvdS4gVGhhdCBzZWVtcyBsaWtlIGEgc3BlY2lhbCB0byBpLk1YIGNhc2Uu
DQo+IFRoZSBwcm9ibGVtIGlzIG5vdCBhbGwgY2xvY2tzIGhhdmluZyBhIExQQ0cgZ2F0ZS4gQW5k
IHRob3NlIExQQ0dzIGFyZSBhbHNvIG5vdA0KPiBjb250aW51b3VzIGFuZCBtYXkgYmUgc2hhcmVk
IGJ5IG1hbnkgY2xvY2tzIHdoaWNoIG1ha2UgdGhpbmdzIG1vcmUNCj4gY29tcGxpY2F0ZWQuDQo+
IEknbSBub3Qgc3VyZSBwYXJzaW5nIGZyb20gZGV2aWNlIHRyZWUgY291bGQgYmUgYmV0dGVyIHdh
eSB0byBkbyBpdC4NCj4gUHJvYmFibHkgbmVlZCBodWdlIGNoYW5nZXMuDQo+IA0KDQpJIHJlb3Jn
YW5pemVkIHRoZSBkcml2ZXIgYSBsb3QgdG8gYWRkcmVzcyB0aGlzIGlzc3VlLg0KU2VlOg0KaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMDY3NzI3NS8NCldlIG5vdyBoYXZlIGEg
bmV3IExQQ0cgY2xvY2sgdHlwZSBhbmQgcmV0cmlldmUgdGhlIExQQ0cgcGh5c2ljYWwNCmFkZHJl
c3MgZnJvbSBkZXZpY2UgdHJlZS4NCg0KQmVzaWRlcyB0aGF0LCBhcyBMUENHIGlzIG1vdmVkIG91
dCBmcm9tIHRoZSBvcmlnaW5hbCBTQ1UgZ2F0ZSBjbG9ja3MsDQpXZSBoYXZlIGEgY2hhbmNlIHRv
IG1lcmdlIGFsbCB0aHJlZSB0eXBlIG9mIFNDVSBjbG9ja3MgKGRpdmlkZXIvZ2F0ZS9tdXgpDQp0
b2dldGhlciBpbnRvIGEgZ2VuZXJhbCBTQ1UgY2xvY2suIChuZXcgQVBJIGludHJvZHVjZWQgaW14
X2Nsa19zY3UoKSkuDQpUaHVzLCB0aGUgY29uc3VtZXIgZHJpdmVyIGlzIGFsc28gc2ltcGxpZWQg
YSBsb3Qgd2hpY2ggbG9va3MgYmV0dGVyIHRoYW4gYmVmb3JlLg0KSG9wZWZ1bGx5IHRoaXMgY2Fu
IG1ha2UgeW91IGhhcHB5Lg0KUGxlYXNlIGhlbHAgcmV2aWV3IHRoYXQgbmV3IHZlcnNpb24uDQoN
ClJlZ2FyZHMNCkRvbmcgQWlzaGVuZw0K
