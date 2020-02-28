Return-Path: <SRS0=AG5N=4Q=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02113C3F2C6
	for <linux-clk@archiver.kernel.org>; Fri, 28 Feb 2020 00:40:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C27BA246A6
	for <linux-clk@archiver.kernel.org>; Fri, 28 Feb 2020 00:40:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="haRWFoiI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730233AbgB1AkL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Feb 2020 19:40:11 -0500
Received: from mail-vi1eur05on2059.outbound.protection.outlook.com ([40.107.21.59]:6082
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730224AbgB1AkL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 27 Feb 2020 19:40:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9x5w8S5ZuxKZhfULK0zW8aLlVkpCZagd5BK132+uqwmzi71aUE5qYFyeEmDZSSDoD3HFih2KhBhHoqYPgaY+vcFxg/LNfoC2cDYVnOq48h+F75JJBPUXuCqtFXS2BqIg0ZgW5sE/FYAhjrcaV2WQ+z0NblYkgUz1YvpX2nPvdXKlzACj3Y7HiUExlpqtT7rK8g9M+V5W52OvdwXZnBYrmLhw0sZr87DqY6DX1MsGAyp2OxX2ExS8dhsKJUGpadHGiV0CS1eu8PAt6g9krneX8vUNjq83y6E9w3hqjIOR9wwUBkVy9jt/PydMFKJkX/xGJuHLwlL51m1aS87xfAY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qchbz+BXzEM1n+VLSmDy8dZQNsTXnRuTMIBIetMXBY=;
 b=f6aJWEVOC2T1rTe/PUBig6Q2ZfelaYuZ4dOSqyGIliH59dJSoPW9Bk3WjUHKm5tsXrLiGYeSfj2vfOLXHBES2d1pIzd5bx4vynkt6f/s16kMqF5C9JqoUNFvSQV4oOqGKQ7lL42n0CxM3Tdc1GfchOFbW3V3V5wnOjEQlrLaseLU1308uQlOKk9F5LNj9Y/Qf49HzfWQuJRqFHpLnFb3fpXR5LwlEXx3h5FlL7aLbuqF/ibGMBfsX03HboPmYjEe4ySRoOV6jqxDybyDO7G2J8A4zpWmZzAbqx9pbF20d2Np6j7KOElp9Z5Km+3ssj4fC17RXqRhOBw660BAzebV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qchbz+BXzEM1n+VLSmDy8dZQNsTXnRuTMIBIetMXBY=;
 b=haRWFoiI4m2X5CT32j9M2XI3eXOqk+c7t7Hl3FsWqZp6D0aiZ26LDBqQWiBJ5hwLlti27JDpgcdBPwn7WjIyVnIre0Phk9kGMwKtlG8Nx+DverpXTVbQ/Jncrre8Z/eN+QmttBQYDB7WZSOfjEgbp26jnMpO6QkfOoHIN7PCfhc=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3738.eurprd04.prod.outlook.com (52.134.70.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Fri, 28 Feb 2020 00:40:06 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96%5]) with mapi id 15.20.2772.012; Fri, 28 Feb 2020
 00:40:06 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Oliver Graute <oliver.graute@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>
CC:     "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: RFC: imx8qm: imx-scu-clk: probe of clk failed
Thread-Topic: RFC: imx8qm: imx-scu-clk: probe of clk failed
Thread-Index: AQHV7W6+j/nedDpaSEKPmgq1m0snKagvKwEAgACXNjA=
Date:   Fri, 28 Feb 2020 00:40:06 +0000
Message-ID: <DB3PR0402MB3916849150B4778E117B6F86F5E80@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20200227125743.GC16310@optiplex>
 <20200227153110.GD16310@optiplex>
In-Reply-To: <20200227153110.GD16310@optiplex>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ef2f32f4-2d26-4ea1-3fda-08d7bbe6c1f8
x-ms-traffictypediagnostic: DB3PR0402MB3738:|DB3PR0402MB3738:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB37380417BF80EDCE967A478EF5E80@DB3PR0402MB3738.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0327618309
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(189003)(199004)(6636002)(478600001)(44832011)(66946007)(76116006)(66446008)(66476007)(66556008)(52536014)(9686003)(2906002)(55016002)(5660300002)(4326008)(64756008)(8676002)(26005)(186003)(71200400001)(81156014)(81166006)(6506007)(8936002)(86362001)(316002)(110136005)(7696005)(54906003)(33656002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3738;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lma8kbE60uGpP023VqF5EbjNS2nBt4e1OPq9rt5hhu8B7xDrpKhUwi5HYkZ1G0IFxa8I5DcgQfUGXxTGluw0stxZ2KOvSD/ggQtYRpQBqzGZjfdva9IR7syU2SmLuoJOxdK3a+RsczxY8ZNCW1jOH06bLqaldeHxWsP0jONVkTcgfXOFK+mdkxaROYgSQq0wZk7MnFRj72YBnYF1hl35PQb/V+aVxRIkoSP4d0KwrhFOzZNoCfYtCfsuAT4qgq4b3WANWbgGc4hFpVmuBYUNqqHNQVC1VO1j++a7ljtMmbRRisURNzjPe/I0qZRLv28lGh75Lxan68fN4LBMPXRCP/qwwS2fslD/nSo1rsIcc4WcIuF9co1AkKe29O+uo+SNzvXfaG+E5y7W7QIjRVWEH3atXd+J1OvIRAK1bKdNgo3cFBWff534wE2sPb0tKaHY5BVFRvz1NZVtpVHj/8HbeUvfeG62/pOJwgYgr8tZTaAHp7p1q7UAWMfrTrV7k11R
x-ms-exchange-antispam-messagedata: vtsQIGsmZA+cqVmVsLKrVaLA41xkC4x6BbSdW40k3x42aBt1kN3fPLsNNVgveJNmleelrrq0md25gJJp2vKL2ZH5sVFB3yLpY1bBMZEEUZo1h+q34Ik8cxOnH7OLSqwvy51U9ZQhCTdAgj1+cR30iQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2f32f4-2d26-4ea1-3fda-08d7bbe6c1f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2020 00:40:06.3960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DrwEbY9x7dlSFNFTKi+1ddzX4xIE1Cr2cOEOfvwGHLgWzdJ9O00iOvSjKlSJAWqKosbM8cukqinEp8fXIyXsuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3738
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGksIE9saXZlcg0KDQo+IFN1YmplY3Q6IFJlOiBSRkM6IGlteDhxbTogaW14LXNjdS1jbGs6IHBy
b2JlIG9mIGNsayBmYWlsZWQNCj4gDQo+IE9uIDI3LzAyLzIwLCBPbGl2ZXIgR3JhdXRlIHdyb3Rl
Og0KPiA+IEhlbGxvIEFpc2hlbmcsDQo+ID4gSGVsbG8gQW5zb24sDQo+ID4NCj4gPiBJIGdldCB0
aGUgZm9sbG93aW5nIGlteC1zY3UgZXJyb3JzIHdoZW4gdXNpbmcgTGludXggdmVyc2lvbg0KPiA+
IDUuNi4wLXJjMS1uZXh0LTIwMjAwMjE0IHdpdGggc2NmdyBCdWlsZCAzMzUzLCBDb21taXQgNDk0
Yzk3ZjMNCj4gPg0KPiA+IEl0IHNlZW1zIHRoYXQgaW1wb3J0YW50IGNsb2NrcyBhcmUgb2ZmIHNv
bWVob3cgYW5kIHRoYXQgbHBzcGkgaXNuJ3QNCj4gPiB3b3JraW5nIGJlY2F1c2Ugb2YgdGhhdC4g
V2hhdCBpcyB0aGUgYmVzdCB3YXkgdG8gZGVidWcgc3VjaCBpc3N1ZXM/DQo+ID4NCj4gPiBbICAg
IDEuMTAzNzk5XSBpbXgtc2N1IHNjdTogTlhQIGkuTVggU0NVIEluaXRpYWxpemVkDQo+ID4gWyAg
ICAxLjExMTM4M10gYTM1X2NsazogZmFpbGVkIHRvIGdldCBjbG9jayByYXRlIC0yMg0KPiANCj4g
QWZ0ZXIgc29tZSBkZWVwZXIgZGlnZ2luZyBJIHNhdyB0aGF0IHRoZSByZWFzb24gZm9yICJhMzVf
Y2xrOiBmYWlsZWQiIGlzIGFuDQo+IElNWF9TQ19FUlJfUEFSTSA9IDMuIEJlY2F1c2UgaGUgdHJ5
cyB0byBnZXQgdGhlIHJlc291cmNlIFNDX1JfQTM1IHdoaWNoDQo+IGlzIG9ubHkgYXZhaWxhYmxl
IG9uIGlteDhxeHAgYW5kIG5vdCBvbiBpbXg4cW0uIE5vIGNsdWUgd2h5IGhlIHRyeSB0aGF0DQo+
IGluc3RlYWQgb2YgU0NfUl9BNTMuDQoNCllvdSBhcmUgcnVubmluZyBvbiBpLk1YOFFNIGJvYXJk
LCByaWdodD8gSXMgaXQgYmVjYXVzZSB0aGUgQTM1L0E1My9BNzIgY2xvY2tzDQphcmUgcmVnaXN0
ZXJlZCBvbiBzYW1lIGNsb2NrIGRyaXZlciwgc28gdGhhdCBjbG9jayBjb3JlIHdpbGwgY2FsY3Vs
YXRlIHRoZWlyIHJhdGUgZHVyaW5nDQpjbG9jayB0cmVlIHNldHVwPyBCdXQgZXZlbiBBMzUgY2xv
Y2sgZ2V0IHJhdGUgZmFpbGVkIG9uIGkuTVg4UU0sIEkgZG9uJ3Qgc2VlIGl0IHdpbGwNCmltcGFj
dCBscHNwaS4NCg0KaS5NWDhRTSBpcyBhbHJlYWR5IHN1cHBvcnRlZCBvbiBvdXIgaW50ZXJuYWwg
djUuNCB0cmVlLCB0aGVyZSBhcmUgc29tZSBjaGFuZ2VzIGluIGNsay1zY3UuYywNCkkgcGFzdGVk
IHNvbWUgY29kZSBwaWVjZSBhcyBiZWxvdywgbWF5YmUgeW91IGNhbiBjb21wYXJlIHRoZSBkaWZm
ZXJlbmNlIGFuZCBoYXZlIGEgdHJ5Pw0KDQoyNzYgc3RhdGljIGludCBjbGtfc2N1X2F0Zl9zZXRf
Y3B1X3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwNCjI3NyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHBhcmVudF9yYXRl
KQ0KMjc4IHsNCjI3OSAgICAgICAgIHN0cnVjdCBjbGtfc2N1ICpjbGsgPSB0b19jbGtfc2N1KGh3
KTsNCjI4MCAgICAgICAgIHN0cnVjdCBhcm1fc21jY2NfcmVzIHJlczsNCjI4MSAgICAgICAgIHVu
c2lnbmVkIGxvbmcgY2x1c3Rlcl9pZDsNCjI4Mg0KMjgzICAgICAgICAgaWYgKGNsay0+cnNyY19p
ZCA9PSBJTVhfU0NfUl9BMzUgfHwgY2xrLT5yc3JjX2lkID09IElNWF9TQ19SX0E1MykNCjI4NCAg
ICAgICAgICAgICAgICAgY2x1c3Rlcl9pZCA9IDA7DQoyODUgICAgICAgICBlbHNlIGlmIChjbGst
PnJzcmNfaWQgPT0gSU1YX1NDX1JfQTcyKQ0KMjg2ICAgICAgICAgICAgICAgICBjbHVzdGVyX2lk
ID0gMTsNCjI4NyAgICAgICAgIGVsc2UNCjI4OCAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQoNCg0KNDcxICAgICAgICAgaW5pdC5uYW1lID0gbmFtZTsNCjQ3MiAgICAgICAgIGluaXQu
b3BzID0gJmNsa19zY3Vfb3BzOw0KNDczICAgICAgICAgaWYgKHJzcmNfaWQgPT0gSU1YX1NDX1Jf
QTM1IHx8IHJzcmNfaWQgPT0gSU1YX1NDX1JfQTUzIHx8IHJzcmNfaWQgPT0gSU1YX1NDX1JfQTcy
KQ0KNDc0ICAgICAgICAgICAgICAgICBpbml0Lm9wcyA9ICZjbGtfc2N1X2NwdV9vcHM7DQo0NzUg
ICAgICAgICBlbHNlIGlmIChyc3JjX2lkID09IElNWF9TQ19SX1BJXzBfUExMKQ0KNDc2ICAgICAg
ICAgICAgICAgICBpbml0Lm9wcyA9ICZjbGtfc2N1X3BpX29wczsNCjQ3NyAgICAgICAgIGVsc2UN
CjQ3OCAgICAgICAgICAgICAgICAgaW5pdC5vcHMgPSAmY2xrX3NjdV9vcHM7DQoNCg0KNjQ2IHN0
YXRpYyBpbnQgaW14X2Nsa19zY3VfYXR0YWNoX3BkKHN0cnVjdCBkZXZpY2UgKmRldiwgdTMyIHJz
cmNfaWQpDQo2NDcgew0KNjQ4ICAgICAgICAgc3RydWN0IG9mX3BoYW5kbGVfYXJncyBnZW5wZHNw
ZWMgPSB7DQo2NDkgICAgICAgICAgICAgICAgIC5ucCA9IHBkX25wLA0KNjUwICAgICAgICAgICAg
ICAgICAuYXJnc19jb3VudCA9IDEsDQo2NTEgICAgICAgICAgICAgICAgIC5hcmdzWzBdID0gcnNy
Y19pZCwNCjY1MiAgICAgICAgIH07DQo2NTMNCjY1NCAgICAgICAgIGlmICgocnNyY19pZCA9PSBJ
TVhfU0NfUl9BMzUpIHx8IChyc3JjX2lkID09IElNWF9TQ19SX0E1MykgfHwNCjY1NSAgICAgICAg
ICAgICAocnNyY19pZCA9PSBJTVhfU0NfUl9BNzIpKQ0KNjU2ICAgICAgICAgICAgICAgICByZXR1
cm4gMDsNCg0KDQpBbnNvbg0KDQo=
