Return-Path: <SRS0=7zwf=TF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D712C004C9
	for <linux-clk@archiver.kernel.org>; Sun,  5 May 2019 05:24:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D0A02082F
	for <linux-clk@archiver.kernel.org>; Sun,  5 May 2019 05:24:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="uI5PYLwf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbfEEFYo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 5 May 2019 01:24:44 -0400
Received: from mail-eopbgr70052.outbound.protection.outlook.com ([40.107.7.52]:61699
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726310AbfEEFYo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 5 May 2019 01:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aw2QTp/A37BNjEN006lvMxYIrCrRdhgxFZgx9eA1jjM=;
 b=uI5PYLwfEJAQVB0GjHl8JUjdmdavhQhgnayXrsbulQqGA8pxyTtpSdyhffsJIiN0ownZ0U6f11OnY49CRyB7wqCfpdVs1nUmpVNrzMfBbNErHd2DPljCPcrTh/AkK55eWDOjQB3A4nl5qq9CkTleTgQ1ZjSVUXbG4NxXs+iqxgY=
Received: from VI1PR0402MB3519.eurprd04.prod.outlook.com (52.134.4.24) by
 VI1PR0402MB2800.eurprd04.prod.outlook.com (10.172.255.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Sun, 5 May 2019 05:24:39 +0000
Received: from VI1PR0402MB3519.eurprd04.prod.outlook.com
 ([fe80::f830:3f53:72c1:b14f]) by VI1PR0402MB3519.eurprd04.prod.outlook.com
 ([fe80::f830:3f53:72c1:b14f%3]) with mapi id 15.20.1856.012; Sun, 5 May 2019
 05:24:39 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: [PATCH] clk: imx: keep the mmdc p1 ipg clock always on on
 6sx/ul/ull/sll
Thread-Topic: [PATCH] clk: imx: keep the mmdc p1 ipg clock always on on
 6sx/ul/ull/sll
Thread-Index: AQHVAwLVvUz2mQfvrEuvkoMSG1+V0A==
Date:   Sun, 5 May 2019 05:24:38 +0000
Message-ID: <20190505052927.7313-1-ping.bai@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HK2PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:202:2::20) To VI1PR0402MB3519.eurprd04.prod.outlook.com
 (2603:10a6:803:8::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ping.bai@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72e675ec-0e4c-41df-d42f-08d6d119f829
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR0402MB2800;
x-ms-traffictypediagnostic: VI1PR0402MB2800:
x-microsoft-antispam-prvs: <VI1PR0402MB2800DCB47F6B057FE4E831AE87370@VI1PR0402MB2800.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 00286C0CA6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(396003)(136003)(366004)(376002)(346002)(189003)(199004)(36756003)(5660300002)(316002)(71190400001)(6116002)(3846002)(71200400001)(478600001)(14454004)(256004)(2906002)(68736007)(6486002)(2501003)(7736002)(1076003)(305945005)(86362001)(8676002)(6436002)(486006)(186003)(2616005)(52116002)(99286004)(8936002)(102836004)(66066001)(66946007)(26005)(66476007)(73956011)(66556008)(64756008)(66446008)(6512007)(50226002)(81156014)(2201001)(81166006)(53936002)(386003)(476003)(110136005)(54906003)(25786009)(4326008)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB2800;H:VI1PR0402MB3519.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yfiOH3b74hUehe9VeUzdWhOJRkHMTJQWATsm4jqbsYGFHc8urWky/k+VbcYNGcAz5ZP5jcO8KXM1uD6cGEOaD3REMQu6/h+qAZB7x8Ab+RIE1wh7QKiirwZ1u6/al2ZN4vOM5rmQdBnVN46x45Ut7L/8V6mGwrKTAz4ZhDwH9OteeMOYHsW/Ip7HbfZsXFME3I0uhi/txJniMtOQorwMzYeqVnRglNW5nHpn4c34N0P0XqEGYIgwAApyxhA8z3DE/zTFKKfGqrkkbbmVNZziTjB4rMHmKmos5Jl1G/i/sBRQicfC4wD+4NBhd26Q60PXH+ESc5LPWTiVxr17J2ZgfUUtt3Cn/LWAMTHbN3YWHMzjmbWOtdDWepq2Z6c5I6INUtc04y7rQR76fUbI0yItd7ByCsyiMLHDKL7rAbmvEgE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e675ec-0e4c-41df-d42f-08d6d119f829
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2019 05:24:38.9884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

VGhlIE1NRENfUDFfSVBHIGNsb2NrIG5lZWQgdG8gYmUgb24gYWx3YXlzIG9uIHRvIG1ha2Ugc3Vy
ZQ0KdGhlIE1NREMgcmVnaXN0ZXIgY2FuIGJlIGFjY2Vzc2VkIHN1Y2Nlc3NmdWxseS4NCg0KU2ln
bmVkLW9mZi1ieTogSmFja3kgQmFpIDxwaW5nLmJhaUBueHAuY29tPg0KLS0tDQogZHJpdmVycy9j
bGsvaW14L2Nsay1pbXg2c2xsLmMgfCAyICstDQogZHJpdmVycy9jbGsvaW14L2Nsay1pbXg2c3gu
YyAgfCAyICstDQogZHJpdmVycy9jbGsvaW14L2Nsay1pbXg2dWwuYyAgfCAyICstDQogMyBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2Nsay9pbXgvY2xrLWlteDZzbGwuYyBiL2RyaXZlcnMvY2xrL2lteC9jbGstaW14
NnNsbC5jDQppbmRleCA3ZWVhNDQ4Y2I5YTkuLjRkOTFlNDhlNTkxOCAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvY2xrL2lteC9jbGstaW14NnNsbC5jDQorKysgYi9kcml2ZXJzL2Nsay9pbXgvY2xrLWlt
eDZzbGwuYw0KQEAgLTMwNyw3ICszMDcsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaW14NnNsbF9j
bG9ja3NfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKmNjbV9ub2RlKQ0KIAljbGtzW0lNWDZTTExf
Q0xLX1dET0cxXQkJPSBpbXhfY2xrX2dhdGUyKCJ3ZG9nMSIsCSJpcGciLAkJYmFzZSArIDB4NzQs
IDE2KTsNCiAJY2xrc1tJTVg2U0xMX0NMS19NTURDX1AwX0ZBU1RdCT0gaW14X2Nsa19nYXRlX2Zs
YWdzKCJtbWRjX3AwX2Zhc3QiLCAibW1kY19wb2RmIiwgIGJhc2UgKyAweDc0LAkyMCwgQ0xLX0lT
X0NSSVRJQ0FMKTsNCiAJY2xrc1tJTVg2U0xMX0NMS19NTURDX1AwX0lQR10JPSBpbXhfY2xrX2dh
dGUyX2ZsYWdzKCJtbWRjX3AwX2lwZyIsICJpcGciLAkgICBiYXNlICsgMHg3NCwJMjQsIENMS19J
U19DUklUSUNBTCk7DQotCWNsa3NbSU1YNlNMTF9DTEtfTU1EQ19QMV9JUEddCT0gaW14X2Nsa19n
YXRlMigibW1kY19wMV9pcGciLCAiaXBnIiwJICAgYmFzZSArIDB4NzQsCTI2KTsNCisJY2xrc1tJ
TVg2U0xMX0NMS19NTURDX1AxX0lQR10JPSBpbXhfY2xrX2dhdGUyX2ZsYWdzKCJtbWRjX3AxX2lw
ZyIsICJpcGciLAkgICBiYXNlICsgMHg3NCwJMjYsIENMS19JU19DUklUSUNBTCk7DQogCWNsa3Nb
SU1YNlNMTF9DTEtfT0NSQU1dCQk9IGlteF9jbGtfZ2F0ZV9mbGFncygib2NyYW0iLCJhaGIiLAkJ
ICAgYmFzZSArIDB4NzQsCTI4LCBDTEtfSVNfQ1JJVElDQUwpOw0KIA0KIAkvKiBDQ0dSNCAqLw0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2lteC9jbGstaW14NnN4LmMgYi9kcml2ZXJzL2Nsay9p
bXgvY2xrLWlteDZzeC5jDQppbmRleCA5MTU1OGIwOWJmOWUuLjg2ZjMwNTNjMzdmNiAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvY2xrL2lteC9jbGstaW14NnN4LmMNCisrKyBiL2RyaXZlcnMvY2xrL2lt
eC9jbGstaW14NnN4LmMNCkBAIC00MzIsNyArNDMyLDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGlt
eDZzeF9jbG9ja3NfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKmNjbV9ub2RlKQ0KIAljbGtzW0lN
WDZTWF9DTEtfTUxCXSAgICAgICAgICA9IGlteF9jbGtfZ2F0ZTIoIm1sYiIsICAgICAgICAgICAi
YWhiIiwgICAgICAgICAgICAgICBiYXNlICsgMHg3NCwgMTgpOw0KIAljbGtzW0lNWDZTWF9DTEtf
TU1EQ19QMF9GQVNUXSA9IGlteF9jbGtfZ2F0ZTJfZmxhZ3MoIm1tZGNfcDBfZmFzdCIsICJtbWRj
X3BvZGYiLCBiYXNlICsgMHg3NCwgMjAsIENMS19JU19DUklUSUNBTCk7DQogCWNsa3NbSU1YNlNY
X0NMS19NTURDX1AwX0lQR10gID0gaW14X2Nsa19nYXRlMl9mbGFncygibW1kY19wMF9pcGciLCAi
aXBnIiwgYmFzZSArIDB4NzQsIDI0LCBDTEtfSVNfQ1JJVElDQUwpOw0KLQljbGtzW0lNWDZTWF9D
TEtfTU1EQ19QMV9JUEddICA9IGlteF9jbGtfZ2F0ZTIoIm1tZGNfcDFfaXBnIiwgImlwZyIsIGJh
c2UgKyAweDc0LCAyNik7DQorCWNsa3NbSU1YNlNYX0NMS19NTURDX1AxX0lQR10gID0gaW14X2Ns
a19nYXRlMl9mbGFncygibW1kY19wMV9pcGciLCAiaXBnIiwgYmFzZSArIDB4NzQsIDI2LCBDTEtf
SVNfQ1JJVElDQUwpOw0KIAljbGtzW0lNWDZTWF9DTEtfT0NSQU1dICAgICAgICA9IGlteF9jbGtf
Z2F0ZTJfZmxhZ3MoIm9jcmFtIiwgIm9jcmFtX3BvZGYiLCBiYXNlICsgMHg3NCwgMjgsIENMS19J
U19DUklUSUNBTCk7DQogDQogCS8qIENDR1I0ICovDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsv
aW14L2Nsay1pbXg2dWwuYyBiL2RyaXZlcnMvY2xrL2lteC9jbGstaW14NnVsLmMNCmluZGV4IGZk
NjBkMTU0OWY3MS4uMzUzNzdjNmI1MGI4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9jbGsvaW14L2Ns
ay1pbXg2dWwuYw0KKysrIGIvZHJpdmVycy9jbGsvaW14L2Nsay1pbXg2dWwuYw0KQEAgLTQwOCw3
ICs0MDgsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaW14NnVsX2Nsb2Nrc19pbml0KHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqY2NtX25vZGUpDQogCWNsa3NbSU1YNlVMX0NMS19XRE9HMV0JCT0gaW14X2Ns
a19nYXRlMigid2RvZzEiLAkiaXBnIiwJCWJhc2UgKyAweDc0LAkxNik7DQogCWNsa3NbSU1YNlVM
X0NMS19NTURDX1AwX0ZBU1RdCT0gaW14X2Nsa19nYXRlX2ZsYWdzKCJtbWRjX3AwX2Zhc3QiLCAi
bW1kY19wb2RmIiwgYmFzZSArIDB4NzQsCTIwLCBDTEtfSVNfQ1JJVElDQUwpOw0KIAljbGtzW0lN
WDZVTF9DTEtfTU1EQ19QMF9JUEddCT0gaW14X2Nsa19nYXRlMl9mbGFncygibW1kY19wMF9pcGci
LAkiaXBnIiwJCWJhc2UgKyAweDc0LAkyNCwgQ0xLX0lTX0NSSVRJQ0FMKTsNCi0JY2xrc1tJTVg2
VUxfQ0xLX01NRENfUDFfSVBHXQk9IGlteF9jbGtfZ2F0ZTIoIm1tZGNfcDFfaXBnIiwJImlwZyIs
CQliYXNlICsgMHg3NCwJMjYpOw0KKwljbGtzW0lNWDZVTF9DTEtfTU1EQ19QMV9JUEddCT0gaW14
X2Nsa19nYXRlMl9mbGFncygibW1kY19wMV9pcGciLAkiaXBnIiwJCWJhc2UgKyAweDc0LAkyNiwg
Q0xLX0lTX0NSSVRJQ0FMKTsNCiAJY2xrc1tJTVg2VUxfQ0xLX0FYSV0JCT0gaW14X2Nsa19nYXRl
X2ZsYWdzKCJheGkiLAkiYXhpX3BvZGYiLAliYXNlICsgMHg3NCwJMjgsIENMS19JU19DUklUSUNB
TCk7DQogDQogCS8qIENDR1I0ICovDQotLSANCjIuMjEuMA0KDQo=
