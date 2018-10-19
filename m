Return-Path: <SRS0=xlmH=M7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D72ECDE43
	for <linux-clk@archiver.kernel.org>; Fri, 19 Oct 2018 06:47:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56F2E21470
	for <linux-clk@archiver.kernel.org>; Fri, 19 Oct 2018 06:47:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="PO8JC+Ti"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56F2E21470
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbeJSOwe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Oct 2018 10:52:34 -0400
Received: from mail-eopbgr50069.outbound.protection.outlook.com ([40.107.5.69]:6432
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726584AbeJSOwe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Oct 2018 10:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiAxEEAVrwDD69+566q3xtVmqE1XeYTj2j5mQoYMZEg=;
 b=PO8JC+TiIOD/6iraX4QEYgy1JXxSGD9tKIMFSfTm45rsM1KIGAVYpTIuqalbLrIHXUKFvJ5qEtL2KNpIMiqiGI49g5oGCwimNhSYZGnjNWnt3qFuY9JCzPjQk8oIKZ/MQ+7QvKN0x1cGOpHNsZBMoOzQDkbWBCg7WdkhRv++/9A=
Received: from DB5PR0401MB2213.eurprd04.prod.outlook.com (10.166.173.8) by
 DB5PR0401MB1894.eurprd04.prod.outlook.com (10.166.10.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.23; Fri, 19 Oct 2018 06:47:47 +0000
Received: from DB5PR0401MB2213.eurprd04.prod.outlook.com
 ([fe80::c0b5:26f1:bc9e:5a31]) by DB5PR0401MB2213.eurprd04.prod.outlook.com
 ([fe80::c0b5:26f1:bc9e:5a31%6]) with mapi id 15.20.1228.027; Fri, 19 Oct 2018
 06:47:47 +0000
From:   Andy Tang <andy.tang@nxp.com>
To:     Scott Wood <oss@buserror.net>, Stephen Boyd <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/3] clk: qoriq: add t1023 soc support
Thread-Topic: [PATCH 1/3] clk: qoriq: add t1023 soc support
Thread-Index: AQHUT+xXwE+pIxtpN025CWssqdGm96Uhj7twgAIsSQCAAJxXYIAB8ZQAgAADlLA=
Date:   Fri, 19 Oct 2018 06:47:47 +0000
Message-ID: <DB5PR0401MB221330431FEF31D3ABE0C640F3F90@DB5PR0401MB2213.eurprd04.prod.outlook.com>
References: <20180919073906.34187-1-andy.tang@nxp.com>
         <DB5PR0401MB22134ACEF603C05F6B0D9980F3FE0@DB5PR0401MB2213.eurprd04.prod.outlook.com>
         <153979005694.5275.12929241736979814342@swboyd.mtv.corp.google.com>
         <DB5PR0401MB221359C5FB8FE3AAA36A3F0BF3F80@DB5PR0401MB2213.eurprd04.prod.outlook.com>
 <05005bca663190ca375e7ddcdc9221f99655010d.camel@buserror.net>
In-Reply-To: <05005bca663190ca375e7ddcdc9221f99655010d.camel@buserror.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=andy.tang@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;DB5PR0401MB1894;6:jKL2e4OlByNZy2p5vGX8CIm+cXzNxKdsWW62rtKlBN0ba86HoCqHxW8AbWW0z5xihgxNCYk8vEQ52CKQQ6on6TlpYiL2usqrJaCzb2gsw1ZLZf/6xPGwIxdoGQ4XIQn4zkn6b0me2905ZeGsmpvbdmVRjJWacjI0QTJuyQISgOEgf9ggG0dIJm7QwmsMC8bfoGxm/drxmcMz+ZK26w/CqL2zLBD9TBE18Kc92LQxc+yRm/4SD9ubv1pTS2n+odTUCtcqMIDXMXL6ySk6enohm29rphLehTsJbgQ9WbnEvyA/6wZocOspWwMOMna53rzw5CiSSAcITPP/5SPcDBTtxdn8Mxozrz2xdqhnIXaJX1YTnUb8/hbHDupLyDjHBKT9nJKUrupKpSUF6+A7CUMJeezG1csAtFsojZKzS4UoPfO8rRv9BtGRxEtyLYe0OgbqgpRpDiCphiCWE17k+Tw1vw==;5:MgDO9vkl9Frv4PQTKNo0bl/4jwofNYhj71NetbQPi+Lg14F4BW9SAPM+4YcLkftywzN2EpKUSUw+2WopsDHT70duRm7Bn32u5DBMGMFB7ziVibiJSnGWnEhRX2rYredC0DcccA70F40N0noPEmSlYABWZSRMwY5Znp8aiXurkk4=;7:yIx5ItIwdAR6hUgHqbaHoub6koRLtG08JosqNfI8GGrrWS5qo3mmhVfmt8RBnQJJbEBOotvm/G4jaijA1b6266MIjYdm/rHA5Qd3u9HQ5o4w+Ir2s7OCHS/O9wh48rmcuH5n35KPDiPsO6WEQuDAdnA9KLTOMzflQWZhygxt2DzAQDFAsU6EcLZka4z7sx2o1QYfLTYKIIV7gV2/46PWYyaLACclfyzhrjgtXJoLQdbMO/AWM/xMVLkk/zPzhBSj
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 8551b11b-9f45-405f-8fac-08d6358ec811
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:DB5PR0401MB1894;
x-ms-traffictypediagnostic: DB5PR0401MB1894:
x-microsoft-antispam-prvs: <DB5PR0401MB1894612B89C5118523892721F3F90@DB5PR0401MB1894.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(9452136761055)(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:DB5PR0401MB1894;BCL:0;PCL:0;RULEID:;SRVR:DB5PR0401MB1894;
x-forefront-prvs: 0830866D19
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(396003)(136003)(39860400002)(366004)(199004)(189003)(501624003)(13464003)(7696005)(102836004)(76176011)(97736004)(229853002)(305945005)(6436002)(5660300001)(256004)(4001150100001)(316002)(7736002)(33656002)(74316002)(2906002)(53546011)(5250100002)(2501003)(105586002)(3846002)(86362001)(6116002)(14454004)(6506007)(478600001)(106356001)(25786009)(186003)(54906003)(44832011)(446003)(93886005)(486006)(476003)(81156014)(110136005)(11346002)(55016002)(71190400001)(66066001)(71200400001)(68736007)(81166006)(26005)(9686003)(8936002)(53936002)(8676002)(4326008)(99286004)(2900100001)(6246003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB5PR0401MB1894;H:DB5PR0401MB2213.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: jLZ7UBhGWYOCxFipRmLET89Kt2TMFD2N39gnOdV9fWAup4HHQr9AN5Zu8CQsewEz/pZA6MKWhXErBIK0D8B3L+Da6aO/Ch4ydVWtWCKt+tUVBZCSZ9UHdJDiH9mooUt50hgv3jn/2HIofp6Puez0cVyYHOVcQaoGNGJ3Oe12yRsGYvTvNghhdEGgoI+oUojQvX7UWqVVgo8ZdVBA1GrNM9gDx3QC2A68IjN9nJbehCmFpkPwKUYi3zf0CpMLbsZNSLI10BxiSr5fzg12fJ7QCIogmUDLBAbAidsoN4eHu1VlNQPR1uJX3hoQyoyV7NnnqGgWK8ogi8krEtC3q+jGaBOZGFJG8svnPz6ZLyRXc+c=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8551b11b-9f45-405f-8fac-08d6358ec811
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2018 06:47:47.6024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR0401MB1894
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNjb3R0IFdvb2QgPG9zc0Bi
dXNlcnJvci5uZXQ+DQo+IFNlbnQ6IDIwMTjlubQxMOaciDE55pelIDE0OjI4DQo+IFRvOiBBbmR5
IFRhbmcgPGFuZHkudGFuZ0BueHAuY29tPjsgU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3Jn
PjsNCj4gbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20NCj4gQ2M6IHJvYmgrZHRAa2VybmVsLm9yZzsg
bWFyay5ydXRsYW5kQGFybS5jb207DQo+IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc7IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8zXSBjbGs6IHFv
cmlxOiBhZGQgdDEwMjMgc29jIHN1cHBvcnQNCj4gDQo+IE9uIFRodSwgMjAxOC0xMC0xOCBhdCAw
MTowMCArMDAwMCwgQW5keSBUYW5nIHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiA+IEZyb206IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4NCj4gPiA+
IFNlbnQ6IDIwMTjlubQxMOaciDE35pelIDIzOjI4DQo+ID4gPiBUbzogbXR1cnF1ZXR0ZUBiYXls
aWJyZS5jb207IG9zc0BidXNlcnJvci5uZXQ7IEFuZHkgVGFuZw0KPiA+ID4gPGFuZHkudGFuZ0Bu
eHAuY29tPg0KPiA+ID4gQ2M6IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5j
b207DQo+ID4gPiBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZw0KPiA+ID4gU3ViamVjdDogUkU6IFtQQVRDSCAxLzNdIGNsazogcW9yaXE6IGFkZCB0
MTAyMyBzb2Mgc3VwcG9ydA0KPiA+ID4NCj4gPiA+IFF1b3RpbmcgQW5keSBUYW5nICgyMDE4LTEw
LTE1IDIzOjE3OjE4KQ0KPiA+ID4gPiBIaSwNCj4gPiA+ID4NCj4gPiA+ID4gQXBwcmVjaWF0ZSBp
ZiB5b3UgY2FuIHRha2UgYSBsb29rIGF0IHRoaXMgcGF0Y2ggc2V0Lg0KPiA+ID4gPg0KPiA+ID4N
Cj4gPiA+IEkgY2FuIHBpY2sgdGhlIGNsayBwYXRjaGVzLCBidXQgbm90IHRoZSBkdHMgYml0cy4g
U291bmQgZ29vZD8NCj4gPg0KPiA+IExldCdzIHNlZSB3aGF0IFNjb3R0IHNheS4NCj4gPg0KPiA+
IEhpIFNjb3R0LA0KPiA+DQo+ID4gRG8geW91IGhhdmUgYW55IGNvbW1lbnRzIGFib3V0IHRoaXMg
cGF0Y2ggc2V0Pw0KPiA+DQo+ID4gRG8geW91IHRoaW5payBpdCBpcyBvayBpZiBTdGVwaGVuIHBp
Y2tzIHVwIHRoZSBjbGsgcGF0Y2ggYW5kIHlvdSBwaWNrDQo+ID4gdXAgdGhlIHJlc3Qgb2YgdHdv
IHBhdGNoZXM/DQo+ID4gT3Igb25lIG9mIHlvdSBBY2tlZCB0aGUgcGF0Y2ggYW5kIHRoZSBvdGhl
ciBvbmUgYXBwbHkgdGhlbSBhbGw/DQo+IA0KPiBJIGNhbiB0YWtlIHRoZSBkdHMgcGF0Y2hlcy4N
Cj4gDQpUaGFua3MgU2NvdHQuIFBsZWFzZSB0YWtlIHRoZSBkdHMgcGF0Y2hlcy4NCg0KSGkgU3Rl
cGhlbiwNClBsZWFzZSB0YWtlIHRoZSBjbGsgcGF0Y2guDQoNClRoYW5rcyB5b3UgYWxsLg0KQlIs
DQpBbmR5DQoNCj4gLVNjb3R0DQoNCg==
