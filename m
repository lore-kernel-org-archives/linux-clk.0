Return-Path: <SRS0=4aIB=NZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7BEC43441
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 07:47:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35A2721780
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 07:47:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="ARPSyq0v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35A2721780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbeKNRty (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Nov 2018 12:49:54 -0500
Received: from mail-eopbgr790041.outbound.protection.outlook.com ([40.107.79.41]:60590
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726927AbeKNRty (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Nov 2018 12:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFB59grMU8U3XcKQjoI4+1rT10PvZrht0CxnKQ6TZn0=;
 b=ARPSyq0vjiF2gCmdP244tuzwaxBuSJOBGcWfXZPpbcxgPkO5f6wXSE1nBoaFdzCyFCRyFCdht3UYwMY2S5XXbkI+hnXcocN82q5HarGIyEcO7mpLsTa43yy0fXRWOIEkzbt368tZgGYYubyT4md5ozVsTFelcaGYEMGfqDY/LzI=
Received: from BYAPR02MB4055.namprd02.prod.outlook.com (20.176.248.159) by
 BYAPR02MB5656.namprd02.prod.outlook.com (20.177.230.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.30; Wed, 14 Nov 2018 07:47:46 +0000
Received: from BYAPR02MB4055.namprd02.prod.outlook.com
 ([fe80::8551:a7c9:de28:bbb5]) by BYAPR02MB4055.namprd02.prod.outlook.com
 ([fe80::8551:a7c9:de28:bbb5%3]) with mapi id 15.20.1294.045; Wed, 14 Nov 2018
 07:47:44 +0000
From:   Rajan Vaja <RAJANV@xilinx.com>
To:     Michal Simek <michals@xilinx.com>, Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "olof@lixom.net" <olof@lixom.net>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>
CC:     Jolly Shah <JOLLYS@xilinx.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] clk: zynqmp: handle fixed factor param query error
Thread-Topic: [PATCH] clk: zynqmp: handle fixed factor param query error
Thread-Index: AQHUZe2pxHu0vfBaCUKWhU3u4y0HtKUjjnAAgB1a0oCADidG0A==
Date:   Wed, 14 Nov 2018 07:47:44 +0000
Message-ID: <BYAPR02MB40555A10B3551DB5C29E9B7FB7C30@BYAPR02MB4055.namprd02.prod.outlook.com>
References: <1539762392-12512-1-git-send-email-rajan.vaja@xilinx.com>
 <153978972088.5275.4505414322881956934@swboyd.mtv.corp.google.com>
 <26e50d25-a02b-5ece-d12d-8c6ee208a845@xilinx.com>
In-Reply-To: <26e50d25-a02b-5ece-d12d-8c6ee208a845@xilinx.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.260.4
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=RAJANV@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;BYAPR02MB5656;6:gvgG84SAzm2DZ2u64xMwpubIZ8YKe1M5H2JotKZ/un5y6q28sFyRZ4K38uAqOv8T+yfv/8PNLAzVxFYOGHy4E8UefIM0T7+JRdqALmbUR/qngFylTOSkuYJbvBsX4p6YA7sg4hUikKtIxEc8NSPfgHuFM6tXqIW+A3BBlqNK1u5ngTrp0StilSSOpWiehNCYeBz+YfxCEM2+fU+HbXQ63Jn3n3myb3TbFuYsfAhyaWPHbI3XImKdc9hsIILvP7Bg6AbniXrjrhdySDhSPOxFr7d+UG7sKPb5CxB9Li9FsaiQ+Y0QE+LcobbPpo2Tzv+nghjUGJeepeo1ySoBQcicgf8QNusyYf0U+ksQqK+x44N2GV79YdnTtQbzhv1yYVNo992IYeEiyIYYMT+1nqrhAsT5Giu5ldljtEDCoS/UjbPSjeoqFVhk9IYi9MoggTnS3MpAjtEzLWQb0OxPH8ICpg==;5:vsru0QknqFPo/pjstBRhwUU6ZMnGt0aCEsnSRlqhuXKwp4AQ9jqffAKORx0kMKCejZhAqAb/z+NP8paYbVTAvv311Qsr6+wlcZfamsKuWq8j3yEV5lyIlB0sTU+Odn5r9l44oHaYB7ha/6pckTQiFSrXuES1Z0MNb9AWPuE37r4=;7:dqYzHGq4B7F9pqjm7OtpFeUV1z4m3wzf2zQRL3QkyIBEM4k6MzQ4Y6NnEFVQI6XLAy92z62cGY7XZclHXx2/4Udrzc9eX+JzWGXjv+QgYbH4lzSH9zsPXB2gvbuHHdQulzeSYHEVeZex+MmdDcphhA==
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10009020)(346002)(396003)(39860400002)(366004)(376002)(136003)(189003)(13464003)(199004)(53936002)(186003)(26005)(33656002)(486006)(9686003)(6246003)(71190400001)(105586002)(476003)(106356001)(71200400001)(11346002)(76176011)(446003)(7696005)(478600001)(4326008)(74316002)(6636002)(2900100001)(3846002)(6116002)(6506007)(102836004)(54906003)(25786009)(316002)(110136005)(53546011)(14444005)(68736007)(6436002)(99286004)(2501003)(66066001)(4001150100001)(81166006)(81156014)(55016002)(8936002)(8676002)(97736004)(305945005)(72206003)(7736002)(14454004)(229853002)(2906002)(5660300001)(2201001)(256004)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB5656;H:BYAPR02MB4055.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-office365-filtering-correlation-id: 0afeb660-ece2-4071-2fa6-08d64a0576e7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:BYAPR02MB5656;
x-ms-traffictypediagnostic: BYAPR02MB5656:
x-microsoft-antispam-prvs: <BYAPR02MB5656B3A249B2CD705543D74EB7C30@BYAPR02MB5656.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(192813158149592)(9452136761055)(258649278758335);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231382)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:BYAPR02MB5656;BCL:0;PCL:0;RULEID:;SRVR:BYAPR02MB5656;
x-forefront-prvs: 085634EFF4
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: z5/1UfvIgHTiwNWR06KtiBkIpKpS/2hhPXonXnxmEc/MpSKfCzrKOhpCKTcrzKNcyI/gLGAkPBW6ekLS/0FOVKeOwNuAYRksZObW2mUKwkMVYn+1qO71VkZk8opNCMX9O/57WtEGY3Dnk9u1kEr/FtuZ/Lus+KzBCeT/wYb1leQ9kvKeNC+XChNFevaFLJAwPOElHW3vCQhs8yuwsAhG4ZTUuMvKYj/BVvH0VFswKKGbDfPeMPIMR9/sCSortaJA/TjwY9tuxKciTHotPrvE0d6+gDQwOL88SAwejdFbPaYH7dKi0tBrlyfh8Ck+Rlr0mxkKQPBjQjivhpKOrS0RuB0puU4rVa/iYEwImYxVuN8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afeb660-ece2-4071-2fa6-08d64a0576e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2018 07:47:44.8637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5656
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgTWljaGFsLCBTdGVwaGVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IE1pY2hhbCBTaW1layBbbWFpbHRvOm1pY2hhbC5zaW1la0B4aWxpbnguY29tXQ0KPiBTZW50
OiAwNSBOb3ZlbWJlciAyMDE4IDAxOjA5IFBNDQo+IFRvOiBTdGVwaGVuIEJveWQgPHNib3lkQGtl
cm5lbC5vcmc+OyBSYWphbiBWYWphIDxSQUpBTlZAeGlsaW54LmNvbT47IE1pY2hhbA0KPiBTaW1l
ayA8bWljaGFsc0B4aWxpbnguY29tPjsgbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207IG9sb2ZAbGl4
b20ubmV0Ow0KPiBTaHViaHJhanlvdGkgRGF0dGEgPHNodWJocmFqQHhpbGlueC5jb20+DQo+IENj
OiBKb2xseSBTaGFoIDxKT0xMWVNAeGlsaW54LmNvbT47IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWFybS0NCj4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gY2xrOiB6eW5xbXA6IGhhbmRsZSBmaXhlZCBmYWN0b3IgcGFyYW0gcXVlcnkg
ZXJyb3INCj4gDQo+IE9uIDE3LiAxMC4gMTggMTc6MjIsIFN0ZXBoZW4gQm95ZCB3cm90ZToNCj4g
PiBRdW90aW5nIFJhamFuIFZhamEgKDIwMTgtMTAtMTcgMDA6NDY6MzIpDQo+ID4+IFJldHVybiBw
cm9wZXIgZXJyb3IgY29kZSBpbiBjYXNlIHF1ZXJ5IGZvciBmaXhlZCBmYWN0b3INCj4gPj4gcGFy
YW1ldGVyIGZhaWxzLiBUaGlzIGFsc28gZml4ZXMgYnVpbGQgd2FybmluZyBmb3Igc2V0DQo+ID4+
IGJ1dCBub3QgdXNlZCB2YXJpYWJsZSAncmV0Jy4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTog
UmFqYW4gVmFqYSA8cmFqYW4udmFqYUB4aWxpbnguY29tPg0KPiA+DQo+ID4gRml4ZXMgdGFnPyBB
bmQgSSB0aGluayB0aGlzIGlzIGdvaW5nIHRocm91Z2ggYXJtLXNvYyBhbHJlYWR5PyBJZiBzbywN
Cj4gPg0KPiA+IEFja2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+ID4N
Cj4gPiB3aXRoIHRoZSBhcHByb3ByaWF0ZSBmaXhlcyB0YWcgYWRkZWQuDQo+IA0KPiBJdCB3YXMg
cmVhbGx5IGp1c3QgYWJvdXQgdG8gbWVyZ2UgdGhpcyB2aWEgYXJtLXNvYyB0cmVlIGJlY2F1c2Ug
b2YNCj4gZGVwZW5kZW5jeSBvbiBmaXJtd2FyZSBpdHNlbGYuDQo+IEl0IGlzIHRoZSBwYXJ0IG9m
IHY0LjIwLXJjMSBub3cgYW5kIGl0IGNhbiBnbyB2aWEgeW91ciB0cmVlLg0KPiANCj4gQW55d2F5
IHYyIGlzIHJlcXVpcmVkIHdpdGggRml4ZWQgdGFnIGFueXdheS4NCj4gUmFqYW46IFBsZWFzZSBz
ZW5kIGl0IHYyIHdpdGggQWNrZWQgYWJvdmUuDQpbUmFqYW5dIEkgaGF2ZSBzdWJtaXR0ZWQgdjIg
d2l0aCBGaXhlcyB0YWcgYW5kIEFjay4NCg0KPiANCj4gVGhhbmtzLA0KPiBNaWNoYWwNCg==
