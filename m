Return-Path: <SRS0=3SWV=NC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9D2ECDE43
	for <linux-clk@archiver.kernel.org>; Mon, 22 Oct 2018 01:34:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 027CC2083E
	for <linux-clk@archiver.kernel.org>; Mon, 22 Oct 2018 01:34:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="bf4dEkX1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 027CC2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbeJVJvH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Oct 2018 05:51:07 -0400
Received: from mail-eopbgr10065.outbound.protection.outlook.com ([40.107.1.65]:43296
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725884AbeJVJvH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Oct 2018 05:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muj1aecMYMEWE+lU2h4dC+PhyhvdvoBhb7yf8dJbvdY=;
 b=bf4dEkX1d/TakoYpTWN2LyZWbKGB+bGcZthsrUWjOhxZDo5Nk46MXEb6my4Oz8Pk88YItjLGiuPj25scHeLSEugo3JDrsJWSHjBh8W9uMwqQeooSnCr68dmG2IldDylg/Bnrb8NQxJiWgJCItr1mF2qC74lvEZeVd2bMWxbewnw=
Received: from DB5PR0401MB2213.eurprd04.prod.outlook.com (10.166.173.8) by
 DB5PR0401MB1941.eurprd04.prod.outlook.com (10.166.10.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1250.30; Mon, 22 Oct 2018 01:34:42 +0000
Received: from DB5PR0401MB2213.eurprd04.prod.outlook.com
 ([fe80::24b9:d390:896d:12f7]) by DB5PR0401MB2213.eurprd04.prod.outlook.com
 ([fe80::24b9:d390:896d:12f7%3]) with mapi id 15.20.1250.028; Mon, 22 Oct 2018
 01:34:42 +0000
From:   Andy Tang <andy.tang@nxp.com>
To:     Scott Wood <oss@buserror.net>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
CC:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 2/3] powerpc: t102x: upgrade the legacy clock node
Thread-Topic: [PATCH 2/3] powerpc: t102x: upgrade the legacy clock node
Thread-Index: AQHUT+xZH3kPzESPnESoP3hZgQQ+vqUpAHwAgAGkwfA=
Date:   Mon, 22 Oct 2018 01:34:41 +0000
Message-ID: <DB5PR0401MB2213DC3FA17E6B8E42258EDFF3F40@DB5PR0401MB2213.eurprd04.prod.outlook.com>
References: <20180919073906.34187-1-andy.tang@nxp.com>
         <20180919073906.34187-2-andy.tang@nxp.com>
 <bb158670f1556156f17c3a9eefaa0a5e35c1591e.camel@buserror.net>
In-Reply-To: <bb158670f1556156f17c3a9eefaa0a5e35c1591e.camel@buserror.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=andy.tang@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;DB5PR0401MB1941;6:3LdrHB7lbtRCHeJfjLdELy5D6XWB3fZJ544PB1vu+Y4n88tUbDpR8QA3wOoDIRyO/HlMFJwlpY5DYcBCb1YY2y16kI5R6tTWlhjYAUL+8OcVKjU1eGNkMeYOYDJsl4fYdFW9n5Kb4GINMG7135q+gsCDtUBN6+jhDZJrN85ulZ9VtYCu8AyRwNTqC1vzF4UTH3iQeTYGtN7lLP1Tbx4LZbBo3h/agXlHVbov8urHIaXLbYk0kX4z9d5lzqy/Rb2Nmt0MhrYjODVoklqyOlxzFSrqVswH3SHTuWLQd8U9pQuclRjGzSsfr7UlzahofB1BRcP98VJEAcETdT/zHUapmWAKMJBw0WzF18SlfatFukKB+IlHe8Rm1kLcUcbTkbbW066+ocH57l3eAq/Np434haIX0/s3TsGh+hU7npQx1BWRcLjuw469tEfTv77wW9BLbYt0oxSIuHkux+7TuiYUrQ==;5:bOapXw99e6ylT431HOwAjvG/OCUQtYKt5o/b8ohYRUQwrqqPZJaMdLEkyismUQjPVDinj1iw4OU7v1Y31JLlbeqVQydUe16QxiMAAWkjLi8fqDNe/7x07fUjHYk0CEpj1SPY3vjxQoPmxmCUSVzhy6O5DrOkTqmWLBP8V5yc90g=;7:d1fFOzbNFEGvyHcjT8gBaHVzb07U/4bZE0KKDscNYzxlH7MKiO/oWWRGXNnNV7oNNEo97GZ6JvmQXOHk1tJhPZlnICAgmLEXo2vfC9skgcplSECywWhSVr4V07vHX6bH4sL6J90LLQxufmnTgYmfMoxbu2YKeo6DNGJEkOTxMtK9VGcvqU7OkcOYuomyYJMw43xXGo5QJTN2bU21f/15JH4MVzkRuSSihq9t1DkZD63T3hinFi5BIAxigwda5g3D
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 2904fe13-c458-4e37-1e23-08d637be8a1e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:DB5PR0401MB1941;
x-ms-traffictypediagnostic: DB5PR0401MB1941:
x-microsoft-antispam-prvs: <DB5PR0401MB19417D55D2C1369C6105C055F3F40@DB5PR0401MB1941.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(9452136761055)(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231355)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:DB5PR0401MB1941;BCL:0;PCL:0;RULEID:;SRVR:DB5PR0401MB1941;
x-forefront-prvs: 08331F819E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(376002)(396003)(346002)(199004)(189003)(13464003)(8676002)(3846002)(6116002)(81166006)(476003)(11346002)(446003)(106356001)(186003)(33656002)(105586002)(7696005)(6506007)(97736004)(102836004)(5250100002)(2501003)(53546011)(26005)(110136005)(316002)(54906003)(486006)(44832011)(76176011)(99286004)(14454004)(74316002)(53936002)(6436002)(6246003)(55016002)(9686003)(14444005)(256004)(305945005)(7736002)(2900100001)(86362001)(229853002)(4326008)(25786009)(5660300001)(8936002)(66066001)(2906002)(478600001)(81156014)(68736007)(71190400001)(71200400001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB5PR0401MB1941;H:DB5PR0401MB2213.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 7DPVLDhB49lRhhHjGzcPU38plkeIUV4ih7kWfgo1/HSq6/I4l4ZcIKrIE3Wp7YonsRLAn9+dWbtWtE7ZtFhi+DrYWVaxWzra0lc1QXImy20k1xtoNvKzhKLquYngSoCI+1XtUvzK2MxF8v8fG77yl5mLWCSJdXgZk0SQ2umFBUHQ/0ExjEC8GUWOmimcYIhFsG5szZ879WBCJRu+9bEthXBtJruWrra4JFlsQSDD3Xqn4G5lXl3DzNISoa3X5M8L4ZetEOPp9FfriQiNHhQqQ2d+1dAtd7Ba7NkWY6byTHb56thRYm51I51mKk6TTffAtj/j1pp9yUGbnHe/NzTHXkeO5W2gxBBhRfuo1I+TrWc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2904fe13-c458-4e37-1e23-08d637be8a1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2018 01:34:41.9109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR0401MB1941
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU2NvdHQsDQoNClBsZWFzZSBzZWUgbXkgcmVwbHkgaW5saW5lLg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNjb3R0IFdvb2QgPG9zc0BidXNlcnJvci5uZXQ+DQo+
IFNlbnQ6IDIwMTjlubQxMOaciDIx5pelIDc6NTQNCj4gVG86IEFuZHkgVGFuZyA8YW5keS50YW5n
QG54cC5jb20+OyBtdHVycXVldHRlQGJheWxpYnJlLmNvbQ0KPiBDYzogc2JveWRAa2VybmVsLm9y
Zzsgcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsNCj4gbGludXgtY2xr
QHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAyLzNdIHBvd2VycGM6IHQxMDJ4OiB1cGdyYWRlIHRoZSBsZWdhY3kgY2xvY2sg
bm9kZQ0KPiANCj4gT24gV2VkLCAyMDE4LTA5LTE5IGF0IDE1OjM5ICswODAwLCBhbmR5LnRhbmdA
bnhwLmNvbSB3cm90ZToNCj4gPiArY2xvY2tnZW46IGdsb2JhbC11dGlsaXRpZXNAZTEwMDAgew0K
PiA+ICsJY29tcGF0aWJsZSA9ICJmc2wscW9yaXEtY2xvY2tnZW4iOw0KPiANCj4gV2hlcmUgZG9l
cyB0aGlzIGNvbXBhdGlibGUgc3RyaW5nIGNvbWUgZnJvbT8NCj4gDQo+ID4gKwkJY29tcGF0aWJs
ZSA9ICJmc2wsdDEwMjMtY2xvY2tnZW4iOw0KPiA+ICAJfTsNCj4gDQo+IEFuZCBoZXJlIHlvdSBv
dmVyd3JpdGUgaXQgd2l0aCBvbmx5IHRoZSBjaGlwLXNwZWNpZmljIGNvbXBhdGlibGU/DQo+IA0K
PiBJcyB0MTAyMyBpbmNvbXBhdGlibGUgd2l0aCBib3RoIGZzbCxxb3JpcS1jbG9ja2dlbi0xLjAg
YW5kDQo+IGZzbCxxb3JpcS1jbG9ja2dlbi0gMi4wPyAgVGhlIGV4aXN0aW5nIGR0cyBzYXlzIDIu
MDsgaXMgdGhhdCB3cm9uZz8NCj4gDQo+IEJUVywgYXNzdW1pbmcgaXQgaXMgMi4wIGNvbXBhdGli
bGUgYW5kIHRodXMgdGhlIHVzZSBvZg0KPiBxb3JpcS1jbG9ja2dlbjIuZHRzaSBpcyBjb3JyZWN0
LCB0aGUgYmVzdCBjb3Vyc2Ugb2YgYWN0aW9uIGlzIHByb2JhYmx5IHRvIHRvDQo+IHJlbW92ZSB0
aGUgbGVnYWN5IHN0dWZmIGZyb20gYWxsIGZzbCBjaGlwcywgcmF0aGVyIHRoYW4gaW50cm9kdWNl
IGEgbmV3IGR0c2kuDQo+IEluIGZhY3QgaXQnZCBiZSBuaWNlIHRvIHNlZSBpdCBhbGwgcmVtb3Zl
ZCBpbiBhbnkgY2FzZS4gOi0pDQpxb3JpcS1jbG9ja2dlbiouZHRzaSBhcmUgdXNlZCBieSBsZWdh
Y3kgYmluZGluZ3MuIFRoZSBjb250ZW50cyBhcmUgYWxsIG9mIGxlZ2FjeSBiaW5kaW5ncy4NClRv
IHVzZSBuZXcgZnJhbWV3b3JrLCBJIGludHJvZHVjZSBhIG5ldyBkdHNpIHdoaWNoIGNvbnRhaW5z
IG5ldyBiaW5kaW5ncyBhbmQgdXNlZCBmb3IgYWxsIFBQQyBzb2MuDQpBIGNoaXAtc3BlY2lmaWMg
Y29tcGF0aWJsZSBpcyBuZWVkZWQgYmVjYXVzZSBkcml2ZXIgd2lsbCB1c2UgaXQgdG8gZ2V0IGNo
aXAtc3BlY2lmaWMgY2xvY2sgdHJlZSBpbmZvcm1hdGlvbi4NClRoZSBjbG9jayBpbmZvcm1hdGlv
biB3YXMgZGVmaW5lZCBpbiBkcml2ZXIgbm90IGluIGR0cyBpbiBuZXcgZnJhbWV3b3JrLCByZW1l
bWJlcj8NCg0KVGhpcyBwYXRjaCBzZXQgaXMgdGhlIGZpcnN0IHN0ZXAgdG8gY29udmVydCBpdCB0
byB1c2luZyBuZXcgZnJhbWV3b3JrLiBBZnRlciBhbGwgdGhlIGNoaXBzIGhhdmUgYmVlbiB1cGRh
dGVkLA0KdGhlIGxlZ2FjeSBzdHVmZiB3aWxsIGJlIHJlbW92ZWQuIEluY2x1ZGluZyBxb3JpcS1j
bG9ja2dlbiouZHRzaS4NCj4gDQo+IEFsc28sIHBsZWFzZSBwb3N0IGFueSBwYXRjaGVzIHRoYXQg
eW91IHdhbnQgbWUgdG8gYXBwbHkgdG8gdGhlDQo+IGxpbnV4cHBjLWRldiBtYWlsaW5nIGxpc3Qu
DQpTdXJlLCBubyBwcm9ibGVtLg0KDQpCUiwNCkFuZHkNCj4gDQo+IC1TY290dA0KDQo=
