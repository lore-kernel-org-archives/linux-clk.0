Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BE9C38A2D
	for <linux-clk@archiver.kernel.org>; Tue, 25 Oct 2022 07:09:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiJYHJU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Oct 2022 03:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiJYHJT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Oct 2022 03:09:19 -0400
Received: from us-smtp-delivery-115.mimecast.com (us-smtp-delivery-115.mimecast.com [170.10.129.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0159CC96E6
        for <linux-clk@vger.kernel.org>; Tue, 25 Oct 2022 00:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1666681756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jgEwOMYmSL/U6Dw5Y8VYIlqAqkMI/swfXIka04iCw0g=;
        b=D7xwcknnqwnI2CR0opo6lD7mdOjdl7NLlzknHvhI2uiOrrq+bzU8VYNdk/2ejFmI/rjwYX
        rTj4T5RdoXKGFjMvI46jnOlutlC5L43TGIx0ifAsCCeOQxAPnc6wxb+T8ODDHH+I0bU2ZG
        fg2Cn1y5Lcp9gMB/MLtGr4uonYrp6d0iZj3ZAYYXSIdHd8jSl6I7dAYjVVTIb0zHfdcesk
        hIONmLTMm5Td/aO0T6u4g8hmLDdABxjVBBLT7kfzeash8ucYO0o00iCyJrSnqxlDZQGigv
        +5rEzt8sA5R6ytB/Mp1Dr+x6VimG6AK1z2hP8kinQp5IyvJaZk3D3fpt47gQBw==
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-HoaGru_eN2S8OFeezrosmw-1; Tue, 25 Oct 2022 03:09:15 -0400
X-MC-Unique: HoaGru_eN2S8OFeezrosmw-1
Received: from MN2PR19MB3693.namprd19.prod.outlook.com (2603:10b6:208:18a::19)
 by PH7PR19MB5917.namprd19.prod.outlook.com (2603:10b6:510:1d8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 07:09:12 +0000
Received: from MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::4d61:1edd:74f5:342c]) by MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::4d61:1edd:74f5:342c%6]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 07:09:12 +0000
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        linux-lgm-soc <linux-lgm-soc@maxlinear.com>
Subject: Re: [bug report] clk: mxl: Switch from direct readl/writel based IO
 to regmap based IO
Thread-Topic: [bug report] clk: mxl: Switch from direct readl/writel based IO
 to regmap based IO
Thread-Index: AQHY54VsUz9szBfS50ejXC9j2MWLnK4eslMA
Date:   Tue, 25 Oct 2022 07:09:12 +0000
Message-ID: <20852e6a-3c94-c878-43fa-f057f1507423@maxlinear.com>
References: <Y1Y31z6VqiuF/9Lp@kili>
In-Reply-To: <Y1Y31z6VqiuF/9Lp@kili>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR19MB3693:EE_|PH7PR19MB5917:EE_
x-ms-office365-filtering-correlation-id: 320f9b2a-a820-48a8-dcab-08dab657d1dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: AVRZBbEmkxRLLUNAaisB3c2ZGEo5B22V+s3n3jdVb5exfESD2ulCm4ILdhZOA8YZyXa31LUlOfQ3/RuIQw+lbFw7RAUonH1R3aE0HfSJER+7wvZs+ATWmUE5yYShZEhl5h8QvyaeSRX7AkbpnOavUUzn9sVUDk5edwU4HtZKFPSpTwXz+wSVmjsVFLw0P9XFMkIXMlXRg8oln9yjdIPhKs0oMKPkKJc+1nvLSlfFm84p8gRJe1l3JAcpujqqGcxB5O01/+zAI4Vaum2/oAIC2wtraOhpXH/vX1nsYXBwmzc8N4h0dsVwmuxXJgNNtFVAd9e2GODbMXwXe+K13UR7HwDbkzXvWCEFLnLpdvU8Lx1OhnDM7FW+RXSO79468pPjKH6bZLGWLaaeEgXcQKiKjwVkA0RCsPm5PPvwPXhnwfrO0HMCwwNT5DLeE/gEeFdEs1uDw0NLyMebbE8M5HCsi8y0of7eeJG6vjzwa1zify/e2e4DSaTb4Ivjj++fT1nslJ6K4jf8mXdh1TS5gBL1xVd7Gswn9Q2cJCLA5Y4bEP5u6xCUxnE5zfqnFmD9CyKpgI7YBuZBoihvVhwin3LfPD/zesw7Td0/HSQzgYn4J8YsKW+xV+eAQcshiAB8WzFmSoECMr5syp35sWnzXbcNXSFqcvKTQotdH98b1NheCZlFArlxNzM9ssIaZKcl1DsYMw5ujPNstcEuMR24isADtOCVTkgif6Nd8nGohuWTHMuwNwuLKnglRgWqlAYQ/dA7tsUikmasNdPQYSzWiQmvynGyA0Q+iuO4BBj5xZAvrO7m0X/2EjTUTwM94tlfK0QLO/6aauTUs2vqrU19tbq9pA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR19MB3693.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(136003)(346002)(396003)(376002)(451199015)(36756003)(66476007)(31686004)(66899015)(316002)(41300700001)(86362001)(31696002)(6486002)(38100700002)(2906002)(122000001)(5660300002)(186003)(2616005)(38070700005)(83380400001)(107886003)(91956017)(6916009)(6512007)(6506007)(76116006)(66446008)(53546011)(66946007)(66556008)(8676002)(71200400001)(4326008)(478600001)(64756008)(54906003)(8936002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFV0bHowdlBxTTVFalFIaWpBUlVlRDB1NGE0YVBTTmIyZHhDTGpCZTBOc0xI?=
 =?utf-8?B?cTBRNkRUNmhDbFc4UEpxb3BybGR4aHhUWTduUFE2VjBOQUhPQk8yUDBvbE1F?=
 =?utf-8?B?Z0t1Sm5uanFZeUJ4a3M0MEp1NGg2Rm0waVBiTzIwQjdiTzV3SWhlME5jYUZY?=
 =?utf-8?B?L1BYaThEanhUaU9jMDU3T1BNSnpjOWQyeHlSdFp3cUhaSVJqMWFvK3phelY3?=
 =?utf-8?B?MEhFQmVpYVNtNi8wSjFCeDdYa1Y1dGV1dkZVWG92ZmpONXZWeGNDekVpTGx1?=
 =?utf-8?B?dFFkQUxtWW9laFpWbDFaOWhqSEsvUlhDb09ZMm1KeFR5Z3NKdmZCSHMzSzZi?=
 =?utf-8?B?WWMzSkQ0NCt5dTg4QWRiQmIvY29RYjIxOEZPWUdvK3FSTUJCcTkzS3lFWUZ6?=
 =?utf-8?B?ZjZML0dpOGpRTlAvSmpIQ24ySXgrb3VzRmZONTlKTUE5cGFZT1pncGF5SnNC?=
 =?utf-8?B?Qm9EQ1N0WXc3dXdRb3BOOXA4UDJnZ0RzV2lPRkxKak5Nd1htZm9JdEJMT0Fu?=
 =?utf-8?B?VExnWVhsN2Vlc2ZTdENWYU5CYUVBKzN5S2ZZRk1rb0JNVmRhdFNFTFNHSTEv?=
 =?utf-8?B?L2E3U3UrbXBna2J5YkRkcnJpRjYrNUpmNmg3dFlQbUQvTk5wY3A2S1gzR25W?=
 =?utf-8?B?R0RvOFZBVW00bkNnN01ldms1T3ZSRVVYeEFHakM5eTZnN0hQcVBobTdNZnVp?=
 =?utf-8?B?RGppWGNVa0xBRjlsUHh0RUFtNmJ5d3liUTQvWXIrS2xhUnNKNlpuU0lhSUpl?=
 =?utf-8?B?VWVQa0hWWFIveTJiMDBpVlo1Yjluc3ErZmlPc3dzVHhNcXM3KzZBWU1NbkVZ?=
 =?utf-8?B?azFBZ0tMcG5qMkVEaWNxOWZTSUZkV0srVkppUHJJNE1MdzBzY2txTll0TW9q?=
 =?utf-8?B?c1kyTWJYbXRFR0s0L1Y2amhIWE55ekE5TFZTRTRWME9rbTgyLzVEQ3Fxdmg5?=
 =?utf-8?B?SkxLc3gvYnR0bXVjNFRkaEp4WWJsejZad3R3RHdjRnozOUVvMG9neG0zUkpm?=
 =?utf-8?B?WlFRUnV0REM0RFJ2anJZK2IvWHorWWRkVHZ6VWN2cXQ3UTJuYVFGMyszMlhH?=
 =?utf-8?B?SU9kaHhnZTczSWVLQUVkeFJqUUZaYzdkRjhKK2Z0RkJud01TSSs3cGRlOTNB?=
 =?utf-8?B?VE5meStnTHFPWEFPZXBSRW84SWo4MGNnSTlzeWlqSzU3K3ZoR0dNeUpYeDJL?=
 =?utf-8?B?NFUyTHRxK0hJVFcxaWZEUDlJWnJZTDJTL2Nrc2RTSTB4Uzd4NXRmOEJ5RXJE?=
 =?utf-8?B?MktOajZXcjF6dmdYeWhBcXd3elMvV3U4bGIzWTgzckhPcVlFQldiWS92Nkln?=
 =?utf-8?B?SXZJUk5CdVlTT3duVHp3TkFLMGdpcHUzVUZjcFhycW5HTXIxWFBXMWhxbk5x?=
 =?utf-8?B?Qk1qblNwQVhSREhtZkkrM3BTVUdZK3F4Szg5MG1kQ0UwVjZEaUYrWWcxKzVn?=
 =?utf-8?B?cWdveUV0UlZtSTBqMGZRTHlQbUFpRnlobG1qVFhZeWhycS9yREN6ZEtLUTYz?=
 =?utf-8?B?VUt3VitFcHdwZzhjZDhlMGg2ZVk0UUlyWmdyQkI0Y0NNZDVpNWRidGRxa2ww?=
 =?utf-8?B?Z1BMRXRGZmRjVUNUK2dhVkhVcXY2WlpYcWhoV2tpaE5jejhkUElSSGMyMTJk?=
 =?utf-8?B?M0djNjFWekVpQzQ4ME5oekdpc0h0d3RkOVJtRkdYbTk1ZzBRV3kwRDJlUGJq?=
 =?utf-8?B?WlN4alFOZW90Z2wyYzdXY0hIQWVkTlZHQmpNU1BLbFhCY3ZydXBZVEpLTFdo?=
 =?utf-8?B?ZitRRzZGZTRmTXVvZHpMSjM2UkRoQnRCWGkyVmRrUzJDdEdpVysxaitUWUdq?=
 =?utf-8?B?QjZSMmt5dTg0RlFURjcwaSthT0FrUzR2S2tCNk1SRGdSY0RIZ2k1T0t1WDZU?=
 =?utf-8?B?M0tOT2F5K1g3MmNwb3FRRmJsd1hzbEZwa2J0VUkydG8xNjBPQmRZUXZ1bFln?=
 =?utf-8?B?RDE1UkdSZk9YRlNJemxua3NOVFBHd1BJM0JWaDlFVERIQWNPQnY3RE5mSGph?=
 =?utf-8?B?a0pyc2wzcHVYUXRLRklKRkdpWnZBVXRwVW8rS0graEZiaFpBaERxeTAvU1U5?=
 =?utf-8?B?ZU9hL3l4VUlnekR5bEkwUFBPUWcwcmVYRlZvc3J2aGdTK25RNXpuNHlQUDFn?=
 =?utf-8?B?L1ozNnJGMEFvSzFVUVF0VTJuVEV1elBJSEZEQmRZWmlDaWxGRDVzaTFxdnpj?=
 =?utf-8?B?dXc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: maxlinear.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR19MB3693.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 320f9b2a-a820-48a8-dcab-08dab657d1dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 07:09:12.5512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dac28005-13e0-41b8-8280-7663835f2b1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1QC6YA8+IQ1/paZ9js6/ECBkDPwg+WD2PNaeLVCkT9j+4z1Cy8c532H3DCXN8z/bS4sI69JJQjaHGOEkisdSqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5917
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-ID: <1FA6D989D3A11443952C7FFCD103AD96@namprd19.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQpIaSBEYW4sDQoNCg0KT24gMjQvMTAvMjAyMiA0OjQ4IHBtLCBEYW4gQ2FycGVudGVyIHdyb3Rl
Og0KPiBUaGlzIGVtYWlsIHdhcyBzZW50IGZyb20gb3V0c2lkZSBvZiBNYXhMaW5lYXIuDQo+IA0K
PiANCj4gSGVsbG8gUmFodWwgVGFud2FyLA0KPiANCj4gVGhlIHBhdGNoIDAzNjE3NzMxMGJhYzog
ImNsazogbXhsOiBTd2l0Y2ggZnJvbSBkaXJlY3QgcmVhZGwvd3JpdGVsDQo+IGJhc2VkIElPIHRv
IHJlZ21hcCBiYXNlZCBJTyIgZnJvbSBPY3QgMTMsIDIwMjIsIGxlYWRzIHRvIHRoZQ0KPiBmb2xs
b3dpbmcgU21hdGNoIHN0YXRpYyBjaGVja2VyIHdhcm5pbmc6DQo+IA0KPiAgICAgICAgICBkcml2
ZXJzL2Nsay94ODYvY2xrLWxnbS5jOjQ0MSBsZ21fY2d1X3Byb2JlKCkNCj4gICAgICAgICAgd2Fy
bjogcGFzc2luZyB6ZXJvIHRvICdQVFJfRVJSJw0KPiANCj4gZHJpdmVycy9jbGsveDg2L2Nsay1s
Z20uYw0KPiAgICAgIDQyNCBzdGF0aWMgaW50IGxnbV9jZ3VfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gICAgICA0MjUgew0KPiAgICAgIDQyNiAgICAgICAgIHN0cnVjdCBs
Z21fY2xrX3Byb3ZpZGVyICpjdHg7DQo+ICAgICAgNDI3ICAgICAgICAgc3RydWN0IGRldmljZSAq
ZGV2ID0gJnBkZXYtPmRldjsNCj4gICAgICA0MjggICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wID0gZGV2LT5vZl9ub2RlOw0KPiAgICAgIDQyOSAgICAgICAgIGludCByZXQ7DQo+ICAgICAg
NDMwDQo+ICAgICAgNDMxICAgICAgICAgY3R4ID0gZGV2bV9remFsbG9jKGRldiwgc3RydWN0X3Np
emUoY3R4LCBjbGtfZGF0YS5od3MsIENMS19OUl9DTEtTKSwNCj4gICAgICA0MzIgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCk7DQo+ICAgICAgNDMzICAgICAgICAgaWYgKCFj
dHgpDQo+ICAgICAgNDM0ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gICAgICA0
MzUNCj4gICAgICA0MzYgICAgICAgICBjdHgtPmNsa19kYXRhLm51bSA9IENMS19OUl9DTEtTOw0K
PiAgICAgIDQzNw0KPiAgICAgIDQzOCAgICAgICAgIGN0eC0+bWVtYmFzZSA9IHN5c2Nvbl9ub2Rl
X3RvX3JlZ21hcChucCk7DQo+ICAgICAgNDM5ICAgICAgICAgaWYgKElTX0VSUl9PUl9OVUxMKGN0
eC0+bWVtYmFzZSkpIHsNCj4gICAgICA0NDAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAi
RmFpbGVkIHRvIGdldCBjbGsgQ0dVIGlvbWVtXG4iKTsNCj4gLS0+IDQ0MSAgICAgICAgICAgICAg
ICAgcmV0dXJuIFBUUl9FUlIoY3R4LT5tZW1iYXNlKTsNCj4gDQo+IEdlbmVyYWxseSB3aGVuIGEg
ZnVuY3Rpb24gcmV0dXJucyBOVUxMIHRoYXQgaXMgYSBzcGVjaWFsIGtpbmQgb2Ygc3VjY2Vzcw0K
PiBwYXRoIHdoZXJlIHRoZSBmZWF0dXJlIGhhcyBiZWVuIGRlbGliZXJhdGVseSBkaXNhYmxlZC4g
IElmIGZvciBleGFtcGxlLA0KPiBMRURzIGhhdmUgYmVlbiBkaXNhYmxlZCB0aGVuIHRoZSBldGhl
cm5ldCBkcml2ZXIgb3Igd2hhdGV2ZXIgc2hvdWxkIGp1c3QNCj4gaGFuZGxlIHRoYXQgYW5kIGNv
bnRpbnVlIGZ1bmN0aW9uaW5nLiAgKElmIHRoZXJlIGlzIGFuIGVycm9yIGluIHRoZSBMRURzDQo+
IHRoZW4gcmVwb3J0IHRoZSBlcnJvciBhbmQgZG8gbm90IGlnbm9yZSBpdCkuDQo+IA0KPiBDYW4g
dGhpcyBkcml2ZXIgbm90IGNvbnRpbnVlIHdpdGhvdXQgY3R4LT5tZW1iYXNlPyAgSXMgaXQgdXNl
ZnVsIHRvDQo+IGhhdmUgYSBuby1vcCBwcm9iZSBmdW5jdGlvbiB0aGF0IGp1c3Qgc2V0cyBjdHgt
PmNsa19kYXRhLm51bSBhbmQgcmV0dXJucw0KPiBzdWNjZXNzPyAgSWYgaXQncyBub3QgdXNlZnVs
IHRoZW4gaXQncyBiZXR0ZXIgdG8gaGFuZGxlIGl0IGluIHRoZQ0KPiBLY29uZmlnIGluc3RlYWQg
b2Ygd2FpdGluZyBmb3IgdGhlIHVzZXIgdG8gZmluZCBpdCB0aGUgaGFyZCB3YXkuDQo+IA0KPiBJ
ZiBDT05GSUdfTUZEX1NZU0NPTiBpcyB0dXJuZWQgb2ZmIHRoZW4gc3lzY29uX25vZGVfdG9fcmVn
bWFwKCkgZG9lcw0KPiBub3QgcmV0dXJuIE5VTEwsIGl0IHJldHVybnMgRVJSX1BUUigtRU5PVFNV
UFApLiAgU28gdGhlIElTX0VSUl9PUl9OVUxMKCkNCj4gZG9lc24ndCBtYWtlIHNlbnNlLg0KPiAN
Cg0KVGhhbmtzIGZvciBjYXRjaGluZyBpdC4gSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IElTX0VSUl9P
Ul9OVUxMKCkgZG9lcyBub3QgDQptYWtlIHNlbnNlIGhlcmUuIEl0IHNob3VsZCBoYXZlIGJlZW4g
SVNfRVJSKCkuIEkgd2lsbCBzZW5kIGEgZml4dXAgcGF0Y2ggDQp0byBmaXggaXQuDQoNCklNSE8s
IGl0IGlzIG5vdCB1c2VmdWwgdG8gaGF2ZSBhIG5vLW9wIHByb2JlIGZ1bmN0aW9uIHdpdGhvdXQg
DQpjdHgtPm1lbWJhc2UuIEZpcnN0bHksIGkgaGF2ZSBjaGVja2VkIHRoZSBzeXNjb25fbm9kZV90
b19yZWdtYXAoKSANCmZ1bmN0aW9uLiBJdCBuZXZlciByZXR1cm5zIE5VTEwgaW4gYW55L2FsbCBw
b3NzaWJsZSBjYXNlcyB3aGV0aGVyIA0Kc3VjY2VzcyBvciBmYWlsdXJlLiBFaXRoZXIgaXQgcmV0
dXJucyBhIHZhbGlkIG1lbWJhc2UgcG9pbnRlciBvciBlcnJvciANCmNvZGUuIFNlY29uZGx5LCBp
ZiBpIGFwcHJvYWNoIHRvIGNvbnNpZGVyIE5VTEwgcmV0dXJuIGFzIHNwZWNpYWwga2luZCBvZiAN
CnN1Y2Nlc3MgdGhlbiBpIHdpbGwgaGF2ZSB0byByZXR1cm4gTlVMTCBmb3IgYWxsIGNsa19odyBm
b3IgYWxsIA0KY3R4LT5jbGtfZGF0YS5udW0gY2xrcyBpbiBvcmRlciB0byBtYWtlIGl0IGEgc3Vj
Y2Vzc2Z1bGx5IHByb2JlZCAmIA0KbG9hZGVkIGRyaXZlciBidXQgd2hpY2ggb2ZmZXJzIG5vIGNs
ayBzZXJ2aWNlcyBhdCBhbGwgaS5lLiBtYWtlcyBhbGwgDQpjbGtzIGFzIGR1bW15IGNsa3MuIFRo
YXQgYXBwcm9hY2ggd2lsbCBuZWVkIG11Y2ggbW9yZSB1bm5lY2Vzc2FyeSBjb2RlIA0KY2hhbmdl
cyBiZWNhdXNlIHRoZSBkcml2ZXIgZHluYW1pY2FsbHkgYWxsb2NhdGVzIGFsbCBjbGsgc3RydWN0
dXJlcyBwb3N0IA0Kc3lzY29uX25vZGVfdG9fcmVnbWFwKCkgY2FsbC4gQWxzbywgaWYgdGhlIHJl
Z2Jhc2UgaXMgcmV0dXJuZWQgTlVMTCB0aGVuIA0KaSBkbyBub3Qgc2VlIGFueSBwb2ludCBpbiBs
b2FkaW5nIHRoZSBkcml2ZXIgYXQgYWxsLg0KDQpJIHdpbGwgc2VuZCBhIGZpeHVwIHBhdGNoIHRv
IGZpeCB0aGlzIHN0YXRpYyBjaGVja2VyIHdhcm5pbmcgYnkgDQpyZXBsYWNpbmcgSVNfRVJSX09S
X05VTEwoKSB3aXRoIElTX0VSUigpLg0KDQpSZWdhcmRzLA0KUmFodWwNCg0KDQoNCg0KPiAgICAg
IDQ0MiAgICAgICAgIH0NCj4gICAgICA0NDMNCj4gICAgICA0NDQNCj4gICAgICA0NDUgICAgICAg
ICBjdHgtPm5wID0gbnA7DQo+ICAgICAgNDQ2ICAgICAgICAgY3R4LT5kZXYgPSBkZXY7DQo+ICAg
ICAgNDQ3DQo+ICAgICAgNDQ4ICAgICAgICAgcmV0ID0gbGdtX2Nsa19yZWdpc3Rlcl9wbGxzKGN0
eCwgbGdtX3BsbF9jbGtzLA0KPiAgICAgIDQ0OSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBBUlJBWV9TSVpFKGxnbV9wbGxfY2xrcykpOw0KPiAgICAgIDQ1MCAgICAgICAgIGlm
IChyZXQpDQo+ICAgICAgNDUxICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiAgICAgIDQ1
Mg0KPiAgICAgIDQ1MyAgICAgICAgIHJldCA9IGxnbV9jbGtfcmVnaXN0ZXJfYnJhbmNoZXMoY3R4
LCBsZ21fYnJhbmNoX2Nsa3MsDQo+ICAgICAgNDU0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBBUlJBWV9TSVpFKGxnbV9icmFuY2hfY2xrcykpOw0KPiAgICAgIDQ1NSAg
ICAgICAgIGlmIChyZXQpDQo+ICAgICAgNDU2ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0K
PiAgICAgIDQ1Nw0KPiAgICAgIDQ1OCAgICAgICAgIHJldCA9IGxnbV9jbGtfcmVnaXN0ZXJfZGRp
dihjdHgsIGxnbV9kZGl2X2Nsa3MsDQo+ICAgICAgNDU5ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEFSUkFZX1NJWkUobGdtX2RkaXZfY2xrcykpOw0KPiAgICAgIDQ2MCAgICAg
ICAgIGlmIChyZXQpDQo+ICAgICAgNDYxICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiAg
ICAgIDQ2Mg0KPiAgICAgIDQ2MyAgICAgICAgIHJldHVybiBkZXZtX29mX2Nsa19hZGRfaHdfcHJv
dmlkZXIoZGV2LCBvZl9jbGtfaHdfb25lY2VsbF9nZXQsDQo+ICAgICAgNDY0ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY3R4LT5jbGtfZGF0YSk7DQo+ICAgICAg
NDY1IH0NCj4gDQo+IHJlZ2FyZHMsDQo+IGRhbiBjYXJwZW50ZXINCj4gDQo+IA0KDQo=

