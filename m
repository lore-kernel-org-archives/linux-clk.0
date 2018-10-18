Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B005ECDE3D
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 01:00:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF02721473
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 01:00:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="TvuEMmvW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF02721473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbeJRI7R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Oct 2018 04:59:17 -0400
Received: from mail-ve1eur01on0059.outbound.protection.outlook.com ([104.47.1.59]:13719
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727019AbeJRI7R (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Oct 2018 04:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+CeFmix9lqWVgIe+8bOHvhwdcp2IoIZSJtNE/y9t5E=;
 b=TvuEMmvWProXR+K1tl5RGBZeWfq+VH7JENQSP431C6Yg0yn/NHFL0H5OadUKIvTxZU5ub1ujPx4CgDJceNDfm+gwIjzd1oJL0vsWSz2mYtql/oSMVSEvpVPHxzwXvhn0CnY2Z5q3MGt3qeYeglOXyke2fOx/dpAEfdBiwPQMxU0=
Received: from DB5PR0401MB2213.eurprd04.prod.outlook.com (10.166.173.8) by
 DB5PR0401MB1925.eurprd04.prod.outlook.com (10.166.10.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.26; Thu, 18 Oct 2018 01:00:51 +0000
Received: from DB5PR0401MB2213.eurprd04.prod.outlook.com
 ([fe80::c0b5:26f1:bc9e:5a31]) by DB5PR0401MB2213.eurprd04.prod.outlook.com
 ([fe80::c0b5:26f1:bc9e:5a31%6]) with mapi id 15.20.1228.027; Thu, 18 Oct 2018
 01:00:51 +0000
From:   Andy Tang <andy.tang@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "oss@buserror.net" <oss@buserror.net>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/3] clk: qoriq: add t1023 soc support
Thread-Topic: [PATCH 1/3] clk: qoriq: add t1023 soc support
Thread-Index: AQHUT+xXwE+pIxtpN025CWssqdGm96Uhj7twgAIsSQCAAJxXYA==
Date:   Thu, 18 Oct 2018 01:00:51 +0000
Message-ID: <DB5PR0401MB221359C5FB8FE3AAA36A3F0BF3F80@DB5PR0401MB2213.eurprd04.prod.outlook.com>
References: <20180919073906.34187-1-andy.tang@nxp.com>
 <DB5PR0401MB22134ACEF603C05F6B0D9980F3FE0@DB5PR0401MB2213.eurprd04.prod.outlook.com>
 <153979005694.5275.12929241736979814342@swboyd.mtv.corp.google.com>
In-Reply-To: <153979005694.5275.12929241736979814342@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=andy.tang@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;DB5PR0401MB1925;6:nRAGtf7KVNKeSByNnDElZYffYwyCdBOdf9HoD41SYnK2x5/fji4qODTdELJm4qcVNc2XSTrbSW6CD9Iyf0UhlB3At/GZWKyagEUQ6z+dEYzNXC7U6EbRIC2aNtFAlYRraglTY+WLBoUsamW4TuX010R2koWnTveEYyTifSEVSWh6StxdNcTMrrNVzSpK2UfBDgP1IS+NHUKZhPDqdTeoHHTnuugkMLXYV4FYt3onWNhecl4Oe6xGG+Gdf2AdZV6v7WE+AZ64DF88hUtyF5Ky64qkKw726nsvLw8S00N6Up1z+h5yQUCd67GLz7jI9NkNtKrI9EW/8vdkGHL8fYTdtc8eANv4YG9oSQ/q9479b9w+3DBUdf9g5FFMFa/kfMjJAyqIRndDI0q/PBMhj5g1Ma8tCao4YGoyfXXSZSGVsnVigXPzOA1juqQymBsuwqitjjOg0hS7GH+PmL9HkPxy8w==;5:wsHi9lOqTrvmd+a9MbAOY6WCzgkBllynxJM9StD5JNnPXUSMG90nswy9oHmRTzAhJxvLBUASVWt25kDaaHs+UHy+ZSTTInkX4kCOmElU5mU6I4DD461GVqADGSNDNRjJf5oeXpQJ33BsXuQpDUVojfqM0efHlCxo0wl4H4foGks=;7:yW02uq/N1HDTh3lFkv4kDWE2sipLLZwWQfoxHPhOGm7O1pzAJ6Gw1HQPhUkuRf3G8Q0zl8FWNCMMYN9XOMmMgIh7GcTYnb/grEQM9aui0kfWBGWI5u/kQ8sRzhmafYSdNirRFLzgix9btqkczzWwVn0JqCWfSB5S81+PtypL90V8J0LC3nrt9EIdZb737c91SCwjYqQNEqZJFLwJGdqokuZSSXV1vNm64/Io4kmKJUQDPUhhcjGAAWzcSGkWGRp8
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 97064ee4-5bf5-4839-75a6-08d63495262d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:DB5PR0401MB1925;
x-ms-traffictypediagnostic: DB5PR0401MB1925:
x-microsoft-antispam-prvs: <DB5PR0401MB192504D551D98175F7ADED21F3F80@DB5PR0401MB1925.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(9452136761055)(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:DB5PR0401MB1925;BCL:0;PCL:0;RULEID:;SRVR:DB5PR0401MB1925;
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(346002)(136003)(39860400002)(366004)(501624003)(13464003)(189003)(199004)(74316002)(6436002)(66066001)(76176011)(86362001)(14454004)(33656002)(53936002)(2201001)(81166006)(54906003)(8936002)(97736004)(110136005)(68736007)(81156014)(99286004)(53546011)(6506007)(71200400001)(7696005)(8676002)(2906002)(508600001)(71190400001)(4001150100001)(5250100002)(6246003)(44832011)(105586002)(4326008)(2501003)(229853002)(256004)(476003)(316002)(25786009)(11346002)(446003)(102836004)(2900100001)(5660300001)(55016002)(9686003)(26005)(486006)(106356001)(3846002)(6116002)(7736002)(305945005)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB5PR0401MB1925;H:DB5PR0401MB2213.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: UGQtORBVjZV9R9XKbanHmO+nMWYAT+tDyeHtE7GEcU5ZiAWSEBE9L/8MlPEJTQAXXqM0pqG0foMgcqI/ppbwoJlb5Jpurvw5VW+ZAaQihYP+eRlLkiljp667BzCTJvrOJ0EkQtNQ0h6ZtlEXp73yn82JUUz/wqlm9LZY2a1UROEryXgb1CaV37BbHkCeFpzoiJnrCdd27s7CxxWGt2Puj28D2U0Klqo/k7wKvjlUCFzt4WFktWYTsvXxxl2BwxkoELd9gSPTcAVvetN5BFoSPAwmcRURTlXh7+reyPQwKo4zJ4SjAgO1HxgsznrRKFTd4ogM19Iv/Sr2R0JnvvkPI+ZZ4jSiJKF1tHQoWWXwDD8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97064ee4-5bf5-4839-75a6-08d63495262d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 01:00:51.3417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR0401MB1925
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN0ZXBoZW4gQm95ZCA8c2Jv
eWRAa2VybmVsLm9yZz4NCj4gU2VudDogMjAxOOW5tDEw5pyIMTfml6UgMjM6MjgNCj4gVG86IG10
dXJxdWV0dGVAYmF5bGlicmUuY29tOyBvc3NAYnVzZXJyb3IubmV0OyBBbmR5IFRhbmcNCj4gPGFu
ZHkudGFuZ0BueHAuY29tPg0KPiBDYzogcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRA
YXJtLmNvbTsNCj4gbGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmcNCj4gU3ViamVjdDogUkU6IFtQQVRDSCAxLzNdIGNsazogcW9yaXE6IGFkZCB0MTAy
MyBzb2Mgc3VwcG9ydA0KPiANCj4gUXVvdGluZyBBbmR5IFRhbmcgKDIwMTgtMTAtMTUgMjM6MTc6
MTgpDQo+ID4gSGksDQo+ID4NCj4gPiBBcHByZWNpYXRlIGlmIHlvdSBjYW4gdGFrZSBhIGxvb2sg
YXQgdGhpcyBwYXRjaCBzZXQuDQo+ID4NCj4gDQo+IEkgY2FuIHBpY2sgdGhlIGNsayBwYXRjaGVz
LCBidXQgbm90IHRoZSBkdHMgYml0cy4gU291bmQgZ29vZD8NCg0KTGV0J3Mgc2VlIHdoYXQgU2Nv
dHQgc2F5Lg0KDQpIaSBTY290dCwNCg0KRG8geW91IGhhdmUgYW55IGNvbW1lbnRzIGFib3V0IHRo
aXMgcGF0Y2ggc2V0Pw0KDQpEbyB5b3UgdGhpbmlrIGl0IGlzIG9rIGlmIFN0ZXBoZW4gcGlja3Mg
dXAgdGhlIGNsayBwYXRjaCBhbmQgeW91IHBpY2sgdXAgdGhlIHJlc3Qgb2YgdHdvIHBhdGNoZXM/
DQpPciBvbmUgb2YgeW91IEFja2VkIHRoZSBwYXRjaCBhbmQgdGhlIG90aGVyIG9uZSBhcHBseSB0
aGVtIGFsbD8NCg0KVGhhbmtzDQpBbmR5DQoNCg==
