Return-Path: <SRS0=15nu=OP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA577C04EBF
	for <linux-clk@archiver.kernel.org>; Thu,  6 Dec 2018 00:42:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C46F20878
	for <linux-clk@archiver.kernel.org>; Thu,  6 Dec 2018 00:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="SL9FaY4p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C46F20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbeLFAmB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Dec 2018 19:42:01 -0500
Received: from mail-eopbgr140082.outbound.protection.outlook.com ([40.107.14.82]:55078
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728668AbeLFAmA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 5 Dec 2018 19:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrKfXeWBrKUYKfnRRJKT45YFYPFUWDQ93o5BtCwDp/s=;
 b=SL9FaY4p0Ip22AoAzM+fgiIpWWah2RqgNmJZauUkKQejSRpWZNyiFe7pr8eMqK2j1Hhxt47zCXqmAoJJaZ9yN5A5bdXwiiHRZhFhrcZ1AoZ4ATGFFqFZ7TPYLYed3Fn1o2Xj31PWW+b3XB3bn+eaenpOY3/UHD9L+t/T1OAKTI0=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4004.eurprd04.prod.outlook.com (52.134.90.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.17; Thu, 6 Dec 2018 00:41:56 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.020; Thu, 6 Dec 2018
 00:41:56 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V8 2/7] clk: imx: add scu clock common part
Thread-Topic: [PATCH V8 2/7] clk: imx: add scu clock common part
Thread-Index: AQHUgaQ57574XhcTGkWdT/7YvWkhRqVtaiMAgABvc/CAAsiUAIAAUjsQ
Date:   Thu, 6 Dec 2018 00:41:56 +0000
Message-ID: <AM0PR04MB421147539902242C56E52BA880A90@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
 <1542809234-539-3-git-send-email-aisheng.dong@nxp.com>
 <154386202048.88331.5253991483966563852@swboyd.mtv.corp.google.com>
 <AM0PR04MB4211FE93C147DB95181E8CBE80AF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <154403897845.88331.2924678136478578037@swboyd.mtv.corp.google.com>
In-Reply-To: <154403897845.88331.2924678136478578037@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4004;6:M7Vbu5coBJdTxU7+hy5np1LjzcWXjlNZeRaTecyu9WRjL59NCzcNNTTN3UYru+ciPp9tuC5zIzaZIkhPxLD+ubRunb/zEMmwgWoHuKMoWp/JmPJqp8A6NccQFjsfWxpxhV6S7KMYZaCsTp9k4/HQPs1ziwVOqOZM0pPRnnO4FVq2QPBf1TnuGhQpKsr9JgesTgPDtJQOuBz2x6qHXgd2PyZlYV/KJdz+SiFzqqji2vGCeMm8RHvBZpAL687I8eNVcJKbFCq/AQs0M4iKmhpXw4xbyX3I/A1yt6Vw1J4bmygI3NnfiOP0SOCCDT/SFxC82L5wWZ853R9Cp9rbrwj2CvCU/HjiqskOxpcqUpL/CGMz/QQSHyCBINZPA/X3kp2DOyLUof7lboB3dMZHLWCe8BrqXMSF8n7eeR1RwLIqGsg3xEwrDMZS6aOF03nn9AlU2psKxAZSu9x5EV19ImOHIA==;5:06s6AwWJvurS8B+fCY6uKHsWm7m8K7MnADeWOC7H8ABrqOXkbxgCj/RIoFjQ8/+Sudxsz2b7ICoUhY9+zOUdIGjAIEirmgE4aMJH7WBQ0JLEK5nJN4v/9UA7CUHqJ1gTUrtzyVN21aDieRkJWqwvHFAVSNEDAfDq0jX9nfUOGkM=;7:yXx0HLtBNcR0x0MUCZYs20SNlbfKY1kaKsoe6keFyHZXokCVApDvOlzCXtlFIT5zw21elzcdTO1Uyoj6QxNOwfTe8VuuZWKuIORZ1xM/ILul3H8EsEmY2qFi/VfC0zHQhdtB2Q/RT8wpyImA/+tKZw==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: b0a41567-0a21-4d7a-0521-08d65b13a019
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4004;
x-ms-traffictypediagnostic: AM0PR04MB4004:
x-microsoft-antispam-prvs: <AM0PR04MB4004931615D00DA0994FE7AD80A90@AM0PR04MB4004.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4004;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4004;
x-forefront-prvs: 087894CD3C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(346002)(376002)(366004)(39860400002)(51914003)(189003)(199004)(13464003)(476003)(71190400001)(71200400001)(33656002)(486006)(6116002)(3846002)(44832011)(256004)(14444005)(99286004)(478600001)(966005)(54906003)(2906002)(8936002)(93886005)(86362001)(81156014)(446003)(7736002)(11346002)(8676002)(316002)(14454004)(81166006)(25786009)(110136005)(55016002)(5660300001)(6306002)(9686003)(97736004)(305945005)(74316002)(105586002)(106356001)(6246003)(4326008)(53936002)(26005)(186003)(2501003)(6436002)(102836004)(76176011)(7696005)(6506007)(68736007)(229853002)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4004;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: NAMfY07+yAJdkO59LEVR4fp53OSBed2qBhMXftswv7tOf6ZzFy65puIDwU1ZMc2wHHdEiSQydBs6CHyTAMjY4zf8vl3RjljQ01dK1Qb7r3hb28D183HuU9CZibJ2eqbtJ8ozgsVDxrPAqvgjp/xmxgs/f104rWCbLZL4O1QHjjM4MKsff6n6Pdn1smj8Dttmc/hOlzhual+oX019Opo2w0W9PHyTH0HktDjqPOl4EETqRtJnHVXISn8kqfs2Tw37oIEuhyggYuQO/zmdHF0JeGJfN0eLTAAiGCiskWv/SngtpoPbJ6ExC8YtlofS5UBQg4MbeUq3/t5ZI/JBZTBDv43QtM1BZOJx/G6mmPRjqXA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a41567-0a21-4d7a-0521-08d65b13a019
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2018 00:41:56.7073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4004
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBRdW90aW5nIEFpc2hlbmcgRE9ORyAoMjAxOC0xMi0wMyAx
NzoyNjowMSkNCj4gPiA+ID4gK307DQo+ID4gPiA+ICsNCj4gPiA+ID4gKy8qDQo+ID4gPiA+ICsg
KiBzdHJ1Y3QgaW14X3NjX21zZ19nZXRfY2xvY2tfcmF0ZSAtIGNsb2NrIGdldCByYXRlIHByb3Rv
Y29sDQo+ID4gPiA+ICsgKiBAaGRyOiBTQ1UgcHJvdG9jb2wgaGVhZGVyDQo+ID4gPiA+ICsgKiBA
cmVxOiBnZXQgcmF0ZSByZXF1ZXN0IHByb3RvY29sDQo+ID4gPiA+ICsgKiBAcmVzcDogZ2V0IHJh
dGUgcmVzcG9uc2UgcHJvdG9jb2wNCj4gPiA+ID4gKyAqDQo+ID4gPiA+ICsgKiBUaGlzIHN0cnVj
dHVyZSBkZXNjcmliZXMgdGhlIFNDVSBwcm90b2NvbCBvZiBjbG9jayByYXRlIGdldA0KPiA+ID4g
PiArKi8gc3RydWN0IGlteF9zY19tc2dfZ2V0X2Nsb2NrX3JhdGUgew0KPiA+ID4gPiArICAgICAg
IHN0cnVjdCBpbXhfc2NfcnBjX21zZyBoZHI7DQo+ID4gPiA+ICsgICAgICAgdW5pb24gew0KPiA+
ID4gPiArICAgICAgICAgICAgICAgc3RydWN0IHJlcV9nZXRfY2xvY2tfcmF0ZSByZXE7DQo+ID4g
PiA+ICsgICAgICAgICAgICAgICBzdHJ1Y3QgcmVzcF9nZXRfY2xvY2tfcmF0ZSByZXNwOw0KPiA+
ID4gPiArICAgICAgIH0gZGF0YTsNCj4gPiA+ID4gK30gX19wYWNrZWQ7DQo+ID4gPg0KPiA+ID4g
RG9lcyB0aGlzIG5lZWQgX19wYWNrZWQ/IHN0cnVjdCBpbXhfc2NfcnBjX21zZyBpcyBuYXR1cmFs
bHkgYWxpZ25lZA0KPiA+ID4gc28gSSB0aGluayB3ZSBkb24ndCBuZWVkIHRoaXMuDQo+ID4gPg0K
PiA+DQo+ID4gSSB0aGluayB0aGlzIGlzIG1vcmUgc2FmZSB3YXkuIEJ1dCBzdHJ1Y3QgaW14X3Nj
X3JwY19tc2cgaXMgdW5saWtlbHkgdG8gY2hhbmdlLg0KPiA+IFNvIEkgZ3Vlc3MgaXQncyBzYWZl
IHRvIHJlbW92ZSBpdC4NCj4gDQo+IElmIHRoZSBzdHJ1Y3QgaXMgbmF0dXJhbGx5IGFsaWduZWQg
dGhlbiBJIHdvdWxkIHNheSByZW1vdmUgX19wYWNrZWQgYW5kIG9ubHkNCj4gYWRkIHRoZSBtYXJr
aW5nIGlmIGl0IGlzIHJlYWxseSBuZWVkZWQuIEl0IG1ha2VzIG1vcmUgd29yayBub3csIGJ1dCBp
cyBjbGVhbmVyDQo+IHRvIGRvIGl0IHRoaXMgd2F5IHNvIHdlIGRvbid0IGhhdmUgdG8gdGhpbmsg
YWJvdXQgaXQgbGF0ZXIgYW5kIHdlIG1heSBiZSBhYmxlDQo+IHRvIGdlbmVyYXRlIHNsaWdodGx5
IGJldHRlciBjb2RlIGlmIHRoZSBjb21waWxlciBkb2Vzbid0IGhhdmUgdG8gd29ycnkgYWJvdXQN
Cj4gcGFja2VkIGVpdGhlci4NCg0KVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgZXhwbGFuYXRpb24g
YW5kIGl0IGhlbHBzIGEgZnVydGhlciB1bmRlcnN0YW5kaW5nLg0KSSd2ZSByZW1vdmVkIGl0IGFu
ZCBzZW50IGEgdXBkYXRlZCBwYXRjaCBzZXJpZXMgd2l0aCBhbGwgeW91ciBzdWdnZXN0aW9ucyBh
ZGRyZXNzZWQuDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2NvdmVyLzEwNzEyMDA3Lw0K
UGxlYXNlIGhhdmUgYSBsb29rIGF0IGl0Lg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcNCg==
