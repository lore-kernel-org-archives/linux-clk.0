Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980B9ECDE3D
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 02:35:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C6772054F
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 02:35:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="OG3BwpKN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C6772054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbeJRKeT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Oct 2018 06:34:19 -0400
Received: from mail-he1eur01on0043.outbound.protection.outlook.com ([104.47.0.43]:6385
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727393AbeJRKeT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Oct 2018 06:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PL0fwauTmBjS0VZhe553d/OVW4PwAnucBBTTJ0yjM7I=;
 b=OG3BwpKNuR9CTbsZKrAdHhE+Hm07XdX12E40h2OlCHwzUP4vz8B9No0jVAfgBM0w9amLskUlQPofuzIcubDwLxGPbKNkO84xghJjsw3WGYJjWhP3HW53Aolc4Rhq7mFeZ1Xh0G0FenIJ5o6GJWb51Zh0LSqp+nCKomqyrFyrvz4=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4803.eurprd04.prod.outlook.com (20.176.215.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1250.20; Thu, 18 Oct 2018 02:35:34 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.033; Thu, 18 Oct 2018
 02:35:34 +0000
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
Subject: RE: [PATCH V4 03/11] clk: imx: scu: add scu clock divider
Thread-Topic: [PATCH V4 03/11] clk: imx: scu: add scu clock divider
Thread-Index: AQHUY5T/CGJq5NUmM068EllqdgynW6UiZpyAgACpCoCAAIIcgIAAAzxQgAAKZICAAK+PYA==
Date:   Thu, 18 Oct 2018 02:35:34 +0000
Message-ID: <AM0PR04MB4211A124CF43AF4291BA688780F80@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-4-git-send-email-aisheng.dong@nxp.com>
 <153972518358.5275.8551722631185725008@swboyd.mtv.corp.google.com>
 <AM0PR04MB42111D180BE6D7557F71D15380FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <153978942538.5275.15892434593141965554@swboyd.mtv.corp.google.com>
 <AM0PR04MB42114436952826801D15BA3E80FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <153979235107.5275.17099119584473464472@swboyd.mtv.corp.google.com>
In-Reply-To: <153979235107.5275.17099119584473464472@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4803;6:MVAMQ1nbBM7z83nGPnMBGaK8avIWAV78rSJlqpKBdwXchath7ycTu8F5Y+zcWNA7W/a1DxLpOoWBXQm4+QetI8r03aGk+wzm1iG8aX2lziYhTiSYKCi/i9zGNN9Pb47qPZRp/I4NZUeqadHcAbYZNSS/ugGWtNufoRg47DyWeFdhP8K7EZulVOB/k9PBlHc/LVv5bvVglkHE4euRIubPXh9MzfaDTcEkgbipDcIX9FtL4fnOKrpfYQjO8QQYL08immK23M8ZN3jOW290hwyIQbhoF5X1w+xFlmjKsYddv42/nT0+v15kryxoI6qSNUk6hQL102EMSnE3AtTmqLicUclWtB+7iqnO+q7IFe06YA3+6PtwapMvu9jcDpR2s+jLFPgHwsu2/GRdGgxtwvr4S9mXviLoEhKnyczCGFjNx3C5QfUZ0v8E64kdyZIqdnApolUfWTyzKLFB3NeYPvTb0w==;5:jcMrHadfZnPpuRHUEkjpSZ4SUXzRMLWrP+wClQlPh7dcOWhoXDo/dbPrwLXRT9jdPU3I8Zf5LN4HsMOvYGc4fO3Rlrz0pFcKH9qsvTjCocH3jbNgd56UjDCLIyzsN72kxFyyqNXIKZCvkGelt0tnq2Cg7s5ZhvAPCT7wIPTdoKI=;7:xHnYJWspee+pREKsfJ8GTppeAie9Al2E818UkmbulYD+gnBdpz7EHUJl9jDu7XEms5AS4wc59qpx4vYto5kTIlAngr3gSy/BbhrDn6+900CsYVwq9UpBYRzVcbOvmahbwP0TI82KdGPDldlq6Pvy/CBj9L/xJj80Udp1QdODdvXHV9ia4OWghxFyV8WDFoL5aFmarTa9OBx8CCn3Rwvom3mNo5oYa0QlRdAUx5fE/FvuSZlnbm40bMS1Rne39M8n
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 3a49e987-a920-410f-4f64-08d634a261a6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4803;
x-ms-traffictypediagnostic: AM0PR04MB4803:
x-microsoft-antispam-prvs: <AM0PR04MB4803F3AE675833FFDDD3A73880F80@AM0PR04MB4803.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(944501410)(52105095)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4803;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4803;
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(396003)(376002)(346002)(136003)(13464003)(189003)(199004)(51914003)(54094003)(5250100002)(25786009)(14454004)(4326008)(7736002)(305945005)(508600001)(74316002)(66066001)(2900100001)(33656002)(97736004)(4001150100001)(256004)(106356001)(105586002)(2501003)(71190400001)(486006)(86362001)(5660300001)(446003)(76176011)(186003)(102836004)(6436002)(26005)(11346002)(71200400001)(6506007)(476003)(68736007)(81156014)(110136005)(99286004)(81166006)(8676002)(55016002)(229853002)(7696005)(316002)(3846002)(8936002)(6116002)(2906002)(6246003)(53936002)(93886005)(9686003)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4803;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 58ti3YdUFXSLDjCNZ1g0f/v8MZlrmQsIdY6JDn5fw4lVv9qaRKKU/od5XZf6hVUIp9wvQv2slbEr5wFetWKDcul3UsOkvOi0jkQ1X7GXHJN7KZB1adpJTIDzRr8NflZKJRZaVEYXYHqxZVI+cJVib/f6MoQdYP6ZJhOtWiCwvyYp1OgoQ/4lg2Rfl7fMAhUtYk9LcLIUImAhQMaGWloexvj4I8lhLJJq0cabDoBFzhrXCcTp0BWdDmxnMXXl40N0x/4FPtlXy/YTaJbwH8IOaodwyvwajiRZWEmpMhzxuTvtIDZyR/HFtGnMZcMtvNVKfiyIKValXbAU4xQSIXPUy51JoZ78uqTTBLMWMwLz8KQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a49e987-a920-410f-4f64-08d634a261a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 02:35:34.6148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4803
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAxOCwgMjAxOCAx
MjowNiBBTQ0KPiBRdW90aW5nIEEucy4gRG9uZyAoMjAxOC0xMC0xNyAwODo0NTowNSkNCj4gPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBTdGVwaGVuIEJveWQgW21h
aWx0bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiA+ID4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDE3
LCAyMDE4IDExOjE3IFBNIFF1b3RpbmcgQS5zLiBEb25nDQo+ID4gPiAoMjAxOC0xMC0xNyAwMTo1
NjozNSkNCj4gPiA+ID4gPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0bzpzYm95ZEBrZXJuZWwu
b3JnXQ0KPiA+ID4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAxNywgMjAxOCA1OjI2IEFN
IFF1b3RpbmcgQS5zLiBEb25nDQo+ID4gPiA+ID4gKDIwMTgtMTAtMTQgMDE6MDc6NDkpDQo+ID4g
PiA+DQo+ID4gPiA+IEhvdyBhYm91dCBkbyBzb21ldGhpbmcgbGlrZSBiZWxvdz8NCj4gPiA+ID4g
c3RydWN0IHJlcV9nZXRfY2xvY2tfcmF0ZSB7DQo+ID4gPiA+ICAgICAgICAgdTE2IHJlc291cmNl
Ow0KPiA+ID4gPiAgICAgICAgIHU4IGNsazsNCj4gPiA+ID4gfSBfX3BhY2tlZDsNCj4gPiA+ID4N
Cj4gPiA+ID4gc3RydWN0IHJlc3BfZ2V0X2Nsb2NrX3JhdGUgew0KPiA+ID4gPiAgICAgICAgIHUz
MiByYXRlOw0KPiA+ID4gPiB9IF9fcGFja2VkOw0KPiA+ID4NCj4gPiA+IFRoaXMgZG9lc24ndCBu
ZWVkIF9fcGFja2VkIGJlY2F1c2UgaXQncyBhIHNpbmdsZSB1MzIuDQo+ID4gPg0KPiA+DQo+ID4g
SXQncyBhIHNhZmUgd3JpdGluZywgYnV0IHllcywgY2FuIGJlIHJlbW92ZWQuDQo+ID4NCj4gPiA+
ID4NCj4gPiA+ID4gc3RydWN0IGlteF9zY19tc2dfZ2V0X2Nsb2NrX3JhdGUgew0KPiA+ID4gPiAg
ICAgICAgIHN0cnVjdCBpbXhfc2NfcnBjX21zZyBoZHI7DQo+ID4gPiA+ICAgICAgICAgdW5pb24g
ew0KPiA+ID4gPiAgICAgICAgICAgICAgICAgc3RydWN0IHJlcV9nZXRfY2xvY2tfcmF0ZSByZXE7
DQo+ID4gPiA+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgcmVzcF9nZXRfY2xvY2tfcmF0ZSByZXNw
Ow0KPiA+ID4gPiAgICAgICAgIH0gZGF0YTsNCj4gPiA+ID4gfSBfX3BhY2tlZDsNCj4gPiA+ID4N
Cj4gPiA+DQo+ID4gPiBZZXMgc29tZXRoaW5nIGxpa2UgdGhpcyB3b3VsZCBiZSBiZXN0LiBBbmQg
bm93IEkgd29uZGVyIGlmDQo+ID4gPiBpbXhfc2N1X2NhbGxfcnBjKCkgaXMgZG9pbmcgZW5kaWFu
bmVzcyBzd2FwcGluZz8gT3IgZG9lcyBpdCBjb3B5DQo+ID4gPiBkYXRhIGludG8gdGhlc2UgcmVz
cG9uc2Ugc3RydWN0dXJlcz8gSSdtIHNheWluZyB0aGF0IHRoZSB1MzIvMTYvOA0KPiA+ID4gbWF5
IG5lZWQgdG8gYmUNCj4gPiA+IF9fbGUzMi8xNi84IGFuZCB0aGVuIGhhdmUgdGhlIHByb3BlciBh
Y2Nlc3NvcnMuDQo+ID4gPg0KPiA+DQo+ID4gTm8gZW5kaWFubmVzcyBzd2FwcGluZy4gSXQncyBm
aXhlZCBsaXR0bGUgZW5kaWFuLg0KPiA+IFNDVSBwcm90b2NvbCBpc24ndCBhd2FyZSBvZiB0aGVz
ZSBzdHJ1Y3R1cmVzLiBUaGUgc3RydWN0dXJlcyBhcmUNCj4gPiBkZWZpbmVkIGFjY29yZGluZyB0
byBTQ1UgcHJvdG9jb2wgZGVmaW5pdGlvbiB0byBtYWtlIHN1cmUgZWFjaCBmaWVsZA0KPiA+IHBv
c2l0aW9uIGFuZCBzaXplIGFyZSBjb3JyZWN0LiBUaGVuIFNDVSBJUEMgZHJpdmVyIGp1c3Qgc2Vu
ZCBhbmQgcmVjZWl2ZSB0aGVtDQo+IHNlcXVlbnRpYWxseS4NCj4gPiBDbGllbnQgZHJpdmVyIHVz
ZXMgdGhlIHN0cnVjdHVyZXMgdG8gcmV0cmlldmUgdGhlIHJlc3BvbmRpbmcgZmlsZWQgdmFsdWVz
Lg0KPiA+DQo+ID4gV2UgZG8gdGhpcyBsaWtlIGRyaXZlcnMvZmlybXdhcmUvdGlfc2NpLmggRG8g
eW91IHRoaW5rIHdlIHN0aWxsIG5lZWQNCj4gPiBzcGVjaWZ5IF9fbGUzMi8xNi84IGZvciB0aGlz
IGNhc2U/DQo+IA0KPiBQcm9iYWJseSwgYmVjYXVzZSB0aGUgQ1BVIGluIGxpbnV4IGNvdWxkIGJl
IGJpZyBlbmRpYW4gb3IgbGl0dGxlIGVuZGlhbi4NCj4gSXQgZG9lc24ndCBodXJ0IHRvIGRvIGl0
IHJpZ2h0IHRvIGJlZ2luIHdpdGggYW5kIHRoZW4geW91IGdldCB0aGUgc3VwcG9ydCBmb3IgZnJl
ZQ0KPiBpZiBpdCdzIGV2ZXIgdXNlZCBsYXRlciBvbi4NCj4gDQoNCkFsbCByaWdodCBmb3IgbWUu
IFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uDQoNClJlZ2FyZHMNCkRvbmcgQWlzaGVuZw0K
