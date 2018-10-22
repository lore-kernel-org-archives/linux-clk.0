Return-Path: <SRS0=3SWV=NC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36520C67863
	for <linux-clk@archiver.kernel.org>; Mon, 22 Oct 2018 07:48:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6E1F20779
	for <linux-clk@archiver.kernel.org>; Mon, 22 Oct 2018 07:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="jJGMhCJx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6E1F20779
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727544AbeJVQGB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Oct 2018 12:06:01 -0400
Received: from mail-he1eur01on0050.outbound.protection.outlook.com ([104.47.0.50]:21927
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727135AbeJVQGB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Oct 2018 12:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXwu5IWDaWcoUpx/tHl8FuGxo9CFho/bOH6y29q/S9Y=;
 b=jJGMhCJxqk/PCB5Hn6FLqYswN92ezRrswN4TjrhnazKJUy+tsvIfbne4lICcbmMunuRfugyduE5cwjwFfxaLGl3arFP6qgE6L8iKIKvyoXc3bDiBowL95Bzzo3dXsCWxUY6joc093lnRMCRu8WLd3ak6TKFjgHG7ReS2ahloMFg=
Received: from DB5PR0401MB2213.eurprd04.prod.outlook.com (10.166.173.8) by
 DB5PR0401MB1880.eurprd04.prod.outlook.com (10.166.10.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1250.30; Mon, 22 Oct 2018 07:48:32 +0000
Received: from DB5PR0401MB2213.eurprd04.prod.outlook.com
 ([fe80::24b9:d390:896d:12f7]) by DB5PR0401MB2213.eurprd04.prod.outlook.com
 ([fe80::24b9:d390:896d:12f7%3]) with mapi id 15.20.1250.028; Mon, 22 Oct 2018
 07:48:31 +0000
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
Thread-Index: AQHUT+xZH3kPzESPnESoP3hZgQQ+vqUpAHwAgAGkwfCAAEjhgIAAJYaw
Date:   Mon, 22 Oct 2018 07:48:31 +0000
Message-ID: <DB5PR0401MB2213CE73626357FF87AE411CF3F40@DB5PR0401MB2213.eurprd04.prod.outlook.com>
References: <20180919073906.34187-1-andy.tang@nxp.com>
         <20180919073906.34187-2-andy.tang@nxp.com>
         <bb158670f1556156f17c3a9eefaa0a5e35c1591e.camel@buserror.net>
         <DB5PR0401MB2213DC3FA17E6B8E42258EDFF3F40@DB5PR0401MB2213.eurprd04.prod.outlook.com>
 <23919e8b8ec0d7cd9eb7fb1a134adbb9a17ca209.camel@buserror.net>
In-Reply-To: <23919e8b8ec0d7cd9eb7fb1a134adbb9a17ca209.camel@buserror.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=andy.tang@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;DB5PR0401MB1880;6:Rp3eyGGKHOUdzmRK6vwtGKVek2pB0hTXIVuu91A5Qcl1d3+cY2NKSpE/GwcKfZ+NqoKs2qJotTk2O/EBgWn+AQ7uLv84Hfs1qpn9PTYBnMeSh5Ctj6SCn7DwtisX+Bl6l1oHqhRllX26dD97ZWRvOWfIQCJwM8lij7+WFnMZOlsWxo07Jf8kyFpGNct0KF3140YSNOG52k8lP5eSOdmlEe8fSu/TkEAuRgxk8GRecvUVnB31zPRIl3TE1vOg+v/RVB9g8PNulTljnBXhK+LKqtA0up/qzxal/Ux2pP51jEacfebUiWW+cke60oxxox+zcGRnFmIJL/0CS3bMqfcEIw3cJvBZFv131LcIAcgdQXJhxOu1osed6+lNHjFKrQpoh3V4rBK+VyswRTJ7eG4y/ez9WmvURvUhInmI++G5g6r5ofnCiUQr/642ezH6S3hKy/YYwJCr6dmcK4McAOy7Vg==;5:4RDr/6DVeMo/I2B38E9Zoo0KA343BoF8R1wDHmVLfa+BgGeTgQMRPspKg7Ck3b5nYUh1FF65T6Up8/yFG7iEcjezvopM37nbUsX2CtpOJb0rtaAckgzwei1qtHWVZTuibGJTKUxdkEytN/5SNHNewzPJfuZ/Uis1d4xdxPjQ5/s=;7:oxcr9A9X5gKY42x94luJaE6Elx+4QHl9iaoZz3+QZBjUS2BFseWu7QwltVv/9dixoYCiW9r0J6KEI+i8Iz9CBd2x7zX+NtM97TJjtGZ9R9WLE0IBaKXkQgG/RiJd9UzJBZjlkyvfhAb6cnNDU14quKQSJRO+4gjiEz3fvdQ04oRchB3G97YPHssm6OPTdy9UB+tGXlV6ZOjE4MXv/UfjvyVHSItuUzCkhGSRIihdCUn6LTgcsSKcD7TGlcNrFLlr
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: b4ed7c6e-9ec9-4ff4-9028-08d637f2c329
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:DB5PR0401MB1880;
x-ms-traffictypediagnostic: DB5PR0401MB1880:
x-microsoft-antispam-prvs: <DB5PR0401MB1880F58DB05E37764D244327F3F40@DB5PR0401MB1880.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(9452136761055)(185117386973197)(45079756050767)(189930954265078);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231355)(944501410)(52105095)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:DB5PR0401MB1880;BCL:0;PCL:0;RULEID:;SRVR:DB5PR0401MB1880;
x-forefront-prvs: 08331F819E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(376002)(396003)(346002)(366004)(136003)(39860400002)(189003)(199004)(13464003)(55016002)(53936002)(9686003)(99286004)(6306002)(33656002)(229853002)(2501003)(71190400001)(71200400001)(5250100002)(25786009)(93886005)(66066001)(6436002)(81166006)(53546011)(316002)(8676002)(81156014)(6506007)(8936002)(76176011)(102836004)(68736007)(26005)(6246003)(5660300001)(4326008)(7696005)(54906003)(110136005)(44832011)(486006)(11346002)(446003)(74316002)(478600001)(86362001)(476003)(966005)(186003)(105586002)(2906002)(305945005)(106356001)(7736002)(4001150100001)(256004)(14444005)(6116002)(3846002)(2900100001)(97736004)(45080400002)(14454004)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB5PR0401MB1880;H:DB5PR0401MB2213.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: iWzRN736RjcW2XP6h22msk7P5jzk5KOhqaKYkR7DMeB6H7XpPdYSRaKifJd4RQrppsDOUcwmIPfnvBlmx4aJP4jDL6a0RG/Wah0vaIUg3eT4Um1ST0AoDxf5h9E+CGDmPO4JsgPECgYDLNEspMh+0wq5Cr6zy19rcpB7QldxMhwHW5WP+rGJf3oqMc6K/GLo11Cp/hybz7Eaze44pST0v64nWAvC6WDcrROZWsr9F0jdcOKTPpyEsExY6zfQiz9aptRDapZwIsnqFAFLHaUENEvn6gsoU2/qJwVIZ8GkAVfcq7i9OdVu5XY72daHWdnyC8+ptP6vdHe1VH5D8ag9BmpIGQMBqueinFNAPqdcJFI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ed7c6e-9ec9-4ff4-9028-08d637f2c329
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2018 07:48:31.4929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR0401MB1880
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU2NvdHQsDQoNClBsZWFzZSBzZWUgbXkgcmVwbHkgaW5saW5lLg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNjb3R0IFdvb2QgPG9zc0BidXNlcnJvci5uZXQ+DQo+
IFNlbnQ6IDIwMTjlubQxMOaciDIy5pelIDEzOjIxDQo+IFRvOiBBbmR5IFRhbmcgPGFuZHkudGFu
Z0BueHAuY29tPjsgbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20NCj4gQ2M6IHNib3lkQGtlcm5lbC5v
cmc7IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207DQo+IGxpbnV4LWNs
a0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMi8zXSBwb3dlcnBjOiB0MTAyeDogdXBncmFkZSB0aGUgbGVnYWN5IGNsb2Nr
IG5vZGUNCj4gDQo+IE9uIE1vbiwgMjAxOC0xMC0yMiBhdCAwMTozNCArMDAwMCwgQW5keSBUYW5n
IHdyb3RlOg0KPiA+IEhpIFNjb3R0LA0KPiA+DQo+ID4gUGxlYXNlIHNlZSBteSByZXBseSBpbmxp
bmUuDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBT
Y290dCBXb29kIDxvc3NAYnVzZXJyb3IubmV0Pg0KPiA+ID4gU2VudDogMjAxOOW5tDEw5pyIMjHm
l6UgNzo1NA0KPiA+ID4gVG86IEFuZHkgVGFuZyA8YW5keS50YW5nQG54cC5jb20+OyBtdHVycXVl
dHRlQGJheWxpYnJlLmNvbQ0KPiA+ID4gQ2M6IHNib3lkQGtlcm5lbC5vcmc7IHJvYmgrZHRAa2Vy
bmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207DQo+ID4gPiBsaW51eC1jbGtAdmdlci5rZXJu
ZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IFtQ
QVRDSCAyLzNdIHBvd2VycGM6IHQxMDJ4OiB1cGdyYWRlIHRoZSBsZWdhY3kgY2xvY2sNCj4gPiA+
IG5vZGUNCj4gPiA+DQo+ID4gPiBPbiBXZWQsIDIwMTgtMDktMTkgYXQgMTU6MzkgKzA4MDAsIGFu
ZHkudGFuZ0BueHAuY29tIHdyb3RlOg0KPiA+ID4gPiArY2xvY2tnZW46IGdsb2JhbC11dGlsaXRp
ZXNAZTEwMDAgew0KPiA+ID4gPiArCWNvbXBhdGlibGUgPSAiZnNsLHFvcmlxLWNsb2NrZ2VuIjsN
Cj4gPiA+DQo+ID4gPiBXaGVyZSBkb2VzIHRoaXMgY29tcGF0aWJsZSBzdHJpbmcgY29tZSBmcm9t
Pw0KPiA+ID4NCj4gPiA+ID4gKwkJY29tcGF0aWJsZSA9ICJmc2wsdDEwMjMtY2xvY2tnZW4iOw0K
PiA+ID4gPiAgCX07DQo+ID4gPg0KPiA+ID4gQW5kIGhlcmUgeW91IG92ZXJ3cml0ZSBpdCB3aXRo
IG9ubHkgdGhlIGNoaXAtc3BlY2lmaWMgY29tcGF0aWJsZT8NCj4gPiA+DQo+ID4gPiBJcyB0MTAy
MyBpbmNvbXBhdGlibGUgd2l0aCBib3RoIGZzbCxxb3JpcS1jbG9ja2dlbi0xLjAgYW5kDQo+ID4g
PiBmc2wscW9yaXEtY2xvY2tnZW4tIDIuMD8gIFRoZSBleGlzdGluZyBkdHMgc2F5cyAyLjA7IGlz
IHRoYXQgd3Jvbmc/DQo+ID4gPg0KPiA+ID4gQlRXLCBhc3N1bWluZyBpdCBpcyAyLjAgY29tcGF0
aWJsZSBhbmQgdGh1cyB0aGUgdXNlIG9mDQo+ID4gPiBxb3JpcS1jbG9ja2dlbjIuZHRzaSBpcyBj
b3JyZWN0LCB0aGUgYmVzdCBjb3Vyc2Ugb2YgYWN0aW9uIGlzDQo+ID4gPiBwcm9iYWJseSB0byB0
byByZW1vdmUgdGhlIGxlZ2FjeSBzdHVmZiBmcm9tIGFsbCBmc2wgY2hpcHMsIHJhdGhlcg0KPiA+
ID4gdGhhbiBpbnRyb2R1Y2UgYSBuZXcgZHRzaS4NCj4gPiA+IEluIGZhY3QgaXQnZCBiZSBuaWNl
IHRvIHNlZSBpdCBhbGwgcmVtb3ZlZCBpbiBhbnkgY2FzZS4gOi0pDQo+ID4NCj4gPiBxb3JpcS1j
bG9ja2dlbiouZHRzaSBhcmUgdXNlZCBieSBsZWdhY3kgYmluZGluZ3MuIFRoZSBjb250ZW50cyBh
cmUgYWxsDQo+ID4gb2YgbGVnYWN5IGJpbmRpbmdzLg0KPiA+IFRvIHVzZSBuZXcgZnJhbWV3b3Jr
LCBJIGludHJvZHVjZSBhIG5ldyBkdHNpIHdoaWNoIGNvbnRhaW5zIG5ldw0KPiA+IGJpbmRpbmdz
IGFuZCB1c2VkIGZvciBhbGwgUFBDIHNvYy4NCj4gPiBBIGNoaXAtc3BlY2lmaWMgY29tcGF0aWJs
ZSBpcyBuZWVkZWQgYmVjYXVzZSBkcml2ZXIgd2lsbCB1c2UgaXQgdG8gZ2V0DQo+ID4gY2hpcC0g
c3BlY2lmaWMgY2xvY2sgdHJlZSBpbmZvcm1hdGlvbi4NCj4gPiBUaGUgY2xvY2sgaW5mb3JtYXRp
b24gd2FzIGRlZmluZWQgaW4gZHJpdmVyIG5vdCBpbiBkdHMgaW4gbmV3DQo+ID4gZnJhbWV3b3Jr
LCByZW1lbWJlcj8NCj4gDQo+IEknbSBhd2FyZSB0aGF0IGEgY2hpcC1zcGVjaWZpYyBjb21wYXRp
YmxlIGlzIHJlcXVpcmVkLiAgV2hhdCBpcyB1bnVzdWFsIChvbg0KPiBQUEMpIGlzIHByb3ZpZGlu
ZyAqb25seSogdGhlIGNoaXAtc3BlY2lmaWMgY29tcGF0aWJsZS4gIEkgd2FzIGV4cGVjdGluZw0K
PiBzb21ldGhpbmcgbW9yZSBhbG9uZyB0aGUgbGluZXMgb2YNCj4gaHR0cHM6Ly9lbWVhMDEuc2Fm
ZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnANCj4gYXRj
aHdvcmsub3psYWJzLm9yZyUyRnBhdGNoJTJGNDg2NTY1JTJGJmFtcDtkYXRhPTAyJTdDMDElN0Nh
bg0KPiBkeS50YW5nJTQwbnhwLmNvbSU3Q2VhZjQ2ZTQzNjIwYjQ1YTE5ZWI0MDhkNjM3ZGUyMGNi
JTdDNjg2ZQ0KPiBhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzY3NTc4
MjQ1MDU2Njc1MzkNCj4gJmFtcDtzZGF0YT1UNXlSU1d0SFlPMnlMTWpzWlJJeFpUJTJCTTgyeHVH
UW0yVkdYN01SQjhNSkElDQo+IDNEJmFtcDtyZXNlcnZlZD0wDQo+IA0KPiBHcmFudGVkLCB0aGUg
ZHJpdmVyIHJlcXVpcmluZyB0d28gZGlmZmVyZW50IGNvbXBhdGlibGVzIHRvIGJlIHByZXNlbnQg
aXMNCj4gb2RkLCBhbmQgd2FzIGEgY29udmVuaWVuY2UgYmFzZWQgb24gd2hhdCB3YXMgYWxyZWFk
eSBpbiB0aGUgZGV2aWNlDQo+IHRyZWVzLCBidXQgdGhlDQo+IGZzbCxxb3JpcS1jbG9ja2dlbi0y
LjAgY29tcGF0aWJsZSBpcyBwYXJ0IG9mIHRoZSBuZXcgYmluZGluZyAoYWxiZWl0IGFuDQo+IG9w
dGlvbmFsIHBhcnQpLiAgSSBndWVzcyBJIGRvbid0IG1pbmQgbm8gbG9uZ2VyIHJlbHlpbmcgb24g
aXQsIGJ1dCBhdCBsZWFzdA0KPiByZW1vdmUgdGhlICJmc2wscW9yaXEtY2xvY2tnZW4iIHN0cmlu
Zy4NCkFmdGVyIHNhdyB5b3VyIHByZXZpb3VzIHBhdGNoLCBJIHBsYW4gdG8gd29yayBvdXQgYSBz
aW1pbGFyIHBhdGNoLiBUaGUgZnNsLHFvcmlxLWNsb2NrZ2VuLTIuMCBhbmQgZnNsLHFvcmlxLWNs
b2NrZ2VuLTEuMCB3aWxsIGJlIHJldGFpbmVkLg0KDQpUaGFua3MsDQpBbmR5DQoNCj4gDQo+IC1T
Y290dA0KDQo=
